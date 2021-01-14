unit EGMaterialChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, GEdit,
  DBCtrls, Menus, WNADOCQuery,TypInfo, scExcelExport;

type
  TEGMaterialChangeForm = class(TWSVoucherBrowseForm)
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
    WNADOCQuery1: TWNADOCQuery;
    Panel4: TPanel;
    GroupBox3: TGroupBox;
    Memo1: TMemo;
    Button2: TButton;
    Panel6: TPanel;
    Panel7: TPanel;
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    GroupBox2: TGroupBox;
    ShowCheckBox1: TCheckBox;
    ShowCheckBox2: TCheckBox;
    ShowCheckBox3: TCheckBox;
    CheckBox3: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
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
    procedure FormShow(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);

  private
    { Private declarations }
    WhereStr :string;
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  EGMaterialChangeForm: TEGMaterialChangeForm;

implementation

uses CommonDM,QLDBFlt;

{$R *.dfm}

function TEGMaterialChangeForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TEGMaterialChangeForm.UpdateDBGrid;
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
        if (Pos('金',Columns[I].FieldName)>0) then SetOrdProp(adsMaster.Fields[I], 'currency',1) ;
        if Pos('单',Columns[I].FieldName)<=0 then Columns[I].Footer.ValueType := fvtSum;
        if (not ShowCheckBox1.Checked) and (Pos('金',Columns[I].FieldName)>0) then Columns[I].Visible :=False;
        if (not ShowCheckBox2.Checked) and (Pos('数',Columns[I].FieldName)>0) then Columns[I].Visible :=False;
        if (not ShowCheckBox3.Checked) and (Pos('单',Columns[I].FieldName)>0) then Columns[I].Visible :=False;
      end;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TEGMaterialChangeForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

