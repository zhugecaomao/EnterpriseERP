unit STStockChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TSTStockChangeFrom = class(TWSVoucherBrowseForm)
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
    adsStockChangeDSDesigner: TStringField;
    adsStockChangeDSDesigner2: TStringField;
    adsStockChangeDSDesigner3: TStringField;
    adsStockChangeDSDesigner4: TBCDField;
    adsStockChangeDSDesigner5: TBCDField;
    adsStockChangeDSDesigner6: TBCDField;
    adsStockChangeDSDesigner7: TStringField;
    adsStockChangeDSDesigner8: TBCDField;
    adsStockChangeDSDesigner9: TBCDField;
    adsStockChangeDSDesigner10: TBCDField;
    adsStockChangeDSDesigner11: TBCDField;
    adsStockChangeDSDesigner12: TBCDField;
    adsStockChangeDSDesigner13: TBCDField;
    adsStockChangeDSDesigner14: TBCDField;
    adsStockChangeDSDesigner15: TBCDField;
    adsStockChangeDSDesigner16: TBCDField;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure UpdateDBGrid;
    procedure DBGridTitleClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  STStockChangeFrom: TSTStockChangeFrom;

implementation

uses CommonDM ;

{$R *.dfm}

function TSTStockChangeFrom.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TSTStockChangeFrom.BitBtn1Click(Sender: TObject);
var year,month,day,year1,month1,day1 :word;
begin
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' TRUNCATE TABLE #TEMPSTOCK' ;
   ADOQuery.ExecSQL;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' INSERT INTO  #TEMPSTOCK ('
        +' warehouseID,GoodsID,GoalUnitID,FGoalQuantity,FAmount )'
        +' SELECT warehouseID,GoodsID,GoalUnitID,GoalQuantity,Amount '
        +'  FROM ('
        +' select b.date,b.warehouseID,GoodsID, GoalUnitID,  '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity*(-1) AS GoalQuantity,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount*(-1) as Amount from SLGoodsOutDetail a                                  '
        +' left outer join SLGoodsOutMaster b on b.ID=a.MasterID   ' //期初销售出库
        +' UNION ALL '
        +' select b.date,b.warehouseID,GoodsID,GoalUnitID,           '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantity,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount*(1) as Amount from PCGoodsIndetail a '
        +' left outer join PCGoodsInMaster b on b.ID=a.MasterID ' //期初采购入库
        +' UNION ALL '
        +' select b.date,b.warehouseID,GoodsID, GoalUnitID,  '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity*(-1) AS GoalQuantity,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount*(-1) as Amount from YDGoodsOutDetail a   '
        +' left outer join YDGoodsOutMaster b on b.ID=a.MasterID   ' //期初生产出库
        +' UNION ALL '
        +' select b.date,b.warehouseID,GoodsID,GoalUnitID,           '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantity,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as Amount from YDGoodsIndetail a   '
        +' left outer join YDGoodsInMaster b on b.ID=a.MasterID ' //期初生产入库
        +' UNION ALL '
        +' select b.date,b.ClientID as warehouseID,GoodsID,GoalUnitID,           '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity*(-1) AS GoalQuantity,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount*(-1) as Amount '
        +' from STGoodsOutIndetail a                                          '
        +' left outer join STGoodsOutInMaster b on b.ID=a.MasterID ' //期初库存调出
        +' UNION ALL '
        +' select b.date,b.warehouseID,GoodsID,GoalUnitID,           '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantity,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as Amount from STGoodsOutIndetail a  '
        +' left outer join STGoodsOutInMaster b on b.ID=a.MasterID ' //期初库存调入

        +' UNION ALL '
        +' select b.date,b.ClientID as warehouseID,GoodsID,GoalUnitID,           '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity*(-1) AS GoalQuantity,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount*(-1) as Amount '
        +' from STGoodsCountOffDetail a                                          '
        +' left outer join STGoodsCountOffMaster b on b.ID=a.MasterID '
        +' where  b.BillMode<>'+Quotedstr('库存盘盈')  //库存盘点表 (盘亏\生产损耗仓库)
        +' UNION ALL '
        +' select b.date,b.warehouseID,GoodsID,GoalUnitID,           '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantity,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as Amount from STGoodsCountOffDetail a  '
        +' left outer join STGoodsCountOffMaster b on b.ID=a.MasterID '
        +' where  b.BillMode='+Quotedstr('库存盘盈')           //期初库存调入
        +' ) AS bb'
        +' WHERE bb.DATE<='+Quotedstr(Datetostr(DateTimePicker1.Date)) ;
   ADOQuery.ExecSQL;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' INSERT INTO  #TEMPSTOCK ('
        +' date,BillMode,warehouseID,GoodsID,GoalUnitID,GoalQuantityin,  '
        +' GoalQuantityOut,AmountIn,AmountOut ) '
        +' select date,BillMode,warehouseID,GoodsID,GoalUnitID,'
        +' GoalQuantityin, GoalQuantityOut,AmountIn,AmountOut '
        +' FROM ('
        +' select b.recordstate,b.BillMode,b.date ,b.warehouseID,GoodsID, '
        +' GoalUnitID, 0.00 as GoalQuantityin,  '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantityOut,'
        +' 0.00 as AmountIn, b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as AmountOut from  SLGoodsOutDetail a '
        +' left outer join SLGoodsOutMaster b on b.ID=a.MasterID ' //销售出库
        +' UNION ALL '
        +' select b.recordstate,b.BillMode,b.date ,b.warehouseID,GoodsID,'
        +' GoalUnitID,0.00 as GoalQuantityin,  '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantityOut,'
        +' 0.00 as AmountIn,b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as AmountOut from  YDGoodsOutDetail a  '
        +' left outer join YDGoodsOutMaster b on b.ID=a.MasterID   ' //生产出库
        +' UNION ALL '
        +' select b.recordstate,b.BillMode,b.date ,b.warehouseID,GoodsID,'
        +' GoalUnitID,0.00 as GoalQuantityin,  '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantityOut,'
        +' 0.00 as AmountIn,b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as AmountOut from  STGoodsCountOffDetail a  '
        +' left outer join STGoodsCountOffMaster b on b.ID=a.MasterID   '
        +' where  b.BillMode<>'+Quotedstr('库存盘盈')   //库存盘点表 (盘亏\生产损耗仓库)
        +' UNION ALL '
        +' select b.recordstate,b.BillMode,b.date ,b.ClientID as warehouseID,GoodsID,GoalUnitID,'
        +'  0.00 as GoalQuantityin,  '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantityOut,'
        +' 0.00 as AmountIn,b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as AmountOut from  STGoodsOutInDetail a    '
        +' left outer join STGoodsOutInMaster b on b.ID=a.MasterID   ' //调拨出库
        +' UNION ALL '
        +' select b.recordstate,b.Billmode,b.date ,b.warehouseID,GoodsID,GoalUnitID,   '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantityIn, '
        +' 0.00 as GoalQuantityOut,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as AmountIn, 0.00 as AmountOut from PCGoodsinDetail a   '
        +' left outer join PCGoodsInMaster b on b.ID=a.MasterID ' //采购入库
        +' UNION ALL '
        +' select b.recordstate,b.Billmode,b.date ,b.warehouseID,GoodsID,GoalUnitID,   '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantityIn, '
        +' 0.00 as GoalQuantityOut,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as AmountIn, 0.00 as AmountOut from YDGoodsInDetail a   '
        +' left outer join YDGoodsInMaster b on b.ID=a.MasterID ' //生产入库
        +' UNION ALL '
        +' select b.recordstate,b.Billmode,b.date ,b.warehouseID,GoodsID,GoalUnitID,   '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantityIn, '
        +' 0.00 as GoalQuantityOut,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as AmountIn, 0.00 as AmountOut from STGoodsOutInDetail a   '
        +' left outer join STGoodsOutInMaster b on b.ID=a.MasterID ' //调拨入库
        +' UNION ALL '
        +' select b.recordstate,b.Billmode,b.date ,b.warehouseID,GoodsID,GoalUnitID,   '
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.GoalQuantity AS GoalQuantityIn, '
        +' 0.00 as GoalQuantityOut,'
        +' b.Isnull(ModeDC,1)*Isnull(ModeC,1)*a.Amount as AmountIn, 0.00 as AmountOut from STGoodsCountOffDetail a   '
        +' left outer join STGoodsCountOffMaster b on b.ID=a.MasterID '
        +' where  b.BillMode='+Quotedstr('库存盘盈')  //库存盘点表 (盘盈入库仓库)
        +' ) AS c'
        +' WHERE c.DATE>'+Quotedstr(Datetostr(DateTimePicker1.Date))
        + ' and c.DATE<='+Quotedstr(Datetostr(DateTimePicker2.Date))
        +' and c.recordstate<>'+Quotedstr('删除') ;
   ADOQuery.ExecSQL;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' TRUNCATE TABLE #TEMPSTOCKE' ;
   ADOQuery.ExecSQL;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' INSERT INTO  #TEMPSTOCKE ('
       +' warehouseID,GoodsID,GoalUnitID,'
       +' FGoalQuantity ,FAmount,BillMode , '
       +' GoalQuantityIn, AmountIn , '
       +' GoalQuantityOut ,AmountOut , '
       +' EGoalQuantity  , EAmount )'
       +' select warehouseID,GoodsID,GoalUnitID,'
       +' Sum(Isnull(FGoalQuantity,0)) , Sum(Isnull(FAmount,0)) ,  '
       +' BillMode , '
       +' Sum(Isnull(GoalQuantityIn,0)) , Sum(Isnull(AmountIn,0))  , '
       +' Sum(Isnull(GoalQuantityOut,0)) ,Sum(Isnull(AmountOut,0))  , '
       +' Sum(Isnull(GoalQuantityIn,0))+Sum(Isnull(FGoalQuantity,0))-'
       +' Sum(Isnull(GoalQuantityOut,0))  as EGoalQuantity,'
       +'  Sum(Isnull(FAmount,0))+  Sum(Isnull(AmountIn,0))-'
       +'  Sum(Isnull(AmountOut,0)) as EAmount'
       +' from #TEMPSTOCK '
       +' group by warehouseID,GoodsID,GoalUnitID ,BillMode order by warehouseID';
   ADOQuery.ExecSQL;

   ADOQuery.Close;
   ADOQuery.SQL.Text :=' update #TEMPSTOCKE set FPriceBase= '
       +' abs(FAmount/FGoalQuantity) where FGoalQuantity<>0';
   ADOQuery.ExecSQL;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' update #TempStockE set PriceIn= '
       +' abs(AmountIn/GoalQuantityIn)  where GoalQuantityIn<>0';
   ADOQuery.ExecSQL;

   ADOQuery.SQL.Text :=' update #TempStockE set PriceOut= '
       +' Abs(AmountOut/GoalQuantityOut) where GoalQuantityOut<>0';
   ADOQuery.ExecSQL;

   ADOQuery.Close;
   ADOQuery.SQL.Text :=' update #TempStockE set EPriceBase= '
       +' abs(EAmount/EGoalQuantity) where EGoalQuantity<>0';
   ADOQuery.ExecSQL;
   adsStockChange.Close;
   adsStockChange.CommandText :=' select e.name  as [仓库名称]  , '
        +' d.name as [商品名称], f.name as [标准单位] ,  '
        +' FGoalQuantity as [期初数量] ,   '
        +' FPriceBase as [期初单价]  ,           '
        +' FAmount as [期初金额]    ,   '
        +' BillMode as [本期变动方式] ,          '
        +' GoalQuantityIn as  [本期入库数量] ,   '
        +' PriceIn as [本期入库单价]  ,           '
        +' AmountIn as [本期入库金额]  ,      '
        +' GoalQuantityOut as  [本期出库数量] ,  '
        +' PriceOut as [本期出库单价]  ,           '
        +' AmountOut as [本期出库金额]  ,      '
        +' EGoalQuantity as [期末数量]  ,   '
        +' EPriceBase as [期末单价]  ,           '
        +' EAmount as [期末金额]    '
        +' from #TEMPSTOCKE a  '
        +' left outer join dagoods d on d.id=a.goodsid '
        +' left outer join STWarehouse e on e.id=a.warehouseID '
        +' left outer join msunit f on f.id=a.GoalunitID '
        +' where GoodsID<>0 and (Abs(GoalQuantityIn)+abs(GoalQuantityOut))<>0';
   adsStockChange.Open;
   UpdateDBGrid;
