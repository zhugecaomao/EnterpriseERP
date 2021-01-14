unit DABrExpenseClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSTreeView, Menus, DB, ActnList, ToolWin, ComCtrls,WSEdit, ADODB;

type
  TDABrExpenseClassForm = class(TWSTreeViewForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    tblDABrExpenseClass: TADOTable;
    tblDABrExpenseClassID: TAutoIncField;
    tblDABrExpenseClassCreateDate: TDateTimeField;
    tblDABrExpenseClassCreateUserID: TIntegerField;
    tblDABrExpenseClassRecordState: TStringField;
    tblDABrExpenseClassUpid: TIntegerField;
    tblDABrExpenseClassName: TStringField;
    tblDABrExpenseClassMemo: TStringField;
    tblDABrExpenseClassLevelCode: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  DABrExpenseClassForm: TDABrExpenseClassForm;

implementation

uses CommonDM, DAEdExpenseClass;

{$R *.dfm}
function TDABrExpenseClassForm.CreateEditForm: TWSEditForm;
begin
    Result := TDAEdExpenseClassForm.Create(Application);
end;

procedure TDABrExpenseClassForm.FormCreate(Sender: TObject);
var
  aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    Close;
    sql.Text := ' select top 1 * from DAExpenseClass where '
      +' RecordState<>' +QuotedStr('删除');
    open;
    if aqrTemp.IsEmpty then
    begin
      aqrTemp.Close;
      aqrTemp.sql.Text := ' Insert Into DAExpenseClass (CreateUserID,'
      +' Upid , Name) '
        +' Values ( 1,-1,'+QuotedStr('费用项目')+' )';
      aqrTemp.ExecSQL;
    end;
  end;
  inherited;

end;

end.
