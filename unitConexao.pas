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
    Conexao: TFDConnection; // Componente principal de conex�o do FireDAC
    procedure DataModuleCreate(Sender: TObject);
  private
    FConfig: TDatabaseConfig; // Armazena a configura��o injetada
    procedure ConfigurarConexao; // M�todo interno p/ configurar a conex�o
  public
    // Construtor p/ receber a configura��o por inje��o de depend�ncia
    constructor Create(AOwner: TComponent; AConfig: TDatabaseConfig); reintroduce;
    destructor Destroy; override; // Garante o fechamento seguro da conex�o
  end;

var
  DataModule1: TDataModule1; // Vari�vel global

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

constructor TDataModule1.Create(AOwner: TComponent; AConfig: TDatabaseConfig);
begin
  FConfig := AConfig; // Armazena a configura��o recebida por inje��o de depend�ncia
  inherited Create(AOwner); // Chama o construtor da classe pai (TDataModule)
end;

destructor TDataModule1.Destroy;
begin
  // Garante que a conex�o est� fechada antes de destruir o objeto
  if Conexao.Connected then
    Conexao.Connected := False;
  inherited Destroy;
end;

procedure TDataModule1.DataModuleCreate(Sender: TObject); // Evento disparado quando o DataModule � criado
begin
  ConfigurarConexao; // Configura a conex�o assim que o DataModule � criado
end;

procedure TDataModule1.ConfigurarConexao;
begin
  try
    Conexao.Params.Clear; // Limpa par�metros existentes

    // Configura os par�metros b�sicos da conex�o a partir do objeto FConfig
    Conexao.Params.Add('Database=' + FConfig.Database);
    Conexao.Params.Add('User_Name=' + FConfig.UserName);
    Conexao.Params.Add('Password=' + FConfig.Password);
    Conexao.Params.Add('DriverID=' + FConfig.DriverID);

    // Estabelece a conex�o com o BD
    Conexao.Connected := True;
  except
    on E: Exception do
    begin
      // Captura a exce��o e lan�a uma mensagem de erro personalizada
      raise Exception.Create('Erro ao configurar conex�o com o banco: ' + E.Message);
    end;
  end;
end;

end.
