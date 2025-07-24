unit unitConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  unitConfig;

type
  TDataModule1 = class(TDataModule)
    Conexao: TFDConnection;
    FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink; // Compoonente p/ verificar o driver MySQL
    procedure DataModuleCreate(Sender: TObject);
  private
    FConfig: TDatabaseConfig;
    procedure ConfigurarConexao;
    procedure VerificarDriverMySQL; // Verificar o driver
  public
    constructor Create(AOwner: TComponent; AConfig: TDatabaseConfig); reintroduce;
    destructor Destroy; override;
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TDataModule1.Create(AOwner: TComponent; AConfig: TDatabaseConfig);
begin
  FConfig := AConfig;
  inherited Create(AOwner);
end;

destructor TDataModule1.Destroy;
begin
  if Conexao.Connected then
    Conexao.Connected := False;
  inherited;
end;

procedure TDataModule1.VerificarDriverMySQL;
begin
  // Caminho do libmysql.dll
  FDPhysMySQLDriverLink1.VendorLib := 'C:\Windows\SysWOW64\libmysql.dll';

  // Verifica se o arquivo existe
  if not FileExists(FDPhysMySQLDriverLink1.VendorLib) then
    raise Exception.Create('Driver MySQL não encontrado em: ' + FDPhysMySQLDriverLink1.VendorLib);
end;

procedure TDataModule1.ConfigurarConexao;
begin
  try
    // Primeiro verifica o driver
    VerificarDriverMySQL;

    // Configuração completa da conexão
    with Conexao do
    begin
      Params.Clear;

      // Configuração básica
      DriverName := 'MySQL';
      Params.Values['Server'] := 'localhost';
      Params.Values['Database'] := FConfig.Database;
      Params.Values['User_Name'] := FConfig.UserName;
      Params.Values['Password'] := FConfig.Password;
      Params.Values['Port'] := '3306'; // Porta padrão do MySQL

      // Tenta conectar
      Connected := True;
    end;
  except
    on E: Exception do
      raise Exception.Create('Erro na conexão MySQL: ' + E.Message);
  end;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  if Assigned(FConfig) then
    ConfigurarConexao;
end;

end.
