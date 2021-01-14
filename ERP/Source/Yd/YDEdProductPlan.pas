unit YDEdProductPlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TYDEdProductPlanForm = class(TBaseVoucherEditAForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    GoodName: TADODataSet;
    GoodsOut: TADODataSet;
    dsGoodsOut: TDataSource;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    LookupEmployee: TQLDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
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
    DiscountMode: TAction;
    adsMasterEmployeeID: TIntegerField;
    adsMasterApportion: TStringField;
    adsMasterDeliver: TStringField;
    adsMasterOriginID: TIntegerField;
    adsMasterOriginTable: TStringField;
    adsMasterBillAffix: TBytesField;
    adsDetailMemo: TStringField;
    adsMasterBrief: TStringField;
    DbCBxBillMode: TDBComboBox;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    adsDetailTaxAmount: TBCDField;
    adsDetailGoodsSpec: TStringField;
    adsGoodsSpec: TADODataSet;
    dsGoodsSpec: TDataSource;
    adsMasterEmployee: TStringField;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    adsMasterWarehouseID: TIntegerField;
    DBCBxBrief: TDBComboBox;
    adsGoodsSpecID: TAutoIncField;
    adsGoodsSpecCreateDate: TDateTimeField;
    adsGoodsSpecCreateUserID: TIntegerField;
    adsGoodsSpecRecordState: TStringField;
    adsGoodsSpecUpid: TIntegerField;
    adsGoodsSpecName: TStringField;
    adsGoodsSpecMemo: TStringField;
    adsGoodsSpecLevelCode: TStringField;
    adsDetailGoodsOutID: TIntegerField;
    AdsPackunit: TADODataSet;
    dsPackunit: TDataSource;
    adsDetailPackUnitName: TStringField;
    adsDetailGoalUnitName: TStringField;
    adsDetailGoodsOut: TStringField;
    adsDetailQuantityPcs: TBCDField;
    Label5: TLabel;
    Label10: TLabel;
    BitBtn1: TBitBtn;
    DBEdit1: TDBEdit;
    AdsGoodsIn: TADODataSet;
    dsGoodsIn: TDataSource;
    adsDetailGoodsIn: TStringField;
    LookupYDFormalID: TQLDBLookupComboBox;
    AdsYDFormalID: TADODataSet;
    DsYDFormalID: TDataSource;
    adsMasterFormalIDName: TStringField;
    AdsYDFormalIDID: TAutoIncField;
    AdsYDFormalIDCode: TStringField;
    AdsYDFormalIDBrief: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     SLPubQuerrySql,SLPubQuerryCaption:string;
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  YDEdProductPlanForm: TYDEdProductPlanForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
procedure TYDEdProductPlanForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','YDProductPlanMaster',number);
  adsMaster.FieldByName('CreateUserID').Value:=Guarder.UserID;
//  adsMaster.FieldByName('BIllMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='生产计划';
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('Deliver').AsString :='--';
  adsMaster.FieldByName('SundryFee').AsFloat  :=1;
  adsMaster.FieldByName('Apportion').AsString :='--';
  adsMaster.FieldByName('ClearDate').AsDateTime :=date;
  adsMaster.FieldByName('OriginTable').AsString :='YDProductPlanMaster';
end;

procedure TYDEdProductPlanForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TYDEdProductPlanForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  GoodsOut.Close;
  adsGoodsSpec.Close;
end;

procedure TYDEdProductPlanForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'YDProductPlan';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  GoodsOut.Open;
  AdsYDFormalID.Open;

  LookupYDFormalID.DataField := 'WarehouseID';
  LookupYDFormalID.ListField := 'Brief;CODE';
  LookupYDFormalID.KeyField := 'ID';
  LookupYDFormalID.DropDownWidth :=300;
//  LookupYDFormalID.ListField := 'Code';
   {
  TempAds.Close;  //装入物料清单名称和ID号
  TempAds.CommandText :=' select id,brief from YDFormulaMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    CBxFormula.Items.AddObject(TempAds.FieldByName('brief').AsString,
    pointer(TempAds.FieldByName('ID').AsInteger));
    TempAds.Next;
  end;       }

  TempAds.Close; //装入计划类别
  TempAds.CommandText :=' select Distinct BillMode from YDProductPlanMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    DBCBxBillMode.Items.Add(TempAds.FieldByName('BillMode').AsString);
    TempAds.Next;
  end;

  if  TempAds.IsEmpty then  DBCBxBillMode.Items.Add('生产计划');

  TempAds.Close;     //装入计划期间
  TempAds.CommandText :=' select Distinct brief from YDProductPlanMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    DBCBxBrief.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  DBCBxBrief.Items.Add('[1]月份生产计划');