procedure TEGMaterialChangeForm.FormActivate(Sender: TObject);
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#EGMaterialBalanceTtl0')
        +' )) DROP TABLE #EGMaterialBalanceTtl0 ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #EGMaterialBalanceTtl0  ('
    +' [id] [int] IDENTITY (1, 1) NOT NULL ,'
    +' [BillMode] [varchar] (16)  ,  '
    +' [WareHouse] [varchar] (30)  NULL , '
    +' [Goods] [varchar] (60)  NULL , '
    +' [GoodsClass] [varchar] (60)  NULL , '
    +' [Unit] [varchar] (30)  NULL , '
    +' [AmountBegin] [float] NULL , '
    +' [PriceBegin] [float] NULL , '
    +' [GoalQuantityBegin] [float] NULL ,'
    +' [Amount] [float] NULL , '
    +' [Price] [float] NULL , '
    +' [GoalQuantity] [float] NULL ,'
    +' [AmountOut] [float] NULL , '
    +' [PriceOut] [float] NULL , '
    +' [GoalQuantityOut] [float] NULL ,'
    +' [AmountEnd] [float] NULL , '
    +' [PriceEnd] [float] NULL , '
    +' [GoalQuantityEnd] [float] NULL ) '    ;
  ADOQuery.ExecSQL;


  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#EGMaterialBalanceTtl')
        +' )) DROP TABLE #EGMaterialBalanceTtl ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #EGMaterialBalanceTtl  ('
    +' [id] [int] IDENTITY (1, 1) NOT NULL ,'
    +' [BillMode] [varchar] (16)  ,  '
    +' [WareHouse] [varchar] (30)  NULL , '
    +' [Goods] [varchar] (60)  NULL , '
    +' [GoodsClass] [varchar] (60)  NULL , '
    +' [Unit] [varchar] (30)  NULL , '
    +' [AmountBegin] [float] NULL , '
    +' [PriceBegin] [float] NULL , '
    +' [GoalQuantityBegin] [float] NULL ,'
    +' [Amount] [float] NULL , '
    +' [Price] [float] NULL , '
    +' [GoalQuantity] [float] NULL ,'
    +' [AmountOut] [float] NULL , '
    +' [PriceOut] [float] NULL , '
    +' [GoalQuantityOut] [float] NULL ,'
    +' [AmountEnd] [float] NULL , '
    +' [PriceEnd] [float] NULL , '
    +' [GoalQuantityEnd] [float] NULL ) '    ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#EGMaterialBalanceDM')
        +' )) DROP TABLE #EGMaterialBalanceDM ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #EGMaterialBalanceDM  ('
    +' [pid] [int] IDENTITY (1, 1) NOT NULL ,'
    +' [id] [int] NULL ,'
    +' [Date] [datetime] NULL ,[Code] [varchar] (20)  ,    '
    +' [ClientID] [int] NULL , [EmployeeID] [int] NULL ,   '
    +' [BillMode] [varchar] (16)  ,[ModeDC] [int] NULL ,   '
    +' [BillModeOut] [varchar] (16)  ,'
    +' [ModeC] [int] NULL ,[Brief] [varchar] (30)  ,       '
    +' [GoodsID] [int] NULL ,[GoodsSpec] [varchar] (30)  , '
    +' [Quantity] [float] NULL ,[QuantityPcs] [float] NULL,      '
    +' [Discount] [float] NULL , [PriceCost] [float] NULL , '
    +' [PackUnitID] [int] NULL ,[PriceBase] [money] NULL ,       '
    +' [Amount] [float] NULL ,[GoalUnitID] [int] NULL ,          '
    +' [GoalQuantity] [float] NULL ,[Client] [varchar] (50)  NULL ,       '
    +' [GoalQuantityOut] [float] NULL ,'
    +' [AmountOut] [float] NULL ,'
    +' [Employee] [varchar] (30)  NULL, [Goods] [varchar] (30)  NULL ,    '
    +' [GoodsClass] [varchar] (30)  NULL ,[DAArea] [varchar] (30)  NULL , '
    +' [Unit] [varchar] (20)  NULL , '
    +' [WareHouse] [varchar] (30)  NULL , '
    +' [ProjectName] [varchar] (30)  NULL , '
    +' [GrossProfit ] [float] NULL  ) '    ;

  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' TRUNCATE TABLE #EGMaterialBalanceDM';
  ADOQuery.ExecSQL;
  ADOQuery.Close;  // 进料记录
  ADOQuery.SQL.Text :=' INSERT INTO #EGMaterialBalanceDM ('
    +' ID,Date,Code,ClientID,EmployeeID,                         '
    +' BillMode,ModeDC,ModeC,Brief,                             '
    +' GoodsID,GoodsSpec, Quantity,QuantityPcs,PackUnitID,      '
    +' PriceBase,Amount,GoalUnitID,GoalQuantity,Discount,PriceCost,'
    +' [Client],[Employee],[Goods],[GoodsClass],[DAArea],  '
    +' [Unit],[WareHouse],GoalQuantityOut )'
    +' select  b.id,b.Date,b.Code,b.ClientID,b.EmployeeID,           '
    +' b.BillMode,b.ModeDC,b.ModeC,b.Brief,                     '
    +' a.GoodsID,a.GoodsSpec, a.Quantity,a.QuantityPcs,a.PackUnitID, '
    +' a.PriceBase,a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1),'
    +' a.GoalUnitID,a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) , Discount,PriceCost,'
    +' c.name Client,d.Name Employee,e.Name Goods,f.Name GoodsClass, '
    +' g.Name DAArea,h.name Unit ,j.name WareHouse,0.00000000001'
    +' from EGMaterialInDetail  AS a                                       '
    +' LEFT OUTER JOIN EGMaterialInmaster as b  on a.MasterID=b.id         '
    +' LEFT OUTER JOIN DAClient     as c  on b.ClientID=c.id         '
    +' LEFT OUTER JOIN MSEmployee   as d  on b.EmployeeID=d.id       '
    +' LEFT OUTER JOIN DAGoods      as e  on a.GoodsID=e.id          '
    +' LEFT OUTER JOIN DAGoodsClass as f  on e.GoodsClassID=f.id     '
    +' LEFT OUTER JOIN DAarea       as g  on c.AreaID=g.id           '
    +' LEFT OUTER JOIN MSUnit       as h  on E.UnitID=h.id       '
    +' LEFT OUTER JOIN STWareHouse  as j  on b.WareHouseID=j.id       '
    +' where b.Recordstate<>'+Quotedstr('删除')
    +' and GoodsID<>0 and not GoodsID is null'
    +' and GoalQuantity<>0 ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;  // 调入记录
  ADOQuery.SQL.Text :=' INSERT INTO #EGMaterialBalanceDM ('
    +' ID,Date,Code,ClientID,EmployeeID,                         '
    +' BillMode,ModeDC,ModeC,Brief,                             '
    +' GoodsID,GoodsSpec, Quantity,QuantityPcs,PackUnitID,      '
    +' PriceBase,Amount,GoalUnitID,GoalQuantity,Discount,PriceCost ,'
    +' [Client],[Employee],[Goods],[GoodsClass],[DAArea],  '
    +' [Unit],[WareHouse],GoalQuantityOut )'
    +' select  b.id,b.Date,b.Code,b.ClientID,b.EmployeeID,           '
    +' b.BillMode,b.ModeDC,b.ModeC,b.Brief,                     '
    +' a.GoodsID,a.GoodsSpec, a.Quantity,a.QuantityPcs,a.PackUnitID, '
    +' a.PriceBase,a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1),'
    +' a.GoalUnitID,a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) , Discount,0,'
    +' c.name Client,d.Name Employee,e.Name Goods,f.Name GoodsClass, '
    +' g.Name DAArea,h.name Unit ,j.name WareHouse,0.00000000001'
    +' from STGoodsOutInDetail  AS a                                       '
    +' LEFT OUTER JOIN STGoodsOutInmaster as b  on a.MasterID=b.id         '
    +' LEFT OUTER JOIN STWareHouse     as c  on b.ClientID=c.id         '
    +' LEFT OUTER JOIN MSEmployee   as d  on b.EmployeeID=d.id       '
    +' LEFT OUTER JOIN DAGoods      as e  on a.GoodsID=e.id          '
    +' LEFT OUTER JOIN DAGoodsClass as f  on e.GoodsClassID=f.id     '
    +' LEFT OUTER JOIN DAarea       as g  on c.ID=g.id           '
    +' LEFT OUTER JOIN MSUnit       as h  on E.UnitID=h.id       '
    +' LEFT OUTER JOIN STWareHouse  as j  on b.WareHouseID=j.id       '
    +' where b.Recordstate<>'+Quotedstr('删除')
    +' and GoodsID<>0 and not GoodsID is null'
    +' and GoalQuantity<>0 ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;  // 领料记录
  ADOQuery.SQL.Text :=' INSERT INTO #EGMaterialBalanceDM ('
    +' ID,Date,Code,ClientID,EmployeeID,                         '
    +' BillMode,ModeDC,ModeC,Brief,                             '
    +' GoodsID,GoodsSpec, Quantity,QuantityPcs,PackUnitID,      '
    +' PriceBase,AmountOut,GoalUnitID,GoalQuantityOut,Discount,PriceCost,'
    +' [ProjectName],[Employee],[Goods],[GoodsClass],[DAArea],  '
    +' [Unit],[WareHouse],GoalQuantity )'
    +' select  b.id,b.Date,b.Code,b.ClientID,b.EmployeeID,           '
    +' b.BillMode,b.ModeDC,b.ModeC,b.Brief,                     '
    +' a.GoodsID,a.GoodsSpec, a.Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1), a.QuantityPcs,a.PackUnitID, '
    +' a.PriceBase,a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1),'
    +' a.GoalUnitID,a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) , Discount,PriceCost,'
    +' c.name Client,d.Name Employee,e.Name Goods,f.Name GoodsClass, '
    +' g.Name DAArea,h.name Unit ,j.name WareHouse,0.00000000001'
    +' from EGMaterialOutDetail  AS a                                       '
    +' LEFT OUTER JOIN EGMaterialOutmaster as b  on a.MasterID=b.id         '
    +' LEFT OUTER JOIN DAProject     as c  on b.ClientID=c.id         '
    +' LEFT OUTER JOIN MSEmployee   as d  on b.EmployeeID=d.id       '
    +' LEFT OUTER JOIN DAGoods      as e  on a.GoodsID=e.id          '
    +' LEFT OUTER JOIN DAGoodsClass as f  on e.GoodsClassID=f.id     '
    +' LEFT OUTER JOIN DAarea       as g  on c.ProjectClassID=g.id           '
    +' LEFT OUTER JOIN MSUnit       as h  on E.UnitID=h.id       '
    +' LEFT OUTER JOIN STWareHouse  as j  on b.WareHouseID=j.id       '
    +' where b.Recordstate<>'+Quotedstr('删除')
    +' and GoodsID<>0 and not GoodsID is null'
    +' and GoalQuantity<>0 ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;  // 调出记录
  ADOQuery.SQL.Text :=' INSERT INTO #EGMaterialBalanceDM ('
    +' ID,Date,Code,ClientID,EmployeeID,                         '
    +' BillMode,ModeDC,ModeC,Brief,                             '
    +' GoodsID,GoodsSpec, Quantity,QuantityPcs,PackUnitID,      '
    +' PriceBase,AmountOut,GoalUnitID,GoalQuantityOut,Discount,PriceCost,'
    +' [ProjectName],[Employee],[Goods],[GoodsClass],[DAArea],  '
    +' [Unit],[WareHouse],GoalQuantity )'
    +' select  b.id,b.Date,b.Code,b.WareHouseID,b.EmployeeID,           '
    +' b.BillMode,b.ModeDC,b.ModeC,b.Brief,                     '
    +' a.GoodsID,a.GoodsSpec, a.Quantity,a.QuantityPcs,a.PackUnitID, '
    +' a.PriceBase,a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1),'
    +' a.GoalUnitID,a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1), Discount,0,'
    +' c.name Client,d.Name Employee,e.Name Goods,f.Name GoodsClass, '
    +' g.Name DAArea,h.name Unit ,j.name WareHouse,0.00000000001'
    +' from STGoodsOutInDetail  AS a                                       '
    +' LEFT OUTER JOIN STGoodsOutInmaster as b  on a.MasterID=b.id         '
    +' LEFT OUTER JOIN STWareHouse     as c  on b.WareHouseID=c.id         '
    +' LEFT OUTER JOIN MSEmployee   as d  on b.EmployeeID=d.id       '
    +' LEFT OUTER JOIN DAGoods      as e  on a.GoodsID=e.id          '
    +' LEFT OUTER JOIN DAGoodsClass as f  on e.GoodsClassID=f.id     '
    +' LEFT OUTER JOIN DAarea       as g  on c.ID=g.id           '
    +' LEFT OUTER JOIN MSUnit       as h  on E.UnitID=h.id       '
    +' LEFT OUTER JOIN STWareHouse  as j  on b.ClientID=j.id       '
    +' where b.Recordstate<>'+Quotedstr('删除')
    +' and GoodsID<>0 and not GoodsID is null'
    +' and GoalQuantity<>0 ' ;
  ADOQuery.ExecSQL;

  {ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #EGMaterialOutDM set '
        +' GrossProfit =GoalQuantity*Isnull(ModeDC,1)*Isnull(ModeC,1)*(PriceBase-PriceCost)';
  ADOQuery.ExecSQL;  }


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
    +' [ProjectName] [varchar] (30)  NULL , '
    +' [Unit] [varchar] (20)  NULL )' ;
  ADOQuery.ExecSQL;
  Memo1.ReadOnly :=False;
  Memo1.Clear;
  Memo1.Text :=' 所有条件!';
  Memo1.ReadOnly :=True;
  WhereStr :=' where 1=1  ';
