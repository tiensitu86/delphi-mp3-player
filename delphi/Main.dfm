object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Delphi MP3 Player'
  ClientHeight = 319
  ClientWidth = 294
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 48
    Top = 52
    object File1: TMenuItem
      Caption = 'File'
      object Folders1: TMenuItem
        Caption = 'Folders...'
        OnClick = Folders1Click
      end
      object UpdateFolders1: TMenuItem
        Caption = 'Update database...'
        OnClick = UpdateFolders1Click
      end
    end
  end
  object ZConnection1: TZConnection
    Protocol = 'sqlite-3'
    Database = 'C:\temp\01-Exe\DelphiMP3Player\mp3.db'
    Left = 124
    Top = 52
  end
end
