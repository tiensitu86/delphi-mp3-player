unit SelectFiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, DB, DBClient, StdCtrls, Grids, DBGrids, ZAbstractRODataset,
  ZDataset;

type
  TfrmSelectFile = class(TForm)
    dsArtists: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    qryAlbums: TZReadOnlyQuery;
    dsAlbums: TDataSource;
    qryAlbumsid: TIntegerField;
    qryAlbumsalbum: TStringField;
    qryAlbumsyear: TIntegerField;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    qrySongs: TZReadOnlyQuery;
    dsSongs: TDataSource;
    qrySongstitle: TStringField;
    qrySongstrack: TIntegerField;
    qrySongsalbum: TStringField;
    qrySongsid_artist: TIntegerField;
    qrySongsid: TIntegerField;
    qrySongspath: TStringField;
    qryArtists: TZReadOnlyQuery;
    DBLookupListBox1: TDBLookupListBox;
    qryArtistsid: TIntegerField;
    qryArtistsname: TStringField;
    Edit1: TEdit;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DBLookupListBox1Click(Sender: TObject);
    procedure qryAlbumsBeforeOpen(DataSet: TDataSet);
  end;

var
  frmSelectFile: TfrmSelectFile;

implementation

uses FileSearch, Main;

{$R *.dfm}

procedure TfrmSelectFile.DBGrid2DblClick(Sender: TObject);
begin
  frmMain.AddFile(qrySongspath.Value,
    qryArtistsname.Value + ' - ' + qrySongstitle.Value, qrySongsid.AsString);
end;

procedure TfrmSelectFile.DBLookupListBox1Click(Sender: TObject);
begin
  qryAlbums.Close;
  qryAlbums.Open;
end;

procedure TfrmSelectFile.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin
    qryArtists.SQL[2] := '''%' + Trim(Edit1.Text) + '%''';
    qryArtists.Open;
  end;
end;

procedure TfrmSelectFile.FormCreate(Sender: TObject);
begin
  qryArtists.Open;
  DBLookupListBox1.KeyValue := qryArtistsid.Value;
  qryAlbums.Open;
  qrySongs.Open;
  DBGrid1.Anchors := DBGrid1.Anchors + [akBottom];
  DBGrid2.Anchors := DBGrid2.Anchors + [akRight, akBottom];
end;

procedure TfrmSelectFile.qryAlbumsBeforeOpen(DataSet: TDataSet);
begin
  qryAlbums.ParamByName('id_artist').Value := DBLookupListBox1.KeyValue;
end;

end.
