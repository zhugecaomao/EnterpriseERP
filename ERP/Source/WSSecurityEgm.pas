unit WSSecurityEgm;
{******************************************
模块：用户基类 权限检测
日期：2002年11月1日
作者：胡建平
更新：
******************************************}

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ADODB, DB, WSLogin, CommonDM;

type
  TGuarder = class(TObject)
  private
    FConnected: Boolean;
    FLoginPrompt: Boolean;
    FPassword: string;
    FUserID: Integer;
    function GetUserName: string;
    function GetCompanyUserName: string;
    procedure SetConnected(Value: Boolean);
    procedure SetUserID(Value: Integer);
    function GetPackToGoalUnit: string;
    function GetGoodsCodeToGoodsName: string;
  public
    procedure Close;
    function HasPermission(PermissionID: Integer): Boolean;
    function HasRight(PermissionName: String): Boolean;//胡建平 2002-11-11
    procedure Open;
    procedure RegisterActions(Actions: array of TBasicAction; PermissionID:
      array of Integer);
    procedure UnRegisterActions(Actions: array of TBasicAction);
    property Connected: Boolean read FConnected write SetConnected;
    property LoginPrompt: Boolean read FLoginPrompt write FLoginPrompt;
    property Password: string read FPassword write FPassword;
    property UserID: Integer read FUserID write SetUserID;
    property UserName: string read GetUserName;
    property CompanyUserName: string read GetCompanyUserName;
    property PackToGoalUnit: string read GetPackToGoalUnit;
    property GoodsCodeToGoodsName: string read GetGoodsCodeToGoodsName;
  end;

function IsCorrectPassword(UserID: Integer; const Password: string): Boolean;

function Guarder: TGuarder;

implementation

uses WSUtils, MAIN;

var
  FGuarder: TGuarder;

function IsCorrectPassword(UserID: Integer; const Password: string): Boolean;
// 用户口令验证
var
  ADOTemp: TADOQuery;
begin
  { TODO -cCode : 添加判断密码是否正确的代码 }
  ADOTemp := TADOQuery.Create(nil);
  ADOTemp.Connection := CommonData.acnConnection;
  with ADOTemp do
  begin
    close;
    if inttostr(UserID)<>'-1' then
        sql.Text :='select * from MSUser where ID=' + inttostr(UserID)
        +' and Password=' + inttostr(GetPassword(Password))
        +' and RecordState<>' + QuotedStr('删除')
    else
        sql.Text :='select * from MSRole where RoleID=' + inttostr(UserID)
        +' and Password=' + inttostr(GetPassword(Password))
        +' and RecordState<>' + QuotedStr('删除')    ;

//    showmessage(SQl.Text);
    open;
    if RecordCount > 0 then
      Result := true
    else
      Result := false;
  end;
  ADOTemp.Free;
end; 

function Guarder: TGuarder;
begin
  if FGuarder = nil then
  begin
    FGuarder := TGuarder.Create;
  end;
  Result := FGuarder;
end;

{
*********************************** TGuarder ***********************************
}
procedure TGuarder.Close;
begin
  SetConnected(False);
end;

procedure TGuarder.Open;
begin
  SetConnected(True);
end;

procedure TGuarder.SetUserID(Value: Integer);
begin
  if FUserID <> Value then
  begin
    FUserID := Value;
  end;
end;

function TGuarder.GetUserName: string;
var
  aqrTemp: TADOQuery;
begin
  if Connected then { TODO : 根据 UserID 查询取得用户名 }
  begin
    aqrTemp := TADOQuery.Create(nil);
    aqrTemp.Connection := CommonData.acnConnection;
    with aqrTemp do
    begin
      close;
      if inttostr(UserID)='-1' then
        sql.Text := 'select Name from MSRole where RoleID=' + inttostr(UserID)
        else sql.Text := 'select Name from MSUser where ID=' + inttostr(UserID)      ;
      open;
      first;
      Result := Fieldbyname('Name').AsString;
    end;
  end;
end;

