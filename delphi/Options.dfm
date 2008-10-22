object frmOptions: TfrmOptions
  Left = 0
  Top = 0
  Caption = 'Options'
  ClientHeight = 128
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 12
    Top = 8
    Width = 57
    Height = 13
    Caption = 'Start Folder'
  end
  object DBEdit1: TDBEdit
    Left = 12
    Top = 24
    Width = 345
    Height = 19
    Ctl3D = False
    DataField = 'start_path'
    DataSource = DataSource1
    ParentCtl3D = False
    TabOrder = 0
  end
  object ZQuery1: TZQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select * from options')
    Params = <>
    Left = 84
    Top = 16
    object ZQuery1id: TIntegerField
      FieldName = 'id'
    end
    object ZQuery1start_path: TStringField
      FieldName = 'start_path'
      Size = 400
    end
  end
  object DataSource1: TDataSource
    DataSet = ZQuery1
    Left = 84
    Top = 60
  end
end
