unit SLSaleChainList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons,TypInfo,
  Menus;

type
  TSLSaleChainListForm = class(TWSVoucherBrowseForm)
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
    ADOQuery: TADOQuery;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn13: TBitBtn;
    ToolButton1: TToolButton;
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure UpdateDBGrid;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure adsMasterBeforeOpen(DataSet: TDataSet);
    procedure adsMasterAfterOpen(DataSet: TDataSet);

  private
    year,month,day,year1,month1,day1 :word;
    Datestr1,Datestr2 :string;
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  SLSaleChainListForm: TSLSaleChainListForm;

implementation

uses CommonDM ;

{$R *.dfm}

function TSLSaleChainListForm.CreateEditForm: TWSEditForm;
begin
//  Result :=;
end;

procedure TSLSaleChainListForm.DBGridCellClick(Column: TColumn);
begin
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.DBGridDblClick(Sender: TObject);
begin
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.UpdateDBGrid;
var  I: Integer;
begin
  with DBGrid.DataSource.DataSet do
  begin
    for I :=0 to DBGrid.DataSource.DataSet.FieldCount -1 do
    begin
      if DBGrid.DataSource.DataSet.Fields[i].DataType = TFieldType(ftFloat) then
        begin
          SetStrProp(DBGrid.DataSource.DataSet.Fields[I], 'DisplayFormat','#,#.00') ;
          DBGrid.DataSource.DataSet.Fields[i].DisplayWidth :=20;
        end;
    end;
  end;
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    Columns[0].Width :=200;
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

procedure TSLSaleChainListForm.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker1.Date>DateTimePicker2.Date then
      DateTimePicker2.Date :=DateTimePicker1.Date;
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DateStr1 :=Datetostr(DateTimePicker1.Date);
  DateStr2 :=Datetostr(DateTimePicker2.Date);
end;

procedure TSLSaleChainListForm.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker2.Date<DateTimePicker1.Date then
      DateTimePicker1.Date :=DateTimePicker2.Date;
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DateStr1 :=Datetostr(DateTimePicker1.Date);
  DateStr2 :=Datetostr(DateTimePicker2.Date);
end;

procedure TSLSaleChainListForm.BitBtn1Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select CLIENT as [客户名称],Sum(Isnull(Amount,0)) '
      +' as [金额合计] from #SLSaleChainList  '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Amount<>0'
      +' Group By CLIENT order by [金额合计] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn2Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select Employee as [业务员姓名],Sum(Isnull(Amount,0)) '
      +' as [金额合计] from #SLSaleChainList  '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Amount<>0'
      +' Group By Employee order by [金额合计] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn3Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select goods as [商品名称],Sum(Isnull(Amount,0)) '
      +' as [金额合计] from #SLSaleChainList  '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Amount<>0'
      +' Group By Goods order by [金额合计] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn4Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select Area as [地区名称],Sum(Isnull(Amount,0)) '
      +' as [金额合计] from #SLSaleChainList  '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Amount<>0'
      +' Group By Area order by [金额合计] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn5Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select GoodsClass as [商品类别名称],Sum(Isnull(Amount,0)) '
      +' as [金额合计] from #SLSaleChainList  '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Amount<>0'
      +' Group By GoodsClass order by [金额合计] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn6Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select Client as [客户名称],'
      +' Goods as [商品名称], sum(isnull(Quantity,0)) as [销售数量],'
      +' Sum(Isnull(Amount,0)) as [金额合计] , '
      +' GoalUnit as [标准单位] '
      +' from #SLSaleChainList  '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Quantity<>0'
      +' Group By Client,Goods, GoalUnit order by [销售数量] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn7Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select '
      +' Goods as [商品名称], sum(isnull(Quantity,0)) as [销售数量],'
      +' Sum(Isnull(Amount,0)) as [金额合计] , '
      +' GoalUnit as [标准单位] '
      +' from #SLSaleChainList  '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Quantity<>0'
      +' Group By Goods, GoalUnit order by [销售数量] Desc';
  adsMaster.open;
  UpdateDBGrid;end;

