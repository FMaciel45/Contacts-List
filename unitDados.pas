unit unitDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, unitConexao; // Conexão com o BD

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

  tbContatos.Connection := DataModule1.Conexao;

  // Ativa a conexão se não estiver ativa
  if not DataModule1.Conexao.Connected then
    DataModule1.Conexao.Connected := True;

    tbContatos.TableName := 'contatos'; // nome da tabela dentro do BD
    tbContatos.Active := True;
end;

end.
