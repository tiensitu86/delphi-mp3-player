unit SelectAlbum;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZDataset, Grids, DBGrids, StdCtrls;

type
  TfrmGetAlbum = class(TForm)
    Query1: TZReadOnlyQuery;
    Query1name: TStringField;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    Query1year: TIntegerField;
  end;

function GetAlbum(Artist: String; var Album, Year: String): Boolean;

var
  frmGetAlbum: TfrmGetAlbum;

implementation

uses Main;

{$R *.dfm}

function GetAlbum(Artist: String; var Album, Year: String): Boolean;
var
  F: TfrmGetAlbum;
begin
  Result := False;
  F := TfrmGetAlbum.Create(Application);
  with F do begin
    Query1.ParamByName('artist_name').Value := Artist;
    Query1.Open;
    try
      if ShowModal = mrOk then begin
        Album := Query1name.Value;
        Year := Query1year.AsString;
        Result := True;
      end;
    finally
      Free;
    end;
  end;
end;

end.
