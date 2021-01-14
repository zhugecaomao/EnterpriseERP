unit DABrClientc;
{******************************************
项目：
模块：厂商关系详细资料管理
日期：2002年11月16日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSBrowse, DB, ActnList, ToolWin, ComCtrls, Grids, DBGrids,
  QLDBGrid, ADODB,CommonDM,MSEdUser,WSEdit,MSEdUserTerm, ExtCtrls, StdCtrls,
  DBCtrls, Mask, Menus, QLDBLkp;

type
  TDAClientcBrowseForm = class(TWSBrowseForm)
    TabSheet2: TTabSheet;
    ToolButton3: TToolButton;
    RolePermissionsAction: TAction;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    adsOAJobRecords: TADODataSet;
    adsSaleRecord: TADODataSet;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    TabSheet3: TTabSheet;
    tsDAClient: TTabSheet;
    adsClearBillRecord: TADODataSet;
    adsDAClient: TADODataSet;
    adsOAJobRecordsID: TAutoIncField;
    adsOAJobRecordsCreateDate: TDateTimeField;
    adsOAJobRecordsCreateUserID: TIntegerField;
    adsOAJobRecordsRecordState: TStringField;
    adsOAJobRecordsDate: TDateTimeField;
    adsOAJobRecordsCode: TStringField;
    adsOAJobRecordsClient: TStringField;
    adsOAJobRecordsRecordAffair: TMemoField;
    adsOAJobRecordsMainDemand: TMemoField;
    adsOAJobRecordsProjectAmount: TBCDField;
    adsOAJobRecordsPlanDate: TDateTimeField;
    adsOAJobRecordsDoneDate: TDateTimeField;
    adsOAJobRecordsClientID: TIntegerField;
    adsOAJobRecordsMemo: TMemoField;
    adsOAJobRecordsPeriodID: TIntegerField;
    adsOAJobRecordsPeriodName: TStringField;
    adsDAClientID: TAutoIncField;
    adsDAClientCreateDate: TDateTimeField;
    adsDAClientCreateUserID: TIntegerField;
    adsDAClientRecordState: TStringField;
    adsDAClientName: TStringField;
    adsDAClientFullName: TStringField;
    adsDAClientAreaID: TIntegerField;
    adsDAClientAddress: TStringField;
    adsDAClientTelephone: TStringField;
    adsDAClientFax: TStringField;
    adsDAClientRegisterDate: TDateTimeField;
    adsDAClientRegisterCapital: TBCDField;
    adsDAClientCharter: TStringField;
    adsDAClientBossName: TStringField;
    adsDAClientRunRange: TStringField;
    adsDAClientCentralTax: TStringField;
    adsDAClientLandTax: TStringField;
    adsDAClientCorporation: TStringField;
    adsDAClientCertificates: TStringField;
    adsDAClientBankOpened: TStringField;
    adsDAClientClientType: TStringField;
    adsDAClientBankAccount: TStringField;
    adsDAClientMemo: TStringField;
    adsDAClientEMail: TStringField;
    adsDAClientWeb: TStringField;
    adsDAClientPostalCode: TStringField;
    pnlDAClient: TPanel;
    dsDAClient: TDataSource;
    adsSaleRecordid: TIntegerField;
    adsSaleRecordCode: TStringField;
    adsSaleRecordMemo: TStringField;
    adsSaleRecordtot: TBCDField;
    Panel2: TPanel;
    PageControl1: TPageControl;
    TabSheet9: TTabSheet;
    TabSheet10: TTabSheet;
    adsClearBillRecordID: TAutoIncField;
    adsClearBillRecordCreateDate: TDateTimeField;
    adsClearBillRecordCreateUserID: TIntegerField;
    adsClearBillRecordRecordState: TStringField;
    adsClearBillRecordDate: TDateTimeField;
    adsClearBillRecordCode: TStringField;
    adsClearBillRecordBillMode: TStringField;
    adsClearBillRecordModeDC: TIntegerField;
    adsClearBillRecordModeC: TIntegerField;
    adsClearBillRecordBrief: TStringField;
    adsClearBillRecordClientID: TIntegerField;
    adsClearBillRecordEmployeeID: TIntegerField;
    adsClearBillRecordClearDate: TDateTimeField;
    adsClearBillRecordAccountsID: TIntegerField;
    adsClearBillRecordAmountD: TBCDField;
    adsClearBillRecordAmountC: TBCDField;
    adsClearBillRecordAmountRed: TBCDField;
    adsClearBillRecordAmountBL: TBCDField;
    adsClearBillRecordMemo: TStringField;
    adsClearBillRecordBillAffix: TBytesField;
    adsClearBillRecordOriginID: TIntegerField;
    adsClearBillRecordOriginTable: TStringField;
    adsClearBillRecordPeriodID: TIntegerField;
    adsClearBillRecordaccounts: TStringField;
    adsSaleRecordDate: TDateTimeField;
    adsDAClientToAddress: TStringField;
    adsDAClientMobile: TStringField;
    adsDAClientEmlpoyeeID: TIntegerField;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label23: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    Label8: TLabel;
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
    DBEdit7: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit8: TDBEdit;
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
    tbDAArea: TADOTable;
    DsDAArea: TDataSource;
    EmployeeName: TADODataSet;
    DSEmployeeName: TDataSource;
    ToolButton1: TToolButton;
    EmployeeLKUP: TQLDBLookupComboBox;
    procedure AddNewActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure adsOAJobRecordsBeforePost(DataSet: TDataSet);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure adsDAClientBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure adsOAJobRecordsAfterPost(DataSet: TDataSet);
    procedure adsOAJobRecordsBeforeOpen(DataSet: TDataSet);
    procedure TabSheetShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FiltrateActionExecute(Sender: TObject);
  private
    vID: String;
    { Private declarations }
  protected
  public
    function Edit(const Params: Variant): Boolean; //override;
    { Public declarations }
  end;
var
  DAClientcBrowseForm: TDAClientcBrowseForm;

implementation

var
  vID: string;
{$R *.dfm}
function TDAClientcBrowseForm.Edit(const Params: Variant): Boolean;
begin
  vID := Format('%s', [VarToStr(Params)]);
  adsOAJobRecords.Parameters[0].Value := vID;
  adsSaleRecord.Parameters[0].Value := vID;
  adsClearBillRecord.Parameters[0].Value := vID;
  adsDAClient.Parameters[0].Value := vID;
  Result := ShowModal = mrOK;
end;

procedure TDAClientcBrowseForm.AddNewActionExecute(Sender: TObject);
begin
//  inherited;
{  DataSet.Append;
  with DBGrid do
  begin
    if dgRowSelect in Options then
      Options := Options - [dgRowSelect] ;
  end;
}
end;

procedure TDAClientcBrowseForm.DeleteActionExecute(Sender: TObject);
begin
//  inherited;

end;

procedure TDAClientcBrowseForm.EditActionExecute(Sender: TObject);
begin
//  inherited;

end;

procedure TDAClientcBrowseForm.adsOAJobRecordsBeforePost(DataSet: TDataSet);
begin
  inherited;
  adsOAJobRecords.FieldByName('LinkMenID').AsString := vID;
  adsOAJobRecords.FieldByName('RecordState').AsString := '临时';
end;

procedure TDAClientcBrowseForm.PageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
//  DALinkMenBrowseForm.Caption := Copy(DALinkMenBrowseForm.Caption,1,10) + ' - ' + PageControl.ActivePage.Caption;
  DAClientcBrowseForm.Caption := '客户资料管理 - ' + PageControl.ActivePage.Caption;
  with DBGrid do
    Options := Options + [dgRowSelect] ;
end;

procedure TDAClientcBrowseForm.adsDAClientBeforePost(DataSet: TDataSet);
begin
  inherited;
  adsOAJobRecords.FieldByName('LinkMenID').AsString := vID;
end;

procedure TDAClientcBrowseForm.FormShow(Sender: TObject);
begin
  inherited;
//  DALinkMenBrowseForm.Caption := '联系人管理 - ' + PageControl.ActivePage.Caption;
  PageControl.ActivePageIndex :=0  ;
  PageControl1.ActivePageIndex :=0 ;
  tbDAArea.Close;
  tbDAArea.Open;
  EmployeeName.Close;
  EmployeeName.Open;
end;

procedure TDAClientcBrowseForm.adsOAJobRecordsAfterPost(DataSet: TDataSet);
begin
  inherited;
  with DBGrid do
    Options := Options + [dgRowSelect] ;
end;

procedure TDAClientcBrowseForm.adsOAJobRecordsBeforeOpen(DataSet: TDataSet);
begin
  inherited;
//showmessage(adsOAJobRecords.CommandText);
end;

procedure TDAClientcBrowseForm.TabSheetShow(Sender: TObject);
begin
  inherited;
  if PageControl.ActivePage.Name = 'tsDAClient' then
    pnlDAClient.Visible := True
  else
    pnlDAClient.Visible := False;
end;

procedure TDAClientcBrowseForm.FormActivate(Sender: TObject);
begin
  inherited;
  TabSheetShow(sender);
end;

procedure TDAClientcBrowseForm.FiltrateActionExecute(Sender: TObject);
begin
  if PageControl.ActivePageIndex <>0 then
  inherited;

end;

end.