//  GoodsLookup.Enabled :=false;
//  GoodsLookup.Visible :=false;
end;

procedure TYDEdProductPlanForm.FormShow(Sender: TObject);
begin
  inherited;
  DBCBxBrief.SetFocus;
end;

procedure TYDEdProductPlanForm.BitBtn1Click(Sender: TObject);
var TQuan:real;
    FormulaID:integer;
begin
  inherited;
//  if CBxFormula.Text='' then exit;
//  FormulaID := Integer(CBxFormula.items.Objects[CBxFormula.ItemIndex]);
  FormulaID :=0;
  if not adsMaster.fieldbyname('WarehouseID').IsNull then
  FormulaID := adsMaster.fieldbyname('WarehouseID').AsInteger;

  TempAds.Close;
  TempAds.CommandText :=' select a.*  from YDFormulaDetail a '
      +' left outer join YDFormulaMaster b on b.ID=a.MasterID'
      +' WHERE b.RecordState<>'+Quotedstr('删除')+' and a.MasterID='
      +inttostr(FormulaID);
  TempAds.Open;

  
  if TempAds.IsEmpty then Exit;
  TQuan :=adsMaster.fieldbyname('SundryFee').AsFloat;

  if  TQuan =0 then exit;
  TempAds.First;
  adsDetail.First;
  while not TempAds.eof do
  begin
    if adsDetail.Eof  then  adsDetail.append
        else adsDetail.Edit;  { }
    if (adsMaster.fieldbyname('ID').Value<>0) and (not adsMaster.fieldbyname('ID').IsNull) then
        adsDetail.fieldbyname('MasterID').AsInteger :=adsMaster.fieldbyname('ID').AsInteger ;

//    adsDetail.FieldByName('GoodsID').ReadOnly :=false;
    if (TempAds.fieldbyname('GoodsID').Value<>0) and (not TempAds.fieldbyname('GoodsID').IsNull) then
        adsDetail.fieldbyname('GoodsID').AsInteger :=TempAds.fieldbyname('GoodsID').AsInteger    ;

    if (TempAds.fieldbyname('GoodsSpec').AsString<>'') and (not TempAds.fieldbyname('GoodsSpec').IsNull) then
        adsDetail.fieldbyname('GoodsSpec').AsString :=TempAds.fieldbyname('GoodsSpec').AsString;

    if (TempAds.fieldbyname('Quantity').Value<>0) and (not TempAds.fieldbyname('Quantity').IsNull) then
        adsDetail.fieldbyname('Quantity').AsFloat  :=TempAds.fieldbyname('Quantity').AsFloat*TQuan    ;

    if (TempAds.fieldbyname('PackUnitID').Value<>0) and (not TempAds.fieldbyname('PackUnitID').IsNull) then
        adsDetail.fieldbyname('PackUnitID').AsInteger :=TempAds.fieldbyname('PackUnitID').AsInteger ;

    if (TempAds.fieldbyname('PriceBase').Value<>0) and (not TempAds.fieldbyname('PriceBase').IsNull) then
        adsDetail.fieldbyname('PriceBase').AsFloat :=TempAds.fieldbyname('PriceBase').AsFloat    ;

    if (TempAds.fieldbyname('Amount').Value<>0) and (not TempAds.fieldbyname('Amount').IsNull) then
        adsDetail.fieldbyname('Amount').AsFloat :=TempAds.fieldbyname('Amount').AsFloat*TQuan;

