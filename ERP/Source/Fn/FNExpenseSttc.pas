unit FNExpenseSttc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, GEdit,
  DBCtrls, Menus, WNADOCQuery,TypInfo, CheckLst;

type
  TFNExpenseSttcForm = class(TWSVoucherBrowseForm)
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
    ToolButton1: TToolButton;
    Button7: TButton;
    PeriodRadioGroup: TRadioGroup;
    PeriodMonthRadioButton: TRadioButton;
    PeriodDaysRadioButton: TRadioButton;
    PeriodMonthComboBox: TComboBox;
    PeriodDaysComboBox: TComboBox;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
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
    procedure adsMasterAfterOpen(DataSet: TDataSet);
    procedure Button7Click(Sender: TObject);
    procedure PeriodMonthRadioButtonClick(Sender: TObject);
    procedure PeriodDataUpdate;


  private
    { Private declarations }
    WhereStr,SelectStr :string;
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FNExpenseSttcForm: TFNExpenseSttcForm;

implementation

uses CommonDM,QLDBFlt;

{$R *.dfm}

function TFNExpenseSttcForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TFNExpenseSttcForm.UpdateDBGrid;
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

procedure TFNExpenseSttcForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

procedure TFNExpenseSttcForm.DBGridDblClick(Sender: TObject);
begin
// inherited;
end;


procedure TFNExpenseSttcForm.Button3Click(Sender: TObject);
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

procedure TFNExpenseSttcForm.FormShow(Sender: TObject);
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
     +' b.Code [编号],   '
     +' b.BillMode [业务类别],  '
     +' b.Brief [摘要], '
     +' ex.name [费用名称],'
     +' isnull(a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1),0) [费用金额], '
     +' c.name [受款人] ,   '
     +' d.name [经手人] , '
     +' f.name  [客户厂商],  '
     +' g.name  [资产名称], '
     +' h.name  [项目名称], '
     +' i.name  [部门名称], '
     +' j.name  [地区名称], '
     +' k.name  [资产类别], '
     +' l.name  [项目类别], '
     +' e.name [付款帐户],  '
     +' a.BillCode [票据号码],'
     +' isnull(a.AmountB,0) [参考数量], '
     +' b.Memo [业务备注],'
     +' a.Memo  [附注]'
     +' into #ExpenseList from FNExpenseDetail a '
     +' left outer join FNExpenseMaster b on b.ID=a.MasterID '
     +' left outer join DAExpenseClass       ex on ex.ID=a.ExpenseID '
     +' left outer join MSEmployee      c on c.ID=b.ClientID   '
     +' left outer join MSEmployee      d on d.ID=b.EmployeeID  '
     +' left outer join FNAccounts      e on e.ID=b.AccountsID  '
     +' left outer join DAClient        f on f.ID=a.ClientID       '
     +' left outer join DAGoods         g on g.ID=a.GoodsID        '
     +' left outer join DAProject       h on h.ID=a.ProjectID      '
     +' left outer join MSDepartment    i on i.ID=d.DepartmentID   '
     +' left outer join DAArea          j on j.ID=f.AreaID         '
     +' left outer join DAGoodsClass    k on k.ID=g.GoodsClassID   '
     +' left outer join DAProjectClass  l on l.ID=h.ProjectClassID '
     +' where b.RecordState<>'+ Quotedstr('删除')
     +' and a.ExpenseID<>0 and a.ExpenseID is not null ' ;
  ADOQuery.ExecSQL;
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

procedure TFNExpenseSttcForm.Button1Click(Sender: TObject);
begin
  Panel6.Visible :=True;
  Panel6.Repaint;
  Button1.Tag:=1 ;
  adsMaster.Close;
  adsMaster.CommandText:=' select * from #ExpenseList'+WhereStr ;
//  showmessage(adsMaster.CommandText);
  adsMaster.open;
  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='';
end;

procedure TFNExpenseSttcForm.FormActivate(Sender: TObject);
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :='select max(日期) MDate  from #ExpenseList ';
  ADOQuery.Open;
  if ADOQuery.FieldByName('MDate').IsNull then WhereStr :=Datetostr(date)
    else WhereStr :=Trim(ADOQuery.fieldbyname('MDate').AsString);
  Memo1.ReadOnly :=False;
  Memo1.Clear;
  Memo1.Text :=' 日期 等于'+ Quotedstr(WhereStr);
  Memo1.ReadOnly :=True;
  WhereStr :=' where [日期]='+Quotedstr(WhereStr);    
  Button1Click(sender);
end;

