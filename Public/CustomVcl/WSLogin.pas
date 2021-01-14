unit WSLogin;
{******************************************
模块：用户登陆
日期：2002年11月1日
作者：胡建平
更新：
******************************************}
interface

uses Windows, SysUtils, Classes, Graphics, Dialogs, Forms, Controls, StdCtrls,
  Buttons, DBCtrls, DB, ADODB, CommonDM, Messages, IdGlobal;

type
  TWSLoginForm = class(TForm)
    Label1: TLabel;
    edPassword: TEdit;
    OKBtn: TButton;
    CancelBtn: TButton;
    dblkUserID: TDBLookupComboBox;
    Label2: TLabel;
    dsUser: TDataSource;
    aqrUser: TADOQuery;
    procedure OKBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure CancelBtnClick(Sender: TObject);
  private
    { Private declarations }
    iPass: integer;
  public
    { Public declarations }
  end;

implementation

uses WSSecurity, WSUtils;

{$R *.dfm}

procedure TWSLoginForm.OKBtnClick(Sender: TObject);
var
  vID: integer;
  ADOTemp: TADOQuery;
begin
  { TODO -cUI : 检查用户和密码的正确性，如果正确，则 ModalResult := mrOK。}
  if dblkUserID.Text = '' then
  begin
    dblkUserID.SetFocus;
    showmessage('请输入用户！');
    exit;
  end;

  vID := aqrUser.fieldbyname('ID').AsInteger;
  if IsCorrectPassword(vID, Trim(edPassword.Text)) then
  begin
    ADOTemp := TADOQuery.Create(nil);
    ADOTemp.Connection := CommonData.acnConnection;
    with ADOTemp do
    begin
      close;
      sql.Text := 'select getDate() as CurrentDate';
      open;
      SetLocalTime(FieldByName('CurrentDate').AsDateTime);
    end;

    Guarder.UserID := vID;
    Guarder.Password := Trim(edPassword.Text);
    //记录登陆信息
    with aqrUser do
    begin
      Close;
      sql.Text := 'INSERT INTO MSlogin(CreateUserID,UserID,LoginTime,LogoutTime,ComputerName,LoginIP)' +
        ' VALUES(' + inttostr(vID) + ',' + inttostr(vID) + ',getDate(),getDate(),' + QuotedStr(GetComputerNameX) + ',' + QuotedStr(GetHostIP) + ')';
      ExecSql;
    end;

    //设置管理期间的PeriodID
    with ADOTemp do
    begin
      close;
      sql.Text := 'select Top 1 ID from MSPeriod where RecordState<>' + QuotedStr('删除') + ' and IsClosed=' + QuotedStr('本期');
      open;
      if RecordCount = 0 then
        PeriodID := 0
      else
        PeriodID := Fieldbyname('ID').AsInteger;
    end;
    CompanyName:=GetCompanyName;

    ModalResult := mrOK;
  end
  else
  begin
    showmessage('密码错误,请检查！');
    edPassword.SetFocus;
    if iPass >= 3 then
      Application.Terminate
    else
      iPass := iPass + 1;
  end;




end;

procedure TWSLoginForm.FormShow(Sender: TObject);
var
  vID: string;
begin
  iPass := 0;
  with aqrUser do
  begin
    Close;
    sql.Text :=' select ID, Name,EmployeeID FROM MSUser   '
      +' where RecordState<>'+Quotedstr('删除');
    Open;
//    if IsEmpty then
//    begin
//      DisableControls;
//      try
//        Close;
//        sql.Text := 'INSERT INTO MSUser (ID ,Name,EmployeeID)' +
//          'VALUES(-1,' + QuotedStr('系统管理员') + ',-1 )';
//        ExecSql;
//
//        Close;
//        sql.Text := 'select top 1 RoleID as id,Name,EmployeeID '
//          +' from MSRole where RoleID=-1' ;
//        Open;
//        first;
//        vID := FieldByName('ID').AsString;
//      finally
//        EnableControls;
//      end;
//    end;
//    first;
    dblkUserID.KeyValue := fieldbyname('ID').AsInteger;
  end;
end;

procedure TWSLoginForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(Wm_NextDlgCtl, 0, 0);
  end;
end;

procedure TWSLoginForm.CancelBtnClick(Sender: TObject);
begin
  Application.Terminate;
end;

end.

