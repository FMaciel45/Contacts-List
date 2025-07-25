unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, unitDados;

type
  TForm1 = class(TForm)
    titleLabel: TLabel;
    inputNomeCreate: TDBEdit;
    nomeLabel: TLabel;
    inputCelCreate: TDBEdit;
    celLabel: TLabel;
    observLabel: TLabel;
    altLabel: TLabel;
    showDate: TDBText;
    inputObservCreate: TDBMemo;
    contactsGrid: TDBGrid;
    inputTxtBusca: TEdit;
    buscaLabel: TLabel;
    btnExcluirCont: TButton;
    btnNovoCont: TButton;
    btnCriarCont: TButton;
    btnEditarCont: TButton;
    procedure txtBuscaChange(Sender: TObject);
    procedure btnExcluirContClick(Sender: TObject);
    procedure btnNovoContClick(Sender: TObject);
    procedure btnCriarContClick(Sender: TObject);
    procedure btnEditarContClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses unitEdicao;

procedure TForm1.txtBuscaChange(Sender: TObject);
begin
  DataModule2.tbContatos.Locate('nome', inputTxtBusca.Text, [loPartialKey]);
end;

procedure TForm1.btnExcluirContClick(Sender: TObject);
begin
  // Excluir registro
  if not DataModule2.tbContatos.IsEmpty then
  begin
    if MessageDlg('Excluir contato selecionado?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      try
        DataModule2.tbContatos.Delete;
        ShowMessage('Contato excluído!');
      except
        on E: Exception do
          ShowMessage('Erro: ' + E.Message);
      end;
    end;
  end
  else
    ShowMessage('Nenhum contato selecionado');
end;

procedure TForm1.btnNovoContClick(Sender: TObject);
begin
  // Novo registro
  DataModule2.tbContatos.Append;
  inputNomeCreate.SetFocus;
end;

procedure TForm1.btnCriarContClick(Sender: TObject);
begin
  // Confirmar novo registro (persistir no BD)
  if DataModule2.tbContatos.State in [dsInsert, dsEdit] then // Verifica se está em modo de inserção ou edição
  begin
    try
      DataModule2.tbContatos.Post;
      ShowMessage('Contato salvo!');
    except
      on E: Exception do
      begin
        DataModule2.tbContatos.Cancel;
        ShowMessage('Erro ao salvar: ' + E.Message);
      end;
    end;
  end;
end;

procedure TForm1.btnEditarContClick(Sender: TObject);
begin
  // Editar - direcionar à tela de "Editar" como modal
  if not DataModule2.tbContatos.IsEmpty then
  begin
    Form2 := TForm2.Create(Self);
    try
      if Form2.ShowModal = mrOk then
      begin
        // Atualiza o grid se necessário
        DataModule2.tbContatos.Refresh;
      end;
    finally
      Form2.Free;
    end;
  end
  else
    ShowMessage('Nenhum contato selecionado');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  // Ativar a tabela ao mostrar o formulário
  if not DataModule2.tbContatos.Active then
    DataModule2.tbContatos.Active := True;
end;

end.
