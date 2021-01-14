unit PCEdPurchase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TPCEdPurchaseForm = class(TBaseVoucherEditForm)
    Label1: TLabel;
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
    ClientQLDBLookup: TQLDBLookupComboBox;
    LookupEmployee: TQLDBLookupComboBox;
    Label6: TLabel;
    Label7: TLabel;
    LookupPackUint: TQLDBLookupComboBox;
    TempAds: TADODataSet;
    adsMaster: TADODataSet;
    adsDetail: TADODataSet;
    adsDetailID: TAutoIncField;
    adsDetailMasterID: TIntegerField;
    adsDetailGoodsID: TIntegerField;
    adsDetailQuantity: TBCDField;
    adsDetailQuantityPcs: TBCDField;
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
    adsDetailPackUnit: TStringField;
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
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label4: TLabel;
    DBEdit5: TDBEdit;
    GEdit1: TGEdit;
    adsDetailTaxAmount: TBCDField;
    adsDetailGoodsSpec: TStringField;
    adsGoodsSpec: TADODataSet;
    dsGoodsSpec: TDataSource;
    adsMasterEmployee: TStringField;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    adsDetailGoalUnit: TStringField;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    adsMasterWarehouseID: TIntegerField;
    adsDetailGoodsName: TStringField;
    PackUintFltAQ: TADODataSet;
    PackUintFltDS: TDataSource;
    NoCreditSale: TCheckBox;
    adsDetailPriceGoal: TBCDField;
    adsDetailPriceCost: TBCDField;
    DBEdit6: TDBEdit;
    adsMasterCashDiscount: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure adsDetailQuantityChange(Sender: TField);
    procedure ClientQLDBLookupEnter(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
    procedure LookupPackUintEnter(Sender: TObject);
    procedure NoCreditSaleClick(Sender: TObject);
    procedure LookupPackUintExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure adsDetailPackUnitIDChange(Sender: TField);
  private
    { Private declarations }
  protected
//    function CreateReport: TQuickRep; override;
    procedure InternalSave; override;
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  PCEdPurchaseForm: TPCEdPurchaseForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
procedure TPCEdPurchaseForm.New;
begin
  inherited;           //  .Value:=Date;
  adsMaster.FieldByName('Date').AsDateTime:=Date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','PCPurchaseMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
//  adsMaster.FieldByName('BIllMode').ReadOnly :=False;
  if NoCreditSale.Checked then   adsMaster.FieldByName('BillMode').AsString:='现款采购'
    else   adsMaster.FieldByName('BillMode').AsString:='采购开单';
//  adsMaster.FieldByName('BIllMode').ReadOnly :=True;
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
  adsMaster.FieldByName('OriginTable').AsString:='PCPurchaseMaster';
end;

procedure TPCEdPurchaseForm.Open(VoucherID: Integer);
var  SaveOnClick: TNotifyEvent;
begin
  inherited Open(VoucherID);
  SaveOnClick := NoCreditSale.OnClick;
  NoCreditSale.OnClick := nil;
  if Trim(adsMaster.FieldByName('BillMode').AsString)='现款采购'  then NoCreditSale.Checked :=True
    else NoCreditSale.Checked :=False;
  NoCreditSale.OnClick := SaveOnClick;
end;


procedure TPCEdPurchaseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  PackUnit.Close;
  adsGoodsSpec.Close;
end;

procedure TPCEdPurchaseForm.FormCreate(Sender: TObject);
var GoodsSpecStr:string;
begin
  inherited;
  VoucherTableName := 'PCPurchase';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
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
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from PCPurchaseMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('采购');
end;

procedure TPCEdPurchaseForm.adsDetailGoodsIDChange(Sender: TField);
var SGoodsID,SClientID:integer;
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) then exit;
  SGoodsID :=adsDetail.fieldbyname('GoodsID').AsInteger;
  if (adsMaster.fieldbyname('ClientID').IsNull) then  SClientID :=0
    else  SClientID :=adsMaster.fieldbyname('ClientID').AsInteger;
  TempAds.Close;
  TempAds.CommandText :=' select ID,UnitID from DAGoods where ID='+inttostr(SGoodsID);
  TempAds.Open;
  if (TempAds.FieldByName('UnitID').IsNull)  then
  begin
    adsDetail.FieldByName('GoalUnitID').AsInteger :=1;
    adsDetail.FieldByName('PackUnitID').AsInteger :=1;
  end  else
  begin
    adsDetail.FieldByName('GoalUnitID').AsInteger :=TempAds.FieldByName('UnitID').AsInteger;
    adsDetail.FieldByName('PackUnitID').AsInteger :=TempAds.FieldByName('UnitID').AsInteger;
  end;

  if Guarder.ContractPCPrice='是' then
  begin
    TempAds.Close;   //取当前厂商的合同进价
    TempAds.CommandText :=' SELECT b.Date,a.PriceGoal '
      +' FROM PCContractPriceDetail a  '
      +' LEFT JOIN PCContractPriceMaster  b on b.ID=a.MasterID '
      +' where b.RecordState<>'+Quotedstr('删除')
      +' and b.RecordState<>'+Quotedstr('作废')
      +' and   a.GoodsID='+inttostr(SGoodsID)
      +' and b.ClientID='+inttostr(SClientID)
      +'  order by b.Date DESC ';
    TempAds.Open;
  end else
  begin
    TempAds.Close;   //取当前厂商的合同进价
    TempAds.CommandText :=' SELECT b.Date,a.PriceGoal '
      +' FROM PCContractPriceDetail a  '
      +' LEFT JOIN PCContractPriceMaster  b on b.ID=a.MasterID '
      +' where 1=2 ' ;
    TempAds.Open;
  end;

  if (Guarder.LastadjustPCPrice='是') and (TempAds.IsEmpty)  then
  begin
    TempAds.Close;   //取当前商品的最新采购调价
    TempAds.CommandText :=' SELECT b.Date,a.PriceGoal '
      +' FROM PCPurchasePriceDetail a  '
      +' LEFT JOIN PCPurchaseMaster  b on b.ID=a.MasterID '
      +' where b.RecordState<>'+Quotedstr('删除')
      +' and b.RecordState<>'+Quotedstr('作废')
      +' and   a.GoodsID='+inttostr(SGoodsID)
      +'  order by b.Date DESC ';
    TempAds.Open;
  end;

  if (Guarder.LastSLPrice='是') and (TempAds.IsEmpty)  then
  begin
    TempAds.Close;   //取当前商品，当前厂商的最新进价
    TempAds.CommandText :=' SELECT b.Date,a.PriceGoal '
      +' FROM PCPurchaseDetail a  '
      +' LEFT JOIN PCPurchaseMaster  b on b.ID=a.MasterID '
      +' where b.RecordState<>'+Quotedstr('删除')
      +' and b.RecordState<>'+Quotedstr('作废')
      +' and   a.GoodsID='+inttostr(SGoodsID)
      +' and b.ClientID='+inttostr(SClientID)
      +'  order by b.Date DESC ';
    TempAds.Open;
  end;

  if TempAds.IsEmpty  then
  begin
    TempAds.Close;   //取当前商品的参考进价
    TempAds.CommandText :=' SELECT PricePurchase PriceGoal '
      +' FROM DAGoods    '
      +' where RecordState<>'+Quotedstr('删除')
      +' and RecordState<>'+Quotedstr('作废')
      +' and ID='+inttostr(SGoodsID);
    TempAds.Open;
  end;
  adsDetail.FieldByName('PriceGoal').AsFloat := TempAds.FieldByName('PriceGoal').AsFloat  ;
  adsDetail.FieldByName('PriceBase').AsFloat := TempAds.FieldByName('PriceGoal').AsFloat  ;
