object FrmFiltroRelAbastecimentos: TFrmFiltroRelAbastecimentos
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 121
  ClientWidth = 248
  Color = clBtnFace
  Constraints.MaxHeight = 160
  Constraints.MaxWidth = 264
  Constraints.MinHeight = 160
  Constraints.MinWidth = 264
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblPeriodo: TLabel
    Left = 8
    Top = 18
    Width = 36
    Height = 13
    Caption = 'Per'#237'odo'
  end
  object Label1: TLabel
    Left = 138
    Top = 18
    Width = 16
    Height = 13
    Caption = 'at'#233
  end
  object datePickerInicial: TDateTimePicker
    Left = 51
    Top = 14
    Width = 81
    Height = 21
    Date = 44618.000000000000000000
    Time = 0.686546087963506600
    TabOrder = 0
  end
  object btnVisualizar: TButton
    Left = 166
    Top = 88
    Width = 75
    Height = 25
    Caption = '&Visualizar'
    TabOrder = 1
    OnClick = btnVisualizarClick
  end
  object btnImprimir: TButton
    Left = 85
    Top = 88
    Width = 75
    Height = 25
    Caption = '&Imprimir'
    TabOrder = 2
    OnClick = btnImprimirClick
  end
  object datePickerFinal: TDateTimePicker
    Left = 160
    Top = 14
    Width = 81
    Height = 21
    Date = 44618.000000000000000000
    Time = 0.686546087963506600
    TabOrder = 3
  end
end
