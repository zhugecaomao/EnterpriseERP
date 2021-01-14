unit DAEdmanufacturer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, ComCtrls, Mask, DBCtrls,
  ExtCtrls, QLDBLkp, Buttons;

type
  TDAEdmanufacturerForm = class(TWSStandardEditForm)
    tblClientEdit: TADOTable;
    dsClientEdit: TDataSource;
    tblClientEditID: TAutoIncField;
    tblClientEditCreateDate: TDateTimeField;
    tblClientEditCreateUserID: TIntegerField;
    tblClientEditRecordState: TStringField;
    tblClientEditName: TStringField;
    tblClientEditFullName: TStringField;
    tblClientEditAreaID: TIntegerField;
    tblClientEditAddress: TStringField;
    tblClientEditTelephone: TStringField;
    tblClientEditFax: TStringField;
    tblClientEditRegisterDate: TDateTimeField;
    tblClientEditRegisterCapital: TBCDField;
    tblClientEditCharter: TStringField;
    tblClientEditBossName: TStringField;
    tblClientEditRunRange: TStringField;
    tblClientEditCentralTax: TStringField;
    tblClientEditLandTax: TStringField;
    tblClientEditCorporation: TStringField;
    tblClientEditCertificates: TStringField;
    tblClientEditBankOpened: TStringField;
    tblClientEditBankAccount: TStringField;
    tblClientEditMemo: TStringField;
    tblClientEditEMail: TStringField;
    tblClientEditWeb: TStringField;
    tblClientEditPostalCode: TStringField;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    Panel1: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit9: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    TabSheet2: TTabSheet;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit17: TDBEdit;
    DBEdit19: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBMemo1: TDBMemo;
    tblClientEditClientType: TStringField;
    Label23: TLabel;
    DBEdit7: TDBEdit;
    DBEdit22: TDBEdit;
    Label25: TLabel;
    Label24: TLabel;
    EmployeeName: TADODataSet;
    DSEmployeeName: TDataSource;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    tblClientEditToAddress: TStringField;
    tblClientEditMobile: TStringField;
    tblClientEditEmlpoyeeID: TIntegerField;
    GeneralACIDAds: TADODataSet;
    GeneralACIDds: TDataSource;
    Label27: TLabel;
    GeneralACIDLkup: TQLDBLookupComboBox;
    SpeedButton1: TSpeedButton;
    tblClientEditGeneralACID: TIntegerField;
    Label2: TLabel;
    Label26: TLabel;
    DBEdit18: TDBEdit;
    tblClientEditRunScope: TStringField;
    EmployeeLKUP: TQLDBLookupComboBox;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tblClientEditBeforePost(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ADOTable1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblClientEditFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter(const Params: Variant): Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  DAEdmanufacturerForm: TDAEdmanufacturerForm;

implementation

uses CommonDM, WSSecurity;

{$R *.dfm}
function TDAEdmanufacturerForm.Enter(const Params: Variant): Boolean;
begin
  tblClientEdit.Open;
  adotable1.Open;
  tblclientedit.Insert;
  with DBLookupComboBox1.ListSource.DataSet do
  begin
    Open;
    if Locate(DBLookupComboBox1.KeyField, Params, []) then
      dblookupcombobox1.Field.AsInteger:=params
    else begin
      First;
      dblookupcombobox1.Field.Value := FieldByName(DBLookupComboBox1.KeyField).Value;
    end;
  end;
  tblClientEdit.FieldByName('ClientType').AsString := '厂商';
//  dblookupcombobox1.Field.AsInteger:=params;
  Result := ShowModal = mrOK;
end;

function TDAEdmanufacturerForm.Edit(const Params: Variant): Boolean;
begin
  tblClientEdit.Open;
  adotable1.Open;
  tblclientedit.Locate('ID',Params,[]);
  tblclientedit.Edit;
  Result := ShowModal = mrOK;
end;

procedure TDAEdmanufacturerForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  tblClientEdit.Post;
  modalresult:=mrOk;
end;

procedure TDAEdmanufacturerForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  modalresult:=mrcancel;
end;

procedure TDAEdmanufacturerForm.FormCreate(Sender: TObject);
begin
  inherited;
  pagecontrol1.ActivePageIndex:=0;
end;

procedure TDAEdmanufacturerForm.tblClientEditBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dataset.State=dsinsert
  then  dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
end;

procedure TDAEdmanufacturerForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adotable1.Close;
  tblclientedit.Close;
end;

procedure TDAEdmanufacturerForm.ADOTable1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=(dataset.FieldByName('ID').AsInteger<>DBLookupComboBox1.DataSource.DataSet.FieldByName('ID').AsInteger  )
        and (not (dataset.FieldByName('RecordState').AsString='删除'));
end;

procedure TDAEdmanufacturerForm.tblClientEditFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='删除');
end;

procedure TDAEdmanufacturerForm.FormShow(Sender: TObject);
begin
  inherited;
  dbedit1.SetFocus;
  dbedit1.SelLength:=0;
  GeneralACIDAds.Open;
  EmployeeName.Open;
end;

procedure TDAEdmanufacturerForm.SpeedButton1Click(Sender: TObject);
var aqrTemp: TADOQuery;
    ACIDStr :String;
begin
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    ACIDStr := tblClientEdit.fieldbyname('GeneralACID').AsString;
    if  Trim(ACIDStr)='' then ACIDStr :='1' ;
    Close;
    sql.Text := 'update DaClient set GeneralACID='+ ACIDStr
       +' where ClientType='+Quotedstr('厂商') ;
    ExecSql;
  end;
end;

end.
