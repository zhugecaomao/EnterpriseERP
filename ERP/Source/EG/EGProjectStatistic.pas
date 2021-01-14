unit EGProjectStatistic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, GEdit,
  DBCtrls, Menus, WNADOCQuery,TypInfo, CheckLst;

type
  TEGProjectStatisticForm = class(TWSVoucherBrowseForm)
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
    TempAds: TADODataSet;
    WNADOCQuery1: TWNADOCQuery;
    Button1: TButton;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Button2: TButton;
    Panel6: TPanel;
    Button4: TButton;
    ExpSttcGroupBox: TGroupBox;
    ExpSttcCheckListBox: TCheckListBox;
    ExpSttcCkBxPopMenu: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    VipsetPanel: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button5: TButton;
    Button6: TButton;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ClientAccountLiast: TToolButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    AccountListQry: TADOQuery;
    AccountListQryDSDesigner: TDateTimeField;
    AccountListQryDSDesigner2: TStringField;
    AccountListQryDSDesigner3: TStringField;
    AccountListQryDSDesigner4: TBCDField;
    AccountListQryDSDesigner5: TBCDField;
    AccountListQryDSDesigner6: TBCDField;
    AccountListQryDSDesigner7: TStringField;
    ListClientSaleAct: TAction;
    ListClientSale: TMenuItem;
    ListGoodsSaleAct: TAction;
    ListGoodsSale: TMenuItem;
    ToolButton1: TToolButton;
    procedure UpdateDBGrid;
    procedure DBGridTitleClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure adsMasterBeforeOpen(DataSet: TDataSet);
    procedure DateTimePicker2Exit(Sender: TObject);
    procedure DateTimePicker1Exit(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ExpSttcCheckListBoxClickCheck(Sender: TObject);
    procedure ClientAccountLiastClick(Sender: TObject);
    procedure ListClientSaleActExecute(Sender: TObject);
    procedure ListGoodsSaleActExecute(Sender: TObject);
    procedure adsMasterAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
    WhereStr,SelectStr :string;
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  EGProjectStatisticForm: TEGProjectStatisticForm;

implementation

uses CommonDM,QLDBFlt,WSSecurity,QLRptBld,SLRpCheckReckoning;
//CommonDM, QLDBFlt, QLRptBld, SLRpCheckReckoning;
{$R *.dfm}

function TEGProjectStatisticForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TEGProjectStatisticForm.UpdateDBGrid;
var I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    for I := 0 to Columns.Count - 1 do
    begin
      Columns[i].Width :=90;
      if Pos('日',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Pos('编',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      begin
        if (not CheckBox1.Checked) and (Pos('数量',Columns[I].FieldName)>0 )
             then Columns[I].Visible :=False;
        if (not CheckBox2.Checked) and  (Pos('单价',Columns[I].FieldName)>0 )
             then Columns[I].Visible :=False;
        if (not CheckBox3.Checked) and  (Pos('金额',Columns[I].FieldName)>0 )
             then Columns[I].Visible :=False;
        SetStrProp(Fields[I], 'DisplayFormat','#,#.00') ;
        if Pos('Price',Columns[I].FieldName)<=0 then
           Columns[I].Footer.ValueType := fvtSum;
      end;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TEGProjectStatisticForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

procedure TEGProjectStatisticForm.DBGridDblClick(Sender: TObject);
begin
// inherited;
end;


procedure TEGProjectStatisticForm.Button3Click(Sender: TObject);
begin
  inherited;
  WNADOCQuery1.TabName :='TempExpenseList';
  WNADOCQuery1.ConnectionString :=CommonData.acnConnection.ConnectionString;
  WNADOCQuery1.Execute(False);
  if  trim(WNADOCQuery1.QueryTerm)<>'' then
      WhereStr :=' where ' +  trim(WNADOCQuery1.QueryTerm)
      else WhereStr :=' Where 1=1 ' ;
  Memo1.ReadOnly :=False;
  Memo1.Clear;
  if ( copy(trim(WNADOCQuery1.QueryTerm),1,3) ='not' ) or
    ( copy(trim(WNADOCQuery1.QueryTerm),1,3) ='NOT' )then
     Memo1.Text :='全部不满足条件: '
     +Copy(trim(WNADOCQuery1.ShowTerm.Text),5,length(trim(WNADOCQuery1.ShowTerm.Text))-4 )
     else Memo1.Text :=Copy(trim(WNADOCQuery1.ShowTerm.Text),5,length(trim(WNADOCQuery1.ShowTerm.Text))-4);
  if WhereStr =' Where 1=1 ' then
    begin
      Memo1.Clear;
      Memo1.Text :='不限制条件!';
    end;
  Memo1.ReadOnly :=True;
  ToolBar.Hint :=' 台帐条件: '+Memo1.Text;
  if Button1.Tag=1 then Button1Click(sender)
    else Button2Click(sender);
end;

procedure TEGProjectStatisticForm.FormShow(Sender: TObject);
var I :integer;
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ExpenseList')
        +' )) DROP TABLE #ExpenseList ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select b.Date [日期], '
      +' b.Code [编号],                        '
      +' b.BillMode [业务类别],                '
      +' b.Brief [摘要],                       '
      +' c.name  [项目名称],                   '
      +' d2.name  [领料人] ,                   '
      +' d.name  [经手人] ,                    '
      +' b.memo  [备注],                       '
      +' e.name [材料名称],                    '
      +' a.GoodsSpec [规格型号],               '
      +' g.name [标准单位],                    '
      +' a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [标准数量], '
      +' a.PriceGoal [标准单价],                                         '
      +' f.name     [包装单位],                                          '
      +' a.PriceBase [包装单价],                                         '
      +' a.Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [包装数量],     '
      +' a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [材料金额],       '
      +' a.PriceGoal [结算金额],                                         '
      +' a.PriceGoal  [折扣返利金额],                                    '
      +' a.PriceGoal [客户成本],                                         '
      +' a.PriceGoal [项目费用],                                         '
      +' a.PriceGoal [合同金额],                                         '
      +' a.PriceGoal [项目毛利],                                         '
      +' a.PriceGoal [应收帐款],                                         '
      +' h.name [项目分类],                                              '
      +' L.name [部门名称],                                              '
      +' m.name [客户名称],                                              '
      +' a.memo [附注]                                                   '
      +' into #ExpenseList '
      +' from EGGoodsOutDetail a                                         '
      +' left outer join EGGoodsOutMaster     b on b.ID=a.MasterID       '
      +' left outer join DAProject        c on c.ID=b.ProjectID          '
      +' left outer join MSEmployee       d on d.ID=b.EmployeeID         '
      +' left outer join MSEmployee       d2 on d2.ID=b.ClientID         '
      +' left outer join DAGoods          e on e.ID=a.GoodsID            '
      +' left outer join MSUnit           f on f.ID=a.PackUnitID         '
      +' left outer join MSUnit           g on g.ID=e.UnitID             '
      +' left outer join DAProjectClass   h on h.ID=c.ProjectClassID     '
      +' left outer join MSDepartment     l on l.ID=d.DepartmentID       '
      +' left outer join DAClient         m on m.ID=c.ClientID             '
      +' where b.RecordState<>'+ Quotedstr('删除')
      +' and isnull(b.ProjectID,0)<>0 '
      +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Update  #ExpenseList set '
      +' [结算金额]=null,[折扣返利金额]=null,[客户成本]=null ,'
      +' [项目费用]=null,[合同金额]=null,[项目毛利]=null ,  '
      +' [应收帐款]=null ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close; //插入项目合同初始资料（DAProject）
  ADOQuery.SQL.Text :=' insert into #ExpenseList ( [日期], '
      +' [编号], [业务类别],[摘要],[项目名称],'
      +' [项目分类],[客户名称],[经手人],  '
      +' [备注],[合同金额] )                 '
      +' select a.Date [日期],a.Code [编号],            '
      +Quotedstr('项目合同')  +' [业务类别],  '
      +Quotedstr('项目合同')  +' [摘要],  '
      +' a.name  [项目名称], b.name  [项目分类] ,         '
      +' c.name [客户名称], d.name  [经手人],  '
      +' a.memo [备注]   , '
      +' Isnull(a.StockMin,0)  [合同金额] '
      +' from DAProject a  '
      +' left outer join DAProjectClass     b on b.ID=a.ProjectClassID      '
      +' left outer join DAClient           c on c.ID=a.ClientID      '
      +' left outer join MSEmployee         d on d.ID=a.EmployeeID    '
      +' where a.RecordState<>'+ Quotedstr('删除')
      +' and Isnull(a.StockMin,0)<>0 ' ;
  ADOQuery.ExecSQL; //插入项目合同初始资料（DAProject）

  ADOQuery.Close; //插入项目合同结算资料（FNClearEGMaster ,FNClearEGDetail）
  ADOQuery.SQL.Text :=' insert into #ExpenseList ( [日期], '
      +' [编号], [业务类别],[摘要],[项目名称],'
      +' [项目分类],[客户名称],[经手人],  '
      +' [备注],[结算金额],[折扣返利金额] )                 '
      +' select b.Date [日期],b.Code [编号],            '
      +' b.BillMode [业务类别],  '
      +' b.Brief [摘要],  '
      +' c.name  [项目名称], d.name  [项目分类] ,         '
      +' e.name [客户名称], f.name  [经手人],  '
      +' b.memo [备注]   , '
      +' Isnull(a.Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) [结算金额], '
      +' Isnull(a.AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) [折扣返利金额] '
      +' from FNClearEGDetail a  '
      +' left outer join FNClearEGMaster    b on b.ID=a.MasterID         '
      +' left outer join DAProject          c on c.ID=a.ProjectID        '
      +' left outer join DAProjectClass     d on d.ID=c.ProjectClassID   '
      +' left outer join DAClient           e on e.ID=b.ClientID      '
      +' left outer join MSEmployee         f on f.ID=b.EmployeeID    '
      +' where b.RecordState<>'+ Quotedstr('删除')
      +' and (Isnull(a.Amount,0)+Isnull(a.AmountRed,0)) <>0 ' ;
  ADOQuery.ExecSQL; //插入项目合同结算资料（FNClearEGMaster ,FNClearEGDetail ）

  ADOQuery.Close; //插入项目合同经营费用资料（FNExpenseMaster ,FNExpenseDetail）
  ADOQuery.SQL.Text :=' insert into #ExpenseList ( [日期], '
      +' [编号], [业务类别],[摘要],[项目名称],'
      +' [项目分类],[客户名称],[经手人],  '
      +' [备注],[项目费用],[客户成本] )                 '
      +' select b.Date [日期],b.Code [编号],            '
      +' b.BillMode [业务类别],  '
      +' b.Brief [摘要],  '
      +' c.name  [项目名称], d.name  [项目分类] ,         '
      +' e.name [客户名称], f.name  [经手人],  '
      +' b.memo [备注]   , '
      +' Isnull(a.Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) [项目费用], '
      +' CASE '
      +'   WHEN isnull(a.ClientID,0)=0 THEN null    '
      +'   ELSE Isnull(a.Amount,0) '
      +'  END AS [客户成本] '
      +' from FNExpenseDetail a  '
      +' left outer join FNExpenseMaster    b on b.ID=a.MasterID         '
      +' left outer join DAProject          c on c.ID=a.ProjectID        '
      +' left outer join DAProjectClass     d on d.ID=c.ProjectClassID   '
      +' left outer join DAClient           e on e.ID=a.ClientID      '
      +' left outer join MSEmployee         f on f.ID=b.EmployeeID    '
      +' where b.RecordState<>'+ Quotedstr('删除')
      +' and (Isnull(a.ProjectID,0)+Isnull(a.ClientID,0)) <>0 ' ;
  ADOQuery.ExecSQL;//插入项目合同经营费用资料（FNExpenseMaster ,FNExpenseDetail）




  if Guarder.UserName<>'系统管理员' then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' delete from #ExpenseList '
        +' where [经手人] not in ( select b.name  '
        +' from MSRolePermissions a '
        +' left outer join MSPermission b on b.ID=a.PermissionID '
        +' where b.PermissionClass='+Quotedstr('Y-查看业务')
        +' and a.RoleID= '+ inttostr(Guarder.UserID)+' ) ';
    ADOQuery.ExecSQL;
  end;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' if exists (select * from dbo.sysobjects where '
      +' id = object_id '
      +' (' +Quotedstr('[dbo].[TempExpenseList]')+') and OBJECTPROPERTY(id,'
      +Quotedstr('IsUserTable')+' ) = 1) drop table [dbo].[TempExpenseList] ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select top 1 * into TempExpenseList from #ExpenseList' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select top 1 * from TempExpenseList' ;
  ADOQuery.open;
  ExpSttcCheckListBox.Columns :=4;
  ExpSttcCheckListBox.Items.Clear;
  ExpSttcCheckListBox.Hint :='';
  WNADOCQuery1.Field.Clear;
  for I := 0 to ADOQuery.Fields.Count - 1 do
  begin
    if not (ADOQuery.Fields[i] is TNumericField)  then
       ExpSttcCheckListBox.Items.Add(Trim(ADOQuery.Fields[i].FieldName))
     else
       ExpSttcCheckListBox.Hint :=ExpSttcCheckListBox.Hint
         +', sum(isnull('+Trim(ADOQuery.Fields[i].FieldName)+',0)) as ['
         +Trim(ADOQuery.Fields[i].FieldName)+'] ';
     WNADOCQuery1.Field.Add(Trim(ADOQuery.Fields[i].FieldName));
  end;
  WhereStr :=' where  1=1 ';
  Memo1.Text :='不限制条件!';
  SelectStr :='';



end;

procedure TEGProjectStatisticForm.Button1Click(Sender: TObject);
begin
  Panel6.Visible :=True;
  Panel6.Repaint;
  Button1.Tag:=1 ;
  adsMaster.Close;
  adsMaster.CommandText:=' select * from #ExpenseList'+WhereStr
      +' order by [日期], [编号]' ;
//  showmessage(adsMaster.CommandText);
  adsMaster.open;
  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='';
end;

procedure TEGProjectStatisticForm.FormActivate(Sender: TObject);
begin
  inherited;
  {ADOQuery.Close;
  ADOQuery.SQL.Text :='select max(日期) MDate  from #ExpenseList ';
  ADOQuery.Open;
  if ADOQuery.FieldByName('MDate').IsNull then WhereStr :=Datetostr(date)
    else WhereStr :=Trim(ADOQuery.fieldbyname('MDate').AsString);
  Memo1.ReadOnly :=False;
  Memo1.Clear;
  Memo1.Text :=' 日期 等于'+ Quotedstr(WhereStr);
  Memo1.ReadOnly :=True;
  WhereStr :=' where [日期]='+Quotedstr(WhereStr); }
//  ExpSttcCheckListBox.Checked[4] :=True;
  Button2Click(sender);
end;

procedure TEGProjectStatisticForm.Button2Click(Sender: TObject);
var I :integer;
    SelectStr1:String;
begin
  inherited;
  Panel6.Visible :=True;
  Panel6.Repaint;
  Button1.Tag:=0;

  if Trim(SelectStr) ='' then
    begin
      ExpSttcCheckListBox.Checked[4] :=true;
      ExpSttcCheckListBox.ItemIndex := 4;
      ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
    end;
  SelectStr1 :=Trim(SelectStr);
  while Pos(',', SelectStr1)=1 do  SelectStr1[Pos(',', SelectStr1)] :=' ';

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ExpenseListTtl')
        +' )) DROP TABLE #ExpenseListTtl ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' select ' + SelectStr1+ ExpSttcCheckListBox.hint
  +' into #ExpenseListTtl from #ExpenseList  '
  +WhereStr +' group by '+SelectStr1;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' update #ExpenseListTtl set [标准单价]=null ,'
    +' [包装单价]=null';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' update #ExpenseListTtl set [标准单价]= '
   +' [材料金额]/[标准数量] where [标准数量]<>0 ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text:=' update #ExpenseListTtl set [包装单价]= '
   +' [材料金额]/[包装数量] where [包装数量]<>0 ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' update #ExpenseListTtl set [项目毛利]= '
   +' ( Isnull([合同金额],0)-Isnull([材料金额],0)-Isnull([项目费用],0) ) ,'
   +' [应收帐款] ='
   +' ( Isnull([合同金额],0)-Isnull([结算金额],0)-Isnull([折扣返利金额],0) ) ';
  ADOQuery.ExecSQL;


  adsMaster.Close;
  adsMaster.CommandText:=' select * from #ExpenseListTtl ';
  adsMaster.open;


  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='汇总项目:'+SelectStr1;
end;

procedure TEGProjectStatisticForm.N1Click(Sender: TObject);
begin
  ExpSttcCheckListBox.Sorted :=not ExpSttcCheckListBox.Sorted;
end;

procedure TEGProjectStatisticForm.N2Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=not ExpSttcCheckListBox.Checked[I];
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TEGProjectStatisticForm.N3Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=True;
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TEGProjectStatisticForm.N4Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=False;
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TEGProjectStatisticForm.adsMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  adsMaster.IndexFieldNames := '';
end;

procedure TEGProjectStatisticForm.DateTimePicker2Exit(Sender: TObject);
begin
  if DateTimePicker1.Date>DateTimePicker2.Date then
    DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TEGProjectStatisticForm.DateTimePicker1Exit(Sender: TObject);
begin
  if DateTimePicker1.Date>DateTimePicker2.Date then
    DateTimePicker2.Date :=DateTimePicker1.Date;
end;

procedure TEGProjectStatisticForm.Button4Click(Sender: TObject);
var year,month,day:word;
begin
  inherited;
  Panel2.Enabled :=False;
  DBGrid.Enabled :=False;
  VipsetPanel.Visible :=True;
  VipsetPanel.Repaint;
//  DateTimePicker1.Date :=date;
//  DateTimePicker2.Date :=EndoftheMonth(date);
  DecodeDate(date,year,month,day)  ;
  DateTimePicker1.Date :=Encodedate(year,month,1);
  DateTimePicker2.Date :=date;
end;

procedure TEGProjectStatisticForm.Button6Click(Sender: TObject);
begin
  Panel2.Enabled :=True;
  DBGrid.Enabled :=True;
  VipsetPanel.Visible :=False;
end;

procedure TEGProjectStatisticForm.Button5Click(Sender: TObject);
begin
  Exit;
  Panel2.Enabled :=True;
  DBGrid.Enabled :=True;
  VipsetPanel.Visible :=False;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ExpenseList0')
        +' )) DROP TABLE #ExpenseList0' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select * into #ExpenseList0 from #ExpenseList'
    +' where [日期] >='+Quotedstr(Datetostr(DateTimePicker1.Date))
    +' and [日期] <='+Quotedstr(Datetostr(DateTimePicker2.Date));
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Insert into  #ExpenseList0 '
    +' ([日期],[编号],[业务类别],[客户名称],[销售金额],[结算金额],[折扣返利金额] )'
    +' select '+Quotedstr(Datetostr(DateTimePicker1.Date-1))
    +' as [日期],'+Quotedstr('----')+' , '+Quotedstr('期初结转')+' , '
    +' [客户名称], sum(isnull([销售金额],0)) [销售金额] , '
    +' sum(isnull([结算金额],0)) [结算金额] , '
    +' sum(isnull([折扣返利金额],0)) [折扣返利金额]  '
    +' from #ExpenseList '
    +' where [日期] <'+Quotedstr(Datetostr(DateTimePicker1.Date))
    +' Group by [客户名称]' ;
  ADOQuery.ExecSQL ;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Insert into  #ExpenseList0 '
    +' ( [客户名称],[日期],[编号],[业务类别] )'
    +' select Distinct [客户名称],  '
    + Quotedstr(Datetostr(DateTimePicker1.Date-1))
    +' as [日期],'+Quotedstr('----')+' , '+Quotedstr('期初结转')
    +' from #ExpenseList '
    +' where [客户名称] not in ( select distinct [客户名称] from #ExpenseList0  '
    +' where [业务类别]='+ Quotedstr('期初结转')+' ) '    ;
  ADOQuery.ExecSQL ;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Insert into  #ExpenseList0 '
    +' ([日期],[编号],[业务类别],[客户名称],[销售金额] )'
    +' select '+Quotedstr(Datetostr(DateTimePicker1.Date-1))
    +' as [日期],'+Quotedstr('----')+' , '+Quotedstr('期初结转')+' , '
    +' [客户名称],sum(0.00) [销售金额] '
    +' from #ExpenseList '
    +' where [客户名称] not in ( select [客户名称] from #ExpenseList0 where '
    +' [日期]< '+Quotedstr(Datetostr(DateTimePicker1.Date)) + ' )'
    +' group by [客户名称] ';
  ADOQuery.ExecSQL ;


  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
    +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ExpenseList')
    +' )) DROP TABLE #ExpenseList' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select * into #ExpenseList from #ExpenseList0'
    +' where [日期] is not null '
    +' order by [日期]  ' ;
  ADOQuery.ExecSQL;
  if Button1.Tag=1 then Button1Click(sender)
    else Button2Click(sender);
end;

procedure TEGProjectStatisticForm.ExpSttcCheckListBoxClickCheck(
  Sender: TObject);
var CheckStr :string;
begin
  CheckStr :=','+Trim(ExpSttcCheckListBox.Items[ExpSttcCheckListBox.ItemIndex]);
  if (ExpSttcCheckListBox.Checked[ExpSttcCheckListBox.ItemIndex]) and
     (pos(CheckStr,SelectStr)<=0) then  SelectStr :=Trim(SelectStr)+Trim(CheckStr);

  if (not ExpSttcCheckListBox.Checked[ExpSttcCheckListBox.ItemIndex]) and
     (pos(CheckStr,SelectStr)>0) then
     SelectStr :=StringReplace(SelectStr,CheckStr,'',[rfReplaceAll, rfIgnoreCase]);
end;

procedure TEGProjectStatisticForm.ClientAccountLiastClick(Sender: TObject);
var BalanceF:real;
    I:Integer;
begin
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select * from #ExpenseList where [业务类别]='+Quotedstr('期初结转');
  ADOQuery.Open;
  if ADOQuery.IsEmpty then
  begin
    ShowMessage('请在“高级..”设置对帐日期，“确定”后，再执行此功能!');
//    Button4.OnClick(sneder);
    Exit;
  end;
  I :=0;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select distinct [客户名称] from #ExpenseList ' + WhereStr;
  ADOQuery.Open;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
          +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ClientAccountList')
          +' )) DROP TABLE #ClientAccountList' ;
    ADOQuery2.ExecSQL;
    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' CREATE TABLE #ClientAccountList ( '
	+' [ID] [int] IDENTITY (1, 1) NOT NULL , '
	+' [日期] [datetime] NULL ,              '
	+' [编号] [varchar] (20)  NULL ,         '
	+' [业务类别] [varchar] (16) NULL ,      '
	+' [销售金额] [Float] NULL ,      '
	+' [回款金额] [Float] NULL ,      '
	+' [余额] [Float] NULL ,        '
	+' [备注] [varchar] (30)  NULL     '
	+' )  ';
    ADOQuery2.ExecSQL;
//    ADOQuery2.Close;
//    ADOQuery2.SQL.Text :=' Truncate TABLE #ClientAccountList ';
//    ADOQuery2.ExecSQL;
    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' Insert Into #ClientAccountList ( '
      +'        [日期],[编号],[业务类别],[销售金额],[回款金额] )'
      +' select [日期],[编号],[业务类别],'
      +' sum(isnull([销售金额],0)) as [销售金额] , '
      +' sum(isnull([结算金额],0)) as [回款金额] '
      +' from #ExpenseList '
      +' where [客户名称]='+Quotedstr(ADOQuery.FieldByName('客户名称').AsString)
      +' Group by [日期],[编号],[业务类别] '
      +' order by [日期]';
    ADOQuery2.ExecSQL;

    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' Insert Into #ClientAccountList ( '
      +'        [日期],[编号],[业务类别],[回款金额] )'
      +' select [日期],[编号],[业务类别],'
      +' sum(isnull([折扣返利金额],0)) as  [回款金额] '
      +' from #ExpenseList '
      +' where [客户名称]='+Quotedstr(ADOQuery.FieldByName('客户名称').AsString)
      +' and isnull([折扣返利金额],0)<>0  '
      +' Group by [日期],[编号],[业务类别] '
      +' order by [日期]';
    ADOQuery2.ExecSQL;

    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' select * from  #ClientAccountList order by [日期],[ID]';
    ADOQuery2.open;
    ADOQuery2.First;
    BalanceF := 0;
    BalanceF := BalanceF+ ADOQuery2.FieldByName('销售金额').AsFloat-
         ADOQuery2.FieldByName('回款金额').AsFloat;
    ADOQuery2.Edit;
    ADOQuery2.FieldByName('销售金额').AsFloat :=0;
    ADOQuery2.FieldByName('回款金额').AsFloat :=0;
    while not ADOQuery2.Eof do
    begin
      BalanceF := BalanceF+ ADOQuery2.FieldByName('销售金额').AsFloat-
         ADOQuery2.FieldByName('回款金额').AsFloat;
      ADOQuery2.Edit;
      ADOQuery2.FieldByName('余额').AsFloat :=BalanceF;
      ADOQuery2.Next;
    end;
    AccountListQry.Close;
    AccountListQry.SQL.Text :=' select [日期],[编号],[业务类别],[销售金额], '
      +'  [回款金额],[余额],[备注] '
      +' from  #ClientAccountList order by [ID] ';
    AccountListQry.open;

//    tfloatfield.ADOQuery2.
    DataSource1.DataSet := AccountListQry;
    DBGrid1.DataSource :=  DataSource1;
//    DBGrid1.Visible :=True;
//    ShowMessage('请查看--'+ADOQuery.FieldByName('客户名称').AsString+' --对帐结果!');
    //在此循环打印对帐单结果，完成后可以将 DBGrid1，DataSource1删除
    with TQLDBGridReportBuilder.Create(Self) do
    try
      DBGrid := DBGrid1;
      AutoWidth := True;
      Report := TSLCheckReckoningReport.Create(Self);
      TSLCheckReckoningReport(Report).qrdbtClientName.DataSet := ADOQuery;
      TSLCheckReckoningReport(Report).qrlCheckCourse.Caption :=
        '对帐期间: ' + DateToStr(DateTimePicker1.Date) + ' ~ ' +
        DateToStr(DateTimePicker2.Date);
      SummaryFields.Add('销售金额=SUM([销售金额])');
      SummaryFields.Add('回款金额=SUM([回款金额])');
      SummaryFields.Add('余额='+floattostr(BalanceF));
      AutoOrientation := False;
      Active := True;

  //    InitReport(TQuickRep(Report));
    if I<1 then
      Report.PreviewModal
      else  Report.Print;
  //    if Preview then Report.PreviewModal
  //    else begin
  //      if ShowSetupDialog then Report.PrinterSetup;
  //      Report.Print;
  //    end;
    finally
      Free;
    end;
    ADOQuery.Next;
    I :=I+1;
//    DBGrid1.Visible :=False;
  end;
end;

procedure TEGProjectStatisticForm.ListClientSaleActExecute(Sender: TObject);
var I:Integer;
  Goods :string;
begin
  for I:=0 to adsMaster.FieldCount-1 do
  begin
    if Pos('客户名称',adsMaster.Fields[I].FieldName)>0 then
    begin
      Goods := adsMaster.FieldByName('客户名称').AsString;
      if Trim(Goods)='' then Exit;
      adsMaster.Close;
      adsMaster.CommandText :='select * from #ExpenseList  where  [客户名称]='+Quotedstr(Goods);
      adsMaster.Open;
      UpdateDBGrid;
      Exit;
    end;
  end;
end;

procedure TEGProjectStatisticForm.ListGoodsSaleActExecute(Sender: TObject);
var I:Integer;
  Goods :string;
begin
  for I:=0 to adsMaster.FieldCount-1 do
  begin
    if Pos('项目名称',adsMaster.Fields[I].FieldName)>0 then
    begin
      Goods := adsMaster.FieldByName('项目名称').AsString;
      if Trim(Goods)='' then Exit;
      adsMaster.Close;
      adsMaster.CommandText :='select * from #ExpenseList  where  [项目名称]='+Quotedstr(Goods);
      adsMaster.Open;
      UpdateDBGrid;
      Exit;
    end;
  end;
end;

procedure TEGProjectStatisticForm.adsMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefreshAvailableFields;
end;

end.
