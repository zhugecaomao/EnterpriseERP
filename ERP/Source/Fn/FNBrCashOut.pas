unit FNBrCashOut;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TFNBrCashOutForm = class(TWSVoucherBrowseForm)
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
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterDSDesigner12: TStringField;
    adsMasterDSDesigner6: TBCDField;
    adsMasterDSDesigner5: TBCDField;
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
  FNBrCashOutForm: TFNBrCashOutForm;

implementation

uses CommonDM, FNEdCashOut,FNEdCashOutFRG,WSSecurity;

{$R *.dfm}

function TFNBrCashOutForm.CreateEditForm: TWSEditForm;
begin
  if Guarder.ForeignCurrencyFlag='ÊÇ' then
     Result := TFNEdCashOutFRGForm.Create(Self)
    else Result := TFNEdCashOUTForm.Create(Self);
end;

procedure TFNBrCashOutForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Close;
  adsMaster.Open;
end;

procedure TFNBrCashOutForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.close;
end;

procedure TFNBrCashOutForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TFNBrCashOutForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;



end.
