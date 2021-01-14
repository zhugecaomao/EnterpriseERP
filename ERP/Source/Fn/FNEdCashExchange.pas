unit FNEdCashExchange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, GEdit,
  QLDBLkp, Buttons;

type
  TFNEdCashExchangeForm = class(TBaseVoucherEditAForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ClientName: TADODataSet;
    EmployeeName: TADODataSet;
    DBEdit2: TDBEdit;
    adsAccounts: TADODataSet;
    dsAccounts: TDataSource;
    DSClientName: TDataSource;
    DSEmployeeName: TDataSource;
    ClientQLDBLookup: TQLDBLookupComboBox;
    EmployeeLookup: TQLDBLookupComboBox;
    DBEdit1: TDBEdit;
    adsMaster: TADODataSet;
    adsDetail: TADODataSet;
    Label8: TLabel;
    Label6: TLabel;
    adsMasterID: TAutoIncField;
    adsMasterCreateDate: TDateTimeField;
    adsMasterCreateUserID: TIntegerField;
    adsMasterRecordState: TStringField;
    adsMasterDate: TDateTimeField;
    adsMasterCode: TStringField;
    adsMasterBillMode: TStringField;
    adsMasterBrief: TStringField;
    adsMasterClientID: TIntegerField;
    adsMasterEmployeeID: TIntegerField;
    adsMasterOriginID: TIntegerField;
    adsMasterOriginTable: TStringField;
    adsMasterPeriodID: TIntegerField;
    adsMasterMemo: TStringField;
    adsMasterBillAffix: TBytesField;
    adsMasterEmployee: TStringField;
    adsMasterClient: TStringField;
    adsBrief: TADODataSet;
    adsMasterAmountD: TBCDField;
    adsMasterAmountC: TBCDField;
    Label7: TLabel;
    Label9: TLabel;
    LookUpAccount: TQLDBLookupComboBox;
    adsMasterAccountsID: TIntegerField;
    adsMasterAmountBL: TBCDField;
    adsMasterAmountRed: TBCDField;
    adsMasterModeDC: TIntegerField;
    adsMasterModeC: TIntegerField;
    adsMasterClearDate: TDateTimeField;
    BriefComboBox: TDBComboBox;
    adsDetailID: TAutoIncField;
    adsDetailMasterID: TIntegerField;
    adsDetailPoClearID: TIntegerField;
    adsDetailCheckNo: TStringField;
    adsDetailBillCode: TStringField;
    adsDetailAmount: TBCDField;
    adsDetailBillTypeID: TIntegerField;
    adsDetailOriginID: TIntegerField;
    adsDetailGoodsID: TIntegerField;
    adsDetailProjectID: TIntegerField;
    adsDetailMemo: TStringField;
    adsDetailOriginTable: TStringField;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    adsMasterAmountOrigin: TBCDField;
    adsMasterAmountRate: TFloatField;
    AmountRateButton: TButton;
    LocalAmountButton: TButton;
    adsDetailClientID: TIntegerField;
    adsDetailExpenseID: TIntegerField;
    TempADS: TADODataSet;
    RelationClientAds: TADODataSet;
    RelationClientDs: TDataSource;
    adsDetailReLationClient: TStringField;
    RelationClientLkup: TQLDBLookupComboBox;
    GetLocalAmountAct: TAction;
    N41: TMenuItem;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure adsDetailPoClearIDChange(Sender: TField);
    procedure FormActivate(Sender: TObject);
    procedure ClientQLDBLookupExit(Sender: TObject);
    procedure AmountRateButtonClick(Sender: TObject);
    procedure LocalAmountButtonClick(Sender: TObject);
    procedure DBEdit4Exit(Sender: TObject);
    procedure GetLocalAmountActExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  FNEdCashExchangeForm: TFNEdCashExchangeForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
procedure TFNEdCashExchangeForm.New;
begin
  inherited;
  adsMaster.FieldByName('Date').AsDateTime :=date;
  adsMaster.FieldByName('Code').AsString:=GetMaxCode('Code','FNCashExchangeMaster',number);
  adsMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
  adsMaster.FieldByName('BillMode').AsString:='外币兑换';
  adsMaster.FieldByName('ModeDC').AsInteger :=1;
  adsMaster.FieldByName('ModeC').AsInteger :=1;
  adsMaster.FieldByName('OriginTable').AsString:='FNCashExchangeMaster';
  adsMaster.FieldByName('AmountC').AsFloat :=0;
end;

procedure TFNEdCashExchangeForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);

end;


procedure TFNEdCashExchangeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsMaster.Close;
  adsDetail.Close;
  ClientName.Close;
  EmployeeName.Close;
//  RelationClientADS.Close;
  adsAccounts.Close;
//  AdsProject.Close;
  adsBrief.Close;
end;

procedure TFNEdCashExchangeForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'FNCashExchange';
  ClientName.Open;
  EmployeeName.Open;
  RelationClientADS.Open;
  adsAccounts.Open;
