{*********************************************************}
{*                  ONGUARD4.PAS 1.13                    *}
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

unit OnGuard4;
  {-Product description dialog}

interface

uses
  {$IFDEF Win32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  StdCtrls, Buttons, ExtCtrls, Controls, Classes, Forms,
  OgUtil,
  OnGuard,
  OnGuard1;

type
  TEditProductFrm = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    ProductEd: TEdit;
    Label2: TLabel;
    KeyEd: TEdit;
    GenerateKeySb: TSpeedButton;
    KeyPasteSb: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure InfoChanged(Sender: TObject);
    procedure KeyPasteSbClick(Sender: TObject);
    procedure GenerateKeySbClick(Sender: TObject);
  private
    { Private declarations }
    FKey         : TKey;
    FKeyType     : TKeyType;

    function GetShowHints : Boolean;
    procedure SetShowHints(Value : Boolean);

  public
    { Public declarations }
    procedure SetKey(Value : TKey);                                  {!!.08}
    procedure GetKey(var Value : TKey);                              {!!.08}

    property KeyType : TKeyType
      read FKeyType
      write FKeyType;

    property ShowHints : Boolean
      read GetShowHints
      write SetShowHints;
  end;


implementation

{$R *.DFM}

procedure TEditProductFrm.FormCreate(Sender: TObject);
begin
  InfoChanged(Sender);
end;

procedure TEditProductFrm.InfoChanged(Sender: TObject);
var
  Work : TKey;
begin
  OKBtn.Enabled := (Length(ProductEd.Text) > 0) and
    (HexToBuffer(KeyEd.Text, Work, SizeOf(Work)));
end;

procedure TEditProductFrm.KeyPasteSbClick(Sender: TObject);
begin
  KeyEd.PasteFromClipboard;
end;

procedure TEditProductFrm.GenerateKeySbClick(Sender: TObject);
var
  F    : TKeyGenerateFrm;
begin
  F := TKeyGenerateFrm.Create(Self);
  try
    F.SetKey(FKey);
    F.KeyType := FKeyType;
    F.ShowHint := GetShowHints;
    if F.ShowModal = mrOK then begin
      F.GetKey(FKey);
      FKeyType := F.KeyType;
      KeyEd.Text := BufferToHex(FKey, SizeOf(FKey));
      if HexStringIsZero(KeyEd.Text)then begin
        KeyEd.Text := '';
        FillChar(FKey, SizeOf(FKey), 0);
      end;

      InfoChanged(Sender);
    end;
  finally
    F.Free;
  end;
end;

function TEditProductFrm.GetShowHints : Boolean;
begin
  Result := ShowHint;
end;

procedure TEditProductFrm.SetShowHints(Value : Boolean);
begin
  ShowHint := Value;
end;

procedure TEditProductFrm.GetKey(var Value : TKey);
begin
  Value := FKey;
end;

procedure TEditProductFrm.SetKey(Value : TKey);
begin
  FKey := Value;
end;

end.


