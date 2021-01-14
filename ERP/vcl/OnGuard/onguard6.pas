{*********************************************************}
{*                  ONGUARD6.PAS 1.13                    *}
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

unit OnGuard6;
  {-Code generation dialog}

interface

uses
  {$IFDEF Win32} Windows, ComCtrls, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Mask,
  ExtCtrls, Tabnotbk, StdCtrls, Buttons, Messages, OgConst, OgUtil, OnGuard,
{$IFDEF VERSION6}                                                      {!!.13}
  DesignIntf,
  DesignEditors;
{$ELSE}
  dsgnintf;
{$ENDIF}


type
  TModifierFrm = class(TForm)
    OKBtn: TBitBtn;
    CancelBtn: TBitBtn;
    GroupBox1: TGroupBox;
    UniqueModifierCb: TCheckBox;
    MachineModifierCb: TCheckBox;
    DateModifierCb: TCheckBox;
    NoModifierCb: TCheckBox;
    ModifierEd: TEdit;
    ModDateEd: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ModifierClick(Sender: TObject);
    procedure ModifierEdKeyPress(Sender: TObject; var Key: Char);
    procedure DateEdKeyPress(Sender: TObject; var Key: Char);
    procedure InfoChanged(Sender: TObject);
  private
  public
    Modifier : LongInt;
  end;


type
  {property editor for ranges}
  TOgModifierProperty = class(TStringProperty)
  public
    function GetAttributes: TPropertyAttributes;
      override;
    function GetValue : string;
      override;
    procedure Edit;
      override;
  end;


implementation

{$R *.DFM}

procedure TModifierFrm.FormCreate(Sender: TObject);
begin
  NoModifierCb.Checked := True;
  ModDateEd.Text := OgFormatDate(Date);                              {!!.09}

  InfoChanged(nil);
end;

procedure TModifierFrm.ModifierClick(Sender: TObject);
const
  Busy : Boolean = False;
var
  L : LongInt;
  D : TDateTime;
begin
  if Busy then
    Exit;

  {set busy flag so that setting "Checked" won't recurse}
  Busy := True;
  try
    L := 0;

    if (Sender = NoModifierCb) and NoModifierCb.Checked then begin
      UniqueModifierCb.Checked := False;
      MachineModifierCb.Checked := False;
      DateModifierCb.Checked := False;
    end else
      NoModifierCb.Checked := False;

    if not UniqueModifierCb.Checked and
       not MachineModifierCb.Checked and
       not DateModifierCb.Checked then
      NoModifierCb.Checked := True;

    if MachineModifierCb.Checked then begin
      if L = 0 then
        L := GenerateMachineModifierPrim
      else
        L := L xor GenerateMachineModifierPrim;
    end;

    {set status of date field}
    ModDateEd.Enabled := DateModifierCb.Checked;
    if ModDateEd.Enabled then
      ModDateEd.Color := clWindow
    else
      ModDateEd.Color := clBtnFace;

    if DateModifierCb.Checked then begin
      try
        D := StrToDate(ModDateEd.Text);
      except
        {ignore errors and don't generate modifier}
        D := 0;
      end;

      if Trunc(D) > 0 then begin
        if L = 0 then
          L := GenerateDateModifierPrim(D)
        else
          L := L xor GenerateDateModifierPrim(D);
      end;
    end;

    if UniqueModifierCb.Checked then begin
      if L = 0 then
        L := GenerateUniqueModifierPrim
      else
        L := L xor GenerateUniqueModifierPrim;
    end;

    if L = 0 then
      ModifierEd.Text := ''
    else
      ModifierEd.Text := '$' + BufferToHex(L, 4);

    InfoChanged(nil);
  finally
    Busy := False;
  end;
end;

procedure TModifierFrm.DateEdKeyPress(Sender: TObject; var Key: Char);
const
  CIntChars = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '/'];
begin
  if (not (Key in CIntChars)) and (not (Key < #32)) then begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TModifierFrm.ModifierEdKeyPress(Sender: TObject; var Key: Char);
const
  CHexChars = ['$', 'A', 'B', 'C', 'D', 'E', 'F', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
begin
  if (not (Key in CHexChars)) and (not (Key < #32)) then begin
    MessageBeep(0);
    Key := #0;
  end;
end;

procedure TModifierFrm.InfoChanged(Sender: TObject);
begin
  OKBtn.Enabled := (Length(ModifierEd.Text) > 0) and
    HexToBuffer(ModifierEd.Text, Modifier, SizeOf(Modifier));
end;

{*** TOgModifierProperty ***}

function TOgModifierProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog];
end;

function TOgModifierProperty.GetValue : string;
begin
  Result := inherited GetValue;
end;

procedure TOgModifierProperty.Edit;
begin
  with TModifierFrm.Create(Application) do
    try
      if ShowModal = mrOK then
        Value := BufferToHex(Modifier, SizeOf(Modifier));
    finally
      Free;
    end;
end;

end.
