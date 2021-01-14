unit MSDataRestore;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB, DB, FileCtrl, ExtCtrls;

type
  TMSDataRestoreForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    edtDestDir: TEdit;
    Button3: TButton;
    Label3: TLabel;
    Label4: TLabel;
    edtRestoreDir: TEdit;
    ADOQuery: TADOQuery;
    ListLogcalOfData: TADOQuery;
    Button4: TButton;
    edtDBName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    edtNewDBName: TEdit;
    Panel_ShowTopic: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure edtDBNameExit(Sender: TObject);
    procedure Panel_ShowTopicClick(Sender: TObject);
  private
    { Private declarations }
    HIst: THandle;
    function SQLServerInstalled: Boolean;
    function SQLServerRunning: Boolean;
    procedure StartSQLServer;
  public
    { Public declarations }
  end;

var
  MSDataRestoreForm: TMSDataRestoreForm;

implementation

uses  Registry, ShellAPI, TlHelp32,CommonDM;

{$R *.dfm}

procedure TMSDataRestoreForm.Button2Click(Sender: TObject);
begin
  Close;
end;

procedure TMSDataRestoreForm.Button3Click(Sender: TObject);
var
  Directory: string;
begin
 Directory := edtDestDir.Text;
  if SelectDirectory('选择目标数据库存放目录', '', Directory) then
    edtDestDir.Text := Directory;
end;

procedure TMSDataRestoreForm.Button1Click(Sender: TObject);
var
  FileAttributes: DWORD;
  DataName,LogName :string;
