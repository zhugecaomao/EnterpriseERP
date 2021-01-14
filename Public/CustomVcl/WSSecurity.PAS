unit WSSecurity;
{******************************************
模块：用户基类 权限实现
日期：2002年11月1日
作者：胡建平
更新：
******************************************}

interface

uses
  SysUtils, Windows, Messages, Classes, Graphics, Controls,
  Forms, Dialogs, ADODB, DB, WSLogin, CommonDM, mxArrays, ActnList, Types;

type
  TGuarder = class(TObject)
  private
    FConnected: Boolean;
    FLoginPrompt: Boolean;
    FPassword: string;
    FUserID: Integer;
    FActionArray: TIntArray;
    FPmsArray: TIntArray;
    FOldAppActionExecute: TActionEvent;
    function GetUserName: string;
    function GetCompanyUserName: string;
    procedure SetConnected(Value: Boolean);
    procedure SetUserID(Value: Integer);
    function GetPackToGoalUnit: string;
    function GetForeignCurrencyFlag: string;
    function GetGoodsCodeToGoodsName: string;
    function GetContractSLPrice: string;
    function GetLastSLPrice: string;
    function GetLastadjustSLPrice: string;
    function GetUseDiscountSLFlag: string;
    function GetContractPCPrice: string;
    function GetLastPCPrice: string;
    function GetLastadjustPCPrice: string;



    function GetFillInPrintFlag: string;
    function GetRepeatPrintFlag: string;
    function GetExportCashACReckoningFlag: string;
    function GetPrintCashACReckoningFlag: string;

    function GetPermissionID(const PermissionName: string): Integer;
    procedure DoActionExecute(Action: TBasicAction; var Handled: Boolean);
  protected
    procedure RegisterAction(Action: TBasicAction; PermissionID: Integer);
    procedure UnRegisterAction(Action: TBasicAction);
  public
    constructor Create;
    destructor Destroy; override;
    procedure Close;
    procedure Open;
    function HasPermission(PermissionID: Integer): Boolean; overload;
    function HasPermission(Action: TBasicAction): Boolean; overload;
    function HasRight(PermissionName: String): Boolean; // 胡建平 2002-11-11
    procedure RegisterActions(Actions: array of TBasicAction;
      PermissionIDs: TIntegerDynArray); overload;
    procedure RegisterActions(Actions: array of TBasicAction;
      PermissionNames: TStringDynArray); overload;
    procedure UnRegisterActions(Actions: array of TBasicAction);
    property Connected: Boolean read FConnected write SetConnected;
    property LoginPrompt: Boolean read FLoginPrompt write FLoginPrompt;
    property Password: string read FPassword write FPassword;
    property UserID: Integer read FUserID write SetUserID;
    property UserName: string read GetUserName;
    property CompanyUserName: string read GetCompanyUserName;
    property PackToGoalUnit: string read GetPackToGoalUnit;
    property GoodsCodeToGoodsName: string read GetGoodsCodeToGoodsName;
    property ForeignCurrencyFlag: string read GetForeignCurrencyFlag;

    property ContractSLPrice: string read GetContractSLPrice;
    property LastSLPrice: string read GetLastSLPrice;
    property LastadjustSLPrice: string read GetLastadjustSLPrice;
    property UseDiscountSLFlag: string read GetUseDiscountSLFlag;
    property ContractPCPrice: string read GetContractPCPrice;
    property LastPCPrice: string read GetLastPCPrice;
    property LastadjustPCPrice: string read GetLastadjustPCPrice;

    property FillInPrintFlag: string read GetFillInPrintFlag;
    property RepeatPrintFlag: string read GetRepeatPrintFlag;
    property ExportCashACReckoningFlag: string read GetExportCashACReckoningFlag;
    property PrintCashACReckoningFlag: string read GetPrintCashACReckoningFlag;



  end;

function IsCorrectPassword(UserID: Integer; const Password: string): Boolean;

function Guarder: TGuarder;

implementation

uses WSUtils, MAIN, Variants;

var
  FGuarder: TGuarder;

function IsCorrectPassword(UserID: Integer; const Password: string): Boolean;
// 用户口令验证
var
  ADOTemp: TADODataSet;
