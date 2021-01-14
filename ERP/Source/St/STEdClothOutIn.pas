unit STEdClothOutIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TSTEdClothOutInForm = class(TBaseVoucherEditForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    WareHouseOutADS: TADODataSet;
    EmployeeName: TADODataSet;
    GoodName: TADODataSet;
    Label5: TLabel;
    PackUnit: TADODataSet;
    dsPackUnit: TDataSource;
    WareHouseOutDS: TDataSource;
    DSEmployeeName: TDataSource;
    LookupEmployee: TQLDBLookupComboBox;
    GoodsSpecLkup: TQLDBLookupComboBox;
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
    adsMasterEmployee: TStringField;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    adsDetailGoalUnit: TStringField;
    StockQuerry: TAction;
    adsMasterWarehouseID: TIntegerField;
    WarehouseInADS: TADODataSet;
    WarehouseInDS: TDataSource;
    WarehouseInLkup: TQLDBLookupComboBox;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    PriceQuery: TADOQuery;
    TempAds1: TADODataSet;
    DBComboBox1: TDBComboBox;
    WareHouseOutLKup: TQLDBLookupComboBox;
    adsDetailGoodsName: TStringField;
    adsDetailQuantityPcs: TBCDField;
    adsDetailPriceGoal: TBCDField;
    adsDetailDiscount: TBCDField;
    adsDetailTaxAmount: TBCDField;
    adsDetailSundryFee: TBCDField;
    adsDetailCapStyle: TStringField;
    adsDetailSizeA: TIntegerField;
    adsDetailSizeB: TIntegerField;
    adsDetailSizeC: TIntegerField;
    adsDetailSizeD: TIntegerField;
    adsDetailSizeE: TIntegerField;
    adsDetailSizeF: TIntegerField;
    SameQuantityAct: TAction;
    N33: TMenuItem;
    GoodsSpecAds: TADODataSet;
    GoodsSpecDs: TDataSource;
    CapStyleLkup: TQLDBLookupComboBox;
    CapStyleAds: TADODataSet;
    CapStyleDs: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure WareHouseOutLKupExit(Sender: TObject);
    procedure SameQuantityActExecute(Sender: TObject);
    procedure adsDetailSizeAChange(Sender: TField);
    procedure adsDetailGoalQuantityChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  STEdClothOutInForm: TSTEdClothOutInForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TSTEdClothOutInForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','STGoodsOutInMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BillMode').AsString:='库存调拨';
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='STGoodsOutInMaster';
end;

procedure TSTEdClothOutInForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSTEdClothOutInForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  WareHouseOutADS.Close;
  EmployeeName.Close;
  GoodName.Close;
  PackUnit.Close;
  WarehouseInADS.Close;
  GoodsSpecAds.Close;
  PriceQuery.Close;
  PriceQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#Tempprice')
        +' )) DROP TABLE #Tempprice ' ;
  PriceQuery.ExecSQL;
end;

procedure TSTEdClothOutInForm.FormCreate(Sender: TObject);
var GoodsSpecStr :string;
begin
  inherited;
  VoucherTableName := 'STGoodsOutIn';
  WareHouseOutADS.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  CapStyleAds.Open;
  WarehouseInADS.Open;
  GoodsSpecAds.Open;
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
  PriceQuery.SQL.Text :=' select a.GoodsID, c.UnitID GoalUnitID , '
    +' Sum(isnull(a.GoalQuantity,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) GoalQuantity, '
    +' Sum(isnull(a.Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) CostPrice , '
    +' Sum(isnull(a.Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) Amount '
    +' Into #Tempprice from PCgoodsIndetail a '
    +' left outer join PCPurchaseMaster b on b.id=a.MasterID '
    +' left outer join  DAGoods         c on c.id=a.GoodsID '
    +' WHERE Isnull(a.Amount,0)+Isnull(a.GoalQuantity,0) <>0 '
    +' and b.RecordState<>'+Quotedstr('删除')
    +' and b.RecordState<>'+Quotedstr('作废')
    +' group by a.GoodsID ,c.UnitID  ';
  PriceQuery.ExecSQL;
  PriceQuery.Close;
  PriceQuery.SQL.Text :=' Update #Tempprice  set CostPrice =Null  ';
  PriceQuery.ExecSQL;
  PriceQuery.Close;
  PriceQuery.SQL.Text :=' Update #Tempprice  set CostPrice = '
     +' Isnull(Amount,0)/GoalQuantity where Isnull(GoalQuantity,0) <>0 ';
  PriceQuery.ExecSQL;

  PriceQuery.Close;
  PriceQuery.SQL.Text :=' Insert Into #Tempprice (GoodsID,GoalUnitID, '
    +' GoalQuantity, CostPrice , Amount )'
    +' Select ID GoodsID,UnitID GoalUnitID, PricePurchase CostPrice, '
    +' 1,1   from DAGoods   '
    +' WHERE RecordState<>'+Quotedstr('删除')
    +' and ID Not In (Select GoodsID from #Tempprice)' ;
  PriceQuery.ExecSQL;
end;

procedure TSTEdClothOutInForm.adsDetailGoodsIDChange(Sender: TField);
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) or
        (adsDetail.fieldbyname('GoodsID').AsInteger=0) then exit;
  TempAds.Close;   //取标准单位和成本单价
  TempAds.CommandText :='select *  from #Tempprice where '
    +' GoodsID='+ QuotedStr(adsDetail.fieldbyname('GoodsID').AsString);
  TempAds.Open;
  adsDetail.FieldByName('GoalUnitID').AsInteger :=TempAds.FieldByName('GoalUnitID').AsInteger;
  adsDetail.FieldByName('PackUnitID').AsInteger :=TempAds.FieldByName('GoalUnitID').AsInteger;
  adsDetail.FieldByName('PriceBase').AsFloat :=TempAds.FieldByName('CostPrice').AsFloat;
  adsDetail.FieldByName('PriceGoal').AsFloat :=TempAds.FieldByName('CostPrice').AsFloat;