function TGuarder.HasRight(PermissionName: String): Boolean;//胡建平 2002-11-11
var  aqrTemp: TADOQuery;
begin
  if Connected then { TODO : 根据 UserID 查询取用户是否具有指定权限 }
  begin
    aqrTemp := TADOQuery.Create(nil);
    aqrTemp.Connection := CommonData.acnConnection;
    with aqrTemp do
    begin
      close;
      sql.Text :=' select id , name from MSPermission '
          +' where id in (select PermissionID from '
          +' MSRolePermissions  where RoleID='+inttostr(UserID)+'  ) '
          +' and name = ' + QuotedStr(Trim(PermissionName)) ;
      open;
      if IsEmpty then
        Result := False
      else
        Result := True;
    end;
  end
  else
    Result := False;
end;

function TGuarder.HasPermission(PermissionID: Integer): Boolean;
var
  aqrTemp: TADOQuery;
begin
  if Connected then { TODO : 根据 UserID 查询取用户是否具有指定权限 }
  begin
    aqrTemp := TADOQuery.Create(nil);
    aqrTemp.Connection := CommonData.acnConnection;
    with aqrTemp do
    begin
      close;
      sql.Text := ' select a.Name from MSPermission as a ' +
        ' inner join MSRolePermissions as b on a.ID=b.PermissionID and a.ID=' + inttostr(PermissionID) +
        ' inner join MSRole as c on b.RoleID=c.ID ' +
        ' and ((c.ID=' + inttostr(UserID) + ' and c.IsUserTerm=0) or ' +
        ' (' + inttostr(UserID) + '=(select UserID from MSUserTeamUsers where UserTermID=b.RoleID) and c.IsUserTerm=1))';
      open;
      if IsEmpty then
        Result := False
      else
        Result := True;
    end;
  end
  else
    Result := False;
end;

procedure TGuarder.SetConnected(Value: Boolean);
var
  WSLoginForm: TWSLoginForm;
begin
  if FConnected <> Value then
  begin
    if Value then
    begin
      if LoginPrompt then { TODO : 显示 WSLoginForm 登录对话框以获取 UserID 和 Password };
      { TODO : 检查 UserID 和 Password，如不正确则触发登录异常 }
      begin
        WSLoginForm := TWSLoginForm.Create(nil);
        if WSLoginForm.ShowModal = mrOk then
        Application.CreateForm(TMainForm, MainForm)
          //showmessage('Login IN!')
        else
        begin
          Application.Terminate;
        end;
      end;
    end;
    FConnected := Value;
  end;
end;

procedure TGuarder.UnRegisterActions(Actions: array of TBasicAction);
begin

end;

procedure TGuarder.RegisterActions(Actions: array of TBasicAction;
  PermissionID: array of Integer);
begin  

end;


function TGuarder.GetCompanyUserName: string;
var aqrTemp: TADOQuery;
begin
  if Connected then { TODO : 直接取得用户公司名称--MSCompanyUser.name }
  begin
    aqrTemp := TADOQuery.Create(nil);
    aqrTemp.Connection := CommonData.acnConnection;
    with aqrTemp do
    begin
      close;
      sql.Text := 'select Name from MSCompanyUser where RecordState<>'
        + QuotedStr('删除');
      open;
      first;
      if Fieldbyname('Name').IsNull then
           Result := ''
      else Result := Fieldbyname('Name').AsString;
    end;
  end;
end;

function TGuarder.GetPackToGoalUnit: string;
var aqrTemp: TADOQuery;
begin
  if Connected then { TODO : 直接取得先输入包装单位的值--MSSysParametar.name }
  begin
    aqrTemp := TADOQuery.Create(nil);
    aqrTemp.Connection := CommonData.acnConnection;
    with aqrTemp do
    begin
      close;
      sql.Text := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%输入包装单位%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

function TGuarder.GetGoodsCodeToGoodsName: string;
var aqrTemp: TADOQuery;
begin
  if Connected then { TODO : 直接取得先输入包装单位的值--MSSysParametar.name }
  begin
    aqrTemp := TADOQuery.Create(nil);
    aqrTemp.Connection := CommonData.acnConnection;
    with aqrTemp do
    begin
      close;
      sql.Text := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%先按商品编号输入单据%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

end.

