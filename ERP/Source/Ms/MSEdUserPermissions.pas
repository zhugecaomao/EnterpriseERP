unit MSEdUserPermissions;
{******************************************
项目：
模块：用户授权管理
日期：2002年11月5日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, ComCtrls, CommonDM, Grids,
  DBGrids, QLDBGrid, CheckLst;

type
  TMSUserPermissionsEditForm = class(TWSStandardEditForm)
    Label1: TLabel;
    adsUserPermissionsClass: TADODataSet;
    Label2: TLabel;
    Label3: TLabel;
    lvPermissions: TListView;
    lbClass: TListBox;
    adrUserPermissions: TADOQuery;
    btnSelectAll: TButton;
    btnSelectNone: TButton;
    lbName: TLabel;
    procedure lbClassClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure btnSelectAllClick(Sender: TObject);
    procedure btnSelectNoneClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lvPermissionsChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure Save;
  private
    lModify: Boolean;
    vID :string;
    procedure  SelectAll(ltype: Boolean);
    { Private declarations }
  public
    { Public declarations }
    function Edit(const Params: Variant): Boolean;override;
  end;

var
  MSUserPermissionsEditForm: TMSUserPermissionsEditForm;

implementation

{$R *.dfm}
procedure TMSUserPermissionsEditForm.SelectAll(ltype: Boolean);
var
  i: integer;
begin
  for i := 0 to lvPermissions.Items.Count - 1 do
  begin
    lvPermissions.Items.Item[i].Checked := lType;
  end;
end;

function TMSUserPermissionsEditForm.Edit(const Params: Variant): Boolean;
begin
  vID := Format('%s', [VarToStr(Params)]);
  lbClass.Items.Add('<全部>');
  with adsUserPermissionsClass do
  begin
    Close;
    CommandText := 'select Name from MSRole where id='+vID;
    Open;
    lbName.Caption := FieldByName('Name').AsString;
    Close;
    CommandText := 'select * from MSPermissionClass';
    Open;
    First;
    while not eof do
    begin
      lbClass.Items.Add(FieldByName('Name').AsString);
      Next;
    end;
    Close;
  end;
  Result := ShowModal = mrOK;
end;

procedure TMSUserPermissionsEditForm.lbClassClick(Sender: TObject);
var
  nIndex: integer;
begin
  inherited;
  if lModify then
  begin
    if MessageBox(Handle,'是否保存所做修改？','确认',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON1) = ID_YES then
    begin
      Save;
//      OKButton.Click;
    end;
  end;

  nIndex := lbClass.ItemIndex;
  with adrUserPermissions do
  begin
    Close;
    SQL.Clear;
//    if nIndex = lbClass.Items.Count-1 then
    if nIndex = 0 then
      SQL.Add('select ID,Name from MSPermission where PermissionClassID in (select ID from MSPermissionClass)')
    else
      SQL.Add('select ID,Name from MSPermission where PermissionClassID in (select ID from MSPermissionClass where Name='''+lbClass.Items.Strings[nIndex]+''')');
    Open;
    First;
    lvPermissions.Clear;
    while not eof do
    begin
      lvPermissions.AddItem(FieldByName('Name').AsString,nil);
      lvPermissions.Items.Item[lvPermissions.Items.Count-1].ImageIndex := FieldbyName('ID').AsInteger;
      adsUserPermissionsClass.Close;
      adsUserPermissionsClass.CommandText := 'select * from MSRolePermissions where RoleID='+vID+' and PermissionID='+ FieldByName('ID').AsString;
      adsUserPermissionsClass.Open;
      if not adsUserPermissionsClass.IsEmpty then
        lvPermissions.Items.Item[lvPermissions.Items.Count-1].Checked := True ;
      Next;
    end;
    Active := True ;
  end;
  lModify := False;
end;

procedure TMSUserPermissionsEditForm.OKButtonClick(Sender: TObject);
//var
//  i,nIndex: integer;
begin
  inherited;
{  nIndex := lbClass.ItemIndex;
  with adrUserPermissions do
  begin
    Close;
    SQL.Clear;
    if nIndex = 0 then
      SQL.Add('delete MSRolePermissions where RoleID=' + vID )
    else
      SQL.Add('DELETE MSRolePermissions WHERE RoleID=' + vID +' AND PermissionID IN (SELECT ID FROM MSPermission WHERE PermissionClassID=(SELECT ID FROM MSPermissionClass WHERE Name='''+lbClass.Items.Strings[nIndex]+'''))');
    for i := 0 to lvPermissions.Items.Count-1 do
    begin
      if lvPermissions.Items.Item[i].Checked then
        SQL.Add('insert into MSRolePermissions values(' + vID + ',' + IntToStr(lvPermissions.Items.Item[i].ImageIndex) + ')');
    end;
    ExecSQL;
  end;
}
  if lModify then Save;
  ModalResult := mrOK;
end;

procedure TMSUserPermissionsEditForm.btnSelectAllClick(Sender: TObject);
begin
  inherited;
  SelectAll(true);
end;

procedure TMSUserPermissionsEditForm.btnSelectNoneClick(Sender: TObject);
begin
  inherited;
  SelectAll(False);
end;

procedure TMSUserPermissionsEditForm.FormShow(Sender: TObject);
begin
  inherited;
  lbClass.Selected[0] := True;
  lbClass.SetFocus;
  lbClass.OnClick(nil);
end;

procedure TMSUserPermissionsEditForm.lvPermissionsChange(Sender: TObject;
  Item: TListItem; Change: TItemChange);
begin
  inherited;
  lModify := True;
end;
procedure TMSUserPermissionsEditForm.Save();
var
  i,nIndex: integer;
begin
  inherited;
  nIndex := lbClass.ItemIndex;
  with adrUserPermissions do
  begin
    Close;
    SQL.Clear;
    if nIndex = 0 then
      SQL.Add('delete MSRolePermissions where RoleID=' + vID )
    else
      SQL.Add('DELETE MSRolePermissions WHERE RoleID=' + vID +' AND PermissionID IN (SELECT ID FROM MSPermission WHERE PermissionClassID=(SELECT ID FROM MSPermissionClass WHERE Name='''+lbClass.Items.Strings[nIndex]+'''))');
    for i := 0 to lvPermissions.Items.Count-1 do
    begin
      if lvPermissions.Items.Item[i].Checked then
        SQL.Add('insert into MSRolePermissions values(' + vID + ',' + IntToStr(lvPermissions.Items.Item[i].ImageIndex) + ')');
    end;
    ExecSQL;
  end;
end;
end.
