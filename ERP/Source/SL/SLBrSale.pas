unit SLBrSale;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TSLBrSaleForm = class(TWSVoucherBrowseForm)
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
    ToolButton14: TToolButton;
    adsMasterID: TAutoIncField;
    adsMasterRecordState: TStringField;
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterDSDesigner: TStringField;
    adsMasterDSDesigner2: TDateTimeField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner4: TStringField;
    adsMasterDSDesigner5: TBCDField;
    adsMasterDSDesigner6: TBCDField;
    adsMasterDSDesigner7: TDateTimeField;
    adsMasterDSDesigner8: TStringField;
    adsMasterDSDesigner9: TStringField;
    adsMasterDSDesigner10: TStringField;
    adsMasterDSDesigner11: TStringField;
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
  SLBrSaleForm: TSLBrSaleForm;

implementation

uses CommonDM, WSSecurity,SLEdSale,SLEdSaleGTP,SLEdSaleDsct,SLEdSaleDsctGTP ;
{$R *.dfm}

function TSLBrSaleForm.CreateEditForm: TWSEditForm;
begin
  if Guarder.PackToGoalUnit='ÊÇ' then
  begin
    if Guarder.UseDiscountSLFlag='ÊÇ' then
      Result := TSLEdSaleDsctForm.Create(Self)
    else Result := TSLEdSaleForm.Create(Self)
  end else
  begin
    if Guarder.UseDiscountSLFlag='ÊÇ' then
       Result := TSLEdSaleDsctGTPForm.Create(Self)
    else Result := TSLEdSaleGTPForm.Create(Self);
  end;
end;

procedure TSLBrSaleForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Open;
end;

procedure TSLBrSaleForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
end;

procedure TSLBrSaleForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TSLBrSaleForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

end.
