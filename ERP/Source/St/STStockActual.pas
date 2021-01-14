unit STStockActual;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, DateUtils,ToolWin, ADODB, StdCtrls, Buttons, Menus;

type
  TSTStockActualFrom = class(TWSVoucherBrowseForm)
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
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    ADOQuery: TADOQuery;
    Label3: TLabel;
    adsStockChangeDSDesigner: TStringField;
    adsStockChangeDSDesigner2: TStringField;
    adsStockChangeDSDesigner3: TStringField;
    adsStockChangeDSDesigner4: TBCDField;
    adsStockChangeDSDesigner5: TBCDField;
    adsStockChangeDSDesigner7: TStringField;
    adsStockChangeDSDesigner8: TBCDField;
    adsStockChangeDSDesigner9: TBCDField;
    adsStockChangeDSDesigner6: TBCDField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure UpdateDBGrid;
    procedure DBGridDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  STStockActualFrom: TSTStockActualFrom;

implementation

uses CommonDM ;

{$R *.dfm}

function TSTStockActualFrom.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;

procedure TSTStockActualFrom.BitBtn1Click(Sender: TObject);
var year,month,day :word;
begin
   DecodeDate(DateTimePicker1.Date,year, month, day);
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' TRUNCATE TABLE #TempStockA' ;
   ADOQuery.ExecSQL;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' INSERT INTO  #TempStockA ('
        +' warehouseID,GoodsID,PackunitID,GoalunitID, '
        +' Quantity, GoalQuantity,Amount ) '
        +' select warehouseID,GoodsID,PackunitID,GoalunitID,  '
        +' Quantity,GoalQuantity,Amount '
        +' FROM ('
        +' select b.recordstate,b.date ,b.warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity*(-1) as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity*(-1) AS GoalQuantity, '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount*(-1) as Amount from  SLGoodsOutDetail a    '
        +' left outer join SLGoodsOutMaster b on b.ID=a.MasterID   '  //销售出库表
        +' UNION ALL '
        +' select b.recordstate,b.date ,b.warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity AS GoalQuantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount AS Amount from  PCGoodsInDetail a  '
        +' left outer join PCGoodsInMaster b on b.ID=a.MasterID   '   //采购入库表
        +' UNION ALL '
        +' select b.recordstate,b.date ,b.warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity*(-1) as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity*(-1) AS GoalQuantity,  '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount*(-1) AS Amount from  YDGoodsOutDetail a  '
        +' left outer join YDGoodsOutMaster b on b.ID=a.MasterID   ' //生产领料表
        +' UNION ALL '
        +' select b.recordstate,b.date ,b.warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity AS GoalQuantity,     '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount AS Amount from  YDGoodsInDetail a    '
        +' left outer join YDGoodsInMaster b on b.ID=a.MasterID   '  //生产入库表
        +' UNION ALL '
        +' select b.recordstate,b.date ,b.ClientID as warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity*(-1) as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity*(-1) AS GoalQuantity,     '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount*(-1) AS Amount from  STGoodsOutInDetail a   '
        +' left outer join STGoodsOutInMaster b on b.ID=a.MasterID   ' //库存变动表 (出货仓库)
        +' UNION ALL '
        +' select b.recordstate,b.date ,warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity AS GoalQuantity,      '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount AS Amount from  STGoodsOutInDetail a  '
        +' left outer join STGoodsOutInMaster b on b.ID=a.MasterID   ' //库存变动表 （入货仓库）
        +'   ) AS c'
        +' WHERE c.DATE<='+Quotedstr(INTTOSTR(year)+'-'+INTTOSTR(month)
        +'-'+INTTOSTR(day)) +' and c.recordstate<>'+Quotedstr('删除') ;
   ADOQuery.ExecSQL;

   ADOQuery.Close;
   ADOQuery.SQL.Text :=' TRUNCATE TABLE #TempStockB' ;
   ADOQuery.ExecSQL;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' INSERT INTO  #TempStockB('
            +' warehouseID,GoodsID,PackunitID,GoalunitID,  '
            +' Quantity,GoalQuantity,Amount ) '
            +' select warehouseID,GoodsID,PackunitID,GoalUnitID,'
            +' Sum(Isnull(Quantity,0)) as Quantity, Sum(Isnull(GoalQuantity,0)) as GoalQuantity,  '
            +' Sum(Isnull(Amount,0)) AS Amount '
            +' from #TempStockA '
            +' group by warehouseID,GoodsID,PackunitID,  '
            +' GoalUnitID order by warehouseID';
   ADOQuery.ExecSQL;

   ADOQuery.Close;
   ADOQuery.SQL.Text :=' update #TempStockb set PackPrice= '
       +' abs(Amount/Quantity) where Quantity<>0';
   ADOQuery.ExecSQL;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' update #TempStockb set UnitPrice= '
       +' abs(Amount/GoalQuantity) where GoalQuantity<>0';
   ADOQuery.ExecSQL;

   adsStockChange.Close;
   adsStockChange.CommandText :=' select e.name  as [仓库名称],'
        +' d.name as [商品名称], PackPrice as [单价],'
        +' f.name as   [单位], Quantity as [数量],'
        +' a.Amount as   [金额], UnitPrice as [标准单价], '
        +' g.name as [标准单位], GoalQuantity as [标准数量]  '
        +' from #TempStockb a  '
        +' left outer join dagoods d on d.id=a.goodsid '
        +' left outer join msunit g on g.id=a.GoalunitID '
        +' left outer join STWarehouse e on e.id=a.warehouseID '
        +' left outer join msunit f on f.id=a.PackunitID' ;
   adsStockChange.Open;
   UpdateDBGrid;
