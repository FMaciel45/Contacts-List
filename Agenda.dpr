program Agenda;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas', // Form2
  unitConexao in 'unitConexao.pas', // DataModule1: TDataModule
  unitDados in 'unitDados.pas', // DataModule2: TDataModule
  unitConfig in 'unitConfig.pas';

{$R *.res}

begin
  Application.Initialize; // Inicializa��o padr�o da aplica��o VCL
  Application.MainFormOnTaskbar := True; // Habilita o recurso de cada formul�rio ter sua pr�pria taskbar em Windows 7+

  // Carrega a configura��o do BD -> permite alterar a configura��o sem recompilar o c�digo
  var Config := TDatabaseConfig.LoadFromJson('config.json');

  try
    // Deve-se, primeiro, criar os DataModules
    DataModule1 := TDataModule1.Create(Application, Config); // Cria a inst�ncia do DataModule de conex�o injetando a configura��o

    // Registra os DataModules na aplica��o
    Application.CreateForm(TDataModule2, DataModule2);

    // Ap�s isso criar os DataModules, deve-se criar o form principal
    Application.CreateForm(TForm1, Form1);

    Application.Run;
  finally
    // Garante que o objeto de configura��o seja liberado
    Config.Free;
  end;

end.
