unit OABrJobRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid, WSEdit,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TOABrJobRecordsForm = class(TWSStandardBrowseForm)
    ADODataSet1: TADODataSet;
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
    ADODataSet1ID: TAutoIncField;
    ADODataSet1CreateDate: TDateTimeField;
    ADODataSet1CreateUserID: TIntegerField;
    ADODataSet1RecordState: TStringField;
    ADODataSet1Date: TDateTimeField;
    ADODataSet1Code: TStringField;
    ADODataSet1Client: TStringField;
    ADODataSet1ProjectAmount: TBCDField;
    ADODataSet1PeriodID: TIntegerField;
    ADODataSet1RecordAffair: TMemoField;
    ADODataSet1MainDemand: TMemoField;
    ADODataSet1PlanDate: TDateTimeField;
    ADODataSet1Memo: TMemoField;
    ADODataSet1DoneDate: TDateTimeField;
    ADODataSet1ClientID: TIntegerField;
    ToolButton14: TToolButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  OABrJobRecordsForm: TOABrJobRecordsForm;

implementation

uses CommonDM, WSSecurity, OAEdJobRecords;

{$R *.dfm}

procedure TOABrJobRecordsForm.FormCreate(Sender: TObject);
begin
  inherited;
  with ADODataSet1 do
  begin
    close;
    commandtext := 'select * from OAJobRecords where RecordState<>' + quotedstr('É¾³ý') +
      ' and CreateUserID=' + inttostr(Guarder.UserID);
    open;
  end;
end;

function TOABrJobRecordsForm.CreateEditForm: TWSEditForm;
begin
  Result := TOAEdJobRecordsForm.Create(Application);
end;


end.

