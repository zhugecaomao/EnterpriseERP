unit MSBrPostion;
{******************************************
项目：
模块：职位管理
日期：2002年10月31日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSBrowse, DB, ActnList, ToolWin, ComCtrls, Grids, DBGrids,
  QLDBGrid, ADODB,WSEdit, ExtCtrls, Menus;

type
  TMSPostionBrowseForm = class(TWSBrowseForm)
    TreeView: TTreeView;
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
    atbPostionClass: TADOTable;
    dsPostionClass: TDataSource;
    Splitter1: TSplitter;
    ToolButton11: TToolButton;
    abtPostion: TADODataSet;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    abtPostionID: TAutoIncField;
    abtPostionCreateDate: TDateTimeField;
    abtPostionCreateUserID: TIntegerField;
    abtPostionRecordState: TStringField;
    abtPostionName: TStringField;
    abtPostionCode: TStringField;
    abtPostionMemo: TStringField;
    abtPostionPostionClassID: TIntegerField;
    ToolButton14: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddNewActionExecute(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
  private
    { Private declarations }
  protected
      function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  MSPostionBrowseForm: TMSPostionBrowseForm;

implementation

uses CommonDM, MSEdPostion, WSUtils;

{$R *.dfm}
function TMSPostionBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TMSPostionEditForm.Create(Application);
end;

procedure TMSPostionBrowseForm.FormCreate(Sender: TObject);
begin
  abtPostion.Close;
  atbPostionClass.Open;
  buildtreefromdataset(treeview.Items,atbPostionClass);
  inherited;
  abtPostion.Open;
end;

procedure TMSPostionBrowseForm.TreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  atbPostionClass.Locate('ID',integer(node.Data),[])
end;

procedure TMSPostionBrowseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  abtPostion.Close;
  atbPostionClass.Close;
  action:=caFree;
end;

procedure TMSPostionBrowseForm.AddNewActionExecute(Sender: TObject);
var aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  aqrTemp.Connection := CommonData.acnConnection;
  aqrTemp.Close;
  aqrTemp.sql.Text := 'select * from MSPostionClass where RecordState<>'
    +QuotedStr('删除');
  aqrTemp.open;
  if aqrTemp.IsEmpty then
  begin
    Showmessage('请先输入职别资料');
    Exit;
  end;
  //inherited;
  with CreateEditForm do
    try
      if treeview.SelectionCount>0 then
      begin
        if Enter( integer(treeview.Selected.Data)) then refreshdataset;
      end
      else
        if Enter( -1) then refreshdataset;
    finally
      Free;
    end;
end;

procedure TMSPostionBrowseForm.TreeViewClick(Sender: TObject);
var aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  aqrTemp.Connection := CommonData.acnConnection;
  aqrTemp.Close;
  aqrTemp.sql.Text := 'select * from MSPostionClass where RecordState<>'
    +QuotedStr('删除');
  aqrTemp.open;
  if aqrTemp.IsEmpty then
  begin
    Showmessage('请先输入职别资料');
    Exit;
  end;
  inherited;

end;

end.
