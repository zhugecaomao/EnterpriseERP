unit NavigatorEgm;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, ComCtrls, OleCtrls, Buttons, ToolWin, Isp3,
  ActnList, ImgList, shdocvw;

const
  CM_HOMEPAGEREQUEST = WM_USER + $1000;

type
  TNavigatorForm = class(TForm)
    NavigatorImages: TImageList;
    NavigatorHotImages: TImageList;
    LinksImages: TImageList;
    LinksHotImages: TImageList;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    BackBtn: TToolButton;
    ForwardBtn: TToolButton;
    StopBtn: TToolButton;
    RefreshBtn: TToolButton;
    Animate1: TAnimate;
    URLs: TComboBox;
    ActionListNet: TActionList;
    BackAction: TAction;
    ForwardAction: TAction;
    StopAction: TAction;
    RefreshAction: TAction;
    WebBrowser: TWebBrowser;
    ToolBar4: TToolBar;
    procedure Exit1Click(Sender: TObject);
    procedure StopClick(Sender: TObject);
    procedure URLsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LinksClick(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure ForwardClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure URLsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nStatusbarClick(Sender: TObject);
    procedure BackActionUpdate(Sender: TObject);
    procedure ForwardActionUpdate(Sender: TObject);
    procedure WebBrowserBeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowserDownloadBegin(Sender: TObject);
    procedure WebBrowserDownloadComplete(Sender: TObject);
    procedure nExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    HistoryIndex: Integer;
    HistoryList: TStringList;
    UpdateCombo: Boolean;
    procedure FindAddress;
    procedure HomePageRequest(var message: tmessage); message CM_HOMEPAGEREQUEST;
  public

  end;

var
  NavigatorForm: TNavigatorForm;
  cIntHomepage: string;

procedure NavigateExecute(PageName: string);

implementation

uses WSUtils, MAIN, WSSecurity;

{$R *.DFM}

procedure TNavigatorForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TNavigatorForm.FindAddress;
var
  Flags: OLEVariant;
begin
  Flags := 0;
  UpdateCombo := True;
  try
    WebBrowser.Navigate(WideString(Urls.Text), Flags, Flags, Flags, Flags);
  except
    WebBrowser.Navigate(WideString(cIntHomepage), Flags, Flags, Flags, Flags);
  end;
end;

procedure TNavigatorForm.StopClick(Sender: TObject);
begin
  WebBrowser.Stop;
end;

procedure TNavigatorForm.URLsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
    FindAddress;
  end;
end;

procedure TNavigatorForm.URLsClick(Sender: TObject);
begin
  FindAddress;
end;

procedure TNavigatorForm.LinksClick(Sender: TObject);
begin
  if (Sender as TToolButton).Hint = '' then Exit;
  URLs.Text := (Sender as TToolButton).Hint;
  FindAddress;
end;

procedure TNavigatorForm.RefreshClick(Sender: TObject);
begin
  FindAddress;
end;

procedure TNavigatorForm.BackClick(Sender: TObject);
begin
  URLs.Text := HistoryList[HistoryIndex - 1];
  FindAddress;
end;

procedure TNavigatorForm.ForwardClick(Sender: TObject);
begin
  URLs.Text := HistoryList[HistoryIndex + 1];
  FindAddress;
end;

procedure TNavigatorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssAlt] then
    if (Key = VK_RIGHT) and ForwardBtn.Enabled then
      ForwardBtn.Click
    else if (Key = VK_LEFT) and BackBtn.Enabled then
      BackBtn.Click;
end;

procedure TNavigatorForm.nStatusbarClick(Sender: TObject);
begin
{  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    StatusBar1.Visible := Checked;
  end;}
end;

procedure TNavigatorForm.HomePageRequest(var Message: TMessage);
begin
  URLs.Text := cIntHomepage;
  FindAddress;
end;

procedure TNavigatorForm.FormDestroy(Sender: TObject);
begin
  HistoryList.Free;
end;

procedure TNavigatorForm.BackActionUpdate(Sender: TObject);
begin
  if HistoryList.Count > 0 then
    BackAction.Enabled := HistoryIndex > 0
  else
    BackAction.Enabled := False;
end;

