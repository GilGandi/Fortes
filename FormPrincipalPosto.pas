unit FormPrincipalPosto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TFrmPrincipalPosto = class(TForm)
    imgAbastecimento: TImage;
    lblAbastecimentos: TLabel;
    imgRelatorio: TImage;
    lblRelatorio: TLabel;
    lblConfiguracoes: TLabel;
    imgConfiguracoes: TImage;
    procedure FormCreate(Sender: TObject);
    procedure ConectarComBanco;
    procedure imgAbastecimentoClick(Sender: TObject);
    procedure lblAbastecimentosClick(Sender: TObject);
    procedure imgConfiguracoesClick(Sender: TObject);
    procedure imgRelatorioClick(Sender: TObject);
    procedure lblConfiguracoesClick(Sender: TObject);
  private
    procedure AbrirJanelaAbastecimentos;
    procedure AbrirJanelaRelAbastecimento;
    procedure AbrirJanelaConfiguracoes;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipalPosto: TFrmPrincipalPosto;

implementation

uses
  DataBaseManager, FormRegistroAbastecimento, FormFiltroRelAbastecimentos, FormConfiguracoes;

{$R *.dfm}

procedure TFrmPrincipalPosto.FormCreate(Sender: TObject);
begin
  ConectarComBanco();
end;

procedure TFrmPrincipalPosto.ConectarComBanco;
begin
  try
    IConexao.Iniciar();
  except
    on E: Exception do
    begin
      ShowMessage('Ocorreu um problema ao conectar com o banco.' + #13 +
        'Mensagem do erro: ' + E.Message);
      Application.Terminate;
    end;
  end;
end;

procedure TFrmPrincipalPosto.imgAbastecimentoClick(Sender: TObject);
begin
  AbrirJanelaAbastecimentos();
end;

procedure TFrmPrincipalPosto.lblAbastecimentosClick(Sender: TObject);
begin
  AbrirJanelaAbastecimentos();
end;

procedure TFrmPrincipalPosto.AbrirJanelaAbastecimentos;
begin
  if not Assigned(FrmRegistroAbastecimento) then
    FrmRegistroAbastecimento := TFrmRegistroAbastecimento.Create(Application);
  FrmRegistroAbastecimento.Show();
end;

procedure TFrmPrincipalPosto.imgRelatorioClick(Sender: TObject);
begin
  AbrirJanelaRelAbastecimento();
end;

procedure TFrmPrincipalPosto.AbrirJanelaRelAbastecimento;
begin
  if not Assigned(FrmFiltroRelAbastecimentos) then
    FrmFiltroRelAbastecimentos := TFrmFiltroRelAbastecimentos.Create(Application);
  FrmFiltroRelAbastecimentos.Show();
end;

procedure TFrmPrincipalPosto.lblConfiguracoesClick(Sender: TObject);
begin
  AbrirJanelaConfiguracoes();
end;

procedure TFrmPrincipalPosto.imgConfiguracoesClick(Sender: TObject);
begin
  AbrirJanelaConfiguracoes();
end;

procedure TFrmPrincipalPosto.AbrirJanelaConfiguracoes;
begin
  if not Assigned(FrmConfiguracoes) then
    FrmConfiguracoes := TFrmConfiguracoes.Create(Application);
  FrmConfiguracoes.Show();
end;

end.
