unit Folders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids;

type
  TfrmFolders = class(TForm)
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    ZQuery1id: TIntegerField;
    ZQuery1path: TStringField;
    ZQuery1recursive: TBooleanField;
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFolders: TfrmFolders;

implementation

uses Main;

{$R *.dfm}

procedure TfrmFolders.FormCreate(Sender: TObject);
begin
  ZQuery1.Open;
end;

procedure TfrmFolders.FormDeactivate(Sender: TObject);
begin
  if ZQuery1.State = dsEdit then begin
    ZQuery1.Post;
  end else if ZQuery1.State = dsInsert then begin
    if (not ZQuery1path.IsNull) and (not ZQuery1recursive.IsNull) then
      ZQuery1.Post;
  end;
end;

end.
