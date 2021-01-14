unit STEdYDGoodsInCost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons, Types,QuickRpt;



type
  TSTEdYDGoodsInCostForm = class(TBaseVoucherEditAForm)
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
    procedure DBEdit4Exit(Sender: TObject);

  private
    { Private declarations }
   LastDate :TDatetime;
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  STEdYDGoodsInCostForm: TSTEdYDGoodsInCostForm;

implementation

uses CommonDM, WSUtils, WSSecurity, QLDBAgg;
{$R *.dfm}
procedure TSTEdYDGoodsInCostForm.New;
begin
  inherited;
  TempQry.Close;
  TempQry.sql.text :='select max(ClearDate) as ClearDate from '
    +' STYDGoodsInCostMaster  where RecordState<>'
    +Quotedstr('删除')+' and RecordState<>'+Quotedstr('作废');
  TempQry.Open;
  if TempQry.FieldByName('ClearDate').IsNull  then   LastDate := EncodeDate(2001,01,01)
    else LastDate :=TempQry.FieldByName('ClearDate').AsDateTime ;
  TempQry.Close;
  TempQry.sql.text :='select Apportion from '
    +' STYDGoodsInCostMaster  where ClearDate='
    + Quotedstr(Datetostr(LastDate))
    +' and RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+Quotedstr('作废');
  TempQry.Open;
  if TempQry.IsEmpty then adsMaster.FieldByName('Apportion').AsString :='加权平均'
   else adsMaster.FieldByName('Apportion').AsString :=TempQry.FieldByName('Apportion').AsString;
  adsMaster.FieldByName('LastCostDate').AsDateTime :=LastDate;
  adsMaster.FieldByName('Date').AsDateTime :=Date;
  adsMaster.FieldByName('ClearDate').AsDateTime :=Date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','STYDGoodsInCostMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BillMode').AsString:='生产成本核算';
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('OriginTable').AsString:='STYDGoodsInCostMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  SpeedButton1.Enabled :=True;
end;

procedure TSTEdYDGoodsInCostForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSTEdYDGoodsInCostForm.FormClose(Sender: TObject;
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

procedure TSTEdYDGoodsInCostForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'STYDGoodsInCost';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  adsWarehouse.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from STYDGoodsInCostMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('生产成本核算');
end;


procedure TSTEdYDGoodsInCostForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;


procedure TSTEdYDGoodsInCostForm.BitBtn1Click(Sender: TObject);
begin
  TpcPanel.Visible :=true;
  TpcPanel.Repaint;
  BitBtn1.Enabled :=False;
  adsMaster.Edit;
  adsMaster.FieldByName('Apportion').AsString :=BitBtn1.Caption;
  DetailDataSource.DataSet :=nil;
  TempQry.Close;
  TempQry.SQL.Text :='select * from #YDGoodsInCostPrice ';
  TempQry.open;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit ;
    TempQry.Locate('GoodsID',adsDetail.fieldbyname('GoodsID').AsInteger,[]);
    adsDetail.FieldByName('PriceGoal').AsFloat :=TempQry.fieldbyname('PriceCost').AsFloat;
    adsDetail.Next;
  end;
  DetailDataSource.DataSet :=adsDetail;
  BitBtn1.Enabled :=true;
  TpcPanel.Visible :=False;
end;

procedure TSTEdYDGoodsInCostForm.BitBtn3Click(Sender: TObject);
  procedure FindNewPrice ;
  var TotalGoalQuantity,TotalAmount :real;
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Text :='select sum(Isnull(GoalQuantity,0)*Isnull(ModeDC,1)*'
     +' Isnull(ModeC,1)) '
     +' as GoalQuantity from '
     +' YDGoodsInDetail a '
     +' Left outer join YDGoodsInMaster b on b.ID=a.MasterID '
     +' where b.Recordstate <>'+Quotedstr('删除')
     +' and b.Recordstate <>'+Quotedstr('作废')
     +' and GoodsID='+adsDetail.fieldbyname('GoodsID').AsString;
    ADOQuery.Open;
    TotalGoalQuantity :=ADOQuery.fieldbyname('GoalQuantity').AsFloat;
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
          +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempCostPrice')
          +' )) DROP TABLE #TempCostPrice ' ;
    ADOQuery.ExecSQL;
    ADOQuery.Close;
    ADOQuery.SQL.Text :='select a.ID,GoodsID, '
     +' Isnull(GoalQuantity,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as GoalQuantity ,'
     +' PriceGoal,'
     +' Isnull(Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as Amount '
     +' into #TempCostPrice '
     +' from '
     +' PCGoodsInDetail  a '
     +' Left outer join PCGoodsInMaster b on b.ID=a.MasterID '
     +' where GoodsID='+adsDetail.fieldbyname('GoodsID').AsString
     +' and b.Recordstate <>'+Quotedstr('删除')
     +' and b.Recordstate <>'+Quotedstr('作废')
     +' Order By a.ID Desc ' ;
    ADOQuery.ExecSQL;
    ADOQuery.Close;
    ADOQuery.SQL.Text :='select * from #TempCostPrice ';
    ADOQuery.open;
    ADOQuery.First;
    while not ADOQuery.Eof do
    begin
      if TotalGoalQuantity>ADOQuery.fieldbyname('GoalQuantity').AsFloat then
      begin
        TotalGoalQuantity :=TotalGoalQuantity-ADOQuery.fieldbyname('GoalQuantity').AsFloat ;
        ADOQuery.Delete ;
      end else
      begin
        ADOQuery.edit;
        ADOQuery.fieldbyname('GoalQuantity').AsFloat :=
           ADOQuery.fieldbyname('GoalQuantity').AsFloat-TotalGoalQuantity;
        Break;
      end;
    end;
    TotalGoalQuantity :=adsDetail.FieldByName('GoalQuantity').AsFloat ;
    TotalAmount :=0;
    ADOQuery.First;
    while not ADOQuery.Eof do
    begin
      if TotalGoalQuantity>adsDetail.FieldByName('GoalQuantity').AsFloat then
      begin
        TotalAmount :=TotalAmount+adsDetail.FieldByName('GoalQuantity').AsFloat*
          ADOQuery.FieldByName('PriceGoal').AsFloat;
        TotalGoalQuantity :=TotalGoalQuantity-adsDetail.FieldByName('GoalQuantity').AsFloat;
      end else
      begin
        TotalAmount :=TotalGoalQuantity*ADOQuery.FieldByName('PriceGoal').AsFloat;
        Break;
      end;
    end;
  adsDetail.Edit;
  adsDetail.FieldByName('Amount').AsFloat := TotalAmount;
  adsDetail.FieldByName('PriceGoal').AsFloat :=TotalAmount/adsDetail.FieldByName('GoalQuantity').AsFloat;
  end;
begin
  TpcPanel.Visible :=true;
  TpcPanel.Repaint;
  BitBtn3.Enabled :=False;
  adsMaster.Edit;
  adsMaster.FieldByName('Apportion').AsString :=BitBtn3.Caption;

  DetailDataSource.DataSet :=nil;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    FindNewPrice;
    adsDetail.Next;
  end;
  DetailDataSource.DataSet :=adsDetail;
  BitBtn3.Enabled :=true;
  TpcPanel.Visible :=False;
end;

procedure TSTEdYDGoodsInCostForm.BitBtn2Click(Sender: TObject);
  procedure FindNewPrice ;
  var TotalGoalQuantity,TotalAmount :real;
  begin
    ADOQuery.Close;
    ADOQuery.SQL.Text :='select sum(Isnull(GoalQuantity,0)*Isnull(ModeDC,1)*'
     +' Isnull(ModeC,1)) '
     +' as GoalQuantity from '
     +' YDGoodsInDetail a '
     +' Left outer join YDGoodsInMaster b on b.ID=a.MasterID '
     +' where b.Recordstate <>'+Quotedstr('删除')
     +' and b.Recordstate <>'+Quotedstr('作废')
     +' and GoodsID='+adsDetail.fieldbyname('GoodsID').AsString;
    ADOQuery.Open;
    TotalGoalQuantity :=ADOQuery.fieldbyname('GoalQuantity').AsFloat;
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
          +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempCostPrice')
          +' )) DROP TABLE #TempCostPrice ' ;
    ADOQuery.ExecSQL;
    ADOQuery.Close;
    ADOQuery.SQL.Text :='select a.ID,GoodsID, '
     +' Isnull(GoalQuantity,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as GoalQuantity ,'
     +' PriceGoal,'
     +' Isnull(Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as Amount '
     +' into #TempCostPrice '
     +' from '
     +' PCGoodsInDetail  a '
     +' Left outer join PCGoodsInMaster b on b.ID=a.MasterID '
     +' where GoodsID='+adsDetail.fieldbyname('GoodsID').AsString
     +' and b.Recordstate <>'+Quotedstr('删除')
     +' and b.Recordstate <>'+Quotedstr('作废')
     +' Order By a.ID ' ;
    ADOQuery.ExecSQL;
    ADOQuery.Close;
    ADOQuery.SQL.Text :='select * from #TempCostPrice ';
    ADOQuery.open;
    ADOQuery.First;
    while not ADOQuery.Eof do
    begin
      if TotalGoalQuantity>ADOQuery.fieldbyname('GoalQuantity').AsFloat then
      begin
        TotalGoalQuantity :=TotalGoalQuantity-ADOQuery.fieldbyname('GoalQuantity').AsFloat ;
        ADOQuery.Delete ;
      end else
      begin
        ADOQuery.edit;
        ADOQuery.fieldbyname('GoalQuantity').AsFloat :=
           ADOQuery.fieldbyname('GoalQuantity').AsFloat-TotalGoalQuantity;
        Break;
      end;
    end;
    TotalGoalQuantity :=adsDetail.FieldByName('GoalQuantity').AsFloat ;
    TotalAmount :=0;
    ADOQuery.First;
    while not ADOQuery.Eof do
    begin
      if TotalGoalQuantity>adsDetail.FieldByName('GoalQuantity').AsFloat then
      begin
        TotalAmount :=TotalAmount+adsDetail.FieldByName('GoalQuantity').AsFloat*
          ADOQuery.FieldByName('PriceGoal').AsFloat;
        TotalGoalQuantity :=TotalGoalQuantity-adsDetail.FieldByName('GoalQuantity').AsFloat;
      end else
      begin
        TotalAmount :=TotalGoalQuantity*ADOQuery.FieldByName('PriceGoal').AsFloat;
        Break;
      end;
    end;
  adsDetail.Edit;
  adsDetail.FieldByName('Amount').AsFloat := TotalAmount;
  adsDetail.FieldByName('PriceGoal').AsFloat :=TotalAmount/adsDetail.FieldByName('GoalQuantity').AsFloat;
  end;
begin
  TpcPanel.Visible :=true;
  TpcPanel.Repaint;
  BitBtn2.Enabled :=False;
  adsMaster.Edit;
  adsMaster.FieldByName('Apportion').AsString :=BitBtn2.Caption;

  DetailDataSource.DataSet :=nil;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    FindNewPrice;
    adsDetail.Next;
  end;
  DetailDataSource.DataSet :=adsDetail;
  BitBtn2.Enabled :=true;
  TpcPanel.Visible :=False;
end;


procedure TSTEdYDGoodsInCostForm.BitBtn4Click(Sender: TObject);
begin
  adsMaster.Edit;
  adsMaster.FieldByName('Apportion').AsString :=BitBtn4.Caption;
end;

procedure TSTEdYDGoodsInCostForm.SpeedButton1Click(Sender: TObject);
begin
  TpcPanel.Visible :=true;
  TpcPanel.Repaint;
  SpeedButton1.Enabled :=False;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#YDGoodsInCostPrice')
        +' )) DROP TABLE #YDGoodsInCostPrice ' ;
  ADOQuery.ExecSQL;

  ADOQuery.Close;//计算入库开单商品的移动平均（指定时间段内）
  ADOQuery.sql.text :=' select GoodsID, '
    +' sum(isnull(a.GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)) as GoalQuantity ,'
    +' sum(isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)) as PriceCost , '
    +' sum(isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)) as Amount '
    +' into #YDGoodsInCostPrice '
    +' from PCGoodsInDetail a '
    +' left outer join PCGoodsInMaster b on b.ID=a.MasterID'
    +' where b.Date<=' +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime))
    +' and b.RecordState<>'+Quotedstr('删除')
    +' and b.RecordState<>'+Quotedstr('作废')
    +' group by GoodsID order by GoodsID ';
  ADOQuery.ExecSQL;


  ADOQuery.Close;
  ADOQuery.sql.text :=' update #YDGoodsInCostPrice set PriceCost='
    +' Isnull(Amount,0)/GoalQuantity where Isnull(GoalQuantity,0)<>0 ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.sql.text :=' update #YDGoodsInCostPrice set PriceCost=0'
    +'  where Isnull(GoalQuantity,0)=0 ';
  ADOQuery.ExecSQL;

