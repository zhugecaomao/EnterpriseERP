unit FNEdCashToBank;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, QLDBLkp;

type
  TFNCashToBankEditForm = class(TBaseVoucherEditForm)
    adsFNCashToBank: TADODataSet;
    adsFNCashToBankDetail: TADODataSet;
    dsPeriod: TDataSource;
    adsPeriod: TADODataSet;
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
    adsFNCashToBankDetailID: TAutoIncField;
    adsFNCashToBankDetailMasterID: TIntegerField;
    adsFNCashToBankDetailAccountIDOut: TIntegerField;
    adsFNCashToBankDetailAmount: TBCDField;
    adsFNCashToBankDetailChechkCode: TStringField;
    adsFNCashToBankDetailAccountIDIn: TIntegerField;
    adsFNCashToBankDetailMemo: TStringField;
    adsAccounts: TADODataSet;
    adsFNCashToBankDetailAccountIDOutName: TStringField;
    adsFNCashToBankDetailAccountIDInName: TStringField;
    dbeBrief: TDBEdit;
    Label2: TLabel;
    adsFNCashToBankID: TAutoIncField;
    adsFNCashToBankCreateDate: TDateTimeField;
    adsFNCashToBankCreateUserID: TIntegerField;
    adsFNCashToBankRecordState: TStringField;
    adsFNCashToBankDate: TDateTimeField;
    adsFNCashToBankCode: TStringField;
    adsFNCashToBankBrief: TStringField;
    adsFNCashToBankEmployeID: TIntegerField;
    adsFNCashToBankOriginBillID: TIntegerField;
    adsFNCashToBankOriginBillTypeID: TIntegerField;
    adsFNCashToBankMemo: TStringField;
    adsFNCashToBankPeriodID: TIntegerField;
    dblcEmployeeID: TDBLookupComboBox;
    Label3: TLabel;
    dsEmployee: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure adsFNCashToBankDetailAccountIDInNameChange(Sender: TField);
    procedure adsFNCashToBankDetailNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
  public
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
    { Public declarations }
  end;

var
  FNCashToBankEditForm: TFNCashToBankEditForm;

implementation

uses WSUtils, CommonDM;

{$R *.dfm}

procedure TFNCashToBankEditForm.New;
begin
  inherited;
  adsFNCashToBank.FieldByName('RecordState').AsString := 'ÁÙÊ±';
  adsFNCashToBank.FieldByName('Code').AsString:=GetMaxCode('Code','FNCashToBank',Number);
  adsFNCashToBank.FieldByName('Date').AsString:=FormatDateTime('yyyy-mm-dd',date());
end;

procedure TFNCashToBankEditForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;

procedure TFNCashToBankEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'FNExpense';
  with CommonData.adsMSEmployee do
  begin
    Close;
    Open;
    Filtered := False;
    Filter := 'RecordState<>' + QuotedStr('É¾³ý');
    Filtered := True;
  end;
{  with adsFNExpenseDetail do
  begin
    close;
    Open;
  end;
}
  with adsPeriod do
  begin
    Close;
    Open;
  end;
  with CommonData.adsMSEmployee do
  begin
    Close;
    Open;
  end;
end;

procedure TFNCashToBankEditForm.adsFNCashToBankDetailAccountIDInNameChange(
  Sender: TField);
begin
  inherited;
//  with adsFNCashToBankDetail do
  begin
//    if FieldByName('AccountIDInName').AsString <> '' then
//      FieldValues['AccountIDOut'] := null;
//      FieldByName('AccountIDOut').AsInteger := 0;
//      adsFNCashToBankDetail.FieldByName('AccountIDOut').AsInteger := 0;
  end;
//    adsFNCashToBankDetail.FieldByName('AccountIDOutName').AsInteger := 0;
end;

procedure TFNCashToBankEditForm.adsFNCashToBankDetailNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  with adsFNCashToBankDetail do
  begin
//    FieldByName('EmployeeID').AsInteger := adsFNCashToBank.FieldByName('EmployeeID').AsInteger;
//    FieldByName('EmployeeIDName').AsInteger := adsFNCashToBank.FieldByName('EmployeeID').AsInteger;
//    showmessage(fieldbyname('employeeid').AsString);
//    Refresh();
  end;
end;

end.
