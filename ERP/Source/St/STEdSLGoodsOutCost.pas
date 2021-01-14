unit STEdSLGoodsOutCost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons, Types,QuickRpt;



type
  TSTEdSLGoodsOutCostForm = class(TBaseVoucherEditAForm)
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    GoodName: TADODataSet;
    Label5: TLabel;
    PackUnit: TADODataSet;
    dsPackUnit: TDataSource;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    LookupEmployee: TQLDBLookupComboBox;
    TempAds: TADODataSet;
    adsMaster: TADODataSet;
    adsDetail: TADODataSet;
    adsDetailID: TAutoIncField;
    adsDetailMasterID: TIntegerField;
    adsDetailGoodsID: TIntegerField;
    adsDetailQuantity: TBCDField;
    adsDetailPackUnitID: TIntegerField;
    adsDetailPriceBase: TBCDField;
    adsDetailAmount: TBCDField;
    adsDetailGoalQuantity: TBCDField;
    adsDetailGoalUnitID: TIntegerField;
    adsMasterID: TAutoIncField;
    adsMasterCreateDate: TDateTimeField;
    adsMasterCreateUserID: TIntegerField;
    adsMasterRecordState: TStringField;
    adsMasterDate: TDateTimeField;
    adsMasterCode: TStringField;
    adsMasterClientID: TIntegerField;
    adsMasterBillMode: TStringField;
    adsMasterPeriodID: TIntegerField;
    adsMasterClearDate: TDateTimeField;
    adsMasterMemo: TStringField;
    adsMasterSundryFee: TBCDField;
    Label8: TLabel;
    adsMasterClientName: TStringField;
    DiscountMode: TAction;
    adsMasterEmployeeID: TIntegerField;
    adsMasterApportion: TStringField;
    adsMasterDeliver: TStringField;
    adsMasterOriginID: TIntegerField;
    adsMasterOriginTable: TStringField;
    adsMasterBillAffix: TBytesField;
    adsDetailMemo: TStringField;
    adsMasterBrief: TStringField;
    BriefComboBox: TDBComboBox;
    Label9: TLabel;
    adsDetailGoodsSpec: TStringField;
    adsGoodsSpec: TADODataSet;
    dsGoodsSpec: TDataSource;
    adsMasterEmployee: TStringField;
    StockQuerry: TAction;
    adsMasterWarehouseID: TIntegerField;
    adsWarehouse: TADODataSet;
    dsWarehouse: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    DBEdit2: TDBEdit;
    Label1: TLabel;
    adsDetailQuantityPcs: TBCDField;
    adsDetailDiscount: TBCDField;
    adsDetailTaxAmount: TBCDField;
    adsDetailSundryFee: TBCDField;
    adsDetailPackunit: TStringField;
    FeeAportPopupMenu: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    adsDetailGoalUnit: TStringField;
    adsDetailGoodsName: TStringField;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    ADOQuery: TADOQuery;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    SpeedButton1: TSpeedButton;
    TpcPanel: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    SpeedButton2: TSpeedButton;
    DBEdit1: TDBEdit;
    TempQry: TADOQuery;
    ClearSundryFeeAct: TMenuItem;
    adsDetailPriceCost: TBCDField;
    Label10: TLabel;
    DBEdit6: TDBEdit;
    adsMasterLastCostDate: TDateTimeField;
    adsMasterIndirectFee: TBCDField;
    adsDetailPriceGoal: TBCDField;
    adsDetailOriginID: TIntegerField;
    adsDetailOriginTable: TStringField;
    SpeedButton3: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure ClearSundryFeeActClick(Sender: TObject);
    procedure adsDetailSundryFeeChange(Sender: TField);
    procedure SaveActionExecute(Sender: TObject);
    procedure adsDetailPriceGoalChange(Sender: TField);

  private
    { Private declarations }
   LastDate :TDatetime;
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  STEdSLGoodsOutCostForm: TSTEdSLGoodsOutCostForm;

implementation

uses CommonDM, WSUtils, WSSecurity, QLDBAgg;
{$R *.dfm}
procedure TSTEdSLGoodsOutCostForm.New;
begin
  inherited;
  TempQry.Close;
  TempQry.sql.text :='select max(ClearDate) as ClearDate from '
    +' STSLGoodsOutCostMaster  where RecordState<>'
    +Quotedstr('删除')+' and RecordState<>'+Quotedstr('作废');
  TempQry.Open;

  if TempQry.FieldByName('ClearDate').IsNull  then   LastDate := EncodeDate(2001,01,01)
    else LastDate :=TempQry.FieldByName('ClearDate').AsDateTime ;

  adsMaster.FieldByName('LastCostDate').AsDateTime :=LastDate;
  adsMaster.FieldByName('Date').AsDateTime :=Date;
  adsMaster.FieldByName('ClearDate').AsDateTime :=Date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','STSLGoodsOutCostMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BillMode').AsString:='销售成本核算';
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('OriginTable').AsString:='STSLGoodsOutCostMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
  SpeedButton1.Enabled :=True;
  SpeedButton1.Enabled :=True;