//  BitBtn1Click(sender);//默认加权平均法计算单价

  TempQry.Close;
  TempQry.sql.text :=' select GoodsID,c.UnitID GoalUnitID,a.MasterID OriginID,'
    +' (b.Code) as Memo,a.PriceGoal, '
    +' sum(isnull(a.GoalQuantity,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)) as GoalQuantity, '
    +' sum(isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)) as Amount '
    +' from YDGoodsInDetail a '
    +' left outer join YDGoodsInMaster b on b.ID=a.MasterID'
    +' left outer join DAGoods         c on c.ID=a.GoodsID'
    +' where b.Date<=' +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime))
    +' and b.RecordState<>'+Quotedstr('删除')+' and b.RecordState<>'+Quotedstr('作废')
    +' and MasterID not in (Select OriginID from STCALCostListMaster '
    +' where OriginTable=' +Quotedstr('YDGoodsInMaster')+' ) '
    +' group by a.GoodsID,c.UnitID,a.MasterID,b.Code,a.PriceGoal ';
  TempQry.Open;
  DetailDataSource.DataSet :=nil;
  while not adsDetail.Eof do adsDetail.Delete;
  while not TempQry.Eof do
  begin
    if adsDetail.Eof then adsDetail.Append;
    adsDetail.FieldByName('GoodsID').AsInteger := TempQry.fieldbyname('GoodsID').AsInteger;
    adsDetail.FieldByName('GoalUnitID').AsInteger := TempQry.fieldbyname('GoalUnitID').AsInteger;
    adsDetail.FieldByName('GoalQuantity').AsFloat := TempQry.fieldbyname('GoalQuantity').AsFloat;
    adsDetail.FieldByName('Amount').AsFloat := TempQry.fieldbyname('Amount').AsFloat;
    adsDetail.FieldByName('PriceGoal').AsFloat :=
      adsDetail.FieldByName('Amount').AsFloat/TempQry.fieldbyname('GoalQuantity').AsFloat;
    adsDetail.FieldByName('OriginID').AsFloat := TempQry.fieldbyname('OriginID').AsFloat;
    adsDetail.FieldByName('Memo').AsString    := '入库单:'+Trim(TempQry.fieldbyname('Memo').AsString);
    TempQry.Next;
  end;
  adsDetail.Append;
  DetailDataSource.DataSet :=adsDetail;
  TpcPanel.Visible :=False;
  if adsMaster.FieldByName('Apportion').AsString='加权平均' then BitBtn1Click(Sender);
  if adsMaster.FieldByName('Apportion').AsString='先进先出' then BitBtn2Click(Sender);
  if adsMaster.FieldByName('Apportion').AsString='后进先出' then BitBtn3Click(Sender);

  TempQry.Close;
  TempQry.sql.text :='select top 1 Apportion  from '
    +' STYDGoodsInCostMaster where RecordState<>'
    + Quotedstr('删除') +' and RecordState<>'+Quotedstr('作废');
  TempQry.Open;
  if TempQry.IsEmpty then
  begin
    BitBtn1.Enabled :=True ;
    BitBtn2.Enabled :=True ;
    BitBtn3.Enabled :=True ;
  end;


  SpeedButton1.Enabled :=True;
  SpeedButton2.Enabled :=True;
