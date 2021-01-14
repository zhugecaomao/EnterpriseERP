unit SLEdSaleClientGTP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TSLEdSaleClientGTPForm = class(TBaseVoucherEditForm)
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
    adsDetailGoodsName: TStringField;
    TpPackUnit: TADOQuery;
    PackUintFltAQ: TADODataSet;
    PackUintFltDS: TDataSource;
    adsDetailPriceCost: TBCDField;
    adsDetailPriceGoal: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure ClientQLDBLookupEnter(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
    procedure adsDetailGoalQuantityChange(Sender: TField);
    procedure LookupPackUintEnter(Sender: TObject);
  private
    { Private declarations }
  public
     SLPubQuerrySql,SLPubQuerryCaption:string;
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SLEdSaleClientGTPForm: TSLEdSaleClientGTPForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
procedure TSLEdSaleClientGTPForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=DAte;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SLSaleClientMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
//  adsMaster.FieldByName('BIllMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='连锁加盟销售';
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
  adsMaster.FieldByName('OriginTable').AsString:='SLSaleClientMaster';
end;

procedure TSLEdSaleClientGTPForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSLEdSaleClientGTPForm.FormClose(Sender: TObject;
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

procedure TSLEdSaleClientGTPForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'SLSale';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;

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
  TempAds.CommandText :=' select Distinct brief from SLSaleClientMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('客户销售');
end;

procedure TSLEdSaleClientGTPForm.FormShow(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempPackUnit1')
        +' )) DROP TABLE #TempPackUnit1 ' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.SQL.Text :=' create table #TempPackUnit1 ('
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

procedure TSLEdSaleClientGTPForm.adsDetailGoodsIDChange(Sender: TField);
var SGoodsID,SUnitID,IsInGoods:integer;
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) or (adsDetail.fieldbyname('GoodsID').AsInteger=0)
     then  SGoodsID :=1 else  SGoodsID :=adsDetail.fieldbyname('GoodsID').AsInteger;
  TempAds.Close;   //取标准单位和基本单价
  TempAds.CommandText :='select UnitID,PriceSales from DAGoods where Id='
      + Inttostr(SGoodsID);
  TempAds.Open;
  if  TempAds.FieldByName('UnitID').IsNull then SunitID :=1
    else SunitID :=TempAds.FieldByName('UnitID').AsInteger;

//  adsDetail.FieldByName('GoalUnitID').ReadOnly :=False;
  adsDetail.FieldByName('GoalUnitID').AsInteger :=SunitID;
//  adsDetail.FieldByName('GoalUnitID').ReadOnly :=True;

//  adsDetail.FieldByName('PriceBase').ReadOnly :=False;
  adsDetail.FieldByName('PriceBase').AsFloat := TempAds.FieldByName('PriceSales').AsFloat  ;
  if adsDetail.FieldByName('PriceBase').IsNull then adsDetail.FieldByName('PriceBase').AsFloat :=0;

  IsInGoods :=0;
  TpPackUnit.Close;
  TpPackUnit.SQL.Text :='Truncate Table #TempPackUnit1 ';
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
    TpPackUnit.Close;   //将商品资料表的单位换算率插入  #TempPackUnit1
    TpPackUnit.SQL.Text :=' insert into #TempPackUnit1 '
      +' (ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit )'
      +'select a.AddUnitID ID, b.name,a.AddUnitRate '
      +' ExchangeRate,a.UnitID GoalUnitID,b.IsGoalUnit '
      +' from DAGoods a    '
      +' left outer join MSUnit b on b.ID=a.AddUnitID    '
      +' where a.AddUnitID is not null and AddUnitID<>0 and a.AddUnitRate '
      +' is not null and a.AddUnitRate<>0 and a.ID= '+inttostr(SGoodsID) ;
    TpPackUnit.ExecSQL;
  end;
  TpPackUnit.Close;    //将单位资料表的换算率插入  #TempPackUnit1
  TpPackUnit.SQL.Text :=' insert into #TempPackUnit1 '
      +' (ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit )  '
      +' select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit '
      +' from MSUnit where RecordState<>'+QuotedStr('删除')
      +' Order by GoalUnitID,IsGoalUnit desc ';
  TpPackUnit.ExecSQL;
  PackUnit.Close;  //显示单位列表与换算率
  PackUnit.CommandText :=' select PID, ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit '
      +' from #TempPackUnit1 Order by PID';
  PackUnit.Open;
  if IsInGoods=0 then
  begin
   PackUnit.Locate('ID',Inttostr(SunitID),[]);
   if not PackUnit.Eof then PackUnit.Next;
  end else   PackUnit.First;
  adsDetail.FieldByName('PackUnitID').AsInteger :=PackUnit.FieldByName('ID').AsInteger;

end;



procedure TSLEdSaleClientGTPForm.ClientQLDBLookupEnter(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=true;
  GEdit1.Text :='0';
  GEdit1.Enabled :=false;
end;

procedure TSLEdSaleClientGTPForm.ClientQLDBLookupExit(Sender: TObject);
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
        +' ( select 0 as AmountD,b.Amount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as AmountC   '
        +' from SLSaleMaster a left outer join                        '
        +' (select MasterID,sum(isnull(amount,0))-                   '
        +' -sum(isnull(Discount,0))+sum(isnull(TaxAmount,0))         '
        +' +sum(isnull(SundryFee,0)) as amount '
        +' from  SLSaleDetail  group by  MasterId) as b on a.ID=b.MasterID '
        +' where a.ClientID='+adsMaster.fieldbyname('ClientID').AsString
        +' and RecordState<>'+QuotedStr('删除') +' )'
        +' UNION ALL '
        +' ( select Sum(Isnull(AmountD*Isnull(ModeDC,1)*Isnull(ModeC,1),0)) as AmountD,   '
        +'   Sum(Isnull(AmountRed*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1),0)) as Amountc   '
        +' from FNClearSLMaster where ClientID='
        + adsMaster.fieldbyname('ClientID').AsString
        +' and RecordState<>'+QuotedStr('删除') +' ) '
        +'  ) as SLBalance';
    open;
    GEdit1.Enabled :=true;
    if  adoTemp.IsEmpty then     GEdit1.Text :='0'
      else   GEdit1.Text :=fieldbyname('Balance').asstring;
    GEdit1.Enabled :=False;
  end;
end;

procedure TSLEdSaleClientGTPForm.adsDetailGoalQuantityChange(Sender: TField);
var ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
//  if not PackUnit.Locate('ID', Sender.AsInteger, []) then
//    raise Exception.Create('内部错误');
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;
  adsDetail.FieldByName('Amount').AsFloat :=
    adsDetail.fieldbyname('GoalQuantity').asfloat*adsDetail.fieldbyname('PriceGoal').AsFloat;

  adsDetail.FieldByName('Quantity').AsFloat :=
    adsDetail.fieldbyname('GoalQuantity').AsFloat/ExChRate;
    
  if adsDetail.FieldByName('Quantity').AsFloat<>0 then
  adsDetail.FieldByName('PriceBase').AsFloat :=
    adsDetail.fieldbyname('Amount').AsFloat/adsDetail.FieldByName('Quantity').AsFloat;
end;

procedure TSLEdSaleClientGTPForm.LookupPackUintEnter(Sender: TObject);
var GoodsIDstr :string;
begin
  if adsDetail.FieldByName('GoodsID').IsNull then Exit;
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

end.