end;

procedure TSTEdSLGoodsOutCostForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSTEdSLGoodsOutCostForm.FormClose(Sender: TObject;
var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  PackUnit.Close;
  adsWarehouse.Close;
  adsGoodsSpec.Close;
end;

procedure TSTEdSLGoodsOutCostForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'STSLGoodsOutCost';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  adsWarehouse.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from STSLGoodsOutCostMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('销售成本核算');
end;


procedure TSTEdSLGoodsOutCostForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;


procedure TSTEdSLGoodsOutCostForm.BitBtn1Click(Sender: TObject);
begin
  TpcPanel.Visible :=true;
  TpcPanel.Repaint;
  BitBtn1.Enabled :=False;
  adsMaster.Edit;
  adsMaster.FieldByName('Apportion').AsString :=BitBtn1.Caption;
  TempQry.Close;
  TempQry.SQL.Text :=' select GoodsID,GoalUnitID, '
    +' sum(isnull(GoalQuantity,0)) as GoalQuantity ,'
    +' sum(isnull(Amount,0)) as Amount '
    +' from  ( '
    +' select a.GoodsID,c.unitID as GoalUnitID, '
    +' isnull(GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as GoalQuantity ,'
    +' isnull(Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as Amount '
    +' from  PCGoodsInDetail a '
    +' left outer join PCGoodsInMaster b on b.ID=a.MasterID'
    +' left outer join DAGoods c on c.ID=a.GoodsID  '
    +' where b.Date<=' +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime))
    +' and b.RecordState<>'+Quotedstr('删除')+' and b.RecordState<>'+Quotedstr('作废')
    +' and a.MasterID not in ( Select OriginID from STSLGoodsOutCostDetail )  '
    +' and Isnull(a.GoodsID,0)<>0 '
    +'  Union all  '
    +' select a.GoodsID,c.unitID as GoalUnitID, '
    +' isnull(GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as GoalQuantity ,'
    +' isnull(Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as Amount '
    +' from  YDGoodsInDetail a '
    +' left outer join YDGoodsInMaster b on b.ID=a.MasterID'
    +' left outer join DAGoods c on c.ID=a.GoodsID  '
    +' where b.Date<=' +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime))
    +' and b.RecordState<>'+Quotedstr('删除')+' and b.RecordState<>'+Quotedstr('作废')
    +' and a.MasterID not in ( Select OriginID from STSLGoodsOutCostDetail )  '
    +' and Isnull(a.GoodsID,0)<>0 '
    +' ) as a group by a.GoodsID,a.GoalUnitID '   ;
  TempQry.Open;
  DetailDataSource.DataSet :=nil;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit ;
    TempQry.Locate('GoodsID',adsDetail.fieldbyname('GoodsID').AsInteger,[]);
    if (TempQry.fieldbyname('GoalQuantity').AsFloat<>0) then
       adsDetail.FieldByName('PriceGoal').AsFloat :=
         TempQry.fieldbyname('Amount').AsFloat/TempQry.fieldbyname('GoalQuantity').AsFloat;
    adsDetail.Next;
  end;
  DetailDataSource.DataSet :=adsDetail;
  BitBtn1.Enabled :=True;
  TpcPanel.Visible :=False;
end;

procedure TSTEdSLGoodsOutCostForm.BitBtn3Click(Sender: TObject);
begin
  adsMaster.Edit;
  adsMaster.FieldByName('Apportion').AsString :=BitBtn3.Caption;
end;

procedure TSTEdSLGoodsOutCostForm.BitBtn2Click(Sender: TObject);
begin
  adsMaster.Edit;
  adsMaster.FieldByName('Apportion').AsString :=BitBtn2.Caption;
end;

procedure TSTEdSLGoodsOutCostForm.BitBtn4Click(Sender: TObject);
begin
  adsMaster.Edit;
  adsMaster.FieldByName('Apportion').AsString :=BitBtn4.Caption;
end;