procedure TFNExpenseSttcForm.Button2Click(Sender: TObject);
var I :integer;
    SelectStr1 :string;
begin
  inherited;
  Panel6.Visible :=True;
  Panel6.Repaint;
  Button1.Tag:=0;
  if Trim(SelectStr) ='' then
    begin
      ExpSttcCheckListBox.Checked[1] :=true;
      ExpSttcCheckListBox.ItemIndex := 1;
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
    +',sum(0.00) [平均参考单价] into #ExpenseListTtl from #ExpenseList  '
    +WhereStr +' group by '+SelectStr1;
  ADOQuery.ExecSQL;

  adsMaster.Close;
  adsMaster.CommandText:=' select * from #ExpenseListTtl ';
  adsMaster.open;

  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='汇总项目:'+SelectStr1;
end;

procedure TFNExpenseSttcForm.N1Click(Sender: TObject);
begin
  ExpSttcCheckListBox.Sorted :=not ExpSttcCheckListBox.Sorted;
end;

procedure TFNExpenseSttcForm.N2Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=not ExpSttcCheckListBox.Checked[I];
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TFNExpenseSttcForm.N3Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=True;
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TFNExpenseSttcForm.N4Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=False;
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TFNExpenseSttcForm.adsMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  adsMaster.IndexFieldNames := '';
end;

procedure TFNExpenseSttcForm.DateTimePicker2Exit(Sender: TObject);
begin
  inherited;
  if DateTimePicker1.Date>DateTimePicker2.Date then
    DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TFNExpenseSttcForm.DateTimePicker1Exit(Sender: TObject);
begin
  inherited;
  if DateTimePicker1.Date>DateTimePicker2.Date then
    DateTimePicker2.Date :=DateTimePicker1.Date;
end;

procedure TFNExpenseSttcForm.Button4Click(Sender: TObject);
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

procedure TFNExpenseSttcForm.Button6Click(Sender: TObject);
begin
  inherited;
  Panel2.Enabled :=True;
  DBGrid.Enabled :=True;
  VipsetPanel.Visible :=False;
end;

procedure TFNExpenseSttcForm.Button5Click(Sender: TObject);
begin
  inherited;
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
    +' ([日期],[业务类别],[费用名称],[费用金额],[参考数量] )'
    +' select '+Quotedstr(Datetostr(DateTimePicker1.Date-1))
    +' as [日期],'+Quotedstr('期初结转')+' as [业务类别],'
    +' [费用名称],sum(isnull([费用金额],0)), '
    +' sum(isnull([参考数量],0)) from #ExpenseList '
    +' where [日期] <'+Quotedstr(Datetostr(DateTimePicker1.Date))
    +' Group by [日期],[业务类别],[费用名称]';
  ADOQuery.ExecSQL;
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
  if Button1.Tag=1 then Button1Click(sender);
  if Button1.Tag=0 then Button2Click(sender);
  if Button1.Tag=2 then Button7Click(sender);
end;

