unit PCBrGoodsInB;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TPCBrGoodsInBForm = class(TWSVoucherBrowseForm)
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
    adsSalesMasterID: TAutoIncField;
    adsSalesMasterClientID: TIntegerField;
    adsSalesMasterEmployeeID: TIntegerField;
    adsSalesMasterDSDesigner: TStringField;
    adsSalesMasterDSDesigner2: TDateTimeField;
    adsSalesMasterDSDesigner3: TStringField;
    adsSalesMasterDSDesigner4: TDateTimeField;
    adsSalesMasterDSDesigner5: TStringField;
    adsSalesMasterDSDesigner6: TStringField;
    adsSalesMasterDSDesigner7: TStringField;
    adsSalesMasterDSDesigner8: TStringField;
    adsSalesMasterDSDesigner9: TStringField;
    adsSalesMasterDSDesigner10: TBCDField;
    adsSalesMasterDSDesigner11: TStringField;
    adsSalesMasterRecordState: TStringField;
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
  PCBrGoodsInBForm: TPCBrGoodsInBForm;

implementation

uses CommonDM, PCEdGoodsInB,PCEdGoodsInBGTP,WSSecurity;

{$R *.dfm}

function TPCBrGoodsInBForm.CreateEditForm: TWSEditForm;
begin
  if Guarder.PackToGoalUnit='ÊÇ' then
    Result := TPCEdGoodsInBForm.Create(Self)
  else Result := TPCEdGoodsInBGTPForm.Create(Self);
end;

procedure TPCBrGoodsInBForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Open;
end;

procedure TPCBrGoodsInBForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsSalesMaster.Close;
end;

procedure TPCBrGoodsInBForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Requery();
end;

procedure TPCBrGoodsInBForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Requery();
end;

end.
