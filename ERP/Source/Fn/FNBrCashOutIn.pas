unit FNBrCashOutIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TFNBrCashOutInForm = class(TWSVoucherBrowseForm)
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
    adsMasterid: TAutoIncField;
    adsMasterDSDesigner: TDateTimeField;
    adsMasterDSDesigner2: TStringField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner8: TStringField;
    adsMasterDSDesigner9: TStringField;
    adsMasterDSDesigner10: TStringField;
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterDSDesigner12: TStringField;
    adsMasterDSDesigner6: TBCDField;
    adsMasterDSDesigner4: TStringField;
    adsMasterDSDesigner5: TStringField;
    adsMasterDSDesigner7: TBCDField;
    adsMasterRecordState: TStringField;
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
  FNBrCashOutInForm: TFNBrCashOutInForm;

implementation

uses CommonDM ,FNEdCashOutIn;

{$R *.dfm}

function TFNBrCashOutInForm.CreateEditForm: TWSEditForm;
begin
  Result := TFNEdCashOutInForm.Create(Self);
end;

procedure TFNBrCashOutInForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Close;
  adsMaster.Open;
end;

procedure TFNBrCashOutInForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.close;
end;

procedure TFNBrCashOutInForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TFNBrCashOutInForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;



end.
