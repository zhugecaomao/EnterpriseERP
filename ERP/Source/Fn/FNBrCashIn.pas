unit FNBrCashIn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TFNBrCashInForm = class(TWSVoucherBrowseForm)
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
    adsMasterDSDesigner7: TStringField;
    adsMasterDSDesigner5: TBCDField;
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterDSDesigner12: TStringField;
    adsMasterDSDesigner6: TBCDField;
    adsMasterDSDesigner4: TStringField;
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
  FNBrCashInForm: TFNBrCashInForm;

implementation

uses CommonDM ,FNEdCashIn,FNEdCashInFRG,WSSecurity;

{$R *.dfm}

function TFNBrCashInForm.CreateEditForm: TWSEditForm;
begin
  if Guarder.ForeignCurrencyFlag='ÊÇ' then
     Result := TFNEdCashInFRGForm.Create(Self)
    else Result := TFNEdCashInForm.Create(Self);
end;

procedure TFNBrCashInForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Close;
  adsMaster.Open;
end;

procedure TFNBrCashInForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.close;
end;

procedure TFNBrCashInForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TFNBrCashInForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;



end.