procedure TFNExpenseSttcForm.ExpSttcCheckListBoxClickCheck(
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

procedure TFNExpenseSttcForm.adsMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefreshAvailableFields;
end;

procedure TFNExpenseSttcForm.Button7Click(Sender: TObject);
var I :integer;
    SelectStr1 :string;
begin
  inherited;
  PeriodDataUpdate;
//  showmessage(Button7.Hint)  ;
  Panel6.Visible :=True;
  Panel6.Repaint;
  Button1.Tag:=2;
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
  ADOQuery.SQL.Text:=' select ' + SelectStr1+ Button7.hint
    +'  into #ExpenseListTtl from #ExpenseList0 '
    +WhereStr +' group by '+SelectStr1;
  ADOQuery.ExecSQL;

  adsMaster.Close;
  adsMaster.CommandText:=' select * from #ExpenseListTtl ';
  adsMaster.open;

  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='汇总项目:'+SelectStr1;
end;

procedure TFNExpenseSttcForm.PeriodMonthRadioButtonClick(Sender: TObject);
begin
  inherited;
  PeriodMonthComboBox.Enabled :=PeriodMonthRadioButton.Checked;
  PeriodDaysComboBox.Enabled  :=not PeriodMonthRadioButton.Checked;
end;

procedure TFNExpenseSttcForm.PeriodDataUpdate;
var I :integer;
    SelectStr1,StrDate1,StrDate2,StrDate3,StrDate4,StrDate5,StrDate6,
    StrFeildName0,StrFeildName1,StrFeildName2,StrFeildName3,StrFeildName4,
    StrFeildName5,StrFeildName6 :string;
    year,month,day :word;
begin
  inherited;
  if PeriodMonthRadioButton.Checked then
  begin
    I:=strtoint(PeriodMonthComboBox.Text);
    DecodeDate(Date,year, month, day);
    EnCodeDate(year,month,1);
    StrDate1 :=Datetostr(EnCodeDate(year,month,1));
    StrFeildName1 :='['+Inttostr(year)+'年'+Inttostr(month)+'月]';
    month :=month-I;
    if month<0 then
    begin
      month :=12+month;
      year :=year-1;
    end;

    StrDate2 :=Datetostr(EnCodeDate(year,month,1));
    StrFeildName2 :='['+Inttostr(year)+'年'+Inttostr(month)+'月]';
    month :=month-I;
    if month<0 then
    begin
      month :=12+month;
      year :=year-1;
    end;

    StrDate3 :=Datetostr(EnCodeDate(year,month,1));
    StrFeildName3 :='['+Inttostr(year)+'年'+Inttostr(month)+'月]';
    month :=month-I;
    if month<0 then
    begin
      month :=12+month;
      year :=year-1;
    end;

    StrDate4 :=Datetostr(EnCodeDate(year,month,1));
    StrFeildName4 :='['+Inttostr(year)+'年'+Inttostr(month)+'月]';
    month :=month-I;
    if month<0 then
    begin
      month :=12+month;
      year :=year-1;
    end;

    StrDate5 :=Datetostr(EnCodeDate(year,month,1));
    StrFeildName5 :='['+Inttostr(year)+'年'+Inttostr(month)+'月]';
    month :=month-I;
    if month<0 then
    begin
      month :=12+month;
      year :=year-1;
    end;

    StrDate6 :=Datetostr(EnCodeDate(year,month,1));
    StrFeildName6 :='['+Inttostr(year)+'年'+Inttostr(month)+'月]';
    month :=month-I;
    if month<0 then
    begin
      month :=12+month;
      year :=year-1;
    end;
    StrFeildName0 :='[下月预计]';
  end else
  begin
    I:=strtoint(PeriodDaysComboBox.Text);
    StrDate1 :=Datetostr(Date-I);
    StrFeildName1 :='[小于等于'+Inttostr(I*1)+'天]';

    StrDate2 :=Datetostr(Date-I*2);
    StrFeildName2 :='[早于'+Inttostr(I*1)+'至'+Inttostr(I*2)+'天]';

    StrDate3 :=Datetostr(Date-I*3);
    StrFeildName3 :='[早于'+Inttostr(I*2)+'至'+Inttostr(I*3)+'天]';

    StrDate4 :=Datetostr(Date-I*4);
    StrFeildName4 :='[早于'+Inttostr(I*3)+'至'+Inttostr(I*4)+'天]';

    StrDate5 :=Datetostr(Date-I*5);
    StrFeildName5 :='[早于'+Inttostr(I*4)+'至'+Inttostr(I*5)+'天]';

    StrDate6 :=Datetostr(Date-I*6);
    StrFeildName6 :='[早于'+Inttostr(I*5)+'天]';
    StrFeildName0 :='[下期预计]';
  end;

  Panel6.Visible :=True;
  Panel6.Repaint;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ExpenseList0')
        +' )) DROP TABLE #ExpenseList0 ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select *  '
     +' ,[费用金额] as '+StrFeildName6
     +' ,[费用金额] as '+StrFeildName5
     +' ,[费用金额] as '+StrFeildName4
     +' ,[费用金额] as '+StrFeildName3
     +' ,[费用金额] as '+StrFeildName2
     +' ,[费用金额] as '+StrFeildName1
     +' ,[费用金额] as [费用合计] '
     +' ,[费用金额] as '+StrFeildName0
     +' into #ExpenseList0 from #ExpenseList '
     +' where 1=2 ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' ALTER TABLE #ExpenseList0 ALTER COLUMN [参考数量] Float NULL  ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' ALTER TABLE #ExpenseList0 ALTER COLUMN [费用金额] Float NULL  ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' ALTER TABLE #ExpenseList0 ALTER COLUMN [费用合计] Float NULL  ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' ALTER TABLE #ExpenseList0 ALTER COLUMN '+StrFeildName6+' Float NULL  ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' ALTER TABLE #ExpenseList0 ALTER COLUMN '+StrFeildName5+' Float NULL  ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' ALTER TABLE #ExpenseList0 ALTER COLUMN '+StrFeildName4+' Float NULL  ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' ALTER TABLE #ExpenseList0 ALTER COLUMN '+StrFeildName3+' Float NULL  ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' ALTER TABLE #ExpenseList0 ALTER COLUMN '+StrFeildName2+' Float NULL  ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' ALTER TABLE #ExpenseList0 ALTER COLUMN '+StrFeildName1+' Float NULL  ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' ALTER TABLE #ExpenseList0 ALTER COLUMN '+StrFeildName0+' Float NULL  ';
  ADOQuery.ExecSQL;

  { ADOQuery.Close;
  ADOQuery.SQL.Text:=' Truncate Table #ExpenseList0 ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text:=' ALTER TABLE ABC3 DROP COLUMN [费用金额] ';
  ADOQuery.ExecSQL;}

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Insert into #ExpenseList0 ( '
    +' [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],                 '
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],           '
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注]               '
    +' , '+StrFeildName1
    +' ) select [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],'
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],'
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注],[费用金额]'
    +' from #ExpenseList  '
    +' where [日期]>='+Quotedstr(StrDate1);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Insert into #ExpenseList0 ( '
    +' [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],                 '
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],           '
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注]               '
    +' , '+StrFeildName2
    +' ) select [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],'
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],'
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注],[费用金额]'
    +' from #ExpenseList  '
    +' where [日期]>='+Quotedstr(StrDate2)
    +' and  [日期]<'+Quotedstr(StrDate1);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Insert into #ExpenseList0 ( '
    +' [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],                 '
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],           '
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注]               '
    +' , '+StrFeildName3
    +' ) select [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],'
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],'
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注],[费用金额]'
    +' from #ExpenseList  '
    +' where [日期]>='+Quotedstr(StrDate3)
    +' and  [日期]<'+Quotedstr(StrDate2);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Insert into #ExpenseList0 ( '
    +' [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],                 '
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],           '
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注]               '
    +' , '+StrFeildName4
    +' ) select [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],'
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],'
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注],[费用金额]'
    +' from #ExpenseList  '
    +' where [日期]>='+Quotedstr(StrDate4)
    +' and  [日期]<'+Quotedstr(StrDate3);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Insert into #ExpenseList0 ( '
    +' [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],                 '
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],           '
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注]               '
    +' , '+StrFeildName5
    +' ) select [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],'
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],'
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注],[费用金额]'
    +' from #ExpenseList  '
    +' where [日期]>='+Quotedstr(StrDate5)
    +' and  [日期]<'+Quotedstr(StrDate4);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Insert into #ExpenseList0 ( '
    +' [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],                 '
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],           '
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注]               '
    +' , '+StrFeildName6
    +' ) select [日期],[编号],[业务类别],[摘要],[费用名称],[受款人],'
    +' [经手人],[客户厂商],[资产名称],[项目名称],[部门名称],[地区名称],'
    +' [资产类别],[项目类别],[付款帐户],[票据号码],[业务备注],[附注],[费用金额]'
    +' from #ExpenseList  '
    +' where [日期]<'+Quotedstr(StrDate5);
