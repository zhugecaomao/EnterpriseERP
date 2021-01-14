unit EGBrMaterialIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TEGBrMaterialInForm = class(TWSVoucherBrowseForm)
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
    procedure FiltrateActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  EGBrMaterialInForm: TEGBrMaterialInForm;

implementation

uses CommonDM, WSSecurity,EGEdMaterialIn,EGEdMaterialInGTP ;
{$R *.dfm}

function TEGBrMaterialInForm.CreateEditForm: TWSEditForm;
begin
  if Guarder.PackToGoalUnit='ÊÇ' then
    Result := TEGEdMaterialInForm.Create(Self)
  else Result := TEGEdMaterialInGTPForm.Create(Self);
end;

procedure TEGBrMaterialInForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Open;
end;

procedure TEGBrMaterialInForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
end;

procedure TEGBrMaterialInForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TEGBrMaterialInForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TEGBrMaterialInForm.FiltrateActionExecute(Sender: TObject);
begin
//
  inherited;
//
end;

end.
