unit YDBOMBack;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TYDBOMBackFrom = class(TWSVoucherBrowseForm)
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
    DataSource1: TDataSource;
    Splitter1: TSplitter;
    Adsgoodsin: TADODataSet;
    AdsgoodsinGoodsID: TIntegerField;
    Adsgoodsingoods: TStringField;
    AdsgoodsinOriginID: TIntegerField;
    Adsgoodsincode: TStringField;
    AdsgoodsinQuantity: TBCDField;
    Panel3: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn2: TBitBtn;
    QLDBGrid1: TQLDBGrid;
    adsMasterDSDesigner2: TBCDField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner4: TBCDField;
    adsMasterDSDesigner5: TBCDField;
    adsMasterDSDesigner6: TBCDField;
    adsMasterDSDesigner7: TBCDField;
    adsMasterDSDesigner8: TStringField;
    adsMasterDSDesigner: TStringField;
    ToolButton1: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure UpdateDBGrid;
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  YDBOMBackFrom: TYDBOMBackFrom;

implementation

uses CommonDM ;

{$R *.dfm}

function TYDBOMBackFrom.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TYDBOMBackFrom.BitBtn1Click(Sender: TObject);
var year,month,day,year1,month1,day1 :word;
    datestr,datestr1 :string;
begin
   DecodeDate(DateTimePicker1.Date,year, month, day);
   DecodeDate(DateTimePicker2.Date,year1, month1, day1);
   Datestr :=Datetostr(DateTimePicker1.Date);
   Datestr1 :=Datetostr(DateTimePicker2.Date);
   Adsgoodsin.Close;
   Adsgoodsin.CommandText :=' select GoodsID, b.name as goods,'
        +' a.OriginID,c.code,  sum(isnull(Quantity,0))        '
        +' as Quantity from (                                  '
        +' select b.date,a.ID ,a.GoodsID,A.GoodsSpec, a.Quantity*'
        +' Isnull(ModeDC,1)*Isnull(ModeC,1) as Quantity , '
        +' a.PackUnitID,a.QuantityPcs ,a.PriceBase ,               '
        +' a.Amount*Isnull(ModeDC,1)*Isnull(ModeC,1) as Amount , a.GoalUnitID, a.GoalQuantity ,b.OriginID     '
        +' from YDGoodsInDetail a                                  '
        +' left outer join YDGoodsInMaster b on b.ID=a.MasterID    '
        +' where OriginID<>0 ) as a                                '
        +' left outer join Dagoods b on b.id=a.Goodsid             '
        +' left outer join YDProductPlanMaster c on c.id=a.OriginID '
        +' where a.date>='+Quotedstr(datestr)+' and a.date<'
        + Quotedstr(datestr1) +' and a.GoodsId<>0 '
        +' group by GoodsID,b.name,c.code,a.OriginID ';
   Adsgoodsin.Open;

   if Adsgoodsin.IsEmpty then
   begin
    adsMaster.Close;
    adsMaster.CommandText :=' select '
      +' d.name as [物料名称], Quantity as [数量],'
      +' f.name as   [单位], PackPrice as [单价],'
      +' a.Amount as [成本], GoalQuantity as [标准数量],'
      +' UnitPrice as [标准单价], g.name as [标准单位] '
      +' from #TempStockb a '
      +' left outer join dagoods d on d.id=a.goodsid '
      +' left outer join msunit g on g.id=d.UnitID '
      +' left outer join msunit f on f.id=a.PackunitID'
      +' where Quantity<>0 and GoodsId<>0 and 1=2';
    adsMaster.Open;
    exit;
   end;
   Adsgoodsin.First;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' TRUNCATE TABLE #TempStockA' ;
   ADOQuery.ExecSQL;
   while not Adsgoodsin.Eof   do
   begin
     ADOQuery.Close;
     ADOQuery.SQL.Text :=' INSERT INTO  #TempStockA ('
          +' warehouseID,GoodsID,PackunitID,GoalunitID, '
          +' Quantity, GoalQuantity,Amount ) '
          +' select MasterID, GoodsID,PackUnitID,PackUnitID,'
          +' b.Sundryfee as Quantity ,Quantity as GoalQuantity,Amount'
          +' from  YDProductplanDetail a '
          +' left outer join YDProductplanMaster b on b.id=a.MasterID'
          +' where masterID='+Adsgoodsin.fieldbyname('OriginID').AsString;
     ADOQuery.ExecSQL;
     ADOQuery.Close;
     ADOQuery.SQL.Text :=' update  #TempStockA  set '
         +' GoalQuantity=GoalQuantity/Quantity*'+ Adsgoodsin.fieldbyname('Quantity').AsString
         +' , Amount=Amount/Quantity*'+ Adsgoodsin.fieldbyname('Quantity').AsString
         +' where warehouseID='+Adsgoodsin.fieldbyname('OriginID').AsString;
     ADOQuery.ExecSQL;
     Adsgoodsin.Next;
   end;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' TRUNCATE TABLE #TempStockb' ;
   ADOQuery.ExecSQL;

   ADOQuery.Close;
   ADOQuery.SQL.Text :=' INSERT INTO  #TempStockb ('
        +' GoodsID,PackunitID, '
        +' GoalQuantity,Amount ) '
        +' select GoodsID,PackUnitID,'
        +' sum(Isnull(GoalQuantity,0)),sum(isnull(Amount,0))'
        +' from  #TempStockA  '
        +' group by GoodsID,PackunitID'  ;
   ADOQuery.ExecSQL;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' update  #TempStockb set  GoalUnitID=PackunitID, '
        +' Quantity=GoalQuantity ';
   ADOQuery.ExecSQL;
   ADOQuery.Close;
   ADOQuery.SQL.Text :=' update  #TempStockb set  PackPrice=Amount/ '
        +' GoalQuantity ,UnitPrice=Amount/GoalQuantity '
        +' where GoalQuantity<>0';
   ADOQuery.ExecSQL;

   adsMaster.Close;
   adsMaster.CommandText :=' select '
        +' d.name as [物料名称], GoalQuantity as [数量],'
        +' f.name as   [单位], PackPrice as [单价],'
        +' a.Amount as [成本], GoalQuantity as [标准数量],'
        +' UnitPrice as [标准单价], g.name as [标准单位] '
        +' from #TempStockb a '
        +' left outer join dagoods d on d.id=a.goodsid '
        +' left outer join msunit g on g.id=d.UnitID '
        +' left outer join msunit f on f.id=a.PackunitID' 
        +' where Quantity<>0 and GoodsId<>0';
   adsMaster.Open;
   UpdateDBGrid;

