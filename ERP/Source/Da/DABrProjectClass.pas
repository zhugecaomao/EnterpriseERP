unit DABrProjectClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSTreeView, DB, ActnList, ToolWin,DAEdAreas, ComCtrls, ADODB,WSEdit,
  Menus;

type
  TDAProjectClassBrowseForm = class(TWSTreeViewForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    tblDAAreasBrowse: TADOTable;
    tblDAAreasBrowseID: TAutoIncField;
    tblDAAreasBrowseCreateDate: TDateTimeField;
    tblDAAreasBrowseCreateUserID: TIntegerField;
    tblDAAreasBrowseRecordState: TStringField;
    tblDAAreasBrowseName: TStringField;
    tblDAAreasBrowseUpID: TIntegerField;
    tblDAAreasBrowseLevelCode: TStringField;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  DAProjectClassBrowseForm: TDAProjectClassBrowseForm;

implementation

uses CommonDM,DAEdProjectClass;

{$R *.dfm}
function TDAProjectClassBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TDAProjectClassEditForm.Create(Application);
end;


procedure TDAProjectClassBrowseForm.FormCreate(Sender: TObject);
var
  aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    Close;
    sql.Text := ' select top 1 * from DAProjectClass where '
      +' RecordState<>' +QuotedStr('删除');
    open;
    if aqrTemp.IsEmpty then
    begin
      aqrTemp.Close;
      aqrTemp.sql.Text := ' Insert Into DAProjectClass (CreateUserID,'
      +' Upid , Name) '
        +' Values ( 1,-1,'+QuotedStr('所有项目')+' )';
      aqrTemp.ExecSQL;
    end;
  end;
  inherited;

end;

end.
