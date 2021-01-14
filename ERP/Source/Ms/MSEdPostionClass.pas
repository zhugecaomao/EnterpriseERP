unit MSEdPostionClass;
{******************************************
项目：
模块：职位类别编辑
日期：2002年11月8日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, Mask, DBCtrls;

type
  TMSPostionClassEditForm= class(TWSStandardEditForm)
    atbMSPostionClass: TADOTable;
    dsMSPostionClass: TDataSource;
    Label1: TLabel;
    dbeName: TDBEdit;
    Label3: TLabel;
    dbeCode: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dblcUpID: TDBLookupComboBox;
    dsUpid: TDataSource;
    dsLeaderId: TDataSource;
    atbLeaderID: TADOTable;
    adrQuery: TADOQuery;
    atbMSPostionClassID: TAutoIncField;
    atbMSPostionClassCreateDate: TDateTimeField;
    atbMSPostionClassCreateUserID: TIntegerField;
    atbMSPostionClassRecordState: TStringField;
    atbMSPostionClassName: TStringField;
    atbMSPostionClassCode: TStringField;
    atbMSPostionClassUpid: TIntegerField;
    atbMSPostionClassMemo: TStringField;
    atbMSPostionClassLevelCode: TStringField;
    atbLeaderIDID: TAutoIncField;
    atbLeaderIDCreateDate: TDateTimeField;
    atbLeaderIDCreateUserID: TIntegerField;
    atbLeaderIDRecordState: TStringField;
    atbLeaderIDName: TStringField;
    atbLeaderIDCode: TStringField;
    atbLeaderIDMemo: TStringField;
    atbLeaderIDPostionClassID: TIntegerField;
    dbmMemo: TDBMemo;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure atbMSPostionClassBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure atbLeaderIDFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblUpidFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure atbMSPostionClassFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }

    function Enter(const Params: Variant): Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  MSPostionClassEditForm: TMSPostionClassEditForm;

implementation

uses CommonDM,WSSecurity;

{$R *.dfm}
function TMSPostionClassEditForm.Enter(const Params: Variant): Boolean;
begin
  atbMSPostionclass.Open;
//  atbLeaderID.Open;
  atbMSPostionClass.Insert;
  adrQuery.Parameters.ParamByName('Code').Value:='不存在';
  adrQuery.Open;
  dblcUpID.Field.AsInteger:=params;
  Result := ShowModal = mrOK;
end;

function TMSPostionClassEditForm.Edit(const Params: Variant): Boolean;
begin
  atbMSPostionClass.Open;
  atbLeaderID.Open;
  atbMSPostionClass.Locate('ID',Params,[]);
  adrQuery.Parameters[0].Value:='%'+trim(atbMSPostionClass.fieldbyname('LevelCode').AsString)+'%';
  adrQuery.Open;
  Result := ShowModal = mrOK;
end;

procedure TMSPostionClassEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if atbMSPostionClass.State in [dsedit,dsinsert] then
  try
    atbMSPostionClass.Post;
  finally
    ModalResult := mrOK;
  end;
end;

procedure TMSPostionClassEditForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
ModalResult :=mrCancel;
end;

procedure TMSPostionClassEditForm.atbMSPostionClassBeforePost(DataSet: TDataSet);
begin
  inherited;
if dataset.State=dsinsert
then begin
      dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;

      end;
if dataset.FieldByName('Upid').IsNull
then dataset.FieldByName('Upid').AsInteger:=-1;
end;

procedure TMSPostionClassEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adrQuery.close;
  atbMSPostionClass.close;
  atbLeaderID.close;
end;

procedure TMSPostionClassEditForm.atbLeaderIDFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='删除');
end;

procedure TMSPostionClassEditForm.tblUpidFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=(dataset.FieldByName('ID').AsInteger<>dblcUpID.DataSource.DataSet.FieldByName('ID').AsInteger)        and (not (dataset.FieldByName('RecordState').AsString='删除'));
end;

procedure TMSPostionClassEditForm.atbMSPostionClassFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not(dataset.FieldByName('RecordState').AsString='删除');
end;

end.
