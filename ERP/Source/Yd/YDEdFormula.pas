unit YDEdFormula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons,TypInfo, QLDBFlt, QuickRpt, QRExtra, QLRptBld,WSEdit,
  ImgList, WSCstFrm,  QLDBCstVw;

type
  TYDEdFormulaForm = class(TBaseVoucherEditAForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    GoodName: TADODataSet;
    GoodsOut: TADODataSet;
    dsGoodsOut: TDataSource;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    LookupEmployee: TQLDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
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
    adsDetailDiscount: TBCDField;
    adsDetailGoalQuantity: TBCDField;
    adsDetailSundryFee: TBCDField;
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
    adsDetailGoodsName: TStringField;
    DiscountMode: TAction;
    adsMasterEmployeeID: TIntegerField;
    adsMasterApportion: TStringField;
    adsMasterDeliver: TStringField;
    adsMasterOriginID: TIntegerField;
    adsMasterOriginTable: TStringField;
    adsMasterBillAffix: TBytesField;
    adsDetailMemo: TStringField;
    adsMasterBrief: TStringField;
    DbCBxBillMode: TDBComboBox;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    adsDetailTaxAmount: TBCDField;
    LookGoodsOut: TQLDBLookupComboBox;
    adsGoodsSpec: TADODataSet;
    dsGoodName: TDataSource;
    adsMasterEmployee: TStringField;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    adsMasterWarehouseID: TIntegerField;
    DBCBxBrief: TDBComboBox;
    adsGoodsSpecID: TAutoIncField;
    adsGoodsSpecCreateDate: TDateTimeField;
    adsGoodsSpecCreateUserID: TIntegerField;
    adsGoodsSpecRecordState: TStringField;
    adsGoodsSpecUpid: TIntegerField;
    adsGoodsSpecName: TStringField;
    adsGoodsSpecMemo: TStringField;
    adsGoodsSpecLevelCode: TStringField;
    adsDetailGoodsOutID: TIntegerField;
    AdsPackunit: TADODataSet;
    dsPackunit: TDataSource;
    adsDetailPackUnitName: TStringField;
    adsDetailGoalUnitName: TStringField;
    adsDetailGoodsOut: TStringField;
    SpeedButton1: TSpeedButton;
    adsDetailGoodsSpec: TStringField;
    DataSource1: TDataSource;
    adsDetailQuantityPcs: TBCDField;
    CALCosttipPanel: TPanel;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    adsDetailPriceCost: TBCDField;
    SpeedButton4: TSpeedButton;
    SpeedButton5: TSpeedButton;
    FormulaAssembleAct: TAction;
    FormulaAssemblePanel: TPanel;
    OKORCancelPanel: TPanel;
    OKBitBtn: TBitBtn;
    CanelBitBtn: TBitBtn;
    N41: TMenuItem;
    FormulaAssembleADS: TADODataSet;
    FormulaAssembleDS: TDataSource;
    FormulaAssembleGrd: TQLDBGrid;
    FormulaAssembleADSID: TAutoIncField;
    FormulaAssembleADSDSDesigner: TStringField;
    FormulaAssembleADSDSDesigner2: TStringField;
    FormulaAssembleADSDSDesigner3: TStringField;
    FormulaAssembleADSDSDesigner4: TDateTimeField;
    FormulaAssembleADSDSDesigner5: TStringField;
    FormulaAssembleADSDSDesigner6: TBCDField;
    FormulaAssembleADSDSDesigner7: TStringField;
    FormulaAssembleADSDSDesigner8: TStringField;
    FormulaAssembleADSGoodsID: TIntegerField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure adsDetailGoodsOutIDChange(Sender: TField);
    procedure adsDetailQuantityChange(Sender: TField);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure adsDetailPriceBaseChange(Sender: TField);
    procedure GoodsLookupButtonClick(Sender: TObject;
      Button: TLookupWindowBtn);
    procedure LookGoodsOutButtonClick(Sender: TObject;
      Button: TLookupWindowBtn);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure UpdateGrid(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormulaAssembleActExecute(Sender: TObject);
    procedure OKBitBtnClick(Sender: TObject);
    procedure CanelBitBtnClick(Sender: TObject);
    procedure FormulaAssembleGrdTitleClick(Column: TColumn);
  private
    FAllowSort: Boolean;
    { Private declarations }
  public
     SLPubQuerrySql,SLPubQuerryCaption:string;
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  YDEdFormulaForm: TYDEdFormulaForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
procedure TYDEdFormulaForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime:=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','YDFormulaMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
  adsMaster.FieldByName('BillMode').AsString:='基础配料清单';
  adsMaster.FieldByName('ModeDC').AsFloat:=1;
  adsMaster.FieldByName('ModeC').AsFloat:=1;
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
  adsMaster.FieldByName('ClearDate').AsDateTime:=date;
  adsMaster.FieldByName('OriginTable').AsString:='YDFormulaMaster';
end;

procedure TYDEdFormulaForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TYDEdFormulaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  GoodsOut.Close;
  adsGoodsSpec.Close;
end;

procedure TYDEdFormulaForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'YDFormula';
  adsMaster.Open;
  adsDetail.Open;
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  GoodsOut.Open;
  TempAds.close;
  TempAds.CommandText :='select distinct levelcode from DAAttribute'
      +' where name like'+Quotedstr('%商品%')+' and upid=-1';
  TempAds.open;
  TempAds.First;
  GoodsSpecStr :=' where (1<>1 ';
  while not TempAds.Eof do
  begin
    GoodsSpecStr :=GoodsSpecStr+' or Levelcode like '+Quotedstr('%'+
        Trim(TempAds.fieldbyname('Levelcode').AsString)+'%') ;
    TempAds.Next;
  end;
  GoodsSpecStr :=' select * from DAAttribute '+ GoodsSpecStr
      +' ) and (upid<>-1 and Recordstate<>'+Quotedstr('删除')+')';
  adsGoodsSpec.Close;
  adsGoodsSpec.CommandText :=GoodsSpecStr;
  adsGoodsSpec.Open;
  adsGoodsSpec.First;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct BillMode from YDFormulaMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    DBCBxBillMode.Items.Add(TempAds.FieldByName('BillMode').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  DBCBxBillMode.Items.Add('基础配料清单');
  
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from YDFormulaMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    DBCBxBrief.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  DBCBxBrief.Items.Add('基础配料清单');
end;

procedure TYDEdFormulaForm.adsDetailGoodsIDChange(Sender: TField);
begin
  inherited;
  DBGrid.Columns.ColumnByFieldName('PackUnitName').ReadOnly :=false;
  adsDetail.FieldByName('PackUnitID').AsInteger :=GoodName.fieldbyname('UnitID').AsInteger;
  if adsDetail.FieldByName('PackUnitID').IsNull then adsDetail.FieldByName('PackUnitID').AsInteger :=0;
  DBGrid.Columns.ColumnByFieldName('PackUnitName').ReadOnly :=true;
      adsDetail.FieldByName('PriceBase').AsFloat :=GoodName.fieldbyname('PricePurchase').AsFloat;
  if (adsDetail.FieldByName('Quantity').AsFloat =0) or (adsDetail.FieldByName('Quantity').IsNull) then
       adsDetail.FieldByName('Quantity').AsFloat :=1;
  if adsDetail.FieldByName('Quantity').IsNull then adsDetail.FieldByName('Quantity').AsInteger:=1;

end;

procedure TYDEdFormulaForm.adsDetailQuantityChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('Quantity').asfloat
         *adsDetail.fieldbyname('PriceBase').AsFloat;
end;


procedure TYDEdFormulaForm.adsDetailGoodsOutIDChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  DBGrid.Columns.ColumnByFieldName('GoalUnitName').ReadOnly :=false;
  adsDetail.FieldByName('GoalUnitID').AsInteger :=GoodsOut.fieldbyname('UnitID').AsInteger;
  if adsDetail.FieldByName('GoalUnitID').IsNull  then
       adsDetail.FieldByName('GoalUnitID').AsInteger :=0;
  DBGrid.Columns.ColumnByFieldName('GoalUnitName').ReadOnly :=true;
  if (adsDetail.FieldByName('GoalQuantity').IsNull) or (adsDetail.FieldByName('GoalQuantity').AsFloat=0) then
      adsDetail.FieldByName('GoalQuantity').AsInteger :=1;
end;


procedure TYDEdFormulaForm.adsDetailPriceBaseChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('Quantity').asfloat
         *adsDetail.fieldbyname('PriceBase').AsFloat;
end;

procedure TYDEdFormulaForm.GoodsLookupButtonClick(Sender: TObject;
  Button: TLookupWindowBtn);
begin
  inherited;
  adsDetail.Edit;
  adsDetail.FieldByName('GoodsID').AsInteger :=0;
   adsDetail.FieldByName('Quantity').Value :=null;
  adsDetail.FieldByName('PackUnitID').AsInteger :=0;
  adsDetail.FieldByName('PriceBase').Value :=Null;
  adsDetail.FieldByName('Amount').Value :=Null;

end;

procedure TYDEdFormulaForm.LookGoodsOutButtonClick(Sender: TObject;
  Button: TLookupWindowBtn);
begin
  inherited;
  adsDetail.Edit;
  adsDetail.FieldByName('GoodsOutID').AsInteger :=0;
  adsDetail.FieldByName('GoalUnitID').AsInteger :=0;
  adsDetail.FieldByName('GoalQuantity').Value :=null;
  adsDetail.FieldByName('SundryFee').value :=null;
  adsDetail.FieldByName('QuantityPcs').Value :=null;
  adsDetail.FieldByName('TaxAmount').Value :=null;

end;

procedure TYDEdFormulaForm.SpeedButton1Click(Sender: TObject);
var TQuan,Tamount,TaxAmount:real;
    I:integer;
begin
  inherited;
  CALCosttipPanel.Visible :=true;
  CALCosttipPanel.Repaint;
  DBGrid.DataSource :=nil;
  adsDetail.First;
  TQuan :=0;
  Tamount :=0;
  while not adsDetail.Eof do
  begin
    if (adsDetail.fieldbyname('GoodsOutID').IsNull) or (adsDetail.fieldbyname('GoodsOutID').AsInteger =0) then
    begin
      adsDetail.Edit;
      adsDetail.fieldbyname('GoalQuantity').Value :=null;
      adsDetail.fieldbyname('GoalUnitID').Value :=null;
      adsDetail.fieldbyname('TaxAmount').Value :=null;
      adsDetail.fieldbyname('SundryFee').Value :=null;
      adsDetail.fieldbyname('QuantityPcs').Value :=null;
    end;
    if not adsDetail.fieldbyname('GoalQuantity').IsNull then
    TQuan :=TQuan+adsDetail.fieldbyname('GoalQuantity').AsFloat;
    if not adsDetail.fieldbyname('Amount').IsNull then
    Tamount :=Tamount+adsDetail.fieldbyname('Amount').AsFloat;
    adsDetail.Next;
  end;
  if TQuan <> 0 then
  begin
    adsDetail.First;
    while not adsDetail.Eof do
    begin
      TaxAmount :=adsDetail.fieldbyname('GoalQuantity').AsFloat/TQuan;
      adsDetail.Edit;
      if TaxAmount<>0 then
        adsDetail.fieldbyname('TaxAmount').AsFloat :=TaxAmount
      else adsDetail.fieldbyname('TaxAmount').Value :=null;

      adsDetail.Next;
    end;
    adsDetail.First;
    TQuan :=0;
    while not adsDetail.Eof do
    begin
      TQuan :=TQuan+adsDetail.fieldbyname('TaxAmount').AsFloat;
      adsDetail.Next;
    end;
    if TQuan =0 then exit;
    adsDetail.First;
    while not adsDetail.Eof do
    begin
      TaxAmount :=Tamount* adsDetail.fieldbyname('TaxAmount').AsFloat/TQuan;
      adsDetail.Edit;
      if TaxAmount<>0 then adsDetail.fieldbyname('SundryFee').AsFloat:= TaxAmount;
      adsDetail.Next;
    end;
    adsDetail.First;
    while not adsDetail.Eof do
    begin
      adsDetail.Edit;
      TQuan :=adsDetail.fieldbyname('GoalQuantity').AsFloat;
      if TQuan<>0 then adsDetail.fieldbyname('QuantityPcs').AsFloat:=adsDetail.fieldbyname('SundryFee').AsFloat/TQuan;
      adsDetail.Next;
    end;
  end;
  DBGrid.DataSource :=DetailDataSource;
  CALCosttipPanel.Visible :=False;
  UpdateGrid(sender);
end;

procedure TYDEdFormulaForm.FormActivate(Sender: TObject);
begin
  inherited;
  DBCBxBrief.SetFocus;
end;

procedure TYDEdFormulaForm.UpdateGrid(Sender: TObject);
var i:integer;
begin
  with DBGrid do
  begin
    if Columns.Count<=1 then exit;
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    for I := 0 to Columns.Count -  1 do
      if Columns[I].Field is TNumericField then
      begin
        if (Pos('Price',Columns[I].FieldName)<=0) and (Pos('Pcs',Columns[I].FieldName)<=0) then
          Columns[I].Footer.ValueType := fvtSum;
      end;
    FooterRowCount := 1;
  end;
end;

procedure TYDEdFormulaForm.SpeedButton2Click(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TpCostPrice')
        +' )) DROP TABLE #TpCostPrice ' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.SQL.Text :=' create table #TpCostPrice ('
      +'	ID [int] IDENTITY (1, 1) NOT NULL ,'
      +'	GoodsID [int] NULL ,               '
      +'	GoalQuantity [float] NULL ,   '
      +'	CostPrice [float] NULL ,           '
      +'	Amount [float] NULL)   '   ;
  adoTemp.ExecSQL;
  with adoTemp do
  begin
    close;     //计算当前库存成本单价
    Sql.Text :=' truncate Table #TpCostPrice'  ;
    ExecSQL;
    close;
    Sql.Text :=' insert into  #TpCostPrice ('
      +' 	GoodsID, GoalQuantity,Amount )'
      +' select goodsid,sum(isnull(GoalQuantity,0)),sum(isnull(Amount,0)) '
      +' from (   '
      +' select GoodsID,GoalQuantity*Isnull(ModeDC,1)*Isnull(ModeC,1) as GoalQuantity,Amount*Isnull(ModeDC,1)*Isnull(ModeC,1) '
      +'  as Amount,recordstate  from PCgoodsIndetail a  '
      +' left outer join PCgoodsInMaster b on b.id=a.MasterID WHERE Amount<>0'
      +' UNION ALL                                                 '
      +' select GoodsID,GoalQuantity*Isnull(ModeDC,1)*Isnull(ModeC,1) as GoalQuantity,Amount*Isnull(ModeDC,1)*Isnull(ModeC,1)'
      +'  as Amount,recordstate from YDgoodsIndetail a                                  '
      +' left outer join YDgoodsInMaster b on b.id=a.MasterID Where Amount<>0'
      +' UNION ALL                                                                          '
      +' select GoodsID,GoalQuantity*Isnull(ModeDC,1)*Isnull(ModeC,1) as GoalQuantity,Amount*Isnull(ModeDC,1)*Isnull(ModeC,1)           '
      +'  as Amount,recordstate  from YDgoodsIndetail a                                 '
      +' left outer join STgoodsCountOffMaster b on b.id=a.MasterID Where Amount<>0'
      +' and BillMode like '+Quotedstr('%库存盘盈%' )+ ' ) as a  '
      +' where RecordState<>'+QuotedStr('删除')
      +' group by GoodsID  ' ;
    ExecSQL;
    close;
    Sql.Text :=' Update  #TpCostPrice  set CostPrice=abs(Amount/ '
        +' GoalQuantity) where GoalQuantity<>0';
    ExecSQL;
    close;
    Sql.Text :=' insert into  #TpCostPrice (GoodsID, CostPrice )'
        +' select ID,abs(PricePurchase) from DAgoods where ID not in '
        +' (select distinct GoodsID from #TpCostPrice)' ;
    ExecSQL;
  end;
  adoTemp.Close;
  adoTemp.SQL.Text :='select * from #TpCostPrice' ;
  adoTemp.Open;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adoTemp.Locate('GoodsID',adsDetail.FieldByName('GoodsID').AsString,[]);
    adsDetail.Edit;
    adsDetail.FieldByName('PriceBase').AsFloat := adoTemp.FieldByName('CostPrice').AsFloat;
    adsDetail.Next;
  end;
end;

procedure TYDEdFormulaForm.SpeedButton3Click(Sender: TObject);
var adoTemp: TADOQuery;
    GoodsIDStr,MaxDateStr :string;
    NewPriceCost :real;
begin
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TpCostPrice')
        +' )) DROP TABLE #TpCostPrice ' ;
  adoTemp.ExecSQL;

  adoTemp.Close;
  adoTemp.SQL.Text :=' create table #TpCostPrice ('
      +'	ID [int] IDENTITY (1, 1) NOT NULL ,'
      +'	GoodsID [int] NULL ,               '
      +'	Date [Datetime] NULL ,   '
      +'	GoalQuantity [float] NULL ,   '
      +'	CostPrice [float] NULL ,           '
      +'	Amount [float] NULL)   '   ;
  adoTemp.ExecSQL;

  //计算最新采购单位成本
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    GoodsIDStr :=adsDetail.fieldbyname('GoodsID').AsString;
    if Trim(GoodsIDStr)='' then GoodsIDStr :='0';
    adoTemp.Close;
    adoTemp.SQL.Text :=' Truncate table #TpCostPrice ';
    adoTemp.ExecSQL;

    adoTemp.close;
    adoTemp.Sql.Text :=' Insert into #TpCostPrice ( '
      +' Date,GoodsID,GoalQuantity,Amount )'
      +' select b.Date,GoodsID,GoalQuantity,Amount from '
      +' PCPurchaseDetail a left outer join PCPurchaseMaster b '
      +' on b.ID=a.MasterID where b.RecordState<>'+Quotedstr('删除')
      +' and b.RecordState<> '+ Quotedstr('作废')
      +' and GoodsID='+GoodsIDStr
      +' order by Date Desc ';
    adoTemp.ExecSQL;

    adoTemp.close;
    adoTemp.Sql.Text :=' Update #TpCostPrice set CostPrice='
        +' Amount/GoalQuantity where GoalQuantity<>0 and '
        +' GoalQuantity is not null';
    adoTemp.ExecSQL;

    adoTemp.close;
    adoTemp.Sql.Text :=' Delete from #TpCostPrice where CostPrice=0 and '
        +' CostPrice is  null';
    adoTemp.ExecSQL;
    adoTemp.close;
    adoTemp.Sql.Text :=' select * from  #TpCostPrice '
        +' order by Date,CostPrice Desc ';
    adoTemp.open;
    if (adoTemp.FieldByName('CostPrice').AsFloat<>0) and
       ( not adoTemp.FieldByName('CostPrice').IsNull ) then
         NewPriceCost := adoTemp.FieldByName('CostPrice').AsFloat
        else  NewPriceCost :=0;
    adsDetail.Edit;
    adsDetail.FieldByName('PriceBase').AsFloat :=NewPriceCost;
    adsDetail.Next;
  end;
end;

procedure TYDEdFormulaForm.SpeedButton4Click(Sender: TObject);
var adoTemp: TADOQuery;
begin
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' select * from DAGoods Where RecordState<> '
    +Quotedstr('删除')+' order by ID' ;
  adoTemp.Open;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adoTemp.Locate('ID',adsDetail.fieldbyname('GoodsID').AsString,[]);
    if (adsDetail.FieldByName('PriceBase').AsFloat=0) or (adsDetail.FieldByName('PriceBase').Value=null )
    then begin
      adsDetail.Edit;
      adsDetail.FieldByName('PriceBase').AsFloat :=adoTemp.FieldByName('PricePurchase').AsFloat;
    end;
    adsDetail.Next;
  end;
end;

procedure TYDEdFormulaForm.SpeedButton5Click(Sender: TObject);
var adoTemp: TADOQuery;
begin
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' select * from DAGoods Where RecordState<> '
    +Quotedstr('删除')+' order by ID' ;
  adoTemp.Open;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adoTemp.Locate('ID',adsDetail.fieldbyname('GoodsID').AsString,[]);
    adsDetail.Edit;
    adsDetail.FieldByName('PriceBase').AsFloat :=adoTemp.FieldByName('PricePurchase').AsFloat;
    adsDetail.Next;
  end;
end;

procedure TYDEdFormulaForm.FormulaAssembleActExecute(Sender: TObject);
begin
  FormulaAssembleADS.Close;
  FormulaAssembleADS.CommandText :=' select b.ID, a.GoodsID, '
    +' b.BillMode [清单类别],b.brief as [清单名称], '
    +' b.Code as [编号],b.Date [日期],c.name [投入材料], '
    +' a.Quantity [投入数量],d.name [单位],b.RecordState  [清单状态] '
    +' from YDFormulaDetail  a '
    +' left outer join  YDFormulaMaster b on b.ID=a.MasterID  '
    +' left outer join  DAGoods c  on             c.ID=a.GoodsID '
    +' left outer join  MSUnit    d   on             d.ID=c.UnitID '
    +' WHERE b.RECORDSTATE<>'+Quotedstr('删除')
    +' order by a.ID DESC ' ;
  FormulaAssembleADS.Open;
  if FormulaAssembleADS.IsEmpty then Exit;
  FormulaAssemblePanel.Visible :=True;
  TopPanel.Enabled :=False;
  DBGrid.Enabled :=False;
end;

procedure TYDEdFormulaForm.OKBitBtnClick(Sender: TObject);
var IDStr :string;
begin
  CanelBitBtnClick(Sender);
  IDStr :=FormulaAssembleADS.fieldbyname('ID').AsString;
  FormulaAssembleADS.Close;
  FormulaAssembleADS.CommandText :=' select b.ID, a.GoodsID, '
    +' b.BillMode [清单类别],b.brief as [清单名称], '
    +' b.Code as [编号],b.Date [日期],c.name [投入材料], '
    +' a.Quantity [投入数量],d.name [单位],b.RecordState  [清单状态] '
    +' from YDFormulaDetail  a '
    +' left outer join  YDFormulaMaster b on b.ID=a.MasterID  '
    +' left outer join  DAGoods c         on c.ID=a.GoodsID   '
    +' left outer join  MSUnit    d       on d.ID=c.UnitID    '
    +' WHERE b.ID='+IDStr;
  FormulaAssembleADS.Open;
  FormulaAssembleADS.First;
  adsDetail.Append;
  while not FormulaAssembleADS.Eof do
  begin
    if adsDetail.Eof then adsDetail.Append;
    adsDetail.FieldByName('GoodsID').AsInteger :=
     FormulaAssembleADS.FieldByName('GoodsID').AsInteger;
    FormulaAssembleADS.Next;
  end;
end;

procedure TYDEdFormulaForm.CanelBitBtnClick(Sender: TObject);
begin
  FormulaAssemblePanel.Visible :=False;
  TopPanel.Enabled :=True;
  DBGrid.Enabled :=True;
end;

procedure TYDEdFormulaForm.FormulaAssembleGrdTitleClick(Column: TColumn);
const
  IndexFieldNamesProp = 'IndexFieldNames';
var
  SortStr, OldSortStr: string;
begin
  if FAllowSort and (Column.Field <> nil) and IsPublishedProp(Column.Field.DataSet, IndexFieldNamesProp) then
    with Column do
    begin
      if Field.Lookup then SortStr := Field.KeyFields // Lookup 字段根据其关键字段排序
      else if Field.Calculated then
        // 计算字段不能排序
      else SortStr := Field.FieldName;
      OldSortStr := GetStrProp(Field.DataSet, IndexFieldNamesProp);
      if SortStr = OldSortStr then SortStr := SortStr + ' DESC';
      SetStrProp(Field.DataSet, IndexFieldNamesProp, SortStr);
    end;
end;

end.
