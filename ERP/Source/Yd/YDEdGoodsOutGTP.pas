unit YDEdGoodsOutGTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TYDEdGoodsOutGTPForm = class(TBaseVoucherEditForm)
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
    Label7: TLabel;
    LookupPackUint: TQLDBLookupComboBox;
    TempAds: TADODataSet;
    adsMaster: TADODataSet;
    adsDetail: TADODataSet;
    adsDetailID: TAutoIncField;
    adsDetailMasterID: TIntegerField;
    adsDetailGoodsID: TIntegerField;
    adsDetailQuantity: TBCDField;
    adsDetailPackUnitID: TIntegerField;
    adsDetailPriceBase: TBCDField;
    adsDetailAmount: TBCDField;
    adsDetailGoalQuantity: TBCDField;
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
    DBEdit5: TDBEdit;
    adsDetailGoodsSpec: TStringField;
    adsGoodsSpec: TADODataSet;
    dsGoodsSpec: TDataSource;
    adsMasterEmployee: TStringField;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    adsDetailGoalUnit: TStringField;
    StockQuerry: TAction;
    adsMasterWarehouseID: TIntegerField;
    adsWarehouse: TADODataSet;
    dsWarehouse: TDataSource;
    LookupWarehouse: TQLDBLookupComboBox;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    PriceQuery: TADOQuery;
    Label4: TLabel;
    OriginCode: TQLDBLookupComboBox;
    YDProductPlanCode: TADODataSet;
    DsYDProductPlanCode: TDataSource;
    adsMasterOriginCode: TStringField;
    TempAds1: TADODataSet;
    DBComboBox1: TDBComboBox;
    TpPackUnit: TADOQuery;
    adsDetailGoodsName: TStringField;
    adsDetailQuantityPcs: TBCDField;
    adsDetailPriceGoal: TBCDField;
    adsDetailDiscount: TBCDField;
    adsDetailTaxAmount: TBCDField;
    adsDetailSundryFee: TBCDField;
    PackUintFltAQ: TADODataSet;
    PackUintFltDS: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure adsDetailPackUnitIDChange(Sender: TField);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure OriginCodeClick(Sender: TObject);
    procedure adsDetailGoalQuantityChange(Sender: TField);
    procedure LookupPackUintEnter(Sender: TObject);
    procedure LookupPackUintExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  YDEdGoodsOutGTPForm: TYDEdGoodsOutGTPForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TYDEdGoodsOutGTPForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','YDGoodsOutMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='生产领料';
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='YDGoodsOutMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TYDEdGoodsOutGTPForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TYDEdGoodsOutGTPForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  PackUnit.Close;
  adsWarehouse.Close;
  adsGoodsSpec.Close;
  PriceQuery.Close;
  PriceQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#Tempprice')
        +' )) DROP TABLE #Tempprice ' ;
  PriceQuery.ExecSQL;
end;

procedure TYDEdGoodsOutGTPForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'YDGoodsOut';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  adsWarehouse.Open;
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
  YDProductPlanCode.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from YDGoodsOutMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('出库');
  PriceQuery.Close;
  PriceQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#Tempprice')
        +' )) DROP TABLE #Tempprice '   ;
  PriceQuery.ExecSQL;
  PriceQuery.Close;
  PriceQuery.SQL.Text :=' create table #Tempprice ('
        +' ID [int] IDENTITY (1, 1) NOT NULL , '
        +' GoodsID [int] NULL ,                '
        +' GoalUnitID [int] NULL ,                '
        +' GoalQuantity [float] NULL ,         '
        +' CostPrice [float] NULL ,            '
        +' Amount [float] NULL)                ';
   PriceQuery.ExecSQL;
   PriceQuery.Close;
   PriceQuery.SQL.Text :=' insert into #Tempprice (GoodsID,GoalUnitID , '
      +' GoalQuantity,Amount )'
      +' select goodsid,GoalUnitID,sum(isnull(GoalQuantity,0)) as GoalQuantity , '
      +' sum(isnull(Amount,0)) as Amount from (  '
      +' select GoodsID,GoalUnitID,isnull(GoalQuantity,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as GoalQuantity, '
      +' isnull(Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) '
      +' as Amount,recordstate  from PCgoodsIndetail a '
      +' left outer join PCgoodsInMaster b on b.id=a.MasterID WHERE Amount<>0 '
      +' UNION ALL                                                                 '
      +' select GoodsID,GoalUnitID,isnull(GoalQuantity,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  as GoalQuantity, '
      +' isnull(Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) '
      +' as Amount,recordstate from YDgoodsIndetail a '
      +' left outer join YDgoodsInMaster b on b.id=a.MasterID Where Amount<>0 '
      +' UNION ALL '
      +' select GoodsID,GoalUnitID,isnull(GoalQuantity,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as GoalQuantity,'
      +' isnull(Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) '
      +' as Amount,recordstate  from YDgoodsIndetail a '
      +' left outer join STgoodsCountOffMaster b on b.id=a.MasterID '
      +' Where Amount<>0 '
      +' and  BillMode like '+Quotedstr('%库存盘盈%')+ ' ) as a '
      +' where RecordState<>'+Quotedstr('删除')
      +' group by GoodsID ,GoalUnitID  ';
   PriceQuery.ExecSQL;
   PriceQuery.Close;
   PriceQuery.SQL.Text :=' Update #Tempprice  set CostPrice = '
       +' Amount/GoalQuantity where GoalQuantity<>0 ';
   PriceQuery.ExecSQL;
end;

procedure TYDEdGoodsOutGTPForm.FormShow(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempPackUnit8')
        +' )) DROP TABLE #TempPackUnit8 ' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.SQL.Text :=' create table #TempPackUnit8 ('
      +'	PID [int] IDENTITY (1, 1) NOT NULL ,'
      +'	ID [int] NULL ,'
      +'	[CreateDate] [datetime] NULL ,       '
      +'	[CreateUserID] [int] NULL ,          '
      +'	[RecordState] [varchar] (12)  NULL , '
      +'	[Name] [varchar] (20)   NULL ,'
      +'	[ExchangeRate] [decimal](9, 4) NULL ,'
      +'	[GoalUnitID] [int] NULL ,            '
      +'	[IsGoalUnit] [bit] NOT NULL    )     ';
  adoTemp.ExecSQL;
  ClientQLDBLookup.SetFocus;
end;

procedure TYDEdGoodsOutGTPForm.adsDetailPackUnitIDChange(Sender: TField);
var   ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;
  adsDetail.FieldByName('Amount').AsFloat :=
    adsDetail.fieldbyname('GoalQuantity').asfloat*adsDetail.fieldbyname('PriceGoal').AsFloat;

  adsDetail.FieldByName('Quantity').AsFloat :=
    adsDetail.fieldbyname('GoalQuantity').AsFloat/ExChRate;

  if adsDetail.FieldByName('Quantity').AsFloat<>0 then
  adsDetail.FieldByName('PriceBase').AsFloat :=
    adsDetail.fieldbyname('Amount').asfloat/adsDetail.fieldbyname('Quantity').AsFloat;
end;



procedure TYDEdGoodsOutGTPForm.adsDetailGoodsIDChange(Sender: TField);
var SGoodsID,SUnitID:integer;
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) or
        (adsDetail.fieldbyname('GoodsID').AsInteger=0) then exit;
  SGoodsID :=adsDetail.fieldbyname('GoodsID').AsInteger;

  TempAds.Close;   //取标准单位和基本单价
  TempAds.CommandText :='select UnitID,PriceSales from DAGoods where Id='
      + QuotedStr(adsDetail.fieldbyname('GoodsID').AsString);
  TempAds.Open;
  if  TempAds.FieldByName('UnitID').IsNull then SunitID :=1
     else SunitID :=TempAds.FieldByName('UnitID').AsInteger;
  adsDetail.FieldByName('GoalUnitID').AsInteger :=SunitID;
  adsDetail.FieldByName('PackUnitID').AsInteger :=SunitID;

  PriceQuery.Close;
  PriceQuery.SQL.Text :=' select CostPrice from #Tempprice'
      +' where GoodsID='+adsDetail.fieldbyname('GoodsID').AsString;
  PriceQuery.Open;
  adsDetail.FieldByName('PriceGoal').AsFloat := PriceQuery.FieldByName('CostPrice').AsFloat;