begin

  if not SQLServerInstalled then
    raise Exception.Create('请先安装 SQL Server');
  if not SQLServerRunning then
  begin
    StartSQLServer;
  end;

  if not FileExists(Trim(edtRestoreDir.Text)+'\'+Trim(edtDBName.Text)) then
  begin
    showmessage('数据库文件不存在,不能恢复! ');
    edtNewDBName.Text :='';
    edtDBName.SetFocus;
    exit;
  end;
  if (UpperCase(copy( Trim(edtDBName.Text),pos('.',Trim(edtDBName.Text))+1,3))<>'BAK')
      and (UpperCase(copy( Trim(edtDBName.Text),pos('.',Trim(edtDBName.Text))+1,3))<>'DAT') then
   begin
  showmessage('系统只允许" *.bak " 和 " *.dat " 备份文件进行恢复'+
          #13+',如果你确定该备份文件为MS SQL 2000的备份文件,'+
          #13+ '请先修改文件名为" *.bak " 和 " *.dat " !');
  edtDBName.SetFocus;
  exit;
  end;

  if (Trim(edtNewDBName.Text)='')   then
  begin
    showmessage('请输入数据库文件名!');
    edtNewDBName.Text := Copy(Trim(edtDBName.Text),1,Length(Trim(edtDBName.Text))-4 );
    edtNewDBName.SetFocus;
    exit;
  end;

  ListLogcalOfData.Close;
  ListLogcalOfData.SQL.Text :=' RESTORE FILELISTONLY FROM disk='
        + Quotedstr( Trim(edtRestoreDir.Text)+'\'+Trim(edtDBName.Text)) ;
  ListLogcalOfData.Open;
  if ListLogcalOfData.IsEmpty then
  begin
    showmessage('数据库文件错误,不能恢复! ');
    exit;
  end;
  ListLogcalOfData.First;
  DataName :=trim(ListLogcalOfData.fieldbyname('LogicalName').AsString);
  ListLogcalOfData.next;
  LogName :=trim(ListLogcalOfData.fieldbyname('LogicalName').AsString);

  if not DirectoryExists(edtDestDir.Text) then
    if Application.MessageBox('目标目录不存在，是否创建？',
      PChar(Caption), MB_ICONQUESTION or MB_YESNO) = IDYES then
      begin
        if not ForceDirectories(edtDestDir.Text) then
          raise Exception.CreateFmt('不能创建目录 %s', [edtDestDir.Text]);
      end else Exit;
  Panel_ShowTopic.Visible :=True;
  Panel_ShowTopic.Repaint;

//  CommonDM.CommonData.acnConnection

  CommonData.acnConnection.DefaultDatabase :='Master';
  CommonData.acnConnection.Close;
  CommonData.acnConnection.Open;
  ADOQuery.Connection :=nil;
  ADOQuery.Connection := CommonData.acnConnection;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' RESTORE DATABASE  '+trim(edtNewDBName.Text)
    +' FROM DISK ='+Quotedstr(Trim(edtRestoreDir.Text)+'\'
    +Trim(edtDBName.text))+' WITH  replace , '
    +' MOVE '+Quotedstr(DataName)+' TO '
    + Quotedstr(edtDestDir.Text+'\'+Trim(edtNewDBName.Text)+ '.mdf ')
    +' , MOVE '+Quotedstr(LogName)+' TO '
    + Quotedstr(edtDestDir.Text +'\'+Trim(edtNewDBName.Text)+'_log.ldf');
  ADOQuery.ExecSQL;


  Panel_ShowTopic.Visible :=False;
  Application.MessageBox(' 数据库恢复成功,请重新连接数据库,重新进入系统!', PChar(Caption), MB_ICONINFORMATION);
  Application.Terminate;

end;

function TMSDataRestoreForm.SQLServerRunning: Boolean;
var
  hSnapshot: THandle;
  lppe: TProcessEntry32;
begin
  hSnapshot := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  lppe.dwSize := SizeOf(lppe);
  if Process32First(hSnapshot, lppe) then
    repeat
      if SameText(lppe.szExeFile, 'sqlservr.exe') then
      begin
        Result := True;
        Exit;
      end;
    until not Process32Next(hSnapshot, lppe);
  Result := False;
end;

procedure TMSDataRestoreForm.StartSQLServer;
var
  Path: string;
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_LOCAL_MACHINE;
    OpenKey('Software\Microsoft\MSSQLServer\Setup', False);
    Path := ReadString('SQLPath');
  finally
    Free;
  end;
  HIst := ShellExecute(0, 'OPEN', PChar(Path + '\Binn\sqlservr.exe'), nil, PChar(Path + '\Binn\'), SW_SHOWMINIMIZED);
  BringToFront;
  Sleep(2000);
end;

function TMSDataRestoreForm.SQLServerInstalled: Boolean;
var
  Path: string;
begin
  with TRegistry.Create do
  try
    RootKey := HKEY_LOCAL_MACHINE;
    if not OpenKey('Software\Microsoft\MSSQLServer', False) then
    begin
      Result := False;
      Exit;
    end;
  finally
    Free;
  end;
  Result := True;
end;

procedure TMSDataRestoreForm.FormCreate(Sender: TObject);
var CnnString :string;
begin
  HIst := 0;
end;

procedure TMSDataRestoreForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if HIst <> 0 then PostMessage(HIst, WM_CLOSE, 0, 0);
end;

procedure TMSDataRestoreForm.FormShow(Sender: TObject);
begin
  edtDestDir.Text :=GetCurrentDir+'\Data';
  edtRestoreDir.Text :=GetCurrentDir+'\BackUp';
  if FileExists(Trim(edtRestoreDir.Text)+'\Soft.Bak') then edtDBName.Text :='Soft.Bak'
    else edtDBName.Text :='请输入备份数据库名称,如:"Soft.bak"' ;
end;

procedure TMSDataRestoreForm.Button4Click(Sender: TObject);
var
  Directory: string;
begin
 Directory := edtRestoreDir.Text;
  if SelectDirectory('选择备份数据库存放目录', '', Directory) then
    edtRestoreDir.Text := Directory;
  if FileExists(Directory+'\Soft.Bak') then edtDBName.Text :='Soft.Bak'
    else if FileExists(Directory+'\Soft.dat') then edtDBName.Text :='Soft.dat'
   else edtDBName.Text :='请输入备份数据库名称' ;
  edtDBName.SetFocus;
end;

procedure TMSDataRestoreForm.edtDBNameExit(Sender: TObject);
begin
  edtNewDBName.Text := Copy(Trim(edtDBName.Text),1,Length(Trim(edtDBName.Text))-4 );
end;

procedure TMSDataRestoreForm.Panel_ShowTopicClick(Sender: TObject);
begin
  Panel_ShowTopic.Visible :=False;
end;

end.