end;

procedure TPCEdPurchaseForm.adsDetailQuantityChange(Sender: TField);
var   ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;

  adsDetail.FieldByName('Amount').AsFloat :=
    adsDetail.fieldbyname('Quantity').asfloat*adsDetail.fieldbyname('PriceBase').AsFloat;

  adsDetail.FieldByName('GoalQuantity').AsFloat :=adsDetail.fieldbyname('Quantity').AsFloat*ExChRate;
  adsDetail.FieldByName('PriceGoal').AsFloat :=
    adsDetail.fieldbyname('Amount').AsFloat/adsDetail.fieldbyname('GoalQuantity').asfloat;
end;

procedure TPCEdPurchaseForm.ClientQLDBLookupEnter(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=true;
  GEdit1.Text :='0';
  GEdit1.Enabled :=false;
end;

procedure TPCEdPurchaseForm.ClientQLDBLookupExit(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  inherited;
  if   (adsMaster.fieldbyname('ClientID').IsNull) or
          (adsMaster.fieldbyname('ClientID').AsInteger=0)  then exit;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    close;
    sql.Text :=' select sum(isnull(AmountD,0))*(-1) as Balance from '
    +' (  select (isnull(a.amount,0)-isnull(a.Discount,0)+isnull(a.TaxAmount,0) '
    +' +isnull(a.SundryFee,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD                         '
    +' from  SLSaleDetail a                                                     '
    +' left outer join  SLSaleMaster b on b.ID=a.MasterID                       '
    +' where b.RecordState<>'+Quotedstr('删除')+' and b.ClientID='
    + adsMaster.fieldbyname('ClientID').AsString
    +' UNION ALL                                                   '
    +' select (isnull(a.amount,0)-isnull(a.Discount,0)+isnull(a.TaxAmount,0) '
    +' +isnull(a.SundryFee,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as amountD                 '
    +' from  PCPurchaseDetail a                                              '
    +' left outer join  PCPurchaseMaster b on b.ID=a.MasterID                '
    +' where b.RecordState<>'+Quotedstr('删除')+' and b.ClientID='
    + adsMaster.fieldbyname('ClientID').AsString
    +' UNION ALL                                                             '
    +' select (Isnull(AmountD,0)+Isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1)     '
    +' as AmountD                                                            '
    +' from FNClearPCMaster                                                  '
    +' where RecordState<>'+Quotedstr('删除')+' and ClientID='
    + adsMaster.fieldbyname('ClientID').AsString
    +' UNION ALL                                                             '
    +' select (Isnull(AmountC,0)+Isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1)          '
    +' as AmountD                                                            '
    +' from FNClearPCMaster                                                  '
    +' where RecordState<>'+Quotedstr('删除')+' and ClientID='
    + adsMaster.fieldbyname('ClientID').AsString +'  ) as a ';
    open;
    GEdit1.Enabled :=true;
    if  adoTemp.IsEmpty then     GEdit1.Text :='0'
      else   GEdit1.Text :=fieldbyname('Balance').asstring;
    GEdit1.Enabled :=False;
  end;
end;

procedure TPCEdPurchaseForm.LookupPackUintEnter(Sender: TObject);
var GoodsIDstr :string;
begin
  GoodsIDstr :=adsDetail.fieldbyname('GoodsID').asstring;
  if Trim(GoodsIDstr)='' then  exit;
  LookupPackUint.ListSource := PackUintFltDS;
  PackUintFltAQ.Close;
  PackUintFltAQ.CommandText :=' select ID, Name, ExchangeRate, GoalUnitID,'
      +' IsGoalUnit from MSUnit where RecordState<>'+Quotedstr('删除')
      +' and  GoalUnitID in (select UnitID from DaGoods where ID='
      +GoodsIDstr +' ) order by GoalUnitID,ExchangeRate' ;
  PackUintFltAQ.Open;
end;

procedure TPCEdPurchaseForm.NoCreditSaleClick(Sender: TObject);
begin
  if NoCreditSale.Checked then
  begin
    adsMaster.Edit;
    if pos(Trim(NoCreditSale.Caption),Trim(adsMaster.FieldByName('Memo').AsString))<=0 then
      adsMaster.FieldByName('Memo').AsString :=
          Copy( Trim(NoCreditSale.Caption)+Trim(adsMaster.FieldByName('Memo').AsString),1,60);
    adsMaster.FieldByName('BillMode').AsString :='现款采购';
    RemarkDBEdit.ReadOnly :=True;
  end else
  begin
    adsMaster.Edit;
    if pos(Trim(NoCreditSale.Caption),Trim(adsMaster.FieldByName('Memo').AsString))>0 then
      adsMaster.FieldByName('Memo').AsString :=
        StringReplace( Trim(adsMaster.FieldByName('Memo').AsString) ,
          Trim(NoCreditSale.Caption),'',[rfReplaceAll, rfIgnoreCase]);
    adsMaster.FieldByName('BillMode').AsString :='采购开单';
    RemarkDBEdit.ReadOnly :=False;
  end;
  DBEdit6.ReadOnly :=not NoCreditSale.Checked;
  if DBEdit6.ReadOnly then
  begin
    adsMaster.Edit;
    adsMaster.FieldByName('CashDiscount').Value :=null;
  end;
end;

procedure TPCEdPurchaseForm.LookupPackUintExit(Sender: TObject);
begin
  LookupPackUint.ListSource := dsPackUnit;
end;

procedure TPCEdPurchaseForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

procedure TPCEdPurchaseForm.InternalSave;
var adoTemp: TADOQuery;
    code,AccountIDStr,IDStr,MasterIDStr:string;
    MasterID:Integer;
begin
  inherited;
  if (adsMaster.fieldbyname('ID').AsInteger=0) or
         (adsMaster.fieldbyname('ID').IsNull)  then exit;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    //--------------判断将要插入的记录是否已经正在于PCGoodsInMaster,不存在就插入
    Close;
    sql.Text :=' select  b.ID from PCPurchaseDetail a '
        +' left outer join PCPurchaseMaster b on a.MasterID=b.ID '
        +' where isnull(a.goodsId,0)<>0   '
        +' and isnull(a.GoalQuantity,0)<>0 '
        +' and b.id=' + adsMaster.fieldbyname('ID').AsString
        +' and b.RecordState<>' + QuotedStr('删除')
        +' and b.ID not in '
        +' (select top 1 OriginID from PCGoodsInMaster where '
        +' OriginTable='+ QuotedStr('PCPurchaseMaster')
        +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
    open;
    if  not adoTemp.IsEmpty then //判断完毕,开始插入
    begin
        code :=GetMaxCode('Code','PCGoodsInMaster',number);
        {if adsMaster.FieldByName('ModeC').AsInteger=-1 then
           BillMode :='[红字]'+COPY(TRIM(adsMaster.FieldByName('BillMode').AsString),1,10)
            else BillMode :=TRIM(adsMaster.FieldByName('BillMode').AsString);}
        close;
        sql.Text := 'insert into PCGoodsInMaster ( CreateUserID,'
            +' Date, Code, ClientID, EmployeeID, BillMode,  '
            +' ModeDC,ModeC, Brief, ClearDate, SundryFee, Apportion,  '
            +' Deliver, Memo, BillAffix ,OriginID, OriginTable ) '
            +' select CreateUserID,Date, '+ QuotedStr(code)+ ' ,'
            +' ClientID, EmployeeID, BIllMode ,'
            +' ModeDC,ModeC, '+QuotedStr('采购开单自动提交') +' ,'
            +' ClearDate, SundryFee, Apportion, '
            +' Deliver, Memo, BillAffix, ID, '+QuotedStr('PCPurchaseMaster')
            +' from PCPurchaseMaster '
            +' where id=' +adsMaster.fieldbyname('ID').AsString
            +' and RecordState<>'+QuotedStr('删除')
            +' and ID not in '
            +' (select top 1 OriginID from PCGoodsInMaster where '
            +' OriginTable='+ QuotedStr('PCPurchaseMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
        ExecSQL; //插入出库主表记录完毕
        close;
        sql.Text := 'select top 1 ID from PCGoodsInMaster  where '
            +' OriginTable='+ QuotedStr('PCPurchaseMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString;
        open;
        if adoTemp.IsEmpty then MasterID :=1
            else MasterID :=adoTemp.FieldByName('ID').AsInteger;
        sql.Text := 'insert into PCGoodsInDetail ( '
              +' MasterID, GoodsID, GoodsSpec,    '
              +' Quantity, QuantityPcs, PackUnitID, PriceBase,PriceGoal, '
              +' Amount, Discount, TaxAmount, SundryFee,     '
              +' GoalUnitID, GoalQuantity, Memo )   '
              +' select '+ Inttostr(MasterID) + ' , a.GoodsID, a.GoodsSpec, '
              +' a.Quantity, a.QuantityPcs, a.PackUnitID, a.PriceBase,a.PriceGoal,'
              +' a.Amount, a.Discount, a.TaxAmount, a.SundryFee, '
              +' a.GoalUnitID, a.GoalQuantity, a.Memo  '
              +' from  PCPurchaseDetail a '
              +' left outer join PCPurchaseMaster b on a.MasterID=b.ID'
              +' where isnull(a.GoodsID,0)<>0 '
              +' and isnull(a.GoalQuantity,0)<>0 '
              +' and a.MasterID='+ adsMaster.fieldbyname('ID').AsString
              +' and b.RecordState<>'+QuotedStr('删除');
        ExecSQL;//插入出库子表记录
    end;
  end;
//判断是否要插入采购结算表
  if ( adsMaster.FieldByName('BillMode').AsString ='现款采购' )  then
  begin
    adoTemp.Close;
    adoTemp.SQL.Text :='select OriginID from FNClearPCMaster'
        +' where OriginTable='+Quotedstr('PCPurchaseMaster')
        +' and RecordState<>'+Quotedstr('删除')+' and OriginID='
        + adsMaster.fieldbyname('ID').AsString ;
    adoTemp.Open;
    if adoTemp.IsEmpty then
    begin
        adoTemp.Close;
        adoTemp.SQL.Text :=' select * from FNAccounts '
            +' where AccountType like '+Quotedstr('%现金%')
            +' and RecordState<>'+Quotedstr('删除') ;
        adoTemp.open;

        AccountIDStr :=adoTemp.fieldbyname('ID').AsString;
        if Trim(AccountIDStr)='' then AccountIDStr :='1';

        IDStr :=adsMaster.fieldbyname('ID').AsString;
        if Trim(IDStr)='' then IDStr :='0';
        adoTemp.Close;
        adoTemp.SQL.Text :=' Insert into FNClearPCMaster ('
            +' CreateUserID,Date,Code,BillMode,ModeDC,ModeC,'
            +' Brief, ClientID, EmployeeID,AccountsID, AmountD,   '
            +' AmountC,AmountRed,Memo, OriginID, OriginTable)     '
            +' select  CreateUserID, Date,                        '
            +Quotedstr(GetMaxCode('Code','FNClearPCMaster',number))+' , '
            +Quotedstr('现购结算')+' BillMode, ModeDC, ModeC, '
            +Quotedstr('现款采购')+' as Brief,         '
            +' ClientID, EmployeeID, '+ AccountIDStr+' as  AccountID , '
            +' 0.00,(isnull(b.Amount,0)+isnull(a.SundryFee,0) ) as AmountD, '
            +' 0.00,  Memo, a.ID, '
            +Quotedstr('PCPurchaseMaster')
            +' from PCPurchaseMaster a                                 '
            +' left outer join                                     '
            +' ( select MasterID,Sum(Isnull(Amount,0)) as Amount   '
            +' from PCPurchaseDetail                                   '
            +' Group by MasterID ) b on B.MasterID=a.ID            '
            +' where a.ID='+IDStr  ;
        adoTemp.ExecSQL;

        AccountIDStr := adsMaster.fieldbyname('ID').AsString;
        if Trim(AccountIDStr)='' then AccountIDStr :='0';

        adoTemp.Close;
        adoTemp.SQL.Text :='select ID from FNClearPCMaster '
            +' where OriginID='+AccountIDStr+' and OriginTable='
            +Quotedstr('PCPurchaseMaster') ;
        adoTemp.Open; //选定新插入记录(FNClearPCMaster表)的ID号
        MasterIDStr :=adoTemp.fieldbyname('ID').AsString;
        if Trim(MasterIDStr)='' then MasterIDStr :='0';

        adoTemp.Close;
        adoTemp.SQL.Text :=' Insert into FNClearPCDetail ('
            +' MasterID,OriginID,Amount)'
            +' select  '+MasterIDStr +'as MasterID,'
            +' a.ID as OriginID, '
            +' (isnull(b.Amount,0)+isnull(a.SundryFee,0) ) as Amount '
            +' from PCPurchaseMaster a                                 '
            +' left outer join                                     '
            +' ( select MasterID,Sum(Isnull(Amount,0)) as Amount   '
            +' from PCPurchaseDetail                                   '
            +' Group by MasterID ) b on B.MasterID=a.ID            '
            +' where a.ID='+IDStr  ;
      adoTemp.ExecSQL;
    end;
  end;
end;

procedure TPCEdPurchaseForm.adsDetailPackUnitIDChange(Sender: TField);
var ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;
  adsDetail.FieldByName('PriceBase').AsFloat := adsDetail.FieldByName('PriceBase').AsFloat*ExChRate;

  if adsDetail.FieldByName('GoalQuantity').AsFloat<>0 then
  begin
    adsDetail.FieldByName('Memo').AsString :=
        Trim(Floattostr(adsDetail.FieldByName('Quantity').AsFloat))
          +'['+Trim(adsDetail.FieldByName('PackUnit').AsString)+']';
   end;
end;

end.
