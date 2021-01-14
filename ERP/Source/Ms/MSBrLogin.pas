unit MSBrLogin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ADODB, ActnList, ToolWin, ComCtrls, Grids,
  DBGrids, QLDBGrid, ExtCtrls, Menus;

type
  TMSBrLoginForm = class(TWSStandardBrowseForm)
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton1: TToolButton;
    ToolButton3: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    adsMaster: TADODataSet;
    adsMasterID: TAutoIncField;
    adsMasterCreateDate: TDateTimeField;
    adsMasterCreateUserID: TIntegerField;
    adsMasterRecordState: TStringField;
    adsMasterUserID: TIntegerField;
    adsMasterName: TStringField;
    adsMasterLoginTime: TDateTimeField;
    adsMasterLogoutTime: TDateTimeField;
    adsMasterComputerName: TStringField;
    adsMasterLoginIP: TStringField;
    AqrClearLogin: TADOQuery;
    ToolButton12: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MSBrLoginForm: TMSBrLoginForm;

implementation

uses CommonDM;

{$R *.dfm}

procedure TMSBrLoginForm.FormShow(Sender: TObject);
begin
  inherited;
  adsMaster.Close;
  adsMaster.CommandText :=' Select a.ID,a.CreateDate,a.CreateUserID, '
    +' a.RecordState,a.UserID,b.Name, '
    +' a.LoginTime,a.LogoutTime,a.ComputerName,a.LoginIP        '
    +' from MSLogin as a                                        '
    +' left outer join MSUser as b on a.UserID=b.ID             '
    +' where (a.UserID<>-1) and (not b.name is null )        '
    +' union                                                    '
    +' Select a.ID,a.CreateDate,a.CreateUserID,a.RecordState,   '
    +' a.UserID,b.Name,                                         '
    +' a.LoginTime,a.LogoutTime,a.ComputerName,a.LoginIP        '
    +' from MSLogin as a                                        '
    +' left join MSRole as b on a.UserID=b.RoleID               '
    +' where ( b.RoleID=-1) and (not b.name is null )    ';
  adsMaster.Open;
end;

procedure TMSBrLoginForm.DeleteActionExecute(Sender: TObject);
begin
  AqrClearLogin.Close;
  AqrClearLogin.SQL.Text :=' Truncate Table MSLogin';
  AqrClearLogin.ExecSQL;
//  inherited;
   adsMaster.Requery;
end;

end.
