unit STEdGoodsOutInGTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TSTEdGoodsOutInGTPForm = class(TBaseVoucherEditForm)
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
    LookupEmployee: TQLDBLookupComboBox;
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
    YDProductPlanCode: TADODataSet;
    DsYDProductPlanCode: TDataSource;
    adsMasterOriginCode: TStringField;
    TempAds1: TADODataSet;
    DBComboBox1: TDBComboBox;
    ClientQLDBLookup: TQLDBLookupComboBox;
    adsDetailGoodsName: TStringField;
    TpPackUnit: TADOQuery;
    PackUintFltAQ: TADODataSet;
    PackUintFltDS: TDataSource;
    adsDetailPriceGoal: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure adsDetailGoalQuantityChange(Sender: TField);
    procedure LookupPackUintEnter(Sender: TObject);
    procedure LookupPackUintExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  STEdGoodsOutInGTPForm: TSTEdGoodsOutInGTPForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TSTEdGoodsOutInGTPForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','STGoodsOutInMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BillMode').AsString:='商品调拨';
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='STGoodsOutInMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
end;

procedure TSTEdGoodsOutInGTPForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSTEdGoodsOutInGTPForm.FormClose(Sender: TObject;
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

procedure TSTEdGoodsOutInGTPForm.FormCreate(Sender: TObject);
var GoodsSpecStr :string;
begin
  inherited;
  VoucherTableName := 'STGoodsOutIn';
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
  TempAds.CommandText :=' select Distinct brief from STGoodsOutInMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('调拨');
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

procedure TSTEdGoodsOutInGTPForm.FormShow(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempPackUnit10')
        +' )) DROP TABLE #TempPackUnit10 ' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.SQL.Text :=' create table #TempPackUnit10 ('
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
end;

procedure TSTEdGoodsOutInGTPForm.adsDetailGoodsIDChange(Sender: TField);
var SGoodsID,SUnitID:integer;
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) or
        (adsDetail.fieldbyname('GoodsID').AsInteger=0) then exit;
  SGoodsID :=adsDetail.fieldbyname('GoodsID').AsInteger;
  TempAds.Close;   //取标准单位和基本单价
  TempAds.CommandText :='select UnitID,PricePurchase from DAGoods where Id='
      + QuotedStr(adsDetail.fieldbyname('GoodsID').AsString);
  TempAds.Open;
  if (TempAds.FieldByName('UnitID').IsNull) then SunitID :=1
    else SunitID :=TempAds.FieldByName('UnitID').AsInteger;
  adsDetail.FieldByName('GoalUnitID').AsInteger :=SunitID;
  adsDetail.FieldByName('PackUnitID').AsInteger :=SunitID;
  adsDetail.FieldByName('PriceGoal').AsFloat :=TempAds.FieldByName('PricePurchase').AsFloat;
end;

procedure TSTEdGoodsOutInGTPForm.adsDetailGoalQuantityChange(Sender: TField);
var   ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;

  adsDetail.FieldByName('Quantity').AsFloat :=
    adsDetail.fieldbyname('GoalQuantity').AsFloat/ExChRate;

  adsDetail.FieldByName('Amount').AsFloat :=
    adsDetail.fieldbyname('GoalQuantity').asfloat*adsDetail.fieldbyname('PriceGoal').AsFloat;

  if adsDetail.FieldByName('Quantity').AsFloat<>0 then
  adsDetail.FieldByName('PriceBase').AsFloat :=
    adsDetail.fieldbyname('Amount').asfloat /adsDetail.fieldbyname('Quantity').AsFloat;
end;

procedure TSTEdGoodsOutInGTPForm.LookupPackUintEnter(Sender: TObject);
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

procedure TSTEdGoodsOutInGTPForm.LookupPackUintExit(Sender: TObject);
begin
  LookupPackUint.ListSource :=dsPackUnit;
end;

procedure TSTEdGoodsOutInGTPForm.FormActivate(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;

procedure TSTEdGoodsOutInGTPForm.ClientQLDBLookupExit(Sender: TObject);
var IDStr :string;
begin
  IDStr :=adsMaster.fieldbyname('ClientID').AsString;
  if Trim(IDStr)<>'' then IDStr := ' and ID<>'+IDStr;
  adsWarehouse.Close;
  adsWarehouse.CommandText :=' SELECT ID, Name from STWarehouse '
      +' where RecordState<>' + Quotedstr('删除')+IDStr
      +' and not (UpID=-1 and (Name like '
      + Quotedstr('%所有%')+'  or Name like '
      + Quotedstr('%全部%')+' ))';
  adsWarehouse.Open;
end;

end.
