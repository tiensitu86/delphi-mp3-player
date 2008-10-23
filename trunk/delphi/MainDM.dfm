object dmMain: TdmMain
  OldCreateOrder = False
  Height = 244
  Width = 333
  object qryLastInsertRowid: TZReadOnlyQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select last_insert_rowid() as last_insert_rowid')
    Params = <>
    Left = 44
    Top = 16
    object qryLastInsertRowidlast_insert_rowid: TStringField
      FieldName = 'last_insert_rowid'
      Size = 255
    end
  end
end
