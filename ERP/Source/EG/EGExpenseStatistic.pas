unit EGExpenseStatistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, GEdit,
  DBCtrls, Menus, WNADOCQuery,TypInfo, scExcelExport;

type
  TEGExpenseStatisticForm = class(TWSVoucherBrowseForm)
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
    Panel3: TPanel;
    Panel5: TPanel;
    Button3: TButton;
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
    Button1: TButton;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Button2: TButton;
    Panel6: TPanel;
    CheckBox4: TCheckBox;
    ToolButton1: TToolButton;
    procedure UpdateDBGrid;
    procedure DBGridTitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure adsMasterBeforeOpen(DataSet: TDataSet);
    procedure ExportActionExecute(Sender: TObject);

  private
    { Private declarations }
    WhereStr :string;
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  EGExpenseStatisticForm: TEGExpenseStatisticForm;

implementation

uses CommonDM,QLDBFlt;

{$R *.dfm}

function TEGExpenseStatisticForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TEGExpenseStatisticForm.UpdateDBGrid;
var I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    Columns[0].Width :=90;
    if Pos('日',Columns[0].FieldName)>0 then Columns[0].Width :=70;
    for I := 1 to Columns.Count - 1 do
    begin
      Columns[i].Title.Alignment:= taCenter;
      Columns[i].Width :=90;
      if Pos('日',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Pos('编',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Columns[I].Field is TNumericField then
      begin
        SetStrProp(Fields[I], 'DisplayFormat','#,#.00') ;
        if Pos('单',Columns[I].FieldName)<=0 then Columns[I].Footer.ValueType := fvtSum;
      end;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TEGExpenseStatisticForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

procedure TEGExpenseStatisticForm.FormActivate(Sender: TObject);
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#EGExpenseDM')
        +' )) DROP TABLE #EGExpenseDM ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #EGExpenseDM  ('
    +' [id] [int] IDENTITY (1, 1) NOT NULL ,'
	  +' [BillCode] [varchar] (20)  NULL ,             '
    +' [Amount] [Float] NULL ,                      '
	  +' [AmountB] [Float] NULL ,                      '
	  +' [Expense] [varchar] (60)  NULL ,              '
	  +' [Goods] [varchar] (60)  NULL ,                '
	  +' [Project] [varchar] (60)  NULL ,              '
	  +' [Memo] [varchar] (30)  NULL ,                 '
	  +' [Date] [datetime] NULL ,                      '
	  +' [Code] [varchar] (20)  NULL ,                 '
	  +' [BillMode] [varchar] (16)  NULL ,             '
	  +' [Brief] [varchar] (30)  NULL ,                '
	  +' [Payee] [varchar] (30)  NULL ,                '
	  +' [Employee] [varchar] (30)  NULL ,             '
	  +' [Accounts] [varchar] (40)  NULL ) '    ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #EGExpenseDM';
  ADOQuery.ExecSQL;
  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' INSERT INTO #EGExpenseDM ('
    +' Date, Code, BillMode, Brief,               '
    +' Payee , Employee,Accounts,                 '
    +' BillCode,Amount,                           '
    +' AmountB,Expense ,Goods,Project,Memo      ) '
    +' select                                     '
    +' b.Date, b.Code, b.BillMode, Brief,         '
    +' f.name as Payee , g.name as Employee,      '
    +' h.name as Accounts,                        '
    +' a.BillCode,a.Amount*Isnull(ModeDC,1)*Isnull(ModeC,1) Amount,   '
    +' a.AmountB*Isnull(ModeDC,1)*Isnull(ModeC,1) AmountB,            '
    +' c.name as Expense , d.name as Goods,e.name as Project, '
    +' a.Memo                                                 '
    +' from FNExpenseDetail a                                 '
    +' left outer join FNExpenseMaster b  on a.masterID=b.ID  '
    +' left outer join DAExpenseClass c    on a.ExpenseID=c.ID'
    +' left outer join DAGoods d      on a.GoodsID=d.ID       '
    +' left outer join DAProject  e   on a.ProjectID=e.ID     '
    +' left outer join MSEmployee f    on b.ClientID=f.ID     '
    +' left outer join MSEmployee g    on b.EmployeeID=g.ID   '
    +' left outer join FNAccounts h    on b.AccountsID=h.ID   '
    +' where b.recordstate<>'+Quotedstr('删除')
    +' and a.ProjectID<>0 and a.ProjectID is not null         '
    +' and a.Amount<>0 and Amount is not null                 ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' if exists (select * from dbo.sysobjects where '
      +' id = object_id '
      +' (' +Quotedstr('[dbo].[TempExpenseMD]')+') and OBJECTPROPERTY(id,'
      +Quotedstr('IsUserTable')+' ) = 1) drop table [dbo].[TempExpenseMD] ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE TempExpenseMD  ('
    +' [id] [int] IDENTITY (1, 1) NOT NULL ,'
	  +' [BillCode] [varchar] (20)  NULL ,             '
    +' [Amount] [Float] NULL ,'
	  +' [AmountB] [Float] NULL ,                      '
	  +' [Expense] [varchar] (60)  NULL ,              '
	  +' [Goods] [varchar] (60)  NULL ,                '
	  +' [Project] [varchar] (60)  NULL ,              '
	  +' [Memo] [varchar] (30)  NULL ,                 '
	  +' [Date] [datetime] NULL ,                      '
	  +' [Code] [varchar] (20)  NULL ,                 '
	  +' [BillMode] [varchar] (16)  NULL ,             '
	  +' [Brief] [varchar] (30)  NULL ,                '
	  +' [Payee] [varchar] (30)  NULL ,                '
	  +' [Employee] [varchar] (30)  NULL ,             '
	  +' [Accounts] [varchar] (40)  NULL ) '    ;
  ADOQuery.ExecSQL;

  {ADOQuery.Close;
  ADOQuery.SQL.Text :='select max(date) MDate  from EGExpenseMaster '
        +' WHERE RecordState<>'+Quotedstr('删除');
  ADOQuery.Open;
  if ADOQuery.FieldByName('MDate').IsNull then WhereStr :=Datetostr(date)
    else WhereStr :=Trim(ADOQuery.fieldbyname('MDate').AsString);
  Memo1.ReadOnly :=False;
  Memo1.Clear;
  Memo1.Text :=' 日期 等于'+ Quotedstr(WhereStr);
  Memo1.ReadOnly :=True;
  WhereStr :=' where date='+Quotedstr(WhereStr);  }
  WhereStr :=' where 1=1 ';
  Button1Click(sender);
  UpdateDBGrid;
  Button1.SetFocus;
end;

procedure TEGExpenseStatisticForm.N1Click(Sender: TObject);
var E:string;
begin
  if adsMaster.IsEmpty then exit;
end;

procedure TEGExpenseStatisticForm.DBGridDblClick(Sender: TObject);
begin
// inherited;
end;


procedure TEGExpenseStatisticForm.Button3Click(Sender: TObject);
begin
  inherited;
  WNADOCQuery1.TabName :='TempExpenseMD';
  WNADOCQuery1.ConnectionString :=CommonData.acnConnection.ConnectionString;
  WNADOCQuery1.Execute(False);
//  showmessage(WNADOCQuery1.QueryTerm);
  if  trim(WNADOCQuery1.QueryTerm)<>'' then
    WhereStr :=' where ' +  trim(WNADOCQuery1.QueryTerm)
      else WhereStr :=' Where 1=1 ' ;
  Memo1.ReadOnly :=False;
  Memo1.Clear;
  if ( copy(trim(WNADOCQuery1.QueryTerm),1,3) ='not' ) or
    ( copy(trim(WNADOCQuery1.QueryTerm),1,3) ='NOT' )then
     Memo1.Text :='全部不满足条件: ' +Copy(trim(WNADOCQuery1.ShowTerm.Text),5,800)
     else Memo1.Text :=Copy(trim(WNADOCQuery1.ShowTerm.Text),5,800);
  if WhereStr =' Where 1=1 ' then
    begin
      Memo1.Clear;
      Memo1.Text :='不限制条件!';
    end;
  Memo1.ReadOnly :=True;
  if Button1.Tag=1 then Button1Click(sender)
    else Button2Click(sender);
end;

procedure TEGExpenseStatisticForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if not CheckBox1.Checked and
     not CheckBox3.Checked and not CheckBox2.Checked
     and not CheckBox4.Checked 
     then    CheckBox1.Checked:=not CheckBox1.Checked;
end;

procedure TEGExpenseStatisticForm.Button1Click(Sender: TObject);
var I :integer;
begin
  inherited;
  Button1.Tag :=1;
  Panel6.Visible :=True;
  Panel6.Repaint;
  adsMaster.Close;
  adsMaster.CommandText:=' select [Date] [日期],	[Code] [编号], '
    +' [BillMode] [业务类别],	[Brief] [摘要],                   '
    +' [Project] [项目名称],'
    +' [Expense] [费用名称],[Amount] [报销金额],                 '
    +' [Accounts] [付出帐户],[BillCode] [票据号码],              '
    +' [AmountB] [票面金额], [Payee] [业务员],                   '
//    +' [Goods] [商品名称],'
    +' [Employee] [经手人],'
    +' [Memo] [备注] from #EGExpenseDM'
    +WhereStr ;
  adsMaster.open;

  with adsMaster do
  begin
    for I :=0 to FieldList.Count -1 do
    begin
      if Fields[i].DataType = TFieldType(ftFloat) then
        begin
          SetStrProp(Fields[I], 'DisplayFormat','#,#.00') ;
          Fields[i].DisplayWidth :=20;
        end;
      if (Fields[i].DisplayLabel ='id')  then  Fields[i].Visible :=False;
    end;
  end;
  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='';
end;

procedure TEGExpenseStatisticForm.Button2Click(Sender: TObject);
var I :integer;
    SelectStr,GroupStr:String;
begin
  inherited;
  Panel6.Visible :=True;
  Panel6.Repaint;
  Button1.Tag :=0;
  GroupStr :='';
  SelectStr :='';
  if CheckBox1.Checked then
  begin
    SelectStr :=SelectStr+' Project [项目名称] ,';
    GroupStr :=GroupStr+' Project , ';
  end;
  if CheckBox2.Checked then
  begin
    SelectStr :=SelectStr+' Expense [费用名称] ,' ;
    GroupStr :=GroupStr+' Expense , '             ;
  end;
  if CheckBox3.Checked then
  begin
    SelectStr :=SelectStr+' Payee [业务经办],' ;
    GroupStr :=GroupStr+' Payee , '            ;
  end;
  if CheckBox4.Checked then
  begin
    SelectStr :=SelectStr+' Date [日期],' ;
    GroupStr :=GroupStr+' Date , '            ;
  end;
  GroupStr :=Copy(Trim(GroupStr),1,Length(Trim(GroupStr))-1)      ;

  adsMaster.Close;
  adsMaster.CommandText:=' select  '  +SelectStr
  +' sum(isnull(Amount,0)) [金额]  '
  +'  from #EGExpenseDM  '
  +WhereStr
  +' group by '+GroupStr;
  adsMaster.open;

  with adsMaster do
  begin
    for I :=0 to FieldList.Count -1 do
    begin
      if Fields[i].DataType = TFieldType(ftFloat) then
        begin
          SetStrProp(Fields[I], 'DisplayFormat','#,#.00') ;
          Fields[i].DisplayWidth :=20;
        end;
    end;
  end;
  Panel6.Visible :=False;
  UpdateDBGrid  ;
  DBGrid.hint :='';
  if CheckBox1.Checked then DBGrid.hint := DBGrid.hint+CheckBox1.Caption+',';
  if CheckBox2.Checked then DBGrid.hint := DBGrid.hint+CheckBox2.Caption+',';
  if CheckBox3.Checked then DBGrid.hint := DBGrid.hint+CheckBox3.Caption+',';
  if CheckBox4.Checked then DBGrid.hint := DBGrid.hint+CheckBox4.Caption+',';
  if trim(DBGrid.hint)<>'' then
    DBGrid.hint :='汇总项目:'+Copy(Trim(DBGrid.hint),1,Length(Trim(DBGrid.hint))-1 );
end;

procedure TEGExpenseStatisticForm.adsMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  adsMaster.IndexFieldNames := '';
end;

procedure TEGExpenseStatisticForm.ExportActionExecute(Sender: TObject);
begin
  hint :='统计条件:' +Memo1.Text;
  caption :=caption+'报表';
  inherited;
end;

end.
