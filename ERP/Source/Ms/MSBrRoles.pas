unit MSBrRoles;
{******************************************
项目：
模块：用户/用户组 管理
日期：2002年11月1日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSBrowse, DB, ActnList, ToolWin, ComCtrls, Grids, DBGrids,
  QLDBGrid, ADODB,CommonDM,MSEdUser,WSEdit,MSEdUserTerm, ExtCtrls, Menus;

type
  TMSBrRolesForm = class(TWSBrowseForm)
    TabSheet2: TTabSheet;
    tbtAdd: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    RolePermissionsAction: TAction;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    adsUser: TADODataSet;
    ADODataSet1: TADODataSet;
    adsUserID: TAutoIncField;
    adsUserCreateDate: TDateTimeField;
    adsUserCreateUserID: TIntegerField;
    adsUserRecordState: TStringField;
    adsUserName: TStringField;
    adsUserIsUserTerm: TBooleanField;
    adsUserMemo: TStringField;
    ADODataSet1ID: TAutoIncField;
    ADODataSet1CreateDate: TDateTimeField;
    ADODataSet1CreateUserID: TIntegerField;
    ADODataSet1RecordState: TStringField;
    ADODataSet1Name: TStringField;
    ADODataSet1IsUserTerm: TBooleanField;
    ADODataSet1Memo: TStringField;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    procedure RolePermissionsActionExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  MSBrRolesForm: TMSBrRolesForm;

implementation

uses MSEdUserPermissions;

{$R *.dfm}

function TMSBrRolesForm.CreateEditForm: TWSEditForm;
begin
  // 根据不同页创建编辑不同的窗体
  case PageControl.ActivePageIndex of
    0: Result := TMSEdUserForm.Create(Application);
    1: Result := TMSEdUserTermForm.Create(Application);
  end;
end;
procedure TMSBrRolesForm.RolePermissionsActionExecute(Sender: TObject);
begin
  inherited;
  MSUserPermissionsEditForm := TMSUserPermissionsEditForm.Create(Application);
  with MSUserPermissionsEditForm do
  try
    if Edit(GetEditParams) then RefreshDataSet;
  finally
    Free;
  end;
end;

end.
