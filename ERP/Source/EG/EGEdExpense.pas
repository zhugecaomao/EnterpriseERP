unit EGEdExpense;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TEGEdExpenseForm = class(TBaseVoucherEditAForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    EmployeeName: TADODataSet;
    GoodName: TADODataSet;
    PackUnit: TADODataSet;
    dsPackUnit: TDataSource;
    DSEmployeeName: TDataSource;
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
    adsDetailTaxAmount: TBCDField;
    adsDetailGoodsSpec: TStringField;
    dsExpense: TDataSource;
    adsMasterEmployee: TStringField;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    adsDetailGoalUnit: TStringField;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    adsMasterWarehouseID: TIntegerField;
    adsDetailGoodsName: TStringField;
    AdsWareHouse: TADODataSet;
    DsWareHouse: TDataSource;
    MaterialBalance: TMenuItem;
    ClientName: TADODataSet;
    DSClientName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    adsMasterProjectName: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure adsDetailQuantityChange(Sender: TField);
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
  EGEdExpenseForm: TEGEdExpenseForm;

implementation

uses CommonDM, WSUtils,WSSecurity,VoucherQuery;

{$R *.dfm}
procedure TEGEdExpenseForm.New;
begin
  inherited;           //  .Value:=Date;
  adsMaster.FieldByName('Date').AsDateTime:=Date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','EGExpenseMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BIllMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='项目工费';
  adsMaster.FieldByName('BIllMode').ReadOnly :=True;
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
  adsMaster.FieldByName('OriginTable').AsString:='EGExpenseMaster';
end;

procedure TEGEdExpenseForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TEGEdExpenseForm.FormClose(Sender: TObject;
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

procedure TEGEdExpenseForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'EGExpense';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  AdsWareHouse.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from EGExpenseMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('项目工费');
end;

procedure TEGEdExpenseForm.adsDetailQuantityChange(Sender: TField);
var   ExChRate :real;
begin
  inherited;
end;

procedure TEGEdExpenseForm.MaterialBalanceClick(Sender: TObject);
begin
  inherited;
  ShowQueryForm(Caption,Hint,
        '  select  d.name [仓库名称], '
     +' e.name [材料名称],                                    '
     +' g.name [标准单位],                                    '
     +' sum(isnull(a.GoalQuantity,0) ) [标准数量] ,           '
     +' sum(isnull(a.Amount,0))/sum(isnull(a.GoalQuantity,1))  [平均单价] , '
     +' sum(isnull(a.Amount,0)) [金额] ,                       '
     +' f.name [包装单位],                                     '
     +' sum(isnull(a.Quantity,0)) [包装数量]                   '
     +' from ( select GoodsID,GoalUnitID,                      '
     +' b.WareHouseID,                                         '
     +' GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) GoalQuantity ,           '
     +' PriceBase,                                             '
     +' Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) Amount,                        '
     +' Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) Quantity,                    '
     +' PackUnitID                                             '
     +' from EGExpenseDetail a                              '
     +' left outer join EGExpenseMaster b on b.Id=a.MasterID'
     +' where GoodsID<>0 and RecordState<>'+Quotedstr('删除')
     +' UNION  ALL                                             '
     +' select GoodsID,GoalUnitID,                             '
     +' b.WareHouseID,                                         '
     +' GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)*(-1) GoalQuantity,       '
     +' PriceBase,                                             '
     +' Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)*(-1) Amount,                   '
     +' Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)*(-1) Quantity,               '
     +' PackUnitID                                             '
     +' from EGMaterialOutDetail a                             '
     +' left outer join EGMaterialOutMaster b on b.Id=a.MasterID  '
     +' where GoodsID<>0 and RecordState<>'+Quotedstr('删除')
     +'  ) as a                                                      '
     +' left outer join  STWareHouse   d  on d.ID=a.WareHouseID   '
     +' left outer join  DAGoods   e   on e.id=a.GoodsID          '
     +' left outer join  MSunit   f   on f.id=a.PackUnitID        '
     +' left outer join  MSunit   g   on g.id=E.UnitID        '
     +' group by d.name ,e.name ,g.name ,f.name                   ')

end;

procedure TEGEdExpenseForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

end.
