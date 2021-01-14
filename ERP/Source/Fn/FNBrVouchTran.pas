unit FNBrVouchTran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TFNBrVouchTranForm = class(TWSVoucherBrowseForm)
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
    adsMasterDSDesigner9: TStringField;
    adsMasterID: TAutoIncField;
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterDSDesigner: TStringField;
    adsMasterDSDesigner2: TDateTimeField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner4: TStringField;
    adsMasterDSDesigner5: TDateTimeField;
    adsMasterDSDesigner6: TStringField;
    adsMasterDSDesigner7: TStringField;
    adsMasterDSDesigner8: TStringField;
    adsMasterRecordstate: TStringField;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    ToolButton16: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddNewActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure ToolButton14Click(Sender: TObject);
    procedure ToolButton15Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FNBrVouchTranForm: TFNBrVouchTranForm;

implementation

uses CommonDM,WSSecurity,FNEdVouchTran, FNVouchTranIni;

{$R *.dfm}

function TFNBrVouchTranForm.CreateEditForm: TWSEditForm;
begin
  Result := TFNEdVouchTranForm.Create(Self);
end;

procedure TFNBrVouchTranForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Open;
end;

procedure TFNBrVouchTranForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
end;

procedure TFNBrVouchTranForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TFNBrVouchTranForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TFNBrVouchTranForm.ToolButton14Click(Sender: TObject);
begin
  Application.CreateForm(TFNVouchTranIniForm, FNVouchTranIniForm);
  FNVouchTranIniForm.ShowModal;
  FNVouchTranIniForm.Free;
end;

procedure TFNBrVouchTranForm.ToolButton15Click(Sender: TObject);
begin
  inherited;
//
end;

end.
