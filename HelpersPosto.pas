unit HelpersPosto;

interface

type
  THelperString = record helper for
    string
    function RemoverPrimeiroCaractere: string;
    function Concatenar(pTextoAdicional: string): string;
  end;

type
  THelperDate = record helper for TDate
    function ToString: string;
    function FirebirdFormat: string;
end;

implementation

uses
  StrUtils, SysUtils;

{ TEditDocumento }

function THelperString.Concatenar(pTextoAdicional: string): string;
begin
  Result := Self + pTextoAdicional;
end;

function THelperString.RemoverPrimeiroCaractere: string;
begin
  Result := Copy(Self, 2, Length(Self));
end;

{ THelperDate }

function THelperDate.ToString: string;
begin
  Result := DateToStr(Self);
end;

function THelperDate.FirebirdFormat: string;
begin
  Result := FormatDateTime('YYYY-MM-DD', Self);
end;

end.
