unit MainDM;

interface

uses
  SysUtils, Classes, DB, DBClient, Provider, ZAbstractRODataset,
  ZAbstractDataset, ZDataset;

type
  TdmMain = class(TDataModule)
    qryLastInsertRowid: TZReadOnlyQuery;
    qryLastInsertRowidlast_insert_rowid: TStringField;
  public
    function GetLastInsertRowid: Integer;
  end;

var
  dmMain: TdmMain;

implementation

uses Main;

{$R *.dfm}

{ TdmMain }

function TdmMain.GetLastInsertRowid: Integer;
begin
  qryLastInsertRowid.Open;
  try
    Result := qryLastInsertRowidlast_insert_rowid.AsInteger;
  finally
    qryLastInsertRowid.Close;
  end;
end;

end.
