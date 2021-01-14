unit DAEdProject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, Mask, DBCtrls, ExtDlgs,
  QLDBLkp;

type
  TDAEdProjectForm = class(TWSStandardEditForm)
    tblGoodsEdit: TADOTable;
    dsGoodsEdie: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label10: TLabel;
    DBImage1: TDBImage;
    dsProjectClass: TDataSource;
    OpenPic: TOpenPictureDialog;
    adotable1: TADODataSet;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    tblGoodsEditID: TIntegerField;
    tblGoodsEditCreateDate: TDateTimeField;
    tblGoodsEditCreateUserID: TIntegerField;
    tblGoodsEditRecordState: TStringField;
    tblGoodsEditName: TStringField;
    tblGoodsEditCode: TStringField;
    tblGoodsEditProjectBrief: TStringField;
    tblGoodsEditProjectClassID: TIntegerField;
    tblGoodsEditStockMax: TFloatField;
    tblGoodsEditStockMin: TFloatField;
    tblGoodsEditProjectPictrue: TBlobField;
    tblGoodsEditMemo: TStringField;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    Label11: TLabel;
    ClientLKUP: TQLDBLookupComboBox;
    ClientIDAds: TADODataSet;
    ClientIDDs: TDataSource;
    tblGoodsEditPrjContractNo: TStringField;
    tblGoodsEditClientID: TIntegerField;
    tblGoodsEditContractClause: TStringField;
    tblGoodsEditClient: TStringField;
    Label12: TLabel;
    DBEdit7: TDBEdit;
    EmployeeLKUP: TQLDBLookupComboBox;
    EmployeeADS: TADODataSet;
    EmployeeDS: TDataSource;
    tblGoodsEditEmployeeID: TIntegerField;
    tblGoodsEditEmployee: TStringField;
    DBEdit8: TDBEdit;
    Label13: TLabel;
    tblGoodsEditDate: TDateTimeField;
    ProjectIDLkup: TQLDBLookupComboBox;
    procedure tblGoodsEditBeforePost(DataSet: TDataSet);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBImage1DblClick(Sender: TObject);
    procedure ADOTable1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblGoodsEditFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure ADOTable2FilterRecord(DataSet: TDataSet;
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
  DAEdProjectForm: TDAEdProjectForm;

implementation

uses CommonDM, WSSecurity,WSUtils;

{$R *.dfm}
function TDAEdProjectForm.Enter(const Params: Variant): Boolean;
begin
  tblGoodsEdit.open;
  adotable1.open;
  tblGoodsEdit.Insert;
  tblGoodsEdit.FieldByName('Date').AsDateTime :=Date;
  tblGoodsEdit.FieldByName('Code').AsString :=GetMaxCode('Code','DAProject',number);
  tblGoodsEdit.FieldByName('ProjectClassID').AsInteger :=adotable1.FieldByName('ID').AsInteger;
//  dblookupcombobox1.Field.AsInteger:=params;
  Result := ShowModal = mrOK;
end;
function TDAEdProjectForm.Edit(const Params: Variant): Boolean;
begin
  tblGoodsEdit.open;
  adotable1.open;
  tblGoodsEdit.Locate('ID',Params,[]);
  Result := ShowModal = mrOK;
end;

procedure TDAEdProjectForm.tblGoodsEditBeforePost(DataSet: TDataSet);
begin
  inherited;
if dataset.State=dsinsert
then dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;

end;

procedure TDAEdProjectForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if tblGoodsEdit.FieldByName('EmployeeID').AsInteger<>EmployeeADS.fieldbyname('ID').AsInteger
  then begin
    tblGoodsEdit.Edit;
    tblGoodsEdit.FieldByName('EmployeeID').AsInteger := EmployeeADS.fieldbyname('ID').AsInteger;
    tblGoodsEdit.Post;
  end;
  if tblGoodsEdit.FieldByName('ClientID').AsInteger=ClientIDAds.fieldbyname('ID').AsInteger
  then begin
    tblGoodsEdit.Edit;
    tblGoodsEdit.FieldByName('ClientID').AsInteger := ClientIDAds.fieldbyname('ID').AsInteger;
    tblGoodsEdit.Post;
  end;

  modalresult:=mrOk;
end;

procedure TDAEdProjectForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TDAEdProjectForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adotable1.Close;
  tblgoodsedit.Close;
end;

procedure TDAEdProjectForm.DBImage1DblClick(Sender: TObject);
begin
  inherited;
  if openpic.Execute then
  begin
    if not (dbimage1.DataSource.DataSet.State in [dsedit,dsinsert]) then
    dbimage1.DataSource.DataSet.Edit ;
    dbimage1.Picture.LoadFromFile(openpic.FileName);
  end;
end;

procedure TDAEdProjectForm.ADOTable1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;


accept:=(dataset.FieldByName('ID').AsInteger<>ProjectIDLkup.DataSource.DataSet.FieldByName('ID').AsInteger  )
        and (not (dataset.FieldByName('RecordState').AsString='É¾³ý'));
end;

procedure TDAEdProjectForm.tblGoodsEditFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TDAEdProjectForm.ADOTable2FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:= (dataset.FieldByName('RecordState').AsString<>'É¾³ý') and (dataset.FieldByName('IsGoalUnit').Value=true)
end;

procedure TDAEdProjectForm.FormShow(Sender: TObject);
begin
  inherited;
  dbedit1.SetFocus;
  dbedit1.SelLength:=0;
  EmployeeADS.Open;
  ClientIDAds.Open;
end;

end.
