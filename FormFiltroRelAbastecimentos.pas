unit FormFiltroRelAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Tipos;

type
  TFrmFiltroRelAbastecimentos = class(TForm)
    datePickerInicial: TDateTimePicker;
    btnVisualizar: TButton;
    btnImprimir: TButton;
    lblPeriodo: TLabel;
    Label1: TLabel;
    datePickerFinal: TDateTimePicker;
    procedure FormCreate(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    procedure DefineMesAtualParaFiltroDePeriodo;
    procedure FiltraRelatorio;
    procedure ExecutarRelatorio(pTipoGeracao: TTipoGeracaoRelatorio);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmFiltroRelAbastecimentos: TFrmFiltroRelAbastecimentos;

implementation

uses
  DateUtils, FormRelAbastecimentos, HelpersPosto, FireDAC.Stan.Param;

{$R *.dfm}

procedure TFrmFiltroRelAbastecimentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmFiltroRelAbastecimentos := nil;
end;

procedure TFrmFiltroRelAbastecimentos.FormCreate(Sender: TObject);
begin
  DefineMesAtualParaFiltroDePeriodo();
end;

procedure TFrmFiltroRelAbastecimentos.DefineMesAtualParaFiltroDePeriodo;
begin
  datePickerInicial.Date := DateUtils.StartOfTheMonth(Now);
  datePickerFinal.Date := Date;
end;

procedure TFrmFiltroRelAbastecimentos.btnImprimirClick(Sender: TObject);
begin
  ExecutarRelatorio(tgrImprimir);
end;

procedure TFrmFiltroRelAbastecimentos.btnVisualizarClick(Sender: TObject);
begin
  ExecutarRelatorio(tgrVisualizar);
end;

procedure TFrmFiltroRelAbastecimentos.ExecutarRelatorio(pTipoGeracao: TTipoGeracaoRelatorio);
begin
  FrmRelAbastecimento := TFrmRelAbastecimento.Create(nil);
  try
   FiltraRelatorio();

    if pTipoGeracao = tgrVisualizar then
      FrmRelAbastecimento.RLAbastecimentos.Preview(nil)
    else if pTipoGeracao = tgrImprimir then
      FrmRelAbastecimento.RLAbastecimentos.Print;
  finally
    FrmRelAbastecimento.Free;
  end;
end;

procedure TFrmFiltroRelAbastecimentos.FiltraRelatorio();
begin
  with FrmRelAbastecimento do
    begin
      lblPeriodo.Caption := datePickerInicial.Date.ToString + ' até ' +  datePickerFinal.Date.ToString;
      queryRelatorio.Params[0].AsString := datePickerInicial.Date.FirebirdFormat;
      queryRelatorio.Params[1].AsString := datePickerFinal.Date.FirebirdFormat;
      queryRelatorio.Open();
    end;
end;



end.
