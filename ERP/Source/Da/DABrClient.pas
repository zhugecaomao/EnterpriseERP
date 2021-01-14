unit DABrClient;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, ToolWin, ComCtrls, Grids,
  DBGrids, QLDBGrid, ExtCtrls, ADODB,WSEdit, Menus;

type
  TDAClientBrowseForm = class(TWSStandardBrowseForm)
    TreeView: TTreeView;
    Splitter1: TSplitter;
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
    tblAreaTree: TADOTable;
    dsAreaTree: TDataSource;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    pmTreeEdit: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    QryLevelCode: TADOQuery;
    tblClientBr: TADODataSet;
    tblClientBrID: TAutoIncField;
    tblClientBrCreateDate: TDateTimeField;
    tblClientBrCreateUserID: TIntegerField;
    tblClientBrRecordState: TStringField;
    tblClientBrAreaID: TIntegerField;
    tblClientBrEmlpoyeeID: TIntegerField;
    tblClientBrDSDesigner: TStringField;
    tblClientBrDSDesigner5: TStringField;
    tblClientBrDSDesigner6: TStringField;
    tblClientBrDSDesigner7: TStringField;
    tblClientBrDSDesigner24: TStringField;
    tblClientBrDSDesigner3: TStringField;
    tblClientBrDSDesigner23: TStringField;
    tblClientBrDSDesigner25: TStringField;
    tblClientBrDSDesigner13: TStringField;
    tblClientBrDSDesigner12: TStringField;
    tblClientBrDSDesigner11: TStringField;
    tblClientBrDSDesigner10: TStringField;
    tblClientBrDSDesigner9: TBCDField;
    tblClientBrDSDesigner8: TDateTimeField;
    tblClientBrDSDesigner14: TStringField;
    tblClientBrDSDesigner15: TStringField;
    tblClientBrDSDesigner16: TStringField;
    tblClientBrDSDesigner17: TStringField;
    tblClientBrDSDesigner18: TStringField;
    tblClientBrDSDesigner19: TStringField;
    tblClientBrDSDesigner20: TStringField;
    tblClientBrDSDesigner21: TStringField;
    tblClientBrDSDesigner22: TStringField;
    tblClientBrDSDesigner4: TStringField;
    tblClientBrDSDesigner26: TStringField;
    tblClientBrDSDesigner2: TStringField;
    ToolButton14: TToolButton;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblAreaTreeFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblClientBr9FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure AddNewActionExecute(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
     protected
      function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  DAClientBrowseForm: TDAClientBrowseForm;

implementation

uses CommonDM, WSUtils, DAEdClient, DAEdAreas;

{$R *.dfm}
function TDAClientBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TDAClientEditForm.Create(Application);
end;

procedure TDAClientBrowseForm.FormCreate(Sender: TObject);
begin
  tblareatree.Open;
  buildtreefromdataset(treeview.Items,tblareatree);
  tblClientBr.Parameters.ParamByName('LevelCode1').Value:='%'  ;
  inherited;
//tblClientBr.close;
end;

procedure TDAClientBrowseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblclientbr.Close;
  tblAreaTree.Close;
  action:=cafree;
end;

procedure TDAClientBrowseForm.tblAreaTreeFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='删除');
end;

procedure TDAClientBrowseForm.tblClientBr9FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='删除');
end;

procedure TDAClientBrowseForm.AddNewActionExecute(Sender: TObject);
var  aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  aqrTemp.Connection := CommonData.acnConnection;
  aqrTemp.Close;
  aqrTemp.sql.Text := 'select * from DAArea where RecordState<>'
    +QuotedStr('删除');
  aqrTemp.open;
  if aqrTemp.IsEmpty then
  begin
    Showmessage('请先输入地区资料。');
    Exit;
  end; // inherited;
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

procedure TDAClientBrowseForm.N1Click(Sender: TObject);
begin
  inherited;
  DAAreasEditForm:=tDAAreasEditForm.Create(self);
  DAAreasEditForm.Enter(tblAreaTree.fieldbyname('ID').AsInteger);
  n4.Click;
end;

procedure TDAClientBrowseForm.N2Click(Sender: TObject);
begin
  inherited;
  DAAreasEditForm:=tDAAreasEditForm.Create(self);
  DAAreasEditForm.edit(integer(treeview.Selected.data));
  n4.Click;
end;

procedure TDAClientBrowseForm.N4Click(Sender: TObject);
var
 tempList: Tstrings;
 tempbook:tbookmark;
begin
  inherited;
 try
  templist := TStringList.Create;
  templist:=savestate(treeview);
  datasource.DataSet.Close;

  tempbook:=tblAreaTree.GetBookmark;

  tblAreaTree.Refresh;
    treeview.Items.Clear;
  buildtreefromdataset(treeview.Items,tblAreaTree);
  loadstate(treeview,templist);
  tblAreaTree.GotoBookmark(tempbook);

  datasource.DataSet.Open;
  finally
  templist.Free;
 end;

end;

procedure TDAClientBrowseForm.TreeViewClick(Sender: TObject);
var SLevelCode :string;
   aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  aqrTemp.Connection := CommonData.acnConnection;
  aqrTemp.Close;
  aqrTemp.sql.Text := 'select * from DAArea where RecordState<>'
    +QuotedStr('删除');
  aqrTemp.open;
  if aqrTemp.IsEmpty then
  begin
    Showmessage('请先输入地区资料。');
    Exit;
  end; // inherited;
  inherited;
  tblclientbr.DisableControls;
  tblClientBr.Close;

  QryLevelCode.Close;
  QryLevelCode.SQL.Text :=' select LevelCode from daArea where id='
      +trim(inttostr(integer(treeview.Selected.Data)));
  QryLevelCode.Open;
  if QryLevelCode.FieldByName('LevelCode').IsNull then   SLevelCode :='%001%'
     else  SLevelCode :='%'+Trim(QryLevelCode.FieldByName('LevelCode').AsString)+'%';
  tblClientBr.Parameters.ParamByName('LevelCode1').Value:=SLevelCode;
  tblClientBr.Open;
  tblClientBr.EnableControls;
end;

procedure TDAClientBrowseForm.N3Click(Sender: TObject);
var
temp:ttreenode;
begin
  inherited;
  temp:= treeview.Selected;
  if (temp.getFirstChild<>nil) or( not tblClientBr.IsEmpty)
  then messagebox(handle,'该地区存在下属或还存在记录!','警 告',MB_OK+MB_ICONSTOP)
  else begin
    tblAreaTree.Locate('ID',integer(temp.data),[]);
    tblareatree.Edit;
    tblAreaTree.FieldByName('RecordState').AsString:='删除';
    tblareatree.Post;
    treeview.Items.Delete(temp);
  end;
end;

end.
