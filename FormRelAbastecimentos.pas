unit FormRelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TFrmRelAbastecimento = class(TForm)
    RLAbastecimentos: TRLReport;
    DSRelatorio: TDataSource;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    queryRelatorio: TFDQuery;
    queryRelatorioBOMBA: TIntegerField;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLLabel4: TRLLabel;
    RLDBText2: TRLDBText;
    queryRelatorioQUANTIDADE: TBCDField;
    lblPeriodo: TRLLabel;
    RLLabel5: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel6: TRLLabel;
    RLDBText4: TRLDBText;
    queryRelatorioPRECOUNITARIO: TBCDField;
    RLLabel7: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText6: TRLDBText;
    RLLabel9: TRLLabel;
    RLDBText7: TRLDBText;
    queryRelatorioPRECOTOTAL: TFMTBCDField;
    queryRelatorioPERCENTUALDEIMPOSTO: TFMTBCDField;
    RLBand4: TRLBand;
    queryRelatorioDATA: TDateField;
    RLDraw1: TRLDraw;
    RLDBText1: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel10: TRLLabel;
    queryRelatorioTANQUE: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RLDBResult1Compute(Sender: TObject; var Value: Variant;
      var AText: string; var ComputeIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRelAbastecimento: TFrmRelAbastecimento;

implementation

uses
  DataBaseManager;

{$R *.dfm}

procedure TFrmRelAbastecimento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmRelAbastecimento := nil;
end;

procedure TFrmRelAbastecimento.FormCreate(Sender: TObject);
begin
  queryRelatorio.Close();
  queryRelatorio.Connection := FConexao;
end;

procedure TFrmRelAbastecimento.RLDBResult1Compute(Sender: TObject;
  var Value: Variant; var AText: string; var ComputeIt: Boolean);
begin
  Value := queryRelatorioPRECOTOTAL.AsCurrency;
end;

end.
