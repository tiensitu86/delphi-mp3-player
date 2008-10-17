unit Update;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZDataset, StdCtrls;

type
  TfrmUpdate = class(TForm)
    Button1: TButton;
    qryFolders: TZReadOnlyQuery;
    qryFoldersid: TIntegerField;
    qryFolderspath: TStringField;
    qryFoldersrecursive: TBooleanField;
    Memo1: TMemo;
    ListBox1: TListBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FileList: TStrings;
  end;

var
  frmUpdate: TfrmUpdate;

implementation

uses FileSearch, Main;

{$R *.dfm}

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
    Memo1.Lines.Add(FormatFloat(',#', FileList.Count) + ' arquivo(s) lidos');
    ListBox1.Items.Text := FileList.Text;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUpdate.FormCreate(Sender: TObject);
begin
  qryFolders.Active := True;
  FileList := TStringList.Create;
end;

procedure TfrmUpdate.FormDestroy(Sender: TObject);
begin
  FileList.Free;
end;

end.
