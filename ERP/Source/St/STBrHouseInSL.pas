unit STBrHouseInSL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, ToolWin, ComCtrls, Grids,
  DBGrids, QLDBGrid, ADODB, WSEdit, ExtCtrls;

type
  TSTHouseInBrowseSLForm = class(TWSVoucherBrowseForm)
    ADODataSet1: TADODataSet;
    ADODataSet1ID: TAutoIncField;
    ADODataSet1CreateDate: TDateTimeField;
    ADODataSet1CreateUserID: TIntegerField;
    ADODataSet1RecordState: TStringField;
    ADODataSet1Date: TDateTimeField;
    ADODataSet1Code: TStringField;
    ADODataSet1HouseOut: TStringField;
    ADODataSet1ConsigneeName: TStringField;
    ADODataSet1MngName: TStringField;
    ADODataSet1WarehouseName: TStringField;
    ADODataSet1BillTypeName: TStringField;
    ADODataSet1OriginBillID: TIntegerField;
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
    ADODataSet1PeriodID: TIntegerField;
    ADODataSet1memo: TStringField;
    procedure AddNewActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  STHouseInBrowseSLForm: TSTHouseInBrowseSLForm;

implementation

uses STEdHouseInSL, CommonDM;

{$R *.dfm}

function TSTHouseInBrowseSLForm.CreateEditForm: TWSEditForm;
begin
  Result := TSTHouseInEditSLForm.Create(Application);
end;

procedure TSTHouseInBrowseSLForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  ADODataSet1.Requery(); 
end;

procedure TSTHouseInBrowseSLForm.DeleteActionExecute(Sender: TObject);
begin
  inherited;
  ADODataSet1.Requery();
end;

procedure TSTHouseInBrowseSLForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  ADODataSet1.Requery();
end;

end.

