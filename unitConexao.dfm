object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object Conexao: TFDConnection
    Params.Strings = (
      'Database=agendadecontatosdb'
      'User_Name=root'
      'Password=toor'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 72
    Top = 80
  end
end
