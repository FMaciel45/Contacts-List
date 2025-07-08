object DM: TDM
  Height = 480
  Width = 640
  object ConexaoBD: TFDConnection
    Params.Strings = (
      'Database=agendadecontatosdb'
      'User_Name=root'
      'Password=toor'
      'DriverID=MySQL')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 56
  end
  object tbContatos: TFDTable
    Active = True
    AfterInsert = tbContatosAfterInsert
    IndexFieldNames = 'id'
    Connection = ConexaoBD
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'agendadecontatosdb.contatos'
    Left = 136
    Top = 56
    object tbContatosid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ReadOnly = False
    end
    object tbContatosnome: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object tbContatoscelular: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'celular'
      Origin = 'celular'
      Size = 16
    end
    object tbContatosdata: TDateTimeField
      AutoGenerateValue = arDefault
      FieldName = 'data'
      Origin = '`data`'
    end
    object tbContatosobservacoes: TMemoField
      AutoGenerateValue = arDefault
      FieldName = 'observacoes'
      Origin = 'observacoes'
      BlobType = ftMemo
    end
  end
  object dsContatos: TDataSource
    DataSet = tbContatos
    Left = 136
    Top = 128
  end
end
