unit SLBrSaleBillS;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TSLBrSaleBillSForm = class(TWSVoucherBrowseForm)
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
    adsSalesMaster: TADODataSet;
    adsSalesMasterID: TAutoIncField;
    adsSalesMasterCreateDate: TDateTimeField;
    adsSalesMasterCreateUserID: TIntegerField;
    adsSalesMasterRecordState: TStringField;
    adsSalesMasterDate: TDateTimeField;
    adsSalesMasterCode: TStringField;
    adsSalesMasterClientID: TIntegerField;
    adsSalesMasterEmployeID: TIntegerField;
    adsSalesMasterDiscountRate: TBCDField;
    adsSalesMasterIsTax: TStringField;
    adsSalesMasterTaxRate: TBCDField;
    adsSalesMasterIsDeliver: TStringField;
    adsSalesMasterBillMode: TStringField;
    adsSalesMasterBillModeDC: TIntegerField;
    adsSalesMasterOriginBillID: TIntegerField;
    adsSalesMasterOriginBillTypeID: TIntegerField;
    adsSalesMasterPeriodID: TIntegerField;
    adsSalesMasterClearDate: TDateTimeField;
    adsSalesMasterMemo: TStringField;
    adsSalesMasterSundryFee: TBCDField;
    adsSalesMasterIsApportion: TStringField;
    adsSalesMasterClientName: TStringField;
    adsSalesMasterEmployeename: TStringField;
    adsSalesMasterSaleAmount: TBCDField;
    adsSalesMasterSaleDiscount: TBCDField;
    PopupMenu1: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddNewActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  SLBrSaleBillSForm: TSLBrSaleBillSForm;

implementation

uses CommonDM, SLEdSaleBillS;

{$R *.dfm}

function TSLBrSaleBillSForm.CreateEditForm: TWSEditForm;
begin
  Result := TSLEdSaleBillSForm.Create(Self);
end;

procedure TSLBrSaleBillSForm.FormCreate(Sender: TObject);
var  I: Integer;
begin
  inherited;
//  clientName.Open;
//  employeename.Open;
  adsSalesMaster.Open;
end;

procedure TSLBrSaleBillSForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
//  clientName.Close;
//  employeename.Close;
  adsSalesMaster.Close;
end;

procedure TSLBrSaleBillSForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Requery();
end;

procedure TSLBrSaleBillSForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Requery();
end;

end.