end;

procedure TSTStockChangeFrom.FormCreate(Sender: TObject);
var year,month,day :word;
begin
  inherited;
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DateTimePicker1.Date :=EnCodeDate(year,month,1);
  DateTimePicker2.Date :=Date;
//  DateTimePicker2.Date :=EndOfTheMonth(Date);
end;

procedure TSTStockChangeFrom.FormActivate(Sender: TObject);
begin
//  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #TempStock ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[date] [datetime] null,              '
      +'	[warehouseID] [float] NULL ,      '
      +'	[GoodsID] [int] NULL ,               '
      +'	[GoalUnitID] [int] NULL ,            '
      +'	[FGoalQuantity] [float] NULL ,   '
      +'	[FPriceBase] [money] NULL ,           '
      +'	[FAmount] [float] NULL   ,   '
      +'	[BillMode] [varchar] (16) ,          '
      +'	[GoalQuantityIn] [float] NULL ,   '
      +'	[AmountIn] [float] NULL ,      '
      +'	[PriceIn] [money] NULL ,           '
      +'	[GoalQuantityOut] [float] NULL ,  '
      +'	[AmountOut] [float] NULL ,      '
      +'	[PriceOut] [money] NULL ,           '
      +'	[EGoalQuantity] [float] NULL ,   '
      +'	[EPriceBase] [float] NULL ,           '
      +'	[EAmount] [float] NULL   )     ';
  ADOQuery.ExecSQL;
  ADOQuery.SQL.Text :=' create table #TempStockE ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[date] [datetime] null,              '
      +'	[warehouseID] [float] NULL ,      '
      +'	[GoodsID] [int] NULL ,               '
      +'	[GoalUnitID] [int] NULL ,            '
      +'	[FGoalQuantity] [float] NULL ,   '
      +'	[FPriceBase] [money] NULL ,           '
      +'	[FAmount] [float] NULL   ,   '
      +'	[BillMode] [varchar] (16) ,          '
      +'	[GoalQuantityIn] [float] NULL ,   '
      +'	[AmountIn] [float] NULL ,      '
      +'	[PriceIn] [money] NULL ,           '
      +'	[GoalQuantityOut] [float] NULL ,  '
      +'	[AmountOut] [float] NULL ,      '
      +'	[PriceOut] [money] NULL ,           '
      +'	[EGoalQuantity] [float] NULL ,   '
      +'	[EPriceBase] [float] NULL ,           '
      +'	[EAmount] [float] NULL   )     ';
  ADOQuery.ExecSQL;
  BitBtn1Click(Sender);
end;

procedure TSTStockChangeFrom.FormDeactivate(Sender: TObject);
begin
//  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempStock')
        +' )) DROP TABLE #TempStock '  ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempStockE')
        +' )) DROP TABLE #TempStockE '  ;
  ADOQuery.ExecSQL;
end;

procedure TSTStockChangeFrom.DBGridCellClick(Column: TColumn);
begin
//  UpdateDBGrid;
end;

procedure TSTStockChangeFrom.DBGridDblClick(Sender: TObject);
begin
//  inherited;
//  UpdateDBGrid;
end;

procedure TSTStockChangeFrom.UpdateDBGrid;
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

procedure TSTStockChangeFrom.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

end.
