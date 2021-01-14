unit SREdBaseSalary;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TSREdBaseSalaryForm = class(TBaseVoucherEditForm)
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    GoodName: TADODataSet;
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
    DBEdit2: TDBEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    AdsEmployeeD: TADODataSet;
    dsEmployeeD: TDataSource;
    LookEmployeeD: TQLDBLookupComboBox;
    adsDetailEmployeeD: TStringField;
    BitBtn5: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    adsDetailPayable: TBCDField;
    adsDetailSalaryAmount: TBCDField;
    BitBtn6: TBitBtn;
    adsDetailCntTimeID: TIntegerField;
    adsDetailTimeAmount: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure GetJobsSalary;
    procedure GetTimeCntSalary;
    procedure adsDetailSundryFeeChange(Sender: TField);
    procedure adsDetailAmountChange(Sender: TField);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SREdBaseSalaryForm: TSREdBaseSalaryForm;

implementation

uses CommonDM, WSUtils, WSSecurity, QLDBFlt;
{$R *.dfm}
procedure TSREdBaseSalaryForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SRBaseSalaryMaster',number);
  adsMaster.FieldByName('CreateUserID').Value:=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='基本工资计算';
  adsMaster.FieldByName('ClearDate').AsDateTime:=date;
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('OriginTable').AsString:='SRBaseSalaryMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TSREdBaseSalaryForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSREdBaseSalaryForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  AdsSRJobs.Close;
end;

