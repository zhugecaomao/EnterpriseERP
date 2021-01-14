unit SREdWorkTimeCnt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons, QLDBFlt, BaseVoucherEdit;

type
  TSREdWorkTimeCntForm = class(TBaseVoucherEditAForm)
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
    procedure FormActivate(Sender: TObject);
    procedure adsDetailPackUnitIDChange(Sender: TField);
    procedure DeleteRec;
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SREdWorkTimeCntForm: TSREdWorkTimeCntForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TSREdWorkTimeCntForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SRWorkTimeCntMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='计时统计';
  adsMaster.FieldByName('ClearDate').AsDateTime :=date;
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='SRWorkTimeCntMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TSREdWorkTimeCntForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSREdWorkTimeCntForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  AdsSRJobs.Close;
end;

procedure TSREdWorkTimeCntForm.FormCreate(Sender: TObject);
var I:integer;
begin
  inherited;
  VoucherTableName := 'SRWorkTimeCnt';
  ClientName.Open;
  EmployeeName.Open;
  adsMaster.Open;
  adsDetail.Open;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempTMJobs')
        +' )) DROP TABLE #TempTMJobs ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #TempTMJobs ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[JobsID] [int] NULL ,'
      +'	[name] [varchar] (20) ,          '
      +'	[PriceBase] [float] NULL ,      '
      +'	[date] [datetime] NULL   )     ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Truncate Table  #TempTMJobs ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Insert into #TempTMJobs ( JobsID,Name,Pricebase,date ) '
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
  ADOQuery.SQL.Text :=' select ID,JobsID,Name,Pricebase from  #TempTMJobs  Order by JobsID,date,id desc ';
  ADOQuery.Open;
  ADOQuery.First;
  I:=0;
  while not ADOQuery.Eof do
  begin
    if ADOQuery.FieldByName('JobsID').AsInteger =I then   DeleteRec;
    I:=ADOQuery.FieldByName('JobsID').AsInteger;
    ADOQuery.Next;
  end;
  AdsSRJobs.Close;
  AdsSRJobs.CommandText :=' select ID,JobsID,Name,Pricebase from  #TempTMJobs order by JobsID';
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

procedure TSREdWorkTimeCntForm.BitBtn1Click(Sender: TObject);
var
  FilterDialog: TQLDBFilterDialog;
begin
  inherited;
  FilterDialog := TQLDBFilterDialog.Create(Self);
  try
    BitBtn1.Enabled:=False;
    TempAds.Close;
    TempAds.CommandText :=
        ' SELECT E.ID, E.Name, E.Gender, D.Name AS Department, P.Name AS Position' +
        ' FROM MSEmployee E LEFT JOIN' +
	'   MSDepartment D ON E.DepartmentID = D.ID LEFT JOIN' +
	'   MSPostion P ON E.PostionID = P.ID' +
//       ' select ID,Name from MSEmployee where'
        ' WHERE E.RecordState<>'+Quotedstr('删除')+' and  E.ID not in'
        +'  (select distinct GoalUnitID from SRWorkQuantityDetail where MasterID='
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
    adsDetail.First;
    while not TempAds.Eof do
    begin
      if adsDetail.Eof then adsDetail.append
        else  adsDetail.Edit;
      adsDetail.FieldByName('GoalUnitID').AsInteger := TempAds.fieldbyname('ID').AsInteger;
      adsDetail.Post;
      TempAds.Next;
      adsDetail.Next;
    end;
    if not TempAds.IsEmpty then  adsDetail.First;
  finally
    FilterDialog.Free;
  end;
end;

procedure TSREdWorkTimeCntForm.BitBtn3Click(Sender: TObject);
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

procedure TSREdWorkTimeCntForm.BitBtn2Click(Sender: TObject);
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

procedure TSREdWorkTimeCntForm.adsDetailPriceBaseChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  adsDetail.FieldByName('Amount').AsFloat :=adsDetail.fieldbyname('PriceBase').AsFloat*
  adsDetail.FieldByName('Quantity').AsFloat  ;
end;

procedure TSREdWorkTimeCntForm.BitBtn4Click(Sender: TObject);
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

procedure TSREdWorkTimeCntForm.BitBtn5Click(Sender: TObject);
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

procedure TSREdWorkTimeCntForm.FormActivate(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;

procedure TSREdWorkTimeCntForm.adsDetailPackUnitIDChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  adsDetail.FieldByName('PriceBase').AsFloat :=AdsSRJobs.fieldbyname('PriceBase').AsFloat;
  adsDetail.FieldByName('Amount').AsFloat :=
    AdsSRJobs.fieldbyname('PriceBase').AsFloat*adsDetail.FieldByName('Quantity').AsFloat;
end;

procedure TSREdWorkTimeCntForm.DeleteRec;
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Text :=' delete from  #TempTMJobs where ID='
      +ADOQuery.fieldbyname('ID').AsString;
  ADOQuery1.ExecSQL;
end;

procedure TSREdWorkTimeCntForm.BitBtn6Click(Sender: TObject);
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

end.
