unit EGEdMaterialOutGTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TEGEdMaterialOutGTPForm = class(TBaseVoucherEditForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    GoodName: TADODataSet;
    PackUnit: TADODataSet;
    dsPackUnit: TDataSource;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    LookupEmployee: TQLDBLookupComboBox;
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
    adsDetailGoodsName: TStringField;
    TpPackUnit: TADOQuery;
    AdsWareHouse: TADODataSet;
    DsWareHouse: TDataSource;
    LookupWareHouse: TQLDBLookupComboBox;
    Label6: TLabel;
    MaterialBalance: TMenuItem;
    FilterPackUint: TADODataSet;
    DSFilterPackUint: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure adsDetailPackUnitIDChange(Sender: TField);
    procedure adsDetailPriceBaseChange(Sender: TField);
    procedure adsDetailGoalQuantityChange(Sender: TField);
    procedure MaterialBalanceClick(Sender: TObject);
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
  EGEdMaterialOutGTPForm: TEGEdMaterialOutGTPForm;

implementation

uses CommonDM, WSUtils, WSSecurity ,VoucherQuery;

{$R *.dfm}
procedure TEGEdMaterialOutGTPForm.New;
begin
  inherited;           //  .Value:=Date;
  adsMaster.FieldByName('Date').AsDateTime:=Date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','EGMaterialOutMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BIllMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='项目进料';
  adsMaster.FieldByName('BIllMode').ReadOnly :=True;
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
  adsMaster.FieldByName('OriginTable').AsString:='EGMaterialOutMaster';
end;

procedure TEGEdMaterialOutGTPForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TEGEdMaterialOutGTPForm.FormClose(Sender: TObject;
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

procedure TEGEdMaterialOutGTPForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'EGMaterialOut';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  AdsWareHouse.Open;
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
  TempAds.CommandText :=' select Distinct brief from EGMaterialOutMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('领料');
end;

procedure TEGEdMaterialOutGTPForm.FormShow(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempPackUnit5')
        +' )) DROP TABLE #TempPackUnit5 ' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.SQL.Text :=' create table #TempPackUnit5 ('
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
  if DBGrid.Columns[0].Title.Caption='商品编码' then
     DBGrid.Columns[0].Title.Caption :='材料编码'   ;
  ClientQLDBLookup.SetFocus;
end;

procedure TEGEdMaterialOutGTPForm.adsDetailGoodsIDChange(Sender: TField);
var SGoodsID,SUnitID,IsInGoods:integer;
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) or (adsDetail.fieldbyname('GoodsID').AsInteger=0)
     then  SGoodsID :=1 else  SGoodsID :=adsDetail.fieldbyname('GoodsID').AsInteger;
  TempAds.Close;   //取标准单位和基本单价
  TempAds.CommandText :='select UnitID,PriceSales,PricePurchase  from DAGoods where Id='
      + Inttostr(SGoodsID);
  TempAds.Open;
  if  TempAds.FieldByName('UnitID').IsNull then SunitID :=1
    else SunitID :=TempAds.FieldByName('UnitID').AsInteger;

//  adsDetail.FieldByName('GoodsSpec').ReadOnly :=False;
  adsDetail.FieldByName('GoodsSpec').AsString  :=GoodName.fieldbyname('Spec').AsString;

//  adsDetail.FieldByName('GoalUnitID').ReadOnly :=False;
  adsDetail.FieldByName('GoalUnitID').AsInteger :=SunitID;
//  adsDetail.FieldByName('GoalUnitID').ReadOnly :=True;

//  adsDetail.FieldByName('PriceBase').ReadOnly :=False;
  if adsDetail.FieldByName('PriceBase').AsFloat=0 then
     adsDetail.FieldByName('PriceBase').AsFloat := TempAds.FieldByName('PricePurchase').AsFloat  ;
  if adsDetail.FieldByName('PriceBase').IsNull then adsDetail.FieldByName('PriceBase').AsFloat :=0;

  IsInGoods :=0;
  TpPackUnit.Close;
  TpPackUnit.SQL.Text :='Truncate Table #TempPackUnit5 ';
  TpPackUnit.ExecSQL;
  TpPackUnit.Close;
  TpPackUnit.SQL.Text :=' select a.AddUnitID ID, b.name,a.AddUnitRate '
    +' ExchangeRate,a.UnitID GoalUnitID,b.IsGoalUnit '
    +' from DAGoods a    '
    +' left outer join MSUnit b on b.ID=a.AddUnitID    '
    +' where a.AddUnitID is not null and AddUnitID<>0 and a.AddUnitRate '
    +' is not null and a.AddUnitRate<>0 and a.ID= '+inttostr(SGoodsID) ;
  TpPackUnit.Open;
  if not TpPackUnit.IsEmpty then
  begin
    IsInGoods :=1;
    TpPackUnit.Close;   //将商品资料表的单位换算率插入  #TempPackUnit5
    TpPackUnit.SQL.Text :=' insert into #TempPackUnit5 '
      +' (ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit )'
      +'select a.AddUnitID ID, b.name,a.AddUnitRate '
      +' ExchangeRate,a.UnitID GoalUnitID,b.IsGoalUnit '
      +' from DAGoods a    '
      +' left outer join MSUnit b on b.ID=a.AddUnitID    '
      +' where a.AddUnitID is not null and AddUnitID<>0 and a.AddUnitRate '
      +' is not null and a.AddUnitRate<>0 and a.ID= '+inttostr(SGoodsID) ;
    TpPackUnit.ExecSQL;
  end;
  TpPackUnit.Close;    //将单位资料表的换算率插入  #TempPackUnit5
  TpPackUnit.SQL.Text :=' insert into #TempPackUnit5 '
      +' (ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit )  '
      +' select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit '
      +' from MSUnit where RecordState<>'+QuotedStr('删除')
      +' Order by GoalUnitID,IsGoalUnit desc ';
  TpPackUnit.ExecSQL;
  PackUnit.Close;  //显示单位列表与换算率
  PackUnit.CommandText :=' select PID, ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit '
      +' from #TempPackUnit5 Order by PID';
  PackUnit.Open;
  if IsInGoods=0 then
  begin
   PackUnit.Locate('ID',Inttostr(SunitID),[]);
   if not PackUnit.Eof then PackUnit.Next;
  end else   PackUnit.First;
  adsDetail.FieldByName('PackUnitID').AsInteger :=PackUnit.FieldByName('ID').AsInteger;
end;


procedure TEGEdMaterialOutGTPForm.adsDetailPackUnitIDChange(Sender: TField);
var ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat ;
//  adsDetail.FieldByName('Quantity').ReadOnly :=False;
  adsDetail.FieldByName('Quantity').AsFloat :=
       adsDetail.fieldbyname('GoalQuantity').AsFloat/ExChRate;
//  adsDetail.FieldByName('Quantity').ReadOnly :=True;
end;

procedure TEGEdMaterialOutGTPForm.adsDetailPriceBaseChange(Sender: TField);
begin
  inherited;
//  adsDetail.FieldByName('Amount').ReadOnly :=False;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('GoalQuantity').asfloat
         *adsDetail.fieldbyname('PriceBase').AsFloat;
//  adsDetail.FieldByName('Amount').ReadOnly :=True;
end;


procedure TEGEdMaterialOutGTPForm.adsDetailGoalQuantityChange(Sender: TField);
var   ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;
//  adsDetail.FieldByName('Quantity').ReadOnly :=False;
  adsDetail.FieldByName('Quantity').AsFloat :=
       adsDetail.fieldbyname('GoalQuantity').AsFloat/ExChRate;
//  adsDetail.FieldByName('Quantity').ReadOnly :=True;

//  adsDetail.FieldByName('Amount').ReadOnly :=False;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('GoalQuantity').asfloat
         *adsDetail.fieldbyname('PriceBase').AsFloat;
//  adsDetail.FieldByName('Amount').ReadOnly :=True;
end;

procedure TEGEdMaterialOutGTPForm.MaterialBalanceClick(Sender: TObject);
begin
  inherited;
  
  ShowQueryForm(Caption,Hint,
        '  select  d.name [仓库名称], '
     +' e.name [材料名称],                                    '
     +' g.name [标准单位],                                    '
     +' sum(isnull(a.GoalQuantity,0) ) [标准数量] ,           '
     +' sum(isnull(a.Amount,0))/sum(isnull(a.GoalQuantity,0.0000001))  [平均单价] , '
     +' sum(isnull(a.Amount,0)) [金额] ,                       '
     +' f.name [包装单位],                                     '
     +' sum(isnull(a.Quantity,0)) [包装数量]                   '
     +' from ( select GoodsID,GoalUnitID,                      '
     +' b.WareHouseID,                                         '
     +' isnull(GoalQuantity,0.000000001)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) GoalQuantity ,           '
     +' PriceBase,                                             '
     +' Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) Amount,                        '
     +' Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) Quantity,                    '
     +' PackUnitID                                             '
     +' from EGMaterialInDetail a                              '
     +' left outer join EGMaterialInMaster b on b.Id=a.MasterID'
     +' where GoodsID<>0 and RecordState<>'+Quotedstr('删除')
     +' UNION  ALL                                             '
     +' select GoodsID,GoalUnitID,                             '
     +' b.WareHouseID,                                         '
     +' isnull(GoalQuantity,0.000000002)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)*(-1) GoalQuantity,       '
     +' PriceBase,                                             '
     +' Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)*(-1) Amount,                   '
     +' Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)*(-1) Quantity,               '
     +' PackUnitID                                             '
     +' from EGMaterialOutDetail a                             '
     +' left outer join EGMaterialOutMaster b on b.Id=a.MasterID  '
     +' where GoodsID<>0 and RecordState<>'+Quotedstr('删除')
     +'  ) as a                                                      '
     +' left outer join  STWareHouse   d  on d.ID=a.WareHouseID   '
     +' left outer join  DAGoods   e   on e.id=a.GoodsID          '
     +' left outer join  MSunit   f   on f.id=a.PackUnitID        '
     +' left outer join  MSunit   g   on g.id=E.UnitID        '
     +' group by d.name ,e.name ,g.name ,f.name                   ')

end;

procedure TEGEdMaterialOutGTPForm.LookupPackUintEnter(Sender: TObject);
var G_UnitID :String;
begin
  if not adsDetail.fieldbyname('GoalUnitID').IsNull then
    G_UnitID :=Inttostr(adsDetail.fieldbyname('GoalUnitID').AsInteger)
    else G_UnitID :='1';
  FilterPackUint.Close;
  FilterPackUint.CommandText :=' select ID, Name, ExchangeRate, GoalUnitID, '
    +' IsGoalUnit from MSUnit '
    +' where RecordState<>'+Quotedstr('删除')
    +' and GoalUnitID='+G_UnitID;
  FilterPackUint.Open;
  LookupPackUint.ListSource :=DSFilterPackUint;
end;

procedure TEGEdMaterialOutGTPForm.LookupPackUintExit(Sender: TObject);
begin
  LookupPackUint.ListSource :=dsPackUnit;
end;

end.
