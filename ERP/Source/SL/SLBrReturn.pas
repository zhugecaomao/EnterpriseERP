unit SLBrReturn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, ImgList, DB, ActnList, ComCtrls, ToolWin, Grids,
  DBGrids, QLDBGrid, ADODB, WSEdit, ExtCtrls;

type
  TSLReturnBrForm = class(TWSVoucherBrowseForm)
    adsSalesMaster: TADODataSet;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    adsSalesMasterID: TAutoIncField;
    adsSalesMasterCreateDate: TDateTimeField;
    adsSalesMasterCreateUserID: TIntegerField;
    adsSalesMasterRecordState: TStringField;
    adsSalesMasterDate: TDateTimeField;
    adsSalesMasterCode: TStringField;
    adsSalesMasterClientID: TIntegerField;
    adsSalesMasterEmployeID: TIntegerField;
    adsSalesMasterIsDiscount: TStringField;
    adsSalesMasterDiscountRate: TBCDField;
    adsSalesMasterIsTax: TStringField;
    adsSalesMasterTaxRate: TBCDField;
    adsSalesMasterIsDeliver: TStringField;
    adsSalesMasterSaleMode: TStringField;
    adsSalesMasterOriginBillID: TIntegerField;
    adsSalesMasterOriginBillTypeID: TIntegerField;
    adsSalesMasterPeriodID: TIntegerField;
    adsSalesMasterClearDate: TDateTimeField;
    adsSalesMasterClient: TStringField;
    adsSalesMasterName: TStringField;
    adsSalesMasterMemo: TStringField;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    adsSalesMasterSundryFee: TBCDField;
    adsSalesMasterIsApportion: TStringField;
    procedure adsSalesMasterIsDeliverGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

implementation

uses WSEdSales, CommonDM,SLEdReturn;

{$R *.dfm}

{ TWSSalesBrowserForm }

function TSLReturnBrForm.CreateEditForm: TWSEditForm;
begin
  Result := tSLReturnEditForm.Create(Self);
end;

procedure TSLReturnBrForm.adsSalesMasterIsDeliverGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
//if sender.Value
//then text:='ÊÇ'
//else text:='·ñ';
end;

end.
