program DelphiMP3Player;

uses
  Forms,
  Main in 'Main.pas' {frmMain},
  Update in 'Update.pas' {frmUpdate},
  FileSearch in 'FileSearch.pas',
  MP3Utils in 'MP3Utils.pas',
  ID3v2 in 'ID3v2.pas',
  Options in 'Options.pas' {frmOptions},
  MainDM in 'MainDM.pas' {dmMain: TDataModule},
  ArtistDM in 'ArtistDM.pas' {dmArtist: TDataModule},
  SelectFiles in 'SelectFiles.pas' {frmSelectFile};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmMain, dmMain);
  Application.CreateForm(TfrmUpdate, frmUpdate);
  Application.CreateForm(TfrmOptions, frmOptions);
  Application.CreateForm(TfrmSelectFile, frmSelectFile);
  Application.Run;
end.
