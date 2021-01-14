unit SLEdSaleBill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TSLEdSaleBillForm = class(TBaseVoucherEditForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    GoodName: TADODataSet;
    Label5: TLabel;
    GEdit1: TGEdit;
    MSUnit: TADODataSet;
    DSMSUnit: TDataSource;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    QLDBLookupEmployee: TQLDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label6: TLabel;
    MSGoalUnit: TADODataSet;
    dsMSGoalUnit: TDataSource;
    DBComboBox3: TDBComboBox;
    DBComboBox4: TDBComboBox;
    Label7: TLabel;
    QLDBLookuppACKUNIT: TQLDBLookupComboBox;
    TempAds: TADODataSet;
    adsSalesMaster: TADODataSet;
    adsSalesDetail: TADODataSet;
    adsSalesDetailID: TAutoIncField;
    adsSalesDetailMasterID: TIntegerField;
    adsSalesDetailGoodsID: TIntegerField;
    adsSalesDetailQuantity: TBCDField;
    adsSalesDetailQuantityPcs: TBCDField;
    adsSalesDetailPackUnitID: TIntegerField;
    adsSalesDetailPriceBase: TBCDField;
    adsSalesDetailAmount: TBCDField;
    adsSalesDetailDiscountRate: TBCDField;
    adsSalesDetailDiscount: TBCDField;
    adsSalesDetailNetAmount: TBCDField;
    adsSalesDetailTaxAmount: TBCDField;
    adsSalesDetailSalesMode: TStringField;
    adsSalesDetailGoalQuantity: TBCDField;
    adsSalesDetailSundryFee: TBCDField;
    adsSalesDetailGoalUnitID: TIntegerField;
    adsSalesMasterID: TAutoIncField;
    adsSalesMasterCreateDate: TDateTimeField;
    adsSalesMasterCreateUserID: TIntegerField;
    adsSalesMasterRecordState: TStringField;
    adsSalesMasterDate: TDateTimeField;
    adsSalesMasterCode: TStringField;
    adsSalesMasterClientID: TIntegerField;
    adsSalesMasterEmployeID: TIntegerField;
    adsSalesMasterDiscountRate: TBCDField;
    adsSalesMasterBillMode: TStringField;
    adsSalesMasterBillModeDC: TIntegerField;
    adsSalesMasterOriginBillID: TIntegerField;
    adsSalesMasterOriginBillTypeID: TIntegerField;
    adsSalesMasterPeriodID: TIntegerField;
    adsSalesMasterClearDate: TDateTimeField;
    adsSalesMasterMemo: TStringField;
    adsSalesMasterSundryFee: TBCDField;
    adsSalesMasterIsApportion: TStringField;
    Label8: TLabel;
    DBEdit5: TDBEdit;
    adsSalesMasterClientName: TStringField;
    adsSalesMasterEmployeeName: TStringField;
    adsSalesDetailGoodsName: TStringField;
    adsSalesDetailPackUnit: TStringField;
    adsSalesDetailGoallUnit: TStringField;
    N7: TMenuItem;
    N13: TMenuItem;
    LastPrice: TAction;
    DiscountMode: TAction;
    adsSalesMasterIsDeliver: TStringField;
    adsSalesMasterIsTax: TStringField;
    adsSalesDetailTaxrate: TBCDField;
    adsSalesMasterTaxRate: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBComboBox3Change(Sender: TObject);
    procedure GoodsIDChange;
    procedure QuantityChange;
    procedure adsSalesDetailPackUnitIDChange(Sender: TField);
    procedure adsSalesDetailQuantityChange(Sender: TField);
    procedure adsSalesDetailGoodsIDChange(Sender: TField);
    procedure SaveActionExecute(Sender: TObject);
    procedure ImportActionExecute(Sender: TObject);
    procedure LastPriceExecute(Sender: TObject);
    procedure DiscountModeExecute(Sender: TObject);
    procedure ClientQLDBLookupEnter(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SLEdSaleBillForm: TSLEdSaleBillForm;

implementation

uses CommonDM, WSUtils, WSSecurity,PkVoucher, SLPriceSearch,SLDiscountMode,
  SLPricequery;

{$R *.dfm}
procedure TSLEdSaleBillForm.New;
begin
  inherited;
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  MSUnit.Open;
  MSGoalUnit.Open;
  adsSalesMaster.FieldByName('Date').Value:=date;
  adsSalesMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SLSaleMaster',number);
  adsSalesMaster.FieldByName('CreateUserID').Value:=Guarder.UserID;
  adsSalesMaster.FieldByName('BillMode').Value:='销售开单';
  adsSalesMaster.FieldByName('BillModeDC').Value:=1;
  adsSalesMaster.FieldByName('IsTax').Value:='已含税';
  adsSalesMaster.FieldByName('IsDeliver').Value:='不送货';
  adsSalesMaster.FieldByName('IsApportion').Value:='不分摊';
end;

procedure TSLEdSaleBillForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  MSUnit.Open;
  MSGoalUnit.Open;
end;


procedure TSLEdSaleBillForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsSalesMaster.Close;
  adsSalesDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  MSUnit.Close;
  MSGoalUnit.Close;
end;

procedure TSLEdSaleBillForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'SLSale';
end;

procedure TSLEdSaleBillForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;



procedure TSLEdSaleBillForm.DBComboBox3Change(Sender: TObject);
begin
  inherited;
  if DBComboBox3.Text ='不含税' then DBEdit4.Enabled :=true
    else DBEdit4.Enabled :=False;
end;



procedure TSLEdSaleBillForm.GoodsIDChange;
begin
  TempAds.Close;   //取标准单位
  TempAds.CommandText :='select UnitID from DAGoods where Id='
      + QuotedStr(adsSalesDetail.fieldbyname('GoodsID').AsString);
  TempAds.Open;
  TempAds.First;
  adsSalesDetail.FieldByName('GoalUnitID').ReadOnly :=False;
  adsSalesDetail.FieldByName('GoalUnitID').AsInteger :=TempAds.fieldbyname('UnitID').AsInteger;
  adsSalesDetail.FieldByName('GoalUnitID').ReadOnly :=True;
                //取包装单位
  MSUnit.Close;
  MSUnit.CommandText :='select * from MSUnit where GoalUnitID= '
      +' ( select GoalUnitID from msunit where id = '
      +' (select top 1 UnitID from dagoods where id='
       + QuotedStr(adsSalesDetail.fieldbyname('GoodsID').AsString)+ ' ) )';
  MSUnit.Open;
end;


procedure TSLEdSaleBillForm.QuantityChange;
begin
  adsSalesDetail.FieldByName('Amount').ReadOnly :=False;
  adsSalesDetail.FieldByName('Amount').AsFloat :=
       adsSalesDetail.fieldbyname('Quantity').asfloat
         *adsSalesDetail.fieldbyname('PriceBase').asfloat;
//       (adsSalesDetail.fieldbyname('QuantityPcs').asfloat*adsSalesDetail.fieldbyname('PriceBase').asfloat) ;
  adsSalesDetail.FieldByName('Amount').ReadOnly :=True;

  adsSalesDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsSalesDetail.FieldByName('GoalQuantity').AsFloat :=
       adsSalesDetail.fieldbyname('Quantity').AsFloat
         *MSUnit.fieldbyname('ExchangeRate').AsFloat+
           adsSalesDetail.FieldByName('QuantityPcs').AsFloat;
  adsSalesDetail.FieldByName('GoalQuantity').ReadOnly :=True;


  adsSalesDetail.FieldByName('NetAmount').ReadOnly :=False;
  adsSalesDetail.FieldByName('NetAmount').AsFloat :=
       adsSalesDetail.fieldbyname('Amount').AsFloat-
         adsSalesDetail.fieldbyname('Discount').AsFloat;
  adsSalesDetail.FieldByName('NetAmount').ReadOnly :=True;
end;

procedure TSLEdSaleBillForm.adsSalesDetailPackUnitIDChange(Sender: TField);
begin
  inherited;
  adsSalesDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsSalesDetail.FieldByName('GoalQuantity').AsFloat :=
       adsSalesDetail.fieldbyname('Quantity').AsFloat
       *MSUnit.fieldbyname('ExchangeRate').AsFloat+
       adsSalesDetail.FieldByName('QuantityPcs').AsFloat;
  adsSalesDetail.FieldByName('GoalQuantity').ReadOnly :=True;

  adsSalesDetail.FieldByName('PriceBase').ReadOnly :=False;
  adsSalesDetail.FieldByName('PriceBase').AsFloat :=
       GoodName.fieldbyname('PriceSales').AsFloat;
  adsSalesDetail.FieldByName('PriceBase').ReadOnly :=True;
end;

procedure TSLEdSaleBillForm.adsSalesDetailQuantityChange(Sender: TField);
begin
  inherited;
  QuantityChange;
end;

procedure TSLEdSaleBillForm.adsSalesDetailGoodsIDChange(Sender: TField);
begin
  inherited;
  GoodsIDChange;
end;

procedure TSLEdSaleBillForm.SaveActionExecute(Sender: TObject);
var adoTemp: TADOQuery;
    code:string;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    close;
    sql.Text :='select top 1 code from SLClearBillMaster order by id desc';
    open;
    if adoTemp.IsEmpty then code :='00000001'
      else code :=fieldbyname('Code').AsString;
//    close;
    sql.Text := 'insert into SLClearBillMaster '
        +' (CreateUserID ,Date,Code, BillMode, BillModeDC,ClientID,EmployeID,'
        +'    OriginBillID,PeriodID,SaleAmount,Memo)  '
        +' select a.CreateUserID ,a.Date,'+QuotedStr(code)+', a.BillMode, a.BillModeDC ,a.ClientID,a.EmployeID, '
        +' a.ID,PeriodID,  b.AcceptAmount*a.BillModeDC, A.Memo from SLSaleMaster a inner join  '
        +' ( select masterID,sum(isnull(Amount,0)) as  AcceptAmount from   SLSaleDetail Group by masterID  ) as b '
        +' on b.masterID=a.ID '
        +' where not ( a.ID in (select OriginBillID from SLClearBillMaster) '
        +'      and a.BillMode in (select BillMode from SLClearBillMaster) ) ';
    ExecSQL;
    close;
    sql.Text := 'update SLClearBillMaster set AmountBalance= (SaleAmount'
        +' -AcceptAmount )  where AmountBalance=0 or AmountBalance is null';
    ExecSQL;
  end;
end;

procedure TSLEdSaleBillForm.ImportActionExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TVoucherPickForm, VoucherPickForm);
  VoucherPickForm.ShowModal;
  VoucherPickForm.Free;
end;

procedure TSLEdSaleBillForm.LastPriceExecute(Sender: TObject);
begin
  inherited;
  if (not adsSalesMaster.FieldByName('ClientID').IsNull) and (not adsSalesDetail.FieldByName('GoodsID').IsNull)
    then begin
    SLPricequeryForm:= TSLPricequeryForm.Create(self);
    with SLPricequeryForm do
    begin
      AdsPricequery.Close;
      AdsPricequery.CommandText := 'select top 100 '
            +' M.code,m.date, D.PriceBase,d.Amount,d.GoalQuantity ,  '
            +' f.name as goodsname,xs.name as ClientName  from SLSaleDetail D '
            +' inner join DAGoods  f on d.goodsID=f.id   '
            +' inner join SLSaleMaster M on D.MasterID=M.ID inner join  DAClient  '
            +' xs on xs.id=m.ClientID  '
            + '  where M.CLientID=:CLientID '
            + '  order by M.id DESC';
//            + '  and D.GoodsID=:GoodsID order by M.id DESC';
      AdsPricequery.Parameters.ParamByName('ClientID').Value
                         := adsSalesMaster.FieldByName('ClientID').Value;
//      AdsPricequery.Parameters.ParamByName('GoodsID').Value
//                         := adsSalesDetail.FieldByName('GoodsID').Value;
      AdsPricequery.Open;
      SLPricequeryForm.Show;
    end;
  end;end;

procedure TSLEdSaleBillForm.DiscountModeExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TSLDiscountModeForm, SLDiscountModeForm);
  SLDiscountModeForm.ShowModal;
  SLDiscountModeForm.Free;
end;


procedure TSLEdSaleBillForm.ClientQLDBLookupEnter(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=true;
  GEdit1.Text :='0';
  GEdit1.Enabled :=false;
end;

procedure TSLEdSaleBillForm.ClientQLDBLookupExit(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    close;
    sql.Text := 'select sum(isnull(AmountBalance,0)) as Balance from '
        + 'SLClearBillMaster where RecordState<>' + QuotedStr('删除')
        + ' and ClientID='+ClientName.fieldbyname('ID').AsString;
    open;
    GEdit1.Enabled :=true;
    if  adoTemp.IsEmpty then     GEdit1.Text :='0'
      else   GEdit1.Text :=fieldbyname('Balance').asstring;
    GEdit1.Enabled :=False;
  end;
end;

end.
