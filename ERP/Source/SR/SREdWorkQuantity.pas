unit SREdWorkQuantity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons, QLDBFlt, BaseVoucherEdit;

type
  TSREdWorkQuantityForm = class(TBaseVoucherEditAForm)
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
    DBEdit2: TDBEdit;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    AdsEmployeeD: TADODataSet;
    dsEmployeeD: TDataSource;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    ADOQuery: TADOQuery;
    ADOQuery1: TADOQuery;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    adsDetailEmployee: TStringField;
    adsDetailJobs: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure adsDetailPriceBaseChange(Sender: TField);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure adsDetailPackUnitIDChange(Sender: TField);
    procedure DeleteRec;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SREdWorkQuantityForm: TSREdWorkQuantityForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TSREdWorkQuantityForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SRWorkQuantityMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='工作量统计';
  adsMaster.FieldByName('ClearDate').AsDateTime:=date;
  adsMaster.FieldByName('ModeDC').AsFloat:=1;
  adsMaster.FieldByName('ModeC').AsFloat:=1;
  adsMaster.FieldByName('OriginTable').AsString:='SRWorkQuantityMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TSREdWorkQuantityForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSREdWorkQuantityForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  AdsSRJobs.Close;
end;

procedure TSREdWorkQuantityForm.FormCreate(Sender: TObject);
var I:integer;
begin
  inherited;
  VoucherTableName := 'SRWorkQuantity';
  ClientName.Open;
  EmployeeName.Open;
  adsMaster.Open;
  adsDetail.Open;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempJobs')
        +' )) DROP TABLE #TempJobs ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #TempJobs ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[JobsID] [int] NULL ,'
      +'	[name] [varchar] (20) ,          '
      +'	[PriceBase] [float] NULL ,      '
      +'	[date] [datetime] NULL   )     ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Truncate Table  #TempJobs ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Insert into #TempJobs ( JobsID,Name,Pricebase,date ) '
      +' select JobsID,name,PriceBase,date from'
      +' ( select ID as JobsID ,Name,Pricebase ,CreateDate as date from SRJobs'
      +' where RecordState<>'+Quotedstr('删除')
      +' UNION ALL '
      +' select a.PackunitID as JobsID ,C.name ,'
      +' a.PriceBase ,b.date  from SRJobsPriceDetail a '
      +' left outer join  SRJobsPriceMaster b on b.ID=a.Masterid '
      +' left outer join  SRJobs c on C.ID=a.PackunitID '
      +' where  b.RecordState<>'+Quotedstr('删除')
      +' ) as a where a.PriceBase <>0'
      +' order by JobsID,date Desc';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select ID,JobsID,Name,Pricebase from  #TempJobs  Order by JobsID,date,id desc ';
  ADOQuery.Open;
  ADOQuery.First;
  I:=0;
  while not ADOQuery.Eof do
  begin
    if ADOQuery.FieldByName('JobsID').AsInteger =I then   DeleteRec;
    I:=ADOQuery.FieldByName('JobsID').AsInteger;
    ADOQuery.Next;
  end;
  dsSRJobs.DataSet :=AdsSRJobs;
  AdsSRJobs.Close;
  AdsSRJobs.CommandText :=' select ID,JobsID,Name,Pricebase '
      +'  from  #TempJobs order by JobsID';
  AdsSRJobs.Open;
//  AdsSRJobs.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from ('
      +'  select brief,date from SRWorkTimeCntMaster where RecordState<>'
      +Quotedstr('删除')+'  UNION ALL  '
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
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('[--]月份工资计算');
end;

procedure TSREdWorkQuantityForm.BitBtn1Click(Sender: TObject);
var
  FilterDialog: TQLDBFilterDialog;
  EmployeeSelectADS :TADODataSet;
begin
  inherited;
  FilterDialog := TQLDBFilterDialog.Create(Self);
  EmployeeSelectADS := TADODataSet.Create(nil);
  EmployeeSelectADS.Connection := CommonData.acnConnection;
  try
    BitBtn1.Enabled:=False;
    EmployeeSelectADS.Close;
    EmployeeSelectADS.CommandText :=
    ' SELECT E.ID, E.Name, E.Gender, D.Name AS Department, P.Name AS Position' +
    ' FROM MSEmployee E LEFT JOIN' +
    '   MSDepartment D ON E.DepartmentID = D.ID LEFT JOIN' +
    '   MSPostion P ON E.PostionID = P.ID' +
