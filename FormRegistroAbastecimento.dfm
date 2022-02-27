object FrmRegistroAbastecimento: TFrmRegistroAbastecimento
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Registro de Abastecimentos'
  ClientHeight = 196
  ClientWidth = 344
  Color = clBtnFace
  Constraints.MaxHeight = 235
  Constraints.MaxWidth = 360
  Constraints.MinHeight = 235
  Constraints.MinWidth = 360
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poOwnerFormCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblData: TLabel
    Left = 16
    Top = 8
    Width = 23
    Height = 13
    Caption = 'Data'
  end
  object lblTanque: TLabel
    Left = 103
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Tanque'
  end
  object lblBomba: TLabel
    Left = 255
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Bomba'
  end
  object lblPrecoUnitario: TLabel
    Left = 103
    Top = 56
    Width = 67
    Height = 13
    Caption = 'Pre'#231'o por litro'
  end
  object lblQuantidade: TLabel
    Left = 181
    Top = 56
    Width = 51
    Height = 13
    Caption = 'Qtd. Litros'
  end
  object lblPrecoTotal: TLabel
    Left = 255
    Top = 56
    Width = 54
    Height = 13
    Caption = 'Pre'#231'o Total'
  end
  object lblPercentualDeImposto: TLabel
    Left = 16
    Top = 56
    Width = 53
    Height = 13
    Caption = '% Imposto'
  end
  object btnGravar: TButton
    Left = 255
    Top = 160
    Width = 75
    Height = 25
    Caption = '&Gravar'
    TabOrder = 6
    OnClick = btnGravarClick
  end
  object edtData: TDBEdit
    Left = 16
    Top = 27
    Width = 81
    Height = 21
    TabStop = False
    DataField = 'DATA'
    DataSource = dsAbastecimento
    TabOrder = 0
  end
  object cboTanque: TComboBox
    Left = 103
    Top = 27
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    OnChange = cboTanqueChange
    Items.Strings = (
      '1 - Gasolina'
      '2 - '#211'leo Diesel')
  end
  object edtPrecoUnitario: TDBEdit
    Left = 103
    Top = 75
    Width = 70
    Height = 21
    TabStop = False
    DataField = 'PRECOUNITARIO'
    DataSource = dsAbastecimento
    ReadOnly = True
    TabOrder = 3
  end
  object cboBomba: TDBComboBox
    Left = 255
    Top = 27
    Width = 75
    Height = 21
    Style = csDropDownList
    DataField = 'BOMBA'
    DataSource = dsAbastecimento
    Items.Strings = (
      '1'
      '2')
    TabOrder = 2
  end
  object edtQuantidade: TDBEdit
    Left = 182
    Top = 75
    Width = 67
    Height = 21
    DataField = 'QUANTIDADE'
    DataSource = dsAbastecimento
    TabOrder = 4
    OnChange = edtQuantidadeChange
  end
  object edtPrecoTotal: TEdit
    Left = 255
    Top = 75
    Width = 75
    Height = 21
    TabStop = False
    ReadOnly = True
    TabOrder = 5
  end
  object edtPercentualDeImposto: TDBEdit
    Left = 16
    Top = 75
    Width = 81
    Height = 21
    TabStop = False
    DataField = 'PERCENTUALDEIMPOSTO'
    DataSource = dsAbastecimento
    TabOrder = 7
  end
  object queryAbastecimento: TFDQuery
    SQL.Strings = (
      'Select FIRST 1 * from ABASTECIDA')
    Left = 32
    Top = 120
    object queryAbastecimentoDATA: TDateField
      FieldName = 'DATA'
      Required = True
    end
    object queryAbastecimentoTANQUE: TIntegerField
      DisplayLabel = 'Tanque'
      FieldName = 'TANQUE'
      Required = True
    end
    object queryAbastecimentoBOMBA: TIntegerField
      DisplayLabel = 'Bomba'
      FieldName = 'BOMBA'
      Required = True
    end
    object queryAbastecimentoQUANTIDADE: TBCDField
      DisplayLabel = 'Qtd. Litros'
      FieldName = 'QUANTIDADE'
      Required = True
      DisplayFormat = '#0.00'
      EditFormat = '#0.##'
    end
    object queryAbastecimentoPRECOUNITARIO: TBCDField
      DisplayLabel = 'Pre'#231'o por litro'
      FieldName = 'PRECOUNITARIO'
      Required = True
      DisplayFormat = '#0.000'
    end
    object queryAbastecimentoPERCENTUALDEIMPOSTO: TFMTBCDField
      FieldName = 'PERCENTUALDEIMPOSTO'
      Required = True
      DisplayFormat = '#0.00'
      Size = 2
    end
  end
  object dsAbastecimento: TDataSource
    DataSet = queryAbastecimento
    OnStateChange = dsAbastecimentoStateChange
    Left = 112
    Top = 120
  end
end
