unit FNEdVouchTran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TFNEdVouchTranForm = class(TBaseVoucherEditAForm)
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
    PopupMenu1: TPopupMenu;
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
    adsMasterIndirectFee: TBCDField;
    DBComboBox1: TDBComboBox;
    SpeedButton1: TSpeedButton;
    TempQry: TADOQuery;
    TpcPanel: TPanel;
    SpeedButton3: TSpeedButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure adsDetailPriceBaseChange(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure UpdateDetailData;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure PriceCostModeA;
    procedure PriceCostModeB;
    procedure PriceCostModeC;
    procedure FormShow(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);

  private
    { Private declarations }
   CostMode:string;
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  FNEdVouchTranForm: TFNEdVouchTranForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TFNEdVouchTranForm.New;
var year,month,day:word;
begin
  inherited;
  DecodeDate(date ,year, month, day);
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('ClearDate').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','STGoodsOutCostMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
//  adsMaster.FieldByName('BillMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='采购成本核算';
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('OriginTable').AsString:='STGoodsOutCostMaster';
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
end;

procedure TFNEdVouchTranForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TFNEdVouchTranForm.FormClose(Sender: TObject;
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

procedure TFNEdVouchTranForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'STGoodsOutCost';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  adsWarehouse.Open;
  adsGoodsSpec.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from STGoodsOutCostMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('成本核算');
  CostMode :='';
end;


procedure TFNEdVouchTranForm.adsDetailPriceBaseChange(Sender: TField);
begin
  inherited;
//  adsDetail.FieldByName('Amount').ReadOnly :=false;
  adsDetail.FieldByName('Amount').Value  :=
    adsDetail.fieldbyname('Pricebase').AsFloat *adsDetail.fieldbyname('GoalQuantity').AsFloat ;
  if adsDetail.FieldByName('Amount').IsNull then  adsDetail.FieldByName('Amount').AsFloat :=0;
end;


procedure TFNEdVouchTranForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
  DBComboBox1Change(sender);
end;


procedure TFNEdVouchTranForm.UpdateDetailData;
begin
  DetailDataSource.DataSet :=nil;
  TempAds.Close;
  TempAds.CommandText :=' select ID,UnitID,Spec from DAGoods'
      +' where ID<>0 and ID is not null and ID in '
      +' ( select Distinct GoodsID '
      +' from EGMaterialInDetail as a  '
      +' left outer join  EGMaterialInMaster as b on b.ID=a.MasterID '
      +' where b.date<='+Quotedstr(datetostr(Date))
      +' ) ';
  TempAds.Open;
  TempAds.First;
  adsDetail.First;
  while not TempAds.Eof do
  begin
    if adsDetail.Eof then adsDetail.Append
      else adsDetail.Edit;
//    adsDetail.FieldByName('GoodsID').ReadOnly :=False;
//    adsDetail.FieldByName('GoalUnitID').ReadOnly :=False;
//    adsDetail.FieldByName('GoodsSpec').ReadOnly :=False;

    adsDetail.FieldByName('GoodsID').AsInteger :=TempAds.fieldbyname('ID').AsInteger;
    adsDetail.FieldByName('GoalUnitID').AsInteger :=TempAds.fieldbyname('UnitID').AsInteger;
    adsDetail.FieldByName('GoodsSpec').AsString :=TempAds.fieldbyname('Spec').AsString;
    TempAds.Next;
    if not adsDetail.Eof then  adsDetail.Next;
  end;
//    adsDetail.FieldByName('GoodsID').ReadOnly :=True;
//    adsDetail.FieldByName('GoalUnitID').ReadOnly :=True;
//    adsDetail.FieldByName('GoodsSpec').ReadOnly :=True;
  DetailDataSource.DataSet :=adsDetail;

end;

procedure TFNEdVouchTranForm.BitBtn1Click(Sender: TObject);
begin
//
end;

procedure TFNEdVouchTranForm.BitBtn3Click(Sender: TObject);
begin

//
end;

procedure TFNEdVouchTranForm.BitBtn2Click(Sender: TObject);
begin

//
end;

procedure TFNEdVouchTranForm.PriceCostModeA;
begin
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Truncate TABLE #TempCostPrice ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempCostPrice  ('
    +' [GoodsID],[GoalQuantity],[Amount] ) '
    +' select GoodsID,  '
    +' sum(isnull(GoalQuantity,0)*isnull(b.ModeDC,1)*isnull(b.ModeC,1)), '
    +' sum(isnull(Amount,0)*isnull(b.ModeDC,1)*isnull(b.ModeC,1) )       '
    +' from EGMaterialInDetail as a                                      '
    +' left outer join  EGMaterialInMaster as b on b.ID=a.MasterID       '
    +' where GoodsID<>0 and GoodsID is not null and                      '
    +' b.date<='+Quotedstr(Datetostr(adsmaster.fieldbyname('ClearDate').AsDateTime))
    +' group by GoodsID  ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #TempCostPrice set '
    +' PriceCostOut= Amount/GoalQuantity '
    +' where GoalQuantity<>0 and GoalQuantity is not null ';
  ADOQuery.ExecSQL;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    TempAds.Close;
    TempAds.CommandText :='select PriceCostOut from  #TempCostPrice '
      +' where GoodsID='+ adsDetail.FieldByName('GoodsID').AsString;
    TempAds.Open;
    adsDetail.edit;
    adsDetail.FieldByName('PriceBase').AsFloat :=TempAds.fieldbyname('PriceCostOut').AsFloat;
    adsDetail.Next;
  end
end;

procedure TFNEdVouchTranForm.PriceCostModeB;
begin
//
end;

procedure TFNEdVouchTranForm.PriceCostModeC;
begin
//
end;

procedure TFNEdVouchTranForm.FormShow(Sender: TObject);
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempCostPrice')
        +' )) DROP TABLE #TempCostPrice ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #TempCostPrice  ('
    +' [id] [int] IDENTITY (1, 1) NOT NULL ,'
    +' [Date] [datetime] NULL ,  '
    +' [Code] [varchar] (20) NULL ,    '
    +' [GoodsID] [int] NULL ,'
    +' [GoalQuantity] [float] NULL ,'
    +' [PriceCost] [float] NULL,    '
    +' [Amount] [float] NULL ,'
    +' [GoalQuantityOut] [float] NULL ,'
    +' [PriceCostOut] [float] NULL,    '
    +' [AmountOut] [float] NULL  ) '    ;
  ADOQuery.ExecSQL;

end;

procedure TFNEdVouchTranForm.BitBtn4Click(Sender: TObject);
begin
//
end;

procedure TFNEdVouchTranForm.DBComboBox1Change(Sender: TObject);
//var adoTemp: TADOQuery;
begin
  {adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;  }

end;

procedure TFNEdVouchTranForm.SpeedButton1Click(Sender: TObject);
var LastDate :TDatetime;
    CalcTableName,selectSqlstr :string;
begin
  TpcPanel.Visible :=true;
  TpcPanel.Repaint;
  if Trim(DBComboBox1.Text) ='采购成本核算' then CalcTableName :='PCGoodsIn';
  if Trim(DBComboBox1.Text) ='生产领料核算' then CalcTableName :='YDGoodsOut';
  if Trim(DBComboBox1.Text) ='生产入库核算' then CalcTableName :='YDGoodsIn';
  TempQry.Close;
  TempQry.sql.text :='select max(ClearDate) as ClearDate from '
    +' STGoodsOutCostMaster  where BillMode='+Quotedstr(DBComboBox1.Text)
    +' and RecordState<>'+Quotedstr('删除')+' and RecordState<>'+Quotedstr('作废');
  TempQry.Open;
  if TempQry.FieldByName('ClearDate').IsNull  then   LastDate := EncodeDate(2001,01,01)
    else LastDate :=TempQry.FieldByName('ClearDate').AsDateTime ;

  if Trim(DBComboBox1.Text) ='采购成本核算' then
    selectSqlstr :=' select GoodsID,GoalUnitID, '
    +' sum(isnull(GoalQuantity,0)) as GoalQuantity '
    +' from ' +Trim(CalcTableName)+'Detail a '
    +' left outer join '+Trim(CalcTableName) +'Master b on b.ID=a.MasterID'
    +' where b.Date> '+Quotedstr(datetostr(LastDate))
    +' and b.Date<=' +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime))
    +' and b.RecordState<>'+Quotedstr('删除')+' and b.RecordState<>'+Quotedstr('作废')
    +' and a.GoodsID<>0 and a.GoodsID is not null '
    +' group by GoodsID,GoalUnitID';

  if Trim(DBComboBox1.Text) ='生产领料核算' then
    selectSqlstr :=' select GoodsID,GoalUnitID, '
    +' sum(isnull(GoalQuantity,0)) as GoalQuantity ,'
    +' sum(isnull(Amount,0)) as Amount '
    +' from ' +Trim(CalcTableName)+'Detail a '
    +' left outer join '+Trim(CalcTableName) +'Master b on b.ID=a.MasterID'
    +' where b.Date> '+Quotedstr(datetostr(LastDate))
    +' and b.Date<=' +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime))
    +' and b.RecordState<>'+Quotedstr('删除')+' and b.RecordState<>'+Quotedstr('作废')
    +' and a.GoodsID<>0 and a.GoodsID is not null '
    +' group by GoodsID,GoalUnitID';

  if Trim(DBComboBox1.Text) ='生产入库核算' then
    selectSqlstr :=' select GoodsID,GoalUnitID, '
    +' sum(isnull(GoalQuantity,0)) as GoalQuantity '
    +' from ' +Trim(CalcTableName)+'Detail a '
    +' left outer join '+Trim(CalcTableName) +'Master b on b.ID=a.MasterID'
    +' where b.Date> '+Quotedstr(datetostr(LastDate))
    +' and b.Date<=' +Quotedstr(datetostr(adsMaster.fieldbyname('ClearDate').asdatetime))
    +' and b.RecordState<>'+Quotedstr('删除')+' and b.RecordState<>'+Quotedstr('作废')
    +' and a.GoodsID<>0 and a.GoodsID is not null '
    +' group by GoodsID,GoalUnitID';
  TempQry.Close;
  TempQry.sql.text :=selectSqlstr;
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
    TempQry.Next;
  end;
  DetailDataSource.DataSet := adsDetail;
  TpcPanel.Visible :=False;
  CostMode := Trim(DBComboBox1.Text);
  if TempQry.IsEmpty then
  begin
    DBComboBox1Change(Sender) ;
    exit;
  end;

end;

procedure TFNEdVouchTranForm.SpeedButton3Click(Sender: TObject);
begin
  if adsDetail.IsEmpty then exit;
end;

procedure TFNEdVouchTranForm.SpeedButton2Click(Sender: TObject);
begin
  if adsDetail.IsEmpty then exit;
end;

end.