//       ' select ID,Name from MSEmployee where'
    ' WHERE E.RecordState<>'+Quotedstr('删除')+' and  E.ID not in'
    +'  (select distinct GoalUnitID from SRWorkQuantityDetail where MasterID='
    + Quotedstr(adsMaster.fieldbyname('ID').AsString) + '  )';
    EmployeeSelectADS.Open;
    with EmployeeSelectADS do
    begin
      Fields[1].DisplayLabel := '姓名';
      Fields[2].DisplayLabel := '性别';
      Fields[3].DisplayLabel := '部门';
      Fields[4].DisplayLabel := '职位';
    end;
    FilterDialog.DataSet := EmployeeSelectADS;
    FilterDialog.FilterFields := 'Name; Gender; Department; Position';
    if not FilterDialog.Execute then Exit;
    EmployeeSelectADS.First;
    adsDetail.First;
    while not EmployeeSelectADS.Eof do
    begin
      if adsDetail.Eof then adsDetail.append
        else  adsDetail.Edit;
      adsDetail.FieldByName('GoalUnitID').AsInteger := EmployeeSelectADS.fieldbyname('ID').AsInteger;
      adsDetail.Post;
      EmployeeSelectADS.Next;
      adsDetail.Next;
    end;
    if not EmployeeSelectADS.IsEmpty then  adsDetail.First;
  finally
    FilterDialog.Free;
  end;
end;

procedure TSREdWorkQuantityForm.BitBtn3Click(Sender: TObject);
begin
  inherited;
//  BitBtn3.Enabled:=False;
  if ((adsMaster.fieldbyname('SundryFee').AsFloat=0) or (adsMaster.fieldbyname('SundryFee').IsNull) ) then
       exit;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    if  ( (adsDetail.FieldByName('Quantity').AsFloat=0) or (adsDetail.FieldByName('Quantity').IsNull) ) then
         adsDetail.FieldByName('Quantity').AsFloat :=adsMaster.fieldbyname('SundryFee').AsFloat ;
    adsDetail.Post;
    adsDetail.Next;
  end;
  if not TempAds.IsEmpty then  adsDetail.First;
end;

procedure TSREdWorkQuantityForm.BitBtn2Click(Sender: TObject);
var Jobs :Integer;
    Price:real;
begin
  inherited;
  adsDetail.First;
  AdsSRJobs.Locate('JobsID',adsDetail.Fieldbyname('PackUnitID').AsString,[]);
  if AdsSRJobs.fieldbyname('JobsID').IsNull then exit
     else Jobs :=AdsSRJobs.fieldbyname('JobsID').AsInteger;
  if AdsSRJobs.fieldbyname('PriceBase').IsNull then Price :=0.00
     else Price :=AdsSRJobs.fieldbyname('PriceBase').AsFloat ;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    if  ( (adsDetail.FieldByName('PackUnitID').AsFloat=0) or (adsDetail.FieldByName('PackUnitID').IsNull) ) then
          adsDetail.FieldByName('PackUnitID').AsFloat := Jobs;
    if  ( (adsDetail.FieldByName('PriceBase').AsFloat=0) or (adsDetail.FieldByName('PriceBase').IsNull) ) then
          adsDetail.FieldByName('PriceBase').AsFloat :=Price;
    adsDetail.Post;
    adsDetail.Next;
  end;
  if not TempAds.IsEmpty then  adsDetail.First;
end;

procedure TSREdWorkQuantityForm.adsDetailPriceBaseChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  adsDetail.FieldByName('Amount').AsFloat :=
      adsDetail.fieldbyname('PriceBase').AsFloat*
  adsDetail.FieldByName('Quantity').AsFloat;
end;

procedure TSREdWorkQuantityForm.BitBtn4Click(Sender: TObject);
begin
  inherited;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    adsDetail.FieldByName('Quantity').AsFloat :=0;
    adsDetail.Next;
  end;
end;

procedure TSREdWorkQuantityForm.BitBtn5Click(Sender: TObject);
begin
  inherited;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    adsDetail.FieldByName('PriceBase').AsFloat :=0;
    adsDetail.Next;
  end;
  adsDetail.First;
end;

procedure TSREdWorkQuantityForm.adsDetailPackUnitIDChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  adsDetail.FieldByName('PriceBase').AsFloat :=
  AdsSRJobs.fieldbyname('PriceBase').AsFloat;
  adsDetail.FieldByName('Amount').AsFloat :=
      adsDetail.fieldbyname('PriceBase').AsFloat*
  adsDetail.FieldByName('Quantity').AsFloat
end;

procedure TSREdWorkQuantityForm.DeleteRec;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text :=' delete from  #TempJobs where ID='
      +ADOQuery.fieldbyname('ID').AsString;
  ADOQuery1.ExecSQL;
end;

procedure TSREdWorkQuantityForm.BitBtn6Click(Sender: TObject);
begin
  inherited;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    adsDetail.FieldByName('PackunitID').AsInteger :=0;
    adsDetail.Next;
  end;
  adsDetail.First;
end;

procedure TSREdWorkQuantityForm.BitBtn7Click(Sender: TObject);
var I,J:integer;
begin
  inherited;
  J :=0 ;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    J:=J+1;
    I :=adsDetail.FieldByName('PackunitID').AsInteger;
    adsDetail.Next;
    if I <> adsDetail.FieldByName('PackunitID').AsInteger then
        showmessage('计件项目不一致,将导致计算工资错误!');
  end;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    adsDetail.FieldByName('Amount').AsFloat :=
        adsDetail.fieldbyname('PriceBase').AsFloat*
    adsDetail.FieldByName('Quantity').AsFloat/J;
    adsDetail.Next;
  end;
end;

procedure TSREdWorkQuantityForm.FormActivate(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;

end.