end;

procedure TSTEdClothOutInForm.FormActivate(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;

procedure TSTEdClothOutInForm.WareHouseOutLKupExit(Sender: TObject);
var IDStr :string;
begin
  IDStr :=adsMaster.fieldbyname('ClientID').AsString;
  if Trim(IDStr)<>'' then IDStr := ' and ID<>'+IDStr;
  WarehouseInADS.Close;
  WarehouseInADS.CommandText :=' SELECT ID, Name from STWarehouse '
      +' where RecordState<>' + Quotedstr('删除') +IDStr
      +' and not (UpID=-1 and (Name like '
      + Quotedstr('%所有%')+'  or Name like '
      + Quotedstr('%全部%')+' ))';
  WarehouseInADS.Open;
end;

procedure TSTEdClothOutInForm.SameQuantityActExecute(Sender: TObject);
begin
  if adsDetail.fieldbyname('SizeA').AsFloat=0 then
  begin
    adsDetail.FieldByName('SizeA').AsFloat :=adsDetail.fieldbyname('SizeB').AsFloat;
    if adsDetail.fieldbyname('SizeA').AsFloat=0 then
      adsDetail.FieldByName('SizeA').AsFloat :=adsDetail.fieldbyname('SizeC').AsFloat;
    if adsDetail.fieldbyname('SizeA').AsFloat=0 then
      adsDetail.FieldByName('SizeA').AsFloat :=adsDetail.fieldbyname('SizeD').AsFloat;
    if adsDetail.fieldbyname('SizeA').AsFloat=0 then
      adsDetail.FieldByName('SizeA').AsFloat :=adsDetail.fieldbyname('SizeE').AsFloat;
    if adsDetail.fieldbyname('SizeA').AsFloat=0 then
      adsDetail.FieldByName('SizeA').AsFloat :=adsDetail.fieldbyname('SizeF').AsFloat;
  end;
  adsDetail.Edit;
  adsDetail.FieldByName('SizeB').AsFloat :=adsDetail.fieldbyname('SizeA').AsFloat;
  adsDetail.FieldByName('SizeC').AsFloat :=adsDetail.fieldbyname('SizeA').AsFloat;
  adsDetail.FieldByName('SizeD').AsFloat :=adsDetail.fieldbyname('SizeA').AsFloat;
  adsDetail.FieldByName('SizeE').AsFloat :=adsDetail.fieldbyname('SizeA').AsFloat;
  adsDetail.FieldByName('SizeF').AsFloat :=adsDetail.fieldbyname('SizeA').AsFloat;
end;

procedure TSTEdClothOutInForm.adsDetailSizeAChange(Sender: TField);
begin
  adsDetail.Edit;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=adsDetail.fieldbyname('SizeA').AsFloat
    +adsDetail.fieldbyname('SizeB').AsFloat+adsDetail.fieldbyname('SizeC').AsFloat
    +adsDetail.fieldbyname('SizeD').AsFloat+adsDetail.fieldbyname('SizeE').AsFloat
    +adsDetail.fieldbyname('SizeF').AsFloat+adsDetail.fieldbyname('QuantityPcs').AsFloat  ;
end;

procedure TSTEdClothOutInForm.adsDetailGoalQuantityChange(Sender: TField);
begin
  adsDetail.Edit;
  adsDetail.FieldByName('Amount').AsFloat :=
    adsDetail.fieldbyname('GoalQuantity').AsFloat*adsDetail.fieldbyname('PriceGoal').AsFloat;
  adsDetail.FieldByName('Quantity').AsFloat :=adsDetail.fieldbyname('GoalQuantity').AsFloat;
  adsDetail.FieldByName('PriceBase').AsFloat :=adsDetail.fieldbyname('PriceGoal').AsFloat;
end;

end.
