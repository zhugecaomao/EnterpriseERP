unit PCBrPurchase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TPCBrPurchaseForm = class(TWSVoucherBrowseForm)
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
    PopupMenu1: TPopupMenu;
    ToolButton14: TToolButton;
    adsSalesMasterID: TAutoIncField;
    adsSalesMasterClientID: TIntegerField;
    adsSalesMasterEmployeeID: TIntegerField;
    adsSalesMasterRecordState: TStringField;
    adsSalesMasterDSDesigner: TStringField;
    adsSalesMasterDSDesigner2: TDateTimeField;
    adsSalesMasterDSDesigner3: TStringField;
    adsSalesMasterDSDesigner4: TStringField;
    adsSalesMasterDSDesigner5: TBCDField;
    adsSalesMasterDSDesigner6: TBCDField;
    adsSalesMasterDSDesigner7: TStringField;
    adsSalesMasterDSDesigner8: TDateTimeField;
    adsSalesMasterDSDesigner9: TStringField;
    adsSalesMasterDSDesigner10: TStringField;
    adsSalesMasterDSDesigner11: TStringField;
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
  PCBrPurchaseForm: TPCBrPurchaseForm;

implementation

uses CommonDM , PCEdPurchase,PCEdPurchaseGTP,WSSecurity;

{$R *.dfm}

function TPCBrPurchaseForm.CreateEditForm: TWSEditForm;
begin
  if Guarder.PackToGoalUnit='ÊÇ' then
    Result := TPCEdPurchaseForm.Create(Self)
  else Result := TPCEdPurchaseGTPForm.Create(Self);
end;

procedure TPCBrPurchaseForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Open;
end;

procedure TPCBrPurchaseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsSalesMaster.Close;
end;

procedure TPCBrPurchaseForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Requery();
end;

procedure TPCBrPurchaseForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Requery();
end;

end.
