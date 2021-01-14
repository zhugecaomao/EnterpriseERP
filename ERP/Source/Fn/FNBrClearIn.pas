unit FNBrClearIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB;

type
  TFNBrClearInForm = class(TWSVoucherBrowseForm)
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
    adsSLBrClearBill: TADODataSet;
    adsSLBrClearBillid: TAutoIncField;
    adsSLBrClearBillDSDesigner: TDateTimeField;
    adsSLBrClearBillDSDesigner2: TStringField;
    adsSLBrClearBillDSDesigner3: TStringField;
    adsSLBrClearBillDSDesigner8: TStringField;
    adsSLBrClearBillDSDesigner9: TStringField;
    adsSLBrClearBillDSDesigner10: TStringField;
    adsSLBrClearBillDSDesigner4: TStringField;
    adsSLBrClearBillDSDesigner7: TStringField;
    adsSLBrClearBillDSDesigner5: TBCDField;
    adsSLBrClearBillClientID: TIntegerField;
    adsSLBrClearBillEmployeeID: TIntegerField;
    adsSLBrClearBillDSDesigner12: TStringField;
    adsSLBrClearBillDSDesigner6: TBCDField;
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
  FNBrClearInForm: TFNBrClearInForm;

implementation

uses CommonDM;
//,FNEdClearSL;

{$R *.dfm}

function TFNBrClearInForm.CreateEditForm: TWSEditForm;
begin
//  Result := TFNEdClearSLForm.Create(Self);
end;

procedure TFNBrClearInForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsSLBrClearBill.Close;
  adsSLBrClearBill.Open;
end;

procedure TFNBrClearInForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsSLBrClearBill.close;
end;

procedure TFNBrClearInForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsSLBrClearBill.Requery();
end;

procedure TFNBrClearInForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsSLBrClearBill.Requery();
end;



end.
