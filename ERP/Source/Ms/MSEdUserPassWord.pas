unit MSEdUserPassWord;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DBCtrls, Mask, ComCtrls, DB, ADODB,
  Buttons, QLDBLkp, ExtCtrls, CheckLst, Grids, DBGrids;

type
  TMSEdUserPassWordForm = class(TWSStandardEditForm)
    ADOQuery: TADOQuery;
    PwEdit1: TLabeledEdit;
    PwEdit2: TLabeledEdit;
    PwEdit3: TLabeledEdit;
    procedure PwEdit1Exit(Sender: TObject);
    procedure PwEdit3Exit(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    EditFlag,StrPermission:string;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  MSEdUserPassWordForm: TMSEdUserPassWordForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}



procedure TMSEdUserPassWordForm.PwEdit1Exit(Sender: TObject);
begin
  inherited;
  if IsCorrectPassword(Guarder.UserID, Trim(PwEdit1.Text)) then
  begin
    PwEdit2.Enabled :=True;
    PwEdit3.Enabled :=True;
    PwEdit2.SetFocus;
  end else
  begin
    Showmessage('旧密码错误!');
    PwEdit2.Enabled :=False;
    PwEdit3.Enabled :=False;
  end;
end;

procedure TMSEdUserPassWordForm.PwEdit3Exit(Sender: TObject);
begin
  inherited;
  if Trim(PwEdit2.Text) <> Trim(PwEdit3.Text) then
    showmessage('新密码效验错误,请重新效验!')   ;
end;

procedure TMSEdUserPassWordForm.OKButtonClick(Sender: TObject);
begin
  if not PwEdit2.Enabled then Close;
  if PwEdit2.Text <>PwEdit3.Text then
  begin
    ShowMessage('新密码效验错误，请重新效验！ ');
    PwEdit2.SetFocus;
    Exit;
  end;
  inherited;
  if IsCorrectPassword(Guarder.UserID, Trim(PwEdit1.Text)) then
  begin
    ADOQuery.Close;
    if Guarder.UserID<>-1 then
      ADOQuery.SQL.Text :=' select PassWord from MSUser where ID='+inttostr(Guarder.UserID)
    else
     ADOQuery.SQL.Text :=' select id,PassWord from MSRole where RoleID='+inttostr(Guarder.UserID);

     ADOQuery.open;
    if not ADOQuery.IsEmpty then
    begin
      ADOQuery.Edit;
      ADOQuery.FieldByName('PassWord').AsString :=
            IntToStr(GetPassword(PwEdit2.Text));
      ADOQuery.Post;
      showmessage('修改成功!');
      Close;
    end;
  end else
  begin
    Showmessage('密码错误!');
    PwEdit2.Enabled :=False;
    PwEdit3.Enabled :=False;
  end;

end;

end.

