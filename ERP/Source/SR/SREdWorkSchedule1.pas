unit SREdWorkSchedule;

interface

uses
  
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, DateUtils,Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons; 

type
  TSREdWorkScheduleForm = class(TBaseVoucherEditAForm)
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
    Worktime0: TADODataSet;
    DsWorktime0: TDataSource;
    Worktime1: TADODataSet;
    DsWorktime1: TDataSource;
    Worktime2: TADODataSet;
    DsWorktime2: TDataSource;
    adsDetailWtMemo0: TStringField;
    adsDetailWtMemo1: TStringField;
    adsDetailWtMemo2: TStringField;
    LookupWt0: TQLDBLookupComboBox;
    ADOQuery: TADOQuery;
    LookupWt1: TQLDBLookupComboBox;
    QLDBLookupComboBox2: TQLDBLookupComboBox;
    LookupWt2: TQLDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure adsDetailEndTimeChange(Sender: TField);
    procedure adsDetailStartTimeChange(Sender: TField);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SREdWorkScheduleForm: TSREdWorkScheduleForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TSREdWorkScheduleForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime:=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SRWorkScheduleMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='作息时间制定';
  adsMaster.FieldByName('ClearDate').AsDateTime:=date;
  adsMaster.FieldByName('ModeDC').AsInteger:=1;
  adsMaster.FieldByName('ModeC').AsInteger:=1;
  adsMaster.FieldByName('OriginTable').AsString:='SRWorkScheduleMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TSREdWorkScheduleForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSREdWorkScheduleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
end;

procedure TSREdWorkScheduleForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'SRWorkSchedule';
  adsMaster.Open;
  adsDetail.Open;
  ClientName.Open;
  EmployeeName.Open;

  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from SRWorkScheduleMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('作息时间制定');
//  StrDays:=0;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempBS')
        +' )) DROP TABLE #TempBS ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #TempBS ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[WTID] [int] ,          '
      +'	[Starttxt] [varchar] (30),  '
      +'	[EndTxt] [varchar] (30) ,   '
      +'	[Memo] [varchar] (60)  )   ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Insert into  #TempBS ( WTID,Starttxt,EndTxt,Memo )'
    +' select a.ID, a.StartTime, a.EndTime,a.Memo '
    +' from SRWorkTimeDetail a '
    +' left  outer join SRWorkTimeMaster b on b.id=A.masterID '
    +' where b.recordstate<>'+Quotedstr('删除');
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Update  #TempBS set Memo='
    +' LTRIM (RTRIM (Memo))+ '+Quotedstr('[')
    +'+ SUBSTRING(LTRIM (RTRIM (Starttxt)),12,12) + '+Quotedstr('-')
    +'+ SUBSTRING(LTRIM (RTRIM (EndTxt)),12,12) + ' +Quotedstr(']');
  ADOQuery.ExecSQL;

  Worktime0.Close;
  Worktime0.CommandText := 'select WTID as ID,Memo from #TempBS  ' ;
  Worktime0.Open;
  Worktime1.Close;
  Worktime1.CommandText := 'select WTID as ID,Memo from #TempBS  ' ;
  Worktime1.Open;
  Worktime2.Close;
  Worktime2.CommandText := 'select WTID as ID,Memo from #TempBS  '  ;
  Worktime2.Open;














end;

procedure TSREdWorkScheduleForm.FormShow(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;

procedure TSREdWorkScheduleForm.adsDetailEndTimeChange(Sender: TField);
begin
  inherited;
  if adsDetail.fieldbyname('EndTime').AsDateTime <adsDetail.fieldbyname('StartTime').AsDateTime then
    begin
      adsDetail.Edit;
      adsDetail.fieldbyname('EndTime').AsDateTime :=adsDetail.fieldbyname('StartTime').AsDateTime;
     end;
end;

procedure TSREdWorkScheduleForm.adsDetailStartTimeChange(Sender: TField);
begin
  inherited;
  if adsDetail.fieldbyname('StartTime').AsDateTime >adsDetail.fieldbyname('EndTime').AsDateTime then
    begin
      adsDetail.Edit;
      adsDetail.fieldbyname('EndTime').AsDateTime :=adsDetail.fieldbyname('StartTime').AsDateTime;
     end;
end;

procedure TSREdWorkScheduleForm.BitBtn2Click(Sender: TObject);
var year,month,day :word;
    SDate,Edate  :Tdatetime;
    I:integer;
begin
  if adsMaster.FieldByName('Cleardate').IsNull then  SDate :=date
    else SDate :=adsMaster.FieldByName('Cleardate').AsDateTime;
  EDate :=EndoftheMonth(SDate);
  DecodeDate(EDate,year, month, day);
  SDate :=EnCodeDate(year,month,1);
  adsDetail.First;
  for   I :=0 to day-1 do
  begin
    if adsDetail.Eof then adsDetail.append
      else adsDetail.edit;
    adsDetail.FieldByName('StartTime').ReadOnly :=false;
    adsDetail.FieldByName('StartTime').AsDateTime := SDate+I;
    adsDetail.Next;
  end;
  while not adsDetail.Eof do
  begin
    adsDetail.Delete;
    adsDetail.Next;
  end;
  adsDetail.FieldByName('StartTime').ReadOnly :=True;
  adsDetail.first;
end;

end.
