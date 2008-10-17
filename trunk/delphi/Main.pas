unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ZConnection;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Folders1: TMenuItem;
    ZConnection1: TZConnection;
    UpdateFolders1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Folders1Click(Sender: TObject);
    procedure UpdateFolders1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Folders, Update;

{$R *.dfm}

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Top := 0;
  Left := 0;
  ZConnection1.Database := ExtractFilePath(Application.ExeName) + 'mp3.db';
  ZConnection1.Connected := True;
end;

procedure TfrmMain.Folders1Click(Sender: TObject);
begin
  frmFolders.Show;
end;

procedure TfrmMain.UpdateFolders1Click(Sender: TObject);
begin
  frmUpdate.Show;
end;

end.
