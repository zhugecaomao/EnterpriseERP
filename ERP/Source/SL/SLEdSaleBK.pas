unit SLEdSaleBK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TSLEdSaleBKForm = class(TBaseVoucherEditForm)
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
    adsMasterBillModeDC: TIntegerField;
    adsMasterPeriodID: TIntegerField;
    adsMasterClearDate: TDateTimeField;
    adsMasterMemo: TStringField;
    adsMasterSundryFee: TBCDField;
    Label8: TLabel;
    adsMasterClientName: TStringField;
    adsDetailGoodsName: TStringField;
    adsDetailPackUnit: TStringField;
    N13: TMenuItem;
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
    LookupGoodsSpec: TQLDBLookupComboBox;
    adsGoodsSpec: TADODataSet;
    dsGoodsSpec: TDataSource;
    adsMasterEmployee: TStringField;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    adsDetailGoalUnit: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure adsDetailPackUnitIDChange(Sender: TField);
    procedure adsDetailQuantityChange(Sender: TField);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure SaveActionExecute(Sender: TObject);
    procedure ImportActionExecute(Sender: TObject);
    procedure DiscountModeExecute(Sender: TObject);
    procedure ClientQLDBLookupEnter(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
    procedure SLPubQuerry;
  private
    { Private declarations }
  public
     SLPubQuerrySql,SLPubQuerryCaption:string;
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SLEdSaleBKForm: TSLEdSaleBKForm;

implementation

uses CommonDM, WSUtils, WSSecurity,PkVoucher, SLDiscountMode;
//SLPubQuerry
{$R *.dfm}
procedure TSLEdSaleBKForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').Value:=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SLSaleMaster',Number);
  adsMaster.FieldByName('CreateUserID').Value:=Guarder.UserID;
  adsMaster.FieldByName('BillMode').Value:='销售退货单';
  adsMaster.FieldByName('BillModeDC').Value:=-1;
  adsMaster.FieldByName('Deliver').Value:='不送货';
  adsMaster.FieldByName('Apportion').Value:='不分摊';
//  adsMaster.FieldByName('PeriodID').Value:=1;
end;

procedure TSLEdSaleBKForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSLEdSaleBKForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  PackUnit.Close;
end;

procedure TSLEdSaleBKForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'SLSale';
  ClientName.Open;
  EmployeeName.Open;
  GoodName.Open;
  PackUnit.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct brief from SLSaleMaster';
  TempAds.Open;
  TempAds.First;
  while not TempAds.Eof do
  begin
    BriefComboBox.Items.Add(TempAds.FieldByName('brief').AsString);
    TempAds.Next;
  end;
end;

procedure TSLEdSaleBKForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

procedure TSLEdSaleBKForm.adsDetailPackUnitIDChange(Sender: TField);
begin
  inherited;
  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Quantity').AsFloat
        *PackUnit.fieldbyname('ExchangeRate').AsFloat+
       adsDetail.FieldByName('QuantityPcs').AsFloat;
  adsDetail.FieldByName('GoalQuantity').ReadOnly :=True;

  adsDetail.FieldByName('PriceBase').ReadOnly :=False;
  adsDetail.FieldByName('PriceBase').AsFloat :=
       GoodName.fieldbyname('PriceSales').AsFloat
         *PackUnit.fieldbyname('ExchangeRate').AsFloat;
  adsDetail.FieldByName('PriceBase').ReadOnly :=True;
end;

procedure TSLEdSaleBKForm.adsDetailQuantityChange(Sender: TField);
begin
  inherited;
  adsDetail.FieldByName('GoalQuantity').ReadOnly :=False;
  adsDetail.FieldByName('GoalQuantity').AsFloat :=
       adsDetail.fieldbyname('Quantity').AsFloat
         *PackUnit.fieldbyname('ExchangeRate').AsFloat+
           adsDetail.FieldByName('QuantityPcs').AsFloat;
  adsDetail.FieldByName('GoalQuantity').ReadOnly :=True;

  adsDetail.FieldByName('Amount').ReadOnly :=False;
  adsDetail.FieldByName('Amount').AsFloat :=
       adsDetail.fieldbyname('Quantity').asfloat
         *adsDetail.fieldbyname('PriceBase').asfloat;
  adsDetail.FieldByName('Amount').ReadOnly :=True;

