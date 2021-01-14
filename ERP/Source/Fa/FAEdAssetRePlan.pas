unit FAEdAssetRePlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TFAEdAssetRePlanForm = class(TBaseVoucherEditAForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    GoodName: TADODataSet;
    PackUnit: TADODataSet;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    LookupEmployee: TQLDBLookupComboBox;
    Label6: TLabel;
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
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    adsDetailTaxAmount: TBCDField;
    adsDetailGoodsSpec: TStringField;
    adsGoodsSpec: TADODataSet;
    adsMasterEmployee: TStringField;
    StockQuerry: TAction;
    adsMasterWarehouseID: TIntegerField;
    adsWarehouse: TADODataSet;
    dsWarehouse: TDataSource;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    ReduceMode: TDBComboBox;
    QLDBLookupComboBox1: TQLDBLookupComboBox;
    BitBtn1: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  FAEdAssetRePlanForm: TFAEdAssetRePlanForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TFAEdAssetRePlanForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','FAAssetRePlanMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='资产维修计划';
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='FAAssetRePlanMaster';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TFAEdAssetRePlanForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TFAEdAssetRePlanForm.FormClose(Sender: TObject;
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

procedure TFAEdAssetRePlanForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'FAAssetRePlan';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  adsWarehouse.Open;
 TempAds.Close;
  TempAds.CommandText :=' select Distinct Deliver from FAAssetRePlanMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    ReduceMode.Items.Add(TempAds.FieldByName('Deliver').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  ReduceMode.Items.Add('资产大修');
end;

procedure TFAEdAssetRePlanForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
//  DBGrid.Enabled :=False;
end;

procedure TFAEdAssetRePlanForm.BitBtn1Click(Sender: TObject);
var AssetID:string;
begin
  inherited;
  if adsMaster.fieldbyname('OriginID').IsNull then AssetID :='0'
     else AssetID :=adsMaster.fieldbyname('OriginID').AsString;
  TempAds.Close;
  TempAds.CommandText :=' select a.GoodsId,a.GoodsSpec '
    +' from FAAssetAddDetail a    '
    +' left outer join  FAAssetAddMaster b  on b.ID=a.MasterID  '
    +' where b.RecordState<>'+Quotedstr('删除')
    +' and b.Id='+AssetID;
  TempAds.Open;

  if  TempAds.IsEmpty then Exit  else TempAds.First;
  adsDetail.First;
//  adsDetail.FieldByName('GoodsID').ReadOnly :=false;
//  adsDetail.FieldByName('GoodsSpec').ReadOnly :=false;
//  adsDetail.FieldByName('Amount').ReadOnly :=false;
//  adsDetail.FieldByName('Memo').ReadOnly :=false;
//  adsDetail.Last;
//  if adsDetail.fieldbyname('GoodsID').IsNull then  adsDetail.Append;
  while not TempAds.Eof do
  begin
    if adsDetail.Eof then adsDetail.Append
    else adsDetail.Edit;
    adsDetail.FieldByName('GoodsID').AsInteger :=TempAds.FieldByName('GoodsID').AsInteger;
    adsDetail.FieldByName('GoodsSpec').AsString :=TempAds.FieldByName('GoodsSpec').AsString;
    TempAds.Next;
    adsDetail.Next;
  end;
//  adsDetail.FieldByName('GoodsID').ReadOnly :=True;
//  adsDetail.FieldByName('GoodsSpec').ReadOnly :=True;
//  adsDetail.FieldByName('Memo').ReadOnly :=True;
end;

end.
