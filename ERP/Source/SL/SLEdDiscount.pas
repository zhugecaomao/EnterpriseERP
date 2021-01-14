unit SLEdDiscount;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp,QLDBFlt, Buttons;

type
  TSLEdDiscountForm = class(TBaseVoucherEditForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    GoodName: TADODataSet;
    PackUnit: TADODataSet;
    dsPackUnit: TDataSource;
    DSClientName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    TempAds: TADODataSet;
    adsMaster: TADODataSet;
    adsDetail: TADODataSet;
    Label8: TLabel;
    DiscountMode: TAction;
    BriefComboBox: TDBComboBox;
    Label9: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    adsGoodsSpec: TADODataSet;
    dsGoodsSpec: TDataSource;
    GoalUnit: TADODataSet;
    dsGoalUnit: TDataSource;
    StockQuerry: TAction;
    adsMasterID: TAutoIncField;
    adsMasterCreateDate: TDateTimeField;
    adsMasterCreateUserID: TIntegerField;
    adsMasterRecordState: TStringField;
    adsMasterDate: TDateTimeField;
    adsMasterCode: TStringField;
    adsMasterContractClass: TStringField;
    adsMasterClientID: TIntegerField;
    adsMasterStartDate: TDateTimeField;
    adsMasterExpireDate: TDateTimeField;
    adsMasterMemo: TStringField;
    adsMasterclient: TStringField;
    adsDetailID: TAutoIncField;
    adsDetailMasterID: TIntegerField;
    adsDetailGoodsID: TIntegerField;
    adsDetailSpec: TStringField;
    adsDetailQuantity: TBCDField;
    adsDetailQuantityE: TBCDField;
    adsDetailPackUnitID: TIntegerField;
    adsDetailGoalUnitID: TIntegerField;
    adsDetailPriceClear: TBCDField;
    adsDetailPriceMax: TBCDField;
    adsDetailPriceMin: TBCDField;
    adsDetailpackunit: TStringField;
    adsDetailgoalunit: TStringField;
    adsDetailGoodsName: TStringField;
    PackUintFltAQ: TADODataSet;
    PackUintFltDS: TDataSource;
    adsDetailPriceGoal: TBCDField;
    GoodsIDSelectBtt: TButton;
    adsDetailMemo: TStringField;
    SameDiscountAct: TAction;
    ClearDiscountAct: TAction;
    SameDiscountAct1: TMenuItem;
    ClearDiscountAct1: TMenuItem;
    HoldOnDiscountAct: TAction;
    N33: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure adsDetailGoodsIDChange(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure adsDetailPriceClearChange(Sender: TField);
    procedure GoodsIDSelectBttClick(Sender: TObject);
    procedure SameDiscountActExecute(Sender: TObject);
    procedure ClearDiscountActExecute(Sender: TObject);
    procedure HoldOnDiscountActExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SLEdDiscountForm: TSLEdDiscountForm;

implementation

uses CommonDM, WSUtils, WSSecurity;
{$R *.dfm}
procedure TSLEdDiscountForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SLSaleDiscountMaster ',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
end;

procedure TSLEdDiscountForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;


procedure TSLEdDiscountForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  GoodName.Close;
  PackUnit.Close;
  adsGoodsSpec.Close;
end;

procedure TSLEdDiscountForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'SLSaleDiscount';
  ClientName.Open;
  GoodName.Open;
  PackUnit.Open;
  TempAds.Close;
  TempAds.CommandText :=' select Distinct ContractClass from SLSaleDiscountMaster ';
  TempAds.Open;
  if TempAds.IsEmpty then BriefComboBox.Items.Add('一般类别')
  else begin
    while not TempAds.Eof do
    begin
      BriefComboBox.Items.Add(TempAds.FieldByName('ContractClass').AsString);
      TempAds.Next;
    end;
  end;
end;

procedure TSLEdDiscountForm.adsDetailGoodsIDChange(Sender: TField);
var SUnitID :integer;
begin
  inherited;
  if (adsDetail.fieldbyname('GoodsID').IsNull) or
     (adsDetail.fieldbyname('GoodsID').AsInteger=0) then exit;
  TempAds.Close;   //取标准单位和基本单价
  TempAds.CommandText :='select UnitID,PriceSales from DAGoods where Id='
      + QuotedStr(adsDetail.fieldbyname('GoodsID').AsString);
  TempAds.Open;
  if TempAds.FieldByName('UnitID').IsNull then SUnitID :=1
    else SUnitID :=TempAds.FieldByName('UnitID').AsInteger;
  adsDetail.FieldByName('GoalUnitID').AsInteger :=SUnitID;
  adsDetail.FieldByName('PackUnitID').AsInteger :=SUnitID;
  adsDetail.FieldByName('PriceClear').AsFloat :=TempAds.FieldByName('PriceSales').AsFloat;
end;

procedure TSLEdDiscountForm.FormActivate(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

procedure TSLEdDiscountForm.adsDetailPriceClearChange(Sender: TField);
var   ExChRate :real;
begin
  PackUnit.Locate('ID', adsDetail.fieldbyname('PackUnitID').AsString, []);
  if PackUnit.fieldbyname('ExchangeRate').IsNull then ExChRate :=1
     else ExChRate :=PackUnit.fieldbyname('ExchangeRate').AsFloat;
  adsDetail.FieldByName('PriceGoal').AsFloat :=
    adsDetail.fieldbyname('PriceClear').AsFloat/ExChRate;
end;

procedure TSLEdDiscountForm.GoodsIDSelectBttClick(Sender: TObject);
var
  FilterDialog: TQLDBFilterDialog;
  GoodsSelectADS :TADODataSet;
begin
  inherited;
  FilterDialog := TQLDBFilterDialog.Create(Self);
  GoodsSelectADS := TADODataSet.Create(nil);
  GoodsSelectADS.Connection := CommonData.acnConnection;

  try
//    GoodsIDSelectBtt.Enabled:=False;
    GoodsSelectADS.Close;
    GoodsSelectADS.CommandText :=
    ' SELECT a.ID, a.Name, b.name GoodsClass,a.UnitID GoalUnitID ' +
    ' FROM DAGoods a '+
    ' LEFT JOIN DAGoodsClass b on b.ID=a.GoodsClassID '+
    ' WHERE a.RecordState<>'+Quotedstr('删除');
    GoodsSelectADS.Open;
    with GoodsSelectADS do
    begin
      Fields[1].DisplayLabel := '商品名称';
      Fields[2].DisplayLabel := '商品类别';
    end;
    FilterDialog.DataSet := GoodsSelectADS;
    FilterDialog.FilterFields := 'Name; GoodsClass';
    if not FilterDialog.Execute then Exit;
    GoodsSelectADS.First;
    adsDetail.last;
    while not GoodsSelectADS.Eof do
    begin
      if adsDetail.Eof then adsDetail.append
        else  adsDetail.Edit;
      adsDetail.FieldByName('GoodsID').AsInteger := GoodsSelectADS.fieldbyname('ID').AsInteger;
      adsDetail.FieldByName('GoalUnitID').AsInteger := GoodsSelectADS.fieldbyname('GoalUnitID').AsInteger;
      adsDetail.FieldByName('PackUnitID').AsInteger := GoodsSelectADS.fieldbyname('GoalUnitID').AsInteger;
      adsDetail.Post;
      GoodsSelectADS.Next;
      adsDetail.Next;
    end;
//    if not GoodsSelectADS.IsEmpty then  adsDetail.First;
  finally
    FilterDialog.Free;
  end;
end;

procedure TSLEdDiscountForm.SameDiscountActExecute(Sender: TObject);
var RateStr:string;
  RateStrF :Double;
begin
  inherited;
  if InputQuery('临时折扣率', '请输入折扣率:', RateStr) then
    while not TryStrToFloat(RateStr,RateStrF) do
     if not InputQuery('临时折扣率', '请输入折扣率:', RateStr) then exit;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    if (adsDetail.FieldByName('PriceGoal').AsFloat=0) or (adsDetail.FieldByName('PriceGoal').IsNull) then
      adsDetail.FieldByName('PriceGoal').AsFloat :=RateStrF;
    adsDetail.Next;
  end;
end;

procedure TSLEdDiscountForm.ClearDiscountActExecute(Sender: TObject);
begin
  inherited;
  adsDetail.First;
  while not adsDetail.Eof do
  begin
    adsDetail.Edit;
    adsDetail.FieldByName('PriceGoal').Value :=null;
    adsDetail.Next;
  end;
end;

procedure TSLEdDiscountForm.HoldOnDiscountActExecute(Sender: TObject);
var RateStr:string;
  RateStrF,I :Integer;
  BaseDiscount:real;
begin
  inherited;
  RateStr :='1';
  if InputQuery('商品连续折扣', '请输入连续数量:', RateStr) then
    while not TryStrToInt(RateStr,RateStrF) do
     if not InputQuery('商品连续折扣', '请输入连续数量:', RateStr) then exit;
  BaseDiscount := adsDetail.FieldByName('PriceGoal').AsFloat;
  if not adsDetail.Eof then adsDetail.Next;
  for I:=1 to RateStrF do
  begin
    if adsDetail.Eof then Break;
    adsDetail.Edit;
    adsDetail.FieldByName('PriceGoal').AsFloat :=BaseDiscount;
    adsDetail.Next;
  end;
end;

end.
