unit SLBrSaleGift;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,WSEdit, ADODB, Menus;

type
  TSLBrSaleGiftForm = class(TWSStandardBrowseForm)
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
    tblSLBrSaleGift: TADODataSet;
    tblSLBrSaleGiftID: TAutoIncField;
    tblSLBrSaleGiftCreateDate: TDateTimeField;
    tblSLBrSaleGiftCreateUserID: TIntegerField;
    tblSLBrSaleGiftRecordState: TStringField;
    tblSLBrSaleGiftDate: TDateTimeField;
    tblSLBrSaleGiftCode: TStringField;
    tblSLBrSaleGiftDiscountClass: TStringField;
    tblSLBrSaleGiftGoodsID: TIntegerField;
    tblSLBrSaleGiftQuantity: TBCDField;
    tblSLBrSaleGiftMinAmount: TBCDField;
    tblSLBrSaleGiftGiftGoodsID: TIntegerField;
    tblSLBrSaleGiftGiftUnitID: TIntegerField;
    tblSLBrSaleGiftPriceGift: TBCDField;
    tblSLBrSaleGiftQuantityGift: TBCDField;
    tblSLBrSaleGiftStartDate: TDateTimeField;
    tblSLBrSaleGiftExpireDate: TDateTimeField;
    tblSLBrSaleGiftPeriodID: TIntegerField;
    tblSLBrSaleGiftMemo: TStringField;
    tblSLBrSaleGiftgoods: TStringField;
    tblSLBrSaleGiftGiftGoods: TStringField;
    ToolButton14: TToolButton;
  private
    { Private declarations }
  public
    { Public declarations }
      protected
      function CreateEditForm: TWSEditForm; override;
  end;

var
  SLBrSaleGiftForm: TSLBrSaleGiftForm;

implementation

uses CommonDM, SLEdSaleGift;

{$R *.dfm}


function TSLBrSaleGiftForm.CreateEditForm: TWSEditForm;
begin
     Result := TSLEdSaleGiftForm.Create(Application);
end;

end.
