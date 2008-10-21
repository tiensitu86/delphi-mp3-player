unit Update;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZDataset, StdCtrls, DBClient, Grids, DBGrids,
  ComCtrls;

type
  TfrmUpdate = class(TForm)
    Button1: TButton;
    qryFolders: TZReadOnlyQuery;
    qryFoldersid: TIntegerField;
    qryFolderspath: TStringField;
    qryFoldersrecursive: TBooleanField;
    Memo1: TMemo;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1File: TStringField;
    DBGrid1: TDBGrid;
    ClientDataSet1Artist: TStringField;
    ClientDataSet1Album: TStringField;
    ClientDataSet1Year: TIntegerField;
    ClientDataSet1Track: TIntegerField;
    DataSource1: TDataSource;
    Label1: TLabel;
    ClientDataSet1Title: TStringField;
    ProgressBar1: TProgressBar;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FileList: TStrings;
    procedure ProcessFiles;
    procedure AppendFileToAdd(FilePath: String);
  end;

var
  frmUpdate: TfrmUpdate;

implementation

uses FileSearch, Main, MP3Utils;

{$R *.dfm}

procedure TfrmUpdate.FormCreate(Sender: TObject);
begin
  qryFolders.Active := True;
  FileList := TStringList.Create;
end;

procedure TfrmUpdate.FormDestroy(Sender: TObject);
begin
  FileList.Free;
end;

// Start update
procedure TfrmUpdate.Button1Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    FileList.Clear;
    Memo1.Clear;

    qryFolders.First;
    while not qryFolders.Eof do begin
      SearchFiles(qryFolderspath.Value, '*.mp3', qryFoldersrecursive.Value, FileList);
      qryFolders.Next;
    end;
    Memo1.Lines.Add(FormatFloat(',#', FileList.Count) + ' file(s)');
    ProcessFiles;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUpdate.AppendFileToAdd(FilePath: String);
var
  Title, Artist, Album, Year: String;
begin
  ClientDataSet1.Append;
  ClientDataSet1File.Value := FilePath;
  try
    if GetID3TagInformation(FilePath, Title, Artist, Album, Year) then begin
      ClientDataSet1Title.Value := Title;
      ClientDataSet1Artist.Value := Artist;
      ClientDataSet1Album.Value := Album;
      ClientDataSet1Year.AsString := Year;
    end;
  except
  end;
  ClientDataSet1.Post;
end;

procedure TfrmUpdate.ProcessFiles;
var
  I: Integer;
  FilePath: String;
begin
  Memo1.Lines.Add('Processing files...');
  ProgressBar1.Max := FileList.Count;

  // Check for new files
  for I := 0 to FileList.Count - 1 do begin
    FilePath := FileList[I];
    // If new file
    AppendFileToAdd(FilePath);
    ProgressBar1.StepIt;
  end;

  ClientDataSet1.First;
  Memo1.Lines.Add(FormatFloat(',#', ClientDataSet1.RecordCount) + ' new file(s)');

  // Check for deleted files
end;

end.
