unit WSDateRangeFm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, ADODB, StdCtrls, Mask, ComCtrls;

type
  TWSDateRangeFrame = class(TFrame)
    lblDateRange: TLabel;
    deBeginDate: TDateTimePicker;
    deEndDate: TDateTimePicker;
    procedure deBeginDateAcceptDate(Sender: TObject;
      var ADate: TDateTime; var Action: Boolean);
    procedure deBeginDateKeyPress(Sender: TObject;
      var Key: Char);
    procedure deBeginDateCloseUp(Sender: TObject);
  private
    { Private declarations }
    FDataSet: TDataSet;
    function GetBeginDate: TDateTime;
    procedure SetBeginDate(Value: TDateTime);
    function GetEndDate: TDateTime;
    procedure SetEndDate(Value: TDateTime);
  protected
    procedure ApplyDate(BeginDate, EndDate: TDateTime); virtual;
  public
    { Public declarations }
    procedure SetDateRange(BeginDate, EndDate: TDateTime);
    property DataSet: TDataSet read FDataSet write FDataSet;
    property BeginDate: TDateTime read GetBeginDate write SetBeginDate;
    property EndDate: TDateTime read GetEndDate write SetEndDate;
  end;

implementation

const
  NullDate = 0;

{$R *.DFM}

procedure TWSDateRangeFrame.deBeginDateAcceptDate(Sender: TObject;
  var ADate: TDateTime; var Action: Boolean);
begin
  if ((Sender = deEndDate) and (deBeginDate.Date <> NullDate)) or
    ((Sender = deBeginDate) and (deEndDate.Date <> NullDate)) then
  begin
    TDateTimePicker(Sender).Date := ADate;
    ApplyDate(Int(deBeginDate.Date), Trunc(deEndDate.Date) + 0.99999);
  end;
end;

procedure TWSDateRangeFrame.deBeginDateKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  if (Key = #13) and (deBeginDate.Date <> NullDate) and (deEndDate.Date <> NullDate) then
    ApplyDate(Int(deBeginDate.Date), Trunc(deEndDate.Date) + 0.99999);
end;

procedure TWSDateRangeFrame.ApplyDate(BeginDate, EndDate: TDateTime);
var
  Parameter: TParameter;
begin
  if DataSet <> nil then
    if DataSet is TADODataSet then
      with TADODataSet(DataSet), Parameters do
      begin
        Parameter := Parameters.FindParam('BeginDate');
        if Parameter <> nil then Parameter.Value := BeginDate;
        Parameter := Parameters.FindParam('EndDate');
        if Parameter <> nil then Parameter.Value := EndDate;
        Close;
        Open;
      end;
end;

procedure TWSDateRangeFrame.SetDateRange(BeginDate, EndDate: TDateTime);
var
  Key: Char;
begin
  Key := #13;
  deBeginDate.Date := BeginDate;
  deEndDate.Date := EndDate;
  deBeginDate.OnKeyPress(deBeginDate, Key);
end;

function TWSDateRangeFrame.GetBeginDate: TDateTime;
begin
  Result := deBeginDate.Date;
end;

procedure TWSDateRangeFrame.SetBeginDate(Value: TDateTime);
begin
  deBeginDate.Date := Value;
end;

function TWSDateRangeFrame.GetEndDate: TDateTime;
begin
  Result := deEndDate.Date;
end;

procedure TWSDateRangeFrame.SetEndDate(Value: TDateTime);
begin
  deEndDate.Date := Value;
end;

procedure TWSDateRangeFrame.deBeginDateCloseUp(Sender: TObject);
begin
  if ((Sender = deEndDate) and (deBeginDate.Date <> NullDate)) or
    ((Sender = deBeginDate) and (deEndDate.Date <> NullDate)) then
  begin
    ApplyDate(Int(deBeginDate.Date), Trunc(deEndDate.Date) + 0.99999);
  end;
end;

end.
