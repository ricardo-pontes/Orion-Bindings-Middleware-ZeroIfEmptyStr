unit Orion.Bindings.Middleware.ZeroIfEmptyStr;

interface

uses
  System.Rtti,
  System.SysUtils,
  Orion.Bindings.Middleware;

procedure ZeroIfEmptyStr(var aValue : TValue; aState : OrionBindingsMiddlewareState);

implementation

procedure ZeroIfEmptyStr(var aValue : TValue; aState : OrionBindingsMiddlewareState);
var
  lValue : string;
begin
  if aState = OrionBindingsMiddlewareState.BindToEntity then begin
    if aValue.Kind in [tkString, tkWChar, tkLString, tkWString, tkUString, tkAnsiChar, tkWideChar, tkUnicodeString, tkAnsiString, tkWideString, tkShortString] then begin
      if aValue.ToString.IsEmpty then begin
        lValue := '0';
        aValue := lValue;
      end;
    end;
  end;
end;
end.
