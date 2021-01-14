unit PCBrClearBillA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB;

type
  TPCBrClearBillAForm = class(TWSVoucherBrowseForm)
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
  PCBrClearBillAForm: TPCBrClearBillAForm;

implementation

uses CommonDM, PCEdClearBillA;

{$R *.dfm}

function TPCBrClearBillAForm.CreateEditForm: TWSEditForm;
begin
  Result := TPCEdClearBillAForm.Create(Self);
end;

procedure TPCBrClearBillAForm.FormCreate(Sender: TObject);
var  I: Integer;
begin
  inherited;
  clientName.Open;
  employeename.Open;
  PCEdClearBillAForm.Caption :='�ɹ�����';
  TabSheet1.Caption :='�ɹ�����ƾ��';
  DBGrid.Columns[2].Title.Caption :='��������'
end;

procedure TPCBrClearBillAForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  clientName.Close;
  employeename.Close;
end;

procedure TPCBrClearBillAForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  tblSLBrClearBill.Requery();
end;

procedure TPCBrClearBillAForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  tblSLBrClearBill.Requery();
end;

end.