//  CheckBox2.Checked :=True;
  Button2Click(sender);
  UpdateDBGrid;
end;

procedure TEGMaterialChangeForm.N1Click(Sender: TObject);
var E:string;
begin
  if adsMaster.IsEmpty then exit;
end;

procedure TEGMaterialChangeForm.DBGridDblClick(Sender: TObject);
begin
// inherited;
end;


procedure TEGMaterialChangeForm.Button3Click(Sender: TObject);
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
  Button2Click(Sender);

end;

procedure TEGMaterialChangeForm.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if not CheckBox1.Checked and
     not CheckBox2.Checked   and not CheckBox3.Checked
     and not CheckBox4.Checked
     then CheckBox1.Checked:=not CheckBox1.Checked;
end;

procedure TEGMaterialChangeForm.Button1Click(Sender: TObject);
var I :integer;
begin
  inherited;
//  Button1.Tag :=1;
  Panel6.Visible :=True;
  Panel6.Repaint;
  adsMaster.Close;
  adsMaster.CommandText:=' select date [日期],'
  +' code [编号],BillMode [业务类型],Client [进料单位],'
  +' ProjectName [用料项目],WareHouse [仓库名称],'
  +' GoodsClass [材料类别],Goods [材料名称], '
  +' Unit [单位], isnull(GoalQuantity,0)  [入库数量],'
  +' isnull(Amount,0)/isnull(GoalQuantity,0) [入库单价], isnull(Amount,0) [入库金额], '
  +' isnull(GoalQuantityOut,0)    [出库数量], isnull(AmountOut,0)/isnull(GoalQuantityOut,0) [出库单价], '
  +' isnull(AmountOut,0)  [出库金额], '
  +' ( isnull(GoalQuantity,0)-isnull(GoalQuantityOut,0) ) [结存数量],'
  +' ( isnull(Amount,0)-isnull(AmountOut,0) )/(isnull(GoalQuantity,0)-isnull(GoalQuantityOut,0))[结存单价], '
  +' ( isnull(Amount,0)-isnull(AmountOut,0) ) [结存金额], '
  +' Employee [业务经办]  from #EGMaterialBalanceDM    '
  +WhereStr ;
  adsMaster.open;

  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='';
