unit SREdWorkTime;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TSREdWorkTimeForm = class(TBaseVoucherEditAForm)
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    Label5: TLabel;
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
    adsDetailMemo: TStringField;
    adsDetailID: TAutoIncField;
    adsDetailMasterID: TIntegerField;
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
    adsDetailGoodsID: TIntegerField;
    adsDetailGoodsSpec: TStringField;
    adsDetailStartTime: TDateTimeField;
    adsDetailEndTime: TDateTimeField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure adsDetailEndTimeChange(Sender: TField);
    procedure adsDetailStartTimeChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SREdWorkTimeForm: TSREdWorkTimeForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TSREdWorkTimeForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SRWorkTimeMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='时段制定';
  adsMaster.FieldByName('ClearDate').AsDateTime :=date;
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='SRWorkTimeMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TSREdWorkTimeForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSREdWorkTimeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
end;

procedure TSREdWorkTimeForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'SRWorkTime';
  adsMaster.Open;
  adsDetail.Open;
  ClientName.Open;
  EmployeeName.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from SRWorkTimeMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('时段制定');
  
end;

procedure TSREdWorkTimeForm.FormShow(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;

procedure TSREdWorkTimeForm.adsDetailEndTimeChange(Sender: TField);
begin
  inherited;
  if adsDetail.fieldbyname('EndTime').AsDateTime <adsDetail.fieldbyname('StartTime').AsDateTime then
    begin
      adsDetail.Edit;
      adsDetail.fieldbyname('EndTime').AsDateTime :=adsDetail.fieldbyname('StartTime').AsDateTime;
     end;
end;

procedure TSREdWorkTimeForm.adsDetailStartTimeChange(Sender: TField);
begin
  inherited;
  if adsDetail.fieldbyname('StartTime').AsDateTime >adsDetail.fieldbyname('EndTime').AsDateTime then
    begin
      adsDetail.Edit;
      adsDetail.fieldbyname('EndTime').AsDateTime :=adsDetail.fieldbyname('StartTime').AsDateTime;
     end;
end;

end.
