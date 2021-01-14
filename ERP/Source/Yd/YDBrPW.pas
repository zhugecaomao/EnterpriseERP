unit YDBrPW;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls,WSEdit, ToolWin, ADODB, Menus;

type
  TYDBrPWForm = class(TWSStandardBrowseForm)
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
    tblYDBrPW: TADODataSet;
    tblYDBrPWID: TAutoIncField;
    tblYDBrPWCreateDate: TDateTimeField;
    tblYDBrPWCreateUserID: TIntegerField;
    tblYDBrPWRecordState: TStringField;
    tblYDBrPWClass: TStringField;
    tblYDBrPWName: TStringField;
    tblYDBrPWPowerIndex: TBCDField;
    tblYDBrPWMemo: TStringField;
    ToolButton14: TToolButton;
  private
    { Private declarations }
  public
    { Public declarations }
    function CreateEditForm: TWSEditForm; override;
  end;

var
  YDBrPWForm: TYDBrPWForm;

implementation

uses CommonDM, YDEdPW;

{$R *.dfm}
function TYDBrPWForm.CreateEditForm: TWSEditForm;
begin
    Result := TYDEdPWForm.Create(Application);
end;

end.
