unit SLEdSaleDsct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, QuickRpt;

type
  TSLEdSaleDsctForm = class(TBaseVoucherEditForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    GoodName: TADODataSet;
    Label5: TLabel;
    PackUnit: TADODataSet;
    dsPackUnit: TDataSource;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    LookupEmployee: TQLDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    LookupPackUint: TQLDBLookupComboBox;
    TempAds: TADODataSet;
    adsMaster: TADODataSet;
    adsDetail: TADODataSet;
    adsDetailID: TAutoIncField;
    adsDetailMasterID: TIntegerField;
    adsDetailGoodsID: TIntegerField;
    adsDetailQuantity: TBCDField;
    adsDetailQuantityPcs: TBCDField;
    adsDetailPackUnitID: TIntegerField;
    adsDetailPriceBase: TBCDField;
    adsDetailAmount: TBCDField;
    adsDetailDiscount: TBCDField;
    adsDetailGoalQuantity: TBCDField;
    adsDetailSundryFee: TBCDField;
    adsDetailGoalUnitID: TIntegerField;
    adsMasterID: TAutoIncField;
    adsMasterCreateDate: TDateTimeField;
    adsMasterCreateUserID: TIntegerField;
    adsMasterRecordState: TStringField;
    adsMasterDate: TDateTimeField;
    adsMasterCode: TStringField;
    adsMasterClientID: TIntegerField;
    adsMasterBillMode: TStringField;
    adsMasterPeriodID: TIntegerField;
    adsMasterClearDate: TDateTimeField;
    adsMasterMemo: TStringField;
    adsMasterSundryFee: TBCDField;
    Label8: TLabel;
    adsMasterClientName: TStringField;
    adsDetailPackUnit: TStringField;
    DiscountMode: TAction;
    adsMasterEmployeeID: TIntegerField;
    adsMasterApportion: TStringField;
    adsMasterDeliver: TStringField;
    adsMasterOriginID: TIntegerField;
    adsMasterOriginTable: TStringField;
    adsMasterBillAffix: TBytesField;
    adsDetailMemo: TStringField;
    adsMasterBrief: TStringField;
    BriefComboBox: TDBComboBox;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    GEdit1: TGEdit;
    adsDetailTaxAmount: TBCDField;
    adsDetailGoodsSpec: TStringField;
    adsGoodsSpec: TADODataSet;
    dsGoodsSpec: TDataSource;
    adsMasterEmployee: TStringField;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    adsDetailGoalUnit: TStringField;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    adsMasterWarehouseID: TIntegerField;
    TempActualCost: TADODataSet;
    adsDetailPriceCost: TBCDField;
    adsDetailGoodsName: TStringField;
    FillInPrintAction: TAction;
    FillInPrintMenu: TMenuItem;
    NoCreditSale: TCheckBox;
    ADODataSet1: TADODataSet;
    PackUintFltAQ: TADODataSet;
    PackUintFltDS: TDataSource;
    adsDetailPriceGoal: TBCDField;
    DBEdit6: TDBEdit;
    adsMasterCashDiscount: TBCDField;
    adsDetailDiscountAmount: TFloatField;
    adsDetailPriceStandard: TFloatField;
    DiscountTempAct: TMenuItem;
    DiscountAddAct: TMenuItem;
    adsDetailPriceRate: TFloatField;
    RepeatPrintAction: TAction;
    RepeatPrintMenu: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure adsDetailQuantityChange(Sender: TField);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure ClientQLDBLookupEnter(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FillInPrintActionExecute(Sender: TObject);
    procedure LookupPackUintEnter(Sender: TObject);
    procedure NoCreditSaleClick(Sender: TObject);
    procedure LookupPackUintExit(Sender: TObject);
    procedure adsDetailPackUnitIDChange(Sender: TField);
    procedure DBEdit6Enter(Sender: TObject);
    procedure DiscountTempActClick(Sender: TObject);
    procedure DiscountAddActClick(Sender: TObject);
    procedure adsDetailAmountChange(Sender: TField);
    procedure adsDetailPriceRateChange(Sender: TField);
    procedure RepeatPrintActionExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateReport: TQuickRep; override;
    procedure InternalSave; override;
  public
     SLPubQuerrySql,SLPubQuerryCaption,NewOrEditFlag:string;
     PriceBeforeDiscount,ReplacePoint:Real;
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;

  end;

var
  SLEdSaleDsctForm: TSLEdSaleDsctForm;

implementation

uses CommonDM, WSUtils, WSSecurity, SLRpSale, BaseVoucherRpt, CRCtrls,
    Math, QLDBAgg;

{$R *.dfm}
procedure TSLEdSaleDsctForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime:=Date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SLSaleMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BIllMode').ReadOnly :=False;

  if NoCreditSale.Checked then   adsMaster.FieldByName('BillMode').AsString:='现款销售'
    else   adsMaster.FieldByName('BillMode').AsString:='销售开单';
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
  adsMaster.FieldByName('OriginTable').AsString:='SLSaleMaster';
  NewOrEditFlag :='新增状态';
end;

procedure TSLEdSaleDsctForm.Open(VoucherID: Integer);
var
  SaveOnClick: TNotifyEvent;
begin
  inherited Open(VoucherID);
  SaveOnClick := NoCreditSale.OnClick;
  NoCreditSale.OnClick := nil;
  if Trim(adsMaster.FieldByName('BillMode').AsString)='现款销售'  then
     NoCreditSale.Checked :=True
    else NoCreditSale.Checked :=False;
  NoCreditSale.OnClick := SaveOnClick;
end;


procedure TSLEdSaleDsctForm.FormClose(Sender: TObject;
  var Action: TCloseAction);

begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  PackUnit.Close;
  adsGoodsSpec.Close;
end;

procedure TSLEdSaleDsctForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'SLSale';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  PackUintFltAQ.open;
  TempAds.close;
  TempAds.CommandText :='select distinct levelcode from DAAttribute'
      +' where name like'+Quotedstr('%商品%')+' and upid=-1';
  TempAds.open;
  TempAds.First;
  GoodsSpecStr :=' where (1<>1 ';
  while not TempAds.Eof do
  begin
    GoodsSpecStr :=GoodsSpecStr+' or Levelcode like '+Quotedstr('%'+
        Trim(TempAds.fieldbyname('Levelcode').AsString)+'%') ;
    TempAds.Next;
  end;
  GoodsSpecStr :=' select * from DAAttribute '+ GoodsSpecStr
      +' ) and (upid<>-1 and Recordstate<>'+Quotedstr('删除')+')';
  adsGoodsSpec.Close;
  adsGoodsSpec.CommandText :=GoodsSpecStr;
  adsGoodsSpec.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from SLSaleMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('销售');
  NewOrEditFlag :='编辑状态';
  ReplacePoint :=-1; 
end;

procedure TSLEdSaleDsctForm.adsDetailGoodsIDChange(Sender: TField);
var SGoodsID,SClientID:integer;
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) then exit;
  SGoodsID :=adsDetail.fieldbyname('GoodsID').AsInteger;
  if (adsMaster.fieldbyname('ClientID').IsNull) then  SClientID :=0
    else  SClientID :=adsMaster.fieldbyname('ClientID').AsInteger;
  TempAds.Close;
  TempAds.CommandText :=' select ID,UnitID from DAGoods where ID='+inttostr(SGoodsID);
  TempAds.Open;
  if (TempAds.FieldByName('UnitID').IsNull)  then
  begin
    adsDetail.FieldByName('GoalUnitID').AsInteger :=1;
    adsDetail.FieldByName('PackUnitID').AsInteger :=1;
  end  else
  begin
    adsDetail.FieldByName('GoalUnitID').AsInteger :=TempAds.FieldByName('UnitID').AsInteger;
    adsDetail.FieldByName('PackUnitID').AsInteger :=TempAds.FieldByName('UnitID').AsInteger;
  end;
  TempActualCost.Close;
  TempActualCost.CommandText :=' select CostPrice from #TpCostPrice'
    +' where GoodsID= '+ Inttostr(SGoodsID) ;
  TempActualCost.Open;
  adsDetail.FieldByName('PriceCost').AsFloat := TempActualCost.FieldByName('CostPrice').AsFloat  ;

  if Guarder.ContractSLPrice='是' then
  begin
    TempAds.Close;   //取当前客户的合同售价
    TempAds.CommandText :=' SELECT b.Date,a.PriceGoal '
      +' FROM SLContractPriceDetail a  '
      +' LEFT JOIN SLContractPriceMaster  b on b.ID=a.MasterID '
      +' where b.RecordState<>'+Quotedstr('删除')
      +' and b.RecordState<>'+Quotedstr('作废')
      +' and   a.GoodsID='+inttostr(SGoodsID)
      +' and b.ClientID='+inttostr(SClientID)
      +'  order by b.Date DESC ';
    TempAds.Open;
  end else
  begin
    TempAds.Close;   //取当前客户的合同售价和标准单位
    TempAds.CommandText :=' SELECT b.Date,a.PriceGoal '
      +' FROM SLContractPriceDetail a  '
      +' LEFT JOIN SLContractPriceMaster  b on b.ID=a.MasterID '
      +' where 1=2 ' ;
    TempAds.Open;
  end;

  if (Guarder.LastadjustSLPrice='是') and (TempAds.IsEmpty)  then
  begin
    TempAds.Close;   //取当前商品的最新调价
    TempAds.CommandText :=' SELECT b.Date,a.PriceGoal '
      +' FROM SLSalePriceDetail a  '
      +' LEFT JOIN SLSalePriceMaster  b on b.ID=a.MasterID '
      +' where b.RecordState<>'+Quotedstr('删除')
      +' and b.RecordState<>'+Quotedstr('作废')
      +' and   a.GoodsID='+inttostr(SGoodsID)
      +'  order by b.Date DESC ';
    TempAds.Open;
//    Memo1.Text :=  TempAds.CommandText;
  end;
//  showmessage('----');

  if (Guarder.LastSLPrice='是') and (TempAds.IsEmpty)  then
  begin
    TempAds.Close;   //取当前商品，当前客户的最新售价
    TempAds.CommandText :=' SELECT b.Date,a.PriceGoal '
      +' FROM SLSaleDetail a  '
      +' LEFT JOIN SLSaleMaster  b on b.ID=a.MasterID '
      +' where b.RecordState<>'+Quotedstr('删除')
      +' and b.RecordState<>'+Quotedstr('作废')
      +' and   a.GoodsID='+inttostr(SGoodsID)
      +' and b.ClientID='+inttostr(SClientID)
      +'  order by b.Date DESC ';
    TempAds.Open;
  end;

  if TempAds.IsEmpty  then
  begin
    TempAds.Close;   //取当前商品的参考进价
    TempAds.CommandText :=' SELECT PriceSales PriceGoal '
      +' FROM DAGoods    '
      +' where RecordState<>'+Quotedstr('删除')
      +' and RecordState<>'+Quotedstr('作废')
      +' and ID='+inttostr(SGoodsID);
    TempAds.Open;
  end;

  if (Guarder.UseDiscountSLFlag='是') then
  begin
    TempActualCost.Close;   //取当前客户,当前商品的折扣率
    TempActualCost.CommandText :=' SELECT b.Date,a.PriceGoal '
      +' FROM SLSaleDiscountDetail a  '
      +' LEFT JOIN SLSaleDiscountMaster  b on b.ID=a.MasterID '
      +' where b.RecordState<>'+Quotedstr('删除')
      +' and b.RecordState<>'+Quotedstr('作废')
      +' and   a.GoodsID='+inttostr(SGoodsID)
      +' and b.ClientID='+inttostr(SClientID)
      +'  order by b.Date DESC ';
    TempActualCost.Open;
    PriceBeforeDiscount := TempAds.FieldByName('PriceGoal').AsFloat  ;
    adsDetail.FieldByName('PriceStandard').AsFloat := TempAds.FieldByName('PriceGoal').AsFloat  ;
    if TempActualCost.FieldByName('PriceGoal').AsFloat=0 then
      adsDetail.FieldByName('PriceRate').AsFloat :=100
    else adsDetail.FieldByName('PriceRate').AsFloat :=TempActualCost.FieldByName('PriceGoal').AsFloat  ;
    adsDetail.FieldByName('PriceBase').AsFloat :=
      TempAds.FieldByName('PriceGoal').AsFloat*
        adsDetail.FieldByName('PriceRate').AsFloat/100  ;
    adsDetail.FieldByName('PriceGoal').AsFloat :=
      TempAds.FieldByName('PriceGoal').AsFloat*
        adsDetail.FieldByName('PriceRate').AsFloat/100  ;
  end else
  begin
    adsDetail.FieldByName('PriceBase').AsFloat := TempAds.FieldByName('PriceGoal').AsFloat  ;
    adsDetail.FieldByName('PriceGoal').AsFloat := TempAds.FieldByName('PriceGoal').AsFloat  ;
    adsDetail.FieldByName('PriceRate').AsFloat :=100;
    PriceBeforeDiscount := TempAds.FieldByName('PriceGoal').AsFloat  ;
    adsDetail.FieldByName('PriceStandard').AsFloat := TempAds.FieldByName('PriceGoal').AsFloat  ;
  end;

end;

procedure TSLEdSaleDsctForm.adsDetailQuantityChange(Sender: TField);
var   ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;
  if ReplacePoint=-1 then
     adsDetail.FieldByName('PriceStandard').AsFloat :=adsDetail.fieldbyname('PriceBase').AsFloat;

  adsDetail.FieldByName('GoalQuantity').AsFloat :=
    adsDetail.fieldbyname('Quantity').AsFloat*ExChRate;

  adsDetail.FieldByName('Amount').AsFloat :=
    adsDetail.fieldbyname('Quantity').asfloat*adsDetail.fieldbyname('PriceBase').AsFloat;

  if adsDetail.fieldbyname('GoalQuantity').AsFloat<>0 then
    adsDetail.FieldByName('PriceGoal').AsFloat :=
      adsDetail.fieldbyname('Amount').asfloat /adsDetail.fieldbyname('GoalQuantity').AsFloat;
//  adsDetail.fieldbyname('PriceStandard').asfloat :=/adsDetail.fieldbyname('GoalQuantity').AsFloat;


end;


procedure TSLEdSaleDsctForm.ClientQLDBLookupEnter(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=true;
  GEdit1.Text :='0';
  GEdit1.Enabled :=false;
end;

procedure TSLEdSaleDsctForm.ClientQLDBLookupExit(Sender: TObject);
var  adoTemp: TADOQuery;
     FstDate:Tdatetime;
begin
  inherited;
  if   (adsMaster.fieldbyname('ClientID').IsNull) or
          (adsMaster.fieldbyname('ClientID').AsInteger=0)  then exit;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    close;
    sql.Text :=' select sum(isnull(AmountD,0)) as Balance from '
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
    close;
    sql.Text :=' select QuotaAmountMin from SLCredit where '
        +' RecordState<>'+ Quotedstr('删除')
        +' and ClientID='+ adsMaster.fieldbyname('ClientID').AsString ;
    open;

    if (NewOrEditFlag='新增状态') and not (fieldbyname('QuotaAmountMin').IsNull) then
    begin
      adsMaster.Edit;
      adsMaster.fieldbyname('ClearDate').AsDateTime :=
          adsMaster.fieldbyname('Date').AsDateTime+ fieldbyname('QuotaAmountMin').AsInteger
    end;
  end;
end;

procedure TSLEdSaleDsctForm.FormActivate(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TpCostPrice')
        +' )) DROP TABLE #TpCostPrice ' ;
  adoTemp.ExecSQL;

  adoTemp.Close;
  adoTemp.SQL.Text :=' create table #TpCostPrice ('
      +'	ID [int] IDENTITY (1, 1) NOT NULL ,'
      +'	GoodsID [int] NULL ,               '
      +'	GoalQuantity [float] NULL ,   '
      +'	CostPrice [float] NULL ,           '
      +'	Amount [float] NULL)   '   ;
  adoTemp.ExecSQL;
  with adoTemp do
  begin
    close;     //计算销售产品的临时成本单价
    Sql.Text :=' truncate Table #TpCostPrice'  ;
    ExecSQL;
    close;
    Sql.Text :=' insert into  #TpCostPrice ('
      +' 	GoodsID, GoalQuantity,Amount )'
      +' select goodsid,sum(isnull(GoalQuantity,0)),sum(isnull(Amount,0)) '
      +' from (   '
      +' select GoodsID,GoalQuantity*Isnull(ModeDC,1)*Isnull(ModeC,1) as GoalQuantity,Amount*Isnull(ModeDC,1)*Isnull(ModeC,1) '
      +'  as Amount,recordstate  from PCgoodsIndetail a  '
      +' left outer join PCgoodsInMaster b on b.id=a.MasterID WHERE Amount<>0'
      +' UNION ALL                                                 '
      +' select GoodsID,GoalQuantity*Isnull(ModeDC,1)*Isnull(ModeC,1) as GoalQuantity,Amount*Isnull(ModeDC,1)*Isnull(ModeC,1)'
      +'  as Amount,recordstate from YDgoodsIndetail a                                  '
      +' left outer join YDgoodsInMaster b on b.id=a.MasterID Where Amount<>0'
      +' UNION ALL                                                                          '
      +' select GoodsID,GoalQuantity*Isnull(ModeDC,1)*Isnull(ModeC,1) as GoalQuantity,Amount*Isnull(ModeDC,1)*Isnull(ModeC,1)           '
      +'  as Amount,recordstate  from YDgoodsIndetail a                                 '
      +' left outer join STgoodsCountOffMaster b on b.id=a.MasterID Where Amount<>0'
      +' and BillMode like '+Quotedstr('%库存盘盈%' )+ ' ) as a  '
      +' where RecordState<>'+QuotedStr('删除')
      +' group by GoodsID  ' ;
    ExecSQL;
    close;
    Sql.Text :=' Update  #TpCostPrice  set CostPrice=abs(Amount/ '
        +' GoalQuantity) where GoalQuantity<>0';
    ExecSQL;
    close;
    Sql.Text :=' insert into  #TpCostPrice (GoodsID, CostPrice )'
        +' select ID,abs(PricePurchase) from DAgoods where ID not in '
        +' (select distinct GoodsID from #TpCostPrice)' ;
    ExecSQL;
  end;
  ClientQLDBLookup.SetFocus;
  if Guarder.FillInPrintFlag='是' then
  begin
    ToolButton11.Visible :=True;
    FillInPrintMenu.Visible :=True;
  end else
  begin
    ToolButton11.Visible :=False ;
    FillInPrintMenu.Visible :=False ;
  end;
  if Guarder.RepeatPrintFlag='是' then
  begin
    ToolButton12.Visible :=True ;
    RepeatPrintMenu.Visible :=True ;
  end else
  begin
    ToolButton12.Visible :=False ;
    RepeatPrintMenu.Visible :=False ;
  end;
end;

procedure TSLEdSaleDsctForm.FormDeactivate(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TpCostPrice')
        +' )) DROP TABLE #TpCostPrice ' ;
  adoTemp.ExecSQL;
end;


function TSLEdSaleDsctForm.CreateReport: TQuickRep;
begin
  Result := TSLSaleVoucherReport.Create(Self);
  TBaseVoucherReport(Result).SetMasterDataSet(MasterDataSet);
end;

procedure TSLEdSaleDsctForm.FillInPrintActionExecute(Sender: TObject);

  function CurrencyUpperCaseHitch(Value: Currency): string;

    function OnesPlace(X: Double): Integer;
    begin
      Result := Trunc(X);
      Result := Result - Result div 10 * 10;
    end;

  var
    I, N: Integer;
    S: string;
  begin
    Result := '';
    Value := Round(Value * Power(10, 2)) / Power(10, 2);
    for I := 7 downto 0 do
    begin
      N := OnesPlace(Value / Power(10, I - 2));
      S := NumberToHZ(N, 1);
      if S = '' then S := '零';
      if Result = '' then Result := S
      else Result := Result + '     ' + S;
    end;
  end;

var
  ExePath: string;
  S1, S2, S3, S4, S5, S6, S7: string;
begin
  inherited;
  ExePath := ExtractFilePath(Application.ExeName);
  with DetailDataSet do
  begin
    First;
    while not Eof do
    begin
      S1 := S1 + #13#10 + FieldByName('GoodsName').DisplayText;
      S2 := S2 + #13#10 + FieldByName('GoodsSpec').DisplayText;
      S3 := S3 + #13#10 + FieldByName('PackUnit').DisplayText;
      S4 := S4 + #13#10 + FieldByName('Quantity').DisplayText;
      S5 := S5 + #13#10 + FieldByName('PriceBase').DisplayText;
      S6 := S6 + #13#10 + FieldByName('Amount').DisplayText;
      S7 := S7 + #13#10 + FieldByName('Memo').DisplayText;
      Next;
    end;
  end;
  with TReportRuntime.Create(Self) do
  begin
    ReportFile := ExePath + 'Reports\Sale.ept';
    SetDataSet('Master', MasterDataSet);
    SetDataSet('Detail', DetailDataSet);
    SetVarValue('S1', S1);
    SetVarValue('S2', S2);
    SetVarValue('S3', S3);
    SetVarValue('S4', S4);
    SetVarValue('S5', S5);
    SetVarValue('S6', S6);
    SetVarValue('S7', S7);
    SetVarValue('QuantityTotal', CurrToStrF(DBGrid.AggregateList.Aggregates.FindAggregate(atSum, 'GoalQuantity').AggregateValue, ffFixed, 2));
    SetVarValue('AmountTotal', CurrToStrF(DBGrid.AggregateList.Aggregates.FindAggregate(atSum, 'Amount').AggregateValue, ffCurrency, 2));
    SetVarValue('AmountTotalHZ', CurrencyUpperCaseHitch(DBGrid.AggregateList.Aggregates.FindAggregate(atSum, 'Amount').AggregateValue));
    PrintPreview(True);
  end;
end;

procedure TSLEdSaleDsctForm.LookupPackUintEnter(Sender: TObject);
var GoodsIDstr :string;
begin
  GoodsIDstr :=adsDetail.fieldbyname('GoodsID').asstring;
  if Trim(GoodsIDstr)='' then  exit;
  LookupPackUint.ListSource := PackUintFltDS;
  PackUintFltAQ.Close;
  PackUintFltAQ.CommandText :=' select ID, Name, ExchangeRate, GoalUnitID,'
      +' IsGoalUnit from MSUnit where RecordState<>'+Quotedstr('删除')
      +' and  GoalUnitID in (select UnitID from DaGoods where ID='
      +GoodsIDstr +' ) order by GoalUnitID,ExchangeRate' ;
  PackUintFltAQ.Open;
end;

procedure TSLEdSaleDsctForm.NoCreditSaleClick(Sender: TObject);
begin
  if NoCreditSale.Checked then
  begin
    adsMaster.Edit;
    if pos(Trim(NoCreditSale.Caption),Trim(adsMaster.FieldByName('Memo').AsString))<=0 then
      adsMaster.FieldByName('Memo').AsString :=
          Copy( Trim(NoCreditSale.Caption)+Trim(adsMaster.FieldByName('Memo').AsString),1,60);
    adsMaster.FieldByName('BillMode').AsString :='现款销售';
    RemarkDBEdit.ReadOnly :=True;
  end else
  begin
    adsMaster.Edit;
    if pos(Trim(NoCreditSale.Caption),Trim(adsMaster.FieldByName('Memo').AsString))>0 then
      adsMaster.FieldByName('Memo').AsString :=
        StringReplace( Trim(adsMaster.FieldByName('Memo').AsString) ,
          Trim(NoCreditSale.Caption),'',[rfReplaceAll, rfIgnoreCase]);
    adsMaster.FieldByName('BillMode').AsString :='销售开单';
    RemarkDBEdit.ReadOnly :=False;
  end;
  DBEdit6.ReadOnly :=not NoCreditSale.Checked;
  if DBEdit6.ReadOnly then
  begin
    adsMaster.Edit;
    adsMaster.FieldByName('CashDiscount').Value :=null;
  end;
end;

procedure TSLEdSaleDsctForm.LookupPackUintExit(Sender: TObject);
begin
  LookupPackUint.ListSource :=dsPackUnit;
end;

procedure TSLEdSaleDsctForm.adsDetailPackUnitIDChange(Sender: TField);
var ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;
  adsDetail.FieldByName('PriceBase').AsFloat := PriceBeforeDiscount*ExChRate;
  adsDetail.FieldByName('PriceStandard').AsFloat := PriceBeforeDiscount*ExChRate;


  if adsDetail.FieldByName('GoalQuantity').AsFloat<>0 then
  begin
    adsDetail.FieldByName('Memo').AsString :=
        Trim(Floattostr(adsDetail.FieldByName('Quantity').AsFloat))
          +'['+Trim(adsDetail.FieldByName('PackUnit').AsString)+']';
   end;
end;

procedure TSLEdSaleDsctForm.DBEdit6Enter(Sender: TObject);
begin
  DBEdit6.ReadOnly :=not NoCreditSale.Checked;
  if DBEdit6.ReadOnly then
  begin
    adsMaster.Edit;
    adsMaster.FieldByName('CashDiscount').Value :=null;
  end;
end;

procedure TSLEdSaleDsctForm.InternalSave;
var adoTemp: TADOQuery;
    code,AccountIDStr,MasterIDStr,IDStr:string;
    MasterID:Integer;
begin
  inherited;

  if (adsMaster.fieldbyname('ID').AsInteger=0) or
         (adsMaster.fieldbyname('ID').IsNull)  then exit;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    //--------------判断将要插入的记录是否已经正在于SLGoodsOutMaster,不存在就插入
    Close;
    sql.Text :=' select  b.ID from SLSaleDetail a '
        +' left outer join SLSaleMaster b on a.MasterID=b.ID '
        +' where isnull(a.goodsId,0)<>0   '
        +' and isnull(a.GoalQuantity,0)<>0 '
        +' and b.id=' + adsMaster.fieldbyname('ID').AsString
        +' and b.RecordState<>' + QuotedStr('删除')
        +' and b.ID not in '
        +' (select top 1 OriginID from SLGoodsOutMaster where '
        +' OriginTable='+ QuotedStr('SLSaleMaster')
        +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
    open;
    if  not adoTemp.IsEmpty then //判断完毕,开始插入
    begin
        code :=GetMaxCode('Code','SLGoodsOutMaster',number);
        close;
        sql.Text := 'insert into SLGoodsOutMaster ( CreateUserID,'
            +' Date, Code, ClientID, EmployeeID, BillMode,  '
            +' ModeDC,ModeC, Brief, ClearDate, SundryFee, Apportion,  '
            +' Deliver, Memo, BillAffix ,OriginID, OriginTable ) '
            +' select CreateUserID,Date, '+ QuotedStr(code)+ ' ,'
            +' ClientID, EmployeeID,BillMode ,'
            +' ModeDC,ModeC, '+QuotedStr('销售开单自动提交') +' ,'
            +' ClearDate, SundryFee, Apportion, '
            +' Deliver, '+ QuotedStr('销售单号:')
            +' +code, BillAffix, ID, '+QuotedStr('SLSaleMaster')
            +' from SLSaleMaster '
            +' where id=' +adsMaster.fieldbyname('ID').AsString
            +' and RecordState<>'+QuotedStr('删除')
            +' and ID not in '
            +' (select top 1 OriginID from SLGoodsOutMaster where '
            +' OriginTable='+ QuotedStr('SLSaleMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
        ExecSQL; //插入出库主表记录完毕
        close;
        sql.Text := 'select top 1 ID from SLGoodsOutMaster  where '
            +' OriginTable='+ QuotedStr('SLSaleMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString;
        open;
        if adoTemp.IsEmpty then MasterID :=0
            else MasterID :=adoTemp.FieldByName('ID').AsInteger;
        sql.Text := 'insert into SLGoodsOutDetail ( '
              +' MasterID, GoodsID, GoodsSpec,    '
              +' Quantity, QuantityPcs, PackUnitID, '
              +' GoalUnitID, GoalQuantity, Memo )   '
              +' select '+ Inttostr(MasterID) + ' , a.GoodsID, a.GoodsSpec, '
              +' a.Quantity, a.QuantityPcs, a.PackUnitID, '
              +' a.GoalUnitID, a.GoalQuantity, a.Memo  '
              +' from  SLSaleDetail a '
              +' left outer join SLSalemaster b on a.MasterID=b.ID'
              +' where isnull(a.GoodsID,0)<>0 '
              +' and isnull(a.GoalQuantity,0)<>0 '
              +' and a.MasterID='+ adsMaster.fieldbyname('ID').AsString
              +' and b.RecordState<>'+QuotedStr('删除');
        ExecSQL;//插入出库子表记录完毕
        close;
        Sql.Text :=' update SLGoodsOutDetail set '
            +' SLGoodsOutDetail.PriceGoal=#TpCostPrice.Costprice '
            +' from SLGoodsOutDetail left outer join  #TpCostPrice '
            +' on #TpCostPrice.goodsid=SLGoodsOutDetail.goodsid '
            +' where MasterID='+ Inttostr(MasterID);
        Execsql;
        close;
        Sql.Text :=' update  SLGoodsOutDetail set Amount=GoalQuantity*PriceGoal '
             +' where MasterID= '+ Inttostr(MasterID);
        ExecSQL;

        close;
        Sql.Text :=' update  SLGoodsOutDetail set PriceBase=Amount/Quantity'
             +' where GoalQuantity<>0 and  MasterID= '+ Inttostr(MasterID);
        ExecSQL;
       //计算销售产品的临时成本单价完毕
    end;
  end;
//判断是否要插入销售结算表
  if ( adsMaster.FieldByName('BillMode').AsString ='现款销售' )  then
  begin
    adoTemp.Close;
    adoTemp.SQL.Text :='select OriginID from FNClearSLMaster'
        +' where OriginTable='+Quotedstr('SLSaleMaster')
        +' and RecordState<>'+Quotedstr('删除')+' and OriginID='
        + adsMaster.fieldbyname('ID').AsString ;
    adoTemp.Open;
    if adoTemp.IsEmpty then
    begin
      adoTemp.Close;
      adoTemp.SQL.Text :=' select * from FNAccounts '
          +' where AccountType like '+Quotedstr('%现金%')
          +' and RecordState<>'+Quotedstr('删除') ;
      adoTemp.open;

      AccountIDStr :=adoTemp.fieldbyname('ID').AsString;
      if Trim(AccountIDStr)='' then AccountIDStr :='1';

      IDStr :=adsMaster.fieldbyname('ID').AsString;
      if Trim(IDStr)='' then IDStr :='0';
      adoTemp.Close;
      adoTemp.SQL.Text :=' Insert into FNClearSLMaster ('
          +' CreateUserID,Date,Code,BillMode,ModeDC,ModeC,'
          +' Brief, ClientID, EmployeeID,AccountsID, AmountD,   '
          +' AmountC,AmountRed,Memo, OriginID, OriginTable)     '
          +' select  CreateUserID, Date,                        '
          +Quotedstr(GetMaxCode('Code','FNClearSLMaster',number))+' , '
          +Quotedstr('现销结算')+' BillMode, ModeDC, ModeC, '
          +Quotedstr('现款销售')+' as Brief,         '
          +' ClientID, EmployeeID, '+ AccountIDStr+' as  AccountID , '
          +' (isnull(b.Amount,0)+isnull(a.SundryFee,0)-isnull(CashDiscount,0) )'
          +' as AmountD, '
          +' 0.00,CashDiscount,   '
          +Quotedstr('现款销售')+' as Memo, a.ID, '
          +Quotedstr('SLSaleMaster')
          +' from SLSaleMaster a                                 '
          +' left outer join                                     '
          +' ( select MasterID,Sum(Isnull(Amount,0)) as Amount   '
          +' from SLSaleDetail                                   '
          +' Group by MasterID ) b on B.MasterID=a.ID            '
          +' where a.ID='+IDStr  ;
      adoTemp.ExecSQL;

      AccountIDStr := adsMaster.fieldbyname('ID').AsString;
      if Trim(AccountIDStr)='' then AccountIDStr :='0';

      adoTemp.Close;
      adoTemp.SQL.Text :='select ID from FNClearSLMaster '
          +' where OriginID='+AccountIDStr+' and OriginTable='
          +Quotedstr('SLSaleMaster') ;
      adoTemp.Open; //选定新插入记录(FNClearSLMaster表)的ID号
      MasterIDStr :=adoTemp.fieldbyname('ID').AsString;
      if Trim(MasterIDStr)='' then MasterIDStr :='0';

      adoTemp.Close;
      adoTemp.SQL.Text :=' Insert into FNClearSLDetail ('
          +' MasterID,OriginID,Amount)'
          +' select  '+MasterIDStr +'as MasterID,'
          +' a.ID as OriginID, '
          +' (isnull(b.Amount,0)+isnull(a.SundryFee,0) ) as Amount '
          +' from SLSaleMaster a                                 '
          +' left outer join                                     '
          +' ( select MasterID,Sum(Isnull(Amount,0)) as Amount   '
          +' from SLSaleDetail                                   '
          +' Group by MasterID ) b on B.MasterID=a.ID            '
          +' where a.ID='+IDStr  ;
    adoTemp.ExecSQL;
    end;
  end;
end;

procedure TSLEdSaleDsctForm.DiscountTempActClick(Sender: TObject);
var RateStr:string;
  RateStrF :Double;
begin
  inherited;
  if InputQuery('临时折扣率', '请输入折扣率:', RateStr) then
    while not TryStrToFloat(RateStr,RateStrF) do
     if not InputQuery('临时折扣率', '请输入折扣率:', RateStr) then exit;
  if RateStrF =0 then exit;
  ReplacePoint:=1;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    adsDetail.FieldByName('PriceRate').AsFloat :=RateStrF;
    adsDetail.Next;
  end;
  ReplacePoint:=-1;
end;

procedure TSLEdSaleDsctForm.DiscountAddActClick(Sender: TObject);
var RateStr:string;
  RateStrF :Double;
begin
  inherited;
  if InputQuery('追加折扣率', '请输入折扣率:', RateStr) then
    while not TryStrToFloat(RateStr,RateStrF) do
     if InputQuery('追加折扣率', '请输入折扣率:', RateStr) then exit;
  if RateStrF =0 then exit;
     
  ReplacePoint:=1;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    adsDetail.FieldByName('PriceRate').AsFloat :=
      adsDetail.FieldByName('PriceRate').AsFloat*RateStrF/100;
    adsDetail.Next;
  end;
  ReplacePoint:=-1;
end;

procedure TSLEdSaleDsctForm.adsDetailAmountChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  adsDetail.FieldByName('DiscountAmount').AsFloat :=
    adsDetail.FieldByName('Amount').AsFloat*
      (100-adsDetail.FieldByName('PriceRate').AsFloat)/100;
end;

procedure TSLEdSaleDsctForm.adsDetailPriceRateChange(Sender: TField);
begin
  inherited;
  ReplacePoint:=1;
  adsDetail.Edit;
  adsDetail.FieldByName('PriceBase').AsFloat :=
    adsDetail.FieldByName('PriceStandard').AsFloat*
      (adsDetail.FieldByName('PriceRate').AsFloat)/100;
  ReplacePoint:=-1;
end;

procedure TSLEdSaleDsctForm.RepeatPrintActionExecute(Sender: TObject);
var RateStr:string;
  RateStrF :Double;
begin
  inherited;
  if InputQuery('重打调整参数', '重打调整参数:', RateStr) then
    while not TryStrToFloat(RateStr,RateStrF) do
     if not InputQuery('重打调整参数', '重打调整参数:', RateStr) then exit;
  {adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    adsDetail.FieldByName('PriceBase').AsFloat :=
      adsDetail.FieldByName('PriceBase').AsFloat*RateStrF/100;
    adsDetail.FieldByName('PriceRate').AsFloat :=
      adsDetail.FieldByName('PriceRate').AsFloat*RateStrF/100;
    adsDetail.Next;
  end;}
end;

end.
