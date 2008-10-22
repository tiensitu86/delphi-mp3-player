unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ZConnection, MPlayer, StdCtrls, Buttons, ComCtrls, ExtCtrls;

type
  TfrmMain = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Options1: TMenuItem;
    ZConnection1: TZConnection;
    UpdateFolders1: TMenuItem;
    MediaPlayer1: TMediaPlayer;
    ListBox1: TListBox;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    TrackBar1: TTrackBar;
    Timer1: TTimer;
    N1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure UpdateFolders1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ListBox1DblClick(Sender: TObject);
    procedure MediaPlayer1Notify(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure ZConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses Update, Options;

{$R *.dfm}

procedure TfrmMain.Options1Click(Sender: TObject);
begin
  frmOptions.Show;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Top := 0;
  Left := 0;
  ZConnection1.Connected := True;
end;

procedure TfrmMain.ZConnection1BeforeConnect(Sender: TObject);
begin
  ZConnection1.Database := ExtractFilePath(Application.ExeName) + 'mp3.db';
end;

procedure TfrmMain.ListBox1DblClick(Sender: TObject);
begin
  Timer1.Enabled := False;
  MediaPlayer1.Close;
  MediaPlayer1.FileName := ListBox1.Items[ListBox1.ItemIndex];
  MediaPlayer1.Open;
  TrackBar1.Max := MediaPlayer1.Length;
  TrackBar1.Position := 0;
  MediaPlayer1.Play;
  Timer1.Enabled := True;
end;

procedure TfrmMain.MediaPlayer1Notify(Sender: TObject);
begin
  case MediaPlayer1.NotifyValue of
    nvSuccessful: begin
      Timer1.Enabled := False;
      TrackBar1.Max := 0;
      if ListBox1.ItemIndex < ListBox1.Count - 1 then begin
        ListBox1.ItemIndex := ListBox1.ItemIndex + 1;
        ListBox1DblClick(nil);
      end;
    end;
    nvSuperseded: begin
      Timer1.Enabled := False;
      TrackBar1.Max := 0;
    end;
    nvAborted: begin
      Timer1.Enabled := False;
      TrackBar1.Max := 0;
    end;
    nvFailure: begin
      Timer1.Enabled := False;
      TrackBar1.Max := 0;
    end;
  end;
end;

procedure TfrmMain.SpeedButton1Click(Sender: TObject);
var
  I: Integer;
begin
  if OpenDialog1.Execute then begin
    for I := 0 to OpenDialog1.Files.Count - 1 do begin
      ListBox1.Items.Add(OpenDialog1.Files[I]);
    end;
  end;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
begin
  if TrackBar1.Max > 0 then
    TrackBar1.Position := MediaPlayer1.Position;
end;

procedure TfrmMain.UpdateFolders1Click(Sender: TObject);
begin
  frmUpdate.Show;
end;

end.