end;

procedure TSTEdYDGoodsInCostForm.SpeedButton3Click(Sender: TObject);
begin
  if adsDetail.IsEmpty then exit;
  TpcPanel.Visible :=true;
  TpcPanel.Repaint;
  TempQry.Close;//登记已计算入库成本的入库开单记录
  TempQry.SQL.Text :=' Insert into STCALCostListMaster '
    +' ( OriginID,OriginTable) '
    +' select ID,'+ Quotedstr('YDGoodsInMaster')
    +' as OriginTable from YDGoodsInMaster'
    +' where Date<=' +Quotedstr(Datetostr(adsMaster.fieldbyname('ClearDate').asdatetime))
    +' and RecordState<>'+Quotedstr('删除')+' and RecordState<>'+Quotedstr('作废')
    +' and ID not in (Select OriginID from STCALCostListMaster '
    +' where OriginTable='+Quotedstr('YDGoodsInMaster')+' )';
  TempQry.Execsql;

  TempQry.Close;     //更新入库入库商品成本单价 YDGoodsInMaster
  TempQry.SQL.Text :=' Update YDGoodsInDetail set '

    +' YDGoodsInDetail.PriceGoal=STYDGoodsInCostDetail.PriceCost,'
    +' YDGoodsInDetail.Amount= '
    +' STYDGoodsInCostDetail.PriceCost*YDGoodsInDetail.GoalQuantity, '
    +' YDGoodsInDetail.PriceBase= '
    +' STYDGoodsInCostDetail.PriceCost*YDGoodsInDetail.GoalQuantity/ '
    +' YDGoodsInDetail.Quantity '
    +' from YDGoodsInDetail left outer join STYDGoodsInCostDetail  '
    +' on STYDGoodsInCostDetail.GoodsID=YDGoodsInDetail.GoodsID '
    +' and STYDGoodsInCostDetail.OriginID=YDGoodsInDetail.MasterID '
    +' where YDGoodsInDetail.MasterID in (select OriginID from '
    +' STYDGoodsInCostDetail where MasterID='
    + adsMaster.fieldbyname('ID').AsString   + ' )'  ;
  TempQry.Execsql;
  TpcPanel.Visible :=False;
