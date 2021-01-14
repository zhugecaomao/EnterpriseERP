unit PCEdContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DBCtrls, Mask, DB, ADODB;

type
  TPCEdContractForm = class(TWSStandardEditForm)
    ADODataSet1: TADODataSet;
    ADODataSet1ID: TAutoIncField;
    ADODataSet1CreateDate: TDateTimeField;
    ADODataSet1CreateUserID: TIntegerField;
    ADODataSet1RecordState: TStringField;
    ADODataSet1Date: TDateTimeField;
    ADODataSet1Code: TStringField;
    ADODataSet1BargainAmount: TBCDField;
    ADODataSet1Provider: TStringField;
    ADODataSet1Client: TStringField;
    ADODataSet1ProviderDeputy: TStringField;
    ADODataSet1ClientDeputy: TStringField;
    ADODataSet1ClientID: TIntegerField;
    ADODataSet1MainClause: TMemoField;
    ADODataSet1AddClause: TMemoField;
    ADODataSet1StarDate: TDateTimeField;
    ADODataSet1ExpireDate: TDateTimeField;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label12: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit6: TDBEdit;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    DBMemo2: TDBMemo;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBComboBox1: TDBComboBox;
    Label7: TLabel;
    ADODataSet1caption: TStringField;
    DBComboBox2: TDBComboBox;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  PCEdContractForm: TPCEdContractForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}

function TPCEdContractForm.Edit(const Params: Variant): Boolean;
begin
  with ADODataSet1 do
  begin
    close;
    CommandText := 'select * from pcContract where RecordState<>' + QuotedStr('É¾³ý') + ' and ID=' + Format('%s', [VarToStr(Params)]);
    open;
    first;
    edit;
  end;
  Result := ShowModal = mrOK;
end;

function TPCEdContractForm.Enter: Boolean;
begin
  with ADODataSet1 do
  begin
    close;
    CommandText := 'select * from pcContract where 1=2';
    open;
    Append;
    FieldByName('Code').AsString := GetMaxCode('Code', 'PCContract', number);
//    FieldByName('Date').AsString := FormatDateTime('yyyy-mm-dd', date());
    FieldByName('Date').Asdatetime := date;
    FieldByName('CreateUserID').AsInteger := Guarder.UserID;
    FieldByName('Provider').AsString := CompanyName;
    if DBComboBox1.Items.Count > 0 then
      DBComboBox1.ItemIndex := 0;
    if DBComboBox1.ItemIndex <> -1 then
    begin
      FieldByName('ClientID').AsString := inttostr(Integer(DBComboBox1.items.Objects[DBComboBox1.ItemIndex]));
      FieldByName('Client').AsString := DBComboBox1.Text ;
      end
    else
      FieldByName('ClientID').AsString := '0';

  end;
  Result := ShowModal = mrOK;
end;

procedure TPCEdContractForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if ADODataSet1.State in [dsedit, dsinsert] then ADODataSet1.Post;
  ModalResult := mrOK;
end;

procedure TPCEdContractForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  if ADODataSet1.State in [dsedit, dsinsert] then ADODataSet1.Cancel;
end;

procedure TPCEdContractForm.FormCreate(Sender: TObject);
var
  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    close;
    sql.Text := 'select Id, name from DAClient where  RecordState<>'
        + QuotedStr('É¾³ý');
    open;
    first;
    DBComboBox1.Items.Clear;
    while not eof do
    begin
      DBComboBox1.Items.AddObject(fieldbyname('Name').AsString, pointer(FieldByName('ID').AsInteger));
      next;
    end;
    close;
    sql.Text := 'select distinct caption from pcContract ';
    open;
    first;
    DBComboBox2.Items.Clear;
    while not eof do
    begin
      DBComboBox2.Items.Add(adoTemp.fieldbyname('caption').AsString );
      next;
    end;
  end;
end;

procedure TPCEdContractForm.DBComboBox1Change(Sender: TObject);
begin
  inherited;
  if DBComboBox1.ItemIndex <> -1 then
    ADODataSet1.FieldByName('ClientID').AsString := inttostr(Integer(DBComboBox1.items.Objects[DBComboBox1.ItemIndex]))
  else  ADODataSet1.FieldByName('ClientID').AsString := '0';

end;

end.

