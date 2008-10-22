unit Options;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset, Grids, DBGrids,
  StdCtrls, Mask, DBCtrls;

type
  TfrmOptions = class(TForm)
    ZQuery1: TZQuery;
    DataSource1: TDataSource;
    Label1: TLabel;
    ZQuery1id: TIntegerField;
    ZQuery1start_path: TStringField;
    DBEdit1: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOptions: TfrmOptions;

implementation

uses Main;

{$R *.dfm}

procedure TfrmOptions.FormCreate(Sender: TObject);
begin
  DBEdit1.Anchors := DBEdit1.Anchors + [akRight];
  ZQuery1.Open;
  if ZQuery1.IsEmpty then
    ZQuery1.Append;
end;

procedure TfrmOptions.FormDeactivate(Sender: TObject);
begin
  if (ZQuery1.State in [dsEdit, dsInsert]) then
    ZQuery1.Post;
end;

end.
