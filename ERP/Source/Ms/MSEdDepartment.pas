unit MSEdDepartment;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, Mask, DBCtrls, QLDBLkp;

type
  TMSDepartmentEditForm= class(TWSStandardEditForm)
    tblMSEedtDp: TADOTable;
    dsMSEedtDp: TDataSource;
    tblMSEedtDpID: TAutoIncField;
    tblMSEedtDpCreateDate: TDateTimeField;
    tblMSEedtDpCreateUserID: TIntegerField;
    tblMSEedtDpRecordState: TStringField;
    tblMSEedtDpName: TStringField;
    tblMSEedtDpCode: TStringField;
    tblMSEedtDpUpid: TIntegerField;
    tblMSEedtDpMemo: TStringField;
    tblMSEedtDpLevelCode: TStringField;
    tblMSEedtDpLeaderID: TIntegerField;
    tblMSEedtDpAddress: TStringField;
    tblMSEedtDpPhone: TStringField;
    tblMSEedtDpFax: TStringField;
    tblMSEedtDpEmail: TStringField;
    tblMSEedtDpWeb: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    dsUpid: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    dsLeaderId: TDataSource;
    tblLeaderID: TADOTable;
    tblLeaderIDID: TAutoIncField;
    tblLeaderIDCreateDate: TDateTimeField;
    tblLeaderIDCreateUserID: TIntegerField;
    tblLeaderIDRecordState: TStringField;
    tblLeaderIDName: TStringField;
    tblLeaderIDCode: TStringField;
    tblLeaderIDGender: TStringField;
    tblLeaderIDDepartmentID: TIntegerField;
    tblLeaderIDPositionClassID: TIntegerField;
    tblLeaderIDPostionID: TIntegerField;
    ADOQuery1: TADOQuery;
    tblMSEedtDpGeneralACID: TIntegerField;
    Label10: TLabel;
    GeneralAcIDds: TDataSource;
    GeneralAcIDAds: TADODataSet;
    QLDBLookupComboBox1: TQLDBLookupComboBox;
    TempAds: TADODataSet;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure tblMSEedtDpBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblLeaderIDFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblUpidFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure tblMSEedtDpFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    function Enter(const Params: Variant): Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  MSDepartmentEditForm: TMSDepartmentEditForm;

implementation

uses CommonDM,WSSecurity;

{$R *.dfm}
function TMSDepartmentEditForm.Enter(const Params: Variant): Boolean;
begin
  tblMSEedtDp.Open;
  tblLeaderID.Open;
  tblMSEedtDp.Insert;
  adoquery1.Parameters.ParamByName('Code').Value:='²»´æÔÚ';
  adoquery1.Open;
  dblookupcombobox1.Field.AsInteger:=params;
  TempAds.Close;
  TempAds.CommandText :='select distinct GeneralACID from MSDepartment'
      +' where GeneralACID is not null and GeneralACID<>0 ';
  TempAds.Open;
  if (tblMSEedtDp.FieldByName('GeneralACID').IsNull) or
     (tblMSEedtDp.FieldByName('GeneralACID').AsInteger=0 ) then
     begin
       tblMSEedtDp.Edit;
       tblMSEedtDp.FieldByName('GeneralACID').AsInteger :=
                    TempAds.fieldbyname('GeneralACID').AsInteger ;
       tblMSEedtDp.Post;
       end;
  Result := ShowModal = mrOK;
  end;
function TMSDepartmentEditForm.Edit(const Params: Variant): Boolean;

begin
  tblMSEedtDp.Open;
  tblLeaderID.Open;
  tblMSEedtDp.Locate('ID',Params,[]);
  adoquery1.Parameters.ParamByName('Code').Value:='%'+trim(tblMSEedtDp.fieldbyname('LevelCode').AsString)+'%';
  adoquery1.Open;
  TempAds.Close;
  TempAds.CommandText :='select distinct GeneralACID from MSDepartment'
      +' where GeneralACID is not null and GeneralACID<>0 ';
  TempAds.Open;
  if (tblMSEedtDp.FieldByName('GeneralACID').IsNull) or
     (tblMSEedtDp.FieldByName('GeneralACID').AsInteger=0 ) then
     begin
       tblMSEedtDp.Edit;
       tblMSEedtDp.FieldByName('GeneralACID').AsInteger :=
                    TempAds.fieldbyname('GeneralACID').AsInteger ;
       tblMSEedtDp.Post;
       end;
  Result := ShowModal = mrOK;
end;

procedure TMSDepartmentEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;
if tblMSEedtDp.State in [dsedit,dsinsert]
then  try
       tblMSEedtDp.Post;
      finally
       ModalResult := mrOK;
      end;
end;

procedure TMSDepartmentEditForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
ModalResult :=mrCancel;
end;

procedure TMSDepartmentEditForm.tblMSEedtDpBeforePost(DataSet: TDataSet);
begin
  inherited;
if dataset.State=dsinsert
then begin
      dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;

      end;
if dataset.FieldByName('Upid').IsNull
then dataset.FieldByName('Upid').AsInteger:=-1;
end;

procedure TMSDepartmentEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
    adoquery1.close;
    tblMSEedtDp.close;

  tblLeaderID.close;
end;

procedure TMSDepartmentEditForm.tblLeaderIDFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TMSDepartmentEditForm.tblUpidFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=(dataset.FieldByName('ID').AsInteger<>DBLookupComboBox1.DataSource.DataSet.FieldByName('ID').AsInteger  )
        and (not (dataset.FieldByName('RecordState').AsString='É¾³ý'));
end;

procedure TMSDepartmentEditForm.tblMSEedtDpFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=  not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TMSDepartmentEditForm.FormShow(Sender: TObject);
begin
  inherited;
  dbedit1.SetFocus;
  dbedit1.SelLength:=0;
  GeneralAcIDAds.Open;
  if GeneralAcIDAds.IsEmpty then
  begin
    GeneralAcIDAds.Close;
    GeneralAcIDAds.CommandText :='select ID, SubCode, Name '
      +' from DASubject where LEN(SubCode) =4';
    GeneralAcIDAds.Open;
  end;
end;

end.
