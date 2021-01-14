unit SRBrJobs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, ToolWin, ComCtrls, Grids,
  DBGrids, QLDBGrid, ADODB,WSEdit, ExtCtrls;

type
  TSRBrJobsForm = class(TWSStandardBrowseForm)
    tblFNAccountsBr: TADOTable;
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
    tblFNAccountsBrID: TAutoIncField;
    tblFNAccountsBrCreateDate: TDateTimeField;
    tblFNAccountsBrCreateUserID: TIntegerField;
    tblFNAccountsBrRecordState: TStringField;
    tblFNAccountsBrName: TStringField;
    tblFNAccountsBrBrief: TStringField;
    tblFNAccountsBrPriceBase: TBCDField;
    tblFNAccountsBrMemo: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblFNAccountsBrFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
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

procedure TSRBrJobsForm.FormCreate(Sender: TObject);
begin
tblFNAccountsBr.open;
  inherited;

end;

procedure TSRBrJobsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
tblFNAccountsBr.close;
action:=cafree;
end;

procedure TSRBrJobsForm.tblFNAccountsBrFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

end.
