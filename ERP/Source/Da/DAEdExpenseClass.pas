unit DAEdExpenseClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, Mask, DBCtrls, DB, ADODB, QLDBLkp;

type
  TDAEdExpenseClassForm = class(TWSStandardEditForm)
    tblDAEdExpenseClass: TADOTable;
    tblDAEdExpenseClassID: TAutoIncField;
    tblDAEdExpenseClassCreateDate: TDateTimeField;
    tblDAEdExpenseClassCreateUserID: TIntegerField;
    tblDAEdExpenseClassRecordState: TStringField;
    tblDAEdExpenseClassUpid: TIntegerField;
    tblDAEdExpenseClassName: TStringField;
    tblDAEdExpenseClassMemo: TStringField;
    tblDAEdExpenseClassLevelCode: TStringField;
    dsDAEdExpenseClass: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    Label4: TLabel;
    Label10: TLabel;
    QLDBLookupComboBox1: TQLDBLookupComboBox;
    GeneralAcIDAds: TADODataSet;
    GeneralAcIDds: TDataSource;
    tblDAEdExpenseClassGeneralACID: TIntegerField;
    TempAds: TADODataSet;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure tblDAEdExpenseClassBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        function Enter(const Params: Variant): Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  DAEdExpenseClassForm: TDAEdExpenseClassForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
function TDAEdExpenseClassForm.Enter(const Params: Variant): Boolean;
begin
  tblDAEdExpenseClass.Open;
  tblDAEdExpenseClass.Insert;
  adoquery1.Parameters.ParamByName('Code').Value:='²»´æÔÚ';
  adoquery1.Open;
  dblookupcombobox1.Field.AsInteger:=params;
  Result := ShowModal = mrOK;

end;

function TDAEdExpenseClassForm.Edit(const Params: Variant): Boolean;
var LeveleStr :string;
begin
  tblDAEdExpenseClass.Open;
  tblDAEdExpenseClass.Locate('ID',params,[]);
  adoquery1.Parameters.ParamByName('Code').Value:='%'+trim(tblDAEdExpenseClass.fieldbyname('LevelCode').AsString)+'%';
  adoquery1.Open;
  LeveleStr := '%'+Trim(Copy(trim(tblDAEdExpenseClass.fieldbyname('LevelCode').AsString),1,3))+'%';
  TempAds.Close;
  TempAds.CommandText :='select distinct GeneralACID from DAExpenseClass'
      +' where GeneralACID is not null and GeneralACID<>0 and '
      +' LevelCode like '+Quotedstr(LeveleStr);
  TempAds.Open;
  if (tblDAEdExpenseClass.FieldByName('GeneralACID').IsNull) or
     (tblDAEdExpenseClass.FieldByName('GeneralACID').AsInteger=0 ) then
     begin
       tblDAEdExpenseClass.Edit;
       tblDAEdExpenseClass.FieldByName('GeneralACID').AsInteger :=
                    TempAds.fieldbyname('GeneralACID').AsInteger ;
       tblDAEdExpenseClass.Post;
       end;
  Result := ShowModal = mrOK;
end;

procedure TDAEdExpenseClassForm.OKButtonClick(Sender: TObject);
begin
  inherited;
if tblDAEdExpenseClass.State in [dsedit,dsinsert]
then
       tblDAEdExpenseClass.Post;

             ModalResult := mrOK;
end;

procedure TDAEdExpenseClassForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
 ModalResult := mrCancel;
end;

procedure TDAEdExpenseClassForm.tblDAEdExpenseClassBeforePost(
  DataSet: TDataSet);
begin
  inherited;
if dataset.State=dsinsert
then begin
       dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;

     end;
if dataset.FieldByName('Upid').IsNull
then dataset.FieldByName('Upid').AsInteger:=-1;
end;

procedure TDAEdExpenseClassForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblDAEdExpenseClass.Close;
  adoquery1.Close;
end;

procedure TDAEdExpenseClassForm.FormShow(Sender: TObject);
begin
  inherited;
  ADOQuery1.Open;
  GeneralAcIDAds.Open;
  dbedit2.SetFocus;
  dbedit2.SelLength:=0;
end;

procedure TDAEdExpenseClassForm.DBLookupComboBox1CloseUp(Sender: TObject);
var LeveleStr:string;
begin
  inherited;
  LeveleStr :=Trim(ADOQuery1.fieldbyname('LevelCode').AsString);
  TempAds.Close;
  TempAds.CommandText :='select distinct GeneralACID from DAExpenseClass'
      +' where GeneralACID is not null and GeneralACID<>0 and '
      +' ID='+ADOQuery1.fieldbyname('UpID').AsString;
  TempAds.Open;

  if TempAds.IsEmpty then
  begin
    TempAds.Close;
    TempAds.CommandText :='select distinct GeneralACID from DAExpenseClass'
        +' where GeneralACID is not null and GeneralACID<>0 and '
        +' LevelCode = '+Quotedstr(Copy(LeveleStr,1,3));
    TempAds.Open;
  end;

  if (not TempAds.FieldByName('GeneralACID').IsNull) and
     (TempAds.FieldByName('GeneralACID').AsInteger<>0 ) then
     begin
       tblDAEdExpenseClass.Edit;
       tblDAEdExpenseClass.FieldByName('GeneralACID').AsInteger :=
                    TempAds.fieldbyname('GeneralACID').AsInteger ;
       tblDAEdExpenseClass.Post;
       end;
end;

end.