procedure TNavigatorForm.ForwardActionUpdate(Sender: TObject);
begin
  if HistoryList.Count > 0 then
    ForwardAction.Enabled := HistoryIndex < HistoryList.Count - 1
  else
    ForwardAction.Enabled := False;
end;

procedure TNavigatorForm.WebBrowserDownloadBegin(Sender: TObject);
begin
  { Turn the stop button dark red }
  StopBtn.ImageIndex := 4;
  { Play the avi from the first frame indefinitely }
  Animate1.Active := True;
end;

procedure TNavigatorForm.WebBrowserDownloadComplete(Sender: TObject);
begin
  { Turn the stop button grey }
  StopBtn.ImageIndex := 2;
  { Stop the avi and show the first frame }
  Animate1.Active := False;
end;

procedure TNavigatorForm.nExitClick(Sender: TObject);
begin
  Close;
end;

procedure TNavigatorForm.FormShow(Sender: TObject);
begin
  cIntHomepage := ExtractFilePath(Application.ExeName) + 'Navigation\系统管理.htm';
  HistoryIndex := -1;
  HistoryList := TStringList.Create;
  try
    Animate1.FileName := ExtractFilePath(Application.ExeName) + 'Navigation\cool.avi';
    PostMessage(Handle, CM_HOMEPAGEREQUEST, 0, 0);
  except
  end;
end;

procedure NavigateExecute(PageName: string);
var
  Url: string;
  I: integer;
  Flags: OLEVariant;
begin
  FindShowForm(TNavigatorForm, '');
  if PageName = '系统维护' then Url := '系统维护'//'erp_1'
  else Url := '系统管理';

  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I].Caption = '导航' then
    begin
      (Screen.Forms[I] as TNavigatorForm).SetFocus;
      (Screen.Forms[I] as TNavigatorForm).URLs.Text := WideString(ExtractFilePath(Application.ExeName)) + 'Navigation\' + Url + '.htm';
      Flags := 0;
      (Screen.Forms[I] as TNavigatorForm).UpdateCombo := True;
      try
        if Url <> '' then
          (Screen.Forms[I] as TNavigatorForm).WebBrowser.Navigate(WideString((Screen.Forms[I] as TNavigatorForm).Urls.Text), Flags, Flags, Flags, Flags)
        else
          (Screen.Forms[I] as TNavigatorForm).WebBrowser.Navigate(WideString(ExtractFilePath(Application.ExeName)) + 'Navigation\系统管理.htm', Flags, Flags, Flags, Flags);
      except
      end;
    end;
  end;
end;

procedure TNavigatorForm.WebBrowserBeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  NewIndex: Integer;
  Cmd: string;
begin
//胡建平
  if LowerCase(Copy(URL, 1, 8)) = 'command:' then
  begin
    Cmd := LowerCase(Copy(URL, 9, MaxInt));

    if (Guarder.UserName = '系统管理员') then
    else if not (Guarder.HasRight(Cmd)) then
    begin
      showmessage('你没有此功能权限,无法使用此功能!请与系统管理员联系!');
      exit;
    end;

    with MainForm do
    begin
//      if Cmd = '客户资料' then DAAreaClientAction.Execute
    end;
//    ExecuteCommand(Cmd);
    Cancel := True;
  end;
//胡建平
  if LowerCase(Copy(URL, 1, 3)) = 'res' then
    exit;
  NewIndex := HistoryList.IndexOf(URL);
  if NewIndex = -1 then
  begin
    { Remove entries in HistoryList between last address and current address }
    if (HistoryIndex >= 0) and (HistoryIndex < HistoryList.Count - 1) then
      while HistoryList.Count > HistoryIndex do
        HistoryList.Delete(HistoryIndex);
    HistoryIndex := HistoryList.Add(URL);
  end
  else
    HistoryIndex := NewIndex;
  if UpdateCombo then
  begin
    UpdateCombo := False;
    NewIndex := URLs.Items.IndexOf(URL);
    if NewIndex = -1 then
      URLs.Items.Insert(0, URL)
    else
      URLs.Items.Move(NewIndex, 0);
  end;
  URLs.Text := URL;
  MainEgmForm.StatusBar.SimpleText := URL;
end;

procedure TNavigatorForm.FormActivate(Sender: TObject);
begin
  self.WindowState := wsMaximized;
end;

end.

