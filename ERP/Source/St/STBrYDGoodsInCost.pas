unit STBrYDGoodsInCost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TSTBrYDGoodsInCostForm = class(TWSVoucherBrowseForm)
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
    adsMasterDSDesigner7: TStringField;
    adsMasterDSDesigner8: TStringField;
    adsMasterRecordstate: TStringField;
    adsMasterDSDesigner5: TDateTimeField;
    adsMasterDSDesigner6: TStringField;
    ToolButton14: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddNewActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  STBrYDGoodsInCostForm: TSTBrYDGoodsInCostForm;

implementation

uses CommonDM,WSSecurity,STEdYDGoodsInCost;

{$R *.dfm}

function TSTBrYDGoodsInCostForm.CreateEditForm: TWSEditForm;
begin
  Result := TSTEdYDGoodsInCostForm.Create(Self);
end;

procedure TSTBrYDGoodsInCostForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Open;
end;

procedure TSTBrYDGoodsInCostForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
end;

procedure TSTBrYDGoodsInCostForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TSTBrYDGoodsInCostForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TSTBrYDGoodsInCostForm.RefreshActionExecute(Sender: TObject);
var adoTemp: TADOQuery;
begin
  inherited;
  Exit;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' Delete from STCALCostListMaster '
    +' where OriginTable='+Quotedstr('PCGoodsInMaster')
    +' and OriginID not in '
    +' ( select OriginID from STYDGoodsOutCostDetail a '
    +' Left out join STYDGoodsInCostMaster b on b.ID=a.MasterID '
    +' where b.RecordState<>'+Quotedstr('É¾³ý')
    +' and b.RecordState<>'+Quotedstr('×÷·Ï')   ;
  adoTemp.ExecSQL;
end;

end.
