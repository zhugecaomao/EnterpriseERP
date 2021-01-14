unit STBrHouseMove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid, WSEdit,
  ComCtrls, ExtCtrls, ToolWin, ADODB;

type
  TSTBrHouseMoveForm = class(TWSVoucherBrowseForm)
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
    ADODataSet1: TADODataSet;
    ADODataSet1ID: TAutoIncField;
    ADODataSet1CreateDate: TDateTimeField;
    ADODataSet1CreateUserID: TIntegerField;
    ADODataSet1RecordState: TStringField;
    ADODataSet1Date: TDateTimeField;
    ADODataSet1Code: TStringField;
    ADODataSet1EmployeeID: TIntegerField;
    ADODataSet1Memo: TStringField;
    ADODataSet1Name: TStringField;
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
  STBrHouseMoveForm: TSTBrHouseMoveForm;

implementation

uses CommonDM, STEdHouseMove;

{$R *.dfm}

function TSTBrHouseMoveForm.CreateEditForm: TWSEditForm;
begin
  Result := TSTEdHouseMoveForm.Create(Application);
end;

procedure TSTBrHouseMoveForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  ADODataSet1.Requery();
end;

procedure TSTBrHouseMoveForm.DeleteActionExecute(Sender: TObject);
begin
  inherited;
  ADODataSet1.Requery();
end;

procedure TSTBrHouseMoveForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  ADODataSet1.Requery();
end;

end.

