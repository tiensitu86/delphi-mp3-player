program DelphiMP3Player;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Update in 'Update.pas' {frmUpdate},
  FileSearch in 'FileSearch.pas',
  MP3Utils in 'MP3Utils.pas',
  ID3v2 in 'ID3v2.pas',
  Options in 'Options.pas' {frmOptions},
  SelectAlbum in 'SelectAlbum.pas' {frmGetAlbum};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmUpdate, frmUpdate);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.Run;
end.
