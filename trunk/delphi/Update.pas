unit Update;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZDataset, StdCtrls, DBClient, Grids, DBGrids,
  ComCtrls, ZAbstractDataset, Menus, Provider;

type
  TfrmUpdate = class(TForm)
    Button1: TButton;
    qryOptions: TZReadOnlyQuery;
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
    qryOptionsid: TIntegerField;
    qryOptionsstart_path: TStringField;
    Label2: TLabel;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    PopupMenu1: TPopupMenu;
    S1: TMenuItem;
    rytogettitle1: TMenuItem;
    cdsFiles: TClientDataSet;
    dspFiles: TDataSetProvider;
    cdsFilespath: TStringField;
    Button2: TButton;
    qryFiles: TZReadOnlyQuery;
    ClientDataSet1ArtistOk: TBooleanField;
    qryFileUpd: TZQuery;
    dspFileUpd: TDataSetProvider;
    cdsFileUpd: TClientDataSet;
    qryFileUpdid: TIntegerField;
    qryFileUpdpath: TStringField;
    qryFileUpdtitle: TStringField;
    qryFileUpdid_artist: TIntegerField;
    qryFileUpdalbum: TStringField;
    qryFileUpdyear: TIntegerField;
    qryFileUpdtrack: TIntegerField;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure S1Click(Sender: TObject);
    procedure rytogettitle1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ClientDataSet1BeforePost(DataSet: TDataSet);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
  private
    FileList: TStrings;
    procedure ProcessFiles;
    procedure AppendFileToAdd(FilePath: String);
    procedure AddNewFiles;
  end;

var
  frmUpdate: TfrmUpdate;

implementation

uses
  FileSearch, Main, MP3Utils, MainDM, ArtistDM;

{$R *.dfm}

procedure TfrmUpdate.FormCreate(Sender: TObject);
begin
  UseArtistDM;
  qryOptions.Open;

  Edit1.Text := qryOptionsstart_path.Value;
  FileList := TStringList.Create;
  DBGrid1.Anchors := DBGrid1.Anchors + [akRight, akBottom];

  dmArtist.cdsArtists.First;
  while not dmArtist.cdsArtists.Eof do begin
    DBGrid1.Columns[2].PickList.Add(dmArtist.cdsArtistsname.Value);
    dmArtist.cdsArtists.Next;
  end;
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
    DataSource1.DataSet.DisableControls;

    cdsFiles.Open;
    FileList.Clear;
    Memo1.Clear;
    ClientDataSet1.EmptyDataSet;

    SearchFiles(Edit1.Text, '*.mp3', CheckBox1.Checked, FileList);
    Memo1.Lines.Add(FormatFloat(',#', FileList.Count) + ' file(s)');

    ProcessFiles;
  finally
    DataSource1.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
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
    if not cdsFiles.FindKey([FilePath]) then
      AppendFileToAdd(FilePath);
    ProgressBar1.StepIt;
  end;

  ClientDataSet1.First;
  Memo1.Lines.Add(FormatFloat(',#', ClientDataSet1.RecordCount) + ' new file(s) to add');

  // Check for deleted files

end;