begin
  { TODO -cCode : 添加判断密码是否正确的代码 }
  ADOTemp := TADODataSet.Create(nil);
  ADOTemp.Connection := CommonData.acnConnection;
  with ADOTemp do
  begin
    close;
    if inttostr(UserID)<>'-1' then
        CommandText :='select * from MSUser where ID=' + inttostr(UserID)
        +' and Password=' + inttostr(GetPassword(Password))
        +' and RecordState<>' + QuotedStr('删除')
    else
        CommandText :='select * from MSRole where RoleID=' + inttostr(UserID)
        +' and Password=' + inttostr(GetPassword(Password))
        +' and RecordState<>' + QuotedStr('删除')    ;

//    showmessage(CommandText);
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
  aqrTemp: TADODataSet;
begin
  if Connected then { TODO : 根据 UserID 查询取得用户名 }
  begin
    aqrTemp := TADODataSet.Create(nil);
    aqrTemp.Connection := CommonData.acnConnection;
    with aqrTemp do
    begin
      close;
      if inttostr(UserID)='-1' then
        CommandText := 'select Name from MSRole where RoleID=' + inttostr(UserID)
        else CommandText := 'select Name from MSUser where ID=' + inttostr(UserID)      ;
      open;
      first;
      Result := Fieldbyname('Name').AsString;
    end;
  end;
end;

function TGuarder.HasRight(PermissionName: String): Boolean;//胡建平 2002-11-11
var  aqrTemp: TADODataSet;
begin
  if Connected then { TODO : 根据 UserID 查询取用户是否具有指定权限 }
  begin
    aqrTemp := TADODataSet.Create(nil);
    aqrTemp.Connection := CommonData.acnConnection;
    with aqrTemp do
    begin
      close;
      CommandText :=' select id , name from MSPermission '
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
  aqrTemp: TADODataSet;
begin
  if UserID = 1 then Result := True // 系统管理员拥有全部全限
  else if Connected then { TODO : 根据 UserID 查询取用户是否具有指定权限 }
  begin
    aqrTemp := TADODataSet.Create(nil);
    aqrTemp.Connection := CommonData.acnConnection;
    with aqrTemp do
    begin
      close;
      CommandText := 'SELECT * FROM MSRolePermissions WHERE RoleID = ' + IntToStr(UserID) +
        ' AND PermissionID = ' + IntToStr(PermissionID);
//
//      CommandText := ' select a.Name from MSPermission as a ' +
//        ' inner join MSRolePermissions as b on a.ID=b.PermissionID and a.ID=' + inttostr(PermissionID) +
//        ' inner join MSRole as c on b.RoleID=c.ID ' +
//        ' and ((c.ID=' + inttostr(UserID) + ' and c.IsUserTerm=0) or ' +
//        ' (' + inttostr(UserID) + '=(select UserID from MSUserTeamUsers where UserTermID=b.RoleID) and c.IsUserTerm=1))';
      Open;
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
//        Application.CreateForm(TMainForm, MainForm)
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
var
  I: Integer;
begin
  for I := 0 to Length(Actions) do UnRegisterAction(Actions[I]);
end;

function TGuarder.GetCompanyUserName: string;
var aqrTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得用户公司名称--MSCompanyUser.name }
  begin
    aqrTemp := TADODataSet.Create(nil);
    aqrTemp.Connection := CommonData.acnConnection;
    with aqrTemp do
    begin
      close;
      CommandText := 'select Name from MSCompanyUser where RecordState<>'
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
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得先输入包装单位的值--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
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
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得先输入包装单位的值--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%先按商品编号输入单据%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

constructor TGuarder.Create;
begin
  with Application do
  begin
    FOldAppActionExecute := OnActionExecute;
    OnActionExecute := DoActionExecute;
  end;
  FActionArray := TIntArray.Create(0, 0);
  FPmsArray := TIntArray.Create(0, 0);
end;

destructor TGuarder.Destroy;
begin
  with Application do
    OnActionExecute := FOldAppActionExecute;
  FPmsArray.Free;
  FActionArray.Free;
  inherited;
end;

