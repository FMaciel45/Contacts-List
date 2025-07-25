program Agenda;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {/ Form1},
  unitConexao in 'unitConexao.pas' {DataModule1: TDataModule},
  unitDados in 'unitDados.pas' {DataModule2: TDataModule},
  unitConfig in 'unitConfig.pas',
  unitEdicao in 'unitEdicao.pas' {Form1};

{$R *.res}
{$IFDEF DEBUG}
{$ENDIF}

begin
  Application.Initialize; // Inicialização padrão da aplicação VCL
  Application.MainFormOnTaskbar := True; // Habilita o recurso de cada formulário ter sua própria taskbar em Windows 7+
  System.ReportMemoryLeaksOnShutdown := True; // Relatórios sobre vazamento de memória

  // Carrega a configuração do BD -> permite alterar a configuração sem recompilar o código
  var Config := TDatabaseConfig.LoadFromJson('config.json');

  try
    // Deve-se, primeiro, criar os DataModules
    DataModule1 := TDataModule1.Create(Application, Config); // Cria a instância do DataModule de conexão injetando a configuração

    // Registra os DataModules na aplicação
    Application.CreateForm(TDataModule2, DataModule2);
    Application.CreateForm(TForm1, Form1);

    // Após isso criar os DataModules, deve-se criar o form principal
    Application.CreateForm(TForm1, Form1);

    Application.Run;
  finally
    // Garante que o objeto de configuração seja liberado
    Config.Free;
  end;

end.
