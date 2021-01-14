unit EGBrFACReceipt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TEGBrFACReceiptForm = class(TWSVoucherBrowseForm)
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
    adsMaster: TADODataSet;
    PopupMenu1: TPopupMenu;
    adsMasterDSDesigner: TStringField;
    adsMasterDSDesigner2: TDateTimeField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner4: TDateTimeField;
    adsMasterDSDesigner5: TStringField;
    adsMasterDSDesigner6: TStringField;
    adsMasterDSDesigner7: TStringField;
    adsMasterDSDesigner8: TStringField;
    adsMasterDSDesigner9: TStringField;
    adsMasterDSDesigner10: TBCDField;
    adsMasterDSDesigner11: TBCDField;
    adsMasterID: TAutoIncField;
    adsMasterDSDesigner12: TBCDField;
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterDSDesigner13: TStringField;
    adsMasterRecordState: TStringField;
    adsMasterDSDesigner14: TStringField;
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
  EGBrFACReceiptForm: TEGBrFACReceiptForm;

implementation

uses CommonDM, WSSecurity,EGEdFACReceipt;
{$R *.dfm}

function TEGBrFACReceiptForm.CreateEditForm: TWSEditForm;
begin
  Result := TEGEdFACReceiptForm.Create(Self)
end;

procedure TEGBrFACReceiptForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Open;
end;

procedure TEGBrFACReceiptForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
end;

procedure TEGBrFACReceiptForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TEGBrFACReceiptForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

end.
