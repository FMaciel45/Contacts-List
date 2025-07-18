unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, unitDados;

type
  TForm2 = class(TForm) // Classe do formulário principal da aplicação
    // Componentes de interface
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBNavigator1: TDBNavigator;
    DBMemo1: TDBMemo;
    DBGrid1: TDBGrid;
    txtBusca: TEdit;
    Label6: TLabel;
    procedure txtBuscaChange(Sender: TObject); // Evento de mudança no campo de busca
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2; // Variável global da instância do formulário

implementation

{$R *.dfm}

procedure TForm2.txtBuscaChange(Sender: TObject); // Evento disparado quando o texto da busca muda
begin
  DataModule2.tbContatos.Locate('nome', txtBusca.Text, [loPartialKey]); // Busca registros com correspondência parcial no campo "nome"
end;

end.
