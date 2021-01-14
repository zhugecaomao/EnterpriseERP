unit PCEdPurchaseB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TPCEdPurchaseBForm = class(TBaseVoucherEditForm)
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure adsDetailQuantityChange(Sender: TField);
    procedure adsDetailPackUnitIDChange(Sender: TField);
    procedure adsDetailPriceBaseChange(Sender: TField);
    procedure SaveActionExecute(Sender: TObject);
    procedure ClientQLDBLookupEnter(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
  private
    { Private declarations }
  public
     SLPubQuerrySql,SLPubQuerryCaption:string;
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  PCEdPurchaseBForm: TPCEdPurchaseBForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
procedure TPCEdPurchaseBForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','PCPurchaseMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
//  adsMaster.FieldByName('BIllMode').ReadOnly :=False;
  adsMaster.FieldByName('BillMode').AsString:='采购退货';
//  adsMaster.FieldByName('BIllMode').ReadOnly :=True;
  adsMaster.FieldByName('ModeDC').AsInteger :=-1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('Deliver').AsString:='--';
  adsMaster.FieldByName('Apportion').AsString:='--';
  adsMaster.FieldByName('OriginTable').AsString:='PCPurchaseMaster';
end;

procedure TPCEdPurchaseBForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TPCEdPurchaseBForm.FormClose(Sender: TObject;
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

procedure TPCEdPurchaseBForm.FormCreate(Sender: TObject);
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
  if  TempAds.IsEmpty then  BriefComboBox.Items.Add('采购退货');
end;

procedure TPCEdPurchaseBForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

procedure TPCEdPurchaseBForm.adsDetailGoodsIDChange(Sender: TField);
var SGoodsID,SUnitID:integer;
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) or (adsDetail.fieldbyname('GoodsID').AsInteger=0)
     then  SGoodsID :=1 else  SGoodsID :=adsDetail.fieldbyname('GoodsID').AsInteger;
  TempAds.Close;   //取标准单位和基本单价
  TempAds.CommandText :='select UnitID,PriceSales,PricePurchase  from DAGoods where Id='
      + Inttostr(SGoodsID);
  TempAds.Open;
//  adsDetail.FieldByName('GoalUnitID').ReadOnly :=False;
//  adsDetail.FieldByName('PackUnitID').ReadOnly :=False;
  if  (TempAds.FieldByName('UnitID').IsNull) or (TempAds.FieldByName('UnitID').AsInteger=0) then
      begin
        adsDetail.FieldByName('GoalUnitID').AsInteger :=1;
        adsDetail.FieldByName('PackUnitID').AsInteger :=1;
      end  else
      begin
        adsDetail.FieldByName('GoalUnitID').AsInteger :=TempAds.FieldByName('UnitID').AsInteger;
        adsDetail.FieldByName('PackUnitID').AsInteger :=TempAds.FieldByName('UnitID').AsInteger;
      end;
//  adsDetail.FieldByName('PriceBase').ReadOnly :=False;
  if adsDetail.FieldByName('PriceBase').AsFloat=0 then
     adsDetail.FieldByName('PriceBase').AsFloat := TempAds.FieldByName('PricePurchase').AsFloat  ;
  if adsDetail.FieldByName('PriceBase').IsNull then adsDetail.FieldByName('PriceBase').AsFloat :=0;
  if  TempAds.FieldByName('UnitID').IsNull then SunitID :=1
    else SunitID :=TempAds.FieldByName('UnitID').AsInteger;
  {PackUnit.Close;    //取该商品的其它包装单位
  PackUnit.CommandText :='select id,name,ExchangeRate from MSUnit where '
        +' GoalUnitID= '+ Inttostr(SunitID);
  PackUnit.Open;  }
end;

procedure TPCEdPurchaseBForm.adsDetailQuantityChange(Sender: TField);
var   ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Quantity').AsFloat*ExChRate;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=True;

//  adsDetail.FieldByName('Amount').ReadOnly :=False;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('Quantity').asfloat
         *adsDetail.fieldbyname('PriceBase').AsFloat;
//  adsDetail.FieldByName('Amount').ReadOnly :=True;
end;

procedure TPCEdPurchaseBForm.adsDetailPackUnitIDChange(Sender: TField);
var ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat ;

//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Quantity').AsFloat*ExChRate;
//  adsDetail.FieldByName('GoalQuantity').ReadOnly :=True;

//  adsDetail.FieldByName('Amount').ReadOnly :=False;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('Quantity').asfloat
         *adsDetail.fieldbyname('PriceBase').AsFloat;
//  adsDetail.FieldByName('Amount').ReadOnly :=True;
end;

procedure TPCEdPurchaseBForm.adsDetailPriceBaseChange(Sender: TField);
begin
  inherited;
//  adsDetail.FieldByName('Amount').ReadOnly :=False;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('Quantity').asfloat
         *adsDetail.fieldbyname('PriceBase').AsFloat;
//  adsDetail.FieldByName('Amount').ReadOnly :=True;
end;

procedure TPCEdPurchaseBForm.SaveActionExecute(Sender: TObject);
var adoTemp: TADOQuery;
    code:string;
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
        close;
        sql.Text := 'insert into PCGoodsInMaster ( CreateUserID,'
            +' Date, Code, ClientID, EmployeeID, BillMode,  '
            +' ModeDC,ModeC, Brief, ClearDate, SundryFee, Apportion,  '
            +' Deliver, Memo, BillAffix ,OriginID, OriginTable ) '
            +' select CreateUserID,Date, '+ QuotedStr(code)+ ' ,'
            +' ClientID, EmployeeID, BIllMode ,'
            +' ModeDC,ModeC, '+QuotedStr('采购退货自动提交') +' ,'
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
        if adoTemp.IsEmpty then MasterID :=0
            else MasterID :=adoTemp.FieldByName('ID').AsInteger;
        sql.Text := 'insert into PCGoodsInDetail ( '
              +' MasterID, GoodsID, GoodsSpec,    '
              +' Quantity, QuantityPcs, PackUnitID, PriceBase, '
              +' Amount, Discount, TaxAmount, SundryFee,     '
              +' GoalUnitID, GoalQuantity, Memo )   '
              +' select '+ Inttostr(MasterID) + ' , a.GoodsID, a.GoodsSpec, '
              +' a.Quantity, a.QuantityPcs, a.PackUnitID, a.PriceBase,  '
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
    //--------------判断将要插入的记录是否已经正在于PCGoodsInMaster,不存在就插入
   {
    //=======判断将要插入的记录是否已经正在于FNClearPCMaster,不存在就插入
    Close;
    sql.Text :=' select b.ID from PCPurchaseDetail a '
        +' Left Outer join PCPurchaseMaster b on a.MasterID=b.ID '
        +' where ABS(isnull(a.amount,0))+ABS(isnull(a.Discount,0))'
        +' +ABS(isnull(a.TaxAmount,0)) + ABS(isnull(a.SundryFee,0))<>0 '
        + ' and b.ID='+adsMaster.fieldbyname('ID').AsString
        +' and b.RecordState<>' + QuotedStr('删除')+' and  b.ID not in '
        +' (select top 1 OriginID from FNClearPCMaster where '
        +' OriginTable='+ QuotedStr('PCPurchaseMaster')
        +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
    open;
    if  not adoTemp.IsEmpty then //判断完毕,开始插入
    begin
        code :=GetMaxCode('Code','FNClearPCMaster',number);
        if adsMaster.FieldByName('ModeC').AsInteger=-1 then BillMode :='销售结算[红字]'
            else BillMode :='销售结算' ;
        close;
        sql.Text := 'insert into FNClearPCMaster ( CreateUserID,'
            +' Date, Code, BillMode, ModeDC,ModeC, Brief, '
            +' ClientID, EmployeeID,  '
            +' ClearDate, AccountsID, AmountD, AmountC,'
            +' Memo, BillAffix, OriginID, OriginTable ) '
            +' select a.CreateUserID , '
            +' a.Date, '+QuotedStr(Code)+ ' , '
            + QuotedStr(BillMode) +' , a.ModeDC,a.ModeC, '
            + QuotedStr('销售开单自动提交结算') +' ,'
            +' a.ClientID, a.EmployeeID, '
            +' a.ClearDate, 0,0, 0, '
            +' a.Memo, a.BillAffix, a.ID,'+QuotedStr('PCPurchaseMaster')
            +' from PCPurchaseMaster a left outer join   '
            +' (select MasterID,sum(isnull(amount,0))-    '
            +' -sum(isnull(Discount,0))+sum(isnull(TaxAmount,0)) '
            +' +sum(isnull(SundryFee,0)) as amount '
            +' from  PCPurchaseDetail                   '
            +' group by  MasterId) as b on a.ID=b.MasterID '
            +' where a.RecordState<>'+QuotedStr('删除')+ ' and '
            +' a.id=' +adsMaster.fieldbyname('ID').AsString
            +' and a.Id not in '
            +' (select top 1 OriginID from FNClearPCMaster where '
            +' OriginTable='+ QuotedStr('PCPurchaseMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
        ExecSQL; //FNClearPCMaster 插入记录完毕
        close;
        sql.Text := 'select top 1 ID from FNClearPCMaster  where '
            +' OriginTable='+ QuotedStr('PCPurchaseMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString;
        open;
        if adoTemp.IsEmpty then MasterID :=0
            else MasterID :=adoTemp.FieldByName('ID').AsInteger;
        sql.Text := 'insert into FNClearSLDetail ( MasterID, '
              +' OriginID, OriginTable ,Amount )    '
              +' select '+ Inttostr(MasterID) + ' , a.ID,  '
              +' a.OriginTable, b.Amount as Amount  '
              +' from PCPurchaseMaster a left outer join   '
              +' (select MasterID,sum(isnull(amount,0))-    '
              +' -sum(isnull(Discount,0))+sum(isnull(TaxAmount,0)) '
              +' +sum(isnull(SundryFee,0)) as amount '
              +' from  PCPurchaseDetail                   '
              +' group by  MasterId) as b on a.ID=b.MasterID '
              +' where a.RecordState<>'+QuotedStr('删除')
              +' and a.ID='+ adsMaster.fieldbyname('ID').AsString;
        ExecSQL;//插入子表记录
    end;
    //=======判断将要插入的记录是否已经正在于FNClearPCMaster,不存在就插入
    }
  end;
end;

procedure TPCEdPurchaseBForm.ClientQLDBLookupEnter(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=true;
  GEdit1.Text :='0';
  GEdit1.Enabled :=false;
end;

procedure TPCEdPurchaseBForm.ClientQLDBLookupExit(Sender: TObject);
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
    +' from FNClearSLMaster                                                  '
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

end.
