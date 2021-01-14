unit YDBrFormula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TYDBrFormulaForm = class(TWSVoucherBrowseForm)
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
    adsMasterRecordState: TStringField;
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterDSDesigner: TStringField;
    adsMasterDSDesigner2: TDateTimeField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner4: TDateTimeField;
    adsMasterDSDesigner5: TStringField;
    adsMasterDSDesigner6: TStringField;
    adsMasterDSDesigner7: TStringField;
    adsMasterDSDesigner8: TStringField;
    adsMasterDSDesigner9: TStringField;
    adsMasterDSDesigner10: TStringField;
    adsMasterDSDesigner11: TStringField;
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
  YDBrFormulaForm: TYDBrFormulaForm;

implementation

uses CommonDM, YDEdFormula ;
{$R *.dfm}

function TYDBrFormulaForm.CreateEditForm: TWSEditForm;
begin
  Result := TYDEdFormulaForm.Create(Self);
end;

procedure TYDBrFormulaForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Open;
end;

procedure TYDBrFormulaForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
end;

procedure TYDBrFormulaForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TYDBrFormulaForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

end.
