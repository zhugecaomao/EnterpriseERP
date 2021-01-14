unit MSEdEmployee;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DBCtrls, Mask, DB, ADODB;

type
  TMSEdEmployeeForm = class(TWSStandardEditForm)
    dsEmployee: TDataSource;
    tblEmployeeID: TAutoIncField;
    tblEmployeeCreateDate: TDateTimeField;
    tblEmployeeCreateUserID: TIntegerField;
    tblEmployeeRecordState: TStringField;
    tblEmployeeName: TStringField;
    tblEmployeeCode: TStringField;
    tblEmployeeGender: TStringField;
    tblEmployeeDepartmentID: TIntegerField;
    tblEmployeePositionClassID: TIntegerField;
    tblEmployeePostionID: TIntegerField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DBComboBox1: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    tblDepartment: TADOTable;
    dsDepartment: TDataSource;
    tblPosition: TADOTable;
    dsPosition: TDataSource;
    dsPositionClass: TDataSource;
    tblPositionClass: TADOTable;
    DBEdit3: TDBEdit;
    tblEmployeePostDate: TDateTimeField;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    tblEmployee: TADOTable;
    tblEmployeeBarCode: TStringField;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure tblEmployeeBeforePost(DataSet: TDataSet);
    procedure tblDepartmentFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblEmployeeFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DBEdit2Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter(const Params: Variant): Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  MSEdEmployeeForm: TMSEdEmployeeForm;

implementation

uses CommonDM,WSSecurity,WSUtils;

{$R *.dfm}

function TMSEdEmployeeForm.Enter(const Params: Variant): Boolean;
begin
  tblEmployee.Open;
  tblDepartment.Open;
  tblPosition.Open;
  tblPositionClass.Open;
  tblEmployee.Insert;
  dblookupcombobox1.Field.AsInteger:=params;
  tblEmployee.FieldByName('Code').asstring :=GetMaxCode('Code','MSEmployee',number);
  Result := ShowModal = mrOK;
end;
function TMSEdEmployeeForm.Edit(const Params: Variant): Boolean;
begin
  tblEmployee.Open;
  tblDepartment.Open;
  tblPosition.Open;
  tblPositionClass.Open;
  tblEmployee.Locate('ID',params,[]);

  Result := ShowModal = mrOK;
end;

procedure TMSEdEmployeeForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  tblEmployee.Close;;
  tblDepartment.Close;;
  tblPosition.Close;;
  tblPositionClass.Close;;
end;

procedure TMSEdEmployeeForm.OKButtonClick(Sender: TObject);
var adoTemp: TADOQuery;
begin
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;

  adoTemp.close;
  adoTemp.SQL.Text :=' select EmployeeID,name,IsEmployee from DALinkMenIDCard where '
    +' EmployeeID='+ inttostr(tblEmployee.FieldByName('ID').AsInteger);
  adoTemp.open;
  if adoTemp.IsEmpty  then
  begin
    adoTemp.Append ;
    adoTemp.FieldByName('name').AsString :=tblEmployee.FieldByName('name').AsString ;
    adoTemp.FieldByName('EmployeeID').AsInteger :=tblEmployee.FieldByName('ID').AsInteger ;
    adoTemp.FieldByName('IsEmployee').AsString :='ÊÇ';
    adoTemp.Post;
  end;
  inherited;
  if tblEmployee.State in [dsedit,dsinsert]  then tblemployee.Post;
  modalresult:=mrOk;
end;

procedure TMSEdEmployeeForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  modalresult:=mrCancel;
end;

procedure TMSEdEmployeeForm.tblEmployeeBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dataset.State=dsinsert
  then dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
end;

procedure TMSEdEmployeeForm.tblDepartmentFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
//accept:=(dataset.FieldByName('ID').AsInteger<>DBLookupComboBox1.DataSource.DataSet.FieldByName('ID').AsInteger  )
//        and (not (dataset.FieldByName('RecordState').AsString='É¾³ý'));
end;

procedure TMSEdEmployeeForm.tblEmployeeFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TMSEdEmployeeForm.FormShow(Sender: TObject);
begin
  inherited;
  dbedit1.SetFocus;
  dbedit1.SelLength:=0;
end;

procedure TMSEdEmployeeForm.DBEdit2Exit(Sender: TObject);
begin
  inherited;
  tblEmployee.Edit;
  if (tblEmployee.FieldByName('BarCode').IsNull) or
       (tblEmployee.FieldByName('BarCode').AsString='' ) then
     tblEmployee.FieldByName('BarCode').AsString := tblEmployee.FieldByName('Code').AsString;
//  tblEmployee.Post;
end;

end.