end;

procedure TEGMaterialChangeForm.Button2Click(Sender: TObject);
var I :integer;
    SelectStr,GroupStr,SelectStr1:String;
begin
  inherited;
  Panel6.Visible :=True;
  Panel6.Repaint;
//  Button1.Tag :=0;

  GroupStr :='';
  SelectStr :='';
  SelectStr1 :='';
  if CheckBox1.Checked then
  begin
    SelectStr :=SelectStr+' WareHouse ,' ;
    SelectStr1 :=SelectStr1+' WareHouse [仓库名称],' ;
    GroupStr :=GroupStr+' WareHouse , '            ;
  end;
  if CheckBox2.Checked then
  begin
    SelectStr :=SelectStr+' Goods   ,' ;
    SelectStr1 :=SelectStr1+' Goods [材料名称],' ;
    GroupStr :=GroupStr+' Goods , '             ;
  end;
  if CheckBox3.Checked then
  begin
    SelectStr :=SelectStr+' GoodsClass  ,' ;
    SelectStr1 :=SelectStr1+' GoodsClass [材料类别],' ;
    GroupStr :=GroupStr+' GoodsClass , '             ;
  end;
  if CheckBox4.Checked then
  begin
    SelectStr :=SelectStr+' BillMode  ,' ;
    SelectStr1 :=SelectStr1+' BillMode [业务类别],' ;
    GroupStr :=GroupStr+' BillMode , '             ;
  end;
  if CheckBox2.Checked then
    begin
      SelectStr :=SelectStr+'unit ,'  ;
      SelectStr1 :=SelectStr1+' unit [计量单位],' ;
      GroupStr :=Trim(GroupStr)+'unit '      ;
    end else
    begin
      GroupStr :=Copy(Trim(GroupStr),1,Length(Trim(GroupStr))-1)      ;
    end;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Truncate Table #EGMaterialBalanceTtl';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #EGMaterialBalanceTtl ( '
    +' BillMode,WareHouse,Goods,GoodsClass, Unit, '
    +' AmountBegin,GoalQuantityBegin ) '
    +' select '
    +' BillMode,WareHouse,Goods,GoodsClass, Unit, '
    +' isnull(Amount,0)-Isnull(AmountOut,0), '
    +' isnull(GoalQuantity,0.0000000002)-Isnull(GoalQuantityOut,0.000000001) '
    +' from #EGMaterialBalanceDM  '
    + WhereStr +' and Date <'+QuotedStr(Datetostr(DateTimePicker1.DateTime));
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #EGMaterialBalanceTtl ( '
    +' BillMode,WareHouse,Goods,GoodsClass,Unit, '
    +' Amount,GoalQuantity ) '
    +' select '
    +' BillMode,WareHouse,Goods,GoodsClass,Unit, '
    +' isnull(Amount,0) ,'
    +' isnull(GoalQuantity,0.0000000001)'
    +' from #EGMaterialBalanceDM  '
    + WhereStr +' and Date >='+QuotedStr(Datetostr(DateTimePicker1.DateTime))
    + ' and Date <='+QuotedStr(Datetostr(DateTimePicker2.DateTime));
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #EGMaterialBalanceTtl ( '
    +' BillMode,WareHouse,Goods,GoodsClass,Unit, '
    +' AmountOut,GoalQuantityOut ) '
    +' select '
    +' BillMode,WareHouse,Goods,GoodsClass,Unit, '
    +' isnull(AmountOut,0), '
    +' isnull(GoalQuantityOut,0.0000000001)'
    +' from #EGMaterialBalanceDM  '
    + WhereStr +' and Date >='+QuotedStr(Datetostr(DateTimePicker1.DateTime))
    + ' and Date <='+QuotedStr(Datetostr(DateTimePicker2.DateTime));
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Truncate Table #EGMaterialBalanceTtl0';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #EGMaterialBalanceTtl0 ( '
    + SelectStr +' AmountBegin,GoalQuantityBegin, '
    +' Amount ,GoalQuantity,  '
    +' AmountOut,GoalQuantityOut  '
    +' ) select '+SelectStr
    +' sum(Isnull(AmountBegin,0)) ,sum(Isnull(GoalQuantityBegin,0.0000001)), '
    +' sum(Isnull(Amount,0)) ,sum(Isnull(GoalQuantity,0.0000001)), '
    +' sum(Isnull(AmountOut,0)) ,sum(Isnull(GoalQuantityOut,0.0000001))'
    +' from #EGMaterialBalanceTtl  '
    +' Where Goods is not null '
    +' group by '+Copy(Trim(SelectStr),1,Length(Trim(SelectStr))-1);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Update #EGMaterialBalanceTtl0 set '
    +' AmountEnd=isnull(AmountBegin,0)+isnull(Amount,0)-isnull(AmountOut,0) ,'
    +' GoalQuantityEnd=isnull(GoalQuantityBegin,0)+isnull(GoalQuantity,0)-isnull(GoalQuantityOut,0) ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Update #EGMaterialBalanceTtl0 set '
    +' PriceBegin=AmountBegin/GoalQuantityBegin'
    +' where GoalQuantityBegin<>0 and GoalQuantityBegin is not null';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Update #EGMaterialBalanceTtl0 set '
    +' Price=Amount /GoalQuantity '
    +' where GoalQuantity <>0 and GoalQuantity  is not null';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Update #EGMaterialBalanceTtl0 set '
    +' PriceOut=AmountOut /GoalQuantityOut '
    +' where GoalQuantityOut <>0 and GoalQuantityOut  is not null';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Update #EGMaterialBalanceTtl0 set '
    +' PriceEnd=AmountEnd /GoalQuantityEnd '
    +' where GoalQuantityEnd <>0 and GoalQuantityEnd  is not null';
  ADOQuery.ExecSQL;






  adsMaster.Close;
  adsMaster.CommandText:=' select  '  +SelectStr1
  +' GoalQuantityBegin [期初数量],'
  +' PriceBegin [期初单价],  '
  +' AmountBegin [期初金额], '
  +' GoalQuantity [入库数量],'
  +' Price [入库单价],  '
  +' Amount [入库金额], '
  +' GoalQuantityOut [出库数量], '
  +' PriceOut  [出库单价], '
  +' AmountOut [出库金额], '
  +' GoalQuantityEnd [期末数量],'
  +' PriceEnd [期末单价], '
  +' AmountEnd[期末金额]'
  +' from #EGMaterialBalanceTtl0  ' ;
