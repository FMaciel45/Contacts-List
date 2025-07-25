unit unitConfig;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, System.JSON, IOUtils;

type
  TDatabaseConfig = class // Classe que encapsula as configurações de conexão com o BD
  private
    // Campos que armazenam os parâmetros da conexão
    FDatabase: string;
    FUserName: string;
    FPassword: string;
    FDriverID: string;

  public
    // Construtor que valida e inicializa os parâmetros essenciais
    constructor Create(const ADatabase, AUserName, APassword, ADriverID: string);

    // Propriedades p/ acesso aos parâmetros
    property Database: string read FDatabase write FDatabase;
    property UserName: string read FUserName write FUserName;
    property Password: string read FPassword write FPassword;
    property DriverID: string read FDriverID write FDriverID;

    // Método estático p/ carregar as configurações
    class function LoadFromJson(const AFileName: string): TDatabaseConfig;
  end;

implementation

{ TDatabaseConfig }

// Valida e inicializa os parâmetros de conexão
constructor TDatabaseConfig.Create(const ADatabase, AUserName, APassword, ADriverID: string);
begin
  // Validação dos parâmetros obrigatórios
  if ADatabase.IsEmpty or AUserName.IsEmpty or ADriverID.IsEmpty then
    raise Exception.Create('Configuração do banco de dados incompleta');

  // Inicialização dos campos internos
  FDatabase := ADatabase;
  FUserName := AUserName;
  FPassword := APassword;
  FDriverID := ADriverID;
end;

// Carrega configurações de um arquivo JSON
class function TDatabaseConfig.LoadFromJson(const AFileName: string): TDatabaseConfig;
var
  JsonFile: TStringStream; // Stream p/ leitura do arquivo
  JsonObj: TJSONObject; // Objeto p/ manipulação do JSON
begin
  // Verifica se o arquivo existe
  if not TFile.Exists(AFileName) then
    raise Exception.Create('Arquivo de configuração não encontrado: ' + AFileName);

  // Chama o stream p/ ler o arquivo
  JsonFile := TStringStream.Create;
  try
    JsonFile.LoadFromFile(AFileName); // Carrega o conteúdo do arquivo p/ o stream
    JsonObj := TJSONObject.ParseJSONValue(JsonFile.DataString) as TJSONObject; // Converte o conteúdo p/ um objeto JSON

    // Valida se o JSON foi parseado corretamente
    if not Assigned(JsonObj) then
      raise Exception.Create('Formato JSON inválido');

    try
      // Extrai os valores do JSON e cria o objeto de configuração
      Result := TDatabaseConfig.Create(
        JsonObj.GetValue<string>('Database'),
        JsonObj.GetValue<string>('User_Name'),
        JsonObj.GetValue<string>('Password'),
        JsonObj.GetValue<string>('DriverID', 'MySQL')
      );
    finally
      JsonObj.Free; // Libera o objeto JSON
    end;
  finally
    JsonFile.Free; // Libera o stream independentemente de sucesso ou falha
  end;
end;

end.
