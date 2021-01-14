unit EGEdFACReceipt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TEGEdFACReceiptForm = class(TBaseVoucherEditAForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    LookupEmployee: TQLDBLookupComboBox;
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
    adsMasterEmployee: TStringField;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    adsMasterWarehouseID: TIntegerField;
    AdsWareHouse: TADODataSet;
    DsWareHouse: TDataSource;
    MaterialBalance: TMenuItem;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    LookProject: TQLDBLookupComboBox;
    AdsProject: TADODataSet;
    DsProject: TDataSource;
    adsDetailProjectName: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure MaterialBalanceClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  EGEdFACReceiptForm: TEGEdFACReceiptForm;

implementation

uses CommonDM, WSUtils, WSSecurity,VoucherQuery, EGMaterialBalance;

{$R *.dfm}
procedure TEGEdFACReceiptForm.New;
begin
  inherited;           //  .Value:=Date;
  adsMaster.FieldByName('Date').AsDateTime:=Date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SLSaleMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BIllMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='合同项目款';
  adsMaster.FieldByName('BIllMode').ReadOnly :=True;
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
  adsMaster.FieldByName('OriginTable').AsString:='SLSaleMaster';
end;

procedure TEGEdFACReceiptForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TEGEdFACReceiptForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  AdsProject.Close;
end;

procedure TEGEdFACReceiptForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'SLSale';
  ClientName.Open;
  EmployeeName.Open;
  AdsProject.Open;
  AdsWareHouse.Open;

  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from SLSaleMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('应计项目进度款');
end;

procedure TEGEdFACReceiptForm.MaterialBalanceClick(Sender: TObject);
begin
  inherited;
//  FindShowForm(TEGMaterialBalanceForm, '');
end;

procedure TEGEdFACReceiptForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

end.
