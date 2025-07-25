object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 577
  ClientWidth = 895
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object editNomeLabel: TLabel
    Left = 32
    Top = 128
    Width = 94
    Height = 15
    Caption = 'Nome do contato'
  end
  object editObservLabel: TLabel
    Left = 32
    Top = 272
    Width = 67
    Height = 15
    Caption = 'Observa'#231#245'es'
  end
  object editCelLabel: TLabel
    Left = 32
    Top = 200
    Width = 37
    Height = 15
    Caption = 'Celular'
  end
  object editTitleLabel: TLabel
    Left = 32
    Top = 24
    Width = 320
    Height = 32
    Caption = 'Agenda de contatos - Editar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object inputDescEdit: TDBMemo
    Left = 32
    Top = 293
    Width = 409
    Height = 148
    DataField = 'observacoes'
    DataSource = DataModule2.dsContatos
    TabOrder = 0
  end
  object inputCelularEdit: TDBEdit
    Left = 32
    Top = 221
    Width = 409
    Height = 23
    DataField = 'celular'
    DataSource = DataModule2.dsContatos
    TabOrder = 1
  end
  object inputNomeEdit: TDBEdit
    Left = 32
    Top = 149
    Width = 409
    Height = 23
    DataField = 'nome'
    DataSource = DataModule2.dsContatos
    TabOrder = 2
  end
  object btnConfirmarAlt: TButton
    Left = 528
    Top = 148
    Width = 75
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
    OnClick = btnConfirmarAltClick
  end
  object btnCancelarAlt: TButton
    Left = 760
    Top = 148
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
    OnClick = btnCancelarAltClick
  end
end
