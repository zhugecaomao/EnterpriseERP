unit DAAttributeEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, DBCtrls, Mask;

type
  TDAAttributeEditForm = class(TWSStandardEditForm)
    tblDAAttributeEdit: TADOTable;
    dsDAAttributeEdit: TDataSource;
    tblDAAttributeEditID: TAutoIncField;
    tblDAAttributeEditCreateDate: TDateTimeField;
    tblDAAttributeEditCreateUserID: TIntegerField;
    tblDAAttributeEditRecordState: TStringField;
    tblDAAttributeEditUpid: TIntegerField;
    tblDAAttributeEditName: TStringField;
    tblDAAttributeEditMemo: TStringField;
    tblDAAttributeEditLevelCode: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBMemo1: TDBMemo;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    Label13: TLabel;
    procedure tblDAAttributeEditBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ADOTable1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblDAAttributeEditFilterRecord(DataSet: TDataSet;
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
  DAAttributeEditForm: TDAAttributeEditForm;

implementation

uses CommonDM, WSSecurity;

{$R *.dfm}


function TDAAttributeEditForm.Enter(const Params: Variant): Boolean;
begin

tblDAAttributeEdit.open;
tblDAAttributeEdit.Insert;
 adoquery1.Parameters.ParamByName('Code').Value:='²»´æÔÚ';
adoquery1.Open;
 dblookupcombobox1.Field.AsInteger:=params;
Result := ShowModal = mrOK;
  end;
function TDAAttributeEditForm.Edit(const Params: Variant): Boolean;

begin

tblDAAttributeEdit.open;
tblDAAttributeEdit.Locate('ID',Params,[]);

adoquery1.Parameters.ParamByName('Code').Value:='%'+trim(tblDAAttributeEdit.fieldbyname('LevelCode').AsString)+'%';
adoquery1.Open;
Result := ShowModal = mrOK;

end;




procedure TDAAttributeEditForm.tblDAAttributeEditBeforePost(
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

procedure TDAAttributeEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
adoquery1.Close;
tblDAAttributeEdit.Close;

end;

procedure TDAAttributeEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if tblDAAttributeEdit.State in [dsedit,dsinsert]
  then  tblDAAttributeEdit.Post;
  ModalResult := mrOK;
end;

procedure TDAAttributeEditForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
ModalResult :=mrCancel;
end;

procedure TDAAttributeEditForm.ADOTable1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=(dataset.FieldByName('ID').AsInteger<>DBLookupComboBox1.DataSource.DataSet.FieldByName('ID').AsInteger  )
        and (not (dataset.FieldByName('RecordState').AsString='É¾³ý'));
end;

procedure TDAAttributeEditForm.tblDAAttributeEditFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TDAAttributeEditForm.FormShow(Sender: TObject);
begin
  inherited;
 dbedit2.SetFocus;
 dbedit2.SelLength:=0;
end;

end.
