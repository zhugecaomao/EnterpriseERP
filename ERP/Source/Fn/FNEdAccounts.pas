unit FNEdAccounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, DBCtrls, Mask, ExtDlgs,
  QLDBLkp, ExtCtrls;

type
  TFNEditAccountsForm = class(TWSStandardEditForm)
    dsFNAccountEdit: TDataSource;
    tblFNAccountEdit: TADOTable;
    tblFNAccountEditCurrencyID: TIntegerField;
    tblFNAccountEditAccountManger: TStringField;
    tblFNAccountEditAccountType: TStringField;
    tblFNAccountEditBankOpenDate: TDateTimeField;
    tblFNAccountEditBankOpened: TStringField;
    tblFNAccountEditBankAddress: TStringField;
    tblFNAccountEditBankAccount: TStringField;
    tblFNAccountEditCheckStamp: TStringField;
    tblFNAccountEditBankStamp: TStringField;
    tblFNAccountEditFingerMark: TBlobField;
    tblFNAccountEditRecordState: TStringField;
    tblFNAccountEditCreateUserID: TIntegerField;
    tblFNAccountEditCreateDate: TDateTimeField;
    tblFNAccountEditID: TAutoIncField;
    OpenPic: TOpenPictureDialog;
    TblMsCurrency: TADOTable;
    DataSource1: TDataSource;
    tblFNAccountEditName: TStringField;
    GeneralAcIDAds: TADODataSet;
    GeneralAcIDds: TDataSource;
    tblFNAccountEditGeneralACID: TIntegerField;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBImage1: TDBImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    DBCAccountType: TDBComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label13: TLabel;
    GeneralAccountIDLkup: TQLDBLookupComboBox;
    DBCmbEmployee: TDBComboBox;
    AdsEmployee: TADODataSet;
    DsEmployee: TDataSource;
    Label14: TLabel;
    DBEdit2: TDBEdit;
    tblFNAccountEditBankPhone: TStringField;
    procedure DBImage1DblClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBCAccountTypeChange(Sender: TObject);
    procedure tblFNAccountEditBeforePost(DataSet: TDataSet);
    procedure tblFNAccountEditFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  FNEditAccountsForm: TFNEditAccountsForm;

implementation

uses CommonDM, WSSecurity;

{$R *.dfm}



function TFNEditAccountsForm.Enter: Boolean;
begin
tblFNAccountEdit.open;
tblFNAccountEdit.Insert;
  Result := ShowModal = mrOK;
end;

function TFNEditAccountsForm.Edit(const Params: Variant): Boolean;
var
i:integer;
begin
  tblFNAccountEdit.Open;
  tblFNAccountEdit.Locate('ID',params,[]);
  Result := ShowModal = mrOK;
end;

procedure TFNEditAccountsForm.DBImage1DblClick(Sender: TObject);
begin
  inherited;
if openpic.Execute then
begin
  if not (dbimage1.DataSource.DataSet.State in [dsedit,dsinsert]) then
  dbimage1.DataSource.DataSet.Edit ;
  dbimage1.Picture.LoadFromFile(openpic.FileName);
end;
end;

procedure TFNEditAccountsForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if  tblFNAccountEdit.State in  [dsedit,dsinsert]then
  tblFNAccountEdit.Post;
  modalresult:=mrok;
end;

procedure TFNEditAccountsForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
       modalresult:=mrcancel;
end;

procedure TFNEditAccountsForm.DBCAccountTypeChange(Sender: TObject);
begin
  if (DBCAccountType.ItemIndex=0 ) or (DBCAccountType.ItemIndex=3)
    then  Panel2.Enabled :=False  else  Panel2.Enabled :=True;
  if Panel2.Enabled then Panel2.Color :=clWindow
    else Panel2.Color :=clBtnFace;
end;

procedure TFNEditAccountsForm.tblFNAccountEditBeforePost(
  DataSet: TDataSet);
begin
  inherited;
if dataset.State=dsinsert
then dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;

end;

procedure TFNEditAccountsForm.tblFNAccountEditFilterRecord(
  DataSet: TDataSet; var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='删除');
end;

procedure TFNEditAccountsForm.FormShow(Sender: TObject);
begin
  inherited;
  DBCmbEmployee.Clear;
  AdsEmployee.Close;
  AdsEmployee.CommandText :='select distinct name from MSEmployee '
    +' where RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+Quotedstr('作废')
    +' union all '
    +' select distinct AccountManger as name from FNAccounts '
    +' where RecordState<>'+Quotedstr('删除')
    +' and AccountManger not in (select name from MSEmployee '
    +' where RecordState<>'+Quotedstr('删除')+ ' )' ;
  AdsEmployee.Open;
  AdsEmployee.First;
  while not AdsEmployee.Eof do
  begin
    DBCmbEmployee.Items.Add(Trim(AdsEmployee.fieldbyname('Name').AsString));
    AdsEmployee.Next;
  end;
  TblMsCurrency.Open;
  GeneralAcIDAds.Open;
  if GeneralAcIDAds.IsEmpty then
  begin
    GeneralAcIDAds.Close;
    GeneralAcIDAds.CommandText :='select ID, SubCode, Name '
      +' from DASubject where LEN(SubCode) =4';
    GeneralAcIDAds.Open;
  end;


end;

procedure TFNEditAccountsForm.FormActivate(Sender: TObject);
begin
  if (Trim(tblFNAccountEdit.FieldByName('AccountType').AsString)='现金')
    or (Trim(tblFNAccountEdit.FieldByName('AccountType').AsString)='业主资金')
    or (Trim(tblFNAccountEdit.FieldByName('AccountType').AsString)='')
    then  Panel2.Enabled :=False
    else  Panel2.Enabled :=True;
  if Panel2.Enabled then Panel2.Color :=clWindow
    else Panel2.Color :=clBtnFace;
end;

end.
