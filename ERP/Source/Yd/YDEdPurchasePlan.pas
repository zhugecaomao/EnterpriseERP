unit YDEdPurchasePlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TYDEdPurchasePlanForm = class(TBaseVoucherEditAForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    GoodName: TADODataSet;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    LookupEmployee: TQLDBLookupComboBox;
    Label7: TLabel;
    TempAds: TADODataSet;
    adsMaster: TADODataSet;
    adsDetail: TADODataSet;
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
    DiscountMode: TAction;
    adsMasterEmployeeID: TIntegerField;
    adsMasterApportion: TStringField;
    adsMasterDeliver: TStringField;
    adsMasterOriginID: TIntegerField;
    adsMasterOriginTable: TStringField;
    adsMasterBillAffix: TBytesField;
    adsMasterBrief: TStringField;
    DbCBxBillMode: TDBComboBox;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    adsMasterEmployee: TStringField;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    adsMasterWarehouseID: TIntegerField;
    DBCBxBrief: TDBComboBox;
    AdsPackunit: TADODataSet;
    dsPackunit: TDataSource;
    Label5: TLabel;
    CBxFormula: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    adsDetailID: TIntegerField;
    adsDetailMasterID: TIntegerField;
    adsDetailGoodsID: TIntegerField;
    adsDetailGoodsSpec: TStringField;
    adsDetailQuantity: TBCDField;
    adsDetailPackUnitID: TIntegerField;
    adsDetailQuantityPcs: TBCDField;
    adsDetailPriceBase: TBCDField;
    adsDetailAmount: TBCDField;
    adsDetailGoodsOutID: TIntegerField;
    adsDetailDiscount: TBCDField;
    adsDetailTaxAmount: TBCDField;
    adsDetailSundryFee: TBCDField;
    adsDetailGoalUnitID: TIntegerField;
    adsDetailGoalQuantity: TBCDField;
    adsDetailMemo: TStringField;
    adsDetailGoodsName: TStringField;
    adsDetailGoalunit: TStringField;
    DsGoodName: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
     SLPubQuerrySql,SLPubQuerryCaption:string;
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  YDEdPurchasePlanForm: TYDEdPurchasePlanForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
procedure TYDEdPurchasePlanForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').Value:=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','YDPurchasePlanMaster',number);
  adsMaster.FieldByName('CreateUserID').Value:=Guarder.UserID;
  adsMaster.FieldByName('BIllMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').Value:='生产采购计划';
  adsMaster.FieldByName('ModeDC').Value:=1;
  adsMaster.FieldByName('ModeC').Value:=1;
  adsMaster.FieldByName('Deliver').Value:='--';
  adsMaster.FieldByName('SundryFee').value :=1;
  adsMaster.FieldByName('Apportion').Value:='--';
  adsMaster.FieldByName('ClearDate').Value:=date;
  adsMaster.FieldByName('OriginTable').Value:='YDPurchasePlanMaster';
end;

procedure TYDEdPurchasePlanForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TYDEdPurchasePlanForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
end;

procedure TYDEdPurchasePlanForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'YDPurchasePlan';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  TempAds.Close;  //装入生产计划名称和ID号
  TempAds.CommandText :=' select id,brief,Code from YDProductPlanMaster'
      +' where Id not in (select distinct GoodsOutID from '
      +' YDPurchasePlanDetail a left outer join YDPurchasePlanMaster b on b.id=a.masterid '
      +' where b.Recordstate<>'+Quotedstr('删除')+' )' ;
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    CBxFormula.Items.AddObject( Trim(TempAds.FieldByName('brief').AsString)
     +'--'+ trim(TempAds.FieldByName('Code').AsString),
    pointer(TempAds.FieldByName('ID').AsInteger));
    TempAds.Next;
  end;
  TempAds.Close; //装入采购计划类别
  TempAds.CommandText :=' select Distinct BillMode from YDPurchasePlanMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    DBCBxBillMode.Items.Add(TempAds.FieldByName('BillMode').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  DBCBxBillMode.Items.Add('生产采购计划');

  TempAds.Close;     //装入采购计划期间名称
  TempAds.CommandText :=' select Distinct brief from YDPurchasePlanMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    DBCBxBrief.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  DBCBxBrief.Items.Add('[1]月份生产采购计划');
//  GoodsLookup.Enabled :=false;
//  GoodsLookup.Visible :=false;
end;

procedure TYDEdPurchasePlanForm.FormShow(Sender: TObject);
begin
  inherited;
  DBCBxBrief.SetFocus;
