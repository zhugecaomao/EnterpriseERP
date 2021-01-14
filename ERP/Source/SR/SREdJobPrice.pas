unit SREdJobPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons, BaseVoucherEdit;

type
  TSREdJobPriceForm = class(TBaseVoucherEditAForm)
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    Label5: TLabel;
    AdsSRJobs: TADODataSet;
    dsSRJobs: TDataSource;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
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
    BriefComboBox: TDBComboBox;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    adsMasterEmployee: TStringField;
    StockQuerry: TAction;
    adsMasterWarehouseID: TIntegerField;
    ClientQLDBLookup: TQLDBLookupComboBox;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    BitBtn1: TBitBtn;
    adsDetailID: TAutoIncField;
    adsDetailMasterID: TIntegerField;
    adsDetailGoodsID: TIntegerField;
    adsDetailGoodsSpec: TStringField;
    adsDetailQuantity: TBCDField;
    adsDetailQuantityPcs: TBCDField;
    adsDetailPackUnitID: TIntegerField;
    adsDetailPriceBase: TBCDField;
    adsDetailAmount: TBCDField;
    adsDetailDiscount: TBCDField;
    adsDetailTaxAmount: TBCDField;
    adsDetailSundryFee: TBCDField;
    adsDetailGoalUnitID: TIntegerField;
    adsDetailGoalQuantity: TBCDField;
    adsDetailMemo: TStringField;
    adsDetailJobs: TStringField;
    JobsLookup: TQLDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure adsDetailPackUnitIDChange(Sender: TField);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SREdJobPriceForm: TSREdJobPriceForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TSREdJobPriceForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SRJobsPriceMaster',number);
  adsMaster.FieldByName('CreateUserID').Value:=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='工价制定';
  adsMaster.FieldByName('ClearDate').AsDateTime :=date;
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='SRJobsPriceMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TSREdJobPriceForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSREdJobPriceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  AdsSRJobs.Close;
end;

procedure TSREdJobPriceForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'SRJobsPrice';
  adsMaster.Open;
  adsDetail.Open;
  ClientName.Open;
  EmployeeName.Open;
  AdsSRJobs.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from SRJobsPriceMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('工价制定');

end;

procedure TSREdJobPriceForm.BitBtn1Click(Sender: TObject);
begin
  inherited;
  BitBtn1.Enabled:=False;
  TempAds.Close;
  TempAds.CommandText :=' select ID,priceBase from SRJobs where ID not in'
      +' (select distinct PackUnitID from SRJobsPriceDetail where MasterID='
      + Quotedstr(adsMaster.fieldbyname('ID').AsString) + '  )';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    adsDetail.append;
    adsDetail.FieldByName('PackunitID').AsInteger  := TempAds.fieldbyname('ID').AsInteger ;
    adsDetail.FieldByName('priceBase').AsFloat := TempAds.fieldbyname('priceBase').AsFloat;
    adsDetail.Post;
    TempAds.Next;
  end;
  if not TempAds.IsEmpty then  adsDetail.First;
end;

procedure TSREdJobPriceForm.adsDetailPackUnitIDChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  adsDetail.FieldByName('priceBase').AsFloat :=
  AdsSRJobs.fieldbyname('priceBase').AsFloat;
  {if (adsDetail.FieldByName('priceBase').AsFloat=0) or
    (adsDetail.FieldByName('priceBase').IsNull) then
    begin
      adsDetail.Edit;
      adsDetail.FieldByName('priceBase').AsFloat :=
      AdsSRJobs.fieldbyname('priceBase').AsFloat;
    end; }
end;

procedure TSREdJobPriceForm.FormActivate(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;

end.
