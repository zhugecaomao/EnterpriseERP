unit SLPriceSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, StdCtrls, GEdit, ExtCtrls, Grids, DBGrids, QLDBGrid,
  DB, ADODB;

type
  TSLPriceSearchForm = class(TWSCustomForm)
    dsSaleSearcher: TDataSource;
    GoodName: TADODataSet;
    tblSaleSearcher: TADODataSet;
    tblSaleSearcherCreateDate: TDateTimeField;
    tblSaleSearcherGoodName: TStringField;
    tblSaleSearcherQuantity: TBCDField;
    tblSaleSearcherPriceBase: TBCDField;
    tblSaleSearcherAmount: TBCDField;
    tblSaleSearcherDiscountRate: TBCDField;
    tblSaleSearcherDiscount: TBCDField;
    tblSaleSearcherNetAmount: TBCDField;
    tblSaleSearcherTexrate: TBCDField;
    tblSaleSearcherTaxAmount: TBCDField;
    tblSaleSearcherGoalQuantity: TBCDField;
    tblSaleSearcherGoodsID: TIntegerField;
    tblSaleSearcherPackUnitID: TIntegerField;
    tblSaleSearcherMasterID: TIntegerField;
    tblSaleSearcherSalesMode: TStringField;
    tblSaleSearcherID: TAutoIncField;
    DBGrid: TQLDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SLPriceSearchForm: TSLPriceSearchForm;

implementation

uses CommonDM;
{$R *.dfm}


end.
