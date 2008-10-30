object frmSelectFile: TfrmSelectFile
  Left = 0
  Top = 0
  Caption = 'Select Files'
  ClientHeight = 388
  ClientWidth = 572
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 13
    Width = 49
    Height = 13
    Caption = 'Artists like'
  end
  object Label2: TLabel
    Left = 12
    Top = 188
    Width = 34
    Height = 13
    Caption = 'Albums'
  end
  object Label3: TLabel
    Left = 240
    Top = 12
    Width = 29
    Height = 13
    Caption = 'Songs'
  end
  object Label4: TLabel
    Left = 12
    Top = 50
    Width = 31
    Height = 13
    Caption = 'Artists'
  end
  object DBGrid1: TDBGrid
    Left = 12
    Top = 204
    Width = 217
    Height = 165
    Ctl3D = False
    DataSource = dsAlbums
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'album'
        Width = 145
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'year'
        Width = 50
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 240
    Top = 28
    Width = 320
    Height = 342
    Ctl3D = False
    DataSource = dsSongs
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid2DblClick
    Columns = <
      item
        Expanded = False
        FieldName = 'title'
        Width = 257
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'track'
        Width = 40
        Visible = True
      end>
  end
  object DBLookupListBox1: TDBLookupListBox
    Left = 12
    Top = 64
    Width = 217
    Height = 121
    KeyField = 'id'
    ListField = 'name'
    ListSource = dsArtists
    TabOrder = 2
    OnClick = DBLookupListBox1Click
  end
  object Edit1: TEdit
    Left = 12
    Top = 28
    Width = 217
    Height = 21
    Ctl3D = True
    ParentCtl3D = False
    TabOrder = 3
    OnKeyDown = Edit1KeyDown
  end
  object dsArtists: TDataSource
    DataSet = qryArtists
    Left = 100
    Top = 92
  end
  object qryAlbums: TZReadOnlyQuery
    Connection = frmMain.ZConnection1
    BeforeOpen = qryAlbumsBeforeOpen
    SQL.Strings = (
      'select distinct'
      '  a.id, f.album, f.year'
      'from'
      '  file f join artist a on a.id = f.id_artist'
      'where'
      '  a.id = :id_artist'
      'order by'
      '  f.year, f.album ')
    Params = <
      item
        DataType = ftInteger
        Name = 'id_artist'
        ParamType = ptInput
      end>
    Left = 84
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'id_artist'
        ParamType = ptInput
      end>
    object qryAlbumsid: TIntegerField
      FieldName = 'id'
    end
    object qryAlbumsalbum: TStringField
      FieldName = 'album'
      Size = 50
    end
    object qryAlbumsyear: TIntegerField
      FieldName = 'year'
    end
  end
  object dsAlbums: TDataSource
    DataSet = qryAlbums
    Left = 84
    Top = 256
  end
  object qrySongs: TZReadOnlyQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select'
      '  f.title,'
      '  f.track,'
      '  f.album,'
      '  f.id_artist,'
      '  f.id,'
      '  f.path'
      'from'
      '  file f'
      'order by'
      '  f.track, f.id  ')
    Params = <>
    MasterFields = 'album;id'
    MasterSource = dsAlbums
    LinkedFields = 'album;id_artist'
    Left = 384
    Top = 96
    object qrySongstitle: TStringField
      FieldName = 'title'
      Size = 50
    end
    object qrySongstrack: TIntegerField
      FieldName = 'track'
    end
    object qrySongsalbum: TStringField
      FieldName = 'album'
      Size = 50
    end
    object qrySongsid_artist: TIntegerField
      FieldName = 'id_artist'
    end
    object qrySongsid: TIntegerField
      FieldName = 'id'
    end
    object qrySongspath: TStringField
      FieldName = 'path'
      Size = 400
    end
  end
  object dsSongs: TDataSource
    DataSet = qrySongs
    Left = 384
    Top = 144
  end
  object qryArtists: TZReadOnlyQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select * from artist'
      'where name like'
      #39'%'#39
      'order by name ')
    Params = <>
    Left = 100
    Top = 44
    object qryArtistsid: TIntegerField
      FieldName = 'id'
    end
    object qryArtistsname: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
end