function TGuarder.GetPermissionID(const PermissionName: string): Integer;
begin
  with TADOCommand.Create(nil) do
  try
    Connection := CommonData.acnConnection;
    CommandText := 'SELECT :ID = ID FROM MSPermission WHERE Name = ''' + PermissionName + '''';
    with Parameters[0] do
    begin
      Direction := pdOutput;
      DataType := ftInteger;
      Execute;
      if not VarIsNull(Value) then Result := Value
      else Result := -1;
    end;
  finally
    Free;
  end;
end;

procedure TGuarder.RegisterAction(Action: TBasicAction;
  PermissionID: Integer);
begin
  FActionArray.Add(Integer(Action));
  FPmsArray.Add(PermissionID);
end;

procedure TGuarder.RegisterActions(Actions: array of TBasicAction;
  PermissionIDs: TIntegerDynArray);
var
  I: Integer;
begin
  for I := 0 to Length(Actions) do
    RegisterAction(Actions[I], PermissionIDs[I]);
end;

procedure TGuarder.RegisterActions(Actions: array of TBasicAction;
  PermissionNames: TStringDynArray);
var
  I: Integer;
begin
  for I := Low(Actions) to High(Actions) do
    RegisterAction(Actions[I], GetPermissionID(PermissionNames[I]));
end;

procedure TGuarder.UnRegisterAction(Action: TBasicAction);
var
  I: Integer;
begin
  I := Integer(Action);
  with FActionArray do
  begin
    I := IndexOf(I);
    if I < 0 then
      raise Exception.CreateFmt('Action %s has not been registered',
        [TBasicAction(Items[I]).Name]);
    RemoveItem(I);
  end;
  FPmsArray.RemoveItem(I)
end;

procedure TGuarder.DoActionExecute(Action: TBasicAction;
  var Handled: Boolean);
var
  Tmp: Integer;
begin
  Tmp := FActionArray.IndexOf(Action);
  if Tmp >= 0 then
  begin
    Handled := (FPmsArray.Items[Tmp] >= 0) and not HasPermission(FPmsArray.Items[Tmp]);
    if Handled then raise Exception.Create('操作未被授权，请联系管理员');
  end;
  if Assigned(FOldAppActionExecute) then FOldAppActionExecute(Action, Handled);
end;

function TGuarder.HasPermission(Action: TBasicAction): Boolean;
var
  Tmp: Integer;
begin
  Tmp := FActionArray.IndexOf(Action);
  if (Tmp >= 0) and (FPmsArray.Items[Tmp] >= 0) then
    Result := HasPermission(FPmsArray.Items[Tmp])
  else Result := True;
end;



function TGuarder.GetContractSLPrice: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得合同单价--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%合同售价%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

function TGuarder.GetLastadjustSLPrice: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得最新销售单价--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%最新调价%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

function TGuarder.GetLastSLPrice: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得最新销售单价--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%当前客户最新售价%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;


function TGuarder.GetUseDiscountSLFlag: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得最新销售单价--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%使用销售折扣%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

function TGuarder.GetFillInPrintFlag: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得使用套打功能--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%票据套打功能%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

function TGuarder.GetRepeatPrintFlag: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得使用套打功能--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%单据重打功能%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

function TGuarder.GetExportCashACReckoningFlag: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得使导出对帐单标志--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%导出对帐单%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

function TGuarder.GetPrintCashACReckoningFlag: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得使打印对帐单标志--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%打印对帐单%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

function TGuarder.GetForeignCurrencyFlag: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得外币业务标志--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%外币业务%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;

end;

function TGuarder.GetContractPCPrice: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得合同单价--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%合同进价%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

function TGuarder.GetLastPCPrice: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得最新进价--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%最新进价%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

function TGuarder.GetLastadjustPCPrice: string;
var ADSTemp: TADODataSet;
begin
  if Connected then { TODO : 直接取得最新采购调价--MSSysParametar.name }
  begin
    ADSTemp := TADODataSet.Create(nil);
    ADSTemp.Connection := CommonData.acnConnection;
    with ADSTemp do
    begin
      close;
      CommandText := 'select * from MSSysParameter where ParaName like '
        + QuotedStr('%最新采购调价%');
      open;
      first;
      if Fieldbyname('ParaValues').IsNull then
           Result := '否'
      else Result := Fieldbyname('ParaValues').AsString;
    end;
  end;
end;

initialization
  CurrencyString := '';

finalization
  if FGuarder <> nil then FreeAndNil(FGuarder);

end.

