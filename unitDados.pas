unit unitDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, unitConexao;

type
  TDataModule2 = class(TDataModule) // DataModule respons�vel pela gest�o dos dados da aplica��o
    tbContatos: TFDTable; // Componente de tabela do FireDAC
    dsContatos: TDataSource; // Fonte de dados p/ componentes visuais
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2; // Vari�vel global da inst�ncia

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

// Evento disparado quando o DataModule � criado
procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  if not Assigned(DataModule1) then // Verifica��o de depend�ncia
    raise Exception.Create('DataModule1 n�o foi criado');

  tbContatos.Connection := DataModule1.Conexao; // Configura��o de conex�o

  // Ativa a conex�o se n�o estiver ativa -> garante que est� ativa antes de acessar os dados
  if not DataModule1.Conexao.Connected then
    DataModule1.Conexao.Connected := True;

  tbContatos.TableName := 'contatos'; // nome da tabela dentro do BD
  tbContatos.Active := True; // Abre a tabela p/ acessar os dados
end;

end.
