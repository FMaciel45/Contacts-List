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
  object Label2: TLabel
    Left = 32
    Top = 139
    Width = 96
    Height = 15
    Caption = 'Nome do Contato'
  end
  object Label3: TLabel
    Left = 32
    Top = 203
    Width = 37
    Height = 15
    Caption = 'Celular'
  end
  object Label4: TLabel
    Left = 32
    Top = 269
    Width = 67
    Height = 15
    Caption = 'Observa'#231#245'es'
  end
  object Label1: TLabel
    Left = 32
    Top = 24
    Width = 418
    Height = 32
    Caption = 'Agenda de contatos - Editar Contato'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBEdit1: TDBEdit
    Left = 32
    Top = 160
    Width = 401
    Height = 23
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 32
    Top = 224
    Width = 401
    Height = 23
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 32
    Top = 290
    Width = 401
    Height = 143
    TabOrder = 2
  end
  object Button1: TButton
    Left = 561
    Top = 159
    Width = 97
    Height = 25
    Caption = 'Confirmar'
    TabOrder = 3
  end
  object Button2: TButton
    Left = 721
    Top = 159
    Width = 96
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 4
  end
end
