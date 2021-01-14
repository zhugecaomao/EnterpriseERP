unit MSBrUserNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,WSEdit,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TMSBrUserNewForm = class(TWSStandardBrowseForm)
    adsSlContract: TADODataSet;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    adsSlContractID: TAutoIncField;
    adsSlContractCreateDate: TDateTimeField;
    adsSlContractCreateUserID: TIntegerField;
    adsSlContractRecordState: TStringField;
    adsSlContractRoleID: TIntegerField;
    adsSlContractEmployeeID: TIntegerField;
    adsSlContractCode: TStringField;
    adsSlContractName: TStringField;
    adsSlContractPassWord: TIntegerField;
    adsSlContractBeginDate: TDateTimeField;
    adsSlContractEndDate: TDateTimeField;
    adsSlContractDSDesigner: TStringField;
    adsSlContractIsUsed: TIntegerField;
    ADOQuery: TADOQuery;
    ToolButton14: TToolButton;
    procedure EditActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  MSBrUserNewForm: TMSBrUserNewForm;

implementation

uses CommonDM, MSEdUserNew;

{$R *.dfm}

function TMSBrUserNewForm.CreateEditForm: TWSEditForm;
begin
  Result := TMSEdUserNewForm.Create(Application);
end;

procedure TMSBrUserNewForm.EditActionExecute(Sender: TObject);
begin
  if DataSet.FieldByName('ID').AsInteger = 1 then
    raise Exception.Create('系统管理员是系统内置用户，不能删除或修改');
  inherited;
end;

procedure TMSBrUserNewForm.DeleteActionExecute(Sender: TObject);
begin
  if DataSet.FieldByName('ID').AsInteger = 1 then
    raise Exception.Create('系统管理员是系统内置用户，不能删除或修改');
  inherited;
end;

procedure TMSBrUserNewForm.FormActivate(Sender: TObject);
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' delete from MSpermission '
    +' where  PermissionClass='+Quotedstr('X-查看地区')
    +' and name not in '
    +' ( select Name from DAArea  )  ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  MSpermission '
    +' (Name,PermissionClass,Code) '
    +' select distinct Name,'+Quotedstr('X-查看地区')
    +' as PermissionClass  ,'+Quotedstr('DAArea')
    +' as Code from DAArea '
    +' where Recordstate<>'+Quotedstr('删除')
    +' and Name not in '
    +' ( select name from MSpermission  '
    +' where PermissionClass='+Quotedstr('X-查看地区')+' ) ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' delete from MSpermission '
    +' where  PermissionClass='+Quotedstr('Y-查看业务')
    +' and name not in '
    +' ( select Name from MSEmployee )   ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into  MSpermission '
    +' (Name,PermissionClass,Code) '
    +' select distinct Name,'+Quotedstr('Y-查看业务')
    +' as PermissionClass  ,'+Quotedstr('MSEmployee')
    +' as Code from MSEmployee '
    +' where Recordstate<>'+Quotedstr('删除')
    +' and Name not in '
    +' ( select name from MSpermission  '
    +' where PermissionClass='+Quotedstr('Y-查看业务')+' ) ';
  ADOQuery.ExecSQL;



end;

end.

