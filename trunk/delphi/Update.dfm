object frmUpdate: TfrmUpdate
  Left = 0
  Top = 0
  Caption = 'Update Database'
  ClientHeight = 352
  ClientWidth = 605
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  DesignSize = (
    605
    352)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 131
    Width = 45
    Height = 13
    Caption = 'New Files'
  end
  object Button1: TButton
    Left = 12
    Top = 12
    Width = 81
    Height = 25
    Caption = 'Start Update'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 12
    Top = 43
    Width = 578
    Height = 82
    Anchors = [akLeft, akTop, akRight]
    TabOrder = 1
    ExplicitWidth = 516
  end
  object DBGrid1: TDBGrid
    Left = 12
    Top = 150
    Width = 578
    Height = 171
    Anchors = [akLeft, akTop, akRight, akBottom]
    Ctl3D = False
    DataSource = DataSource1
    ParentCtl3D = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'File'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Title'
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Artist'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Album'
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Year'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Track'
        Visible = True
      end>
  end
  object ProgressBar1: TProgressBar
    Left = 104
    Top = 12
    Width = 209
    Height = 25
    Step = 1
    TabOrder = 3
  end
  object qryFolders: TZReadOnlyQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select * from folder order by path')
    Params = <>
    Left = 156
    Top = 64
    object qryFoldersid: TIntegerField
      FieldName = 'id'
    end
    object qryFolderspath: TStringField
      FieldName = 'path'
      Size = 400
    end
    object qryFoldersrecursive: TBooleanField
      FieldName = 'recursive'
    end
  end
  object ClientDataSet1: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'File'
        DataType = ftString
        Size = 400
      end
      item
        Name = 'Title'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Artist'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Album'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'Year'
        DataType = ftInteger
      end
      item
        Name = 'Track'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 156
    Top = 180
    Data = {
      9D0000009619E0BD0100000018000000060000000000030000009D000446696C
      650200490000000100055749445448020002009001055469746C650100490000
      0001000557494454480200020032000641727469737401004900000001000557
      4944544802000200320005416C62756D01004900000001000557494454480200
      020032000459656172040001000000000005547261636B040001000000000000
      00}
    object ClientDataSet1File: TStringField
      FieldName = 'File'
      Size = 400
    end
    object ClientDataSet1Title: TStringField
      FieldName = 'Title'
      Size = 50
    end
    object ClientDataSet1Artist: TStringField
      FieldName = 'Artist'
      Size = 50
    end
    object ClientDataSet1Album: TStringField
      FieldName = 'Album'
      Size = 50
    end
    object ClientDataSet1Year: TIntegerField
      FieldName = 'Year'
    end
    object ClientDataSet1Track: TIntegerField
      FieldName = 'Track'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 156
    Top = 236
  end
end
