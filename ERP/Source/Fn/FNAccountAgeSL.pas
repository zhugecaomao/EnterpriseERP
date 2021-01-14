unit FNAccountAgeSL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, GEdit,
  DBCtrls, Menus,TypInfo;

type
  TFNAccountAgeSLForm = class(TWSVoucherBrowseForm)
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    adsMaster: TADODataSet;
    Panel2: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    ADOQuery: TADOQuery;
    ComboBox1: TComboBox;
    ADOQuery2: TADOQuery;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    ToolButton1: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpdateDBGrid;
    procedure FormShow(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure Label2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure adsMasterBeforeOpen(DataSet: TDataSet);
    procedure adsMasterAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FNAccountAgeSLForm: TFNAccountAgeSLForm;

implementation

uses CommonDM ,FNReceiptPayLeger;

{$R *.dfm}

function TFNAccountAgeSLForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TFNAccountAgeSLForm.BitBtn1Click(Sender: TObject);
var  DateStr :STRING;
begin
//  DecodeDate(DateTimePicker1.Date,year, month, day); +Quotedstr(DateStr)+
  DateStr :=DateTOSTR(DateTimePicker1.Date);
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#FNAccountAgeRP')
        +' )) DROP TABLE #FNAccountAgeRP ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #FNAccountAgeRP  ('
    +' [ClientID] [int] NULL ,[EmployeeID] [int] NULL, '
    +' [PeriodA] [float] NULL,   '
    +' [PeriodB] [float] NULL,   '
    +' [PeriodC] [float] NULL,   '
    +' [PeriodD] [float] NULL,   '
    +' [PeriodE] [float] NULL,   '
    +' [PeriodF] [float] NULL,   '
    +' [PeriodG] [float] NULL,   '
    +' [PeriodTTL] [float] NULL )   ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #FNAccountAgeRP';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' INSERT INTO #FNAccountAgeRP ('
    +' [ClientID],[EmployeeID],[PeriodA] ,   '
    +' [PeriodB] ,[PeriodC] ,[PeriodD],'
    +' [PeriodE], [PeriodF] ,[PeriodG] ,   '
    +' [PeriodTTL] )'
    +' SELECT ClientID,EmployeeID,                                '
    +' PeriodA ,PeriodB,PeriodC,PeriodD,    '
    +' PeriodE ,PeriodF,PeriodG,PeriodTTL FROM  '
    +' (SELECT ClientID,EmployeeID,                                '
    +' ISNULL(AMOUNT,0) PeriodA ,0 PeriodB,0 PeriodC,0 PeriodD,    '
    +' 0 PeriodE ,0 PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL   '
    +' FROM #FNAccountAge WHERE DATEDIFF(Month, cleardate,'
    +Quotedstr(DateStr)+' ) <1                                     '
    +' UNION ALL                                                   '
    +' SELECT ClientID,EmployeeID,                                 '
    +' 0 PeriodA ,ISNULL(AMOUNT,0) PeriodB,0 PeriodC,0 PeriodD,    '
    +' 0 PeriodE ,0 PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL   '
    +' FROM #FNAccountAge WHERE DATEDIFF(Month, cleardate,'
    +Quotedstr(DateStr)+' ) =1                                     '
    +' UNION ALL                                                   '
    +' SELECT ClientID,EmployeeID,                                 '
    +' 0 PeriodA ,0 PeriodB,ISNULL(AMOUNT,0) PeriodC,0 PeriodD,    '
    +' 0 PeriodE ,0 PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL   '
    +' FROM #FNAccountAge WHERE DATEDIFF(Month, cleardate,'
    +Quotedstr(DateStr)+' ) =2                                     '
    +' UNION ALL                                                   '
    +' SELECT ClientID,EmployeeID,                                 '
    +' 0 PeriodA ,0 PeriodB,0 PeriodC,ISNULL(AMOUNT,0) PeriodD,    '
    +' 0 PeriodE ,0 PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL   '
    +' FROM #FNAccountAge WHERE DATEDIFF(Month, cleardate,'
    +Quotedstr(DateStr)+' ) =3                                     '
    +' UNION ALL                                                   '
    +' SELECT ClientID,EmployeeID,                                 '
    +' 0 PeriodA ,0 PeriodB,0 PeriodC,0 PeriodD,                   '
    +' ISNULL(AMOUNT,0) PeriodE ,0 PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL '
    +' FROM #FNAccountAge WHERE DATEDIFF(Month, cleardate,'
    +Quotedstr(DateStr)+' ) =4                                                  '
    +' UNION ALL                                                                '
    +' SELECT ClientID,EmployeeID,                                              '
    +' 0 PeriodA ,0 PeriodB,0 PeriodC,0 PeriodD,                                '
    +' 0 PeriodE ,ISNULL(AMOUNT,0) PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL '
    +' FROM #FNAccountAge WHERE DATEDIFF(Month, cleardate,'
    +Quotedstr(DateStr)+' ) =5                                                  '
    +' UNION ALL                                                                '
    +' SELECT ClientID,EmployeeID,                                              '
    +' 0 PeriodA ,0 PeriodB,0 PeriodC,0 PeriodD,                                '
    +' 0 PeriodE ,0 PeriodF,ISNULL(AMOUNT,0) PeriodG,ISNULL(AMOUNT,0) PeriodTTL '
    +' FROM #FNAccountAge WHERE DATEDIFF(Month, cleardate,'
    +Quotedstr(DateStr)+' ) =6                                                  '
    +' UNION ALL                                                                '
    +' SELECT ClientID,EmployeeID,                                              '
    +' 0 PeriodA ,0 PeriodB,0 PeriodC,0 PeriodD,                                '
    +' 0 PeriodE ,0 PeriodF,ISNULL(AMOUNT,0) PeriodG,ISNULL(AMOUNT,0) PeriodTTL '
    +' FROM #FNAccountAge WHERE DATEDIFF(Month, cleardate,'
    +Quotedstr(DateStr)+' ) >6                                                  '
    +' ) AS A ' ;
  ADOQuery.ExecSQL;

  adsMaster.Close;
//  adsMaster.CommandText :=' select a.ClientID,b.name Client,c.name Employee,'
  adsMaster.CommandText :=' select '
    +' a.ClientID [客户序号],b.name [客户名称],'
    +' SUM(ISNULL(PeriodA,0)) [一月内帐龄] ,    '
    +' SUM(ISNULL(PeriodB,0)) [二个月帐龄] ,    '
    +' SUM(ISNULL(PeriodC,0)) [三个月帐龄] ,    '
    +' SUM(ISNULL(PeriodD,0)) [四个月帐龄] ,    '
    +' SUM(ISNULL(PeriodE,0)) [五个月帐龄] ,    '
    +' SUM(ISNULL(PeriodF,0)) [六个月帐龄] ,    '
    +' SUM(ISNULL(PeriodG,0)) [长于六个月] ,    '
    +' SUM(ISNULL(PeriodTTL,0)) [合计]   '
    +' from #FNAccountAgeRp AS A   '
    +' LEFT OUTER JOIN DAClient as b  on a.ClientID=b.id '
    +' LEFT OUTER JOIN MSEmployee as c  on a.EmployeeID=c.id'
//    +' GROUP BY a.ClientID,b.name, c.name';
    +' GROUP BY a.ClientID,b.name ';
  adsMaster.Open;
  UpdateDBGrid;
end;

procedure TFNAccountAgeSLForm.FormCreate(Sender: TObject);
begin
  inherited;
  DateTimePicker1.DateTime :=date;
//  DateTimePicker1.Date :=EndoftheMonth(date);
//  DateTimePicker2.Date :=EndoftheMonth(date);
end;

procedure TFNAccountAgeSLForm.UpdateDBGrid;
var  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    for I := 1 to Columns.Count - 1 do
    begin
      Columns[i].Width :=90;
      if Pos('日',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Pos('编',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if I=1  then Columns[i].Width :=160;
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      begin
        SetStrProp(Fields[I], 'DisplayFormat','#,#.00') ;
        if Pos('Price',Columns[I].FieldName)<=0 then Columns[I].Footer.ValueType := fvtSum;
      end;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TFNAccountAgeSLForm.FormShow(Sender: TObject);
begin
  inherited;
//  BitBtn1Click(sender);
 DateTimePicker1.DateTime :=Date;

end;

procedure TFNAccountAgeSLForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
   UpdateDBGrid;
end;

procedure TFNAccountAgeSLForm.Label2Click(Sender: TObject);
begin
  inherited;
  ComboBox1.SetFocus;
end;

procedure TFNAccountAgeSLForm.FormActivate(Sender: TObject);
var ReduceAmount:real;
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#FNAccountAge')
        +' )) DROP TABLE #FNAccountAge ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #FNAccountAge  ('
    +' [id] [int] NULL ,[Date] [datetime] NULL , '
    +' [Code] [varchar] (20) ,[ClientID] [int] NULL ,'
    +' [EmployeeID] [int] NULL ,[cleardate] [datetime] NULL , '
    +' [amount] [float]NULL   ) ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ReduceAmount')
        +' )) DROP TABLE #ReduceAmount ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #ReduceAmount  ('
    +' [ID] [int] NULL ,'
    +' [ClientID] [int] NULL ,'
    +' [Amount] [float]NULL   ) ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #FNAccountAge';
  ADOQuery.ExecSQL;

  ADOQuery.Close;  //插入不在应收帐款的厂商名单
  ADOQuery.SQL.Text :=' INSERT INTO #FNAccountAge ('
      +' [ClientID],[Date],[ClearDate],[Amount] ) '
      +' select ClientID ,min(Date) Date ,min(Date) ClearDate ,'
      +' sum(Isnull(AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1)+'
      +' Isnull(AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) ) Amount   '
      +' from FNClearSLMaster  '
      +' where ClientID not in ( '
      +' select ClientID from SLSaleMaster )  '
      +' Group by ClientID ';
  ADOQuery.ExecSQL;


  ADOQuery.Close;  //首先插入应收款记录
  ADOQuery.SQL.Text :=' INSERT INTO #FNAccountAge ('
      +' [id]  ,[Date] ,[Code] ,[ClientID] ,[EmployeeID] ,'
      +' [cleardate] ,[amount] ) '
      +' select a.ID,a.Date,a.Code,a.ClientID,a.EmployeeID,      '
      +' isnull(a.ClearDate,a.Date),                              '
      +' (isnull(b.Amount,0)+isnull(a.SundryFee,0) )*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as Amount '
      +' from SLSalemaster   a                                                  '
      +' left outer join                                                        '
      +' (select MasterID,Sum(isnull(Amount,0)) Amount                          '
      +' from SLSaleDetail Group by MasterID ) b on b.MasterID=a.ID             '
      +' where a.ModeDC<>-1 and ModeC<>-1 and                                   '
      +' a.Recordstate<>'+Quotedstr('删除') +' and                              '
      +' a.Recordstate<>'+Quotedstr('作废')+' Order by a.Date,a.ID';
  ADOQuery.ExecSQL;


  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #ReduceAmount';
  ADOQuery.ExecSQL;

  ADOQuery2.Close;    ////汇总红字记录、还款记录、以及采购记录
  ADOQuery2.SQL.Text :='Insert into #ReduceAmount (ClientID,Amount)'
      +' select ClientID,sum(isnull(Amount,0)) as Amount '
      +' from  ( '
      +' select a.ID,a.Date,a.Code,a.ClientID,a.EmployeeID,                     '
      +' isnull(a.ClearDate,a.Date) as ClearDate,                                            '
      +' (isnull(b.Amount,0)+isnull(a.SundryFee,0) )*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as Amount '
      +' from SLSalemaster   a                                                  '
      +' left outer join                                                        '
      +' (select MasterID,Sum(isnull(Amount,0)) Amount                          '
      +' from SLSaleDetail Group by MasterID ) b on b.MasterID=a.ID             '
      +' where (a.ModeDC=-1 or ModeC=-1) and                                     '
      +' a.Recordstate<>'+Quotedstr('删除') +' and                              '
      +' a.Recordstate<>'+Quotedstr('作废')
//汇总红字记录ok
      +' union all                                                              '
      +' select ID,Date,Code,ClientID,EmployeeID,Date as ClearDate,             '
      +' (isnull(AmountD,0)+isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as Amount        '
      +' from FNClearSLMaster                                                   '
      +' where Recordstate<>'+Quotedstr('删除') +' and                          '
      +' Recordstate<>'+Quotedstr('作废')
//汇总还款记录ok
      +' union all                                                              '
      +' select a.ID,a.Date,a.Code,a.ClientID,a.EmployeeID,                     '
      +' isnull(a.ClearDate,a.Date) as ClearDate,                                            '
      +' (isnull(b.Amount,0)+isnull(a.SundryFee,0) )*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as Amount '
      +' from PCPurchaseMaster   a                                              '
      +' left outer join                                                        '
      +' (select MasterID,Sum(isnull(Amount,0)) Amount                          '
      +' from PCPurchaseDetail Group by MasterID ) b on b.MasterID=a.ID         '
      +' where a.ModeDC=-1 and ModeC=-1 and                                     '
      +' a.Recordstate<>'+Quotedstr('删除') +' and                              '
      +' a.Recordstate<>'+Quotedstr('作废')+' and                               '
      +' a.ClientID in (select ClientID from SLSaleMaster where                 '
      +' RecordState<>'+Quotedstr('删除') +' and                                '
      +' RecordState<>'+Quotedstr('作废')+' )                                   '
//汇总采购ok
      +' ) as aa group by aa.ClientID  Order by aa.ClientID'  ;
  ADOQuery2.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select ClientID,Amount from #ReduceAmount order by ClientID';
  ADOQuery.open;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    ReduceAmount := ADOQuery.fieldbyname('Amount').AsFloat;
    ADOQuery2.Close;
    ADOQuery2.SQL.Text :='select ID,Date,Amount from #FNAccountAge'
       +' where ClientID='+ADOQuery.fieldbyname('ClientID').AsString
       +' Order by Date,ID';
    ADOQuery2.Open;
    ADOQuery2.First;

    while not ADOQuery2.Eof  do
    begin
       if  ReduceAmount> ADOQuery2.FieldByName('Amount').AsFloat then
       begin
         ReduceAmount :=ReduceAmount-ADOQuery2.FieldByName('Amount').AsFloat;
         ADOQuery2.Edit;
         ADOQuery2.FieldByName('Amount').AsFloat :=0    ;
         ADOQuery2.post;
       end else
       begin
         ADOQuery2.Edit;
         ADOQuery2.FieldByName('Amount').AsFloat :=ADOQuery2.FieldByName('Amount').AsFloat-ReduceAmount;
         ADOQuery2.post;
         ReduceAmount :=0;
       end;
       ADOQuery2.Next;
       if ReduceAmount=0 then Break;
    end;

    if ReduceAmount<>0 then
    begin
      if  not ADOQuery2.IsEmpty  then
      begin
        ADOQuery2.Prior;
        ADOQuery2.Edit;
        ADOQuery2.FieldByName('Amount').AsFloat :=ADOQuery2.FieldByName('Amount').AsFloat-ReduceAmount;
        ADOQuery2.Post;
      end;
    end;
    ADOQuery.Next;
  end;
  BitBtn1Click(sender);
end;

procedure TFNAccountAgeSLForm.BitBtn2Click(Sender: TObject);
var PeriodDays:Integer;
    DateStr :STRING;
begin
  DateStr :=DateTOSTR(DateTimePicker1.Date);
  PeriodDays :=StrToInt(ComboBox1.text);
  if  PeriodDays <=0 then  PeriodDays :=1;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#FNAccountAgeRP')
        +' )) DROP TABLE #FNAccountAgeRP ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #FNAccountAgeRP  ('
    +' [ClientID] [int] NULL ,[EmployeeID] [int] NULL, '
    +' [PeriodA] [float] NULL,   '
    +' [PeriodB] [float] NULL,   '
    +' [PeriodC] [float] NULL,   '
    +' [PeriodD] [float] NULL,   '
    +' [PeriodE] [float] NULL,   '
    +' [PeriodF] [float] NULL,   '
    +' [PeriodG] [float] NULL,   '
    +' [PeriodTTL] [float] NULL ) ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #FNAccountAgeRP';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' INSERT INTO #FNAccountAgeRP ('
    +' [ClientID],[EmployeeID],[PeriodA] , '
    +' [PeriodB] ,[PeriodC] ,[PeriodD],  '
    +' [PeriodE], [PeriodF] ,[PeriodG] , '
    +' [PeriodTTL] )'
    +' SELECT ClientID,EmployeeID,          '
    +' PeriodA ,PeriodB,PeriodC,PeriodD,    '
    +' PeriodE ,PeriodF,PeriodG,PeriodTTL FROM  '
    +' (SELECT ClientID,EmployeeID,                          '
    +' ISNULL(AMOUNT,0) PeriodA ,0 PeriodB,0 PeriodC,0 PeriodD,    '
    +' 0 PeriodE ,0 PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL   '
    +' FROM #FNAccountAge WHERE DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) <='+Inttostr(PeriodDays)
    +' UNION ALL                                                   '
    +' SELECT ClientID,EmployeeID,                                 '
    +' 0 PeriodA ,ISNULL(AMOUNT,0) PeriodB,0 PeriodC,0 PeriodD,    '
    +' 0 PeriodE ,0 PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL   '
    +' FROM #FNAccountAge WHERE DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) >'+Inttostr(PeriodDays) +' and '
    +' DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) <='+Inttostr(PeriodDays*2)
    +' UNION ALL                                                   '
    +' SELECT ClientID,EmployeeID,                                 '
    +' 0 PeriodA ,0 PeriodB,ISNULL(AMOUNT,0) PeriodC,0 PeriodD,    '
    +' 0 PeriodE ,0 PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL   '
    +' FROM #FNAccountAge WHERE DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) >'+Inttostr(PeriodDays*2) +' and '
    +' DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) <='+Inttostr(PeriodDays*3)
    +' UNION ALL                                                   '
    +' SELECT ClientID,EmployeeID,                                 '
    +' 0 PeriodA ,0 PeriodB,0 PeriodC,ISNULL(AMOUNT,0) PeriodD,    '
    +' 0 PeriodE ,0 PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL   '
    +' FROM #FNAccountAge WHERE DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) >'+Inttostr(PeriodDays*3) +' and '
    +' DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) <='+Inttostr(PeriodDays*4)
    +' UNION ALL                                                   '
    +' SELECT ClientID,EmployeeID,                                 '
    +' 0 PeriodA ,0 PeriodB,0 PeriodC,0 PeriodD,                   '
    +' ISNULL(AMOUNT,0) PeriodE ,0 PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL '
    +' FROM #FNAccountAge WHERE DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) >'+Inttostr(PeriodDays*4) +' and '
    +' DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) <='+Inttostr(PeriodDays*5)
    +' UNION ALL                                                                '
    +' SELECT ClientID,EmployeeID,                                              '
    +' 0 PeriodA ,0 PeriodB,0 PeriodC,0 PeriodD,                                '
    +' 0 PeriodE ,ISNULL(AMOUNT,0) PeriodF,0 PeriodG,ISNULL(AMOUNT,0) PeriodTTL '
    +' FROM #FNAccountAge WHERE DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) >'+Inttostr(PeriodDays*5) +' and '
    +' DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) <='+Inttostr(PeriodDays*6)
    +' UNION ALL                                                                '
    +' SELECT ClientID,EmployeeID,                                              '
    +' 0 PeriodA ,0 PeriodB,0 PeriodC,0 PeriodD,                                '
    +' 0 PeriodE ,0 PeriodF,ISNULL(AMOUNT,0) PeriodG,ISNULL(AMOUNT,0) PeriodTTL '
    +' FROM #FNAccountAge WHERE DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) >'+Inttostr(PeriodDays*6) +' and '
    +' DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) <='+Inttostr(PeriodDays*7)
    +' UNION ALL                                                                '
    +' SELECT ClientID,EmployeeID,                                              '
    +' 0 PeriodA ,0 PeriodB,0 PeriodC,0 PeriodD,                                '
    +' 0 PeriodE ,0 PeriodF,ISNULL(AMOUNT,0) PeriodG,ISNULL(AMOUNT,0) PeriodTTL '
    +' FROM #FNAccountAge WHERE DATEDIFF(DAY, cleardate,'
    +Quotedstr(DateStr)+' ) >'+Inttostr(PeriodDays*7)
    +' ) AS A ' ;
  ADOQuery.ExecSQL;
  adsMaster.Close;
//  adsMaster.CommandText :=' select ClientID,b.name Client,c.name Employee,'
  adsMaster.CommandText :=' select '
    +' a.ClientID [客户序号],b.name [客户名称],'
    +' SUM(ISNULL(PeriodA,0)) ['+'第'+Inttostr(PeriodDays*0+1)+'天'+'至'+Inttostr(PeriodDays)+'天], '
    +' SUM(ISNULL(PeriodB,0)) ['+'第'+Inttostr(PeriodDays+1)+'天'+'至'+Inttostr(PeriodDays*2)+'天], '
    +' SUM(ISNULL(PeriodC,0)) ['+'第'+Inttostr(PeriodDays*2+1)+'天'+'至'+Inttostr(PeriodDays*3)+'天], '
    +' SUM(ISNULL(PeriodD,0)) ['+'第'+Inttostr(PeriodDays*3+1)+'天'+'至'+Inttostr(PeriodDays*4)+'天], '
    +' SUM(ISNULL(PeriodE,0)) ['+'第'+Inttostr(PeriodDays*4+1)+'天'+'至'+Inttostr(PeriodDays*5)+'天], '
    +' SUM(ISNULL(PeriodF,0)) ['+'第'+Inttostr(PeriodDays*5+1)+'天'+'至'+Inttostr(PeriodDays*6)+'天], '
    +' SUM(ISNULL(PeriodG,0)) ['+'长于'+Inttostr(PeriodDays*6)+'天], '
    +' SUM(ISNULL(PeriodTTL,0)) [合计] '
    +' from #FNAccountAgeRp AS A   '
    +' LEFT OUTER JOIN DAClient as b  on a.ClientID=b.id '
    +' LEFT OUTER JOIN MSEmployee as c  on a.EmployeeID=c.id'
    +' GROUP BY a.ClientID,b.name ';
//    +' GROUP BY a.ClientID,b.name, c.name';
  adsMaster.Open;
  UpdateDBGrid;
end;

procedure TFNAccountAgeSLForm.N1Click(Sender: TObject);
var E:string;
begin
  if adsMaster.IsEmpty then exit;
   E:='1';
   FNReceiptPayLegerForm.ShowForm(adsMaster.FieldByName('客户名称').AsString,
       '应收应付明细帐--', adsMaster.FieldByName('客户序号').AsString,
       datetostr(DateTimePicker1.Date) ,E);
end;

procedure TFNAccountAgeSLForm.DBGridDblClick(Sender: TObject);
begin
// inherited;
end;

procedure TFNAccountAgeSLForm.adsMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  adsMaster.IndexFieldNames := '';
end;

procedure TFNAccountAgeSLForm.adsMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefreshAvailableFields;
end;

end.
