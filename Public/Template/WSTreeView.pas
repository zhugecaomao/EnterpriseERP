{-----------------------------------------------------------------------------
 Unit Name: WSTreeView
 Description: 本窗体是针对 ID，Name，UpID 型表结构的树形浏览窗体。每个 TreeNode 的
 Data 属性存储的是字段 ID 的值。因此，可在 TreeView 的 OnChange 事件中通过 Integer(Node.Data)
 来取得当前所选记录的 ID 值。

-----------------------------------------------------------------------------}

unit WSTreeView;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, ComCtrls, ToolWin, ActnList, ImgList, WSEdit, DB,
  Menus;

type
  TWSTreeViewForm = class(TWSCustomForm)
    TreeView: TTreeView;
    ActionList: TActionList;
    AddNewAction: TAction;
    EditAction: TAction;
    DeleteAction: TAction;
    PrintPreviewAction: TAction;
    PrintAction: TAction;
    ExportAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ToolBar: TToolBar;
    DataSource: TDataSource;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    procedure AddNewActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure OnFilterRecord(DataSet: TDataSet;var Accept: Boolean);
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure ExitActionExecute(Sender: TObject);
  private
    function GetDataSet: TDataSet;
    function GetSelectedID: Integer;
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; virtual;
    function GetEditParams: Variant; virtual;
  public
    { Public declarations }

    procedure ClearTree;
    procedure BuildTree;
    procedure RebuildTree;
    property DataSet: TDataSet read GetDataSet;
    property SelectedID: Integer read GetSelectedID;
  end;

implementation

uses WSUtils, CommonDM;

{$R *.dfm}

{ TWSTreeViewForm }


procedure TWSTreeViewForm.OnFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
accept:=not (dataset.FieldByName('RecordState').AsString='删除');

end;

function TWSTreeViewForm.CreateEditForm: TWSEditForm;
begin
  raise Exception.Create('No edit form');
end;

function TWSTreeViewForm.GetEditParams: Variant;
begin
  Result := SelectedID;
end;

procedure TWSTreeViewForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  with CreateEditForm do
  try
    if treeview.SelectionCount>0
    then begin
         if Enter( integer(treeview.Selected.Data)) then RebuildTree;
         end
    else if Enter( -1) then RebuildTree;
  finally
    Free;
  end;
end;

procedure TWSTreeViewForm.RebuildTree;
var
tempList:tstrings;
begin
  { TODO : 保存当前树状态，包括所选节点 }
  templist:=tstringlist.Create;
  templist.Clear;
  templist:=SaveState(treeview);
  datasource.DataSet.Close;
  datasource.DataSet.Open;
  datasource.DataSet.Refresh;
  ClearTree;
  BuildTree;

  { TODO : 恢复状态，并选择之前所保存的所选节点，如果节点已被删除，则选择下一节点 }
   LoadState(treeview,Templist);
end;

procedure TWSTreeViewForm.BuildTree;
begin
{ TODO : 读取数据并建立树结构 }
try
  datasource.DataSet.Open;
  BuildTreeFromDataSet(TreeView.Items, datasource.DataSet);
except
  datasource.DataSet.Close;
   messagebox(self.Handle,'不 能 打 开 该 数 据 表 !   ',' 错 误',MB_OK+MB_ICONWARNING);
 //出现提示错误...............
end;

end;

procedure TWSTreeViewForm.ClearTree;
begin
{ TODO : 清除树结构 }
  treeview.Items.Clear;
end;

function TWSTreeViewForm.GetDataSet: TDataSet;
begin
  Result := DataSource.DataSet;
end;

function TWSTreeViewForm.GetSelectedID: Integer;
begin
  if TreeView.Selected <> nil then
    Result := Integer(TreeView.Selected.Data)
  else Result := -1;
end;

procedure TWSTreeViewForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  RebuildTree;
end;

procedure TWSTreeViewForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  with CreateEditForm do
  try
    if Edit(GetEditParams) then RebuildTree;
  finally
    Free;
  end;
end;

procedure TWSTreeViewForm.DeleteActionExecute(Sender: TObject);
var
i:integer;
begin
  inherited;
  { TODO : 添加删除代码 }
if messagebox(handle,' 是 否 要 删 除 该 些 记 录 ?',' 询 问',MB_OKCANCEL+MB_ICONQUESTION)=IDOK  then
 begin
        for i:=treeview.SelectionCount -1 downto 0  do
         begin
           if treeview.Selections[i].getFirstChild= nil
           then  begin
                   if datasource.DataSet.Locate('ID',integer(treeview.Selections[i].data),[])
                   then begin
                          datasource.DataSet.Edit;
                          datasource.DataSet.FieldByName('RecordState').AsString :='删除';
                          datasource.DataSet.Post;
                        end;
                   treeview.Selections[i].Delete;
                 end
           else messagebox(self.Handle,pchar('  '+treeview.Selections[i].Text+'  带有子节点,不能删除!   '),' 警 告',MB_OK+MB_ICONWARNING);
         end;
  end;
end;




procedure TWSTreeViewForm.FormCreate(Sender: TObject);
begin
  inherited;
  datasource.DataSet.OnFilterRecord:=OnFilterRecord;
  datasource.DataSet.Filtered:=true;

   buildTree;
end;

procedure TWSTreeViewForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
action:=caFree;
end;



procedure TWSTreeViewForm.DataSourceDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  EditAction.Enabled:=not datasource.DataSet.IsEmpty;
  DeleteAction.Enabled:=not datasource.DataSet.IsEmpty;
end;

procedure TWSTreeViewForm.ExitActionExecute(Sender: TObject);
begin
  inherited;
close;
end;

end.