end;

procedure TYDEdGoodsOutGTPForm.OriginCodeClick(Sender: TObject);
var   OrID :string;
begin
  inherited;
  if not adsMaster.fieldbyname('OriginID').IsNull then   OrID :=adsMaster.fieldbyname('OriginID').AsString
    else OrID :='0';
  TempAds1.Close;
  TempAds1.CommandText :=' select  '
      +' a.ID ,a.MasterID,a.GoodsID,A.GoodsSpec, a.Quantity , '
      +' a.PackUnitID,a.QuantityPcs ,a.PriceBase ,            '
      +' a.Amount , a.GoodsOutID, a.Discount , a.TaxAmount ,a.SundryFee , '
      +' a.GoalUnitID, a.GoalQuantity ,a.Memo '
      +' from YDProductPlanDetail a '
      +' left outer join YDProductPlanMaster b on b.ID=a.MasterID'
      +' where b.ID='+OrID
      +' and Isnull(GoodsID,0)<>0 ';
  TempAds1.Open;
  if TempAds1.IsEmpty then exit;
  TempAds1.First;
  DBGrid.DataSource :=nil;
  while not adsDetail.eof do  adsDetail.Delete;
  while not TempAds1.eof do
  begin
    if adsDetail.Eof then adsDetail.append
        else adsDetail.Edit;
    adsDetail.fieldbyname('GoodsID').AsInteger :=TempAds1.fieldbyname('GoodsID').AsInteger ;
    adsDetail.fieldbyname('GoodsSpec').AsString :=TempAds1.fieldbyname('GoodsSpec').AsString ;
    adsDetail.fieldbyname('GoalUnitID').AsInteger :=TempAds1.fieldbyname('PackUnitID').AsInteger ;
    adsDetail.fieldbyname('PackUnitID').AsInteger :=TempAds1.fieldbyname('PackUnitID').AsInteger;
    adsDetail.fieldbyname('GoalQuantity').AsFloat :=TempAds1.fieldbyname('Quantity').AsFloat;
    adsDetail.fieldbyname('PriceGoal').AsFloat :=TempAds1.fieldbyname('PriceBase').AsFloat    ;
    adsDetail.fieldbyname('Amount').AsFloat :=TempAds1.fieldbyname('Amount').AsFloat    ;
    TempAds1.Next;
  end;
  adsDetail.Append;
  
  DBGrid.DataSource :=DetailDataSource;
end;

procedure TYDEdGoodsOutGTPForm.adsDetailGoalQuantityChange(Sender: TField);
var   ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;
  adsDetail.FieldByName('Amount').AsFloat :=
    adsDetail.fieldbyname('GoalQuantity').asfloat*adsDetail.fieldbyname('PriceGoal').AsFloat;

  adsDetail.FieldByName('Quantity').AsFloat :=
    adsDetail.fieldbyname('GoalQuantity').AsFloat/ExChRate;

  if adsDetail.FieldByName('Quantity').AsFloat<>0 then
  adsDetail.FieldByName('PriceBase').AsFloat :=
    adsDetail.fieldbyname('Amount').asfloat/adsDetail.fieldbyname('Quantity').AsFloat;
end;

procedure TYDEdGoodsOutGTPForm.LookupPackUintEnter(Sender: TObject);
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

procedure TYDEdGoodsOutGTPForm.LookupPackUintExit(Sender: TObject);
begin
  LookupPackUint.ListSource :=dsPackUnit;
end;

end.
