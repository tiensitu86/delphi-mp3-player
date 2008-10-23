object dmArtist: TdmArtist
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 248
  Width = 409
  object qryArtists: TZQuery
    Connection = frmMain.ZConnection1
    SQL.Strings = (
      'select * from artist order by name')
    Params = <>
    Left = 32
    Top = 20
  end
  object dspArtists: TDataSetProvider
    DataSet = qryArtists
    Left = 32
    Top = 68
  end
  object cdsArtists: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'id'
        DataType = ftInteger
      end
      item
        Name = 'name'
        DataType = ftString
        Size = 50
      end>
    IndexDefs = <
      item
        Name = 'cdsArtistsIndex1'
        Fields = 'name'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'cdsArtistsIndex1'
    Params = <>
    ProviderName = 'dspArtists'
    StoreDefs = True
    Left = 32
    Top = 116
    object cdsArtistsid: TIntegerField
      FieldName = 'id'
    end
    object cdsArtistsname: TStringField
      FieldName = 'name'
      Size = 50
    end
  end
end
