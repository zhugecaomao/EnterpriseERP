unit SREdWorkRest;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin,DateUtils, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TSREdWorkRestForm = class(TBaseVoucherEditForm)
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
    GoodsName: TADODataSet;
    DsGoodsName: TDataSource;
    Worktime1: TADODataSet;
    DsWorktime1: TDataSource;
    BitBtn2: TBitBtn;
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
    adsDetailStartTime: TDateTimeField;
    adsDetailEndTime: TDateTimeField;
    adsDetailMemo: TStringField;
    adsDetailEmployee: TStringField;
    adsDetailWTschedule: TStringField;
    N41: TMenuItem;
    N51: TMenuItem;
    N101: TMenuItem;
    N102: TMenuItem;
    N42: TMenuItem;
    SRWKRSClear: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure WTGoingOn;
    procedure N41Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N101Click(Sender: TObject);
    procedure N102Click(Sender: TObject);
    procedure N42Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SRWKRSClearClick(Sender: TObject);
  private
    { Private declarations }
  public
    StrDays:integer;
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SREdWorkRestForm: TSREdWorkRestForm;

implementation

uses CommonDM, WSUtils, WSSecurity,QLDBFlt;
{$R *.dfm}
procedure TSREdWorkRestForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SRWorkRestMaster',number);
  adsMaster.FieldByName('CreateUserID').Value:=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='生产排班制定';
  adsMaster.FieldByName('ClearDate').AsDateTime :=date;
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='SRWorkRestMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TSREdWorkRestForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSREdWorkRestForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
end;

procedure TSREdWorkRestForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'SRWorkRest';
  adsMaster.Open;
  adsDetail.Open;
  ClientName.Open;
  EmployeeName.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from SRWorkRestMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('生产排班制定');
  StrDays:=0;
end;

procedure TSREdWorkRestForm.FormShow(Sender: TObject);
begin
  inherited;
//  BriefComboBox.SetFocus;
end;

procedure TSREdWorkRestForm.BitBtn2Click(Sender: TObject);
var
  FilterDialog: TQLDBFilterDialog;
begin
  inherited;
  BitBtn2.Enabled:=False;
  FilterDialog := TQLDBFilterDialog.Create(Self);
  try
    TempAds.Close;
    TempAds.CommandText :=
      ' SELECT E.ID, E.Name, E.Gender, D.Name AS Department, P.Name AS Position' +
      ' FROM MSEmployee E LEFT JOIN' +
      ' MSDepartment D ON E.DepartmentID = D.ID LEFT JOIN' +
      '   MSPostion P ON E.PostionID = P.ID' +
  //      ' select ID,Name from MSEmployee where'
        ' WHERE E.RecordState<>'+Quotedstr('删除')+' and  E.ID not in'
        +' (select distinct GoalUnitID from SRWorkQuantityDetail where MasterID='
        + Quotedstr(adsMaster.fieldbyname('ID').AsString) + '  )';
    TempAds.Open;
    with TempADS do
    begin
      Fields[1].DisplayLabel := '姓名';
      Fields[2].DisplayLabel := '性别';
      Fields[3].DisplayLabel := '部门';
      Fields[4].DisplayLabel := '职位';
    end;
    FilterDialog.DataSet := TempAds;
    FilterDialog.FilterFields := 'Name; Gender; Department; Position';
    if not FilterDialog.Execute then Exit;
    TempAds.First;
  DBGrid.DataSource :=nil;
  while not TempAds.Eof do
  begin
    if adsDetail.Eof then adsDetail.append
      else  adsDetail.Edit;
    adsDetail.FieldByName('GoodsID').AsInteger := TempAds.fieldbyname('ID').AsInteger;
    TempAds.Next;
    adsDetail.Next;
  end;
    if not TempAds.IsEmpty then  adsDetail.First;
  finally
    FilterDialog.Free;
  end;
    DBGrid.DataSource :=DetailDataSource;
end;

procedure TSREdWorkRestForm.WTGoingOn;
var I,PackUnitID:integer;
begin
  if adsDetail.FieldByName('PackUnitID').IsNull then PackUnitID :=0
      else PackUnitID :=adsDetail.FieldByName('PackUnitID').AsInteger;
  for  I :=0 to  StrDays do
  begin
    if adsDetail.Eof then Exit;
    adsDetail.edit;
    adsDetail.FieldByName('PackUnitID').AsInteger := PackUnitID;
    adsDetail.Next;
  end;
end;

procedure TSREdWorkRestForm.N41Click(Sender: TObject);
begin
  inherited;
  StrDays :=1000;
  WTGoingOn;
end;

procedure TSREdWorkRestForm.N51Click(Sender: TObject);
begin
  inherited;
  StrDays :=2;
  WTGoingOn;
end;

procedure TSREdWorkRestForm.N101Click(Sender: TObject);
begin
  inherited;
  StrDays :=3;
  WTGoingOn;
end;

procedure TSREdWorkRestForm.N102Click(Sender: TObject);
begin
  inherited;
  StrDays :=5;
  WTGoingOn;
end;

procedure TSREdWorkRestForm.N42Click(Sender: TObject);
begin
  inherited;
  StrDays :=10;
  WTGoingOn;
end;

procedure TSREdWorkRestForm.FormActivate(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;

procedure TSREdWorkRestForm.SRWKRSClearClick(Sender: TObject);
begin
  inherited;
    adsDetail.edit;
//    adsDetail.FieldByName('PackunitID').ReadOnly := False;
    adsDetail.FieldByName('PackunitID').Value :=Null;
    adsDetail.Post;
end;

end.
