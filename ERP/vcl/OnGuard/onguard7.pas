{*********************************************************}
{*                  ONGUARD7.PAS 1.13                    *}
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

unit OnGuard7;
  {-File name property editor}

interface

uses
  Dialogs, Forms,
{$IFDEF VERSION6}                                                      {!!.13}
  DesignIntf,
  DesignEditors;
{$ELSE}
  dsgnintf;
{$ENDIF}


type
  {property editor for ranges}
  TOgFileNameProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes;
      override;
    function GetValue : string;
      override;
    procedure Edit;
      override;
  end;


implementation


{*** TOgFileNameProperty ***}

function TOgFileNameProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

function TOgFileNameProperty.GetValue : string;
begin
  Result := inherited GetValue;
end;

procedure TOgFileNameProperty.Edit;
var
  D : TOpenDialog;
begin
  D := TOpenDialog.Create(Application);
  try
    D.DefaultExt := '*.ini';
    D.Filter := 'Ini Files (*.ini)|*.ini|Text Files (*.txt)|*.txt|All Files (*.*)|*.*';
    D.FilterIndex := 0;
    D.Options := [ofHideReadOnly];
    D.Title := 'Select File Name';
    D.FileName := Value;
    if D.Execute then
      Value := D.FileName;
  finally
    D.Free;
  end;
end;

end.