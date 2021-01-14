unit SRBrWorkQuantity;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TSRBrWorkQuantityForm = class(TWSVoucherBrowseForm)
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
    adsMasterID: TAutoIncField;
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterDSDesigner: TDateTimeField;
    adsMastercode: TStringField;
    adsMasterDSDesigner2: TStringField;
    adsMasterDSDesigner4: TStringField;
    adsMasterDSDesigner5: TStringField;
    adsMasterDSDesigner8: TStringField;
    adsMasterRecordState: TStringField;
    adsMasterDSDesigner9: TStringField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner6: TStringField;
    adsMasterDSDesigner7: TDateTimeField;
    ToolButton14: TToolButton;
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
  SRBrWorkQuantityForm: TSRBrWorkQuantityForm;

implementation

uses CommonDM, SREdWorkQuantity;

{$R *.dfm}

function TSRBrWorkQuantityForm.CreateEditForm: TWSEditForm;
begin
  Result := TSREdWorkQuantityForm.Create(Self);
end;

procedure TSRBrWorkQuantityForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Open;
end;

procedure TSRBrWorkQuantityForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
end;

procedure TSRBrWorkQuantityForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TSRBrWorkQuantityForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

end.