procedure TSLSaleChainListForm.BitBtn8Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select Area as [地区名称],'
      +' Goods as [商品名称], sum(isnull(Quantity,0)) as [销售数量],'
      +' Sum(Isnull(Amount,0)) as [金额合计] , '
      +' GoalUnit as [标准单位] '
      +' from #SLSaleChainList a '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Quantity<>0'
      +' Group By Area,Goods, GoalUnit order by [销售数量] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn9Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select GoodsClass as [商品分类名称],'
      +' Goods as [商品名称], sum(isnull(Quantity,0)) as [销售数量],'
      +' Sum(Isnull(Amount,0)) as [金额合计] , '
      +' GoalUnit as [标准单位] '
      +' from #SLSaleChainList a '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Quantity<>0'
      +' Group By GoodsClass,Goods, GoalUnit order by [销售数量] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn10Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select TimePeriod as [时间段],'
      +' Goods as [商品名称], sum(isnull(Quantity,0)) as [销售数量],'
      +' Sum(Isnull(Amount,0)) as [金额合计] , '
      +' GoalUnit as [标准单位] '
      +' from #SLSaleChainList a '
      +' left outer join DAGoodsClass b on b.ID=a.GoodsClassID'
      +' left outer join DAGoods c on c.ID=a.GoodsID'
      +' left outer join MSUnit d on d.ID=C.UnitID'
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Quantity<>0'
      +' Group By TimePeriod,Goods, GoalUnit order by [销售数量],TimePeriod Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn11Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select AreaT as [地区名称],'
      +' Goods as [商品名称], sum(isnull(Quantity,0)) as [销售数量],'
      +' Sum(Isnull(Amount,0)) as [金额合计] , '
      +' GoalUnit as [标准单位] '
      +' from #SLSaleChainList  '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Quantity<>0'
      +' Group By AreaT,Goods, GoalUnit order by [销售数量] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn12Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select AreaT as [地区名称],Sum(Isnull(Amount,0)) '
      +' as [金额合计] from #SLSaleChainList '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Amount<>0'
      +' Group By AreaT order by [金额合计] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn13Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select GoodsClassT as [商品分类名称],'
      +' Goods as [商品名称], sum(isnull(Quantity,0)) as [销售数量],'
      +' Sum(Isnull(Amount,0)) as [金额合计] , '
      +' Goalunit as [标准单位] '
      +' from #SLSaleChainList  '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Quantity<>0'
      +' Group By GoodsClassT,Goods, Goalunit order by [销售数量] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;

