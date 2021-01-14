unit WSDM;

interface

uses
  SysUtils, Classes, DB, ADODB, ImgList, Controls, Variants;

type
  TWSDataModule = class(TDataModule)
    Connection: TADOConnection;
    SmallImageList: TImageList;
    adsSalesMaster: TADODataSet;
    adsSalesDetail: TADODataSet;
    adsSalesMasterRecordState: TStringField;
    adsSalesMasterTradeDate: TDateTimeField;
    adsSalesMasterTradeCode: TStringField;
    adsSalesMasterCloseDate: TDateTimeField;
    adsSalesMasterIsDeliver: TBooleanField;
    adsSalesMasterIsValueAddedTax: TBooleanField;
    adsSalesMasterTaxRate: TBCDField;
    adsSalesMasterIsDiscount: TBooleanField;
    adsSalesMasterDiscountRate: TBCDField;
    adsSalesMasterTradeType: TStringField;
    adsSalesMasterIsInvoice: TBooleanField;
    adsSalesDetailID: TIntegerField;
    adsSalesDetailGoods: TStringField;
    adsSalesDetailSpecsModel: TStringField;
    adsSalesDetailUnits: TStringField;
    adsSalesDetailQuantity: TBCDField;
    adsSalesDetailUnitPrice: TBCDField;
    adsSalesDetailSaleAmount: TBCDField;
    adsSalesDetailTaxRate: TBCDField;
    adsSalesDetailTaxAmount: TBCDField;
    adsSalesDetailDiscountAmount: TBCDField;
    adsSalesDetailLastSaleAmount: TBCDField;
    adsSalesDetailStandardQuantity: TBCDField;
    adsClients: TADODataSet;
    adsClientsClientID: TIntegerField;
    adsClientsName: TStringField;
    adsClientsFullName: TStringField;
    adsClientsTel: TStringField;
    adsClientsZip: TStringField;
    adsClientsAddress: TStringField;
    adsSalesMasterClient: TStringField;
    adsPerson: TADODataSet;
    adsPersonfPerID: TAutoIncField;
    adsPersonfPerName: TStringField;
    adsSalesMasterEmployee: TStringField;
    adsSalesMasterID: TAutoIncField;
    adsSalesMasterClientID: TIntegerField;
    adsGoods: TADODataSet;
    adsSalesDetailGoodsID: TIntegerField;
    adsSalesMasterEmployeeID: TIntegerField;
    adsSalesDetailGoodsName: TStringField;
    adsBaseProduct_D: TADODataSet;
    adsBaseUnits: TADODataSet;
    procedure adsSalesMasterNewRecord(DataSet: TDataSet);
    procedure adsSalesDetailNewRecord(DataSet: TDataSet);
    procedure adsSalesDetailGoodsIDChange(Sender: TField);
    procedure adsSalesMasterAfterPost(DataSet: TDataSet);
    procedure adsSalesDetailQuantityChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WSDataModule: TWSDataModule;

implementation

{$R *.dfm}

procedure TWSDataModule.adsSalesMasterNewRecord(DataSet: TDataSet);
begin
  DataSet['RecordState; TradeDate; IsDeliver; IsValueAddedTax; TaxRate;' +
   ' IsDiscount; DiscountRate; TradeType; IsInvoice'] :=
   VarArrayOf(['临时', Date, False, False, 0, False, 0, '正常销售', False]);
end;

procedure TWSDataModule.adsSalesDetailNewRecord(DataSet: TDataSet);
begin
  DataSet['Quantity; UnitPrice'] := VarArrayOf([0, 0]);
end;

procedure TWSDataModule.adsSalesDetailGoodsIDChange(Sender: TField);
begin
  with Sender do DataSet['Goods'] := DataSet['GoodsName'];
end;

procedure TWSDataModule.adsSalesMasterAfterPost(DataSet: TDataSet);
var
  ID: Integer;
  Bm: string;
begin
  ID := DataSet.FieldByName('ID').AsInteger;
  with adsSalesDetail do
  begin
    DisableControls;
    try
      Bm := Bookmark;
      First;
      while not Eof do
      begin
        if FieldByName('ID').IsNull then
        begin
          Edit;
          FieldByName('ID').AsInteger := ID;
          Post;
        end;
        Next;
      end;
      Bookmark := Bm;
    finally
      EnableControls;
    end;
  end;
end;

procedure TWSDataModule.adsSalesDetailQuantityChange(Sender: TField);
begin
  with Sender, DataSet do
  begin
    FieldByName('SaleAmount').AsCurrency :=
      FieldByName('UnitPrice').AsCurrency * FieldByName('Quantity').AsCurrency;
  end;
end;

end.
