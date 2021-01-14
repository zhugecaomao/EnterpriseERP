unit YDStatisticReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, GEdit,
  DBCtrls, Menus, WNADOCQuery,TypInfo, CheckLst;

type
  TYDStatisticReportForm = class(TWSVoucherBrowseForm)
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
  YDStatisticReportForm: TYDStatisticReportForm;

implementation

uses CommonDM,QLDBFlt,WSSecurity,QLRptBld,SLRpCheckReckoning;
//CommonDM, QLDBFlt, QLRptBld, SLRpCheckReckoning;
{$R *.dfm}

function TYDStatisticReportForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TYDStatisticReportForm.UpdateDBGrid;
var I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '�ϼ�:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    for I := 0 to Columns.Count - 1 do
    begin
      Columns[i].Width :=90;
      if Pos('��',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Pos('��',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      begin
        if (not CheckBox1.Checked) and (Pos('����',Columns[I].FieldName)>0 )
             then Columns[I].Visible :=False;
        if (not CheckBox2.Checked) and  (Pos('����',Columns[I].FieldName)>0 )
             then Columns[I].Visible :=False;
        if (not CheckBox3.Checked) and  (Pos('���',Columns[I].FieldName)>0 )
             then Columns[I].Visible :=False;
        SetStrProp(Fields[I], 'DisplayFormat','#,#.00') ;
        if Pos('Price',Columns[I].FieldName)<=0 then
           Columns[I].Footer.ValueType := fvtSum;
      end;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TYDStatisticReportForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

procedure TYDStatisticReportForm.DBGridDblClick(Sender: TObject);
begin
// inherited;
end;


procedure TYDStatisticReportForm.Button3Click(Sender: TObject);
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
     Memo1.Text :='ȫ������������: '
     +Copy(trim(WNADOCQuery1.ShowTerm.Text),5,length(trim(WNADOCQuery1.ShowTerm.Text))-4 )
     else Memo1.Text :=Copy(trim(WNADOCQuery1.ShowTerm.Text),5,length(trim(WNADOCQuery1.ShowTerm.Text))-4);
  if WhereStr =' Where 1=1 ' then
    begin
      Memo1.Clear;
      Memo1.Text :='����������!';
    end;
  Memo1.ReadOnly :=True;
  ToolBar.Hint :=' ̨������: '+Memo1.Text;
  if Button1.Tag=1 then Button1Click(sender)
    else Button2Click(sender);
end;

procedure TYDStatisticReportForm.FormShow(Sender: TObject);
var I :integer;
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ExpenseList')
        +' )) DROP TABLE #ExpenseList ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select b.Date [����], '
      +' b.Code [���],                        '
      +' b.BillMode [ҵ�����],                '
      +' b.Brief [ժҪ],                       '
      +' c.name  [�������],                   '
      +' d.name  [������] ,                    '
      +' b.ClearDate [��������] ,              '
      +' b.memo  [��ע],                       '
      +' e.name [��Ʒ����],                    '
      +' a.GoodsSpec [����ͺ�],               '
      +' g.name [��׼��λ],                    '
      +' Isnull(a.Quantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [��װ����],     '
      +' f.name     [��װ��λ],                '
      +' a.PriceBase [��װ����],               '
      +' Isnull(a.GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [����׼����],        '
      +' a.PriceGoal [����׼����],                '
      +' a.PriceGoal [�����׼����],            '
      +' a.PriceGoal [�����׼����],                '
      +' Isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [���],                  '
      +' h.name [��Ʒ���],                    '
      +' i.name [��������],                    '
      +' a.memo [��ע]                         '
      +' into #ExpenseList '
      +' from YDGoodsInDetail a                   '
      +' left outer join YDGoodsInMaster     b on b.ID=a.MasterID      '
      +' left outer join MSEmployee         c on c.ID=b.ClientID      '
      +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
      +' left outer join DAGoods          e on e.ID=a.GoodsID       '
      +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
      +' left outer join MSUnit           g on g.ID=e.UnitID    '
      +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
      +' left outer join MSDepartment     i on i.ID=c.DepartmentID    '
      +' left outer join STWareHouse      j on j.ID=b.WarehouseID     '
      +' where b.RecordState<>'+ Quotedstr('ɾ��')
      +' and isnull(a.GoodsID,0)<>0 '
      +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL;


  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #ExpenseList ( '
    +' [����], [���],[ҵ�����],[ժҪ], [�������],'
    +' [������] ,[��������] , [��ע],    '
    +' [��Ʒ����], [����ͺ�], [��׼��λ], '
    +' [��װ����],[��װ��λ],[��װ����], [���],'
    +' [�����׼����], [�����׼����], '
    +' [��Ʒ���],[��������],[��ע]  )  '
    +' select b.Date [����], b.Code [���], b.BillMode [ҵ�����], '
    +' b.Brief [ժҪ], c.name  [�������], d.name  [������] ,  '
    +' b.ClearDate [��������] , b.memo  [��ע],'
    +' e.name [��Ʒ����], a.GoodsSpec [����ͺ�], g.name [��׼��λ], '
    +' Isnull(a.Quantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)*(-1) [��װ����],     '
    +' f.name     [��װ��λ],                '
    +' a.PriceBase [��װ����],               '
    +' Isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)*(-1) [���],                  '
    +' Isnull(a.GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [�����׼����],        '
    +' a.PriceGoal [�����׼����],                '
    +' h.name [��Ʒ���],                    '
    +' i.name [��������],                    '
    +' a.memo [��ע]                         '
    +' from YDGoodsOutDetail a                   '
    +' left outer join YDGoodsOutMaster     b on b.ID=a.MasterID      '
    +' left outer join MSEmployee         c on c.ID=b.ClientID      '
    +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
    +' left outer join DAGoods          e on e.ID=a.GoodsID       '
    +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
    +' left outer join MSUnit           g on g.ID=e.UnitID    '
    +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
    +' left outer join MSDepartment     i on i.ID=c.DepartmentID    '
    +' left outer join STWareHouse      j on j.ID=b.WarehouseID     '
    +' where b.RecordState<>'+ Quotedstr('ɾ��')
    +' and isnull(a.GoodsID,0)<>0 '
    +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL;

  {
  if Guarder.UserName<>'ϵͳ����Ա' then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' delete from #ExpenseList '
        +' where [��������] not in ( select b.name  '
        +' from MSRolePermissions a '
        +' left outer join MSPermission b on b.ID=a.PermissionID '
        +' where b.PermissionClass='+Quotedstr('X-�鿴����')
        +' and a.RoleID= '+ inttostr(Guarder.UserID)+' ) ';
    ADOQuery.ExecSQL;
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' delete from #ExpenseList '
        +' where [������] not in ( select b.name  '
        +' from MSRolePermissions a '
        +' left outer join MSPermission b on b.ID=a.PermissionID '
        +' where b.PermissionClass='+Quotedstr('Y-�鿴ҵ��')
        +' and a.RoleID= '+ inttostr(Guarder.UserID)+' ) ';
    ADOQuery.ExecSQL;
  end;   }

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
  Memo1.Text :='����������!';
  SelectStr :='';



end;

procedure TYDStatisticReportForm.Button1Click(Sender: TObject);
begin
  Panel6.Visible :=True;
  Panel6.Repaint;
  Button1.Tag:=1 ;
  adsMaster.Close;
  adsMaster.CommandText:=' select * from #ExpenseList'+WhereStr
      +' order by [����], [���]' ;
//  showmessage(adsMaster.CommandText);
  adsMaster.open;
  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='';
end;

procedure TYDStatisticReportForm.FormActivate(Sender: TObject);
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :='select max(����) MDate  from #ExpenseList ';
  ADOQuery.Open;
  if ADOQuery.FieldByName('MDate').IsNull then WhereStr :=Datetostr(date)
    else WhereStr :=Trim(ADOQuery.fieldbyname('MDate').AsString);
  Memo1.ReadOnly :=False;
  Memo1.Clear;
  Memo1.Text :=' ���� ����'+ Quotedstr(WhereStr);
  Memo1.ReadOnly :=True;
  WhereStr :=' where [����]='+Quotedstr(WhereStr);
  Button1Click(sender);
end;

procedure TYDStatisticReportForm.Button2Click(Sender: TObject);
var I :integer;
    SelectStr1:String;
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
    +' into #ExpenseListTtl from #ExpenseList  '
    +WhereStr +' group by '+SelectStr1;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ExpenseListTtl2')
        +' )) DROP TABLE #ExpenseListTtl2 ' ;
  ADOQuery.ExecSQL;



  ADOQuery.Close;
  ADOQuery.SQL.Text:=' select *,[���] [����������],[���] [��浥��] '
    +' into #ExpenseListTtl2  from #ExpenseListTtl ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Update #ExpenseListTtl2 set '
    +' [����������] =Isnull([�����׼����],0)-Isnull([����׼����],0) ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Update #ExpenseListTtl2 set '
    +' [��浥��] =null ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Update #ExpenseListTtl2 set '
    +' [��浥��] =[���]/[����������] where isnull([����������],0) <>0 ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text:=' Update #ExpenseListTtl2 set '
    +' [��װ����] =[���]/[��װ����] where isnull([��װ����],0) <>0 ';
  ADOQuery.ExecSQL;



  adsMaster.Close;
  adsMaster.CommandText:=' select * from #ExpenseListTtl2 ';
  adsMaster.open;


  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='������Ŀ:'+SelectStr1;
end;

procedure TYDStatisticReportForm.N1Click(Sender: TObject);
begin
  ExpSttcCheckListBox.Sorted :=not ExpSttcCheckListBox.Sorted;
end;

procedure TYDStatisticReportForm.N2Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=not ExpSttcCheckListBox.Checked[I];
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TYDStatisticReportForm.N3Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=True;
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TYDStatisticReportForm.N4Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=False;
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TYDStatisticReportForm.adsMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  adsMaster.IndexFieldNames := '';
end;

procedure TYDStatisticReportForm.DateTimePicker2Exit(Sender: TObject);
begin
  inherited;
  if DateTimePicker1.Date>DateTimePicker2.Date then
    DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TYDStatisticReportForm.DateTimePicker1Exit(Sender: TObject);
begin
  inherited;
  if DateTimePicker1.Date>DateTimePicker2.Date then
    DateTimePicker2.Date :=DateTimePicker1.Date;
end;

procedure TYDStatisticReportForm.Button4Click(Sender: TObject);
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

procedure TYDStatisticReportForm.Button6Click(Sender: TObject);
begin
  inherited;
  Panel2.Enabled :=True;
  DBGrid.Enabled :=True;
  VipsetPanel.Visible :=False;
end;

procedure TYDStatisticReportForm.Button5Click(Sender: TObject);
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
    +' where [����] >='+Quotedstr(Datetostr(DateTimePicker1.Date))
    +' and [����] <='+Quotedstr(Datetostr(DateTimePicker2.Date));
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Insert into  #ExpenseList0 '
    +' ([����],[���],[ҵ�����],[�ͻ�����],[���۽��],[������],[�ۿ۷������] )'
    +' select '+Quotedstr(Datetostr(DateTimePicker1.Date-1))
    +' as [����],'+Quotedstr('----')+' , '+Quotedstr('�ڳ���ת')+' , '
    +' [�ͻ�����], sum(isnull([���۽��],0)) [���۽��] , '
    +' sum(isnull([������],0)) [������] , '
    +' sum(isnull([�ۿ۷������],0)) [�ۿ۷������]  '
    +' from #ExpenseList '
    +' where [����] <'+Quotedstr(Datetostr(DateTimePicker1.Date))
    +' Group by [�ͻ�����]' ;
  ADOQuery.ExecSQL ;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Insert into  #ExpenseList0 '
    +' ( [�ͻ�����],[����],[���],[ҵ�����] )'
    +' select Distinct [�ͻ�����],  '
    + Quotedstr(Datetostr(DateTimePicker1.Date-1))
    +' as [����],'+Quotedstr('----')+' , '+Quotedstr('�ڳ���ת')
    +' from #ExpenseList '
    +' where [�ͻ�����] not in ( select distinct [�ͻ�����] from #ExpenseList0  '
    +' where [ҵ�����]='+ Quotedstr('�ڳ���ת')+' ) '    ;
  ADOQuery.ExecSQL ;



  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Insert into  #ExpenseList0 '
    +' ([����],[���],[ҵ�����],[�ͻ�����],[���۽��] )'
    +' select '+Quotedstr(Datetostr(DateTimePicker1.Date-1))
    +' as [����],'+Quotedstr('----')+' , '+Quotedstr('�ڳ���ת')+' , '
    +' [�ͻ�����],sum(0.00) [���۽��] '
    +' from #ExpenseList '
    +' where [�ͻ�����] not in ( select [�ͻ�����] from #ExpenseList0 where '
    +' [����]< '+Quotedstr(Datetostr(DateTimePicker1.Date)) + ' )'
    +' group by [�ͻ�����] ';
  ADOQuery.ExecSQL ;


  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
    +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ExpenseList')
    +' )) DROP TABLE #ExpenseList' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select * into #ExpenseList from #ExpenseList0'
    +' where [����] is not null '
    +' order by [����]  ' ;
  ADOQuery.ExecSQL;
  if Button1.Tag=1 then Button1Click(sender)
    else Button2Click(sender);
end;

procedure TYDStatisticReportForm.ExpSttcCheckListBoxClickCheck(
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

procedure TYDStatisticReportForm.ClientAccountLiastClick(Sender: TObject);
var BalanceF:real;
begin
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select * from #ExpenseList where [ҵ�����]='+Quotedstr('�ڳ���ת');
  ADOQuery.Open;
  if ADOQuery.IsEmpty then
  begin
    ShowMessage('���ڡ��߼�..�����ö������ڣ���ȷ��������ִ�д˹���!');
//    Button4.OnClick(sneder);
    Exit;
  end;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select distinct [�ͻ�����] from #ExpenseList ' + WhereStr;
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
	+' [����] [datetime] NULL ,              '
	+' [���] [varchar] (20)  NULL ,         '
	+' [ҵ�����] [varchar] (16) NULL ,      '
	+' [���۽��] [Float] NULL ,      '
	+' [�ؿ���] [Float] NULL ,      '
	+' [���] [Float] NULL ,        '
	+' [��ע] [varchar] (30)  NULL     '
	+' )  ';
    ADOQuery2.ExecSQL;
//    ADOQuery2.Close;
//    ADOQuery2.SQL.Text :=' Truncate TABLE #ClientAccountList ';
//    ADOQuery2.ExecSQL;
    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' Insert Into #ClientAccountList ( '
      +'        [����],[���],[ҵ�����],[���۽��],[�ؿ���] )'
      +' select [����],[���],[ҵ�����],'
      +' sum(isnull([���۽��],0)) as [���۽��] , '
      +' sum(isnull([������],0)) as [�ؿ���] '
      +' from #ExpenseList '
      +' where [�ͻ�����]='+Quotedstr(ADOQuery.FieldByName('�ͻ�����').AsString)
      +' Group by [����],[���],[ҵ�����] '
      +' order by [����]';
    ADOQuery2.ExecSQL;

    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' Insert Into #ClientAccountList ( '
      +'        [����],[���],[ҵ�����],[�ؿ���] )'
      +' select [����],[���],[ҵ�����],'
      +' sum(isnull([�ۿ۷������],0)) as  [�ؿ���] '
      +' from #ExpenseList '
      +' where [�ͻ�����]='+Quotedstr(ADOQuery.FieldByName('�ͻ�����').AsString)
      +' and isnull([�ۿ۷������],0)<>0  '
      +' Group by [����],[���],[ҵ�����] '
      +' order by [����]';
    ADOQuery2.ExecSQL;

    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' select * from  #ClientAccountList order by [����],[ID]';
    ADOQuery2.open;
    ADOQuery2.First;
    BalanceF := 0;
    BalanceF := BalanceF+ ADOQuery2.FieldByName('���۽��').AsFloat-
         ADOQuery2.FieldByName('�ؿ���').AsFloat;
    ADOQuery2.Edit;
    ADOQuery2.FieldByName('���۽��').AsFloat :=0;
    ADOQuery2.FieldByName('�ؿ���').AsFloat :=0;
    while not ADOQuery2.Eof do
    begin
      BalanceF := BalanceF+ ADOQuery2.FieldByName('���۽��').AsFloat-
         ADOQuery2.FieldByName('�ؿ���').AsFloat;
      ADOQuery2.Edit;
      ADOQuery2.FieldByName('���').AsFloat :=BalanceF;
      ADOQuery2.Next;
    end;
    AccountListQry.Close;
    AccountListQry.SQL.Text :=' select [����],[���],[ҵ�����],[���۽��], '
      +'  [�ؿ���],[���],[��ע] '
      +' from  #ClientAccountList order by [ID] ';
    AccountListQry.open;

//    tfloatfield.ADOQuery2.
    DataSource1.DataSet := AccountListQry;
    DBGrid1.DataSource :=  DataSource1;
//    DBGrid1.Visible :=True;
//    ShowMessage('��鿴--'+ADOQuery.FieldByName('�ͻ�����').AsString+' --���ʽ��!');
    //�ڴ�ѭ����ӡ���ʵ��������ɺ���Խ� DBGrid1��DataSource1ɾ��
    with TQLDBGridReportBuilder.Create(Self) do
    try
      DBGrid := DBGrid1;
      AutoWidth := True;
      Report := TSLCheckReckoningReport.Create(Self);
      TSLCheckReckoningReport(Report).qrdbtClientName.DataSet := ADOQuery;
      TSLCheckReckoningReport(Report).qrlCheckCourse.Caption :=
        '�����ڼ�: ' + DateToStr(DateTimePicker1.Date) + ' ~ ' +
        DateToStr(DateTimePicker2.Date);
      SummaryFields.Add('���۽��=SUM([���۽��])');
      SummaryFields.Add('�ؿ���=SUM([�ؿ���])');
      SummaryFields.Add('���='+floattostr(BalanceF));
      AutoOrientation := False;
      Active := True;
  //    InitReport(TQuickRep(Report));
      Report.PreviewModal;
  //    if Preview then Report.PreviewModal
  //    else begin
  //      if ShowSetupDialog then Report.PrinterSetup;
  //      Report.Print;
  //    end;
    finally
      Free;
    end;


    ADOQuery.Next;
//    DBGrid1.Visible :=False;
  end;
end;

procedure TYDStatisticReportForm.adsMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefreshAvailableFields;
end;

end.