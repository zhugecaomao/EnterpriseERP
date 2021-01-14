unit SRBrJobs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, WSEdit,ADODB, Menus;

type
  TSRBrJobsForm = class(TWSStandardBrowseForm)
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
    tblDABrPOClear: TADOTable;
    tblDABrPOClearID: TAutoIncField;
    tblDABrPOClearCreateDate: TDateTimeField;
    tblDABrPOClearCreateUserID: TIntegerField;
    tblDABrPOClearRecordState: TStringField;
    tblDABrPOClearName: TStringField;
    tblDABrPOClearBrief: TStringField;
    tblDABrPOClearPriceBase: TBCDField;
    tblDABrPOClearMemo: TStringField;
    ToolButton14: TToolButton;
  private
    { Private declarations }
  public
    { Public declarations }
          protected
      function CreateEditForm: TWSEditForm; override;
  end;

var
  SRBrJobsForm: TSRBrJobsForm;

implementation

uses CommonDM, SREdJobs;

{$R *.dfm}


function TSRBrJobsForm.CreateEditForm: TWSEditForm;
begin
  Result := TSREdJobsForm.Create(Application);
end;
end.
