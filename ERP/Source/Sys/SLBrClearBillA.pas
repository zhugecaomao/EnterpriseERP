unit SLBrClearBillA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB;

type
  TSLBrClearBillAForm = class(TWSVoucherBrowseForm)
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
  SLBrClearBillAForm: TSLBrClearBillAForm;

implementation

uses CommonDM, SLEdClearBillA;

{$R *.dfm}

function TSLBrClearBillAForm.CreateEditForm: TWSEditForm;
begin
  Result := TSLEdClearBillAForm.Create(Self);
end;

procedure TSLBrClearBillAForm.FormCreate(Sender: TObject);
var  I: Integer;
begin
  inherited;
  clientName.Open;
  employeename.Open;
  SLBrClearBillForm.Caption :='销售结算';
  TabSheet1.Caption :='销售结算凭单';
  DBGrid.Columns[2].Title.Caption :='客户名称'
end;

procedure TSLBrClearBillAForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  clientName.Close;
  employeename.Close;
end;

procedure TSLBrClearBillAForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  tblSLBrClearBill.Requery();
end;

procedure TSLBrClearBillAForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  tblSLBrClearBill.Requery();
end;

end.
