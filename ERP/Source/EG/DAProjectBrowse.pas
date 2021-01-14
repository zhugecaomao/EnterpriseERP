unit DAProjectBrowse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSTreeView, DB, ActnList, ToolWin, ComCtrls,WSEdit, ADODB, Menus,
  Grids, DBGrids, ExtCtrls;

type
  TDAProjectBrowseForm = class(TWSTreeViewForm)
    tblDAAttributeBr: TADOTable;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    tblDAAttributeBrID: TAutoIncField;
    tblDAAttributeBrCreateDate: TDateTimeField;
    tblDAAttributeBrCreateUserID: TIntegerField;
    tblDAAttributeBrRecordState: TStringField;
    tblDAAttributeBrUpid: TIntegerField;
    tblDAAttributeBrName: TStringField;
    tblDAAttributeBrMemo: TStringField;
    tblDAAttributeBrLevelCode: TStringField;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Splitter1: TSplitter;
    adsMaster: TADODataSet;
    adsMasterName: TStringField;
    adsMasterDSDesigner: TStringField;
    adsMasterDSDesigner2: TStringField;
    adsMasterDSDesigner3: TStringField;
    adsMasterID: TAutoIncField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton8Click(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
    procedure AddNewActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
  end;

var
  DAProjectBrowseForm: TDAProjectBrowseForm;

implementation

uses CommonDM, WSUtils, WSSecurity, DAProjectEdit;

{$R *.dfm}

procedure TDAProjectBrowseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblDAAttributeBr.Close;
  action:=cafree;
end;
function TDAProjectBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TDAProjectEditForm.Create(Application);
end;

procedure TDAProjectBrowseForm.FormCreate(Sender: TObject);
var aqrTemp: TADOQuery;
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
      aqrTemp.sql.Text := ' Insert Into DAProjectClass (Upid, '
        +' CreateUserID,Name) Values ( -1,0,'
        +QuotedStr('所有项目资料')+' )';
      aqrTemp.ExecSQL;
    end;
  end;
  ToolButton8.Enabled :=True;
  inherited;
  adsMaster.Close;
  adsMaster.Open;
end;

procedure TDAProjectBrowseForm.ToolButton8Click(Sender: TObject);
begin
  { DONE -cUI : 添加导出 DBGrid 的内容的代码}
  ExportDBGridToExcel(DBGrid1, GetKeyState(VK_SHIFT) and $80000 = $80000,caption,'','');
end;

procedure TDAProjectBrowseForm.TreeViewClick(Sender: TObject);
begin
  inherited;
  adsMaster.Locate('Name',TreeView.Selected.Text,[]);
end;

procedure TDAProjectBrowseForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

procedure TDAProjectBrowseForm.DeleteActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();   
end;

procedure TDAProjectBrowseForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsMaster.Requery();
end;

end.
