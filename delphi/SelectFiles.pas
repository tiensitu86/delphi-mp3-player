unit SelectFiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, DB, DBClient, StdCtrls, Grids, DBGrids, ZAbstractRODataset,
  ZDataset;

type
  TfrmSelectFile = class(TForm)
    DBLookupComboBox1: TDBLookupComboBox;
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
    procedure FormCreate(Sender: TObject);
    procedure DBGrid2DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSelectFile: TfrmSelectFile;

implementation

uses ArtistDM, FileSearch, Main;

{$R *.dfm}

procedure TfrmSelectFile.DBGrid2DblClick(Sender: TObject);
begin
  frmMain.AddFile(qrySongspath.Value,
    DBLookupComboBox1.Text + ' - ' + qrySongstitle.Value, qrySongsid.AsString);
end;

procedure TfrmSelectFile.FormCreate(Sender: TObject);
begin
  UseArtistDM;
  qryAlbums.Open;
  qrySongs.Open;
  DBLookupComboBox1.KeyValue := dmArtist.cdsArtistsid.Value;
  DBGrid1.Anchors := DBGrid1.Anchors + [akBottom];
  DBGrid2.Anchors := DBGrid2.Anchors + [akRight, akBottom];
end;

end.
