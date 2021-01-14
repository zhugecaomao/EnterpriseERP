unit DAEdAccountCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, ExtCtrls, DB, ADODB, DBCtrls, Mask;

type
  TDAEdAccountCodeForm = class(TWSStandardEditForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    aqrDAAccountCode: TADOQuery;
    DBComboBox1: TDBComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBComboBox2: TDBComboBox;
    DBMemo1: TDBMemo;
    DataSource1: TDataSource;
    dsMSCurrency: TDataSource;
    procedure OKButtonClick(Sender: TObject);
    procedure aqrDAAccountCodeBeforePost(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function EnterNew(var Params: Variant): Boolean;
    function Edit(const Params: Variant): Boolean; override;
  end;

implementation

uses CommonDM, WSSecurity,DABrAccountCode;

{$R *.dfm}

function TDAEdAccountCodeForm.Edit(const Params: Variant): Boolean;
begin
  with aqrDAAccountCode do
  begin
    close;
    sql.Text := 'select * from DAAccountCode where ID=' +
      Format('%s', [VarToStr(Params)]);
    open;
    first;
    Edit;
  end;
  Result := ShowModal = mrOK;
end;

function TDAEdAccountCodeForm.Enter: Boolean;
begin
  with aqrDAAccountCode do
  begin
    close;
    sql.Text := 'select * from DAAccountCode where 1=0';
    open;
    Append;
  end;
  Result := ShowModal = mrOK;
end;

function TDAEdAccountCodeForm.EnterNew(var Params: Variant): Boolean;
begin
  with aqrDAAccountCode do
  begin
    close;
    sql.Text := 'select * from DAAccountCode where 1=0';
    open;
    Append;
  end;
  Result := ShowModal = mrOK;
  if Result then
    Params := aqrDAAccountCode.FieldByName('ID').Value;
end;

procedure TDAEdAccountCodeForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  aqrDAAccountCode.Post;
  ModalResult := mrOk;
end;

procedure TDAEdAccountCodeForm.aqrDAAccountCodeBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  if aqrDAAccountCode.State = dsinsert then
  begin
    aqrDAAccountCode.FieldByName('CreateUserID').AsInteger := Guarder.UserID;
  end;
end;

procedure TDAEdAccountCodeForm.FormCreate(Sender: TObject);
begin
  inherited;
  with CommonData.adsMSCurrency do
  begin
    Close;
    Open;
    Filtered := False;
    Filter := 'RecordState<>' + QuotedStr('删除');
    Filtered := True;
  end;
end;

procedure TDAEdAccountCodeForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
//var AccountPageID:integer;
begin
  inherited;
  {AccountPageID :=5;
  if DAEdAccountCodeForm.aqrDAAccountCode.FieldByName('BusinessType').AsString='资产类'
     then AccountPageID :=0;
  if DAEdAccountCodeForm.aqrDAAccountCode.FieldByName('BusinessType').AsString='负债类'
     then AccountPageID :=1;
  if DAEdAccountCodeForm.aqrDAAccountCode.FieldByName('BusinessType').AsString='权益类'
     then AccountPageID :=2;
  if DAEdAccountCodeForm.aqrDAAccountCode.FieldByName('BusinessType').AsString='损益类'
     then AccountPageID :=3;
  if DAEdAccountCodeForm.aqrDAAccountCode.FieldByName('BusinessType').AsString='费用成本类'
     then AccountPageID :=4;
  //表外科目类
  case AccountPageID of
    0:DABrAccountCodeForm.PageControl.ActivePageIndex :=0;
    1:DABrAccountCodeForm.PageControl.ActivePageIndex :=1;
    2:DABrAccountCodeForm.PageControl.ActivePageIndex :=2;
    3:DABrAccountCodeForm.PageControl.ActivePageIndex :=3;
    4:DABrAccountCodeForm.PageControl.ActivePageIndex :=4;
    5:DABrAccountCodeForm.PageControl.ActivePageIndex :=5;
  end;    }

end;

end.