procedure TSTEdSLGoodsOutCostForm.SpeedButton1Click(Sender: TObject);
begin
  TpcPanel.Visible :=true;
  TpcPanel.Repaint;

  TempQry.Close;
  TempQry.sql.text :=' select GoodsID,c.UnitID  GoalUnitID,a.MasterID OriginID, ('
    +' b.Code) as Memo, '
    +' sum(isnull(GoalQuantity,0)) as GoalQuantity '
    +' from SLGoodsOutDetail a '
    +' left outer join SLGoodsOutMaster b on b.ID=a.MasterID'
    +' left outer join DAGoods          c on c.ID=a.GoodsID'
    +' where b.Date<=' +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime))
    +' and b.RecordState<>'+Quotedstr('删除')+' and b.RecordState<>'+Quotedstr('作废')
    +' and MasterID not in (Select OriginID from STSLGoodsOutCostDetail )  '
    +' and isnull(a.GoodsID,0)<>0  '
    +' group by GoodsID,c.UnitID,a.MasterID,b.Code ';
  TempQry.Open;

  DetailDataSource.DataSet :=nil;
  adsDetail.First;
  while not adsDetail.Eof do adsDetail.Delete;
  while not TempQry.Eof do
  begin
    if not adsDetail.Eof then adsDetail.Edit
      else adsDetail.Append;
    adsDetail.FieldByName('GoodsID').AsInteger := TempQry.fieldbyname('GoodsID').AsInteger;
    adsDetail.FieldByName('GoalUnitID').AsInteger := TempQry.fieldbyname('GoalUnitID').AsInteger;
    adsDetail.FieldByName('GoalQuantity').AsFloat := TempQry.fieldbyname('GoalQuantity').AsFloat;
    adsDetail.FieldByName('OriginID').AsFloat := TempQry.fieldbyname('OriginID').AsFloat;
    adsDetail.FieldByName('Memo').AsString    := '销售单:'+Trim(TempQry.fieldbyname('Memo').AsString);
    TempQry.Next;
  end;
  DetailDataSource.DataSet := adsDetail;
  TpcPanel.Visible :=False;
  BitBtn1.Enabled :=True ;
end;

procedure TSTEdSLGoodsOutCostForm.SpeedButton3Click(Sender: TObject);
   procedure FindNewPrice ;
   begin
     ADOQuery.Close;
     ADOQuery.SQL.Text :='select Top 1 a.PriceCost PriceGoal from STSLGoodsOutCostDetail  a '
       +' Left outer join STSLGoodsOutCostMaster b on b.ID=a.MasterID '
       +' where GoodsID='+TempQry.fieldbyname('GoodsID').AsString
       +' Order By b.Date Desc ' ;
     ADOQuery.Open;
   end;
   procedure FindYDGoodsInPrice ;
   begin
     ADOQuery.Close;
     ADOQuery.SQL.Text :='select Top 1 a.PriceCost PriceGoal from STYDGoodsInCostDetail  a '
       +' Left outer join STYDGoodsInCostMaster b on b.ID=a.MasterID '
       +' where GoodsID='+TempQry.fieldbyname('GoodsID').AsString
       +' Order By b.Date Desc ' ;
     ADOQuery.Open;
   end;

