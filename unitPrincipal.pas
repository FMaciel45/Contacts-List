unit unitPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids, unitDados;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    DBMemo1: TDBMemo;
    DBGrid1: TDBGrid;
    txtBusca: TEdit;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Editar: TButton;
    procedure txtBuscaChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure EditarClick(Sender: TObject);
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
  DataModule2.tbContatos.Locate('nome', txtBusca.Text, [loPartialKey]);
end;

procedure TForm1.Button1Click(Sender: TObject);
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

procedure TForm1.Button2Click(Sender: TObject);
begin
  // Novo registro
  DataModule2.tbContatos.Append;
  DBEdit1.SetFocus;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  // Confirmar novo registro
  if DataModule2.tbContatos.State in [dsInsert, dsEdit] then
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

procedure TForm1.EditarClick(Sender: TObject);
begin
  // Abrir formulário de edição (modal - agora - que poderá virar uma aba)
  if not DataModule2.tbContatos.IsEmpty then
  begin
    Form2 := TForm2.Create(Self);
    try
      Form2.ShowModal;
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