end;

procedure TSTEdYDGoodsInCostForm.SpeedButton2Click(Sender: TObject);
var
  Point: TPoint;
begin
  with TControl(Sender) do
    Point := Parent.ClientToScreen(Types.Point(Left, Top + Height));
  FeeAportPopupMenu.Popup(Point.X, Point.Y);

  if adsDetail.IsEmpty then exit;
end;

procedure TSTEdYDGoodsInCostForm.MenuItem1Click(Sender: TObject);
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

procedure TSTEdYDGoodsInCostForm.MenuItem2Click(Sender: TObject);
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

procedure TSTEdYDGoodsInCostForm.ClearSundryFeeActClick(Sender: TObject);
begin
  adsMaster.Edit;
  adsMaster.fieldbyname('Memo').AsString :='';
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

procedure TSTEdYDGoodsInCostForm.adsDetailSundryFeeChange(Sender: TField);
begin
  adsDetail.FieldByName('PriceCost').AsFloat :=
    (adsDetail.fieldbyname('Amount').AsFloat+adsDetail.fieldbyname('SundryFee').AsFloat)/
    adsDetail.fieldbyname('GoalQuantity').AsFloat;
end;

procedure TSTEdYDGoodsInCostForm.SaveActionExecute(Sender: TObject);
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

procedure TSTEdYDGoodsInCostForm.adsDetailPriceGoalChange(Sender: TField);
begin
  adsDetail.FieldByName('Amount').AsFloat :=
    adsDetail.fieldbyname('PriceGoal').AsFloat*adsDetail.fieldbyname('GoalQuantity').AsFloat;

  adsDetail.FieldByName('PriceCost').AsFloat :=
    (adsDetail.fieldbyname('Amount').AsFloat+adsDetail.fieldbyname('SundryFee').AsFloat)/
    adsDetail.fieldbyname('GoalQuantity').AsFloat;
end;

procedure TSTEdYDGoodsInCostForm.DBEdit4Exit(Sender: TObject);
begin
 if adsMaster.FieldByName('IndirectFee').AsFloat<>0 then SpeedButton2.Enabled :=True;

end;

end.