procedure TSLSaleChainListForm.BitBtn14Click(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.CommandText :=' select GoodsClassT as [商品类别名称],Sum(Isnull(Amount,0)) '
      +' as [金额合计] from #SLSaleChainList '
      +' where date>'+Quotedstr(Datestr1)+' and date<='
      +Quotedstr(Datestr2)+' and Amount<>0'
      +' Group By GoodsClassT order by [金额合计] Desc';
  adsMaster.open;
  UpdateDBGrid;
end;



procedure TSLSaleChainListForm.FormShow(Sender: TObject);
begin
  inherited;
  DecodeDate(date,year,month,day)  ;
  DateTimePicker1.Date :=Encodedate(year,month,1);
  DateTimePicker2.Date :=EndoftheMonth(date);
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DateStr1 :=Datetostr(DateTimePicker1.Date);
  DateStr2 :=Datetostr(DateTimePicker2.Date);
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#SLSaleChainList')
        +' )) DROP TABLE #SLSaleChainList ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text := ' CREATE TABLE #SLSaleChainList ( '
        +' [ID] [int] IDENTITY (1, 1) NOT NULL , '
        +' [RecordState] [Varchar] (12) NULL , '
        +' [Date] [datetime] NULL ,'
        +' [code] [int] NULL , '
        +' [TimePeriod] [varchar] (16)  NULL ,'
        +' [BillMode] [varchar] (16)  NULL , '
        +' [EmployeeID] [int] NULL ,	'
        +' [ClientID] [int] NULL , '
        +' [AreaID] [int] NULL , '
        +' [AreaIDT] [int] NULL , '
        +' [GoodsClassID] [int] NULL , '
        +' [AreaLevel] [varchar] (30)  NULL , '
        +' [Client] [varchar] (60)  NULL , '
        +' [Employee] [varchar] (60)  NULL , '
        +' [Goods] [varchar] (60)  NULL , '
        +' [Area] [varchar] (60)  NULL , '
        +' [AreaT] [varchar] (60)  NULL , '
        +' [GoodsClass] [varchar] (60)  NULL , '
        +' [GoodsClassT] [varchar] (60)  NULL , '
        +' [GoalUnit] [varchar] (60)  NULL , '
        +' [GoodsClassIDT] [int] NULL , '
        +' [GoodsID] [int] NULL ,'
        +' [GoodsClassLevel] [varchar] (30)  NULL ,'
        +' [GoodsSpec] [varchar] (30) NULL ,'
        +' [Quantity] [float] NULL , '
        +' [PackUnitID] [int] NULL , '
        +' [PriceBase] [float] NULL ,'
        +' [Amount] [float] NULL ,'
        +' [GoalUnitID] [int] NULL ,'
        +' [GoalQuantity] [float] NULL ) ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' truncate table  #SLSaleChainList ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  #SLSaleChainList ( '
      +' ClientID,EmployeeID,date,code,billmode,GoodsID, GoodsSpec,'
      +' Quantity,PackUnitID,PriceBase,Amount,GoalUnitID,'
      +' GoalQuantity,AreaID,GoodsClassID,TimePeriod )'
      +' select ClientID,EmployeeID,b.date,b.code,b.billmode,     '
      +' GoodsID, GoodsSpec ,                  '
      +' Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as Quantity ,'
      +' PackUnitID,PriceBase,                   '
      +' Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as Amount ,      '
      +' GoalUnitID,                               '
      +' GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as GoalQuantity, '
      +' c.AreaID ,d.GoodsClassID,b.date'
      +' from SLSaleClientDetail a                            '
      +' left outer join SLSaleClientMaster b on b.ID=a.MasterID '
      +' left outer join DAClient c on c.ID=b.ClientID'
      +' left outer join DAGoods d on d.ID=a.GoodsID '
      +' where b.RecordState<>'+Quotedstr('删除');
  ADOQuery.ExecSQL;
  
  ADOQuery.Close;
  ADOQuery.SQL.Text := ' update  #SLSaleChainList set TimePeriod=date' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text := ' update  #SLSaleChainList set  '
      +' TimePeriod=Rtrim(Ltrim(SUBSTRING(Rtrim(Ltrim(TimePeriod)),12,12)))';
  ADOQuery.ExecSQL;

  ADOQuery.Close;        //获取地区的levelcode
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList  '
      +' SET #SLSaleChainList.AreaLevel = DAArea.LevelCode '
      +' FROM #SLSaleChainList left outer  JOIN DAArea '
      +' ON (#SLSaleChainList.AreaID = DAArea.ID) ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close; //获取商品的levelcode
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList '
      +' SET #SLSaleChainList.GoodsClassLevel = DAGoodsClass.LevelCode '
      +' FROM #SLSaleChainList left outer  JOIN DAGoodsClass           '
      +' ON (#SLSaleChainList.GoodsClassID = DAGoodsClass.ID)               ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text := ' update  #SLSaleChainList set  '
      +' AreaLevel=SUBSTRING(Rtrim(Ltrim(AreaLevel)),1,3) ,'
      +' GoodsClassLevel=SUBSTRING(Rtrim(Ltrim(GoodsClassLevel)),1,3) ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;        //获取地区的新的地区ID
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList  '
      +' SET #SLSaleChainList.AreaIDT = DAArea.ID '
      +' FROM #SLSaleChainList left outer  JOIN DAArea '
      +' ON (#SLSaleChainList.AreaLevel = DAArea.LevelCode) ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close; //获取商品的levelcode
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList '
      +' SET #SLSaleChainList.GoodsClassIDT = DAGoodsClass.ID '
      +' FROM #SLSaleChainList left outer  JOIN DAGoodsClass           '
      +' ON (#SLSaleChainList.GoodsClassLevel = DAGoodsClass.LevelCode)               ';
  ADOQuery.ExecSQL;

  ADOQuery.Close; //获取客户名称
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList '
      +' SET #SLSaleChainList.Client = DAClient.name'
      +' FROM #SLSaleChainList left outer  JOIN DAClient           '
      +' ON (#SLSaleChainList.ClientID = DAClient.ID)    ';
  ADOQuery.ExecSQL;

  ADOQuery.Close; //获取业务员姓名
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList '
      +' SET #SLSaleChainList.Employee = MSEmployee.name'
      +' FROM #SLSaleChainList left outer  JOIN MSEmployee           '
      +' ON (#SLSaleChainList.EmployeeID = MSEmployee.ID)    ';
  ADOQuery.ExecSQL;

  ADOQuery.Close; //获取商品
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList '
      +' SET #SLSaleChainList.Goods = DAGoods.name'
      +' FROM #SLSaleChainList left outer  JOIN DAGoods           '
      +' ON (#SLSaleChainList.GoodsID = DAGoods.ID)    ';
  ADOQuery.ExecSQL;

  ADOQuery.Close; //获取地区
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList '
      +' SET #SLSaleChainList.Area = DAArea.name'
      +' FROM #SLSaleChainList left outer  JOIN DAArea           '
      +' ON (#SLSaleChainList.AreaID = DAArea.ID)    ';
  ADOQuery.ExecSQL;

  ADOQuery.Close; //获取地区汇总
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList '
      +' SET #SLSaleChainList.AreaT = DAArea.name'
      +' FROM #SLSaleChainList left outer  JOIN DAArea           '
      +' ON (#SLSaleChainList.AreaIDT = DAArea.ID)    ';
  ADOQuery.ExecSQL;

  ADOQuery.Close; //获取商品类别名称
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList '
      +' SET #SLSaleChainList.GoodsClass = DAGoodsClass.name'
      +' FROM #SLSaleChainList left outer  JOIN DAGoodsClass           '
      +' ON (#SLSaleChainList.GoodsClassID = DAGoodsClass.ID)    ';
  ADOQuery.ExecSQL;

  ADOQuery.Close; //获取商品汇总类别名称
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList '
      +' SET #SLSaleChainList.GoodsClassT = DAGoodsClass.name'
      +' FROM #SLSaleChainList left outer  JOIN DAGoodsClass           '
      +' ON (#SLSaleChainList.GoodsClassIDT = DAGoodsClass.ID)    ';
  ADOQuery.ExecSQL;

  ADOQuery.Close; //获取商品汇总类别名称
  ADOQuery.SQL.Text :=' UPDATE #SLSaleChainList '
      +' SET #SLSaleChainList.GoalUnit = MSUnit.name'
      +' FROM #SLSaleChainList left outer  JOIN MSUnit           '
      +' ON (#SLSaleChainList.GoalUnitID = MSUnit.ID)    ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  //--期初数据插入完毕
  BitBtn6Click(sender);
end;

procedure TSLSaleChainListForm.adsMasterBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  adsMaster.IndexFieldNames := '';
end;

procedure TSLSaleChainListForm.adsMasterAfterOpen(DataSet: TDataSet);
begin
  inherited;
  RefreshAvailableFields;
end;

end.
