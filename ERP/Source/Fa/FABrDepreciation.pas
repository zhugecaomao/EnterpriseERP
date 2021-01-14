unit FABrDepreciation;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TFABrDepreciationForm = class(TWSVoucherBrowseForm)
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
    adsSalesMasterDSDesigner: TStringField;
    adsSalesMasterDSDesigner2: TDateTimeField;
    adsSalesMasterDSDesigner3: TStringField;
    adsSalesMasterDSDesigner4: TStringField;
    adsSalesMasterDSDesigner5: TDateTimeField;
    adsSalesMasterDSDesigner6: TStringField;
    adsSalesMasterDSDesigner7: TStringField;
    adsSalesMasterDSDesigner8: TStringField;
    adsSalesMasterDSDesigner9: TStringField;
    adsSalesMasterDSDesigner10: TStringField;
    adsSalesMasterDSDesigner11: TBCDField;
    adsSalesMasterDSDesigner12: TStringField;
    adsSalesMasterID: TAutoIncField;
    adsSalesMasterRecordState: TStringField;
    adsSalesMasterClientID: TIntegerField;
    adsSalesMasterEmployeeID: TIntegerField;
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
  FABrDepreciationForm: TFABrDepreciationForm;

implementation

uses CommonDM,FAEdDepreciation;

{$R *.dfm}

function TFABrDepreciationForm.CreateEditForm: TWSEditForm;
begin
  Result := TFAEdDepreciationForm.Create(Self);
end;

procedure TFABrDepreciationForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Open;
end;

procedure TFABrDepreciationForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsSalesMaster.Close;
end;

procedure TFABrDepreciationForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Requery();
end;

procedure TFABrDepreciationForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Requery();
end;


end.