end;

procedure TSTStockActualFrom.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date :=Date;
end;

procedure TSTStockActualFrom.FormActivate(Sender: TObject);
begin
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #TempStocka ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[date] [datetime] null,              '
      +'	[warehouseID] [float] NULL ,      '
      +'	[GoodsID] [int] NULL ,               '
      +'	[PackunitID] [int] NULL ,            '
      +'	[Quantity] [float] NULL ,   '
      +'	[GoalUnitID] [int] NULL ,            '
      +'	[GoalQuantity] [float] NULL ,   '
      +'	[UnitPrice] [money] NULL ,           '
      +'	[PackPrice] [money] NULL ,           '
      +'	[Amount] [float] NULL   )     ';
  ADOQuery.ExecSQL;
  ADOQuery.SQL.Text :=' create table #TempStockb ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[date] [datetime] null,              '
      +'	[warehouseID] [float] NULL ,      '
      +'	[GoodsID] [int] NULL ,               '
      +'	[PackunitID] [int] NULL ,            '
      +'	[Quantity] [float] NULL ,   '
      +'	[GoalUnitID] [int] NULL ,            '
      +'	[GoalQuantity] [float] NULL ,   '
      +'	[UnitPrice] [money] NULL ,           '
      +'	[PackPrice] [money] NULL ,           '
      +'	[Amount] [float] NULL   )     ';
  ADOQuery.ExecSQL;
end;

procedure TSTStockActualFrom.FormDeactivate(Sender: TObject);
begin
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Drop table #TempStocka ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Drop table #TempStockb ';
  ADOQuery.ExecSQL;
end;

procedure TSTStockActualFrom.DBGridCellClick(Column: TColumn);
begin
  UpdateDBGrid;
end;

procedure TSTStockActualFrom.UpdateDBGrid;
var  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    Columns[0].Width :=150;
    for I := 1 to Columns.Count - 1 do
    begin
      Columns[I].Width :=150;
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

procedure TSTStockActualFrom.DBGridDblClick(Sender: TObject);
begin
//  inherited;
  UpdateDBGrid;
end;

end.
