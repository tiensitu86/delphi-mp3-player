object frmUpdate: TfrmUpdate
  Left = 0
  Top = 0
  Caption = 'Update Database'
  ClientHeight = 290
  ClientWidth = 456
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
    Width = 429
    Height = 82
    TabOrder = 1
  end
  object ListBox1: TListBox
    Left = 12
    Top = 148
    Width = 429
    Height = 121
    ItemHeight = 13
    TabOrder = 2
  end
  object qryFolders: TZReadOnlyQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select * from folder order by path')
    Params = <>
    Left = 152
    Top = 8
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
end
