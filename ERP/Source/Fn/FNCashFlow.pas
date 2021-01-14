unit FNCashFlow;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TFNCashFlowForm = class(TWSVoucherBrowseForm)
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    adsStockChange: TADODataSet;
    Panel2: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    ADOQuery: TADOQuery;
    Label3: TLabel;
    adsStockChangeDSDesigner: TStringField;
    adsStockChangeDSDesigner2: TStringField;
    adsStockChangeDSDesigner3: TBCDField;
    adsStockChangeDSDesigner4: TBCDField;
    adsStockChangeDSDesigner5: TBCDField;
    adsStockChangeDSDesigner6: TBCDField;
    ToolButton1: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure UpdateDBGrid;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FNCashFlowForm: TFNCashFlowForm;

implementation

uses CommonDM ;

{$R *.dfm}

function TFNCashFlowForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TFNCashFlowForm.BitBtn1Click(Sender: TObject);
var year,month,day,year1,month1,day1 :word;
    Datestr1,Datestr2 :string;
begin
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DateStr1 :=Datetostr(DateTimePicker1.Date);
  DateStr2 :=Datetostr(DateTimePicker2.Date);

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #TEMPSTOCK' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' INSERT INTO  #TEMPSTOCK ('
      +' [Date],[Code],[BillMode],[Brief],'
      +' [ReceiptPayee],[AccountsID],[FAmount] ) '
      +' select Date,Code,BillMode,Brief,B.ReceiptPayee,'
      +' AccountsID,AmountD-AmountC as FAmount  from ( '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
      +' AccountsID,AmountD,AmountC                                               '
      +' from FNClearPCMaster a left outer join  DaClient b on b.id=a.ClientID    '
      +' UNION ALL                                                                    '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
      +' AccountsID,AmountD,AmountC                                               '
      +' from FNClearSLMaster a left outer join  DaClient b on b.id=a.ClientID    '
      +' UNION ALL                                                                    '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
      +' AccountsID,AmountD,AmountC                                               '
      +' from FNCashInMaster a left outer join  MsEmployee b on b.id=a.ClientID   '
      +' UNION ALL                                                                    '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
      +' AccountsID,AmountD,AmountC                                               '
      +' from FNCashoutMaster a left outer join  MsEmployee b on b.id=a.ClientID  '
      +' UNION ALL                                                                    '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
      +' ClientID,0.00, AmountD                                                   '
      +' from FNCashOutInMaster a left outer join  FNAccounts b on b.id=a.AccountsID '
      +' UNION ALL                                                                       '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,   '
      +' AccountsID,AmountD,0.00                                                     '
      +' from FNCashOutInMaster a left outer join  FNAccounts b on b.id=a.ClientID   '
      +' UNION ALL                                                                       '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,   '
      +' AccountsID,0.00,AmountC                                                     '
      +' from FNExpenseMaster a left outer join  MsEmployee b on b.id=a.ClientID     '
      +' ) AS b WHERE b.RecordState<>'+Quotedstr('删除') +' and '
      +'  b.DATE<='+Quotedstr(DateStr1);
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' INSERT INTO  #TEMPSTOCK ('
      +' [Date],[Code],[BillMode],[Brief],'
      +' [ReceiptPayee],[AccountsID],[AmountD],[AmountC] ) '
      +' select Date,Code,BillMode,Brief,ReceiptPayee,'
      +' AccountsID,AmountD,AmountC  from ( '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
      +' AccountsID,AmountD,AmountC                                               '
      +' from FNClearPCMaster a left outer join  DaClient b on b.id=a.ClientID    '
      +' UNION ALL                                                                    '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
      +' AccountsID,AmountD,AmountC                                               '
      +' from FNClearSLMaster a left outer join  DaClient b on b.id=a.ClientID    '
      +' UNION ALL                                                                    '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
      +' AccountsID,AmountD,AmountC                                               '
      +' from FNCashInMaster a left outer join  MsEmployee b on b.id=a.ClientID   '
      +' UNION ALL                                                                    '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
      +' AccountsID,AmountD,AmountC                                               '
      +' from FNCashoutMaster a left outer join  MsEmployee b on b.id=a.ClientID  '
      +' UNION ALL                                                                    '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
      +' ClientID,0.00, AmountD                                                   '
      +' from FNCashOutInMaster a left outer join  FNAccounts b on b.id=a.AccountsID '
      +' UNION ALL                                                                       '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,   '
      +' AccountsID,AmountD,0.00                                                     '
      +' from FNCashOutInMaster a left outer join  FNAccounts b on b.id=a.ClientID   '
      +' UNION ALL                                                                       '
      +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,   '
      +' AccountsID,0.00,AmountC                                                     '
      +' from FNExpenseMaster a left outer join  MsEmployee b on b.id=a.ClientID     '
      +' ) AS b WHERE b.RecordState<>'+Quotedstr('删除') +' and '
      +' b.DATE>'+Quotedstr(DateStr1)
      +' and b.DATE<='+Quotedstr(DateStr2);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #TEMPSTOCKE' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' INSERT INTO  #TEMPSTOCKE ('
        +' BillMode , AccountsID, FAmount, '
        +' AmountD  ,  AmountC , EAmount ) '
        +' SELECT a.BillMode,a.AccountsID,SUM(ISNULL(a.FAmount,0)),'
        +' Sum(Isnull(a.AmountD,0)),Sum(Isnull(a.AmountC,0)) ,'
        +' SUM(ISNULL(a.FAmount,0))+Sum(Isnull(a.AmountD,0))- '
        +' Sum(Isnull(a.AmountC,0)) as EAmount '
        +' FROM #TEMPSTOCK a left outer join FNAccounts b on b.id=a.AccountsID'
        +'  where b.AccountType not like '+Quotedstr('%业主资金%')
        +' Group by BillMode,AccountsID' ;
   ADOQuery.ExecSQL;

   adsStockChange.Close;
   adsStockChange.CommandText :=' select '
        +' b.name [帐户名称], BillMode as [业务类型],'
        +' FAmount as [期初余额], '
        +' AmountD as [本期收入], AmountC as [本期支出],'
        +' EAmount as [期末余额]'
        +' from #TEMPSTOCKE a  '
        +' left outer join FnAccounts b on b.id=a.AccountsId' ;
   adsStockChange.Open;
   UpdateDBGrid;
