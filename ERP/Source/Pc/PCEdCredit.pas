unit PCEdCredit;
{******************************************
项目：
模块：客户信用编辑
日期：2002年11月12 
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, ExtCtrls, ComCtrls, DB, ADODB, CommonDM,
  DBCtrls, Mask;

type
  TPCCreditEditForm = class(TWSStandardEditForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    adrDiscount: TADOQuery;
    dbcbClient: TDBLookupComboBox;
    dsClient: TDataSource;
    dsPeriod: TDataSource;
    adsPeriod: TADODataSet;
    edtCode: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtCreditClass: TDBEdit;
    edtQuotaAmount: TDBEdit;
    Label8: TLabel;
    edtDiscountRateMax: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    edtDiscountRateMin: TDBEdit;
    dtpStartDate: TDBEdit;
    dtpExpireDate: TDBEdit;
    memMeno: TDBMemo;
    adsPOCredit: TADODataSet;
    dsPOCredit: TDataSource;
    dbcbPeriod: TDBLookupComboBox;
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
    adsPOCreditID: TAutoIncField;
    adsPOCreditCreateDate: TDateTimeField;
    adsPOCreditCreateUserID: TIntegerField;
    adsPOCreditRecordState: TStringField;
    adsPOCreditDate: TDateTimeField;
    adsPOCreditCode: TStringField;
    adsPOCreditCreditClass: TStringField;
    adsPOCreditQuotaAmount: TBCDField;
    adsPOCreditQuotaAmountMax: TBCDField;
    adsPOCreditStartDate: TDateTimeField;
    adsPOCreditExpireDate: TDateTimeField;
    adsPOCreditPeriodID: TIntegerField;
    Label11: TLabel;
    DBEdit1: TDBEdit;
    Label12: TLabel;
    adsPOCreditMemo: TStringField;
    adsPOCreditClientID: TIntegerField;
    adsPOCreditQuotaAmountMin: TIntegerField;
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    nOptionType: integer; //操作类型：0:增加 1:编辑；
    vID:string;
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  PCCreditEditForm: TPCCreditEditForm;

implementation

{$R *.dfm}
function TPCCreditEditForm.Edit(const Params: Variant): Boolean;
begin
  vID := Format('%s', [VarToStr(Params)]);
  nOptionType:=1;
  adsPeriod.Active := True;
  with adsPOCredit do
  begin
    Active := True;
    Locate('id',vID,[]);
  end;
  Result := ShowModal = mrOK;
end;

function TPCCreditEditForm.Enter: Boolean;
begin
  nOptionType := 0;
  adsPeriod.Active := True;
  with adsPOCredit do
  begin
    Active := True;
    Append;
    FieldByName('Date').AsDateTime := Date;
    FieldByName('StartDate').AsDateTime := Date;
    FieldByName('ExpireDate').AsDateTime := Date;
  end;
  Result := ShowModal = mrOK;
end;

procedure TPCCreditEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  CommonData.adsDAClient.Active := True;
end;

procedure TPCCreditEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  with adsPOCredit do
  begin
    Edit;
    FieldByName('CreateUserID').AsInteger := 0;
    FieldByName('Date').AsDateTime := Date;
    Post;
  end;
  ModalResult := mrOK;
end;

end.