end;

procedure TYDEdPurchasePlanForm.BitBtn1Click(Sender: TObject);
var InStr:string;
    FormulaID:integer;
begin
  inherited;
  InStr :='0';
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    if not adsDetail.fieldbyname('GoodsOutID').isnull then
       InStr :=InStr+ ' , '+adsDetail.fieldbyname('GoodsOutID').AsString;
    adsDetail.Next;
  end;
  if InStr='0' then exit;
//  showmessage(InStr);

  TempAds.Close;
  TempAds.CommandText :=' select GoodsID,packunitID,MasterID,sum(isnull(Quantity,0))'
      +' as Quantity ,Sum(isnull(amount,0)) as amount '
      +' from (   '
      +' select b.ID,b.code,b.brief,b.recordstate,a.MasterID, goodsId,PackunitID,Quantity,amount '
      +' from ydproductplandetail a  '
      +' left outer join YDproductplanMaster b on b.Id=A.masterid  '
      +' where a.goodsID<>0 and  a.goodsID is not null   '
      +' UNION ALL                                             '
      +' select b.id,b.code,b.brief,b.recordstate,a.MasterID, goodsOutId,GoalUnitID as '
      +' packunitID ,GoalQuantity*(-1) as Quantity, '
      +' a.SundryFee*(-1)   as amount     '
      +' from ydproductplandetail a         '
      +' left outer join YDproductplanMaster b on b.Id=A.masterid   '
      +' where a.goodsOutId<>0 and  a.goodsOutId is not null        '
      +' and GoodsOutId  in (select distinct goodsId from ydproductplandetail) ) as a  '
      +' where recordstate<>'+Quotedstr('删除') +'   and a.MasterID in ('
      +InStr +' )'
      +' group by goodsid ,packunitID,MasterID order by goodsid ';
  TempAds.Open;
  if TempAds.IsEmpty then exit;
  TempAds.First;
  DBGrid.DataSource :=nil;
  adsDetail.First;
  while not TempAds.Eof do
  begin
    if adsDetail.Eof then adsDetail.Append
      else adsDetail.Edit;
    if not TempAds.fieldbyname('MasterID').IsNull then
        adsDetail.Fieldbyname('GoodsOutID').AsInteger := TempAds.fieldbyname('MasterID').AsInteger;

    if not TempAds.fieldbyname('GoodsID').IsNull then
        adsDetail.Fieldbyname('GoodsID').AsInteger  := TempAds.fieldbyname('GoodsID').AsInteger;

    if not TempAds.fieldbyname('packunitID').IsNull then
        adsDetail.Fieldbyname('packunitID').AsInteger := TempAds.fieldbyname('packunitID').AsInteger;

//    adsDetail.Fieldbyname('GoalunitID').ReadOnly :=false;
    if not TempAds.fieldbyname('packunitID').IsNull then
        adsDetail.Fieldbyname('GoalunitID').AsInteger := TempAds.fieldbyname('packunitID').AsInteger;
//    adsDetail.Fieldbyname('GoalunitID').ReadOnly :=true;

    if not TempAds.fieldbyname('Quantity').IsNull then
        adsDetail.Fieldbyname('Quantity').AsFloat  := TempAds.fieldbyname('Quantity').AsFloat ;

    if not TempAds.fieldbyname('Quantity').IsNull then
        adsDetail.Fieldbyname('GoalQuantity').AsFloat := TempAds.fieldbyname('Quantity').AsFloat;

    if not TempAds.fieldbyname('Quantity').IsNull and TempAds.fieldbyname('Quantity').Value<>0 then
        adsDetail.Fieldbyname('PriceBase').AsFloat := TempAds.fieldbyname('amount').Value/TempAds.fieldbyname('Quantity').AsFloat;

    if not TempAds.fieldbyname('amount').IsNull then
        adsDetail.Fieldbyname('amount').AsFloat := TempAds.fieldbyname('amount').AsFloat;
    adsDetail.Next;
    TempAds.Next;
  end;
  DBGrid.DataSource :=DetailDataSource;

end;

procedure TYDEdPurchasePlanForm.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if CBxFormula.Text='' then exit;
  adsDetail.append;
  adsDetail.FieldByName('GoodsOutID').AsInteger  := Integer(CBxFormula.items.Objects[CBxFormula.ItemIndex]);
  adsDetail.FieldByName('memo').AsString :=CBxFormula.Text;
  BitBtn1Click(sender);

end;

end.
