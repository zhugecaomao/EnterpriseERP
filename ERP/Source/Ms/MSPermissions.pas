unit MSPermissions;
{******************************************
项目：
模块：权限定义
日期：2002年10月31日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, Grids, DBGrids, QLDBGrid,CommonDM, DB,
  ADODB;

type
  TMSPermissionsForm = class(TWSStandardEditForm)
    qdgPermissionClass: TQLDBGrid;
    qdgPermission: TQLDBGrid;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    adsPermissionClass: TADODataSet;
    adsPermissionClassID: TAutoIncField;
    adsPermissionClassCreateDate: TDateTimeField;
    adsPermissionClassCreateUserID: TIntegerField;
    adsPermissionClassRecordState: TStringField;
    adsPermissionClassName: TStringField;
    adsPermissionClassMemo: TStringField;
    adsPermission: TADODataSet;
    btnAddClass: TButton;
    btnDeleteClass: TButton;
    btnAdd: TButton;
    btnDelete: TButton;
    adsPermissionID: TAutoIncField;
    adsPermissionCreateDate: TDateTimeField;
    adsPermissionCreateUserID: TIntegerField;
    adsPermissionRecordState: TStringField;
    adsPermissionName: TStringField;
    adsPermissionPermissionClassID: TIntegerField;
    adsPermissionCode: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure adsPermissionNewRecord(DataSet: TDataSet);
    procedure qdgPermissionClassExit(Sender: TObject);
    procedure btnAddClassClick(Sender: TObject);
    procedure btnDeleteClassClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ManagePermissionsDlg: Boolean;

implementation

{$R *.dfm}
function ManagePermissionsDlg: Boolean;
begin
  Result := False;
  with TMSPermissionsForm.Create(Application) do
  try
    if ShowModal = mrOK then
    begin
      Result := True;
    end;
  finally
    Free;
  end;
end;

procedure TMSPermissionsForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsPermission.Active:=True;
  adsPermissionClass.Active:=True;
end;

procedure TMSPermissionsForm.OKButtonClick(Sender: TObject);
begin
  inherited;
{  adsPermissionClass.UpdateBatch;
  adsPermission.UpdateBatch;
  ModalResult := mrOK;
}
end;

procedure TMSPermissionsForm.adsPermissionNewRecord(DataSet: TDataSet);
begin
  inherited;
//  if adsPermission
  adsPermissionPermissionClassID.ReadOnly:=False;
  With adsPermission do
  begin
    FieldByName('PermissionClassID').AsInteger:=adsPermissionClass.FieldByName('ID').AsInteger;
  end;
  adsPermissionPermissionClassID.ReadOnly:=False;
end;

procedure TMSPermissionsForm.qdgPermissionClassExit(Sender: TObject);
begin
  inherited;
  with adsPermissionClass do
  begin
    edit;
    post;
  end;
end;

procedure TMSPermissionsForm.btnAddClassClick(Sender: TObject);
begin
  inherited;
  adsPermissionClass.Append;
  qdgPermissionClass.SetFocus;
end;

procedure TMSPermissionsForm.btnDeleteClassClick(Sender: TObject);
begin
  inherited;
  if MessageBox(handle,'如果删除分类，该分类中的所有资料都将删除，是否确实进行删除？','删除确认',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=ID_YES then
  begin
    if adsPermissionclass.RecordCount >0 then
    begin
      adsPermissionClass.Delete;
      adsPermission.Requery();
    end
    else
      showmessage('没有数据可删除...');
  end;
end;

procedure TMSPermissionsForm.btnAddClick(Sender: TObject);
begin
  inherited;
  adsPermission.Append;
  qdgPermission.SetFocus;
end;

procedure TMSPermissionsForm.btnDeleteClick(Sender: TObject);
begin
  inherited;
  if MessageBox(handle,'确实要删除数据吗？','删除确认',MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2)=ID_YES then
  begin
    if adsPermission.RecordCount>0 then
      adsPermission.Delete
    else
      showmessage('没有数据可删除...');
  end;
end;

end.
