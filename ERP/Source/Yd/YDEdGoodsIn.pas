unit YDEdGoodsIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TYDEdGoodsInForm = class(TBaseVoucherEditForm)
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
    Label4: TLabel;
    YDProductPlanCode: TADODataSet;
    DsYDProductPlanCode: TDataSource;
    adsMasterOriginCode: TStringField;
    OriginCode: TQLDBLookupComboBox;
    TempAds1: TADODataSet;
    adsDetailGoodsName: TStringField;
    DBComboBox1: TDBComboBox;
    adsDetailQuantityPcs: TBCDField;
    adsDetailPriceGoal: TBCDField;
    adsDetailPriceCost: TBCDField;
    adsDetailDiscount: TBCDField;
    adsDetailTaxAmount: TBCDField;
    adsDetailSundryFee: TBCDField;
    PackUintFltAQ: TADODataSet;
    PackUintFltDS: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure adsDetailPackUnitIDChange(Sender: TField);
    procedure adsDetailQuantityChange(Sender: TField);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure OriginCodeClick(Sender: TObject);
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
  YDEdGoodsInForm: TYDEdGoodsInForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TYDEdGoodsInForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','YDGoodsInMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString :='生产入库';
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='YDGoodsInMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TYDEdGoodsInForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TYDEdGoodsInForm.FormClose(Sender: TObject;
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
  YDProductPlanCode.Close;
end;

procedure TYDEdGoodsInForm.FormCreate(Sender: TObject);
var  GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'YDGoodsIn';
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
  TempAds.CommandText :=' select Distinct brief from YDGoodsInMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('入库');

end;

procedure TYDEdGoodsInForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

procedure TYDEdGoodsInForm.adsDetailPackUnitIDChange(Sender: TField);
var   ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat ;

  adsDetail.FieldByName('GoalQuantity').AsFloat :=
    adsDetail.fieldbyname('Quantity').AsFloat*ExChRate ;

  adsDetail.FieldByName('PriceCost').AsFloat :=
    adsDetail.FieldByName('TaxAmount').AsFloat/adsDetail.FieldByName('GoalQuantity').AsFloat;

end;

procedure TYDEdGoodsInForm.adsDetailQuantityChange(Sender: TField);
var   ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;

  adsDetail.FieldByName('TaxAmount').AsFloat :=
     adsDetail.fieldbyname('Quantity').asfloat*adsDetail.fieldbyname('PriceBase').asfloat;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=adsDetail.fieldbyname('Quantity').AsFloat*ExChRate;

  adsDetail.FieldByName('PriceCost').AsFloat :=
    adsDetail.fieldbyname('TaxAmount').asfloat/adsDetail.fieldbyname('GoalQuantity').asfloat;
end;

procedure TYDEdGoodsInForm.adsDetailGoodsIDChange(Sender: TField);
var SUnitID:integer;
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) or
        (adsDetail.fieldbyname('GoodsID').AsInteger=0) then exit;
  TempAds.Close;   //取标准单位和基本单价
  TempAds.CommandText :='select UnitID,PriceSales from DAGoods where Id='
      + QuotedStr(adsDetail.fieldbyname('GoodsID').AsString);
  TempAds.Open;
  if TempAds.FieldByName('UnitID').IsNull then SUnitID:=1
     else SUnitID :=TempAds.FieldByName('UnitID').AsInteger;
  adsDetail.FieldByName('PackUnitID').AsInteger :=SUnitID;
  adsDetail.FieldByName('GoalUnitID').AsInteger :=SUnitID;

  adsDetail.FieldByName('PriceBase').AsFloat := TempAds.fieldbyname('PriceSales').AsFloat ;
  adsDetail.FieldByName('PriceGoal').AsFloat := TempAds.fieldbyname('PriceSales').AsFloat ;

end;

procedure TYDEdGoodsInForm.OriginCodeClick(Sender: TObject);
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
      +' and GoodsOutID<>0';
  TempAds1.Open;
  if TempAds1.IsEmpty then exit;
  TempAds1.First;
  DBGrid.DataSource :=nil;
  adsDetail.First;
  while not TempAds1.eof do
  begin
    if  adsDetail.Eof then adsDetail.append
        else adsDetail.Edit;
    if (adsMaster.fieldbyname('ID').AsInteger<>0) and (not adsMaster.fieldbyname('ID').IsNull) then
        adsDetail.fieldbyname('MasterID').AsInteger :=adsMaster.fieldbyname('ID').AsInteger ;
    adsDetail.fieldbyname('GoodsID').AsInteger :=TempAds1.fieldbyname('GoodsOutID').AsInteger ;
    adsDetail.fieldbyname('Quantity').AsFloat :=TempAds1.fieldbyname('GoalQuantity').AsFloat;
    adsDetail.fieldbyname('PackUnitID').AsInteger :=TempAds1.fieldbyname('GoalUnitID').AsInteger ;
    adsDetail.fieldbyname('PriceCost').AsFloat :=TempAds1.fieldbyname('QuantityPcs').AsFloat    ;
    adsDetail.fieldbyname('PriceGoal').AsFloat :=TempAds1.fieldbyname('QuantityPcs').AsFloat    ;
    adsDetail.fieldbyname('PriceBase').AsFloat :=TempAds1.fieldbyname('QuantityPcs').AsFloat    ;
    adsDetail.fieldbyname('Amount').AsFloat :=TempAds1.fieldbyname('SundryFee').AsFloat;
    adsDetail.fieldbyname('TaxAmount').AsFloat :=TempAds1.fieldbyname('SundryFee').AsFloat;
    adsDetail.fieldbyname('GoalQuantity').AsFloat :=TempAds1.fieldbyname('GoalQuantity').AsFloat;
    adsDetail.fieldbyname('GoalUnitID').AsInteger :=TempAds1.fieldbyname('GoalUnitID').AsInteger ;
    adsDetail.Post;
    TempAds1.Next;
    adsDetail.Next;
  end;
  DBGrid.DataSource :=DetailDataSource;
end;

procedure TYDEdGoodsInForm.LookupPackUintEnter(Sender: TObject);
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

procedure TYDEdGoodsInForm.LookupPackUintExit(Sender: TObject);
begin
  LookupPackUint.ListSource :=dsPackUnit;
end;

end.
