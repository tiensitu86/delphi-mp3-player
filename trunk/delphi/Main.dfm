object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Delphi MP3 Player'
  ClientHeight = 291
  ClientWidth = 285
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  DesignSize = (
    285
    291)
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 232
    Top = 0
    Width = 54
    Height = 20
    Anchors = [akTop, akRight]
    Caption = 'Add Files'
    OnClick = SpeedButton1Click
    ExplicitLeft = 227
  end
  object ListBox1: TListBox
    Left = 0
    Top = 19
    Width = 286
    Height = 257
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 1
    OnDblClick = ListBox1DblClick
  end
  object MediaPlayer1: TMediaPlayer
    Left = 40
    Top = 140
    Width = 85
    Height = 20
    ColoredButtons = [btNext, btPrev, btStep, btBack, btRecord, btEject]
    VisibleButtons = [btPlay, btPause, btStop]
    Visible = False
    TabOrder = 0
    OnNotify = MediaPlayer1Notify
  end
  object TrackBar1: TTrackBar
    Left = 86
    Top = -1
    Width = 142
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 2
    TickStyle = tsNone
  end
  object MainMenu1: TMainMenu
    Left = 48
    Top = 52
    object File1: TMenuItem
      Caption = 'File'
      object UpdateFolders1: TMenuItem
        Caption = 'Update database...'
        OnClick = UpdateFolders1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Options1: TMenuItem
        Caption = 'Options...'
        OnClick = Options1Click
      end
    end
  end
  object ZConnection1: TZConnection
    Protocol = 'sqlite-3'
    Database = 'C:\temp\01-Exe\DelphiMP3Player\mp3.db'
    BeforeConnect = ZConnection1BeforeConnect
    Left = 124
    Top = 52
  end
  object OpenDialog1: TOpenDialog
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofEnableSizing]
    Left = 188
    Top = 140
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 188
    Top = 196
  end
end
