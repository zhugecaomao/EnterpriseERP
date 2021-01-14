unit SLOrderEdit;
{******************************************
项目：
模块：销售订单编辑
日期：2002年10月7日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, StdCtrls, Mask, DBCtrls,
  ExtCtrls, ComCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB,
  SLBrOrder, QLDBLkp;

type
  TSLOrderEditForm = class(TBaseVoucherEditForm)
    Label1: TLabel;
    Label5: TLabel;
    adsOrderMaster: TADODataSet;
    adsOrderMasterID: TAutoIncField;
    adsOrderMasterCreateDate: TDateTimeField;
    adsOrderMasterCreateUserID: TIntegerField;
    adsOrderMasterRecordState: TStringField;
    adsOrderMasterCode: TStringField;
    adsOrderMasterDate: TDateTimeField;
    adsOrderMasterClientID: TIntegerField;
    adsOrderMasterDeliverydate: TDateTimeField;
    adsOrderMasterDeliveryAddress: TStringField;
    adsOrderMasterExcuteflag: TStringField;
    adsOrderMasterEmployeID: TIntegerField;
    adsOrderMasterMemo: TStringField;
    adsOrderMasterAwokeDate: TDateTimeField;
    adsOrderMasterAwokeFlag: TStringField;
    adsOrderMasterOriginBillID: TIntegerField;
    adsOrderMasterOriginOriginBillTypeID2: TIntegerField;
    adsOrderMasterPeriodID2: TIntegerField;
    dblcEmployee: TDBLookupComboBox;
    dblcClient: TDBLookupComboBox;
    Label2: TLabel;
    dbeAwokeDate: TDBEdit;
    Label3: TLabel;
    dbeDeliveryAddress: TDBEdit;
    dbeDeliveryDate: TDBEdit;
    Label4: TLabel;
    adsOrderDetail: TADODataSet;
    dsClient: TDataSource;
    dsEmployee: TDataSource;
    Label7: TLabel;
    dbcbExcuteFlag: TDBComboBox;
    Label8: TLabel;
    dbcbAwokeFlag: TDBComboBox;
    adrQuery: TADOQuery;
    adsOrderDetailID: TAutoIncField;
    adsOrderDetailMasterID: TIntegerField;
    adsOrderDetailGoodsID: TIntegerField;
    adsOrderDetailQuantity: TBCDField;
    adsOrderDetailPackUnitID: TIntegerField;
    adsOrderDetailPriceBase: TBCDField;
    adsOrderDetailAmount: TBCDField;
    adsOrderDetailGoalQuantity: TBCDField;
    adsOrderDetailGoodsName: TStringField;
    adsOrderDetailPackUnitName: TStringField;
    adsOrderDetailSpec: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure adsOrderDetailGoodsIDChange(Sender: TField);
    procedure adsOrderDetailQuantityChange(Sender: TField);
    procedure adsOrderDetailPriceBaseChange(Sender: TField);
  private
//    procedure SetColumnAttributes;
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SLOrderEditForm: TSLOrderEditForm;

implementation

uses WSUtils, CommonDM;

{$R *.dfm}

procedure TSLOrderEditForm.New;
begin
  inherited;
//  SetColumnAttributes;
end;

procedure TSLOrderEditForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
//  SetColumnAttributes;
end;

procedure TSLOrderEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'SLOrder';
  with adsOrderMaster do
  begin
    Filter := 'RecordState<>'+QuotedStr('删除');
    Filtered := True;
  end;

  CommonData.adsDAClient.Active := True ;
  CommonData.adsMSEmployee.Active := True ;
  CommonData.adsDAGoods.Active := True ;
  CommonData.adsMSUnit.Active := True;
end;

procedure TSLOrderEditForm.adsOrderDetailGoodsIDChange(Sender: TField);
begin
  inherited;
  with adrQuery do
  begin
    Close;
    Parameters.Items[0].Value := 1 ;
    Open;
    if Not IsEmpty then
    begin
      adsOrderDetail.FieldValues['PriceBase'] := FieldByName('PriceBases').AsCurrency;
      adsOrderDetail.FieldValues['Spec'] := FieldByName('Spec').AsString;
    end;
  end;
end;

procedure TSLOrderEditForm.adsOrderDetailQuantityChange(Sender: TField);
begin
  inherited;
  with adsOrderDetail do
  begin
    FieldValues['Amount'] := FieldByName('PriceBase').AsCurrency*FieldByName('Quantity').AsInteger;
  end;
end;

procedure TSLOrderEditForm.adsOrderDetailPriceBaseChange(Sender: TField);
begin
  inherited;
  with adsOrderDetail do
  begin
    FieldValues['Amount'] := FieldByName('PriceBase').AsCurrency*FieldByName('Quantity').AsInteger;
  end;
end;

end.
