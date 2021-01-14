unit PCBrClearBill;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB;

type
  TPCBrClearBillForm = class(TWSVoucherBrowseForm)
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
    tblSLBrClearBill: TADODataSet;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    tblSLBrClearBillID: TAutoIncField;
    tblSLBrClearBillCreateDate: TDateTimeField;
    tblSLBrClearBillCreateUserID: TIntegerField;
    tblSLBrClearBillRecordState: TStringField;
    tblSLBrClearBillDate: TDateTimeField;
    tblSLBrClearBillCode: TStringField;
    tblSLBrClearBillClientID: TIntegerField;
    tblSLBrClearBillEmployeID: TIntegerField;
    tblSLBrClearBillOriginBillID: TIntegerField;
    tblSLBrClearBillPeriodID: TIntegerField;
    tblSLBrClearBillAcceptAmount: TBCDField;
    tblSLBrClearBillMemo: TStringField;
    tblSLBrClearBillClientName: TStringField;
    tblSLBrClearBillEmployename: TStringField;
    tblSLBrClearBillBillMode: TStringField;
    tblSLBrClearBillBillModeDC: TIntegerField;
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
  PCBrClearBillForm: TPCBrClearBillForm;

implementation

uses CommonDM, PCEdClearBill;

{$R *.dfm}

function TPCBrClearBillForm.CreateEditForm: TWSEditForm;
begin
  Result := TPCEdClearBillForm.Create(Self);
end;

procedure TPCBrClearBillForm.FormCreate(Sender: TObject);
var  I: Integer;
begin
  inherited;
  clientName.Open;
  employeename.Open;
  PCEdClearBillForm.Caption :='采购结算';
  TabSheet1.Caption :='采购结算凭单';
  DBGrid.Columns[2].Title.Caption :='厂商名称'  ;
  tblSLBrClearBill.Open;
end;

procedure TPCBrClearBillForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  clientName.Close;
  employeename.Close;
end;

procedure TPCBrClearBillForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  tblSLBrClearBill.Requery();
end;

procedure TPCBrClearBillForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  tblSLBrClearBill.Requery();
end;

end.
