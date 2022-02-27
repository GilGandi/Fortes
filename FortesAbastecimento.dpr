program FortesAbastecimento;

uses
  Vcl.Forms,
  Configuracoes in 'Configuracoes.pas',
  DataBaseManager in 'DataBaseManager.pas',
  HelpersPosto in 'HelpersPosto.pas',
  FormRegistroAbastecimento in 'FormRegistroAbastecimento.pas' {FrmRegistroAbastecimento},
  FormRelAbastecimentos in 'FormRelAbastecimentos.pas' {FrmRelAbastecimento},
  FormFiltroRelAbastecimentos in 'FormFiltroRelAbastecimentos.pas' {FrmFiltroRelAbastecimentos},
  FormPrincipalPosto in 'FormPrincipalPosto.pas' {FrmPrincipalPosto},
  Tipos in 'Tipos.pas',
  Vcl.Themes,
  Vcl.Styles,
  FormConfiguracoes in 'FormConfiguracoes.pas' {FrmConfiguracoes};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Windows10');
  Application.CreateForm(TFrmPrincipalPosto, FrmPrincipalPosto);
  Application.Run;
end.
