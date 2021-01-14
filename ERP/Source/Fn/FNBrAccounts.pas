unit FNBrAccounts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, ToolWin, ComCtrls, Grids,
  DBGrids, QLDBGrid, ADODB,WSEdit, ExtCtrls, Menus;

type
  TFNBrAccountsForm = class(TWSStandardBrowseForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    tblFNAccountsBr: TADODataSet;
    tblFNAccountsBrID: TAutoIncField;
    tblFNAccountsBrCreateDate: TDateTimeField;
    tblFNAccountsBrCreateUserID: TIntegerField;
    tblFNAccountsBrRecordState: TStringField;
    tblFNAccountsBrCurrencyID: TIntegerField;
    tblFNAccountsBrDSDesigner: TStringField;
    tblFNAccountsBrDSDesigner2: TStringField;
    tblFNAccountsBrDSDesigner3: TStringField;
    tblFNAccountsBrDSDesigner5: TDateTimeField;
    tblFNAccountsBrDSDesigner6: TStringField;
    tblFNAccountsBrDSDesigner7: TStringField;
    tblFNAccountsBrDSDesigner8: TStringField;
    tblFNAccountsBrDSDesigner9: TStringField;
    tblFNAccountsBrDSDesigner10: TStringField;
    tblFNAccountsBrDSDesigner11: TBlobField;
    tblFNAccountsBrDSDesigner12: TStringField;
    tblFNAccountsBrDSDesigner4: TStringField;
    tblFNAccountsBrDSDesigner13: TStringField;
    tblFNAccountsBrDSDesigner14: TStringField;
    ToolButton14: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblFNAccountsBrFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure DeleteActionExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      protected
      function CreateEditForm: TWSEditForm; override;

  end;

var
  FNBrAccountsForm: TFNBrAccountsForm;

implementation

uses CommonDM, FNEdAccounts;

{$R *.dfm}


function TFNBrAccountsForm.CreateEditForm: TWSEditForm;
begin
  Result := TFNEditAccountsForm.Create(Application);
end;

procedure TFNBrAccountsForm.FormCreate(Sender: TObject);
var
  aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    Close;
    sql.Text := ' select top 1 * from MSCurrency where IsLocation=1 and '
      +' RecordState<>' +QuotedStr('删除');
    open;
    if aqrTemp.IsEmpty then
    begin
      aqrTemp.Close;
      aqrTemp.sql.Text := ' Insert Into MSCurrency (IsLocation,Name) '
        +' Values ( 1,'+QuotedStr('人民币')+' )';
      aqrTemp.ExecSQL;
    end;
    Close;
    sql.Text := ' select top 1 * from FNAccounts where RecordState<>'
      +QuotedStr('删除');
    open;
    if aqrTemp.IsEmpty then
    begin
      aqrTemp.Close;
      aqrTemp.sql.Text :=' Insert Into FNAccounts (CurrencyID,Name,'
        +' AccountType) '+' Values ( 1,'+QuotedStr('业主资金帐户')
        +' , '+QuotedStr('业主资金')+' )';
      aqrTemp.ExecSQL;
    end;
  end;
  tblFNAccountsBr.open;
  inherited;
end;

procedure TFNBrAccountsForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblFNAccountsBr.close;
  action:=cafree;
end;

procedure TFNBrAccountsForm.tblFNAccountsBrFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='删除');
end;

procedure TFNBrAccountsForm.DeleteActionExecute(Sender: TObject);
begin
  inherited;
  tblFNAccountsBr.Requery();
end;

end.
