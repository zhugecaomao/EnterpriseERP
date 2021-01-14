unit STBrSLGoodsOutCost;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TSTBrSLGoodsOutCostForm = class(TWSVoucherBrowseForm)
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
  STBrSLGoodsOutCostForm: TSTBrSLGoodsOutCostForm;

implementation

uses CommonDM,WSSecurity,STEdSLGoodsOutCost;

{$R *.dfm}

function TSTBrSLGoodsOutCostForm.CreateEditForm: TWSEditForm;
begin
  Result := TSTEdSLGoodsOutCostForm.Create(Self);
end;

procedure TSTBrSLGoodsOutCostForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsMaster.Open;
end;

procedure TSTBrSLGoodsOutCostForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
end;

procedure TSTBrSLGoodsOutCostForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TSTBrSLGoodsOutCostForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TSTBrSLGoodsOutCostForm.RefreshActionExecute(Sender: TObject);
var adoTemp: TADOQuery;
begin
  inherited;
//  Exit;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.Close;
  adoTemp.SQL.Text :=' Delete from STSLGoodsOutCostMaster '
    +' where Recordstate='+Quotedstr('É¾³ý')
    +' Or  RecordState='+Quotedstr('×÷·Ï');
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.SQL.Text :=' Delete from STSLGoodsOutCostDetail '
    +' where MasterID not in (select ID from STSLGoodsOutCostMaster )';
  adoTemp.ExecSQL;

  adoTemp.Close;//ÐÞ¸Ä£¿£¿
  adoTemp.SQL.Text :=' Delete from STCALCostListMaster '
    +' where ( OriginTable='+Quotedstr('PCGoodsInMaster')
    +' and OriginID not in (select ID from STSLGoodsOutCostInMaster) ) OR '
    +' ( OriginTable='+Quotedstr('YDGoodsOutMaster')
    +' and OriginID not in (select ID from YDGoodsOutMaster) ) ';
  adoTemp.ExecSQL;
end;

end.
