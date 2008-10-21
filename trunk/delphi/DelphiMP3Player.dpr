program DelphiMP3Player;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Folders in 'Folders.pas' {frmFolders},
  Update in 'Update.pas' {frmUpdate},
  FileSearch in 'FileSearch.pas',
  MP3Utils in 'MP3Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmFolders, frmFolders);
  Application.CreateForm(TfrmUpdate, frmUpdate);
  Application.Run;
end.
