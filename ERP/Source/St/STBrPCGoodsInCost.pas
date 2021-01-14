unit STBrPCGoodsInCost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TSTBrPCGoodsInCostForm = class(TWSVoucherBrowseForm)
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
  STBrPCGoodsInCostForm: TSTBrPCGoodsInCostForm;

implementation

uses CommonDM,WSSecurity,STEdPCGoodsInCost;

{$R *.dfm}

function TSTBrPCGoodsInCostForm.CreateEditForm: TWSEditForm;
begin
  Result := TSTEdPCGoodsInCostForm.Create(Self);
end;

procedure TSTBrPCGoodsInCostForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Open;
end;

procedure TSTBrPCGoodsInCostForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
end;

procedure TSTBrPCGoodsInCostForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TSTBrPCGoodsInCostForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TSTBrPCGoodsInCostForm.RefreshActionExecute(Sender: TObject);
var adoTemp: TADOQuery;
begin
  inherited;
//  Exit;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' Delete from STPCGoodsInCostMaster '
    +' where Recordstate='+Quotedstr('É¾³ý')
    +' Or  RecordState='+Quotedstr('×÷·Ï');
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.SQL.Text :=' Delete from STPCGoodsInCostDetail '
    +' where MasterID not in (select ID from STPCGoodsInCostMaster )';
  adoTemp.ExecSQL;

  adoTemp.Close;
  adoTemp.SQL.Text :=' Delete from STCALCostListMaster '
    +' where ( OriginTable='+Quotedstr('PCGoodsInMaster')
    +' and OriginID not in (select ID from PCGoodsInMaster) ) OR '
    +' ( OriginTable='+Quotedstr('YDGoodsOutMaster')
    +' and OriginID not in (select ID from YDGoodsOutMaster) ) ';
  adoTemp.ExecSQL;
end;

end.