//  AdsProject.Open;
  adsBrief.Close;
  adsBrief.CommandText :=' select distinct Brief from FNCashExchangeMaster';
  adsBrief.Open;
  adsBrief.first;
  while not adsBrief.Eof do
  begin
    BriefComboBox.Items.Add(adsBrief.fieldbyname('Brief').AsString);
    adsBrief.Next;
  end;
  if  adsBrief.IsEmpty then  BriefComboBox.Items.Add('外币兑换');
end;

procedure TFNEdCashExchangeForm.adsDetailPoClearIDChange(Sender: TField);
begin
  inherited;
  adsDetail.Edit;
  if (adsDetail.FieldByName('Amount').IsNull) or (adsDetail.FieldByName('Amount').AsFloat=0)
    then adsDetail.FieldByName('Amount').AsFloat  := adsMaster.FieldByName('AmountD').AsFloat;
end;

procedure TFNEdCashExchangeForm.FormActivate(Sender: TObject);
begin
  inherited;
  BriefComboBox.SetFocus;
end;

procedure TFNEdCashExchangeForm.ClientQLDBLookupExit(Sender: TObject);
var StrAccountOutID,StrAccountInID:String;
begin
  inherited;
  if (adsMaster.FieldByName('AccountsID').IsNull) or (adsMaster.FieldByName('ClientID').IsNull)
    then Exit;
  if adsAccounts.FieldByName('IsLocation').Value=ClientName.FieldByName('IsLocation').Value
  then begin
    showmessage('外币兑换的帐户选择有错误，必须一个为外币帐户，一个为兑换帐户');
  end else
  begin
    if adsMaster.FieldByName('ClientID').IsNull then StrAccountOutID :='-1'
      else StrAccountOutID :=adsMaster.FieldByName('ClientID').AsString;
    if adsMaster.FieldByName('AccountsID').IsNull then StrAccountInID :='-1'
      else StrAccountInID :=adsMaster.FieldByName('AccountsID').AsString;
    TempADS.Close;
    TempADS.CommandText :=' select  a.ID, a.Name, b.IsLocation, '
      +' b.name Currency from dbo.FNAccounts a  '
      +' left outer join dbo.MSCurrency b on b.ID=a.CurrencyID '
      +' where b.IsLocation<>1 '
      +' and ( a.ID ='+StrAccountOutID
      +' or a.ID= '+StrAccountInID+' ) ';
    TempADS.Open;
    Label4.Caption :=Trim(TempADS.FieldByName('Currency').AsString)+'原币金额';
    if TempADS.FieldByName('ID').IsNull then StrAccountOutID :='-1'
      else StrAccountOutID :=TempADS.FieldByName('ID').AsString;

    TempADS.Close;
    TempADS.CommandText :=' select * from ( '
      +' select  Date, AmountRate  '
      +' from FNCashExchangeMaster '
      +' where ReCordstate<>'+Quotedstr('删除')
      +' and ClientID ='+StrAccountOutID
      +' union all '
      +' select  Date, AmountRate  '
      +' from FNCashExchangeMaster '
      +' where ReCordstate<>'+Quotedstr('删除')
      +' and AccountsID ='+StrAccountOutID
      +'  ) as a order by Date Desc ';
    TempADS.Open;
    adsMaster.Edit;
    if not TempADS.FieldByName('AmountRate').IsNull then
      adsMaster.FieldByName('AmountRate').AsFloat :=TempADS.FieldByName('AmountRate').AsFloat;

  end;
end;

procedure TFNEdCashExchangeForm.AmountRateButtonClick(Sender: TObject);
begin
  inherited;
  if adsMaster.FieldByName('AmountOrigin').IsNull
    then exit;
  adsMaster.edit;
  adsMaster.FieldByName('AmountRate').AsFloat :=
    adsMaster.FieldByName('AmountD').AsFloat /adsMaster.FieldByName('AmountOrigin').AsFloat
end;

procedure TFNEdCashExchangeForm.LocalAmountButtonClick(Sender: TObject);
begin
  inherited;
  if (adsMaster.FieldByName('AmountRate').IsNull) or (adsMaster.FieldByName('AmountOrigin').IsNull)
    then exit;
  adsMaster.edit;
  adsMaster.FieldByName('AmountD').AsFloat :=
    adsMaster.FieldByName('AmountRate').AsFloat*adsMaster.FieldByName('AmountOrigin').AsFloat
end;

procedure TFNEdCashExchangeForm.DBEdit4Exit(Sender: TObject);
begin
  inherited;
  LocalAmountButtonClick(sender);
end;

procedure TFNEdCashExchangeForm.GetLocalAmountActExecute(Sender: TObject);
begin
  inherited;
  adsDetail.edit;
  adsDetail.FieldByName('Amount').AsFloat := adsMaster.FieldByName('AmountD').AsFloat;
end;

end.
