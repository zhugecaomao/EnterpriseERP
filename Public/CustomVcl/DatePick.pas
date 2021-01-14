{-----------------------------------------------------------------------------
 Unit Name: DatePick
 Author:    Qiuliang
 Purpose:
 Created:   2003-07-29
 History:
-----------------------------------------------------------------------------}

unit DatePick;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls, 
  Buttons, ExtCtrls, ComCtrls;

type
  TDatePickForm = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    mclCalendar: TMonthCalendar;
    lblPrompt: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

  TDateRangePickForm = class(TCustomForm)
  private
    FBeginDatePicker: TDateTimePicker;
    FEndDatePicker: TDateTimePicker;
    procedure CreateControls;
  public
    constructor Create(AOwner: TComponent); override;
  end;

function PickDateDlg(const Prompt: string; var ADate: TDate): Boolean;
function PickDateRangeDlg(var BeginDate, EndDate: TDate): Boolean;

{ Obsoleted functions }

function PickDateDialog(var ADate: TDate): Boolean;

implementation
          
{$R *.DFM}

function PickDateDlg(const Prompt: string; var ADate: TDate): Boolean;
begin
  Result := False;
  with TDatePickForm.Create(nil) do
    try
      lblPrompt.Caption := Prompt;
      if ADate = 0 then mclCalendar.Date := Date
      else mclCalendar.Date := ADate;
      if ShowModal = mrOk then
      begin
        ADate := mclCalendar.Date;
        Result := True;
      end;
    finally
      Free;
    end;
end;

function PickDateRangeDlg(var BeginDate, EndDate: TDate): Boolean;
begin
  Result := False;
  with TDateRangePickForm.Create(Application) do
  try
    if (BeginDate = 0) and (EndDate = 0) then
    begin
      FBeginDatePicker.DateTime := Now;
      FEndDatePicker.DateTime := Now;
    end
    else begin
      FBeginDatePicker.DateTime := BeginDate;
      FEndDatePicker.DateTime := EndDate;
    end;
    if ShowModal = mrOK then
    begin
      BeginDate := Int(FBeginDatePicker.DateTime);
      EndDate := Int(FEndDatePicker.DateTime) + 0.99999;
      Result := True;
    end;
  finally
    Free;
  end;
end;

function PickDateDialog(var ADate: TDate): Boolean;
begin
  Result := PickDateDlg('', ADate);
end;


{ TDateRangePickForm }

constructor TDateRangePickForm.Create(AOwner: TComponent);
begin
  inherited CreateNew(AOwner);
  BorderStyle := bsDialog;
  Position := poScreenCenter;
  Caption := '选择日期';
  Font.Name := '宋体';
  Font.Size := 9;
  Width := 237;
  Height := 160;
  CreateControls;
end;

procedure TDateRangePickForm.CreateControls;
begin
  FBeginDatePicker := TDateTimePicker.Create(Self);
  FEndDatePicker := TDateTimePicker.Create(Self);
  with TButton.Create(Self) do
  begin
    Parent := Self;
    Left := 144;
    Top := 104;
    Width := 75;
    Height := 21;
    Cancel := True;
    Caption := '取消';
    ModalResult := 2;
    TabOrder := 1;
  end;
  with TButton.Create(Self) do
  begin
    Parent := Self;
    Left := 64;
    Top := 104;
    Width := 75;
    Height := 21;
    Caption := '确定';
    Default := True;
    ModalResult := 1;
    TabOrder := 0;
  end;
  with TLabel.Create(Self) do
  begin
    Parent := Self;
    Left := 16;
    Top := 27;
    Width := 54;
    Height := 12;
    Caption := '开始日期:';
  end;
  with TLabel.Create(Self) do
  begin
    Parent := Self;
    Left := 16;
    Top := 63;
    Width := 54;
    Height := 12;
    Caption := '终止日期:';
  end;
  with FBeginDatePicker do
  begin
    Parent := Self;
    Left := 80;
    Top := 24;
    Width := 121;
    Height := 21;
    DateFormat := dfShort;
    DateMode := dmComboBox;
    Kind := dtkDate;
    ParseInput := False;
    TabOrder := 2;
  end;
  with FEndDatePicker do
  begin
    Parent := Self;
    Left := 80;
    Top := 60;
    Width := 121;
    Height := 21;
    DateFormat := dfShort;
    DateMode := dmComboBox;
    Kind := dtkDate;
    ParseInput := False;
    TabOrder := 3;
  end;
  with TBevel.Create(Self) do
  begin
    Parent := Self;
    Left := 8;
    Top := 8;
    Width := 209;
    Height := 89;
    Shape := bsFrame;
  end;
end;

end.
