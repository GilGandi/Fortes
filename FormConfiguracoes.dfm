object FrmConfiguracoes: TFrmConfiguracoes
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Configura'#231#245'es'
  ClientHeight = 152
  ClientWidth = 226
  Color = clBtnFace
  Constraints.MaxHeight = 191
  Constraints.MaxWidth = 242
  Constraints.MinHeight = 191
  Constraints.MinWidth = 242
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 112
    Height = 13
    Caption = 'Percentual de Imposto:'
  end
  object lblPrecoGasolina: TLabel
    Left = 16
    Top = 51
    Width = 74
    Height = 13
    Caption = 'Pre'#231'o Gasolina:'
  end
  object lblPrecoOleoDiesel: TLabel
    Left = 16
    Top = 78
    Width = 87
    Height = 13
    Caption = 'Pre'#231'o '#211'leo Diesel:'
  end
  object btnGravar: TButton
    Left = 134
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Gravar'
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object btnCancelar: TButton
    Left = 53
    Top = 112
    Width = 75
    Height = 25
    Caption = '&Cancelar'
    TabOrder = 4
    TabStop = False
    OnClick = btnCancelarClick
  end
  object edtPercentualDeImposto: TDBEdit
    Left = 134
    Top = 21
    Width = 75
    Height = 21
    DataField = 'PERCENTUALDEIMPOSTO'
    DataSource = dsConfig
    TabOrder = 0
  end
  object edtPrecoGasolina: TDBEdit
    Left = 134
    Top = 48
    Width = 75
    Height = 21
    DataField = 'PRECOGASOLINA'
    DataSource = dsConfig
    TabOrder = 1
  end
  object edtPrecoOleoDiesel: TDBEdit
    Left = 134
    Top = 75
    Width = 75
    Height = 21
    DataField = 'PRECOOLEODIESEL'
    DataSource = dsConfig
    TabOrder = 2
  end
  object dsConfig: TDataSource
    DataSet = queryConfig
    Left = 184
    Top = 56
  end
  object queryConfig: TFDQuery
    SQL.Strings = (
      'Select FIRST 1 * from CONFIGURACOES')
    Left = 184
    object queryConfigPERCENTUALDEIMPOSTO: TFMTBCDField
      DisplayLabel = 'Percentual de Imposto'
      FieldName = 'PERCENTUALDEIMPOSTO'
      Required = True
      DisplayFormat = '#0.00'
      Size = 2
    end
    object queryConfigPRECOOLEODIESEL: TBCDField
      DisplayLabel = 'Pre'#231'o '#211'leo Diesel'
      FieldName = 'PRECOOLEODIESEL'
      Required = True
    end
    object queryConfigPRECOGASOLINA: TBCDField
      DisplayLabel = 'Pre'#231'o Gasolina'
      FieldName = 'PRECOGASOLINA'
      Required = True
    end
  end
end