begin
  if adsDetail.IsEmpty then exit;
  TpcPanel.Visible :=true;
  TpcPanel.Repaint;
  TempQry.Close;
  TempQry.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
    +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#GoodsPCPrice')
    +' )) DROP TABLE #GoodsPCPrice ' ;
  TempQry.ExecSQL;

  TempQry.Close;
  TempQry.SQL.Text :=' select ID GoodsID,PricePurchase  PriceGoal  '
    +' into #GoodsPCPrice from DaGoods ';
  TempQry.ExecSQL;
  TempQry.Close;
  TempQry.SQL.Text :=' Update #GoodsPCPrice set PriceGoal=0  ';
  TempQry.ExecSQL;

  TempQry.Close;
  TempQry.SQL.Text :=' Select * from #GoodsPCPrice order by GoodsID';
  TempQry.Open;
  TempQry.First;
  while not TempQry.Eof do
  begin
    FindNewPrice;
    TempQry.Edit;
    TempQry.FieldByname('PriceGoal').AsFloat :=ADOQuery.FieldByName('PriceGoal').AsFloat;
    TempQry.Next;
  end;

  TempQry.Close;
  TempQry.SQL.Text :=' Select * from #GoodsPCPrice where PriceGoal=0 order by GoodsID';
  TempQry.Open;
  TempQry.First;
  while not TempQry.Eof do
  begin
    FindYDGoodsInPrice;
    TempQry.Edit;
    TempQry.FieldByname('PriceGoal').AsFloat :=ADOQuery.FieldByName('PriceGoal').AsFloat;
    TempQry.Next;
  end;

  TempQry.Close;     //更新采购入库商品成本单价
  TempQry.SQL.Text :=' Update PCGoodsInDetail set '
    +' PCGoodsInDetail.PriceGoal=#GoodsPCPrice.PriceGoal '
    +' from PCGoodsInDetail left outer join  #GoodsPCPrice '
    +' on #GoodsPCPrice.goodsid=PCGoodsInDetail.goodsid '
    +' Left Outer join PCGoodsInMaster  on PCGoodsInMaster.ID=PCGoodsInDetail.MasterID '
    +' where MasterID not in (select OriginID from  STCALCostListMaster '
    +' where OriginTable='+Quotedstr('PCGoodsInMaster')+')'
    +' and PCGoodsInMaster.Date<='
    +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime));
  TempQry.Execsql;
  TempQry.Close;
  TempQry.SQL.Text :=' Update PCGoodsInDetail set '
    +' Amount =PriceGoal*GoalQuantity from PCGoodsInDetail a '
    +' Left Outer join PCGoodsInMaster b on b.ID=a.MasterID '
    +' where MasterID not in (select OriginID from  STCALCostListMaster '
    +' where OriginTable='+Quotedstr('PCGoodsInMaster')+')'
    +' and b.Date<='
    +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime));
  TempQry.Execsql;

  TempQry.Close;//登记当前更新采购入库记录，避免重复更新导致成本金额错误
  TempQry.SQL.Text :=' Insert into STCALCostListMaster '
    +' ( OriginID,OriginTable) '
    +' select ID,'+ Quotedstr('PCGoodsInMaster')
    +' as OriginTable from PCGoodsInMaster'
    +' where ID not in (select OriginID from  STCALCostListMaster '
    +' where OriginTable='+Quotedstr('PCGoodsInMaster')+')'
    +' and Date<='
    +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime));
  TempQry.Execsql;

  TempQry.Close;     //更新生产领料商品成本单价
  TempQry.SQL.Text :=' Update YDGoodsOutDetail set '
    +' YDGoodsOutDetail.PriceGoal=#GoodsPCPrice.PriceGoal '
    +' from YDGoodsOutDetail left outer join  #GoodsPCPrice '
    +' on #GoodsPCPrice.goodsid=YDGoodsOutDetail.goodsid '
    +' Left Outer join YDGoodsOutMaster  on YDGoodsOutMaster.ID=YDGoodsOutDetail.MasterID '
    +' where MasterID not in (select OriginID from  STCALCostListMaster '
    +' where OriginTable='+Quotedstr('YDGoodsOutMaster')+')'
    +' and YDGoodsOutMaster.Date<='
    +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime));
  TempQry.Execsql;
  TempQry.Close;
  TempQry.SQL.Text :=' Update YDGoodsOutDetail set '
    +' Amount =PriceGoal*GoalQuantity from YDGoodsOutDetail a '
    +' Left Outer join YDGoodsOutMaster b on b.ID=a.MasterID '
    +' where MasterID not in (select OriginID from  STCALCostListMaster '
    +' where OriginTable='+Quotedstr('YDGoodsOutMaster')+')'
    +' and b.Date<='
    +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime));
  TempQry.Execsql;
  TempQry.Close;//登记当前更新生产领料记录，避免重复更新导致成本金额错误
  TempQry.SQL.Text :=' Insert into STCALCostListMaster '
    +' ( OriginID,OriginTable) '
    +' select ID,'+ Quotedstr('YDGoodsOutMaster')
    +' as OriginTable from YDGoodsOutMaster'
    +' where ID not in (select OriginID from  STCALCostListMaster '
    +' where OriginTable='+Quotedstr('YDGoodsOutMaster')+')'
    +' and Date<='
    +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime));
  TempQry.Execsql;
  TpcPanel.Visible :=False;
end;

procedure TSTEdSLGoodsOutCostForm.SpeedButton2Click(Sender: TObject);
var
  Point: TPoint;
begin
  with TControl(Sender) do
    Point := Parent.ClientToScreen(Types.Point(Left, Top + Height));
  FeeAportPopupMenu.Popup(Point.X, Point.Y);

  if adsDetail.IsEmpty then exit;
end;

