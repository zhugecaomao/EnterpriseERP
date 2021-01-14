unit MSPeriod;
{******************************************
项目：
模块：管理期间
日期：2002年10月31日
作者：贺才伟
更新：
******************************************}
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, StdCtrls, Menus;

type
  TMSPeriodForm = class(TWSStandardBrowseForm)
    adsPeriod: TADODataSet;
    OkButton: TButton;
    adsPeriodID: TAutoIncField;
    adsPeriodCreateDate: TDateTimeField;
    adsPeriodCreateUserID: TIntegerField;
    adsPeriodRecordState: TStringField;
    adsPeriodName: TStringField;
    adsPeriodStartDate: TDateTimeField;
    adsPeriodCloseDate: TDateTimeField;
    adsPeriodIsClosed: TStringField;
    adsPeriodLastCloseDate: TDateTimeField;
    adsPeriodCheckFlag: TIntegerField;
    adsPeriodEmployeID: TIntegerField;
    CancelButton: TButton;
    Label1: TLabel;
    btnMonth: TButton;
    adrPeriod: TADOQuery;
    procedure OkButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure adsPeriodNameValidate(Sender: TField);
    procedure btnMonthClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function PeriodDlg:boolean;

implementation

{$R *.dfm}
function PeriodDlg: Boolean;
begin
  Result := False;
  with TMSPeriodForm.Create(Application) do
  try
    if ShowModal = mrOK then
    begin
      Result := True;
    end;
  finally
    Free;
  end;
end;

procedure TMSPeriodForm.OkButtonClick(Sender: TObject);
begin
  inherited;
  adsPeriod.UpdateBatch;
  ModalResult := mrOK;
end;

procedure TMSPeriodForm.FormCreate(Sender: TObject);
begin
  inherited;
  Label1.Caption := '  注意：名称的格式必须为：'+#13+'“9999-99”(其中 9 代表数字)';
end;

procedure TMSPeriodForm.adsPeriodNameValidate(Sender: TField);
var
  i: Integer;
begin
  inherited;
  for i := 1 to 7 do
  begin
    if i <> 5 then
    begin
      if not (pChar(copy(adsPeriodName.Value,i,1))^ in ['0'..'9']) then
      begin
        showmessage('出错');
        exit;
      end;
    end;
  end;
end;

procedure TMSPeriodForm.btnMonthClick(Sender: TObject);
var i: Integer;
    year,month,day :word;
begin
  inherited;
  DecodeDate(Date,year, month, day);
  adrPeriod.Close;
  adrPeriod.SQL.Text :=' select Max(Name) Name  from MSPeriod ';
  adrPeriod.Open;
  if not adrPeriod.FieldByName('Name').IsNull then
  begin
    year :=strtoint( Copy(Trim(adrPeriod.FieldByName('Name').AsString),1,4 )  );
    Month :=strtoint( Copy(Trim(adrPeriod.FieldByName('Name').AsString),6,2 )  );
  end;
  if Month>=12 then
  begin
    year :=year+1;
    month :=0;
  end;
  day :=1;
  month:= month+1;
//  sYear := FormatDateTime('yyyy-',date);
  with adrPeriod do
  begin
    Close;
    SQL.Text :=' select * from MSPeriod ';
    Open;
    while month<13 do
    begin
      Append;
      if month<10 then FieldByName('Name').AsString := Inttostr(year)+'-0'+Inttostr(month)
        else FieldByName('Name').AsString := Inttostr(year)+'-'+Inttostr(month);
      FieldByName('StartDate').AsDateTime :=EncodeDate(year,month,1);
      post;
      month :=month+1;
    end;
  end;
  adsPeriod.Requery;
  adsPeriod.Last;
end;

end.