// Add Files
procedure TfrmUpdate.Button2Click(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  try
    DataSource1.DataSet.DisableControls;
    Memo1.Lines.Add('Adding Files...');
    ProgressBar1.Max := ClientDataSet1.RecordCount;
    ProgressBar1.Position := 0;
    AddNewFiles;
  finally
    DataSource1.DataSet.EnableControls;
    Screen.Cursor := crDefault;
  end;
end;

procedure TfrmUpdate.AddNewFiles;
var
  id_artist: Integer;
begin
  qryFileUpd.Open;
  ClientDataSet1.First;
  while not ClientDataSet1.Eof do begin
    if Trim(ClientDataSet1Artist.Value) <> '' then
      id_artist := dmArtist.ArtistGetOrAdd(ClientDataSet1Artist.Value)
    else
      id_artist := 0;

    // not using cds, using query
    qryFileUpd.Append;
    qryFileUpdpath.Value := ClientDataSet1File.Value;
    qryFileUpdtitle.Value := ClientDataSet1Title.Value;
    if id_artist > 0 then
      qryFileUpdid_artist.Value := id_artist;
    qryFileUpdalbum.Value := ClientDataSet1Album.Value;
    if ClientDataSet1Year.Value > 0 then
      qryFileUpdyear.Value := ClientDataSet1Year.Value;
    qryFileUpdtrack.Value := ClientDataSet1Track.Value;
    qryFileUpd.Post;

    ClientDataSet1.Next;
    ProgressBar1.StepIt;
  end;
end;

procedure TfrmUpdate.AppendFileToAdd(FilePath: String);
var
  Title, Artist, Album, Year, Track: String;
begin
  ClientDataSet1.Append;
  ClientDataSet1File.Value := FilePath;
  try
    if GetID3TagInformation(FilePath, Title, Artist, Album, Year, Track) then begin
      ClientDataSet1Title.Value    := Title;
      ClientDataSet1Artist.Value   := Artist;
      ClientDataSet1Album.Value    := Album;
      try
        if StrToInt(Year) > 0 then
          ClientDataSet1Year.AsString  := Year;
      except
      end;
      ClientDataSet1Track.AsString := Track;
    end;
  except
  end;
  ClientDataSet1.Post;
end;

// Try to get title from file name
procedure TfrmUpdate.rytogettitle1Click(Sender: TObject);
var
  I, P, Ext: Integer;
  S: String;
begin
  if DBGrid1.SelectedRows.Count = 0 then
    Exit;

  DataSource1.DataSet.DisableControls;
  try
    Screen.Cursor := crHourGlass;
    for I := 0 to DBGrid1.SelectedRows.Count - 1 do begin
      ClientDataSet1.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[I]));
      S := ClientDataSet1File.Value;
      P := LastDelimiter('-', S);
      if P > 0 then begin
        Ext := LastDelimiter('.', S);
        if Ext = 0 then
          Ext := Length(S);
        S := Copy(S, P+1, Ext-P-1);
        ClientDataSet1.Edit;
        ClientDataSet1Title.Value := Trim(S);
        ClientDataSet1.Post;
      end;
    end;
    ClientDataSet1.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[0]));
  finally
    Screen.Cursor := crDefault;
    DataSource1.DataSet.EnableControls;
  end;
end;

// Same artist and album
procedure TfrmUpdate.S1Click(Sender: TObject);
var
  I: Integer;
  Artist, Album: String;
  Year: Integer;
begin
  if DBGrid1.SelectedRows.Count = 0 then
    Exit;

  DataSource1.DataSet.DisableControls;
  try
    Screen.Cursor := crHourGlass;
    ClientDataSet1.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[0]));
    Artist := ClientDataSet1Artist.Value;
    Album := ClientDataSet1Album.Value;
    Year := ClientDataSet1Year.Value;
    for I := 1 to DBGrid1.SelectedRows.Count - 1 do begin
      ClientDataSet1.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[I]));
      ClientDataSet1.Edit;
      ClientDataSet1Artist.Value := Artist;
      ClientDataSet1Album.Value := Album;
      if Year > 0 then
        ClientDataSet1Year.Value := Year;
      ClientDataSet1.Post;
    end;
    ClientDataSet1.GotoBookmark(pointer(DBGrid1.SelectedRows.Items[0]));
  finally
    Screen.Cursor := crDefault;
    DataSource1.DataSet.EnableControls;
  end;
end;

procedure TfrmUpdate.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if not (gdFocused in State) then
    if (DataCol = 2) and (not ClientDataSet1ArtistOk.Value) then
      DBGrid1.Canvas.Font.Color := clRed;
  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TfrmUpdate.ClientDataSet1BeforePost(DataSet: TDataSet);
begin
  ClientDataSet1ArtistOk.Value := dmArtist.ArtistExists(ClientDataSet1Artist.Value);
end;

end.
