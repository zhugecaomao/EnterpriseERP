unit FAEdDepreciation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TFAEdDepreciationForm = class(TBaseVoucherEditAForm)
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
    adsDetailGoodsName: TStringField;
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
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    adsDetailTaxAmount: TBCDField;
    adsDetailGoodsSpec: TStringField;
    adsMasterEmployee: TStringField;
    StockQuerry: TAction;
    adsMasterWarehouseID: TIntegerField;
    adsWarehouse: TADODataSet;
    dsWarehouse: TDataSource;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    N51: TMenuItem;
    N81: TMenuItem;
    N101: TMenuItem;
    N121: TMenuItem;
    N151: TMenuItem;
    N201: TMenuItem;
    adsDetailQuantityPcs: TBCDField;
    BitBtn1: TBitBtn;
    adsDetailPackUnit: TStringField;
    DsGoodName: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure UpdateGrid;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  FAEdDepreciationForm: TFAEdDepreciationForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TFAEdDepreciationForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','FADepreciationMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='资产折旧';
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='FADepreciationMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TFAEdDepreciationForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TFAEdDepreciationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  PackUnit.Close;
end;

procedure TFAEdDepreciationForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'FADepreciation';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from FADepreciationMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('[01]折旧期间');
end;

procedure TFAEdDepreciationForm.BitBtn1Click(Sender: TObject);
var OrAmount,ResAmount,RateAmount :real;
begin
  inherited;
  TempAds.Close;
  TempAds.CommandText :=' select b.ID, b.Code, b.brief , '
    +' a.GoodsID,a.GoodsSpec, a.Amount,a.GoalQuantity,   '
    +' a.SundryFee                                       '
    +' from FAAssetAddDetail a                           '
    +' left outer join FAAssetAddMaster b on b.ID=a.MasterID '
    +' where a.GoodsID<>0 and b.Recordstate<>'
    +Quotedstr('删除');
  TempAds.Open;
  TempAds.First;
  adsDetail.First;
  while not TempAds.Eof do
  begin
    if adsDetail.Eof then adsDetail.Append
      else adsDetail.Edit;
//    adsDetail.FieldByName('GoodsID').ReadOnly :=False;
//    adsDetail.FieldByName('PackUnitID').ReadOnly :=False;
//    adsDetail.FieldByName('Quantity').ReadOnly :=False;
//    adsDetail.FieldByName('SundryFee').ReadOnly :=False;
//    adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
    adsDetail.FieldByName('GoodsID').AsInteger := TempAds.FieldByName('GoodsID').AsInteger;
    adsDetail.FieldByName('PackUnitID').AsInteger :=TempAds.FieldByName('ID').AsInteger;
    adsDetail.FieldByName('Quantity').AsFloat :=TempAds.FieldByName('Amount').AsFloat;
    adsDetail.FieldByName('SundryFee').AsFloat :=TempAds.FieldByName('SundryFee').AsFloat;
    adsDetail.FieldByName('GoalQuantity').AsFloat :=TempAds.FieldByName('GoalQuantity').AsFloat;
    TempAds.Next;
    adsDetail.Next;
  end;
//  adsDetail.FieldByName('GoodsID').ReadOnly :=True;
//  adsDetail.FieldByName('PackUnitID').ReadOnly :=True;
//  adsDetail.FieldByName('Quantity').ReadOnly :=True;
//  adsDetail.FieldByName('SundryFee').ReadOnly :=True;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=True;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    if adsDetail.FieldByName('Quantity').IsNull then OrAmount :=0
       else OrAmount :=adsDetail.FieldByName('Quantity').AsFloat;
    if adsDetail.FieldByName('GoalQuantity').IsNull then ResAmount :=0
       else ResAmount :=adsDetail.FieldByName('GoalQuantity').AsFloat;
    if adsDetail.FieldByName('SundryFee').IsNull then RateAmount :=0
       else RateAmount :=adsDetail.FieldByName('SundryFee').AsFloat/100;
    adsDetail.Edit;
    adsDetail.FieldByName('Amount').AsFloat :=(OrAmount-ResAmount)*RateAmount;
    adsDetail.Next;
  end;
  adsDetail.First;
  UpdateGrid;
end;

procedure TFAEdDepreciationForm.UpdateGrid;
var  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    for I := 0 to Columns.Count -  1 do
    begin
      if Columns[I].Field is TNumericField then
      if Pos('Price',Columns[I].FieldName)<=0 then
        Columns[I].Footer.ValueType := fvtSum;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TFAEdDepreciationForm.FormActivate(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;

procedure TFAEdDepreciationForm.FormShow(Sender: TObject);
begin
  inherited;
  BitBtn1Click(Sender);
end;

end.
