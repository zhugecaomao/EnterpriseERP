unit FNEdCashOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TFNEdCashOutForm = class(TBaseVoucherEditAForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    DBEdit2: TDBEdit;
    GoodName: TADODataSet;
    Label5: TLabel;
    GEdit1: TGEdit;
    adsAccounts: TADODataSet;
    dsAccounts: TDataSource;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    EmployeeLookup: TQLDBLookupComboBox;
    DBEdit1: TDBEdit;
    adsMaster: TADODataSet;
    adsDetail: TADODataSet;
    Label8: TLabel;
    adsPoclear: TADODataSet;
    dsPoclear: TDataSource;
    PoclearLookup: TQLDBLookupComboBox;
    Label6: TLabel;
    adsMasterID: TAutoIncField;
    adsMasterCreateDate: TDateTimeField;
    adsMasterCreateUserID: TIntegerField;
    adsMasterRecordState: TStringField;
    adsMasterDate: TDateTimeField;
    adsMasterCode: TStringField;
    adsMasterBillMode: TStringField;
    adsMasterBrief: TStringField;
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterOriginID: TIntegerField;
    adsMasterOriginTable: TStringField;
    adsMasterPeriodID: TIntegerField;
    adsMasterMemo: TStringField;
    adsMasterBillAffix: TBytesField;
    adsMasterEmployee: TStringField;
    adsMasterClient: TStringField;
    AdsProject: TADODataSet;
    dsADOProject: TDataSource;
    adsBrief: TADODataSet;
    adsMasterAmountD: TBCDField;
    adsMasterAmountC: TBCDField;
    Label7: TLabel;
    Label9: TLabel;
    LookUpAccount: TQLDBLookupComboBox;
    adsMasterAccountsID: TIntegerField;
    adsMasterAmountBL: TBCDField;
    adsMasterAmountRed: TBCDField;
    LookExpenseID: TQLDBLookupComboBox;
    dsexpenseId: TDataSource;
    AdsexpenseId: TADODataSet;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    adsMasterClearDate: TDateTimeField;
    BriefComboBox: TDBComboBox;
    adsDetailID: TAutoIncField;
    adsDetailMasterID: TIntegerField;
    adsDetailPoClearID: TIntegerField;
    adsDetailCheckNo: TStringField;
    adsDetailBillCode: TStringField;
    adsDetailAmount: TBCDField;
    adsDetailBillTypeID: TIntegerField;
    adsDetailOriginID: TIntegerField;
    adsDetailExpenseID: TIntegerField;
    adsDetailGoodsID: TIntegerField;
    adsDetailProjectID: TIntegerField;
    adsDetailMemo: TStringField;
    adsDetailOriginTable: TStringField;
    adsDetailPoclear: TStringField;
    adsDetailGoods: TStringField;
    adsDetailExpense: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ClientQLDBLookupEnter(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
    procedure adsDetailExpenseIDChange(Sender: TField);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  FNEdCashOutForm: TFNEdCashOutForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
procedure TFNEdCashOutForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','FNCashOutMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
  adsMaster.FieldByName('BillMode').AsString:='付款申请';
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='FNCashOutMaster';
  adsMaster.FieldByName('AmountD').AsFloat :=0;
end;

procedure TFNEdCashOutForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TFNEdCashOutForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  adsAccounts.Close;
  adsPoclear.Close;
  adsExpenseID.Close;
  AdsProject.Close;
  adsBrief.Close;
end;

procedure TFNEdCashOutForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'FNCashOut';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  adsAccounts.Open;
  adsPoclear.Open;
  adsExpenseID.Open;
  AdsProject.Open;
  adsBrief.Close;
  adsBrief.CommandText :=' select distinct Brief from FNCashOutMaster';
  adsBrief.Open;
  adsBrief.first;
  while not adsBrief.Eof do
  begin
    BriefComboBox.Items.Add(adsBrief.fieldbyname('Brief').AsString);
    adsBrief.Next;
  end;
    if  adsBrief.IsEmpty then  BriefComboBox.Items.Add('付款');
end;

procedure TFNEdCashOutForm.ClientQLDBLookupEnter(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=true;
  GEdit1.Text :='0';
  GEdit1.Enabled :=false;
end;

procedure TFNEdCashOutForm.ClientQLDBLookupExit(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  inherited;
  if   (adsMaster.fieldbyname('ClientID').IsNull) or
          (adsMaster.fieldbyname('ClientID').AsInteger=0)  then exit;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    close;
    sql.Text := 'select sum(isnull(AmountC,0))-sum(isnull(AmountD,0)) '
        +' as Balance from (  '
        +' select  0.00 as AmountD, (isnull(AmountD,0)+  '
        +' isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountC FROM FNCashinMaster'
        +' where ClientID='+adsMaster.fieldbyname('ClientID').AsString
        +' and RecordState<>'+QuotedStr('删除') //----- 收款时贷记
        +' UNION ALL '
        +' select  (isnull(AmountC,0)+isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD,   '
        +'  0.00 as AmountC FROM FNCashOutMaster'
        +' where ClientID='+adsMaster.fieldbyname('ClientID').AsString
        +' and RecordState<>'+QuotedStr('删除') //======付款时借记
        +' UNION ALL '
        +' select AmountRed*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as AmountD,   '
        +' 0.00  as AmountC FROM FNExpenseMaster'
        +' where ClientID='+adsMaster.fieldbyname('ClientID').AsString
        +' and RecordState<>'+QuotedStr('删除') //*****报销冲帐时贷记
        +' ) as Balance' ;
    open;
    GEdit1.Enabled :=true;
    if  adoTemp.IsEmpty then     GEdit1.Text :='0'
      else   GEdit1.Text :=fieldbyname('Balance').asstring;
    GEdit1.Enabled :=False;
  end;
end;

procedure TFNEdCashOutForm.adsDetailExpenseIDChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  if (adsDetail.FieldByName('Amount').IsNull) or (adsDetail.FieldByName('Amount').AsFloat=0)
    then adsDetail.FieldByName('Amount').AsFloat  := adsMaster.FieldByName('AmountC').AsFloat ;
end;

procedure TFNEdCashOutForm.FormShow(Sender: TObject);
begin
  inherited;
//  ClientQLDBLookup.SetFocus;
end;

procedure TFNEdCashOutForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

end.
