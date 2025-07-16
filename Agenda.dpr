program Agenda;

uses
  Vcl.Forms,
  unitPrincipal in 'unitPrincipal.pas' {Form2},
  unitConexao in 'unitConexao.pas' {DataModule1: TDataModule},
  unitDados in 'unitDados.pas' {DataModule2: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.Run;
end.