//    adsDetail.FieldByName('GoodsOutID').ReadOnly :=false;
    if (TempAds.fieldbyname('GoodsOutID').Value<>0) and (not TempAds.fieldbyname('GoodsOutID').IsNull) then
        adsDetail.fieldbyname('GoodsOutID').AsInteger  :=TempAds.fieldbyname('GoodsOutID').AsInteger  ;

    if (TempAds.fieldbyname('GoalUnitID').Value<>0) and (not TempAds.fieldbyname('GoalUnitID').IsNull) then
        adsDetail.fieldbyname('GoalUnitID').AsInteger  :=TempAds.fieldbyname('GoalUnitID').AsInteger    ;

    if (TempAds.fieldbyname('GoalQuantity').Value<>0) and (not TempAds.fieldbyname('GoalQuantity').IsNull) then
        adsDetail.fieldbyname('GoalQuantity').AsFloat :=TempAds.fieldbyname('GoalQuantity').AsFloat*TQuan ;

    if (TempAds.fieldbyname('TaxAmount').Value<>0) and (not TempAds.fieldbyname('TaxAmount').IsNull) then
        adsDetail.fieldbyname('TaxAmount').AsFloat :=TempAds.fieldbyname('TaxAmount').AsFloat    ;

    if (TempAds.fieldbyname('SundryFee').Value<>0) and (not TempAds.fieldbyname('SundryFee').IsNull) then
        adsDetail.fieldbyname('SundryFee').AsFloat :=TempAds.fieldbyname('SundryFee').AsFloat*TQuan    ;

    if (TempAds.fieldbyname('QuantityPcs').Value<>0) and (not TempAds.fieldbyname('QuantityPcs').IsNull) then
        adsDetail.fieldbyname('QuantityPcs').AsFloat :=TempAds.fieldbyname('QuantityPcs').AsFloat ;

    if (TempAds.fieldbyname('Memo').AsString<>'') and (not TempAds.fieldbyname('Memo').IsNull) then
        adsDetail.fieldbyname('Memo').AsString :=TempAds.fieldbyname('Memo').AsString   ;

    if (FormulaID<>0)  then   adsDetail.fieldbyname('Discount').AsFloat :=FormulaID;
    adsDetail.Post;
    adsDetail.Next;
    TempAds.Next;
  end;
  while not adsDetail.Eof  do
  begin
    adsDetail.Edit;
    adsDetail.fieldbyname('MasterID').AsInteger :=0;
//    adsDetail.FieldByName('GoodsID').ReadOnly :=false;
    adsDetail.fieldbyname('GoodsID').AsInteger :=0;
    adsDetail.fieldbyname('GoodsSpec').AsString :='-';
    adsDetail.fieldbyname('Quantity').AsFloat :=0;
    adsDetail.fieldbyname('PackUnitID').AsInteger :=0;
    adsDetail.fieldbyname('PriceBase').AsFloat :=0;
    adsDetail.fieldbyname('Amount').AsFloat :=0;
//    adsDetail.FieldByName('GoodsOutID').ReadOnly :=false;
    adsDetail.fieldbyname('GoodsOutID').AsInteger :=0;
    adsDetail.fieldbyname('GoalUnitID').AsInteger :=0;
    adsDetail.fieldbyname('GoalQuantity').AsFloat :=0;
    adsDetail.fieldbyname('TaxAmount').AsFloat :=0;
    adsDetail.fieldbyname('SundryFee').AsFloat :=0;
    adsDetail.fieldbyname('QuantityPcs').AsFloat :=0;
    adsDetail.fieldbyname('Memo').AsString :='-';
     adsDetail.fieldbyname('Discount').AsFloat :=FormulaID;
    adsDetail.Next;
  end;

  adsDetail.First;
//  adsDetail.FieldByName('GoodsID').ReadOnly :=true;
//  adsDetail.FieldByName('GoodsOUTID').ReadOnly :=true;
end;

end.
