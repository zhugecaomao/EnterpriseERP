unit MSEdPostion;
{******************************************
项目：
模块：职位编辑
日期：2002年10月31日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DBCtrls, Mask, DB, ADODB;

type
  TMSPostionEditForm = class(TWSStandardEditForm)
    atbPostion: TADOTable;
    dsPostion: TDataSource;
    Label1: TLabel;
    dbeName: TDBEdit;
    Label2: TLabel;
    dbeCode: TDBEdit;
    Label5: TLabel;
    dblcPostionClass: TDBLookupComboBox;
    dsPositionClass: TDataSource;
    atbPostionClass: TADOTable;
    Label6: TLabel;
    dbmMemo: TDBMemo;
    atbPostionID: TAutoIncField;
    atbPostionCreateDate: TDateTimeField;
    atbPostionCreateUserID: TIntegerField;
    atbPostionRecordState: TStringField;
    atbPostionName: TStringField;
    atbPostionCode: TStringField;
    atbPostionMemo: TStringField;
    atbPostionPostionClassID: TIntegerField;
    atbPostionClassID: TAutoIncField;
    atbPostionClassCreateDate: TDateTimeField;
    atbPostionClassCreateUserID: TIntegerField;
    atbPostionClassRecordState: TStringField;
    atbPostionClassName: TStringField;
    atbPostionClassCode: TStringField;
    atbPostionClassUpid: TIntegerField;
    atbPostionClassMemo: TStringField;
    atbPostionClassLevelCode: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure atbPostionBeforePost(DataSet: TDataSet);
    procedure tblDepartmentFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure atbPostionFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function Edit(const Params: Variant): Boolean; override;
    function Enter(const Params: Variant): Boolean; override;
//    function Enter(const Params: Variant): Boolean; overload; //virtual; abstract;
  end;

var
  MSPostionEditForm: TMSPostionEditForm;

implementation

uses CommonDM,WSSecurity;

{$R *.dfm}

function TMSPostionEditForm.Enter(const Params: Variant): Boolean;
begin
  atbPostion.Open;
  atbPostion.Insert;
  atbPostionClass.Open;
  dblcPostionClass.Field.AsInteger:=params;
  Result := ShowModal = mrOK;
end;
function TMSPostionEditForm.Edit(const Params: Variant): Boolean;
begin
  atbPostion.Open;
  atbPostionClass.Open;
  atbPostion.Locate('ID',params,[]);
  Result := ShowModal = mrOK;
end;

procedure TMSPostionEditForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  atbPostion.Close;;
  atbPostionClass.Close;;
end;

procedure TMSPostionEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if atbPostion.State in [dsedit,dsinsert] then
    atbPostion.Post;
  modalresult:=mrOk;
end;

procedure TMSPostionEditForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  modalresult:=mrCancel;
end;

procedure TMSPostionEditForm.atbPostionBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dataset.State=dsinsert then
    dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
end;

procedure TMSPostionEditForm.tblDepartmentFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='删除');
end;

procedure TMSPostionEditForm.atbPostionFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='删除');
end;

end.
