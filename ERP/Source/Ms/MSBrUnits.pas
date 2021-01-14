unit MSBrUnits;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, ToolWin, ComCtrls, Grids,
  DBGrids, QLDBGrid, ADODB,WSEdit, ExtCtrls, Menus;

type
  TMSBrUnitForm = class(TWSStandardBrowseForm)
    tblMSBrUnt: TADODataSet;
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
    tblMSBrUntID: TAutoIncField;
    tblMSBrUntName: TStringField;
    tblMSBrUntGoalUnitID: TIntegerField;
    tblMSBrUntIsGoalUnit: TBooleanField;
    tblMSBrUntRecordState: TStringField;
    ADOTable1: TADOTable;
    tblMSBrUntGoaLName: TStringField;
    ToolButton12: TToolButton;
    tblMSBrUntCreateDate: TDateTimeField;
    tblMSBrUntCreateUserID: TIntegerField;
    tblMSBrUntExchangeRate: TBCDField;
    ToolButton13: TToolButton;
    procedure tblMSBrUntIsGoalUnitGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure AddNewActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
      function CreateEditForm: TWSEditForm; override;
  end;

var
  MSBrUnitForm: TMSBrUnitForm;

implementation

uses CommonDM, MSEdUnit;

{$R *.dfm}
function TMSBrUnitForm.CreateEditForm: TWSEditForm;
begin
     Result := TMSEdUnitForm.Create(Application);
end;

procedure TMSBrUnitForm.tblMSBrUntIsGoalUnitGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  inherited;
if sender.Value
then text:='ÊÇ'
else text:='·ñ'
end;

procedure TMSBrUnitForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  ADOTable1.Requery();
  tblMSBrUnt.Close;
  tblMSBrUnt.Open;
end;

procedure TMSBrUnitForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  ADOTable1.Requery();
  tblMSBrUnt.Close;
  tblMSBrUnt.Open;
end;

procedure TMSBrUnitForm.DeleteActionExecute(Sender: TObject);
begin
  inherited;
  ADOTable1.Requery();
  tblMSBrUnt.Close;
  tblMSBrUnt.Open;
end;

end.