//    +' and  [日期]<'+Quotedstr(StrDate5);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Update #ExpenseList0 set [费用合计]=( '
    +' Isnull('+StrFeildName6+',0) + '
    +' Isnull('+StrFeildName5+',0) + '
    +' Isnull('+StrFeildName4+',0) + '
    +' Isnull('+StrFeildName3+',0) + '
    +' Isnull('+StrFeildName2+',0) + '
    +' Isnull('+StrFeildName1+',0) ) '  ;
  ADOQuery.ExecSQL;
  Button7.Hint :='';
  Button7.Hint :=Button7.Hint+', '+'Sum(Isnull('+StrFeildName6+',0)) as '+StrFeildName6;
  Button7.Hint :=Button7.Hint+', '+'Sum(Isnull('+StrFeildName5+',0)) as '+StrFeildName5;
  Button7.Hint :=Button7.Hint+', '+'Sum(Isnull('+StrFeildName4+',0)) as '+StrFeildName4;
  Button7.Hint :=Button7.Hint+', '+'Sum(Isnull('+StrFeildName3+',0)) as '+StrFeildName3;
  Button7.Hint :=Button7.Hint+', '+'Sum(Isnull('+StrFeildName2+',0)) as '+StrFeildName2;
  Button7.Hint :=Button7.Hint+', '+'Sum(Isnull('+StrFeildName1+',0)) as '+StrFeildName1;
  Button7.Hint :=Button7.Hint+', '+'Sum(Isnull('+StrFeildName0+',0)) as '+StrFeildName0;
  Button7.Hint :=Button7.Hint+', '+'Sum(Isnull([费用合计],0)) as [费用合计]';
end;

end.