end;

procedure TSLEdSaleBKForm.adsDetailGoodsIDChange(Sender: TField);
var
  UnitID:integer;
begin
  inherited;
  TempAds.Close;   //取标准单位和基本单价
  TempAds.CommandText :='select top 1 UnitID,PriceSales from DAGoods where Id='
      + QuotedStr(adsDetail.fieldbyname('GoodsID').AsString);
  TempAds.Open;
  if TempAds.IsEmpty then UnitID :=0 else UnitID :=TempAds.fieldbyname('UnitID').AsInteger;
  adsDetail.FieldByName('GoalUnitID').ReadOnly :=False;
  adsDetail.FieldByName('GoalUnitID').AsInteger :=UnitID;
  adsDetail.FieldByName('GoalUnitID').ReadOnly :=True;
  adsDetail.FieldByName('PriceBase').ReadOnly :=False;
  adsDetail.FieldByName('PriceBase').AsFloat :=TempAds.fieldbyname('PriceSales').AsFloat;
  adsDetail.FieldByName('PriceBase').ReadOnly :=True;
             //取该商品的其它包装单位
  PackUnit.Close;
  PackUnit.CommandText :='select id,name,ExchangeRate from MSUnit'
        +'  where GoalUnitID= '+ QuotedStr( inttostr(UnitID) );
  PackUnit.Open;
end;

