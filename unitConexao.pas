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
    Conexao: TFDConnection; // Componente principal de conexão do FireDAC
    procedure DataModuleCreate(Sender: TObject);
  private
    FConfig: TDatabaseConfig; // Armazena a configuração injetada
    procedure ConfigurarConexao; // Método interno p/ configurar a conexão
  public
    // Construtor p/ receber a configuração por injeção de dependência
    constructor Create(AOwner: TComponent; AConfig: TDatabaseConfig); reintroduce;
    destructor Destroy; override; // Garante o fechamento seguro da conexão
  end;

var
  DataModule1: TDataModule1; // Variável global

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TDataModule1.Create(AOwner: TComponent; AConfig: TDatabaseConfig);
begin
  FConfig := AConfig; // Armazena a configuração recebida por injeção de dependência
  inherited Create(AOwner); // Chama o construtor da classe pai (TDataModule)
end;

destructor TDataModule1.Destroy;
begin
  // Garante que a conexão está fechada antes de destruir o objeto
  if Conexao.Connected then
    Conexao.Connected := False;
  inherited Destroy;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject); // Evento disparado quando o DataModule é criado
begin
  ConfigurarConexao; // Configura a conexão assim que o DataModule é criado
end;

procedure TDataModule1.ConfigurarConexao;
begin
  try
    Conexao.Params.Clear; // Limpa parâmetros existentes

    // Configura os parâmetros básicos da conexão a partir do objeto FConfig
    Conexao.Params.Add('Database=' + FConfig.Database);
    Conexao.Params.Add('User_Name=' + FConfig.UserName);
    Conexao.Params.Add('Password=' + FConfig.Password);
    Conexao.Params.Add('DriverID=' + FConfig.DriverID);

    // Estabelece a conexão com o BD
    Conexao.Connected := True;
  except
    on E: Exception do
    begin
      // Captura a exceção e lança uma mensagem de erro personalizada
      raise Exception.Create('Erro ao configurar conexão com o banco: ' + E.Message);
    end;
  end;
end;

end.
