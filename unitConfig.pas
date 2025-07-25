unit unitConfig;

interface

uses
  System.SysUtils, System.Classes, System.IniFiles, System.JSON, IOUtils;

type
  TDatabaseConfig = class // Classe que encapsula as configura��es de conex�o com o BD
  private
    // Campos que armazenam os par�metros da conex�o
    FDatabase: string;
    FUserName: string;
    FPassword: string;
    FDriverID: string;

  public
    // Construtor que valida e inicializa os par�metros essenciais
    constructor Create(const ADatabase, AUserName, APassword, ADriverID: string);

    // Propriedades p/ acesso aos par�metros
    property Database: string read FDatabase write FDatabase;
    property UserName: string read FUserName write FUserName;
    property Password: string read FPassword write FPassword;
    property DriverID: string read FDriverID write FDriverID;

    // M�todo est�tico p/ carregar as configura��es
    class function LoadFromJson(const AFileName: string): TDatabaseConfig;
  end;

implementation

{ TDatabaseConfig }

// Valida e inicializa os par�metros de conex�o
constructor TDatabaseConfig.Create(const ADatabase, AUserName, APassword, ADriverID: string);
begin
  // Valida��o dos par�metros obrigat�rios
  if ADatabase.IsEmpty or AUserName.IsEmpty or ADriverID.IsEmpty then
    raise Exception.Create('Configura��o do banco de dados incompleta');

  // Inicializa��o dos campos internos
  FDatabase := ADatabase;
  FUserName := AUserName;
  FPassword := APassword;
  FDriverID := ADriverID;
end;

// Carrega configura��es de um arquivo JSON
class function TDatabaseConfig.LoadFromJson(const AFileName: string): TDatabaseConfig;
var
  JsonFile: TStringStream; // Stream p/ leitura do arquivo
  JsonObj: TJSONObject; // Objeto p/ manipula��o do JSON
begin
  // Verifica se o arquivo existe
  if not TFile.Exists(AFileName) then
    raise Exception.Create('Arquivo de configura��o n�o encontrado: ' + AFileName);

  // Chama o stream p/ ler o arquivo
  JsonFile := TStringStream.Create;
  try
    JsonFile.LoadFromFile(AFileName); // Carrega o conte�do do arquivo p/ o stream
    JsonObj := TJSONObject.ParseJSONValue(JsonFile.DataString) as TJSONObject; // Converte o conte�do p/ um objeto JSON

    // Valida se o JSON foi parseado corretamente
    if not Assigned(JsonObj) then
      raise Exception.Create('Formato JSON inv�lido');

    try
      // Extrai os valores do JSON e cria o objeto de configura��o
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
