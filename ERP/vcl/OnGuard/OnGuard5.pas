{*********************************************************}
{*                  ONGUARD5.PAS 1.13                    *}
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

unit OnGuard5;

interface

uses
  Controls,
  Forms,
  OnGuard,
{$IFDEF VERSION6}                                                      {!!.11}
  DesignIntf,
  DesignEditors;
{$ELSE}
  dsgnintf;
{$ENDIF}


type
  {property editor for ranges}
  TOgCodeProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes;
      override;
    function GetValue : string;
      override;
    procedure Edit;
      override;
  end;

implementation

uses
  OgConst,
  OgUtil,
  Onguard2;

{*** TOgCodeProperty ***}

function TOgCodeProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

function TOgCodeProperty.GetValue : string;
begin
  Result := inherited GetValue;
end;

procedure TOgCodeProperty.Edit;
var
  Work : TCode;
begin
  with TCodeGenerateFrm.Create(Application) do
    try
      ShowHint := True;
      KeyFileName := OgKeyFile;
      if ShowModal = mrOK then begin
        Work := Code;
        Value := BufferToHex(Work, SizeOf(Work));
      end;
    finally
      Free;
    end;
end;


end.
