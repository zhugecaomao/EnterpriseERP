{*********************************************************}
{*                   OGREG.PAS 1.13                      *}
{*     Copyright (c) 1996-02 TurboPower Software Co      *}
{*                 All rights reserved.                  *}
{*********************************************************}

{$I ONGUARD.INC}

{$B-} {Complete Boolean Evaluation}
{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{$W-} {Windows Stack Frame}
{$X+} {Extended Syntax}

{$IFNDEF Win32}
{$G+} {286 Instructions}
{$N+} {Numeric Coprocessor}

{$C MOVEABLE,DEMANDLOAD,DISCARDABLE}
{$ENDIF}

unit OgReg;

{$IFDEF Win32}
  {$IFNDEF VER93}
    {$R OGREG.R32}
  {$ENDIF}
{$ELSE}
  {$R OGREG.R16}
{$ENDIF}

interface

procedure Register;

implementation

uses
  Classes, Forms,
  OgAbout0, OgConst, OgFile, OgNetWrk, OgProExe, OgFirst,
  OnGuard,
  OnGuard2,
  OnGuard3,
  OnGuard5,
  OnGuard6,
  OnGuard7,
  OgUtil,                                                            {!!.12}
{$IFDEF VERSION6}                                                      {!!.13}
  DesignIntf,
  DesignEditors;
{$ELSE}
  dsgnintf;
{$ENDIF}

type
  {component editor for TogCodeBase components}
  TOgCodeGenEditor = class(TDefaultEditor)
  public
    procedure ExecuteVerb(Index : Integer);
      override;
    function GetVerb(Index : Integer) : string;
      override;
    function GetVerbCount : Integer;
      override;
  end;


{*** TOgCodeGenEditor ***}

procedure TOgCodeGenEditor.ExecuteVerb(Index : Integer);
begin
  if Index = 0 then begin
    with TCodeGenerateFrm.Create(Application) do
      try
        ShowHint := True;
        KeyFileName := OgKeyFile;
        if Component is TOgDateCode then
          CodeType := ctDate
        else if Component is TOgDaysCode then
          CodeType := ctDays
        else if Component is TOgNetCode then
          CodeType := ctNetwork
        else if Component is TOgRegistrationCode then
          CodeType := ctRegistration
        else if Component is TOgSerialNumberCode then
          CodeType := ctSerialNumber
        else if Component is TOgSpecialCode then
          CodeType := ctSpecial
        else if Component is TOgUsageCode then
          CodeType := ctUsage;
        ShowModal;
      finally
        Free;
      end;
  end else if Index = 1 then begin
    with TKeyMaintFrm.Create(Application) do
      try
        ShowHint := True;
        KeyFileName := 'ONGUARD.INI';
        KeyType := ktRandom;
        ShowModal;
      finally
        Free;
      end;
  end;
end;

function TOgCodeGenEditor.GetVerb(Index : Integer) : string;
begin
  case Index of
    0 : Result := 'Generate Code';
    1 : Result := 'Generate Key';
  else
    Result := '?';
  end;
end;

function TOgCodeGenEditor.GetVerbCount : Integer;
begin
  Result := 2;
end;


{component registration}
procedure Register;
begin
  RegisterComponentEditor(TOgCodeBase, TOgCodeGenEditor);

  RegisterPropertyEditor(
    TypeInfo(string), TOgMakeKeys, 'KeyFileName', TOgFileNameProperty);
  RegisterPropertyEditor(
    TypeInfo(string), TOgMakeCodes, 'KeyFileName', TOgFileNameProperty);
{  RegisterPropertyEditor( }                                          {!!.09}
{    TypeInfo(string), TOgCodeBase, 'Expires', TOgExpiresProperty);}  {!!.09}
  RegisterPropertyEditor(
    TypeInfo(string), TOgCodeBase, 'Code', TOgCodeProperty);
  RegisterPropertyEditor(
    TypeInfo(string), TOgCodeBase, 'Modifier', TOgModifierProperty);
  RegisterPropertyEditor(
    TypeInfo(string), TOgCodeBase, 'About', TOgAboutProperty);       {!!.08}
  RegisterPropertyEditor(
    TypeInfo(string), TOgProtectExe, 'About', TOgAboutProperty);     {!!.08}
  RegisterPropertyEditor(
    TypeInfo(string), TOgMakeCodes, 'About', TOgAboutProperty);      {!!.08}
  RegisterPropertyEditor(
    TypeInfo(string), TOgMakeKeys, 'About', TOgAboutProperty);       {!!.08}

  RegisterComponents('OnGuard', [
    TOgMakeKeys,
    TOgMakeCodes,
    TOgDateCode,
    TOgDaysCode,
    TOgNetCode,
    TOgRegistrationCode,
    TOgSerialNumberCode,
    TOgSpecialCode,
    TOgUsageCode,
    TOgProtectExe]);
end;

end.