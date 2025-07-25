object DataModule2: TDataModule2
  Height = 480
  Width = 645
  object tbContatos: TFDTable
    Active = True
    IndexFieldNames = 'id'
    Connection = DataModule1.Conexao
    ResourceOptions.AssignedValues = [rvEscapeExpand]
    TableName = 'agendadecontatosdb.contatos'
    Left = 176
    Top = 96
  end
  object dsContatos: TDataSource
    DataSet = tbContatos
    Left = 176
    Top = 168
  end
end
