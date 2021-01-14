unit SLSaleForeCast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, GEdit,
  DBCtrls, Menus, WNADOCQuery;

type
  TSLSaleForeCastForm = class(TWSVoucherBrowseForm)
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
    ADOQuery: TADOQuery;
    ADOQuery2: TADOQuery;
    GroupBox1: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Panel3: TPanel;
    Panel5: TPanel;
    Button2: TButton;
    GroupBox2: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    TempAds: TADODataSet;
    StringField1: TStringField;
    StringField2: TStringField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    BCDField5: TBCDField;
    BCDField6: TBCDField;
    BCDField7: TBCDField;
    BCDField8: TBCDField;
    IntegerField1: TIntegerField;
    WNADOCQuery1: TWNADOCQuery;
    CheckBox3: TCheckBox;
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ComboBox1: TComboBox;
    Label2: TLabel;
    Panel4: TPanel;
    Button1: TButton;
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
    procedure Button2Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  SLSaleForeCastForm: TSLSaleForeCastForm;

implementation

uses CommonDM,FNReceiptPayLeger,QLDBFlt;

{$R *.dfm}

function TSLSaleForeCastForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TSLSaleForeCastForm.BitBtn1Click(Sender: TObject);
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
  adsMaster.CommandText :=' select a.ClientID,b.name Client,c.name Employee,'
    +' SUM(ISNULL(PeriodA,0)) PeriodA ,    '
    +' SUM(ISNULL(PeriodB,0)) PeriodB ,    '
    +' SUM(ISNULL(PeriodC,0)) PeriodC ,    '
    +' SUM(ISNULL(PeriodD,0)) PeriodD ,    '
    +' SUM(ISNULL(PeriodE,0)) PeriodE ,    '
    +' SUM(ISNULL(PeriodF,0)) PeriodF ,    '
    +' SUM(ISNULL(PeriodG,0)) PeriodG ,    '
    +' SUM(ISNULL(PeriodTTL,0)) PeriodTTL   '
    +' from #FNAccountAgeRp AS A   '
    +' LEFT OUTER JOIN DAClient as b  on a.ClientID=b.id '
    +' LEFT OUTER JOIN MSEmployee as c  on a.EmployeeID=c.id'
    +' GROUP BY a.ClientID,b.name, c.name';
  adsMaster.Open;
  UpdateDBGrid;
  DBGrid.Columns[1].Title.Caption :='第一个月';
  DBGrid.Columns[2].Title.Caption :='第二个月';
  DBGrid.Columns[3].Title.Caption :='第三个月';
  DBGrid.Columns[4].Title.Caption :='第四个月';
  DBGrid.Columns[5].Title.Caption :='第五个月';
  DBGrid.Columns[6].Title.Caption :='第六个月';
  DBGrid.Columns[7].Title.Caption :='长于六个月';
end;

procedure TSLSaleForeCastForm.FormCreate(Sender: TObject);
begin
  inherited;
  DateTimePicker1.DateTime :=date;
//  DateTimePicker1.Date :=EndoftheMonth(date);
//  DateTimePicker2.Date :=EndoftheMonth(date);
end;

procedure TSLSaleForeCastForm.UpdateDBGrid;
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
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      begin
        Columns[I].Footer.ValueType := fvtSum;
      end
      else Columns[I].Footer.ValueType := fvtNon;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TSLSaleForeCastForm.FormShow(Sender: TObject);
begin
  inherited;
//  BitBtn1Click(sender);
 DateTimePicker1.DateTime :=date();

end;

procedure TSLSaleForeCastForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
   UpdateDBGrid;
end;

procedure TSLSaleForeCastForm.Label2Click(Sender: TObject);
begin
  inherited;
//  ComboBox1.SetFocus;
end;

