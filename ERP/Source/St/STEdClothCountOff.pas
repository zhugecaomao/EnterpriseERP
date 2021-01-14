unit STEdClothCountOff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TSTEdClothCountOffForm = class(TBaseVoucherEditForm)
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
    adsDetailGoodsName: TStringField;
    TpPackUnit: TADOQuery;
    adsDetailPriceGoal: TBCDField;
    adsDetailQuantityPcs: TBCDField;
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
    GoodsSpecAds: TADODataSet;
    GoodsSpecDs: TDataSource;
    CapStyleLkup: TQLDBLookupComboBox;
    CapStyleAds: TADODataSet;
    CapStyleDs: TDataSource;
    SameQuantityAct: TAction;
    N33: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure adsDetailGoodsIDChange(Sender: TField);
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
  STEdClothCountOffForm: TSTEdClothCountOffForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TSTEdClothCountOffForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','STGoodsCountOffMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BillMode').AsString:='库存盘盈';
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='STGoodsCountOffMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
end;

procedure TSTEdClothCountOffForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSTEdClothCountOffForm.FormClose(Sender: TObject;
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
  PriceQuery.Close;
  PriceQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#Tempprice')
        +' )) DROP TABLE #Tempprice ' ;
  PriceQuery.ExecSQL;
end;

procedure TSTEdClothCountOffForm.FormCreate(Sender: TObject);
var GoodsSpecStr :string;
begin
  inherited;
  VoucherTableName := 'STGoodsCountOff';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  adsWarehouse.Open;
  GoodsSpecAds.Open;
  CapStyleAds.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from STGoodsCountOffMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('盘点');
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

procedure TSTEdClothCountOffForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

procedure TSTEdClothCountOffForm.adsDetailGoodsIDChange(Sender: TField);
begin
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

procedure TSTEdClothCountOffForm.SameQuantityActExecute(Sender: TObject);
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

procedure TSTEdClothCountOffForm.adsDetailSizeAChange(Sender: TField);
begin
  adsDetail.Edit;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=adsDetail.fieldbyname('SizeA').AsFloat
    +adsDetail.fieldbyname('SizeB').AsFloat+adsDetail.fieldbyname('SizeC').AsFloat
    +adsDetail.fieldbyname('SizeD').AsFloat+adsDetail.fieldbyname('SizeE').AsFloat
    +adsDetail.fieldbyname('SizeF').AsFloat+adsDetail.fieldbyname('QuantityPcs').AsFloat  ;
end;

procedure TSTEdClothCountOffForm.adsDetailGoalQuantityChange(
  Sender: TField);
begin
  adsDetail.Edit;
  adsDetail.FieldByName('Amount').AsFloat :=
    adsDetail.fieldbyname('GoalQuantity').AsFloat*adsDetail.fieldbyname('PriceGoal').AsFloat;
  adsDetail.FieldByName('Quantity').AsFloat :=adsDetail.fieldbyname('GoalQuantity').AsFloat;
  adsDetail.FieldByName('PriceBase').AsFloat :=adsDetail.fieldbyname('PriceGoal').AsFloat;
end;

end.
