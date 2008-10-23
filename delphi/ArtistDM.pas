unit ArtistDM;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, Forms;

type
  TdmArtist = class(TDataModule)
    qryArtists: TZQuery;
    dspArtists: TDataSetProvider;
    cdsArtists: TClientDataSet;
    cdsArtistsid: TIntegerField;
    cdsArtistsname: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    FReferenceCount: Integer;
  public
    function ArtistExists(Name: String): Boolean;
    function ArtistAdd(Name: String): Integer;
    function ArtistGetOrAdd(Name: String): Integer;
  end;

var
  dmArtist: TdmArtist;

procedure UseArtistDM;
procedure FreeArtistDM;

implementation

uses Main, MainDM;

{$R *.dfm}

procedure UseArtistDM;
begin
  if dmArtist = nil then begin
    dmArtist := TdmArtist.Create(Application);
  end else begin
    Inc(dmArtist.FReferenceCount);
  end;
end;

procedure FreeArtistDM;
begin
  if dmArtist <> nil then begin
    Dec(dmArtist.FReferenceCount);
    if dmArtist.FReferenceCount = 0 then begin
      dmArtist.Free;
      dmArtist := nil;
    end;
  end;
end;

procedure TdmArtist.DataModuleCreate(Sender: TObject);
begin
  FReferenceCount := 1;
  cdsArtists.Open;
end;

function TdmArtist.ArtistExists(Name: String): Boolean;
begin
  Result := cdsArtists.FindKey([Name]);
end;

function TdmArtist.ArtistAdd(Name: String): Integer;
begin
  cdsArtists.Append;
  cdsArtistsname.Value := Name;
  cdsArtists.Post;
  cdsArtists.ApplyUpdates(0);
  cdsArtists.Refresh;
  Result := cdsArtistsid.Value;
end;

function TdmArtist.ArtistGetOrAdd(Name: String): Integer;
begin
  if cdsArtists.FindKey([Name]) then
    Result := cdsArtistsid.Value
  else
    Result := ArtistAdd(Name);
end;

end.
