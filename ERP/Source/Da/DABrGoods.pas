unit DABrGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, ToolWin, ComCtrls, Grids,
  DBGrids, QLDBGrid, ExtCtrls, WSEdit,ADODB, Menus;

type
  TDAGoodsBrowseForm = class(TWSStandardBrowseForm)
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
    TreeView: TTreeView;
    Splitter1: TSplitter;
    tblGoodClass: TADOTable;
    dsGoodClass: TDataSource;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    pmTreeEdit: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    QryLevelCode: TADOQuery;
    tblDAGoods: TADODataSet;
    tblDAGoodsID: TAutoIncField;
    tblDAGoodsCreateDate: TDateTimeField;
    tblDAGoodsCreateUserID: TIntegerField;
    tblDAGoodsRecordState: TStringField;
    tblDAGoodsGoodsPictrue: TBlobField;
    tblDAGoodsGoodsClassID: TIntegerField;
    tblDAGoodsUnitID: TIntegerField;
    tblDAGoodsAddUnitID: TIntegerField;
    tblDAGoodsDSDesigner: TStringField;
    tblDAGoodsDSDesigner2: TStringField;
    tblDAGoodsDSDesigner3: TStringField;
    tblDAGoodsDSDesigner4: TStringField;
    tblDAGoodsDSDesigner5: TStringField;
    tblDAGoodsDSDesigner6: TBCDField;
    tblDAGoodsDSDesigner7: TBCDField;
    tblDAGoodsDSDesigner8: TFloatField;
    tblDAGoodsDSDesigner9: TFloatField;
    tblDAGoodsDSDesigner10: TStringField;
    tblDAGoodsDSDesigner11: TFloatField;
    tblDAGoodsDSDesigner12: TStringField;
    ToolButton14: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblDAGoodsFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure AddNewActionExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
  private
    { Private declarations }
  protected
      function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  DAGoodsBrowseForm: TDAGoodsBrowseForm;

implementation

uses CommonDM, WSUtils, DAEdGoods, DAEdGoodsClass;

{$R *.dfm}


function TDAGoodsBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TDAGoodsEditForm.Create(Application);
end;


procedure TDAGoodsBrowseForm.FormCreate(Sender: TObject);
begin
  tblgoodclass.Open;
  buildtreefromdataset(treeview.Items,tblgoodclass);
  tblDAGoods.Parameters.ParamByName('LevelCode1').Value:='%001%';
  tblDAGoods.Open;
  inherited;
end;

procedure TDAGoodsBrowseForm.TreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
 tblGoodClass.Locate('ID',integer(node.Data),[])
end;

procedure TDAGoodsBrowseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
tbldagoods.close;
tblgoodclass.Close;
action:=cafree;
end;

procedure TDAGoodsBrowseForm.tblDAGoodsFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='删除');

end;

procedure TDAGoodsBrowseForm.AddNewActionExecute(Sender: TObject);
var aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  aqrTemp.Connection := CommonData.acnConnection;
  aqrTemp.Close;
  aqrTemp.sql.Text := 'select * from dAGOODScLASS where RecordState<>'
    +QuotedStr('删除');
  aqrTemp.open;
  if aqrTemp.IsEmpty then
  begin
    Showmessage('请先输入商品分类资料。');
    Exit;
  end;
 // inherited;
  with CreateEditForm do
  try
    if treeview.SelectionCount>0
    then begin
         if Enter( integer(treeview.Selected.Data)) then refreshdataset;
         end
    else if Enter( -1) then refreshdataset;
  finally
    Free;
  end;

end;

procedure TDAGoodsBrowseForm.N1Click(Sender: TObject);
begin
  inherited;
 DAGoodsClassEditForm:=TDAGoodsClassEditForm.Create(self);
 DAGoodsClassEditForm.Enter(tblGoodClass.fieldbyname('Id').AsInteger);
 n5.Click;
end;

procedure TDAGoodsBrowseForm.N2Click(Sender: TObject);
begin
  inherited;
 DAGoodsClassEditForm:=TDAGoodsClassEditForm.Create(self);
 DAGoodsClassEditForm.edit(tblGoodClass.fieldbyname('Id').AsInteger);
 n5.Click;
end;

procedure TDAGoodsBrowseForm.N5Click(Sender: TObject);
var
 tempList: Tstrings;
 tempbook:tbookmark;
begin
  inherited;
 try
  templist := TStringList.Create;
  templist:=savestate(treeview);
  datasource.DataSet.Close;

  tempbook:=tblGoodClass.GetBookmark;

  tblGoodClass.Refresh;
    treeview.Items.Clear;
  buildtreefromdataset(treeview.Items,tblGoodClass);
  loadstate(treeview,templist);
  tblGoodClass.GotoBookmark(tempbook);

  datasource.DataSet.Open;
  finally
  templist.Free;
 end;


end;

procedure TDAGoodsBrowseForm.N3Click(Sender: TObject);
var
temp:ttreenode;
begin
  inherited;
temp:= treeview.Selected;
if (temp.getFirstChild<>nil) or( not tblDAGoods.IsEmpty)
then messagebox(handle,'该类存在下属或还存在记录!','警 告',MB_OK+MB_ICONSTOP)
else begin
    //   tblAreaTree.Locate('ID',integer(temp.data),[]);
       tblGoodClass.Edit;
       tblGoodClass.FieldByName('RecordState').AsString:='删除';
       tblGoodClass.Post;
       treeview.Items.Delete(temp);
     end;

end;

procedure TDAGoodsBrowseForm.TreeViewClick(Sender: TObject);
var SLevelCode :string;
   aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  aqrTemp.Connection := CommonData.acnConnection;
  aqrTemp.Close;
  aqrTemp.sql.Text := 'select * from dAGOODScLASS where RecordState<>'
    +QuotedStr('删除');
  aqrTemp.open;
  if aqrTemp.IsEmpty then
  begin
    Showmessage('请先输入商品分类资料。');
    Exit;
  end;
  inherited;
  tblDAGoods.DisableControls;
  tblDAGoods.Close;
  QryLevelCode.Close;
  QryLevelCode.SQL.Text :=' select LevelCode from DAGoodsClass where id='
      +trim(inttostr(integer(treeview.Selected.Data)));
  QryLevelCode.Open;
  if QryLevelCode.FieldByName('LevelCode').IsNull then   SLevelCode :='%001%'
     else  SLevelCode :='%'+Trim(QryLevelCode.FieldByName('LevelCode').AsString)+'%';
  tblDAGoods.Parameters.ParamByName('LevelCode1').Value:=SLevelCode;
  tblDAGoods.Open;
  tblDAGoods.EnableControls;
end;

end.
