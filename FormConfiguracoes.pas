unit FormConfiguracoes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Mask, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.DBCtrls;

type
  TFrmConfiguracoes = class(TForm)
    Label1: TLabel;
    btnGravar: TButton;
    btnCancelar: TButton;
    dsConfig: TDataSource;
    queryConfig: TFDQuery;
    queryConfigPERCENTUALDEIMPOSTO: TFMTBCDField;
    queryConfigPRECOOLEODIESEL: TBCDField;
    queryConfigPRECOGASOLINA: TBCDField;
    lblPrecoGasolina: TLabel;
    edtPercentualDeImposto: TDBEdit;
    edtPrecoGasolina: TDBEdit;
    lblPrecoOleoDiesel: TLabel;
    edtPrecoOleoDiesel: TDBEdit;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnGravarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmConfiguracoes: TFrmConfiguracoes;

implementation

uses
  DataBaseManager;

{$R *.dfm}

procedure TFrmConfiguracoes.btnCancelarClick(Sender: TObject);
begin
  Close();
end;

procedure TFrmConfiguracoes.btnGravarClick(Sender: TObject);
begin
  if not IDados.CamposObrigatoriosEstaoPreenchidos(dsConfig) then
    Exit;

  queryConfig.Post;
  ShowMessage('Configurações salvas com sucesso!');
  Close();
end;

procedure TFrmConfiguracoes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FrmConfiguracoes := nil;
end;

procedure TFrmConfiguracoes.FormCreate(Sender: TObject);
begin
  queryConfig.Connection := FConexao;
  queryConfig.Open();
  if not queryConfig.IsEmpty then
    queryConfig.Edit;
end;

procedure TFrmConfiguracoes.FormShow(Sender: TObject);
begin
  if Self.Visible and edtPercentualDeImposto.CanFocus then
    edtPercentualDeImposto.SetFocus();
end;

end.
