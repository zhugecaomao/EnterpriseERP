unit OAEdJobArrange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, DBCtrls, Mask;

type
  TOAEdJobArrangeForm = class(TWSStandardEditForm)
    ADODataSet1: TADODataSet;
    DBComboBox1: TDBComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DataSource1: TDataSource;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label9: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure DBComboBox1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  OAEdJobArrangeForm: TOAEdJobArrangeForm;

implementation

uses CommonDM, WSSecurity, WSUtils;

{$R *.dfm}

function TOAEdJobArrangeForm.Edit(const Params: Variant): Boolean;
begin
  with ADODataSet1 do
  begin
    close;
    CommandText := 'select * from OAJobArrange where RecordState<>' + QuotedStr('É¾³ý') + ' and ID=' + Format('%s', [VarToStr(Params)]);
    open;
    first;
    edit;
  end;
  Result := ShowModal = mrOK;
end;

function TOAEdJobArrangeForm.Enter: Boolean;
begin
  with ADODataSet1 do
  begin
    close;
    CommandText := 'select * from OAJobArrange where 1=2';
    open;
    Append;
    FieldByName('Code').AsString := GetMaxCode('Code', 'OAJobArrange', number);
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

procedure TOAEdJobArrangeForm.FormCreate(Sender: TObject);
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

procedure TOAEdJobArrangeForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if ADODataSet1.State in [dsedit, dsinsert] then ADODataSet1.Post;
  ModalResult := mrOK;
end;

procedure TOAEdJobArrangeForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  if ADODataSet1.State in [dsedit, dsinsert] then ADODataSet1.Cancel;
end;

procedure TOAEdJobArrangeForm.DBComboBox1Change(Sender: TObject);
begin
  inherited;
  if DBComboBox1.ItemIndex <> -1 then
    ADODataSet1.FieldByName('ClientID').AsString := inttostr(Integer(DBComboBox1.items.Objects[DBComboBox1.ItemIndex]))
  else
    ADODataSet1.FieldByName('ClientID').AsString := '0';
end;

end.

