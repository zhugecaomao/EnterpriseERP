unit OABrJobRecordsMng;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid, WSEdit,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TOABrJobRecordsMngForm = class(TWSStandardBrowseForm)
    ADODataSet1: TADODataSet;
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
    ADODataSet1Memo: TMemoField;
    ADODataSet1DoneDate: TDateTimeField;
    ADODataSet1PlanDate: TDateTimeField;
    ADODataSet1ClientID: TIntegerField;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  OABrJobRecordsMngForm: TOABrJobRecordsMngForm;

implementation

uses CommonDM, WSSecurity, OAEdJobRecords;

{$R *.dfm}

procedure TOABrJobRecordsMngForm.FormCreate(Sender: TObject);
begin
  inherited;
  with ADODataSet1 do
  begin
    close;
    commandtext := 'select * from OAJobRecords where RecordState<>' + quotedstr('É¾³ý');
    open;
  end;
end;

function TOABrJobRecordsMngForm.CreateEditForm: TWSEditForm;
begin
  Result := TOAEdJobRecordsForm.Create(Application);
end;


procedure TOABrJobRecordsMngForm.DBGridDblClick(Sender: TObject);
begin
//  inherited;

end;

procedure TOABrJobRecordsMngForm.FormShow(Sender: TObject);
begin
 // inherited;
  PageControl.OnChange(PageControl);
end;

end.

