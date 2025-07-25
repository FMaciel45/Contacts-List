unit unitEdicao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Data.DB, unitDados;

type
  TForm2 = class(TForm)
    inputDescEdit: TDBMemo;
    inputCelularEdit: TDBEdit;
    inputNomeEdit: TDBEdit;
    btnConfirmarAlt: TButton;
    btnCancelarAlt: TButton;
    editNomeLabel: TLabel;
    editObservLabel: TLabel;
    editCelLabel: TLabel;
    editTitleLabel: TLabel;
    procedure btnConfirmarAltClick(Sender: TObject);
    procedure btnCancelarAltClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FEditing: Boolean;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses unitPrincipal;

procedure TForm2.FormShow(Sender: TObject);
begin
  // Configura os controles com o DataSource do DataModule
  inputNomeEdit.DataSource := DataModule2.dsContatos;
  inputNomeEdit.DataField := 'nome';

  inputCelularEdit.DataSource := DataModule2.dsContatos;
  inputCelularEdit.DataField := 'celular';

  inputDescEdit.DataSource := DataModule2.dsContatos;
  inputDescEdit.DataField := 'observacoes';

  // Entra em modo de edi��o
  DataModule2.tbContatos.Edit;
  FEditing := True;
end;

procedure TForm2.btnConfirmarAltClick(Sender: TObject);
begin
  try
    // Confirma as altera��es
    DataModule2.tbContatos.Post;
    ModalResult := mrOk;
    ShowMessage('Altera��es salvas com sucesso!');
  except
    on E: Exception do
    begin
      DataModule2.tbContatos.Cancel;
      ShowMessage('Erro ao salvar: ' + E.Message);
    end;
  end;
end;

procedure TForm2.btnCancelarAltClick(Sender: TObject);
begin
  // Cancela as altera��es
  if FEditing and (DataModule2.tbContatos.State in [dsEdit, dsInsert]) then
    DataModule2.tbContatos.Cancel;

  ModalResult := mrCancel;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Cancela opera��o se o usu�rio fechar o formul�rio sem usar os bot�es
  if FEditing and (DataModule2.tbContatos.State in [dsEdit, dsInsert]) then
    DataModule2.tbContatos.Cancel;
end;

end.
