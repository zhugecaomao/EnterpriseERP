unit SLSaleForeCast;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, GEdit,
  DBCtrls, Menus, WNADOCQuery,TypInfo;

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
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    TempAds: TADODataSet;
    WNADOCQuery1: TWNADOCQuery;
    Panel3: TPanel;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Button2: TButton;
    Button3: TButton;
    RadioGroup1: TRadioGroup;
    Panel7: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    RadioGroup2: TRadioGroup;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    GroupBox2: TGroupBox;
    DateTimePicker1: TDateTimePicker;
    Panel8: TPanel;
    RadioGroup3: TRadioGroup;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    ToolButton1: TToolButton;
    TempAdsClientID: TIntegerField;
    TempAdsname: TStringField;
    TempAdsClient: TStringField;
    TempAdsEmployee: TStringField;
    TempAdsPeriodA: TBCDField;
    TempAdsPeriodB: TBCDField;
    TempAdsPeriodC: TBCDField;
    TempAdsPeriodD: TBCDField;
    TempAdsPeriodE: TBCDField;
    TempAdsPeriodF: TBCDField;
    TempAdsPeriodG: TBCDField;
    TempAdsPeriodTTL: TBCDField;
    procedure UpdateDBGrid;
    procedure DBGridTitleClick(Column: TColumn);
    procedure FormActivate(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure RadioButton5Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ShowReslut;
    procedure adsMasterBeforeOpen(DataSet: TDataSet);
    procedure CheckBox4Click(Sender: TObject);
    procedure adsMasterAfterOpen(DataSet: TDataSet);

  private
    { Private declarations }
    WhereStr :string;
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


procedure TSLSaleForeCastForm.UpdateDBGrid;
var I: Integer;
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
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      if Pos('Price',Columns[I].FieldName)<=0 then
        Columns[I].Footer.ValueType := fvtSum;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TSLSaleForeCastForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
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
    +' [pid] [int] IDENTITY (1, 1) NOT NULL ,'
    +' [id] [int] NULL ,'
    +' [Date] [datetime] NULL ,[Code] [varchar] (20)  ,    '
    +' [ClientID] [int] NULL , [EmployeeID] [int] NULL ,   '
    +' [BillMode] [varchar] (16)  ,[ModeDC] [int] NULL ,   '
    +' [ModeC] [int] NULL ,[Brief] [varchar] (30)  ,       '
    +' [GoodsID] [int] NULL ,[GoodsSpec] [varchar] (30)  , '
    +' [Quantity] [float] NULL ,[QuantityPcs] [float] NULL,      '
    +' [PackUnitID] [int] NULL ,[PriceBase] [money] NULL ,       '
    +' [Amount] [float] NULL ,[GoalUnitID] [int] NULL ,          '
    +' [PriceCost] [float] NULL  ,       '
    +' [GoalQuantity] [float] NULL ,[Client] [varchar] (50)  NULL ,       '
    +' [Employee] [varchar] (30)  NULL, [Goods] [varchar] (60)  NULL ,    '
    +' [GoodsClass] [varchar] (30)  NULL ,[DAArea] [varchar] (30)  NULL , '
    +' [Unit] [varchar] (20)  NULL )' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #SLSaleDM';
  ADOQuery.ExecSQL;

  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' INSERT INTO #SLSaleDM ('
    +' ID,Date,Code,ClientID,EmployeeID,                         '
    +' BillMode,ModeDC,ModeC,Brief,                             '
    +' GoodsID,GoodsSpec, Quantity,QuantityPcs,PackUnitID,      '
    +' PriceBase,Amount,GoalUnitID,GoalQuantity,PriceCost, '
    +' [Client],[Employee],[Goods],[GoodsClass],[DAArea],  '
    +' [Unit] )'
    +' select  b.id,b.Date,b.Code,b.ClientID,b.EmployeeID,           '
    +' b.BillMode,b.ModeDC,b.ModeC,b.Brief,                     '
    +' a.GoodsID,a.GoodsSpec, a.Quantity,a.QuantityPcs,a.PackUnitID, '
    +' a.PriceBase,a.Amount,a.GoalUnitID,a.GoalQuantity , a.PriceCost,  '
    +' c.name Client,d.Name Employee,e.Name Goods,f.Name GoodsClass, '
    +' g.Name DAArea,h.name Unit '
    +' from SLSaleDetail  AS a                                       '
    +' LEFT OUTER JOIN SLSalemaster as b  on a.MasterID=b.id         '
    +' LEFT OUTER JOIN DAClient     as c  on b.ClientID=c.id         '
    +' LEFT OUTER JOIN MSEmployee   as d  on b.EmployeeID=d.id       '
    +' LEFT OUTER JOIN DAGoods      as e  on a.GoodsID=e.id          '
    +' LEFT OUTER JOIN DAGoodsClass as f  on e.GoodsClassID=f.id     '
    +' LEFT OUTER JOIN DAarea       as g  on c.AreaID=g.id           '
    +' LEFT OUTER JOIN MSUnit       as h  on E.UnitID=h.id       '
    +' where b.Recordstate<>'+Quotedstr('删除')
    +' and GoodsID<>0 and not GoodsID is null' ;
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
    +' [Employee] [varchar] (30)  NULL ,[Goods] [varchar] (60)  NULL , '
    +' [GoodsClass] [varchar] (30)  NULL ,[DAArea] [varchar] (30)  NULL , '
    +' [Unit] [varchar] (20)  NULL )' ;
//  Memo1.Text :=  ADOQuery.SQL.Text;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#SLSalePeriodDM')
        +' )) DROP TABLE #SLSalePeriodDM ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #SLSalePeriodDM  ('
    +' [pid] [int] IDENTITY (1, 1) NOT NULL, '
    +' [Client] [varchar] (50)  NULL,        '
    +' [Employee] [varchar] (30)  NULL,  '
    +' [Goods] [varchar] (60)  NULL,     '
//数量[QttA],金额[AmtA], 毛利[PftA] ,
    +' [QttA] [float] NULL,[AmtA] [float] NULL,[PftA] [float] NULL,'
    +' [QttB] [float] NULL,[AmtB] [float] NULL,[PftB] [float] NULL,'
    +' [QttC] [float] NULL,[AmtC] [float] NULL,[PftC] [float] NULL,'
    +' [QttD] [float] NULL,[AmtD] [float] NULL,[PftD] [float] NULL,'
    +' [QttE] [float] NULL,[AmtE] [float] NULL,[PftE] [float] NULL,'
    +' [QttF] [float] NULL,[AmtF] [float] NULL,[PftF] [float] NULL,'
//预计销量G,当前库存H,采购订货结余I,销售订单结余J,预计订货K
    +' [QttG] [float] NULL,[AmtG] [float] NULL,[QttH] [float] NULL, '
    +' [QttI] [float] NULL,[QttJ] [float] NULL,[QttK] [float] NULL )' ;
  ADOQuery.ExecSQL;
//  WhereStr :=Quotedstr(Datetostr(date));
  Memo1.ReadOnly :=False;
  Memo1.Clear;
  Memo1.Text :=' 不限制条件';
  Memo1.ReadOnly :=True;
//  WhereStr :=' where 1=1';
  Button2Click(Sender);
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


procedure TSLSaleForeCastForm.Button3Click(Sender: TObject);
begin
  inherited;
  WNADOCQuery1.TabName :='TempSaleMD';
  WNADOCQuery1.ConnectionString :=CommonData.acnConnection.ConnectionString;
  WNADOCQuery1.Execute(False);
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
  Button2Click(Sender);
end;

procedure TSLSaleForeCastForm.Button2Click(Sender: TObject);
var I,J :integer;
    ExcWhereStr,GroupStr:String;
begin
  inherited;
  Panel8.Visible :=true;
  Panel8.Repaint;
  I:=strtoint(ComboBox1.Text);
  if I<=0 then I :=7;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #SLSalePeriodDM';
  ADOQuery.ExecSQL;
//第一时段
  if RadioButton4.Checked then
     ExcWhereStr :=WhereStr + 'AND  DATEDIFF(Month,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )=5'
    else
     ExcWhereStr :=WhereStr + 'AND  DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )>='
       +InttoStr(I*5)+' and '
       +' DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )<'
       +InttoStr(I*6);
  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' INSERT INTO #SLSalePeriodDM ('
    +' [Client],[Employee],[Goods],'
    +' [QttA],[AmtA], [PftA])'
    +' SELECT [Client],[Employee],[Goods], '
    +' [GoalQuantity],[Amount],Amount-PriceCost*GoalQuantity '
    +' FROM #SLSaleDM'+ExcWhereStr;
  ADOQuery.ExecSQL;
//第二时段
  if RadioButton4.Checked then
     ExcWhereStr :=WhereStr + 'AND DATEDIFF(Month,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )=4'
    else
     ExcWhereStr :=WhereStr + 'AND DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )>='
       +InttoStr(I*4)+' and '
       +' DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )<'
       +InttoStr(I*5);
  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' INSERT INTO #SLSalePeriodDM ('
    +' [Client],[Employee],[Goods],'
    +' [QttB],[AmtB], [PftB])'
    +' SELECT [Client],[Employee],[Goods], '
    +' [GoalQuantity],[Amount],Amount-PriceCost*GoalQuantity '
    +' FROM #SLSaleDM'+ExcWhereStr;
  ADOQuery.ExecSQL;
//第三时段
  if RadioButton4.Checked then
     ExcWhereStr :=WhereStr + 'AND  DATEDIFF(Month,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )=3'
    else
     ExcWhereStr :=WhereStr + 'AND  DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )>='
       +InttoStr(I*3)+' and '
       +' DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )<'
       +InttoStr(I*4);
  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' INSERT INTO #SLSalePeriodDM ('
    +' [Client],[Employee],[Goods],'
    +' [QttC],[AmtC], [PftC])'
    +' SELECT [Client],[Employee],[Goods], '
    +' [GoalQuantity],[Amount],Amount-PriceCost*GoalQuantity '
    +' FROM #SLSaleDM'+ExcWhereStr;
  ADOQuery.ExecSQL;
//第四时段
  if RadioButton4.Checked then
     ExcWhereStr :=WhereStr + 'AND  DATEDIFF(Month,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )=2'
    else
     ExcWhereStr :=WhereStr + 'AND  DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )>='
       +InttoStr(I*2)+' and '
       +' DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )<'
       +InttoStr(I*3);
  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' INSERT INTO #SLSalePeriodDM ('
    +' [Client],[Employee],[Goods],'
    +' [QttD],[AmtD], [PftD] )'
    +' SELECT [Client],[Employee],[Goods], '
    +' [GoalQuantity],[Amount],Amount-PriceCost*GoalQuantity '
    +' FROM #SLSaleDM'+ExcWhereStr;
  ADOQuery.ExecSQL;
//第五时段
  if RadioButton4.Checked then
     ExcWhereStr :=WhereStr + 'AND  DATEDIFF(Month,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )=1'
    else
     ExcWhereStr :=WhereStr + 'AND  DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )>='
       +InttoStr(I*1)+' and '
       +' DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )<'
       +InttoStr(I*2);
  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' INSERT INTO #SLSalePeriodDM ('
    +' [Client],[Employee],[Goods],'
    +' [QttE],[AmtE], [PftE])'
    +' SELECT [Client],[Employee],[Goods], '
    +' [GoalQuantity],[Amount],Amount-PriceCost*GoalQuantity '
    +' FROM #SLSaleDM'+ExcWhereStr;
  ADOQuery.ExecSQL;
//第六时段
  if RadioButton4.Checked then
     ExcWhereStr :=WhereStr + 'AND  DATEDIFF(Month,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )=0'
    else
     ExcWhereStr :=WhereStr + 'AND  DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )>='
       +InttoStr(I*0)+' and '
       +' DATEDIFF(day,Date,'+Quotedstr(Datetostr(DateTimePicker1.date))+' )<'
       +InttoStr(I*1);
  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' INSERT INTO #SLSalePeriodDM ('
    +' [Client],[Employee],[Goods],'
    +' [QttF],[AmtF], [PftF])'
    +' SELECT [Client],[Employee],[Goods], '
    +' [GoalQuantity],[Amount],Amount-PriceCost*GoalQuantity '
    +' FROM #SLSaleDM'+ExcWhereStr;
//  showmessage();
  ADOQuery.ExecSQL;

  ADOQuery.Close;  //
  ADOQuery.SQL.Text :=' Update #SLSalePeriodDM Set '
    +' [QttG]=(ISNULL(QttA,0)+ISNULL(QttB,0)+ISNULL(QttC,0)'
    +' +ISNULL(QttD,0)+ISNULL(QttE,0)+ISNULL(QttF,0))/6 , '
    +' [AmtG]=(ISNULL(AmtA,0)+ISNULL(AmtB,0)+ISNULL(AmtC,0)'
    +' +ISNULL(AmtD,0)+ISNULL(AmtE,0)+ISNULL(AmtF,0))/6' ;
  ADOQuery.ExecSQL;
  Panel8.Visible :=False;
  ShowReslut;
  J:=-1;
  with adsMaster do
  begin
    for I :=0 to FieldList.Count -1 do
    begin
      if Fields[i].DataType = TFieldType(ftFloat) then
        begin
          SetStrProp(Fields[I], 'DisplayFormat','#,#.00') ;
          Fields[i].DisplayWidth :=20;
          if J=-1 then J:=I ;
        end;
    end;
    if CheckBox4.Checked then Fields[J].Visible :=True else Fields[J].Visible :=False;
    if CheckBox4.Checked then Fields[J+3].Visible :=True else Fields[J+3].Visible :=False;
    if CheckBox4.Checked then Fields[J+6].Visible :=True else Fields[J+6].Visible :=False;
    if CheckBox4.Checked then Fields[J+9].Visible :=True else Fields[J+9].Visible :=False;
    if CheckBox4.Checked then Fields[J+12].Visible :=True else Fields[J+12].Visible :=False;
    if CheckBox4.Checked then Fields[J+15].Visible :=True else Fields[J+15].Visible :=False;
    if CheckBox4.Checked then Fields[J+18].Visible :=True else Fields[J+18].Visible :=False;

    if CheckBox5.Checked then Fields[J+1].Visible :=True else Fields[J+1].Visible :=False;
    if CheckBox5.Checked then Fields[J+4].Visible :=True else Fields[J+4].Visible :=False;
    if CheckBox5.Checked then Fields[J+7].Visible :=True else Fields[J+7].Visible :=False;
    if CheckBox5.Checked then Fields[J+10].Visible :=True else Fields[J+10].Visible :=False;
    if CheckBox5.Checked then Fields[J+13].Visible :=True else Fields[J+13].Visible :=False;
    if CheckBox5.Checked then Fields[J+16].Visible :=True else Fields[J+16].Visible :=False;
    if CheckBox5.Checked then Fields[J+19].Visible :=True else Fields[J+19].Visible :=False;

    if CheckBox6.Checked then Fields[J+2].Visible :=True else Fields[J+2].Visible :=False;
    if CheckBox6.Checked then Fields[J+5].Visible :=True else Fields[J+5].Visible :=False;
    if CheckBox6.Checked then Fields[J+8].Visible :=True else Fields[J+8].Visible :=False;
    if CheckBox6.Checked then Fields[J+11].Visible :=True else Fields[J+11].Visible :=False;
    if CheckBox6.Checked then Fields[J+14].Visible :=True else Fields[J+14].Visible :=False;
    if CheckBox6.Checked then Fields[J+17].Visible :=True else Fields[J+17].Visible :=False;
  end;
  UpdateDBGrid
end;

procedure TSLSaleForeCastForm.RadioGroup2Click(Sender: TObject);
begin
  inherited;
  ComboBox1.Enabled :=RadioButton5.Checked;
end;

procedure TSLSaleForeCastForm.RadioButton5Click(Sender: TObject);
begin
  inherited;
  ComboBox1.Enabled :=RadioButton5.Checked;
end;

procedure TSLSaleForeCastForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if not CheckBox1.Checked and
     not CheckBox3.Checked and not CheckBox2.Checked  then
     CheckBox1.Checked:=not CheckBox1.Checked;
end;

procedure TSLSaleForeCastForm.FormShow(Sender: TObject);
begin
  inherited;
  DateTimePicker1.Date :=date;
  WhereStr :=' Where 1=1 ' ;
end;

procedure TSLSaleForeCastForm.ShowReslut;
var  SelectStr,SumStr,GroupStr:String;
begin
  GroupStr :='';
  SelectStr :='';
  if CheckBox1.Checked then
  begin
    SelectStr :=SelectStr+' Client [客户名称] ,';
    GroupStr :=GroupStr+' Client, ';
  end;
  if CheckBox2.Checked then
  begin
    SelectStr :=SelectStr+' Goods [商品名称] ,' ;
    GroupStr :=GroupStr+' Goods , '             ;
  end;
  if CheckBox3.Checked then
  begin
    SelectStr :=SelectStr+' Employee [业务经办],' ;
    GroupStr :=GroupStr+' Employee , '            ;
  end;
  IF  CheckBox7.Checked then
  begin
    if RadioButton4.Checked then  SumStr :=''
    +' sum(isnull(QttA,0)) [前五月(数量)],sum(isnull(AmtA,0)) [前五月(金额)], sum(isnull(PftA,0)) [前六月(毛利)],'
    +' sum(isnull(QttB,0)) [前四月(数量)],sum(isnull(AmtB,0)) [前四月(金额)], sum(isnull(PftB,0)) [前五月(毛利)],'
    +' sum(isnull(QttC,0)) [前三月(数量)],sum(isnull(AmtC,0)) [前三月(金额)], sum(isnull(PftC,0)) [前四月(毛利)],'
    +' sum(isnull(QttD,0)) [前二月(数量)],sum(isnull(AmtD,0)) [前二月(金额)], sum(isnull(PftD,0)) [前三月(毛利)],'
    +' sum(isnull(QttE,0)) [前一月(数量)],sum(isnull(AmtE,0)) [前一月(金额)], sum(isnull(PftE,0)) [前二月(毛利)],'
    +' sum(isnull(QttF,0)) [当  月(数量)],sum(isnull(AmtF,0)) [当  月(金额)], sum(isnull(PftF,0)) [当  月(毛利)],'
    +' sum(isnull(QttG,0)) [预计销售数量],sum(isnull(AmtG,0)) [预计销量金额],  '
    +' sum(isnull(QTTH,0)) [当前库存数量],sum(isnull(QTTI,0)) [订购结余数量],  '
    +' sum(isnull(QTTJ,0)) [订销结余数量], sum(isnull(QTTK,0)) [预计订货数量]'
    else   SumStr :=''
    +' sum(isnull(QttA,0)) [前五时段(数量)],sum(isnull(AmtA,0)) [前五时段(金额)], sum(isnull(PftA,0)) [前六时段(毛利)],'
    +' sum(isnull(QttB,0)) [前四时段(数量)],sum(isnull(AmtB,0)) [前四时段(金额)], sum(isnull(PftB,0)) [前五时段(毛利)],'
    +' sum(isnull(QttC,0)) [前三时段(数量)],sum(isnull(AmtC,0)) [前三时段(金额)], sum(isnull(PftC,0)) [前四时段(毛利)],'
    +' sum(isnull(QttD,0)) [前二时段(数量)],sum(isnull(AmtD,0)) [前二时段(金额)], sum(isnull(PftD,0)) [前三时段(毛利)],'
    +' sum(isnull(QttE,0)) [前一时段(数量)],sum(isnull(AmtE,0)) [前一时段(金额)], sum(isnull(PftE,0)) [前二时段(毛利)],'
    +' sum(isnull(QttF,0)) [当前时段(数量)],sum(isnull(AmtF,0)) [当前时段(金额)], sum(isnull(PftF,0)) [当  时段(毛利)],'
    +' sum(isnull(QttG,0)) [预计销售数量],sum(isnull(AmtG,0)) [预计销售金额],  '
    +' sum(isnull(QTTH,0)) [当前库存数量],sum(isnull(QTTI,0)) [订购结余数量],  '
    +' sum(isnull(QTTJ,0)) [订销结余数量], sum(isnull(QTTK,0)) [预计订货数量]'
  end
  else
  begin
  if RadioButton4.Checked then  SumStr :=''
  +' sum(isnull(QttA,0)) [前五月(数量)],sum(isnull(AmtA,0)) [前五月(金额)], sum(isnull(PftA,0)) [前五月(毛利)],'
  +' sum(isnull(QttB,0)) [前四月(数量)],sum(isnull(AmtB,0)) [前四月(金额)], sum(isnull(PftB,0)) [前四月(毛利)],'
  +' sum(isnull(QttC,0)) [前三月(数量)],sum(isnull(AmtC,0)) [前三月(金额)], sum(isnull(PftC,0)) [前三月(毛利)],'
  +' sum(isnull(QttD,0)) [前二月(数量)],sum(isnull(AmtD,0)) [前二月(金额)], sum(isnull(PftD,0)) [前二月(毛利)],'
  +' sum(isnull(QttE,0)) [前一月(数量)],sum(isnull(AmtE,0)) [前一月(金额)], sum(isnull(PftE,0)) [前一月(毛利)],'
  +' sum(isnull(QttF,0)) [当  月(数量)],sum(isnull(AmtF,0)) [当  月(金额)], sum(isnull(PftF,0)) [当  月(毛利)],'
  +' sum(isnull(QttG,0)) [预计销售数量],sum(isnull(AmtG,0)) [预计销售金额]'
  else SumStr :=''
  +' sum(isnull(QttA,0)) [前五时段(数量)],sum(isnull(AmtA,0)) [前五时段(金额)], sum(isnull(PftA,0)) [前五时段(毛利)],'
  +' sum(isnull(QttB,0)) [前四时段(数量)],sum(isnull(AmtB,0)) [前四时段(金额)], sum(isnull(PftB,0)) [前四时段(毛利)],'
  +' sum(isnull(QttC,0)) [前三时段(数量)],sum(isnull(AmtC,0)) [前三时段(金额)], sum(isnull(PftC,0)) [前三时段(毛利)],'
  +' sum(isnull(QttD,0)) [前二时段(数量)],sum(isnull(AmtD,0)) [前二时段(金额)], sum(isnull(PftD,0)) [前二时段(毛利)],'
  +' sum(isnull(QttE,0)) [前一时段(数量)],sum(isnull(AmtE,0)) [前一时段(金额)], sum(isnull(PftE,0)) [前一时段(毛利)],'
  +' sum(isnull(QttF,0)) [当前时段(数量)],sum(isnull(AmtF,0)) [当前时段(金额)], sum(isnull(PftF,0)) [当  月(毛利)]  ,'
  +' sum(isnull(QttG,0)) [预计销售数量],sum(isnull(AmtG,0)) [预计销售金额]'
  end;
  adsMaster.Close;
  adsMaster.CommandText:=' select  ' +SelectStr +SumStr
     +' from #SLSalePeriodDM  Where 1=1 '
     +' group by '+Copy( Trim(GroupStr),1,Length(Trim(GroupStr))-1 );
  adsMaster.open;
end;

procedure TSLSaleForeCastForm.adsMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  adsMaster.IndexFieldNames := '';
end;

procedure TSLSaleForeCastForm.CheckBox4Click(Sender: TObject);
begin
  inherited;
  if not CheckBox4.Checked and
     not CheckBox5.Checked and not CheckBox6.Checked  then
     CheckBox4.Checked:=not CheckBox4.Checked;
end;

procedure TSLSaleForeCastForm.adsMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefreshAvailableFields;
end;

end.
