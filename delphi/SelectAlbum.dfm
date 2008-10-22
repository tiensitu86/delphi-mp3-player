object frmGetAlbum: TfrmGetAlbum
  Left = 0
  Top = 0
  Caption = 'Get Album'
  ClientHeight = 251
  ClientWidth = 365
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 60
    Height = 13
    Caption = 'Select album'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 24
    Width = 349
    Height = 184
    DataSource = DataSource1
    Options = [dgColumnResize, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'name'
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 214
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Button2: TButton
    Left = 89
    Top = 214
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object Query1: TZReadOnlyQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select'
      '  album.name, album.year'
      'from'
      '  album join artist on album.id_artist = artist.id'
      'where'
      '  artist.name = :artist_name'
      'order by'
      '  album.name')
    Params = <
      item
        DataType = ftString
        Name = 'artist_name'
        ParamType = ptInput
        Value = 'Pretenders'
      end>
    Left = 184
    Top = 48
    ParamData = <
      item
        DataType = ftString
        Name = 'artist_name'
        ParamType = ptInput
        Value = 'Pretenders'
      end>
    object Query1name: TStringField
      FieldName = 'name'
      Size = 50
    end
    object Query1year: TIntegerField
      FieldName = 'year'
    end
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 184
    Top = 96
  end
end
