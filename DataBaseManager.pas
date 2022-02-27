unit DataBaseManager;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Rtti, FireDAC.Phys.FB, Data.DB;

type
  IConexao = class

  private
    class function BancoExiste(): Boolean;
    class procedure ConectarComFirebird();

  public
    class procedure Iniciar();
  end;

type
  IDados = class
  public
    class function ObterPrimeiroRegistroPorColuna(pNomeColuna: string): string;
    class procedure IniciarNovoRegistro(pQuery: TFDQuery);
    class function CamposObrigatoriosEstaoPreenchidos(DataSource: TDataSource): Boolean;

  end;

const
  FUsuarioBanco = 'sysdba';
  FSenhaBanco = 'masterkey';

var
  FConexao: TFDConnection;
  FDriverFirebird: TFDPhysFBDriverLink;
  FLocalizacaoBanco: string;

implementation

uses
  HelpersPosto, Vcl.Dialogs;

{ TConexao }

class procedure IConexao.Iniciar;
begin
  if BancoExiste() then
    ConectarComFirebird()
  else
    raise Exception.Create('Banco não foi encontrado em '.Concatenar(FLocalizacaoBanco));
end;

class function IConexao.BancoExiste: Boolean;
begin
  Result := FileExists(FLocalizacaoBanco);
end;

class procedure IConexao.ConectarComFirebird;
begin
  if not Assigned(FDriverFirebird) then
  begin
    FDriverFirebird := TFDPhysFBDriverLink.Create(nil);
    FDriverFirebird.DriverID := 'FBEmbedded';
    FDriverFirebird.Embedded := True;
  end;

  if not Assigned(FConexao) then
    FConexao := TFDConnection.Create(nil);

  FConexao.Close;

  FConexao.LoginPrompt := False;

  with FConexao.Params do
    begin
      DriverID := 'FB';
      Database := FLocalizacaoBanco;
      UserName := FUsuarioBanco;
      Password := FSenhaBanco;
    end;

  try
    FConexao.Connected := True;
  Except
    on E: Exception do
      raise Exception.Create(E.Message);
  end;
end;

class function IDados.ObterPrimeiroRegistroPorColuna(pNomeColuna: string): string;
var
  lContextoRtti: TRttiContext;
  lDadosClasse: TRttiType;
  lNomeTabela: string;
  lFDScript: TFDQuery;
begin
  lContextoRtti := TRttiContext.Create();
  try
    lDadosClasse := lContextoRtti.GetType(Self);
    lNomeTabela := lDadosClasse.Name.RemoverPrimeiroCaractere;

    lFDScript := TFDQuery.Create(nil);
    try
      lFDScript.Connection := FConexao;
      lFDScript.SQL.Text := 'Select ' + pNomeColuna + ' From ' + lNomeTabela;

      try
        lFDScript.Open();
        Result := lFDScript.Fields[0].Value;
      except
        on E: Exception do
          raise Exception.Create(E.Message);
      end;
    finally
      lFDScript.Free();
    end;
  finally
    lContextoRtti.Free();
  end;
end;

class procedure IDados.IniciarNovoRegistro(pQuery: TFDQuery);
begin
  if pQuery.Active then
    begin
      if not(pQuery.State in [dsInsert, dsEdit]) then
        pQuery.Insert
      else
        pQuery.CancelUpdates;
    end
  else
    begin
      pQuery.Open();
      pQuery.Insert;
    end;
end;

class function IDados.CamposObrigatoriosEstaoPreenchidos(DataSource: TDataSource) : Boolean;
var
  i : Integer;
Begin
  Result := False;

  for i := 0 to DataSource.DataSet.FieldCount -1 do
    if DataSource.DataSet.Fields[i].Required and (DataSource.DataSet.Fields[i].IsNull) or (DataSource.DataSet.Fields[i].AsString = '') then
      begin
        ShowMessage('Deve ser informado um valor para "'.Concatenar(DataSource.DataSet.Fields[i].DisplayLabel).Concatenar('"'));
        DataSource.DataSet.Fields[i].FocusControl;
        Exit;
      end;

  Result := True;
end;

Initialization

FLocalizacaoBanco := GetCurrentDir() + '\Banco\' + 'Posto.FDB';

Finalization

FConexao.Free();
FDriverFirebird.Free();

end.
