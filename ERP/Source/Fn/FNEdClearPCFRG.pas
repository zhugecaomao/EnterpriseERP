unit FNEdClearPCFRG;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TFNEdClearPCFRGForm = class(TBaseVoucherEditAForm)
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
    adsDetailID: TAutoIncField;
    adsDetailMasterID: TIntegerField;
    adsDetailPoClearID: TIntegerField;
    adsDetailCheckNo: TStringField;
    adsDetailGoodsID: TIntegerField;
    adsDetailProjectID: TIntegerField;
    adsDetailMemo: TStringField;
    adsDetailPoclear: TStringField;
    AdsProject: TADODataSet;
    dsADOProject: TDataSource;
    adsDetailProject: TStringField;
    adsBrief: TADODataSet;
    Label7: TLabel;
    Label9: TLabel;
    LookUpAccount: TQLDBLookupComboBox;
    adsDetailBillCode: TStringField;
    adsDetailAmount: TBCDField;
    adsDetailBillTypeID: TIntegerField;
    adsDetailOriginID: TIntegerField;
    adsDetailExpenseID: TIntegerField;
    adsDetailOriginTable: TStringField;
    LookUpOriginCode: TQLDBLookupComboBox;
    dsCode: TDataSource;
    adsCode: TADODataSet;
    adsDetailOriginCode: TStringField;
    adsDetailGoods: TStringField;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    BriefComboBox: TDBComboBox;
    adsMasterID: TAutoIncField;
    adsMasterCreateDate: TDateTimeField;
    adsMasterCreateUserID: TIntegerField;
    adsMasterRecordState: TStringField;
    adsMasterDate: TDateTimeField;
    adsMasterCode: TStringField;
    adsMasterBillMode: TStringField;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    adsMasterBrief: TStringField;
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterClearDate: TDateTimeField;
    adsMasterAccountsID: TIntegerField;
    adsMasterAmountD: TBCDField;
    adsMasterAmountC: TBCDField;
    adsMasterAmountRed: TBCDField;
    adsMasterAmountBL: TBCDField;
    adsMasterMemo: TStringField;
    adsMasterBillAffix: TBytesField;
    adsMasterOriginID: TIntegerField;
    adsMasterOriginTable: TStringField;
    adsMasterPeriodID: TIntegerField;
    adsMasterAmountOrigin: TBCDField;
    adsMasterAmountRate: TFloatField;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    Label11: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ClientQLDBLookupEnter(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure adsDetailOriginIDChange(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LookUpAccountExit(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  FNEdClearPCFRGForm: TFNEdClearPCFRGForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
procedure TFNEdClearPCFRGForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','FNClearPCMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
  adsMaster.FieldByName('BillMode').AsString:='采购付款';
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('OriginTable').AsString:='FNClearPCMaster';
  adsMaster.FieldByName('AmountD').AsFloat :=0;
end;

procedure TFNEdClearPCFRGForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TFNEdClearPCFRGForm.FormClose(Sender: TObject;
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
  adscode.Close;
  AdsProject.Close;
  adsBrief.Close;
end;

procedure TFNEdClearPCFRGForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'FNClearPC';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  adsAccounts.Open;
  adsPoclear.Open;
  adsCode.Open;
  AdsProject.Open;
  adsBrief.Close;
  adsBrief.CommandText :=' select distinct Brief from FNClearPCMaster';
  adsBrief.Open;
  adsBrief.first;
  while not adsBrief.Eof do
  begin
    BriefComboBox.Items.Add(adsBrief.fieldbyname('Brief').AsString);
    adsBrief.Next;
  end;
  if  adsBrief.IsEmpty then  BriefComboBox.Items.Add('采购付款');
end;

procedure TFNEdClearPCFRGForm.ClientQLDBLookupEnter(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=true;
  GEdit1.Text :='0';
  GEdit1.Enabled :=false;
end;

procedure TFNEdClearPCFRGForm.ClientQLDBLookupExit(Sender: TObject);
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
    sql.Text :=' select sum(isnull(AmountD,0))*(-1) as Balance from '
    +' (  select (isnull(a.amount,0)-isnull(a.Discount,0)+isnull(a.TaxAmount,0) '
    +' +isnull(a.SundryFee,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD                         '
    +' from  SLSaleDetail a                                                     '
    +' left outer join  SLSaleMaster b on b.ID=a.MasterID                       '
    +' where b.RecordState<>'+Quotedstr('删除')+' and b.ClientID='
    + adsMaster.fieldbyname('ClientID').AsString
    +' UNION ALL                                                   '
    +' select (isnull(a.amount,0)-isnull(a.Discount,0)+isnull(a.TaxAmount,0) '
    +' +isnull(a.SundryFee,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as amountD                 '
    +' from  PCPurchaseDetail a                                              '
    +' left outer join  PCPurchaseMaster b on b.ID=a.MasterID                '
    +' where b.RecordState<>'+Quotedstr('删除')+' and b.ClientID='
    + adsMaster.fieldbyname('ClientID').AsString
    +' UNION ALL                                                             '
    +' select (Isnull(AmountD,0)+Isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1)     '
    +' as AmountD                                                            '
    +' from FNClearSLMaster                                                  '
    +' where RecordState<>'+Quotedstr('删除')+' and ClientID='
    + adsMaster.fieldbyname('ClientID').AsString
    +' UNION ALL                                                             '
    +' select (Isnull(AmountC,0)+Isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1)          '
    +' as AmountD                                                            '
    +' from FNClearPCMaster                                                  '
    +' where RecordState<>'+Quotedstr('删除')+' and ClientID='
    + adsMaster.fieldbyname('ClientID').AsString +'  ) as a ';
    open;
    GEdit1.Enabled :=true;
    if  adoTemp.IsEmpty then     GEdit1.Text :='0'
      else   GEdit1.Text :=fieldbyname('Balance').asstring;
    GEdit1.Enabled :=False;
  end;

  adsCode.Close;    //装入该厂商的历史进货单据
  adsCode.CommandText :=' select a.ID, a.Code,b.amount'
      +' from PCPurchaseMaster a left outer join (select masterID, '
      +' sum(isnull(amount,0)) as amount from PCPurchaseDetail group by  '
      +' MasterID ) as b on b.MasterID=a.ID '
      +' where a.recordstate<>'+QuotedStr('删除')
      +' and a.ClientID='+adsMaster.fieldbyname('ClientID').AsString;
  adsCode.Open;
end;

procedure TFNEdClearPCFRGForm.BitBtn1Click(Sender: TObject);
var amount:real;
begin
  inherited;
  amount :=0;
  adsDetail.First;
  while  not adsDetail.Eof do
  begin
    amount :=amount+ adsDetail.fieldbyname('Amount').AsFloat;
    adsDetail.Next;
  end ;
   adsMaster.Edit;
   if   amount<>0 then
   begin
     if  adsMaster.FieldByName('AmountC').AsFloat=0 then
          adsMaster.FieldByName('AmountC').AsFloat:=
           Amount-adsMaster.FieldByName('AmountRed').AsFloat;
     if  adsMaster.FieldByName('AmountRed').AsFloat=0 then
          adsMaster.FieldByName('AmountRed').AsFloat:=
           Amount-adsMaster.FieldByName('AmountC').AsFloat;
   end;

end;

procedure TFNEdClearPCFRGForm.adsDetailOriginIDChange(Sender: TField);
Var s:string;
begin
  inherited;
  if (adsCode.fieldbyname('ID').IsNull) or (adsCode.fieldbyname('ID').AsInteger=0 )
      then s:='0' else s:=adsCode.fieldbyname('ID').AsString;
  adsDetail.Edit;
  if (adsDetail.FieldByName('Amount').IsNull) or (adsDetail.FieldByName('Amount').AsFloat =0) then
     adsDetail.FieldByName('Amount').AsFloat :=adsCode.fieldbyname('Amount').AsFloat;
  GoodName.Close;
  GoodName.CommandText :=' select * from DAGoods where id in ( select'
              +'  GoodsID from  PCPurchaseDetail where MasterID='+s +' )';
  GoodName.Open;
end;



procedure TFNEdClearPCFRGForm.FormActivate(Sender: TObject);
var StrAccountID :string;
begin
  StrAccountID := adsMaster.fieldbyname('AccountsID').AsString;
  adsAccounts.Locate('ID',StrAccountID,[]) ;
  inherited;
  ClientQLDBLookup.SetFocus;
  if not adsAccounts.FieldByName('IsLocation').AsBoolean then
      DBEdit4.ReadOnly :=False
    else DBEdit4.ReadOnly :=True;
end;

procedure TFNEdClearPCFRGForm.FormShow(Sender: TObject);
begin
  inherited;
//  ClientQLDBLookup.SetFocus;
end;

procedure TFNEdClearPCFRGForm.LookUpAccountExit(Sender: TObject);
var StrAccountID :string;
begin
  inherited;
  StrAccountID := adsMaster.fieldbyname('AccountsID').AsString;
  adsAccounts.Locate('ID',StrAccountID,[]) ;
  if not adsAccounts.FieldByName('IsLocation').AsBoolean then
  begin
    DBEdit4.ReadOnly :=False;
  end else begin
    adsMaster.Edit;
    adsMaster.FieldByName('AmountOrigin').Value :=null;
    adsMaster.FieldByName('AmountRate').Value :=null;
    DBEdit4.ReadOnly :=True;
  end;
end;

procedure TFNEdClearPCFRGForm.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  if adsMaster.FieldByName('AmountOrigin').AsFloat<>0 then
    adsMaster.FieldByName('AmountRate').AsFloat:=
    (adsMaster.FieldByName('AmountC').AsFloat)/adsMaster.FieldByName('AmountOrigin').AsFloat;
end;

end.
