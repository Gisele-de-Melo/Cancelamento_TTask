object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Cancelamento de TTask'
  ClientHeight = 136
  ClientWidth = 183
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object StatusLabel: TLabel
    Left = 8
    Top = 24
    Width = 73
    Height = 21
    Caption = 'Progresso:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object StartButton: TButton
    Left = 8
    Top = 79
    Width = 75
    Height = 42
    Caption = 'Iniciar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = StartButtonClick
  end
  object CancelButton: TButton
    Left = 89
    Top = 79
    Width = 80
    Height = 42
    Caption = 'Cancelar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = CancelButtonClick
  end
end
