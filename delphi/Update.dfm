object frmUpdate: TfrmUpdate
  Left = 0
  Top = 0
  Caption = 'Update Database'
  ClientHeight = 371
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 165
    Width = 45
    Height = 13
    Caption = 'New Files'
  end
  object Label2: TLabel
    Left = 8
    Top = 4
    Width = 30
    Height = 13
    Caption = 'Folder'
  end
  object Button1: TButton
    Left = 8
    Top = 51
    Width = 81
    Height = 25
    Caption = 'Start Update'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 82
    Width = 573
    Height = 77
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 180
    Width = 573
    Height = 181
    Ctl3D = False
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    PopupMenu = PopupMenu1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnEditButtonClick = DBGrid1EditButtonClick
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
        ButtonStyle = cbsEllipsis
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
    Left = 100
    Top = 51
    Width = 221
    Height = 25
    Step = 1
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 8
    Top = 17
    Width = 313
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
  end
  object CheckBox1: TCheckBox
    Left = 332
    Top = 19
    Width = 97
    Height = 17
    Caption = 'Recursive'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object qryOptions: TZReadOnlyQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select * from options')
    Params = <>
    Left = 152
    Top = 98
    object qryOptionsid: TIntegerField
      FieldName = 'id'
    end
    object qryOptionsstart_path: TStringField
      FieldName = 'start_path'
      Size = 400
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
    Left = 152
    Top = 208
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
    Left = 152
    Top = 264
  end
  object qryArtist: TZQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select * from artist order by name')
    Params = <>
    Left = 296
    Top = 96
    object qryArtistid: TIntegerField
      FieldName = 'id'
    end
    object qryArtistname: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 260
    Top = 264
    object S1: TMenuItem
      Caption = 'Same Artist and Album'
      OnClick = S1Click
    end
    object rytogettitle1: TMenuItem
      Caption = 'Try to get title from file name'
      OnClick = rytogettitle1Click
    end
  end
end