procedure TSLSaleForeCastForm.FormActivate(Sender: TObject);
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#SLSaleDM')
        +' )) DROP TABLE #SLSaleDM ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #SLSaleDM  ('
    +' [id] [int] IDENTITY (1, 1) NOT NULL ,'
    +' [Date] [datetime] NULL ,[Code] [varchar] (20)  ,          '
    +' [ClientID] [int] NULL , [EmployeeID] [int] NULL ,         '
    +' [BillMode] [varchar] (16)  ,[ModeDC] [int] NULL ,         '
    +' [ModeC] [int] NULL ,[Brief] [varchar] (30)  ,             '
    +' [GoodsID] [int] NULL ,[GoodsSpec] [varchar] (30)  ,       '
    +' [Quantity] [float] NULL ,[QuantityPcs] [float] NULL ,     '
    +' [PackUnitID] [int] NULL ,[PriceBase] [money] NULL ,       '
    +' [Amount] [float] NULL ,[GoalUnitID] [int] NULL ,          '
    +' [GoalQuantity] [float] NULL ,[Client] [varchar] (50)  NULL ,'
    +' [Employee] [varchar] (30)  NULL ,[Goods] [varchar] (30)  NULL , '
    +' [GoodsClass] [varchar] (30)  NULL ,[DAArea] [varchar] (30)  NULL , '
    +' [Unit] [varchar] (20)  NULL )' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #SLSaleDM';
  ADOQuery.ExecSQL;
  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' INSERT INTO #SLSaleDM ('
    +' Date,Code,ClientID,EmployeeID,                         '
    +' BillMode,ModeDC,ModeC,Brief,                             '
    +' GoodsID,GoodsSpec, Quantity,QuantityPcs,PackUnitID,      '
    +' PriceBase,Amount,GoalUnitID,GoalQuantity,'
    +' [Client],[Employee],[Goods],[GoodsClass],[DAArea],  '
    +' [Unit] )'
    +' select  b.Date,b.Code,b.ClientID,b.EmployeeID,           '
    +' b.BillMode,b.ModeDC,b.ModeC,b.Brief,                     '
    +' a.GoodsID,a.GoodsSpec, a.Quantity,a.QuantityPcs,a.PackUnitID, '
    +' a.PriceBase,a.Amount,a.GoalUnitID,a.GoalQuantity ,  '
    +' c.name Client,d.Name Employee,e.Name Goods,f.Name GoodsClass, '
    +' g.Name DAArea,h.name Unit '
    +' from SLSaleDetail  AS a                                       '
    +' LEFT OUTER JOIN SLSalemaster as b  on a.MasterID=b.id         '
    +' LEFT OUTER JOIN DAClient     as c  on b.ClientID=c.id         '
    +' LEFT OUTER JOIN MSEmployee   as d  on b.EmployeeID=d.id       '
    +' LEFT OUTER JOIN DAGoods      as e  on a.GoodsID=e.id          '
    +' LEFT OUTER JOIN DAGoodsClass as f  on e.GoodsClassID=f.id     '
    +' LEFT OUTER JOIN DAarea       as g  on c.AreaID=g.id           '
    +' LEFT OUTER JOIN MSUnit       as h  on a.GoalUnitID=h.id       '
    +' where b.Recordstate<>'+Quotedstr('删除');
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' if exists (select * from dbo.sysobjects where '
      +' id = object_id '
      +' (' +Quotedstr('[dbo].[TempSaleMD]')+') and OBJECTPROPERTY(id,'
      +Quotedstr('IsUserTable')+' ) = 1) drop table [dbo].[TempSaleMD] ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE TempSaleMD  ('
    +' [id] [int] IDENTITY (1, 1) NOT NULL ,'
    +' [Date] [datetime] NULL ,[Code] [varchar] (20)  ,          '
    +' [ClientID] [int] NULL , [EmployeeID] [int] NULL ,         '
    +' [BillMode] [varchar] (16)  ,[ModeDC] [int] NULL ,         '
    +' [ModeC] [int] NULL ,[Brief] [varchar] (30)  ,             '
    +' [GoodsID] [int] NULL ,[GoodsSpec] [varchar] (30)  ,       '
    +' [Quantity] [float] NULL ,[QuantityPcs] [float] NULL ,     '
    +' [PackUnitID] [int] NULL ,[PriceBase] [money] NULL ,       '
    +' [Amount] [float] NULL ,[GoalUnitID] [int] NULL ,          '
    +' [GoalQuantity] [float] NULL ,[Client] [varchar] (50)  NULL ,'
    +' [Employee] [varchar] (30)  NULL ,[Goods] [varchar] (30)  NULL , '
    +' [GoodsClass] [varchar] (30)  NULL ,[DAArea] [varchar] (30)  NULL , '
    +' [Unit] [varchar] (20)  NULL )' ;
//  Memo1.Text :=  ADOQuery.SQL.Text;
  ADOQuery.ExecSQL;
 adsMaster.Close;
 adsMaster.CommandText:=' select * from #SLSaleDM';
 adsMaster.open;
  UpdateDBGrid
end;

procedure TSLSaleForeCastForm.BitBtn2Click(Sender: TObject);
var PeriodDays:Integer;
    DateStr :STRING;
begin
  DateStr :=DateTOSTR(DateTimePicker1.Date);

end;

procedure TSLSaleForeCastForm.N1Click(Sender: TObject);
var E:string;
begin
  if adsMaster.IsEmpty then exit;
end;

procedure TSLSaleForeCastForm.DBGridDblClick(Sender: TObject);
begin
// inherited;
end;


procedure TSLSaleForeCastForm.Button2Click(Sender: TObject);
begin
  inherited;
  WNADOCQuery1.TabName :='TempSaleMD';
  WNADOCQuery1.ConnectionString :=CommonData.acnConnection.ConnectionString;
  WNADOCQuery1.Execute(False);
  showmessage(WNADOCQuery1.QueryTerm);
end;

procedure TSLSaleForeCastForm.RadioButton2Click(Sender: TObject);
begin
  inherited;
  if RadioButton2.Checked then ComboBox1.Enabled :=true
    else ComboBox1.Enabled :=False;
end;

procedure TSLSaleForeCastForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if not CheckBox1.Checked and
       not CheckBox3.Checked and not CheckBox2.Checked  then
       CheckBox1.Checked:=not CheckBox1.Checked;
end;

procedure TSLSaleForeCastForm.CheckBox4Click(Sender: TObject);
begin
  inherited;
    if not CheckBox4.Checked and
       not CheckBox5.Checked and not CheckBox6.Checked  then
       CheckBox4.Checked:=not CheckBox4.Checked;
end;

end.
