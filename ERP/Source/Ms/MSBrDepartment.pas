unit MSBrDepartment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSTreeView, DB, ActnList, ToolWin, ComCtrls, ADODB,WSEdit, Menus;

type
  TMSDepartmentBrowseForm= class(TWSTreeViewForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    tblMSDBrowse: TADOTable;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
  function CreateEditForm: TWSEditForm; override;

  public
    { Public declarations }
  end;

var
  MSDepartmentBrowseForm: TMSDepartmentBrowseForm;

implementation

uses CommonDM, MSEdDepartment,WSSecurity;

{$R *.dfm}
function TMSDepartmentBrowseForm.CreateEditForm: TWSEditForm;
begin
    Result := TMSDepartmentEditForm.Create(Application);
end;

procedure TMSDepartmentBrowseForm.FormCreate(Sender: TObject);
var
  aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    Close;
    sql.Text := ' select top 1 * from MSDepartment where '
      +' RecordState<>' +QuotedStr('É¾³ý');
    open;
    if aqrTemp.IsEmpty then
    begin
      aqrTemp.Close;
      aqrTemp.sql.Text := ' Insert Into MSDepartment (CreateUserID,'
      +' Upid , Name) '
        +' Values ( 1,-1,'+QuotedStr(Trim(Guarder.CompanyUserName))+' )';
      aqrTemp.ExecSQL;
    end;
  end;
  inherited;
end;

end.
