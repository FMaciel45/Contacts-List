object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Agenda de Contatos'
  ClientHeight = 572
  ClientWidth = 923
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object titleLabel: TLabel
    Left = 32
    Top = 24
    Width = 308
    Height = 32
    Caption = 'Agenda de contatos - Criar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object nameLabel: TLabel
    Left = 32
    Top = 139
    Width = 96
    Height = 15
    Caption = 'Nome do Contato'
  end
  object celLabel: TLabel
    Left = 32
    Top = 203
    Width = 37
    Height = 15
    Caption = 'Celular'
  end
  object observLabel: TLabel
    Left = 32
    Top = 267
    Width = 67
    Height = 15
    Caption = 'Observa'#231#245'es'
  end
  object altLabel: TLabel
    Left = 32
    Top = 483
    Width = 89
    Height = 15
    Caption = #218'ltima altera'#231#227'o:'
  end
  object showDate: TDBText
    Left = 34
    Top = 512
    Width = 129
    Height = 17
    DataField = 'data'
    DataSource = DataModule2.dsContatos
  end
  object buscaLabel: TLabel
    Left = 512
    Top = 139
    Width = 101
    Height = 15
    Caption = 'Busca por contatos'
  end
  object inputNomeCreate: TDBEdit
    Left = 32
    Top = 160
    Width = 401
    Height = 23
    DataField = 'nome'
    DataSource = DataModule2.dsContatos
    TabOrder = 0
  end
  object inputCelCreate: TDBEdit
    Left = 32
    Top = 224
    Width = 401
    Height = 23
    DataField = 'celular'
    DataSource = DataModule2.dsContatos
    TabOrder = 1
  end
  object inputObservCreate: TDBMemo
    Left = 34
    Top = 288
    Width = 399
    Height = 161
    DataField = 'observacoes'
    DataSource = DataModule2.dsContatos
    TabOrder = 2
  end
  object contactsGrid: TDBGrid
    Left = 512
    Top = 203
    Width = 369
    Height = 246
    DataSource = DataModule2.dsContatos
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nome'
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'celular'
        Title.Caption = 'Contato'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Title.Caption = #218'ltima altera'#231#227'o'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'observacoes'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'Segoe UI'
        Title.Font.Style = [fsBold]
        Width = 83
        Visible = True
      end>
  end
  object inputTxtBusca: TEdit
    Left = 512
    Top = 160
    Width = 369
    Height = 23
    TabOrder = 4
  end
  object btnExcluirCont: TButton
    Left = 358
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = btnExcluirContClick
  end
  object btnNovoCont: TButton
    Left = 32
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 6
    OnClick = btnNovoContClick
  end
  object btnCriarCont: TButton
    Left = 277
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Criar'
    TabOrder = 7
    OnClick = btnCriarContClick
  end
  object btnEditarCont: TButton
    Left = 512
    Top = 96
    Width = 75
    Height = 25
    Caption = 'Editar'
    TabOrder = 8
    OnClick = btnEditarContClick
  end
end
