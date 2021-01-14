unit DABrPOClear;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, WSEdit,ADODB, Menus;

type
  TDABrPOClearForm = class(TWSStandardBrowseForm)
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
    tblDABrPOClear: TADODataSet;
    tblDABrPOClearID: TAutoIncField;
    tblDABrPOClearCreateDate: TDateTimeField;
    tblDABrPOClearCreateUserID: TIntegerField;
    tblDABrPOClearRecordState: TStringField;
    tblDABrPOClearName: TStringField;
    tblDABrPOClearBrief: TStringField;
    tblDABrPOClearMemo: TStringField;
    ToolButton14: TToolButton;
    procedure DeleteActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
          protected
      function CreateEditForm: TWSEditForm; override;
  end;

var
  DABrPOClearForm: TDABrPOClearForm;

implementation

uses CommonDM, DAEdPOClear;

{$R *.dfm}


function TDABrPOClearForm.CreateEditForm: TWSEditForm;
begin
     Result := TDAEdPOClearForm.Create(Application);
end;
procedure TDABrPOClearForm.DeleteActionExecute(Sender: TObject);
begin
  inherited;
  tblDABrPOClear.Requery;
end;

end.