procedure TSTEdSLGoodsOutCostForm.MenuItem1Click(Sender: TObject);
var TtlAmount,SundryFee :real;
begin
  adsMaster.Edit;
  adsMaster.fieldbyname('Memo').AsString :='按金额分摊';
  TpcPanel.Visible :=True;
  TpcPanel.Repaint ;
  SundryFee :=adsMaster.fieldbyname('SundryFee').AsFloat+adsMaster.fieldbyname('IndirectFee').AsFloat;
  TtlAmount := DBGrid.AggregateList.Aggregates.FindAggregate(atSum, 'Amount').AggregateValue;
  if TtlAmount=0 then TtlAmount :=1;
  DetailDataSource.DataSet :=nil;
  adsDetail.first;
  while not adsDetail.eof do
  begin
    adsDetail.edit;
    adsDetail.FieldByName('SundryFee').AsFloat :=
       SundryFee*(adsDetail.fieldbyname('Amount').AsFloat/TtlAmount);
    adsDetail.next;
  end;
  DetailDataSource.DataSet :=adsDetail;
  TpcPanel.Visible :=False;
end;

procedure TSTEdSLGoodsOutCostForm.MenuItem2Click(Sender: TObject);
var TtlAmount,SundryFee :real;
begin
  adsMaster.Edit;
  adsMaster.fieldbyname('Memo').AsString :='按数量分摊';
  TpcPanel.Visible :=True;
  TpcPanel.Repaint ;
  SundryFee :=adsMaster.fieldbyname('SundryFee').AsFloat+adsMaster.fieldbyname('IndirectFee').AsFloat;
  TtlAmount :=DBGrid.AggregateList.Aggregates.FindAggregate(atSum, 'GoalQuantity').AggregateValue;
  if TtlAmount=0 then TtlAmount :=1;
  DetailDataSource.DataSet :=nil;
  adsDetail.first;
  while not adsDetail.eof do
  begin
    adsDetail.edit;
    adsDetail.FieldByName('SundryFee').AsFloat :=
       SundryFee*(adsDetail.fieldbyname('GoalQuantity').AsFloat/TtlAmount);
    adsDetail.next;
  end;
  DetailDataSource.DataSet :=adsDetail;
  TpcPanel.Visible :=False;
end;

procedure TSTEdSLGoodsOutCostForm.ClearSundryFeeActClick(Sender: TObject);
begin
  DetailDataSource.DataSet :=nil;
  adsDetail.first;
  while not adsDetail.eof do
  begin
    adsDetail.edit;
    adsDetail.FieldByName('SundryFee').value :=null;
    adsDetail.next;
  end;
  DetailDataSource.DataSet :=adsDetail;
end;

procedure TSTEdSLGoodsOutCostForm.adsDetailSundryFeeChange(Sender: TField);
begin
  adsDetail.FieldByName('PriceCost').AsFloat :=
    (adsDetail.fieldbyname('Amount').AsFloat+adsDetail.fieldbyname('SundryFee').AsFloat)/
    adsDetail.fieldbyname('GoalQuantity').AsFloat;
end;

procedure TSTEdSLGoodsOutCostForm.SaveActionExecute(Sender: TObject);
var MessStr :Real;
begin
  TpcPanel.Visible :=true;
  TpcPanel.Repaint;

  MessStr := DBGrid.AggregateList.Aggregates.FindAggregate(atSum, 'SundryFee').AggregateValue;
//  showmessage(' 差额为:'+Floattostr(MessStr));
  if  MessStr=0 then
      MessStr :=adsMaster.FieldByName('SundryFee').AsFloat+adsMaster.FieldByName('IndirectFee').AsFloat
     else MessStr :=MessStr-adsMaster.FieldByName('SundryFee').AsFloat-adsMaster.FieldByName('IndirectFee').AsFloat;

  if  MessStr<>0 then
  begin
    showmessage('分摊后金额合计有差异,差额为:'+
    Copy(Floattostr(MessStr),1,Pos( '.',Trim(Floattostr(MessStr)))+3)) ;
    adsMaster.edit;
    adsMaster.FieldByName('Memo').asstring := Trim(adsMaster.FieldByName('Memo').asstring)
      +', 分摊差异:'+Copy(Floattostr(MessStr),1,Pos( '.',Trim(Floattostr(MessStr)))+3);
  end;
  inherited;
  SpeedButton3Click(Sender);
  TpcPanel.Visible :=False;

end;

procedure TSTEdSLGoodsOutCostForm.adsDetailPriceGoalChange(Sender: TField);
begin
  adsDetail.FieldByName('Amount').AsFloat :=
    adsDetail.fieldbyname('PriceGoal').AsFloat*adsDetail.fieldbyname('GoalQuantity').AsFloat;

  adsDetail.FieldByName('PriceCost').AsFloat :=
    (adsDetail.fieldbyname('Amount').AsFloat+adsDetail.fieldbyname('SundryFee').AsFloat)/
    adsDetail.fieldbyname('GoalQuantity').AsFloat;
end;

end.