end;

procedure TFNCashFlowForm.FormCreate(Sender: TObject);
var year,month,day :word;
begin
  inherited;
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DateTimePicker1.Date :=EnCodeDate(year,month,1);
  DateTimePicker2.Date :=Date;
end;

procedure TFNCashFlowForm.FormActivate(Sender: TObject);
begin
//  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempStock')
        +' )) DROP TABLE #TempStock ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempStockE')
        +' )) DROP TABLE #TempStockE ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #TempStock ('
        +' [ID] [int] IDENTITY (1, 1) NOT NULL ,'
        +' [RecordState] [varchar] (12) ,       '
        +' [Date] [datetime] NULL ,             '
        +' [Code] [varchar] (20) ,              '
        +' [BillMode] [varchar] (16) ,          '
        +' [ReceiptPayee] [varchar] (60) ,      '
        +' [Brief] [varchar] (30) ,             '
        +' [ClientID] [int] NULL ,              '
        +' [EmployeeID] [int] NULL ,            '
        +' [ClearDate] [datetime] NULL ,        '
        +' [AccountsID] [int] NULL ,            '
        +' [FAmount] [money] NULL ,             '
        +' [AmountD] [money] NULL ,             '
        +' [AmountC] [money] NULL ,             '
        +' [EAmount] [money] NULL)               ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #TempStockE ('
        +' [ID] [int] IDENTITY (1, 1) NOT NULL ,'
        +' [RecordState] [varchar] (12) ,       '
        +' [Date] [datetime] NULL ,             '
        +' [Code] [varchar] (20) ,              '
        +' [BillMode] [varchar] (16) ,          '
        +' [ReceiptPayee] [varchar] (60) ,      '
        +' [Brief] [varchar] (30) ,             '
        +' [ClientID] [int] NULL ,              '
        +' [EmployeeID] [int] NULL ,            '
        +' [ClearDate] [datetime] NULL ,        '
        +' [AccountsID] [int] NULL ,            '
        +' [FAmount] [money] NULL ,             '
        +' [AmountD] [money] NULL ,             '
        +' [AmountC] [money] NULL ,             '
        +' [EAmount] [money] NULL)              ';
  ADOQuery.ExecSQL;
  BitBtn1Click(Sender);
end;

procedure TFNCashFlowForm.FormDeactivate(Sender: TObject);
begin
//  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempStock')
        +' )) DROP TABLE #TempStock ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempStockE')
        +' )) DROP TABLE #TempStockE ' ;
  ADOQuery.ExecSQL;
end;

procedure TFNCashFlowForm.DBGridCellClick(Column: TColumn);
begin
  UpdateDBGrid;
end;

procedure TFNCashFlowForm.DBGridDblClick(Sender: TObject);
begin
//  inherited;
  UpdateDBGrid;
end;

procedure TFNCashFlowForm.UpdateDBGrid;
var  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    Columns[0].Width :=130;
    for I := 1 to Columns.Count - 1 do
    begin
      Columns[i].Width :=90;
      if Pos('日',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Pos('编',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      if Pos('Price',Columns[I].FieldName)<=0 then
        Columns[I].Footer.ValueType := fvtSum;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TFNCashFlowForm.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker1.Date>DateTimePicker2.Date then
      DateTimePicker2.Date :=DateTimePicker1.Date;
end;

procedure TFNCashFlowForm.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker2.Date<DateTimePicker1.Date then
      DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TFNCashFlowForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

end.