end;

procedure TYDBOMBackFrom.FormCreate(Sender: TObject);
begin
  inherited;
  DateTimePicker1.Date :=date;
  DateTimePicker2.Date :=EndOfTheMonth(Date);
end;

procedure TYDBOMBackFrom.FormActivate(Sender: TObject);
begin
//  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempStocka')
        +' )) DROP TABLE #TempStocka ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempStockb')
        +' )) DROP TABLE #TempStockb ' ;
  ADOQuery.ExecSQL;

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
  BitBtn1Click(sender);
end;

procedure TYDBOMBackFrom.FormDeactivate(Sender: TObject);
begin
//  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempStocka')
        +' )) DROP TABLE #TempStocka ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempStockb')
        +' )) DROP TABLE #TempStockb ' ;
  ADOQuery.ExecSQL;

end;

procedure TYDBOMBackFrom.DBGridCellClick(Column: TColumn);
begin
  UpdateDBGrid;
end;

procedure TYDBOMBackFrom.DBGridDblClick(Sender: TObject);
begin
//  inherited;
  UpdateDBGrid;
end;

procedure TYDBOMBackFrom.UpdateDBGrid;
var  I: Integer;
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

procedure TYDBOMBackFrom.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
  if DateTimePicker2.Date<DateTimePicker1.Date then
      DateTimePicker1.Date := DateTimePicker2.Date;
end;

procedure TYDBOMBackFrom.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if DateTimePicker1.Date>DateTimePicker2.Date then
      DateTimePicker2.Date := DateTimePicker1.Date;
end;

end.
