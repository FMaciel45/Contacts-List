unit unitDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, unitConexao;

type
  TDataModule2 = class(TDataModule)
    tbContatos: TFDTable;
    dsContatos: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule2: TDataModule2;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule2.DataModuleCreate(Sender: TObject);
begin
  // Verificação robusta da conexão
  if not Assigned(DataModule1) then
    raise Exception.Create('DataModule1 não foi criado');

  if not DataModule1.Conexao.Connected then
    raise Exception.Create('Conexão com MySQL não está ativa');

  // Configura a tabela
  tbContatos.Connection := DataModule1.Conexao;
  tbContatos.TableName := 'contatos';

  try
    tbContatos.Active := True;
  except
    on E: Exception do
      raise Exception.Create('Erro ao abrir tabela: ' + E.Message);
  end;
end;

end.
