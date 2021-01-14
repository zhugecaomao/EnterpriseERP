unit OAEdJobRecords;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DBCtrls, Mask, DB, ADODB;

type
  TOAEdJobRecordsForm = class(TWSStandardEditForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBComboBox1: TDBComboBox;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    ADODataSet1ID: TAutoIncField;
    ADODataSet1CreateDate: TDateTimeField;
    ADODataSet1CreateUserID: TIntegerField;
    ADODataSet1RecordState: TStringField;
    ADODataSet1Date: TDateTimeField;
    ADODataSet1Code: TStringField;
    ADODataSet1Client: TStringField;
    ADODataSet1RecordAffair: TMemoField;
    ADODataSet1MainDemand: TMemoField;
    ADODataSet1ProjectAmount: TBCDField;
    ADODataSet1PlanDate: TDateTimeField;
    ADODataSet1DoneDate: TDateTimeField;
    ADODataSet1ClientID: TIntegerField;
    ADODataSet1Memo: TMemoField;
    ADODataSet1PeriodID: TIntegerField;
    procedure DBComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  OAEdJobRecordsForm: TOAEdJobRecordsForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}

function TOAEdJobRecordsForm.Edit(const Params: Variant): Boolean;
begin
  with ADODataSet1 do
  begin
    close;
    CommandText := 'select * from OAJobRecords where RecordState<>' + QuotedStr('É¾³ý') + ' and ID=' + Format('%s', [VarToStr(Params)]);
    open;
    first;
    edit;
  end;

  Result := ShowModal = mrOK;
end;

function TOAEdJobRecordsForm.Enter: Boolean;
begin
  with ADODataSet1 do
  begin
    close;
    CommandText := 'select * from OAJobRecords where 1=2';
    open;
    Append;
    FieldByName('Code').AsString := GetMaxCode('Code', 'OAJobRecords', number);
//    FieldByName('Date').AsString := FormatDateTime('yyyy-mm-dd', date());
    FieldByName('Date').Asdatetime := date;
    FieldByName('CreateUserID').AsInteger := Guarder.UserID;
    FieldByName('PeriodID').AsInteger := PeriodID;
    if DBComboBox1.Items.Count > 0 then
      DBComboBox1.ItemIndex := 0;
    if DBComboBox1.ItemIndex <> -1 then
    begin
      FieldByName('ClientID').AsString := inttostr(Integer(DBComboBox1.items.Objects[DBComboBox1.ItemIndex]));
      FieldByName('Client').AsString := DBComboBox1.Text;
    end
    else
      FieldByName('ClientID').AsString := '0';  
  end;
  Result := ShowModal = mrOK;
end;

procedure TOAEdJobRecordsForm.DBComboBox1Change(Sender: TObject);
begin
  inherited;
  if DBComboBox1.ItemIndex <> -1 then
    ADODataSet1.FieldByName('ClientID').AsString := inttostr(Integer(DBComboBox1.items.Objects[DBComboBox1.ItemIndex]))
  else
    ADODataSet1.FieldByName('ClientID').AsString := '0';
end;

procedure TOAEdJobRecordsForm.FormCreate(Sender: TObject);
var
  adoTemp: TADOQuery;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  with adoTemp do
  begin
    close;
    sql.Text := 'select * from DAClient where  RecordState<>' + QuotedStr('É¾³ý');
    open;
    first;
    DBComboBox1.Items.Clear;
    while not eof do
    begin
      DBComboBox1.Items.AddObject(fieldbyname('Name').AsString, pointer(FieldByName('ID').AsInteger));
      next;
    end;
  end;
end;

procedure TOAEdJobRecordsForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if ADODataSet1.State in [dsedit, dsinsert] then ADODataSet1.Post;
  ModalResult := mrOK;
end;

procedure TOAEdJobRecordsForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
if ADODataSet1.State in [dsedit, dsinsert] then ADODataSet1.Cancel;
end;

end.

