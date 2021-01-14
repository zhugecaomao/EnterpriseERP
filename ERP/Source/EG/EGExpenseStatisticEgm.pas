unit EGExpenseStatisticEgm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, GEdit,
  DBCtrls, Menus, WNADOCQuery,TypInfo, scExcelExport;

type
  TEGExpenseStatisticEgmForm = class(TWSVoucherBrowseForm)
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
  EGExpenseStatisticEgmForm: TEGExpenseStatisticEgmForm;

implementation

uses CommonDM,QLDBFlt;

{$R *.dfm}

function TEGExpenseStatisticEgmForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TEGExpenseStatisticEgmForm.UpdateDBGrid;
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

procedure TEGExpenseStatisticEgmForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

procedure TEGExpenseStatisticEgmForm.FormActivate(Sender: TObject);
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#EGExpenseDM')
        +' )) DROP TABLE #EGExpenseDM ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #EGExpenseDM  ('
    +' [pid] [int] IDENTITY (1, 1) NOT NULL ,'
    +' [id] [int] NULL ,'
    +' [Date] [datetime] NULL ,[Code] [varchar] (20)  ,    '
    +' [ClientID] [int] NULL , [EmployeeID] [int] NULL ,   '
    +' [BillMode] [varchar] (16)  ,[ModeDC] [int] NULL ,   '
    +' [ModeC] [int] NULL ,[Brief] [varchar] (30)  ,       '
    +' [GoodsID] [int] NULL ,[GoodsSpec] [varchar] (30)  , '
    +' [Quantity] [float] NULL ,[QuantityPcs] [float] NULL,      '
    +' [Discount] [float] NULL , [PriceCost] [float] NULL , '
    +' [PackUnitID] [int] NULL ,[PriceBase] [money] NULL ,       '
    +' [Amount] [float] NULL ,[GoalUnitID] [int] NULL ,          '
    +' [GoalQuantity] [float] NULL ,[Client] [varchar] (50)  NULL ,       '
    +' [Employee] [varchar] (30)  NULL, [Goods] [varchar] (30)  NULL ,    '
    +' [GoodsClass] [varchar] (30)  NULL ,[DAArea] [varchar] (30)  NULL , '
    +' [Unit] [varchar] (20)  NULL , '
    +' [WareHouse] [varchar] (30)  NULL , '
    +' [GrossProfit ] [float] NULL  ) '    ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #EGExpenseDM';
  ADOQuery.ExecSQL;
  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' INSERT INTO #EGExpenseDM ('
    +' ID,Date,Code,ClientID,EmployeeID,                         '
    +' BillMode,ModeDC,ModeC,Brief,                             '
    +' GoodsID,GoodsSpec, Quantity,QuantityPcs,PackUnitID,      '
    +' PriceBase,Amount,GoalUnitID,GoalQuantity,Discount,PriceCost,'
    +' [Client],[Employee],[Goods],[GoodsClass],[DAArea],  '
    +' [Unit],[WareHouse] )'
    +' select  b.id,b.Date,b.Code,b.ClientID,b.EmployeeID,           '
    +' b.BillMode,b.ModeDC,b.ModeC,b.Brief,                     '
    +' a.GoodsID,a.GoodsSpec, a.Quantity,a.QuantityPcs,a.PackUnitID, '
    +' a.PriceBase,a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1),'
    +' a.GoalUnitID,a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) , Discount,PriceCost,'
    +' c.name Client,d.Name Employee,e.Name Goods,f.Name GoodsClass, '
    +' g.Name DAArea,h.name Unit ,j.name WareHouse'
    +' from EGExpenseDetail  AS a                                       '
    +' LEFT OUTER JOIN EGExpensemaster as b  on a.MasterID=b.id         '
    +' LEFT OUTER JOIN DAProject     as c  on b.ClientID=c.id         '
    +' LEFT OUTER JOIN MSEmployee   as d  on b.EmployeeID=d.id       '
    +' LEFT OUTER JOIN DAExpenseClass      as e  on a.GoodsID=e.id          '
    +' LEFT OUTER JOIN DAExpenseClass as f  on e.Upid=f.id     '
    +' LEFT OUTER JOIN DAarea       as g  on c.ProjectClassID=g.id           '
    +' LEFT OUTER JOIN MSUnit       as h  on a.GoalUnitID=h.id       '
    +' LEFT OUTER JOIN STWareHouse  as j  on b.WareHouseID=j.id       '
    +' where b.Recordstate<>'+Quotedstr('删除')
    +' and GoodsID<>0 and not GoodsID is null'
    +' and Amount<>0 ' ;
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
    +' [WareHouse] [varchar] (30)  NULL , '
    +' [Unit] [varchar] (20)  NULL )' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :='select max(date) MDate  from EGExpenseMaster '
        +' WHERE RecordState<>'+Quotedstr('删除');
  ADOQuery.Open;
  if ADOQuery.FieldByName('MDate').IsNull then WhereStr :=Datetostr(date)
    else WhereStr :=Trim(ADOQuery.fieldbyname('MDate').AsString);
  Memo1.ReadOnly :=False;
  Memo1.Clear;
  Memo1.Text :=' 日期 等于'+ Quotedstr(WhereStr);
  Memo1.ReadOnly :=True;
  WhereStr :=' where date='+Quotedstr(WhereStr);
  Button1Click(sender);
  UpdateDBGrid;
  Button1.SetFocus;
end;

procedure TEGExpenseStatisticEgmForm.N1Click(Sender: TObject);
var E:string;
begin
  if adsMaster.IsEmpty then exit;
end;

procedure TEGExpenseStatisticEgmForm.DBGridDblClick(Sender: TObject);
begin
// inherited;
end;


procedure TEGExpenseStatisticEgmForm.Button3Click(Sender: TObject);
begin
  inherited;
  WNADOCQuery1.TabName :='TempSaleMD';
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

procedure TEGExpenseStatisticEgmForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if not CheckBox1.Checked and
     not CheckBox3.Checked and not CheckBox2.Checked
     and not CheckBox4.Checked 
     then    CheckBox1.Checked:=not CheckBox1.Checked;
end;

procedure TEGExpenseStatisticEgmForm.Button1Click(Sender: TObject);
var I :integer;
begin
  inherited;
  Button1.Tag :=1;
  Panel6.Visible :=True;
  Panel6.Repaint;
  adsMaster.Close;
  adsMaster.CommandText:=' select date [日期], '
  +' code [编号],BillMode [业务类型], '
  +' Client [项目名称], Goods [项目费用名称], '
  +' Amount [金额], '
  +' Employee [业务经办]  from #EGExpenseDM    '
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

procedure TEGExpenseStatisticEgmForm.Button2Click(Sender: TObject);
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
    SelectStr :=SelectStr+' Client [项目名称] ,';
    GroupStr :=GroupStr+' Client , ';
  end;
  if CheckBox2.Checked then
  begin
    SelectStr :=SelectStr+' Goods [项目费用名称] ,' ;
    GroupStr :=GroupStr+' Goods , '             ;
  end;
  if CheckBox3.Checked then
  begin
    SelectStr :=SelectStr+' Employee [业务经办],' ;
    GroupStr :=GroupStr+' Employee , '            ;
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

procedure TEGExpenseStatisticEgmForm.adsMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  adsMaster.IndexFieldNames := '';
end;

procedure TEGExpenseStatisticEgmForm.ExportActionExecute(Sender: TObject);
begin
  hint :='统计条件:' +Memo1.Text;
  caption :=caption+'报表';
  inherited;
end;

end.
