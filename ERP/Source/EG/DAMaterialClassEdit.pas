unit DAMaterialClassEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, DBCtrls, Mask;

type
  TDAMaterialClassEditForm = class(TWSStandardEditForm)
    tblGoodEdit: TADOTable;
    dsGoodEdit: TDataSource;
    DataSource2: TDataSource;
    tblGoodEditID: TAutoIncField;
    tblGoodEditCreateDate: TDateTimeField;
    tblGoodEditCreateUserID: TIntegerField;
    tblGoodEditRecordState: TStringField;
    tblGoodEditName: TStringField;
    tblGoodEditUpID: TIntegerField;
    tblGoodEditLevelCode: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOQuery1: TADOQuery;
    Label13: TLabel;
    procedure tblGoodEditBeforePost(DataSet: TDataSet);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ADOTable1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblGoodEditFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter(const Params: Variant): Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  DAMaterialClassEditForm: TDAMaterialClassEditForm;

implementation

uses CommonDM, WSSecurity;

{$R *.dfm}
function TDAMaterialClassEditForm.Enter(const Params: Variant): Boolean;
begin
  tblGoodEdit.Open;
   
  tblGoodEdit.Insert;
   
  adoquery1.Parameters.ParamByName('Code').Value:='²»´æÔÚ';
  adoquery1.Open;
  dblookupcombobox1.Field.AsInteger:=params;
  Result := ShowModal = mrOK;
end;

function TDAMaterialClassEditForm.Edit(const Params: Variant): Boolean;

begin
  tblGoodEdit.Open;
  tblgoodedit.Locate('ID',params,[]);

  adoquery1.Parameters.ParamByName('Code').Value:='%'+trim(tblgoodedit.fieldbyname('LevelCode').AsString)+'%';
  adoquery1.Open;


Result := ShowModal = mrOK;
end;


procedure TDAMaterialClassEditForm.tblGoodEditBeforePost(DataSet: TDataSet);
begin
  inherited;
if dataset.State=dsinsert
then begin
       dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
       end;
if dataset.FieldByName('Upid').IsNull
then dataset.FieldByName('Upid').AsInteger:=-1;
end;

procedure TDAMaterialClassEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;
if tblGoodEdit.State in [dsedit,dsinsert]
then 
       tblGoodEdit.Post;
       modalresult:=mroK;

end;

procedure TDAMaterialClassEditForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
modalresult:=mrcancel;
end;

procedure TDAMaterialClassEditForm.ADOTable1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=(dataset.FieldByName('ID').AsInteger<>DBLookupComboBox1.DataSource.DataSet.FieldByName('ID').AsInteger  )
        and (not (dataset.FieldByName('RecordState').AsString='É¾³ý'));
end;

procedure TDAMaterialClassEditForm.tblGoodEditFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TDAMaterialClassEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
adoquery1.Close;
end;

procedure TDAMaterialClassEditForm.FormShow(Sender: TObject);
begin
  inherited;
 dbedit1.SetFocus;
 dbedit1.SelLength:=0;
end;

end.