procedure TSREdBaseSalaryForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'SRBaseSalary';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  AdsSRJobs.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from ('
      +'  select brief,date from SRWorkTimeCntMaster where RecordState<>'
      +Quotedstr('删除')+'  UNION ALL'
      +'  select brief,date from SRWorkQuantityMaster where RecordState<>'
      +Quotedstr('删除')+'  UNION ALL  '
      +'  select brief,date from SRBaseSalaryMaster where RecordState<>'
      +Quotedstr('删除')+' ) as a where brief<> '+ Quotedstr('')
      +' and brief is not null Order by brief Desc'  ;
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('[1]月份基本工资');
end;

procedure TSREdBaseSalaryForm.FormShow(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;


procedure TSREdBaseSalaryForm.BitBtn1Click(Sender: TObject);
var
  FilterDialog: TQLDBFilterDialog;
begin
  inherited;
  BitBtn1.Enabled:=False;
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
    while not TempAds.Eof do
    begin
      adsDetail.append;
      adsDetail.FieldByName('GoalUnitID').AsInteger := TempAds.fieldbyname('ID').AsInteger;
//      adsDetail.FieldByName('Payable').ReadOnly :=false;
      adsDetail.FieldByName('Payable').AsFloat := 0.00;
//      adsDetail.FieldByName('Payable').ReadOnly :=true;

//      adsDetail.FieldByName('SalaryAmount').ReadOnly :=false;
      adsDetail.FieldByName('SalaryAmount').AsFloat := 0.00;
//      adsDetail.FieldByName('SalaryAmount').ReadOnly :=true;
      adsDetail.Post;
      TempAds.Next;
    end;
    if not TempAds.IsEmpty then  adsDetail.First;
  finally
    FilterDialog.Free;
  end;
end;

procedure TSREdBaseSalaryForm.BitBtn3Click(Sender: TObject);
begin
  inherited;
  AdsDetail.First;
  while not AdsDetail.Eof do
  begin
    AdsDetail.Edit;
    GetJobsSalary;
    AdsDetail.FieldByName('QuantityPcs').AsFloat :=TempAds.fieldbyname('amount').AsFloat;
    AdsDetail.Next;
  end;
end;

procedure TSREdBaseSalaryForm.GetJobsSalary;
var year,month,day :word;
    datestr,Brief, GoalUnitID:string;
    ClearDate:Tdatetime;
begin
  if AdsMaster.fieldbyname('Cleardate').IsNull then  ClearDate :=date
      else ClearDate := AdsMaster.fieldbyname('Cleardate').AsDateTime ;
  DecodeDate(ClearDate,year, month, day);
  DateStr := Datetostr(ClearDate);
  if AdsMaster.fieldbyname('brief').IsNull then Brief :='[--]'
      else Brief :=AdsMaster.fieldbyname('brief').AsString;

  if AdsDetail.fieldbyname('GoalUnitID').IsNull then GoalUnitID :='0'
      else GoalUnitID := AdsDetail.fieldbyname('GoalUnitID').AsString ;

  TempAds.Close;
  TempAds.CommandText :=' select sum(amount) as amount from '
      +' SRWorkQuantityDetail a '
      +' left outer join  SRWorkQuantityMaster b on b.ID=a.MasterID'
      +' where a.GoalUnitID='+GoalUnitID
      +' and b.brief='+Quotedstr(brief)
      +' and b.RecordState<> '+Quotedstr('删除');
  TempAds.open;
end;

procedure TSREdBaseSalaryForm.adsDetailSundryFeeChange(Sender: TField);
var a,b,c,d,e,f,g,h :real;
begin
  inherited;
  if  adsDetail.FieldByName('SundryFee').IsNull then a :=0
    else a := adsDetail.FieldByName('SundryFee').AsFloat;
  if  adsDetail.FieldByName('PriceBase').IsNull then b :=0
    else b := adsDetail.FieldByName('PriceBase').AsFloat;
  if  adsDetail.FieldByName('SundryFee').IsNull then c :=0
    else c := adsDetail.FieldByName('SundryFee').AsFloat;
  if  adsDetail.FieldByName('QuantityPcs').IsNull then d :=0
    else d := adsDetail.FieldByName('QuantityPcs').AsFloat;
  if  adsDetail.FieldByName('GoalQuantity').IsNull then e :=0
    else e := adsDetail.FieldByName('GoalQuantity').AsFloat;
  if  adsDetail.FieldByName('Discount').IsNull then f :=0
    else f := adsDetail.FieldByName('Discount').AsFloat;
  if  adsDetail.FieldByName('TaxAmount').IsNull then g :=0
    else g := adsDetail.FieldByName('TaxAmount').AsFloat;

  if  adsDetail.FieldByName('TimeAmount').IsNull then h :=0
    else h := adsDetail.FieldByName('TimeAmount').AsFloat;

//    adsDetail.FieldByName('Payable').ReadOnly :=false;
    adsDetail.Edit;
    adsDetail.FieldByName('Payable').AsFloat :=a+b+c+d+e+h;
//    adsDetail.Post;
//    adsDetail.FieldByName('Payable').ReadOnly :=true;

//    adsDetail.FieldByName('SalaryAmount').ReadOnly :=false;
    adsDetail.Edit;
    adsDetail.FieldByName('SalaryAmount').AsFloat :=a+b+c+d+e+h-f-g;
//    adsDetail.Post;
//    adsDetail.FieldByName('SalaryAmount').ReadOnly :=True;
end;

procedure TSREdBaseSalaryForm.adsDetailAmountChange(Sender: TField);
begin
  inherited;
    AdsDetail.Edit;
    if (AdsDetail.FieldByName('SundryFee').IsNull) or (AdsDetail.FieldByName('SundryFee').AsFloat=0) then
    if AdsDetail.FieldByName('Amount').IsNull then AdsDetail.FieldByName('SundryFee').AsFloat :=0
        else AdsDetail.FieldByName('SundryFee').AsFloat := AdsDetail.FieldByName('Amount').AsFloat;
end;

procedure TSREdBaseSalaryForm.BitBtn6Click(Sender: TObject);
begin
  inherited;
  AdsDetail.First;
  while not AdsDetail.Eof do
  begin
    AdsDetail.Edit;
    GetTimeCntSalary;
    AdsDetail.FieldByName('TimeAmount').AsFloat :=TempAds.fieldbyname('amount').AsFloat;
    AdsDetail.Next;
  end;
end;

procedure TSREdBaseSalaryForm.GetTimeCntSalary;
var year,month,day :word;
    datestr,Brief,GoalUnitID :string;
    ClearDate:Tdatetime;
begin
  if AdsMaster.fieldbyname('Cleardate').IsNull then  ClearDate :=date
      else ClearDate := AdsMaster.fieldbyname('Cleardate').AsDateTime ;
  DecodeDate(ClearDate,year, month, day);
  Datestr :=Datetostr(ClearDate);
  if AdsMaster.fieldbyname('brief').IsNull then Brief :='[--]'
      else Brief :=AdsMaster.fieldbyname('brief').AsString;

  if AdsMaster.fieldbyname('brief').IsNull then Brief :='[--]'
      else Brief :=AdsMaster.fieldbyname('brief').AsString;
  if AdsDetail.fieldbyname('GoalUnitID').IsNull then GoalUnitID:='0'
      else GoalUnitID :=AdsDetail.fieldbyname('GoalUnitID').AsString  ;

  TempAds.Close;
  TempAds.CommandText :=' select sum(amount) as amount from '
      +' SRWorkTimeCntDetail a '
      +' left outer join  SRWorkTimeCntMaster b on b.ID=a.MasterID'
      +' where a.GoalUnitID='+GoalUnitID
      +' and b.brief='+Quotedstr(brief)
      +' and b.RecordState<> '+Quotedstr('删除');
  TempAds.open;
end;

end.