procedure TSLEdSaleBKForm.SaveActionExecute(Sender: TObject);
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
    //--------------判断将要插入的记录是否已经正在于SLGoodsOutMaster,不存在就插入
    Close;
    sql.Text :=' select  b.ID from SLSaleDetail a '
        +' left outer join SLSaleMaster b on a.MasterID=b.ID '
        +' where isnull(a.goodsId,0)<>0   '
        +' and isnull(a.GoalQuantity,0)<>0 '
        +' and b.id=' + adsMaster.fieldbyname('ID').AsString
        +' and b.RecordState<>' + QuotedStr('删除')
        +' and b.ID not in '
        +' (select top 1 OriginID from SLGoodsOutMaster where '
        +' OriginTable='+ QuotedStr('SLSaleMaster')
        +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
    open;
    if  not adoTemp.IsEmpty then //判断完毕,开始插入
    begin
        code :=GetMaxCode('Code','SLGoodsOutMaster',number);
        close;
        sql.Text := 'insert into SLGoodsOutMaster ( CreateUserID,'
            +' Date, Code, ClientID, EmployeeID, BillMode,  '
            +' BillModeDC, Brief, ClearDate, SundryFee, Apportion,  '
            +' Deliver, Memo, BillAffix ,OriginID, OriginTable ) '
            +' select CreateUserID,Date, '+ QuotedStr(code)+ ' ,'
            +' ClientID, EmployeeID, '+QuotedStr('销售出库') +' ,'
            +' BillModeDC, '+QuotedStr('销售开单自动提交出库') +' ,'
            +' ClearDate, SundryFee, Apportion, '
            +' Deliver, Memo, BillAffix, ID, '+QuotedStr('SLSaleMaster')
            +' from SLSaleMaster '
            +' where id=' +adsMaster.fieldbyname('ID').AsString
            +' and RecordState<>'+QuotedStr('删除')
            +' and ID not in '
            +' (select top 1 OriginID from SLGoodsOutMaster where '
            +' OriginTable='+ QuotedStr('SLSaleMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
        ExecSQL; //插入主表记录完毕
        close;
        sql.Text := 'select top 1 ID from SLGoodsOutMaster  where '
            +' OriginTable='+ QuotedStr('SLSaleMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString;
        open;
        if adoTemp.IsEmpty then MasterID :=0
            else MasterID :=adoTemp.FieldByName('ID').AsInteger;
        sql.Text := 'insert into SLGoodsOutDetail ( '
              +' MasterID, GoodsID, GoodsSpec,    '
              +' Quantity, QuantityPcs, PackUnitID, PriceBase, '
              +' Amount, Discount, TaxAmount, SundryFee,     '
              +' GoalUnitID, GoalQuantity, Memo )   '
              +' select '+ Inttostr(MasterID) + ' , a.GoodsID, a.GoodsSpec, '
              +' a.Quantity, a.QuantityPcs, a.PackUnitID, a.PriceBase,  '
              +' a.Amount, a.Discount, a.TaxAmount, a.SundryFee, '
              +' a.GoalUnitID, a.GoalQuantity, a.Memo  '
              +' from  SLSaleDetail a '
              +' left outer join SLSalemaster b on a.MasterID=b.ID'
              +' where isnull(a.GoodsID,0)<>0 '
              +' and isnull(a.GoalQuantity,0)<>0 '
              +' and a.MasterID='+ adsMaster.fieldbyname('ID').AsString
              +' and b.RecordState<>'+QuotedStr('删除');
        ExecSQL;//插入子表记录
    end;
    //--------------
    //=======判断将要插入的记录是否已经正在于FNClearSLMaster,不存在就插入
    Close;
    sql.Text :=' select b.ID from SLSaleDetail a '
        +' Left Outer join SLSaleMaster b on a.MasterID=b.ID '
        +' where ABS(isnull(a.amount,0))+ABS(isnull(a.Discount,0))'
        +' +ABS(isnull(a.TaxAmount,0)) + ABS(isnull(a.SundryFee,0))<>0 '
        + ' and b.ID='+adsMaster.fieldbyname('ID').AsString
        +' and b.RecordState<>' + QuotedStr('删除')+' and  b.ID not in '
        +' (select top 1 OriginID from FNClearSLMaster where '
        +' OriginTable='+ QuotedStr('SLSaleMaster')
        +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
    open;
    if  not adoTemp.IsEmpty then //判断完毕,开始插入
    begin
        code :=GetMaxCode('Code','FNClearSLMaster',number);
        close;
        sql.Text := 'insert into FNClearSLMaster ( CreateUserID,'
            +' Date, Code, BillMode, BillModeDC, Brief, '
            +' ClientID, EmployeeID,  '
            +' ClearDate, AccountsID, AmountD, AmountC,'
            +' Memo, BillAffix, OriginID, OriginTable ) '
            +' select a.CreateUserID , '
            +' a.Date, '+QuotedStr(Code)+ ' , '
            + QuotedStr('销售结算') +' , 1, '
            + QuotedStr('销售开单自动提交结算') +' ,'
            +' a.ClientID, a.EmployeeID, '
            +' a.ClearDate, 0,0,b.Amount*a.BillModeDC as Amount ,  '
            +' a.Memo, a.BillAffix, a.ID,'+QuotedStr('SLSaleMaster')
            +' from SLSaleMaster a left outer join   '
            +' (select MasterID,sum(isnull(amount,0))-    '
            +' -sum(isnull(Discount,0))+sum(isnull(TaxAmount,0)) '
            +' +sum(isnull(SundryFee,0)) as amount '
            +' from  SLSaleDetail                   '
            +' group by  MasterId) as b on a.ID=b.MasterID '
            +' where a.RecordState<>'+QuotedStr('删除')+ ' and '
            +' a.id=' +adsMaster.fieldbyname('ID').AsString
            +' and a.Id not in '
            +' (select top 1 OriginID from FNClearSLMaster where '
            +' OriginTable='+ QuotedStr('SLSaleMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
        ExecSQL; //FNClearSLMaster 插入记录完毕
        close;
        sql.Text := 'select top 1 ID from FNClearSLMaster  where '
            +' OriginTable='+ QuotedStr('SLSaleMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString;
        open;
        if adoTemp.IsEmpty then MasterID :=0
            else MasterID :=adoTemp.FieldByName('ID').AsInteger;
        sql.Text := 'insert into FNClearSLDetail ( MasterID, '
              +' BillCode, OriginID, OriginTable ,Amount )    '
              +' select '+ Inttostr(MasterID) + ' ,a.code , a.ID,  '
              +' a.OriginTable, b.Amount as Amount  '
              +' from SLSaleMaster a left outer join   '
              +' (select MasterID,sum(isnull(amount,0))-    '
              +' -sum(isnull(Discount,0))+sum(isnull(TaxAmount,0)) '
              +' +sum(isnull(SundryFee,0)) as amount '
              +' from  SLSaleDetail                   '
              +' group by  MasterId) as b on a.ID=b.MasterID '
              +' where a.RecordState<>'+QuotedStr('删除')
              +' and a.ID='+ adsMaster.fieldbyname('ID').AsString;
        ExecSQL;//插入子表记录
    end;
    //*********判断将要插入的记录是否已经正在于FNClearMaster,应收应付表中
    Close;
    sql.Text :=' select b.ID from SLSaleDetail a '
        +' Left Outer join SLSaleMaster b on a.MasterID=b.ID '
        +' where ABS(isnull(a.amount,0))+ABS(isnull(a.Discount,0))'
        +' +ABS(isnull(a.TaxAmount,0)) + ABS(isnull(a.SundryFee,0))<>0 '
        + ' and b.ID='+adsMaster.fieldbyname('ID').AsString
        +' and b.RecordState<>' + QuotedStr('删除')+' and  b.ID not in '
        +' (select top 1 OriginID from FNClearMaster where '
        +' OriginTable='+ QuotedStr('SLSaleMaster')
        +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
    open;
    if  not adoTemp.IsEmpty then //判断完毕,开始插入
    begin
        code :=GetMaxCode('Code','FNClearMaster',number);
        close;
        sql.Text := 'insert into FNClearMaster ( CreateUserID,'
            +' Date, Code, BillMode, BillModeDC, Brief, '
            +' ClientID, EmployeeID,  '
            +' ClearDate, AccountsID, AmountD, AmountC,'
            +' Memo, BillAffix, OriginID, OriginTable ) '
            +' select a.CreateUserID , '
            +' a.Date, '+QuotedStr(Code)+ ' , '
            + QuotedStr('销售开单') +' , BillModeDC, '
            + QuotedStr('销售记帐[贷]') +' ,'
            +' a.ClientID, a.EmployeeID, '
            +' a.ClearDate, 0,0,b.Amount*a.BillModeDC as Amount ,  '
            +' a.Memo, a.BillAffix, a.ID,'+QuotedStr('SLSaleMaster')
            +' from SLSaleMaster a left outer join   '
            +' (select MasterID,sum(isnull(amount,0))-    '
            +' -sum(isnull(Discount,0))+sum(isnull(TaxAmount,0)) '
            +' +sum(isnull(SundryFee,0)) as amount '
            +' from  SLSaleDetail                   '
            +' group by  MasterId) as b on a.ID=b.MasterID '
            +' where a.RecordState<>'+QuotedStr('删除')+ ' and '
            +' a.id=' +adsMaster.fieldbyname('ID').AsString
            +' and a.Id not in '
            +' (select top 1 OriginID from FNClearMaster where '
            +' OriginTable='+ QuotedStr('SLSaleMaster')
            +' and OriginID='+adsMaster.fieldbyname('ID').AsString+'  )';
        ExecSQL; //FNClearMaster 插入记录完毕 ,不需要插入子表
    end;
  end;
end;

procedure TSLEdSaleBKForm.ImportActionExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TVoucherPickForm, VoucherPickForm);
  VoucherPickForm.ShowModal;
  VoucherPickForm.Free;
end;

procedure TSLEdSaleBKForm.DiscountModeExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TSLDiscountModeForm, SLDiscountModeForm);
  SLDiscountModeForm.ShowModal;
  SLDiscountModeForm.Free;
end;


procedure TSLEdSaleBKForm.ClientQLDBLookupEnter(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=true;
  GEdit1.Text :='0';
  GEdit1.Enabled :=false;
end;

procedure TSLEdSaleBKForm.ClientQLDBLookupExit(Sender: TObject);
var  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    close;
    sql.Text := 'select sum(isnull(AmountC,0))-sum(isnull(AmountD,0)) '
        +' as Balance from '
        +' FNClearmaster where RecordState<>' + QuotedStr('删除')
        +' and ClientID='+ClientName.fieldbyname('ID').AsString;
    open;
    GEdit1.Enabled :=true;
    if  adoTemp.IsEmpty then     GEdit1.Text :='0'
      else   GEdit1.Text :=fieldbyname('Balance').asstring;
    GEdit1.Enabled :=False;
  end;
end;

procedure TSLEdSaleBKForm.SLPubQuerry;
begin
  {SLPubQuerryFrom:= TSLPubQuerryFrom.Create(self);
  with SLPubQuerryFrom do
  begin
    adsPubQuerry.Close;
    adsPubQuerry.CommandText :=SLPubQuerrySql;
    adsPubQuerry.Open;
    SLPubQuerryFrom.Caption :=SLPubQuerryCaption;
    SLPubQuerryFrom.Show;
  end; }
end;

end.
