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
  OnClose = FormClose
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
    OnKeyDown = ListBox1KeyDown
  end
  object MediaPlayer1: TMediaPlayer
    Left = 40
    Top = 124
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
  object ListBox2: TListBox
    Left = 4
    Top = 150
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object ListBox3: TListBox
    Left = 16
    Top = 166
    Width = 121
    Height = 97
    ItemHeight = 13
    TabOrder = 4
    Visible = False
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
    Connected = True
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
  object qryDel: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'delete from file_playlist where id_playlist = 1')
    Params = <>
    Left = 196
    Top = 28
  end
  object qryIns: TZQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select id_file, id_playlist, ord '
      'from file_playlist'
      'where id_playlist = 0')
    Params = <>
    Left = 196
    Top = 80
    object qryInsid_file: TIntegerField
      FieldName = 'id_file'
    end
    object qryInsid_playlist: TIntegerField
      FieldName = 'id_playlist'
    end
    object qryInsord: TIntegerField
      FieldName = 'ord'
    end
  end
  object qryIni: TZReadOnlyQuery
    Connection = ZConnection1
    SQL.Strings = (
      'select'
      '  f.path, f.title, f.id,'
      '  a.name as artist'
      'from'
      '  file f'
      '  join file_playlist fp on fp.id_file = f.id'
      '  join artist a on a.id = f.id_artist'
      'where'
      '  fp.id_playlist = 1'
      'order by'
      '  fp.ord')
    Params = <>
    Left = 240
    Top = 28
    object qryInipath: TStringField
      FieldName = 'path'
      Size = 400
    end
    object qryInititle: TStringField
      FieldName = 'title'
      Size = 50
    end
    object qryIniid: TIntegerField
      FieldName = 'id'
    end
    object qryIniartist: TStringField
      FieldName = 'artist'
      ReadOnly = True
      Size = 50
    end
  end
end
