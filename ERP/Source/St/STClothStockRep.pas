unit STClothStockRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, GEdit,
  DBCtrls, Menus, WNADOCQuery,TypInfo, CheckLst;

type
  TSTClothStockRepForm = class(TWSVoucherBrowseForm)
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
    GroupBox1: TGroupBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    ListGoodsDetailAct: TAction;
    ListGoodsDetail: TMenuItem;
    VipsetPanel: TPanel;
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Button5: TButton;
    Button6: TButton;
    ToolButton1: TToolButton;
    GoodsFlowListAct: TAction;
    AccountListQry: TADOQuery;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    AccountListQryDSDesigner: TDateTimeField;
    AccountListQryDSDesigner2: TStringField;
    AccountListQryDSDesigner3: TStringField;
    AccountListQryDSDesigner4: TStringField;
    AccountListQryDSDesigner5: TStringField;
    AccountListQryDSDesigner6: TStringField;
    AccountListQryDSDesigner7: TStringField;
    AccountListQryDSDesigner8: TStringField;
    AccountListQryDSDesigner9: TStringField;
    AccountListQryDSDesigner10: TBCDField;
    AccountListQryDSDesigner11: TBCDField;
    AccountListQryDSDesigner12: TBCDField;
    AccountListQryDSDesigner13: TStringField;
    AccountListQryDSDesigner14: TBCDField;
    AccountListQryDSDesigner15: TBCDField;
    AccountListQryDSDesigner16: TBCDField;
    AccountListQryDSDesigner17: TBCDField;
    AccountListQryDSDesigner18: TBCDField;
    AccountListQryDSDesigner19: TStringField;
    AccountListQryDSDesigner20: TBCDField;
    AccountListQryDSDesigner21: TBCDField;
    AccountListQryDSDesigner22: TBCDField;
    AccountListQryDSDesigner23: TBCDField;
    AccountListQryDSDesigner24: TBCDField;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    DeadStockAct: TAction;
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
    procedure ExpSttcCheckListBoxClickCheck(Sender: TObject);
    procedure ListGoodsDetailActExecute(Sender: TObject);
    procedure GoodsFlowListActExecute(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DateTimePicker1CloseUp(Sender: TObject);
    procedure DateTimePicker2CloseUp(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure adsMasterAfterOpen(DataSet: TDataSet);
    procedure DeadStockActExecute(Sender: TObject);

  private
    { Private declarations }
    WhereStr,SelectStr :string;
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  STClothStockRepForm: TSTClothStockRepForm;

implementation

uses CommonDM,QLDBFlt,QLRptBld,SLRpCheckReckoning;

{$R *.dfm}

function TSTClothStockRepForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TSTClothStockRepForm.UpdateDBGrid;
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
      Columns[i].Width :=120;
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
        if (Pos('单价',Columns[I].FieldName)<=0)   then
           Columns[I].Footer.ValueType := fvtSum;
      end;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TSTClothStockRepForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

procedure TSTClothStockRepForm.DBGridDblClick(Sender: TObject);
begin
// inherited;
end;


procedure TSTClothStockRepForm.Button3Click(Sender: TObject);
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

procedure TSTClothStockRepForm.FormShow(Sender: TObject);
var I :integer;
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ExpenseList')
        +' )) DROP TABLE #ExpenseList ' ;
  ADOQuery.ExecSQL;

//销售出库
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select b.Date [日期], '
    +' b.Code [编号],                        '
    +' b.BillMode [业务类别],                '
    +' d.name  [经手人] ,                    '
    +' c.name [仓库名称],                    '
    +' h.name [商品类别],                    '
    +' e.name [商品名称],                    '
    +' e.Code [商品编号],                    '
    +' g.name [标准单位],                    '
    +' a.GoodsSpec [颜色],               '
    +' a.CapStyle [杯型],               '
    +' Isnull(a.SizeA,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｓ],  '   //
    +' Isnull(a.SizeB,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｍ],  '
    +' Isnull(a.SizeC,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｌ],  '
    +' Isnull(a.SizeD,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XL],  '
    +' Isnull(a.SizeE,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XXL],  '
    +' Isnull(a.SizeF,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XXXL],  '
    +' Isnull(a.QuantityPcs,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库均码],                  '

    +' a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库标准数量],  '
    +' a.PriceGoal [入库标准单价],                '
    +' a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库金额], '

//    +' f.name     [入库包装单位],                '
//    +' a.Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库包装数量],     '
//    +' a.PriceBase [入库包装单价]  ,             '


    +' Isnull(a.SizeA,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库Ｓ],  '   //
    +' Isnull(a.SizeB,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库Ｍ],  '
    +' Isnull(a.SizeC,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库Ｌ],  '
    +' Isnull(a.SizeD,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库XL],  '
    +' Isnull(a.SizeE,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库XXL],  '
    +' Isnull(a.SizeF,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库XXXL],  '
    +' Isnull(a.QuantityPcs,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库均码], '

    +' a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库标准数量],  '
    +' a.PriceGoal [出库标准单价],                '
    +' a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库金额] '

//    +' f.name     [出库包装单位],                '
//    +' a.Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库包装数量],     '
//    +' a.PriceBase [出库包装单价]                '
    +' into #ExpenseList '
    +' from SLSaleDetail a                   '
    +' left outer join SLSaleMaster     b on b.ID=a.MasterID      '
    +' left outer join STWarehouse         c on c.ID=b.WareHouseID      '
    +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
    +' left outer join DAGoods          e on e.ID=a.GoodsID       '
    +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
    +' left outer join MSUnit           g on g.ID=E.UnitID    '
    +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
    +' where b.RecordState<>'+ Quotedstr('删除')
    +' and isnull(a.GoodsID,0) <>0 '
    +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL;
//销售出库

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Update  #ExpenseList set [入库Ｓ]=null , '
    +' [入库Ｍ]=null, [入库Ｌ]=null , [入库XL]=null ,    '
    +' [入库XXL]=null,[入库XXXL]=null, [入库均码]=null,  '
    +' [入库标准数量]=null,[入库标准单价]=null ,[入库金额]=null ';
  ADOQuery.ExecSQL;

  //采购入库--
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  #ExpenseList (     '
    +' [日期], [编号],[业务类别],[经手人] , [仓库名称],  '
    +' [商品类别], [商品名称],[商品编号],[标准单位],[颜色],[杯型], '
    +' [入库Ｓ] ,[入库Ｍ],[入库Ｌ] , [入库XL] ,    '
    +' [入库XXL],[入库XXXL], [入库均码],            '
    +' [入库标准数量],[入库标准单价] ,[入库金额] ) '
    +' select b.Date [日期],   '
    +' b.Code [编号],                        '
    +' b.BillMode [业务类别],                '
    +' d.name  [经手人] ,                    '
    +' c.name [仓库名称],                    '
    +' h.name [商品类别],                    '
    +' e.name [商品名称],                    '
    +' e.Code [商品编号],                    '
    +' g.name [标准单位],                    '
    +' a.GoodsSpec [颜色],               '
    +' a.CapStyle [杯型],               '
    +' Isnull(a.SizeA,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｓ],  '   //
    +' Isnull(a.SizeB,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｍ],  '
    +' Isnull(a.SizeC,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｌ],  '
    +' Isnull(a.SizeD,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XL],  '
    +' Isnull(a.SizeE,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XXL],  '
    +' Isnull(a.SizeF,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XXXL],  '
    +' Isnull(a.QuantityPcs,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库均码],         '
    +' Isnull(a.GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库标准数量],    '
    +' a.PriceGoal [入库标准单价],                '
    +' Isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库金额]              '
    +' from PCPurchaseDetail a                   '
    +' left outer join PCPurchaseMaster     b on b.ID=a.MasterID      '
    +' left outer join STWarehouse         c on c.ID=b.WareHouseID      '
    +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
    +' left outer join DAGoods          e on e.ID=a.GoodsID       '
    +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
    +' left outer join MSUnit           g on g.ID=E.UnitID    '
    +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
    +' where b.RecordState<>'+ Quotedstr('删除')
    +' and isnull(a.GoodsID,0) <>0 '
    +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL;
//采购入库--

//生产入库==
  {
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  #ExpenseList ( '
    +' [日期], [编号],[业务类别],[经手人] , [仓库名称], '
    +' [商品类别], [商品名称],[规格型号],[标准单位],'
    +' [入库标准数量], [入库标准单价],[入库金额],[入库包装单位],    '
    +' [入库包装数量], [入库包装单价]  )'
    +' select b.Date [日期], '
    +' b.Code [编号],                        '
    +' b.BillMode [业务类别],                '
    +' d.name  [经手人] ,                    '
    +' c.name [仓库名称],                    '
    +' h.name [商品类别],                    '
    +' e.name [商品名称],                    '
    +' a.GoodsSpec [规格型号],               '
    +' g.name [标准单位],                    '
    +' a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库标准数量],  '
    +' a.PriceGoal [入库标准单价],                '
    +' a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库金额],                  '
    +' f.name     [入库包装单位],                '
    +' a.Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库包装数量],     '
    +' a.PriceBase [入库包装单价]                '
    +' from YDGoodsInDetail a                   '
    +' left outer join YDGoodsInMaster     b on b.ID=a.MasterID      '
    +' left outer join STWarehouse         c on c.ID=b.WareHouseID      '
    +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
    +' left outer join DAGoods          e on e.ID=a.GoodsID       '
    +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
    +' left outer join MSUnit           g on g.ID=E.UnitID    '
    +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
    +' where b.RecordState<>'+ Quotedstr('删除')
    +' and isnull(a.GoodsID,0) <>0 '
    +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL;  }
//生产入库==

//生产出库==
  {
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  #ExpenseList ( '
    +' [日期], [编号],[业务类别],[经手人] , [仓库名称], '
    +' [商品类别], [商品名称],[规格型号],[标准单位],'
    +' [出库标准数量], [出库标准单价],[出库金额],[出库包装单位],    '
    +' [出库包装数量], [出库包装单价]  )'
    +' select b.Date [日期], '
    +' b.Code [编号],                        '
    +' b.BillMode [业务类别],                '
    +' d.name  [经手人] ,                    '
    +' c.name [仓库名称],                    '
    +' h.name [商品类别],                    '
    +' e.name [商品名称],                    '
    +' a.GoodsSpec [规格型号],               '
    +' g.name [标准单位],                    '
    +' a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库标准数量],            '
    +' a.PriceGoal [出库标准单价],                '
    +' a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库金额],                  '
    +' f.name     [出库包装单位],                '
    +' a.Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库包装数量],     '
    +' a.PriceBase [出库包装单价]                '
    +' from YDGoodsOutDetail a                   '
    +' left outer join YDGoodsOutMaster     b on b.ID=a.MasterID      '
    +' left outer join STWarehouse         c on c.ID=b.WareHouseID      '
    +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
    +' left outer join DAGoods          e on e.ID=a.GoodsID       '
    +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
    +' left outer join MSUnit           g on g.ID=E.UnitID    '
    +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
    +' where b.RecordState<>'+ Quotedstr('删除')
    +' and isnull(a.GoodsID,0) <>0 '
    +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL;                    }
//生产出库==

//项目出库==
  {
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  #ExpenseList ( '
    +' [日期], [编号],[业务类别],[经手人] , [仓库名称], '
    +' [商品类别], [商品名称],[规格型号],[标准单位],'
    +' [出库标准数量], [出库标准单价],[出库金额],[出库包装单位],    '
    +' [出库包装数量], [出库包装单价]  )'
    +' select b.Date [日期], '
    +' b.Code [编号],                        '
    +' b.BillMode [业务类别],                '
    +' d.name  [经手人] ,                    '
    +' c.name [仓库名称],                    '
    +' h.name [商品类别],                    '
    +' e.name [商品名称],                    '
    +' a.GoodsSpec [规格型号],               '
    +' g.name [标准单位],                    '
    +' a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库标准数量],            '
    +' a.PriceGoal [出库标准单价],                '
    +' a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库金额],                  '
    +' f.name     [出库包装单位],                '
    +' a.Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库包装数量],     '
    +' a.PriceBase [出库包装单价]                '
    +' from EGGoodsOutDetail a                   '
    +' left outer join EGGoodsOutMaster     b on b.ID=a.MasterID      '
    +' left outer join STWarehouse         c on c.ID=b.WareHouseID      '
    +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
    +' left outer join DAGoods          e on e.ID=a.GoodsID       '
    +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
    +' left outer join MSUnit           g on g.ID=E.UnitID    '
    +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
    +' where b.RecordState<>'+ Quotedstr('删除')
    +' and isnull(a.GoodsID,0) <>0 '
    +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL; }
//项目出库==

//库存调拨出库
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  #ExpenseList ( '
    +' [日期], [编号],[业务类别],[经手人] , [仓库名称],  '
    +' [商品类别], [商品名称],[商品编号],[标准单位],[颜色],[杯型], '
    +' [出库Ｓ] ,[出库Ｍ],[出库Ｌ] , [出库XL] ,    '
    +' [出库XXL],[出库XXXL], [出库均码],            '
    +' [出库标准数量],[出库标准单价] ,[出库金额] ) '
    +' select b.Date [日期], '
    +' b.Code [编号],                        '
    +' b.BillMode [业务类别],                '
    +' d.name  [经手人] ,                    '
    +' c.name [仓库名称],                    '
    +' h.name [商品类别],                    '
    +' e.name [商品名称],                    '
    +' e.CODE [商品编号],                    '
    +' g.name [标准单位],                    '
    +' a.GoodsSpec [颜色],               '
    +' a.CapStyle [杯型],               '
    +' Isnull(a.SizeA,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库Ｓ],  '   //
    +' Isnull(a.SizeB,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库Ｍ],  '
    +' Isnull(a.SizeC,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库Ｌ],  '
    +' Isnull(a.SizeD,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库XL],  '
    +' Isnull(a.SizeE,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库XXL],  '
    +' Isnull(a.SizeF,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库XXXL],  '
    +' Isnull(a.QuantityPcs,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库均码],         '
    +' Isnull(a.GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库标准数量],    '
    +' a.PriceGoal [出库标准单价],                '
    +' Isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库金额]              '
    +' from STGoodsOutInDetail a                   '
    +' left outer join STGoodsOutInMaster     b on b.ID=a.MasterID      '
    +' left outer join STWarehouse         c on c.ID=b.ClientID      '
    +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
    +' left outer join DAGoods          e on e.ID=a.GoodsID       '
    +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
    +' left outer join MSUnit           g on g.ID=E.UnitID    '
    +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
    +' where b.RecordState<>'+ Quotedstr('删除')
    +' and  isnull(b.ClientID,0)<>0  and isnull(a.GoodsID,0)<>0 '
    +' order by  b.date ,b.code,a.ID ';

  ADOQuery.ExecSQL;
//库存调拨出库


//库存调拨入库
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  #ExpenseList ( '
    +' [日期], [编号],[业务类别],[经手人] , [仓库名称],  '
    +' [商品类别], [商品名称],[商品编号],[标准单位],[颜色],[杯型], '
    +' [入库Ｓ] ,[入库Ｍ],[入库Ｌ] , [入库XL] ,    '
    +' [入库XXL],[入库XXXL], [入库均码],            '
    +' [入库标准数量],[入库标准单价] ,[入库金额] ) '
    +' select b.Date [日期], '
    +' b.Code [编号],                        '
    +' b.BillMode [业务类别],                '
    +' d.name  [经手人] ,                    '
    +' c.name [仓库名称],                    '
    +' h.name [商品类别],                    '
    +' e.name [商品名称],                    '
    +' e.CODE [商品编号],                    '
    +' g.name [标准单位],                    '
    +' a.GoodsSpec [颜色],               '
    +' a.CapStyle [杯型],               '
    +' Isnull(a.SizeA,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｓ],  '   //
    +' Isnull(a.SizeB,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｍ],  '
    +' Isnull(a.SizeC,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｌ],  '
    +' Isnull(a.SizeD,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XL],  '
    +' Isnull(a.SizeE,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XXL],  '
    +' Isnull(a.SizeF,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XXXL],  '
    +' Isnull(a.QuantityPcs,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库均码],         '
    +' Isnull(a.GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库标准数量],    '
    +' a.PriceGoal [入库标准单价],                '
    +' Isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库金额]              '

    +' from STGoodsOutInDetail a                   '
    +' left outer join STGoodsOutInMaster     b on b.ID=a.MasterID      '
    +' left outer join STWarehouse         c on c.ID=b.WareHouseID      '
    +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
    +' left outer join DAGoods          e on e.ID=a.GoodsID       '
    +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
    +' left outer join MSUnit           g on g.ID=E.UnitID    '
    +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
    +' where b.RecordState<>'+ Quotedstr('删除')
    +' and  isnull(b.WareHouseID,0)<>0  and isnull(a.GoodsID,0)<>0 '
    +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL;
//库存调拨入库

//盘盈入库
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  #ExpenseList ( '
    +' [日期], [编号],[业务类别],[经手人] , [仓库名称],  '
    +' [商品类别], [商品名称],[商品编号],[标准单位],[颜色],[杯型], '
    +' [入库Ｓ] ,[入库Ｍ],[入库Ｌ] , [入库XL] ,    '
    +' [入库XXL],[入库XXXL], [入库均码],            '
    +' [入库标准数量],[入库标准单价] ,[入库金额] ) '
    +' select b.Date [日期], '
    +' b.Code [编号],                        '
    +' b.BillMode [业务类别],                '
    +' d.name  [经手人] ,                    '
    +' c.name [仓库名称],                    '
    +' h.name [商品类别],                    '
    +' e.name [商品名称],                    '
    +' e.CODE [商品编号],                    '
    +' g.name [标准单位],                    '
    +' a.GoodsSpec [颜色],               '
    +' a.CapStyle [杯型],               '
    +' Isnull(a.SizeA,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｓ],  '   //
    +' Isnull(a.SizeB,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｍ],  '
    +' Isnull(a.SizeC,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库Ｌ],  '
    +' Isnull(a.SizeD,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XL],  '
    +' Isnull(a.SizeE,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XXL],  '
    +' Isnull(a.SizeF,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库XXXL],  '
    +' Isnull(a.QuantityPcs,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库均码],         '
    +' Isnull(a.GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库标准数量],    '
    +' a.PriceGoal [入库标准单价],                '
    +' Isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [入库金额]              '

    +' from STGoodsCountOffDetail a                   '
    +' left outer join STGoodsCountOffMaster     b on b.ID=a.MasterID      '
    +' left outer join STWarehouse         c on c.ID=b.WareHouseID      '
    +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
    +' left outer join DAGoods          e on e.ID=a.GoodsID       '
    +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
    +' left outer join MSUnit           g on g.ID=E.UnitID    '
    +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
    +' where b.RecordState<>'+ Quotedstr('删除')
    +' and isnull(a.GoodsID,0)<>0 and BillMode='+Quotedstr('库存盘盈')
    +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL;
//盘盈入库

//盘亏出库
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  #ExpenseList ( '
    +' [日期], [编号],[业务类别],[经手人] , [仓库名称],  '
    +' [商品类别], [商品名称],[商品编号],[标准单位],[颜色],[杯型], '
    +' [出库Ｓ] ,[出库Ｍ],[出库Ｌ] , [出库XL] ,    '
    +' [出库XXL],[出库XXXL], [出库均码],            '
    +' [出库标准数量],[出库标准单价] ,[出库金额] ) '
    +' select b.Date [日期], '
    +' b.Code [编号],                        '
    +' b.BillMode [业务类别],                '
    +' d.name  [经手人] ,                    '
    +' c.name [仓库名称],                    '
    +' h.name [商品类别],                    '
    +' e.name [商品名称],                    '
    +' e.CODE [商品编号],                    '
    +' g.name [标准单位],                    '
    +' a.GoodsSpec [颜色],               '
    +' a.CapStyle [杯型],               '
    +' Isnull(a.SizeA,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库Ｓ],  '   //
    +' Isnull(a.SizeB,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库Ｍ],  '
    +' Isnull(a.SizeC,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库Ｌ],  '
    +' Isnull(a.SizeD,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库XL],  '
    +' Isnull(a.SizeE,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库XXL],  '
    +' Isnull(a.SizeF,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库XXXL],  '
    +' Isnull(a.QuantityPcs,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库均码],         '
    +' Isnull(a.GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库标准数量],    '
    +' a.PriceGoal [出库标准单价],                '
    +' Isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) [出库金额]              '
    +' from STGoodsCountOffDetail a                   '
    +' left outer join STGoodsCountOffMaster     b on b.ID=a.MasterID      '
    +' left outer join STWarehouse         c on c.ID=b.WareHouseID      '
    +' left outer join MSEmployee       d on d.ID=b.EmployeeID    '
    +' left outer join DAGoods          e on e.ID=a.GoodsID       '
    +' left outer join MSUnit           f on f.ID=a.PackUnitID    '
    +' left outer join MSUnit           g on g.ID=E.UnitID    '
    +' left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
    +' where b.RecordState<>'+ Quotedstr('删除')
    +' and isnull(a.GoodsID,0)<>0 and BillMode<>'+Quotedstr('库存盘盈')
    +' order by  b.date ,b.code,a.ID ';
  ADOQuery.ExecSQL;
//盘亏出库

{  //插入预警数量
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  #ExpenseList ( '
    +' [商品类别], [商品名称],[库存下限数量] ) '
    +' select h.name [商品类别], a.name [商品名称],  '
    +' a.StockMin [库存下限数量] '
    +' from DAGoods  a                   '
    +' left outer join DAGoodsClass  h on h.ID=a.GoodsClassID  '
    +' where a.RecordState<>'+ Quotedstr('删除');
  ADOQuery.ExecSQL;   }



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

procedure TSTClothStockRepForm.Button1Click(Sender: TObject);
begin
  Panel6.Visible :=True;
  Panel6.Repaint;
  Button1.Tag:=1 ;
  adsMaster.Close;
  adsMaster.CommandText:=' select *,(Isnull([入库标准数量],0)-Isnull([出库标准数量],0)) [结存数量], '
    +'(Isnull([入库金额],0)-Isnull([出库金额],0)) [结存金额] '
    +' from #ExpenseList'+WhereStr
    +' order by [日期], [编号]' ;
//  showmessage(adsMaster.CommandText);
  adsMaster.open;
  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='';
end;

procedure TSTClothStockRepForm.FormActivate(Sender: TObject);
begin
  inherited;
{ ADOQuery.Close;
  ADOQuery.SQL.Text :='select max(日期) MDate  from #ExpenseList ';
  ADOQuery.Open;

  if ADOQuery.FieldByName('MDate').IsNull then WhereStr :=Datetostr(date)
    else WhereStr :=Trim(ADOQuery.fieldbyname('MDate').AsString);
  Memo1.ReadOnly :=False;
  Memo1.Clear;
  Memo1.Text :=' 日期 等于'+ Quotedstr(WhereStr);
  Memo1.ReadOnly :=True;
  WhereStr :=' where [日期]='+Quotedstr(WhereStr);
  WhereStr := ' where 1=1 ';            }
  ExpSttcCheckListBox.Checked[7] :=True;
  SelectStr :=','+Trim(ExpSttcCheckListBox.Items[7]);
  ExpSttcCheckListBox.Checked[6] :=True;
  SelectStr :=SelectStr+','+Trim(ExpSttcCheckListBox.Items[6]);

  Button2Click(sender);
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#StockListTtl')
        +' )) DROP TABLE #StockListTtl ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select * into #StockListTtl from #ExpenseListTtl ';
  ADOQuery.ExecSQL;

end;

procedure TSTClothStockRepForm.Button2Click(Sender: TObject);
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

  if  pos('商品名称',SelectStr1)>0 then
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
          +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ExpenseList0')
          +' )) DROP TABLE #ExpenseList0 ' ;
    ADOQuery.ExecSQL;
    //加入明细流水数据------
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' select *,  '
      +' (Isnull([入库标准数量],0)-Isnull([出库标准数量],0)) [结存数量],'
      +' (Isnull([入库金额],0)-Isnull([出库金额],0)) [结存金额],'
      +' [出库金额] [结存单价], '
      +' [出库金额] [库存下限数量],[出库金额] [预警数量]'
      +' into #ExpenseList0  from #ExpenseList  ';
    ADOQuery.ExecSQL;

    ADOQuery.Close;
    ADOQuery.SQL.Text :=' Update #ExpenseList0 set [库存下限数量]=null,'
      +' [预警数量]=null ,[结存单价]=null' ;
    ADOQuery.ExecSQL;

    //插入预警数量 ==========
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' insert into  #ExpenseList0 ( [业务类别],'
      +' [商品类别], [商品名称],[标准单位],[库存下限数量] ) '
      +' select '+Quotedstr('预警资料')+' [业务类别] ,'
      +' h.name [商品类别], a.name [商品名称], s.name [标准单位], '
      +' a.StockMin [库存下限数量] '
      +' from DAGoods  a                   '
      +' left outer join DAGoodsClass  h on h.ID=a.GoodsClassID  '
      +' left outer join MSUnit        S on S.ID=a.UnitID  '
      +' where a.RecordState<>'+ Quotedstr('删除');
    ADOQuery.ExecSQL;

    //插入汇总记录 *****
    ADOQuery.Close;
    ADOQuery.SQL.Text:=' select ' + SelectStr1+ ExpSttcCheckListBox.hint

      +' , Sum(Isnull([入库Ｓ],0)-Isnull([出库Ｓ],0)) [结存Ｓ],'
      +'  Sum(Isnull([入库Ｍ],0)-Isnull([出库Ｍ],0)) [结存Ｍ],'
      +'  Sum(Isnull([入库Ｌ],0)-Isnull([出库Ｌ],0)) [结存Ｌ],'
      +'  Sum(Isnull([入库XL],0)-Isnull([出库XL],0)) [结存XL],'
      +'  Sum(Isnull([入库XXL],0)-Isnull([出库XXL],0)) [结存XXL],'
      +'  Sum(Isnull([入库XXXL],0)-Isnull([出库XXXL],0)) [结存XXXL],'
      +'  Sum(Isnull([入库均码],0)-Isnull([出库均码],0)) [结存均码],'
      +' Sum(Isnull([结存数量],0)) [结存数量],'
      +' Sum(Isnull([结存单价],0)) [结存单价],'
      +' Sum(Isnull([结存金额],0)) [结存金额],'
      +' Sum(isnull([库存下限数量],0)) [库存下限数量] ,'
      +' Sum(isnull([预警数量],0)) [预警数量]'
      +' into #ExpenseListTtl from #ExpenseList0  '
      +WhereStr +' group by '+SelectStr1 ;
    ADOQuery.ExecSQL;

    ADOQuery.Close;
    ADOQuery.SQL.Text:=' Update #ExpenseListTtl set [结存单价]=  '
      +' Isnull([结存金额],0)/[结存数量] where Isnull([结存数量],0)<>0 ' ;
    ADOQuery.ExecSQL;

    ADOQuery.Close;
    ADOQuery.SQL.Text:=' Update #ExpenseListTtl set [预警数量]='
      +' Isnull([结存数量],0)-Isnull([库存下限数量],0)' ;
    ADOQuery.ExecSQL;

  end else
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Text:=' select ' + SelectStr1+ ExpSttcCheckListBox.hint
      +' into #ExpenseListTtl from #ExpenseList  '
      +WhereStr +' group by '+SelectStr1;
    ADOQuery.ExecSQL;
  end;

  adsMaster.Close;
  adsMaster.CommandText:=' select * from #ExpenseListTtl ';
  adsMaster.open;

  Panel6.Visible :=False;
  UpdateDBGrid;
  DBGrid.hint :='汇总项目:'+SelectStr1;
end;

procedure TSTClothStockRepForm.N1Click(Sender: TObject);
begin
  ExpSttcCheckListBox.Sorted :=not ExpSttcCheckListBox.Sorted;
end;

procedure TSTClothStockRepForm.N2Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=not ExpSttcCheckListBox.Checked[I];
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TSTClothStockRepForm.N3Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=True;
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TSTClothStockRepForm.N4Click(Sender: TObject);
var I:integer;
begin
  for I := 0 to ExpSttcCheckListBox.Items.Count - 1 do
  begin
    ExpSttcCheckListBox.Checked[I] :=False;
    ExpSttcCheckListBox.ItemIndex := I;
    ExpSttcCheckListBox.OnClickCheck(ExpSttcCheckListBox);
  end;
end;

procedure TSTClothStockRepForm.adsMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  adsMaster.IndexFieldNames := '';
end;

procedure TSTClothStockRepForm.ExpSttcCheckListBoxClickCheck(
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

procedure TSTClothStockRepForm.ListGoodsDetailActExecute(Sender: TObject);
var I:Integer;
  Goods :string;
begin
  for I:=0 to adsMaster.FieldCount-1 do
  begin
    if Pos('商品名称',adsMaster.Fields[I].FieldName)>0 then
    begin
      Goods := adsMaster.FieldByName('商品名称').AsString;
      if Trim(Goods)='' then Exit;
      adsMaster.Close;
      adsMaster.CommandText :='select * from #ExpenseList  where  [商品名称]='+Quotedstr(Goods);
      adsMaster.Open;
      UpdateDBGrid;
      Exit;
    end;
  end;
end;

procedure TSTClothStockRepForm.GoodsFlowListActExecute(Sender: TObject);
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

procedure TSTClothStockRepForm.Button4Click(Sender: TObject);
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

procedure TSTClothStockRepForm.DateTimePicker1CloseUp(Sender: TObject);
begin
  if DateTimePicker1.Date>DateTimePicker2.Date then
    DateTimePicker2.Date :=DateTimePicker1.Date;
end;

procedure TSTClothStockRepForm.DateTimePicker2CloseUp(Sender: TObject);
begin
  if DateTimePicker1.Date>DateTimePicker2.Date then
    DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TSTClothStockRepForm.Button6Click(Sender: TObject);
begin
  Panel2.Enabled :=True;
  DBGrid.Enabled :=True;
  VipsetPanel.Visible :=False;
end;

procedure TSTClothStockRepForm.Button5Click(Sender: TObject);
begin
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
  ADOQuery.SQL.Text :=' Insert into  #ExpenseList0 ( '
    +' [日期], [编号],[业务类别],[仓库名称], '
    +' [商品类别], [商品名称],[规格型号],[标准单位],'
    +' [出库标准数量], [出库标准单价],[出库金额],[出库包装单位],    '
    +' [出库包装数量], [出库包装单价], '
    +' [入库标准数量], [入库标准单价],[入库金额],[入库包装单位],    '
    +' [入库包装数量], [入库包装单价] ) '
    +' select '+Quotedstr(Datetostr(DateTimePicker1.Date-1))
    +' as [日期],'+Quotedstr('----')+' , '+Quotedstr('期初结转')+' , '
    +Quotedstr('----')+' [仓库名称], [商品类别] ,[商品名称], '
    +Quotedstr('----') +' [商品规格], [标准单位] , '
    +' sum(isnull([出库标准数量],0)) [出库标准数量] , '
    +' sum(0.00) [出库标准单价] , '
    +' sum(isnull([出库金额],0)) [出库金额] , '
    +' [标准单位] [出库包装单位] , '
    +' sum(isnull([出库标准数量],0)) [出库包装数量] , '
    +' sum(0.00) [出库包装单价]  , '
    +' sum(isnull([入库标准数量],0)) [入库标准数量] , '
    +' sum(0.00) [入库标准单价]  ,'
    +' sum(isnull([入库金额],0)) [入库金额] , '
    +' [标准单位] [入库包装单位] , '
    +' sum(isnull([入库标准数量],0)) [入库包装数量] , '
    +' sum(0.00)  [入库包装单价]   '
    +' from #ExpenseList '
    +' where [日期] <'+Quotedstr(Datetostr(DateTimePicker1.Date))
    +' Group by [商品名称], [商品类别],[标准单位]' ;
  ADOQuery.ExecSQL ;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Insert into  #ExpenseList0 '
    +' ( [商品名称],[日期],[编号],[业务类别],[商品类别] )'
    +' select Distinct [商品名称],  '
    + Quotedstr(Datetostr(DateTimePicker1.Date-1))
    +' as [日期],'+Quotedstr('----')+' , '+Quotedstr('期初结转')
    +' , [商品类别]'
    +' from #ExpenseList '
    +' where [商品名称] not in ( select distinct [商品名称] from #ExpenseList0  '
    +' where [业务类别]='+ Quotedstr('期初结转')+' ) '    ;
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

procedure TSTClothStockRepForm.ToolButton1Click(Sender: TObject);
var BalanceAmount,BalanceQuantity:real;
    I:Integer;
    FieldStr :string;
begin
//  Exit;
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
  ADOQuery.SQL.Text :=' select distinct [商品名称] from #ExpenseList ' + WhereStr;
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
    ADOQuery2.SQL.Text :=' select *  into  #ClientAccountList  '
      +' from #ExpenseList where 1=2 '   ;
    ADOQuery2.ExecSQL;
    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' select * from  #ClientAccountList ';
    ADOQuery2.open;
    FieldStr :='';
    for I:=0 to ADOQuery2.FieldCount-1 do
    begin
      FieldStr :=Trim(FieldStr)+','+Trim(ADOQuery2.Fields[I].FieldName);
    end;
    FieldStr :=Copy(Trim(FieldStr),2,length(Trim(FieldStr))-1);

    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' Truncate Table #ClientAccountList ';
    ADOQuery2.ExecSQL;

    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' ALTER TABLE  #ClientAccountList ADD [ID] '
      +' [int] IDENTITY (1, 1) NOT NULL , '
      +' [结存数量] float NULL ,[结存单价] float NULL,[结存金额] float NULL ';
    ADOQuery2.ExecSQL;
    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' Insert Into #ClientAccountList ( '+ FieldStr
      +' ) select '+  FieldStr +' from #ExpenseList where [商品名称]='
      +Quotedstr(Trim(ADOQuery.fieldbyname('商品名称').AsString))
      +' order by [日期]';
    ADOQuery2.ExecSQL;
    ADOQuery2.Close;
    ADOQuery2.SQL.Text :=' select * from  #ClientAccountList order by [日期],[ID]';
    ADOQuery2.open;
    BalanceQuantity :=0;
    BalanceAmount :=0;
    while not ADOQuery2.Eof do
    begin
      BalanceQuantity :=BalanceQuantity
        +ADOQuery2.FieldByName('入库标准数量').AsFloat-ADOQuery2.FieldByName('出库标准数量').AsFloat ;
      BalanceAmount :=BalanceAmount
        +ADOQuery2.FieldByName('入库金额').AsFloat-ADOQuery2.FieldByName('出库金额').AsFloat ;
      ADOQuery2.Edit;
      ADOQuery2.FieldByName('结存数量').AsFloat :=BalanceQuantity;
      ADOQuery2.FieldByName('结存金额').AsFloat :=BalanceAmount;
//      ADOQuery2.Edit;
      ADOQuery2.FieldByName('结存单价').AsFloat :=
      ADOQuery2.FieldByName('结存金额').AsFloat/ADOQuery2.FieldByName('结存数量').AsFloat;
      ADOQuery2.Next;

    end;
    AccountListQry.Close;
    AccountListQry.SQL.Text :=' Alter Table #ClientAccountList DROP COLUMN  [ID] ';
    AccountListQry.ExecSQL;

//    AccountListQry.Close;
//    AccountListQry.SQL.Text :=' select *   '
//      +' from  #ClientAccountList order by [日期] ';
//    AccountListQry.open;
//    DataSource1.DataSet := AccountListQry;
//    DBGrid1.DataSource :=  DataSource1;
//    DBGrid1.Visible :=True;
//    ShowMessage('请查看--'+ADOQuery.FieldByName('商品名称').AsString+' --对帐流水结果!');
    adsMaster.Close;
    adsMaster.CommandText :='select * from #ClientAccountList';
    adsMaster.Open;
    UpdateDBGrid;
    DBGrid.hint :='当前商品:'+Trim(ADOQuery.fieldbyname('商品名称').AsString)+'明细帐';

    //在此循环打印对帐单结果，完成后可以将 DBGrid1，DataSource1删除
    {
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
    if I<1 then  Report.PreviewModal
      else  Report.Print;
    finally
      Free;
    end;           }
    ADOQuery.Next;
    I :=I+1;
//    DBGrid1.Visible :=False;
  end;

end;

procedure TSTClothStockRepForm.adsMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefreshAvailableFields;
end;

procedure TSTClothStockRepForm.DeadStockActExecute(Sender: TObject);
var DeadStockDays :integer;
begin
  DeadStockDays :=30;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
      +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#DeadStockList')
      +' )) DROP TABLE #DeadStockList' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select [商品名称],'
    +' [结存数量] [结存数量],[结存金额] ,'
    +' [结存数量] ['+inttostr(DeadStockDays*1)+'天呆滞数量],'
    +' [结存金额] ['+inttostr(DeadStockDays*1)+'天呆滞金额],'
    +' [结存数量] ['+inttostr(DeadStockDays*2)+'天呆滞数量],'
    +' [结存金额] ['+inttostr(DeadStockDays*2)+'天呆滞金额],'
    +' [结存数量] ['+inttostr(DeadStockDays*3)+'天呆滞数量],'
    +' [结存金额] ['+inttostr(DeadStockDays*3)+'天呆滞金额],'
    +' [结存数量] ['+inttostr(DeadStockDays*4)+'天呆滞数量],'
    +' [结存金额] ['+inttostr(DeadStockDays*4)+'天呆滞金额],'
    +' [结存数量] ['+inttostr(DeadStockDays*5)+'天呆滞数量],'
    +' [结存金额] ['+inttostr(DeadStockDays*5)+'天呆滞金额],'
    +' [结存数量] ['+inttostr(DeadStockDays*6)+'天呆滞数量],'
    +' [结存金额] ['+inttostr(DeadStockDays*6)+'天呆滞金额] '
    +' into #DeadStockList from #StockListTtl '
    +' where Isnull([结存数量],0)+Isnull([结存金额],0)<>0 ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #DeadStockList set '
    +' ['+inttostr(DeadStockDays*1)+'天呆滞数量]=Null,'
    +' ['+inttostr(DeadStockDays*1)+'天呆滞金额]=Null,'
    +' ['+inttostr(DeadStockDays*2)+'天呆滞数量]=Null,'
    +' ['+inttostr(DeadStockDays*2)+'天呆滞金额]=Null,'
    +' ['+inttostr(DeadStockDays*3)+'天呆滞数量]=Null,'
    +' ['+inttostr(DeadStockDays*3)+'天呆滞金额]=Null,'
    +' ['+inttostr(DeadStockDays*4)+'天呆滞数量]=Null,'
    +' ['+inttostr(DeadStockDays*4)+'天呆滞金额]=Null,'
    +' ['+inttostr(DeadStockDays*5)+'天呆滞数量]=Null,'
    +' ['+inttostr(DeadStockDays*5)+'天呆滞金额]=Null,'
    +' ['+inttostr(DeadStockDays*6)+'天呆滞数量]=Null,'
    +' ['+inttostr(DeadStockDays*6)+'天呆滞金额]=Null '  ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #DeadStockList set '
    +' #DeadStockList.['+inttostr(DeadStockDays*1)+'天呆滞数量]= '
    +' #StockListTtl.[结存数量] , '
    +' #DeadStockList.['+inttostr(DeadStockDays*1)+'天呆滞金额]= '
    +' #StockListTtl.[结存金额]       '
    +' from #DeadStockList '
    +' left outer join #StockListTtl on '
    +' #StockListTtl.[商品名称]= #DeadStockList.[商品名称] '
    +' where #DeadStockList.[商品名称] not in (select [商品名称] '
    +' from #ExpenseList where [日期]>='
    +Quotedstr(datetostr(date-DeadStockDays*1))
    +' and [业务类别]<>'+Quotedstr('预警资料')+'  )';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #DeadStockList set '
    +' #DeadStockList.['+inttostr(DeadStockDays*2)+'天呆滞数量]= '
    +' #StockListTtl.[结存数量] , '
    +' #DeadStockList.['+inttostr(DeadStockDays*2)+'天呆滞金额]= '
    +' #StockListTtl.[结存金额]       '
    +' from #DeadStockList '
    +' left outer join #StockListTtl on '
    +' #StockListTtl.[商品名称]= #DeadStockList.[商品名称] '
    +' where #DeadStockList.[商品名称] not in (select [商品名称] '
    +' from #ExpenseList where [日期]>='
    +Quotedstr(datetostr(date-DeadStockDays*2))
    +' and [业务类别]<>'+Quotedstr('预警资料')+'  )';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #DeadStockList set '
    +' #DeadStockList.['+inttostr(DeadStockDays*3)+'天呆滞数量]= '
    +' #StockListTtl.[结存数量] , '
    +' #DeadStockList.['+inttostr(DeadStockDays*3)+'天呆滞金额]= '
    +' #StockListTtl.[结存金额]       '
    +' from #DeadStockList '
    +' left outer join #StockListTtl on '
    +' #StockListTtl.[商品名称]= #DeadStockList.[商品名称] '
    +' where #DeadStockList.[商品名称] not in (select [商品名称] '
    +' from #ExpenseList where [日期]>='
    +Quotedstr(datetostr(date-DeadStockDays*3))
    +' and [业务类别]<>'+Quotedstr('预警资料')+'  )';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #DeadStockList set '
    +' #DeadStockList.['+inttostr(DeadStockDays*4)+'天呆滞数量]= '
    +' #StockListTtl.[结存数量] , '
    +' #DeadStockList.['+inttostr(DeadStockDays*4)+'天呆滞金额]= '
    +' #StockListTtl.[结存金额]       '
    +' from #DeadStockList '
    +' left outer join #StockListTtl on '
    +' #StockListTtl.[商品名称]= #DeadStockList.[商品名称] '
    +' where #DeadStockList.[商品名称] not in (select [商品名称] '
    +' from #ExpenseList where [日期]>='
    +Quotedstr(datetostr(date-DeadStockDays*4))
    +' and [业务类别]<>'+Quotedstr('预警资料')+'  )';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #DeadStockList set '
    +' #DeadStockList.['+inttostr(DeadStockDays*5)+'天呆滞数量]= '
    +' #StockListTtl.[结存数量] , '
    +' #DeadStockList.['+inttostr(DeadStockDays*5)+'天呆滞金额]= '
    +' #StockListTtl.[结存金额]       '
    +' from #DeadStockList '
    +' left outer join #StockListTtl on '
    +' #StockListTtl.[商品名称]= #DeadStockList.[商品名称] '
    +' where #DeadStockList.[商品名称] not in (select [商品名称] '
    +' from #ExpenseList where [日期]>='
    +Quotedstr(datetostr(date-DeadStockDays*5))
    +' and [业务类别]<>'+Quotedstr('预警资料')+'  )';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #DeadStockList set '
    +' #DeadStockList.['+inttostr(DeadStockDays*6)+'天呆滞数量]= '
    +' #StockListTtl.[结存数量] , '
    +' #DeadStockList.['+inttostr(DeadStockDays*6)+'天呆滞金额]= '
    +' #StockListTtl.[结存金额]       '
    +' from #DeadStockList '
    +' left outer join #StockListTtl on '
    +' #StockListTtl.[商品名称]= #DeadStockList.[商品名称] '
    +' where #DeadStockList.[商品名称] not in (select [商品名称] '
    +' from #ExpenseList where [日期]>='
    +Quotedstr(datetostr(date-DeadStockDays*6))
    +' and [业务类别]<>'+Quotedstr('预警资料')+'  )';
  ADOQuery.ExecSQL;

  adsMaster.Close;
  adsMaster.CommandText :=' select * from #DeadStockList';
  adsMaster.Open;
  UpdateDBGrid;
  DBGrid.hint :='库存呆滞商品报表' ;
end;

end.
