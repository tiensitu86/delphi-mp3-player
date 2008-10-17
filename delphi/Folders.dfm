object frmFolders: TfrmFolders
  Left = 0
  Top = 0
  Caption = 'Folders'
  ClientHeight = 158
  ClientWidth = 491
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  DesignSize = (
    491
    158)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 8
    Width = 474
    Height = 142
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = False
    DataSource = DataSource1
    Options = [dgEditing, dgTitles, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
        FieldName = 'path'
        Title.Caption = 'Path'
        Width = 400
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'recursive'
        PickList.Strings = (
          'True'
          'False')
        Title.Caption = 'Recursive'
        Visible = True
      end>
  end
  object ZQuery1: TZQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select * from folder order by path')
    Params = <>
    Left = 128
    Top = 32
    object ZQuery1id: TIntegerField
      FieldName = 'id'
    end
    object ZQuery1path: TStringField
      FieldName = 'path'
      Size = 400
    end
    object ZQuery1recursive: TBooleanField
      FieldName = 'recursive'
    end
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 128
    Top = 88
  end
end
