unit SLEdClearBillA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp;

type
  TSLEdClearBillAForm = class(TBaseVoucherEditForm)
    tblSLClearBillDetail: TADODataSet;
    tblSLClearBillMaster: TADODataSet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    tblSLClearBillDetailID: TAutoIncField;
    tblSLClearBillDetailMasterID: TIntegerField;
    tblSLClearBillDetailAccountID: TIntegerField;
    tblSLClearBillDetailAcceptAmount: TBCDField;
    tblSLClearBillDetailGoodsID: TIntegerField;
    tblSLClearBillDetailProjectID: TIntegerField;
    tblSLClearBillDetailCheckNo: TStringField;
    tblSLClearBillDetailInvoiceCode: TStringField;
    tblSLClearBillDetailInvoiceType: TStringField;
    tblSLClearBillDetailInvoiceAmount: TBCDField;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    GoodName: TADODataSet;
    tblSLClearBillDetailGoodName: TStringField;
    BillTypeName: TADODataSet;
    FNAccountsName: TADODataSet;
    tblSLClearBillDetailAccountName: TStringField;
    Label5: TLabel;
    GEdit1: TGEdit;
    PoClear: TADODataSet;
    DSFNAccountsName: TDataSource;
    DSPoClear: TDataSource;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    QLDBLookupPoclear: TQLDBLookupComboBox;
    QLDBLookupAccounts: TQLDBLookupComboBox;
    ClientQLDBLookup: TQLDBLookupComboBox;
    QLDBLookupComboBox1: TQLDBLookupComboBox;
    DBEdit2: TDBEdit;
    tblSLClearBillMasterID: TAutoIncField;
    tblSLClearBillMasterCreateDate: TDateTimeField;
    tblSLClearBillMasterCreateUserID: TIntegerField;
    tblSLClearBillMasterRecordState: TStringField;
    tblSLClearBillMasterDate: TDateTimeField;
    tblSLClearBillMasterCode: TStringField;
    tblSLClearBillMasterBillMode: TStringField;
    tblSLClearBillMasterBillModeDC: TIntegerField;
    tblSLClearBillMasterClientID: TIntegerField;
    tblSLClearBillMasterEmployeID: TIntegerField;
    tblSLClearBillMasterOriginBillID: TIntegerField;
    tblSLClearBillMasterPeriodID: TIntegerField;
    tblSLClearBillMasterAcceptAmount: TBCDField;
    tblSLClearBillMasterMemo: TStringField;
    tblSLClearBillDetailPoClearID: TIntegerField;
    tblSLClearBillDetailAcceptName: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1Enter(Sender: TObject);
    procedure ClientQLDBLookupEnter(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  SLEdClearBillAForm: TSLEdClearBillAForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
procedure TSLEdClearBillAForm.New;
begin
  inherited;
  ClientName.Open;
  EmployeeName.Open;
  FNAccountsName.Open;
  GoodName.Open;
  BillTypeName.Open;
  tblSLClearBillMaster.FieldByName('Date').Value:=date;
  tblSLClearBillMaster.FieldByName('Code').AsString:=GetMaxCode('Code','SLClearBillMaster',number);
  tblSLClearBillMaster.FieldByName('CreateUserID').Value:=Guarder.UserID;
  tblSLClearBillMaster.FieldByName('BillMode').Value:='销售结算';
  tblSLClearBillMaster.FieldByName('BillModeDC').Value:=1;
end;

procedure TSLEdClearBillAForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
  ClientName.Open;
  EmployeeName.Open;
  FNAccountsName.Open;
  GoodName.Open;
  BillTypeName.Open;
end;


procedure TSLEdClearBillAForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblSLClearBillMaster.Close;
  tblSLClearBillDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
  GoodName.Close;
  BillTypeName.Close;
  FNAccountsName.Close;
end;

procedure TSLEdClearBillAForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'SLClearBill';
  SLEdClearBillForm.Caption :='销售结算';
  Label1.Caption :='客户名称';
  Label5.Caption :='应收帐款余额';
  DBGrid.Columns[0].Title.Caption :='收入帐户';
  DBGrid.Columns[1].Title.Caption :='收入金额';
end;

procedure TSLEdClearBillAForm.FormShow(Sender: TObject);
begin
  inherited;
  ClientQLDBLookup.SetFocus;
end;

procedure TSLEdClearBillAForm.DBLookupComboBox1Enter(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=true;
  GEdit1.Text :='0';
  GEdit1.Enabled :=false;
end;

procedure TSLEdClearBillAForm.ClientQLDBLookupEnter(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=true;
  GEdit1.Text :='0';
  GEdit1.Enabled :=false;
end;

procedure TSLEdClearBillAForm.ClientQLDBLookupExit(Sender: TObject);
var
  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    close;
    sql.Text := 'select sum(isnull(AcceptAmount,0)) as Balance from '
        + 'SLClearBillMaster where RecordState<>' + QuotedStr('删除')
        + ' and ClientID='+ClientName.fieldbyname('ID').AsString;
    open;
    GEdit1.Enabled :=true;
    if  adoTemp.IsEmpty then     GEdit1.Text :='0'
      else   GEdit1.Text :=fieldbyname('Balance').asstring;
    GEdit1.Enabled :=False;
  end;
end;

end.
