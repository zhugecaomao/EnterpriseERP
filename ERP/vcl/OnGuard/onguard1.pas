{*********************************************************}
{*                  ONGUARD1.PAS 1.13                    *}
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

unit OnGuard1;
  {-Key generation dialog}

interface

uses
  {$IFDEF Win32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  SysUtils, Classes, Controls, Forms, Dialogs, Graphics, Buttons, ExtCtrls, StdCtrls,
  OgUtil, OnGuard;

type
  TKeyGenerateFrm = class(TForm)
    Panel1: TPanel;
    Label2: TLabel;
    CopyBlockSb: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    CopyByteKeySb: TSpeedButton;
    KeyStringMe: TMemo;
    BlockKeyEd: TEdit;
    GenerateBtn: TButton;
    KeyTypeCb: TComboBox;
    ByteKeyEd: TEdit;
    CancelBtn: TBitBtn;
    OKBtn: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure KeyStringMeChange(Sender: TObject);
    procedure KeyTypeCbChange(Sender: TObject);
    procedure BlockKeyEdChange(Sender: TObject);
    procedure CopyBlockSbClick(Sender: TObject);
    procedure ByteKeyEdChange(Sender: TObject);
    procedure CopyByteKeySbClick(Sender: TObject);
    procedure GenerateBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FKey     : TKey;
    FKeyType : TKeyType;

    procedure SetKeyType(Value : TKeyType);

  public
    { Public declarations }                                          
    procedure SetKey(Value : TKey);                                  {!!.08}
    procedure GetKey(var Value : TKey);                              {!!.08}

    property KeyType : TKeyType
      read FKeyType
      write SetKeyType;

  end;


implementation

{$R *.DFM}

procedure TKeyGenerateFrm.FormCreate(Sender: TObject);
begin
  KeyTypeCb.ItemIndex := Ord(FKeyType);

  {set state of memo and generate button}
  KeyStringMe.Enabled := (KeyTypeCb.ItemIndex <> 0);
  case KeyStringMe.Enabled of
    True  : KeyStringMe.Color := clWindow;
    False : KeyStringMe.Color := clBtnFace;
  end;

  GenerateBtn.Enabled := (KeyTypeCb.ItemIndex = 0) or
    (KeyStringMe.Lines.Count > 0);
end;

procedure TKeyGenerateFrm.KeyStringMeChange(Sender: TObject);
begin
  BlockKeyEd.Text := '';
  ByteKeyEd.Text := '';

  {set state of generate button}
  GenerateBtn.Enabled := (KeyTypeCb.ItemIndex = 0) or
    (KeyStringMe.Lines.Count > 0);
end;

procedure TKeyGenerateFrm.KeyTypeCbChange(Sender: TObject);
begin
  BlockKeyEd.Text := '';
  ByteKeyEd.Text := '';

  {set state of memo and generate button}
  KeyStringMe.Enabled := (KeyTypeCb.ItemIndex <> 0);
  case KeyStringMe.Enabled of
    True  : KeyStringMe.Color := clWindow;
    False : KeyStringMe.Color := clBtnFace;
  end;
  GenerateBtn.Enabled := (KeyTypeCb.ItemIndex = 0) or
    (KeyStringMe.Lines.Count > 0);

  if KeyTypeCb.ItemIndex > -1 then
    FKeyType := TKeyType(KeyTypeCb.ItemIndex);
end;

procedure TKeyGenerateFrm.BlockKeyEdChange(Sender: TObject);
begin
  CopyBlockSb.Enabled := (BlockKeyEd.Text <> '');
end;

procedure TKeyGenerateFrm.CopyBlockSbClick(Sender: TObject);
var
  OldSelStart: Integer;
begin
  if (BlockKeyEd.SelLength > 0) then
    BlockKeyEd.CopyToClipboard
  else begin
    OldSelStart := BlockKeyEd.SelStart;
    BlockKeyEd.SelStart := 0;
    BlockKeyEd.SelLength := MaxInt;
    BlockKeyEd.CopyToClipboard;
    BlockKeyEd.SelStart := OldSelStart;
    BlockKeyEd.SelLength := 0;
  end;
end;

procedure TKeyGenerateFrm.ByteKeyEdChange(Sender: TObject);
begin
  CopyByteKeySb.Enabled := (ByteKeyEd.Text <> '');
end;

procedure TKeyGenerateFrm.CopyByteKeySbClick(Sender: TObject);
var
  OldSelStart: Integer;
begin
  if (ByteKeyEd.SelLength > 0) then
    ByteKeyEd.CopyToClipboard
  else begin
    OldSelStart := ByteKeyEd.SelStart;
    ByteKeyEd.SelStart := 0;
    ByteKeyEd.SelLength := MaxInt;
    ByteKeyEd.CopyToClipboard;
    ByteKeyEd.SelStart := OldSelStart;
    ByteKeyEd.SelLength := 0;
  end;
end;

procedure TKeyGenerateFrm.GenerateBtnClick(Sender: TObject);
begin
  case KeyTypeCb.ItemIndex of
    0:
      begin
        Screen.Cursor := crHourGlass;
        try
          GenerateRandomKeyPrim(FKey, SizeOf(FKey));
          BlockKeyEd.Text := BufferToHex(FKey, SizeOf(FKey));
          ByteKeyEd.Text := BufferToHexBytes(FKey, SizeOf(FKey));
        finally
          Screen.Cursor := crDefault;
        end;
      end;
    1:
      begin
        GenerateTMDKeyPrim(FKey, SizeOf(FKey), AnsiUpperCase(KeyStringMe.Text));
        BlockKeyEd.Text := BufferToHex(FKey, SizeOf(FKey));
        ByteKeyEd.Text := BufferToHexBytes(FKey, SizeOf(FKey));
      end;
    2:
      begin
        GenerateTMDKeyPrim(FKey, SizeOf(FKey), KeyStringMe.Text);
        BlockKeyEd.Text := BufferToHex(FKey, SizeOf(FKey));
        ByteKeyEd.Text := BufferToHexBytes(FKey, SizeOf(FKey));
      end;
  end;
end;

procedure TKeyGenerateFrm.SetKeyType(Value : TKeyType);
begin
  if Value <> FKeyType then begin
    FKeyType := Value;
    KeyTypeCb.ItemIndex := Ord(FKeyType);
  end;
end;

procedure TKeyGenerateFrm.GetKey(var Value : TKey);
begin
  Value := FKey;
end;

procedure TKeyGenerateFrm.SetKey(Value : TKey);
begin
  FKey := Value;
end;


procedure TKeyGenerateFrm.FormShow(Sender: TObject);
begin
  KeyTypeCbChange(Sender);
end;

end.

