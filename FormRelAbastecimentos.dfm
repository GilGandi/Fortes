object FrmRelAbastecimento: TFrmRelAbastecimento
  Left = 0
  Top = 0
  AlphaBlend = True
  AlphaBlendValue = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Relat'#243'rio de Abastecimentos'
  ClientHeight = 419
  ClientWidth = 815
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RLAbastecimentos: TRLReport
    Left = 8
    Top = 8
    Width = 794
    Height = 1123
    DataSource = DSRelatorio
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btHeader
      object RLLabel1: TRLLabel
        Left = 0
        Top = 3
        Width = 715
        Height = 33
        Alignment = taCenter
        Caption = 'Relat'#243'rio de Abastecimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Layout = tlCenter
        ParentFont = False
      end
      object RLLabel2: TRLLabel
        Left = 3
        Top = 42
        Width = 52
        Height = 16
        Caption = 'Per'#237'odo:'
      end
      object lblPeriodo: TRLLabel
        Left = 61
        Top = 42
        Width = 147
        Height = 16
        Caption = '01/01/2000 a 21/12/2099'
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 113
      Width = 718
      Height = 208
      DataFields = 'DATA'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 40
        BandType = btHeader
        object RLLabel4: TRLLabel
          Left = 3
          Top = 18
          Width = 52
          Height = 16
          Caption = 'Bomba'
        end
        object RLLabel5: TRLLabel
          Left = 75
          Top = 18
          Width = 126
          Height = 16
          Caption = 'Tanque'
        end
        object RLLabel6: TRLLabel
          Left = 220
          Top = 18
          Width = 70
          Height = 16
          Caption = 'Quantidade'
        end
        object RLLabel7: TRLLabel
          Left = 302
          Top = 18
          Width = 86
          Height = 16
          Caption = 'Pre'#231'o Unit'#225'rio'
        end
        object RLLabel8: TRLLabel
          Left = 504
          Top = 18
          Width = 86
          Height = 16
          Caption = 'Pre'#231'o Total'
        end
        object RLLabel9: TRLLabel
          Left = 406
          Top = 18
          Width = 84
          Height = 16
          Caption = '% de Imposto'
        end
        object RLDraw1: TRLDraw
          Left = 3
          Top = 1
          Width = 712
          Height = 18
          Brush.Color = clMedGray
          Color = clMedGray
          ParentColor = False
          Transparent = False
        end
        object RLDBText1: TRLDBText
          Left = 44
          Top = 1
          Width = 38
          Height = 16
          DataField = 'DATA'
          DataSource = DSRelatorio
          Text = ''
        end
        object RLLabel3: TRLLabel
          Left = 3
          Top = 1
          Width = 35
          Height = 16
          Caption = 'Data:'
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 40
        Width = 718
        Height = 24
        object RLDBText2: TRLDBText
          Left = 3
          Top = 5
          Width = 52
          Height = 16
          DataField = 'BOMBA'
          DataSource = DSRelatorio
          Text = ''
        end
        object RLDBText3: TRLDBText
          Left = 75
          Top = 5
          Width = 126
          Height = 16
          DataField = 'TANQUE'
          DataSource = DSRelatorio
          Text = ''
        end
        object RLDBText4: TRLDBText
          Left = 220
          Top = 5
          Width = 70
          Height = 16
          DataField = 'QUANTIDADE'
          DataSource = DSRelatorio
          DisplayMask = '#0.00'
          Text = ''
        end
        object RLDBText5: TRLDBText
          Left = 302
          Top = 5
          Width = 86
          Height = 16
          DataField = 'PRECOUNITARIO'
          DataSource = DSRelatorio
          DisplayMask = '#0.000#'
          Text = ''
        end
        object RLDBText6: TRLDBText
          Left = 504
          Top = 5
          Width = 90
          Height = 16
          DataField = 'PRECOTOTAL'
          DataSource = DSRelatorio
          DisplayMask = '#0.00'
          Text = ''
        end
        object RLDBText7: TRLDBText
          Left = 406
          Top = 5
          Width = 84
          Height = 16
          DataField = 'PERCENTUALDEIMPOSTO'
          DataSource = DSRelatorio
          DisplayMask = '#0.00'
          Text = ''
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 64
        Width = 718
        Height = 25
        BandType = btSummary
        object RLDBResult1: TRLDBResult
          Left = 504
          Top = 6
          Width = 133
          Height = 16
          DataField = 'PRECOTOTAL'
          DataSource = DSRelatorio
          DisplayMask = '0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
          OnCompute = RLDBResult1Compute
        end
        object RLLabel10: TRLLabel
          Left = 379
          Top = 6
          Width = 122
          Height = 16
          Caption = 'Pre'#231'o Total do Dia'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
  end
  object DSRelatorio: TDataSource
    DataSet = queryRelatorio
    Left = 152
    Top = 24
  end
  object queryRelatorio: TFDQuery
    SQL.Strings = (
      'Select'
      'case TANQUE'
      '   when '#39'1'#39' then '#39'1 - GASOLINA'#39
      '   when '#39'2'#39' then '#39'2 - '#211'LEO DIESEL'#39
      '    else'
      '       '#39#39
      '  end as TANQUE,'
      'BOMBA, QUANTIDADE, PRECOUNITARIO, PERCENTUALDEIMPOSTO, DATA,'
      '(PRECOUNITARIO * QUANTIDADE) As PrecoTotal '
      'from ABASTECIDA'
      'Where DATA Between :DataInicio and :DataFim')
    Left = 200
    Top = 24
    ParamData = <
      item
        Name = 'DATAINICIO'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAFIM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
    object queryRelatorioBOMBA: TIntegerField
      FieldName = 'BOMBA'
    end
    object queryRelatorioQUANTIDADE: TBCDField
      FieldName = 'QUANTIDADE'
    end
    object queryRelatorioPRECOUNITARIO: TBCDField
      FieldName = 'PRECOUNITARIO'
    end
    object queryRelatorioPRECOTOTAL: TFMTBCDField
      FieldName = 'PRECOTOTAL'
      Size = 4
    end
    object queryRelatorioPERCENTUALDEIMPOSTO: TFMTBCDField
      FieldName = 'PERCENTUALDEIMPOSTO'
      Size = 2
    end
    object queryRelatorioDATA: TDateField
      FieldName = 'DATA'
    end
    object queryRelatorioTANQUE: TStringField
      FieldName = 'TANQUE'
    end
  end
end
