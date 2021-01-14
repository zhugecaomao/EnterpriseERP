unit FAEdAssetAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TFAEdAssetAddForm = class(TBaseVoucherEditAForm)
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
    adsDetailGoodsName: TStringField;
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
    adsDetailTaxAmount: TBCDField;
    adsDetailGoodsSpec: TStringField;
    LookupGoodsSpec: TQLDBLookupComboBox;
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
    N51: TMenuItem;
    N81: TMenuItem;
    N101: TMenuItem;
    N121: TMenuItem;
    N151: TMenuItem;
    N201: TMenuItem;
    DSGoodName: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure adsDetailQuantityChange(Sender: TField);
    procedure adsDetailPackUnitIDChange(Sender: TField);
    procedure adsDetailPriceBaseChange(Sender: TField);
    procedure N33Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure N121Click(Sender: TObject);
    procedure N151Click(Sender: TObject);
    procedure N201Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  FAEdAssetAddForm: TFAEdAssetAddForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TFAEdAssetAddForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','FAAssetAddMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='资产增加';
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='FAAssetAddMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TFAEdAssetAddForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TFAEdAssetAddForm.FormClose(Sender: TObject;
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
end;

procedure TFAEdAssetAddForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'FAAssetAdd';
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
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from FAAssetAddMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('资产名称[001]');

end;

procedure TFAEdAssetAddForm.adsDetailGoodsIDChange(Sender: TField);
var SGoodsID,SUnitID:integer;
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) or (adsDetail.fieldbyname('GoodsID').AsInteger=0)
     then  SGoodsID :=1 else  SGoodsID :=adsDetail.fieldbyname('GoodsID').AsInteger;
  TempAds.Close;   //取标准单位和基本单价
  TempAds.CommandText :='select UnitID,PriceSales,PricePurchase  from DAGoods where Id='
      + Inttostr(SGoodsID);
  TempAds.Open;
//  adsDetail.FieldByName('GoalUnitID').ReadOnly :=False;
//  adsDetail.FieldByName('PackUnitID').ReadOnly :=False;
  if  (TempAds.FieldByName('UnitID').IsNull) or (TempAds.FieldByName('UnitID').AsInteger=0) then
      begin
        adsDetail.FieldByName('GoalUnitID').AsInteger :=1;
        adsDetail.FieldByName('PackUnitID').AsInteger :=1;
      end  else
      begin
        adsDetail.FieldByName('GoalUnitID').AsInteger :=TempAds.FieldByName('UnitID').AsInteger;
        adsDetail.FieldByName('PackUnitID').AsInteger :=TempAds.FieldByName('UnitID').AsInteger;
      end;
//  adsDetail.FieldByName('PriceBase').ReadOnly :=False;
  if adsDetail.FieldByName('PriceBase').AsFloat=0 then
     adsDetail.FieldByName('PriceBase').AsFloat := TempAds.FieldByName('PricePurchase').AsFloat  ;
  if adsDetail.FieldByName('PriceBase').IsNull then adsDetail.FieldByName('PriceBase').AsFloat :=0;
  if  TempAds.FieldByName('UnitID').IsNull then SunitID :=1
    else SunitID :=TempAds.FieldByName('UnitID').AsInteger;
  { PackUnit.Close;    //取该商品的其它包装单位
  PackUnit.CommandText :='select id,name,ExchangeRate from MSUnit where '
        +' GoalUnitID= '+ Inttostr(SunitID);
  PackUnit.Open;  }
  if not adsMaster.FieldByName('SundryFee').isnull then
    if (adsDetail.FieldByName('SundryFee').isnull) or (adsDetail.FieldByName('SundryFee').AsFloat=0) then
      adsDetail.FieldByName('SundryFee').AsFloat :=adsMaster.FieldByName('SundryFee').AsFloat;
end;

procedure TFAEdAssetAddForm.adsDetailQuantityChange(Sender: TField);
var   ExChRate :real;
begin
  inherited;
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;

//  adsDetail.FieldByName('Amount').ReadOnly :=False;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('Quantity').asfloat
         *adsDetail.fieldbyname('PriceBase').AsFloat;
//  adsDetail.FieldByName('Amount').ReadOnly :=True;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Amount').AsFloat*0.1;
end;

procedure TFAEdAssetAddForm.adsDetailPackUnitIDChange(Sender: TField);
var ExChRate :real;
begin
  inherited;
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat ;
//  adsDetail.FieldByName('Amount').ReadOnly :=False;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('Quantity').asfloat
         *adsDetail.fieldbyname('PriceBase').AsFloat;
//  adsDetail.FieldByName('Amount').ReadOnly :=True;

//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Amount').AsFloat*0.1;
end;

procedure TFAEdAssetAddForm.adsDetailPriceBaseChange(Sender: TField);
begin
  inherited;
//  adsDetail.FieldByName('Amount').ReadOnly :=False;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('Quantity').asfloat
         *adsDetail.fieldbyname('PriceBase').AsFloat;
//  adsDetail.FieldByName('Amount').ReadOnly :=True;

//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Amount').AsFloat*0.1;
end;

procedure TFAEdAssetAddForm.N33Click(Sender: TObject);
begin
//  inherited;
  adsDetail.Edit;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Amount').AsFloat*0.03;
end;

procedure TFAEdAssetAddForm.N51Click(Sender: TObject);
begin
//  inherited;
  adsDetail.Edit;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Amount').AsFloat*0.05;
end;

procedure TFAEdAssetAddForm.N81Click(Sender: TObject);
begin
//  inherited;
  adsDetail.Edit;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Amount').AsFloat*0.08;
end;

procedure TFAEdAssetAddForm.N101Click(Sender: TObject);
begin
//  inherited;
  adsDetail.Edit;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Amount').AsFloat*0.10;
end;

procedure TFAEdAssetAddForm.N121Click(Sender: TObject);
begin
//  inherited;
  adsDetail.Edit;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Amount').AsFloat*0.12;
end;

procedure TFAEdAssetAddForm.N151Click(Sender: TObject);
begin
//  inherited;
  adsDetail.Edit;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Amount').AsFloat*0.15;
end;

procedure TFAEdAssetAddForm.N201Click(Sender: TObject);
begin
//  inherited;
  adsDetail.Edit;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Amount').AsFloat*0.20;
end;

procedure TFAEdAssetAddForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

end.
