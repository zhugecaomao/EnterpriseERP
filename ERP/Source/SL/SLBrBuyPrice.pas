unit SLBrBuyPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,WSEdit, ADODB;

type
  TPCPurchasePriceForm = class(TWSStandardBrowseForm)
    tblSLBrBuyPrice: TADOTable;
    tblSLBrBuyPriceID: TAutoIncField;
    tblSLBrBuyPriceCreateDate: TDateTimeField;
    tblSLBrBuyPriceCreateUserID: TIntegerField;
    tblSLBrBuyPriceRecordState: TStringField;
    tblSLBrBuyPriceDate: TDateTimeField;
    tblSLBrBuyPriceCode: TStringField;
    tblSLBrBuyPricePriceClass: TStringField;
    tblSLBrBuyPriceGoodsID: TIntegerField;
    tblSLBrBuyPricePackUnit: TStringField;
    tblSLBrBuyPricePriceBase: TBCDField;
    tblSLBrBuyPricePriceMax: TBCDField;
    tblSLBrBuyPricePriceMin: TBCDField;
    tblSLBrBuyPriceStartDate: TDateTimeField;
    tblSLBrBuyPriceExpireDate: TDateTimeField;
    tblSLBrBuyPriceMeno: TStringField;
    tblSLBrBuyPricePeriodID: TIntegerField;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    procedure tblSLBrBuyPriceFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
      protected
      function CreateEditForm: TWSEditForm; override;
  end;

var
  PCPurchasePriceForm: TPCPurchasePriceForm;

implementation

uses CommonDM,  PCEdPurchasePrice;

{$R *.dfm}

function TPCPurchasePriceForm.CreateEditForm: TWSEditForm;
begin
     Result := PCEdPurchasePriceForm.Create(Application);
end;

procedure TPCPurchasePriceForm.tblSLBrBuyPriceFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
 accept:=(dataset.FieldByName('RecordState').AsString<>'É¾³ý');
end;

end.