//  showmessage(adsMaster.CommandText);

  adsMaster.open;

  Panel6.Visible :=False;
  UpdateDBGrid  ;
  DBGrid.hint :='';
  if CheckBox1.Checked then DBGrid.hint := DBGrid.hint+CheckBox1.Caption+',';
  if CheckBox2.Checked then DBGrid.hint := DBGrid.hint+CheckBox2.Caption+',';
  if CheckBox3.Checked then DBGrid.hint := DBGrid.hint+CheckBox3.Caption+',';
  if trim(DBGrid.hint)<>'' then
    DBGrid.hint :='汇总项目:'+Copy(Trim(DBGrid.hint),1,Length(Trim(DBGrid.hint))-1 );
end;

procedure TEGMaterialChangeForm.adsMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  adsMaster.IndexFieldNames := '';
end;

procedure TEGMaterialChangeForm.ExportActionExecute(Sender: TObject);
begin
  hint :='统计条件:' +Memo1.Text;
  caption :=caption+'报表';
  inherited;
end;

procedure TEGMaterialChangeForm.FormShow(Sender: TObject);
var Year, Month, Day: Word ;
begin
  inherited;
  DecodeDate(Date, Year, Month, Day);
  DateTimePicker1.DateTime :=EncodeDate(Year, Month, 1);
  DateTimePicker2.DateTime :=EndOfTheMonth(DateTimePicker1.DateTime);
end;

procedure TEGMaterialChangeForm.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  DateTimePicker2.DateTime :=EndOfTheMonth(DateTimePicker1.DateTime);
end;

end.
