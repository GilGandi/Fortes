unit FormRegistroAbastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Comp.ScriptCommands, FireDAC.Stan.Util, FireDAC.Comp.Script,
  Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TFrmRegistroAbastecimento = class(TForm)
    btnGravar: TButton;
    queryAbastecimento: TFDQuery;
    edtData: TDBEdit;
    dsAbastecimento: TDataSource;
    lblData: TLabel;
    queryAbastecimentoDATA: TDateField;
    queryAbastecimentoTANQUE: TIntegerField;
    queryAbastecimentoBOMBA: TIntegerField;
    queryAbastecimentoQUANTIDADE: TBCDField;
    queryAbastecimentoPRECOUNITARIO: TBCDField;
    queryAbastecimentoPERCENTUALDEIMPOSTO: TFMTBCDField;
    cboTanque: TComboBox;
    edtPrecoUnitario: TDBEdit;
    lblTanque: TLabel;
    lblBomba: TLabel;
    cboBomba: TDBComboBox;
    lblPrecoUnitario: TLabel;
    edtQuantidade: TDBEdit;
    lblQuantidade: TLabel;
    lblPrecoTotal: TLabel;
    edtPrecoTotal: TEdit;
    lblPercentualDeImposto: TLabel;
    edtPercentualDeImposto: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure cboTanqueChange(Sender: TObject);
    procedure edtQuantidadeChange(Sender: TObject);
    procedure dsAbastecimentoStateChange(Sender: TObject);
  private
    procedure CapturarPrecoCombustivel;
    procedure AtualizaPrecoTotal;
    procedure DefinirDadosPadraoParaTela;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmRegistroAbastecimento: TFrmRegistroAbastecimento;

implementation

{$R *.dfm}

uses
  DataBaseManager, Configuracoes;

procedure TFrmRegistroAbastecimento.btnGravarClick(Sender: TObject);
begin
  if not IDados.CamposObrigatoriosEstaoPreenchidos(dsAbastecimento) then
    Exit;

  queryAbastecimento.Post;
  IDados.IniciarNovoRegistro(queryAbastecimento);
  ShowMessage('Registro inserido com sucesso!');
end;

procedure TFrmRegistroAbastecimento.CapturarPrecoCombustivel;
begin
  case cboTanque.ItemIndex of
    0:
      queryAbastecimentoPRECOUNITARIO.AsString := IConfiguracoes.ObterPrimeiroRegistroPorColuna('PrecoGasolina');
    1:
      queryAbastecimentoPRECOUNITARIO.AsString := IConfiguracoes.ObterPrimeiroRegistroPorColuna('PrecoOleoDiesel');
  end;
end;

procedure TFrmRegistroAbastecimento.cboTanqueChange(Sender: TObject);
begin
  if queryAbastecimento.State = dsInsert then
    begin
      CapturarPrecoCombustivel();
      queryAbastecimentoTANQUE.AsInteger := cboTanque.ItemIndex + 1;
    end;
end;

procedure TFrmRegistroAbastecimento.dsAbastecimentoStateChange(Sender: TObject);
begin
  if dsAbastecimento.DataSet.State = dsInsert then
    begin
      DefinirDadosPadraoParaTela();

      if Self.Visible and cboTanque.CanFocus then
        cboTanque.SetFocus;
    end;
end;

procedure TFrmRegistroAbastecimento.DefinirDadosPadraoParaTela;
begin
  queryAbastecimentoDATA.AsDateTime := Date;
  queryAbastecimentoPERCENTUALDEIMPOSTO.AsString := IConfiguracoes.ObterPrimeiroRegistroPorColuna('PercentualDeImposto');
  cboTanque.ItemIndex := -1;
  edtPrecoTotal.Text := EmptyStr;
end;

procedure TFrmRegistroAbastecimento.edtQuantidadeChange(Sender: TObject);
begin
  if queryAbastecimento.State = dsInsert then
    AtualizaPrecoTotal();
end;

procedure TFrmRegistroAbastecimento.AtualizaPrecoTotal;
begin
  if (queryAbastecimentoPRECOUNITARIO.AsFloat <= 0) or (edtQuantidade.Text = '') then
    edtPrecoTotal.Text := ''
  else
    edtPrecoTotal.Text := FormatFloat('0.00', queryAbastecimentoPRECOUNITARIO.AsFloat * StrToFloat(edtQuantidade.Text));
end;

procedure TFrmRegistroAbastecimento.FormCreate(Sender: TObject);
begin
  queryAbastecimento.Connection := FConexao;
  IDados.IniciarNovoRegistro(queryAbastecimento);
end;

procedure TFrmRegistroAbastecimento.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FrmRegistroAbastecimento := nil;
end;

end.
