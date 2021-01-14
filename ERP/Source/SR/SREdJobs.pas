unit SREdJobs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, DBCtrls, Mask;

type
  TSREdJobsForm = class(TWSStandardEditForm)
    tblDAEdPOClear: TADOTable;
    tblDAEdPOClearID: TAutoIncField;
    tblDAEdPOClearCreateDate: TDateTimeField;
    tblDAEdPOClearCreateUserID: TIntegerField;
    tblDAEdPOClearRecordState: TStringField;
    tblDAEdPOClearName: TStringField;
    tblDAEdPOClearMemo: TStringField;
    dsDAEdPOClear: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    tblDAEdPOClearBrief: TStringField;
    DBComboBox1: TDBComboBox;
    AdsBrief: TADODataSet;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    tblDAEdPOClearPriceBase: TBCDField;
    procedure OKButtonClick(Sender: TObject);
    procedure tblDAEdPOClearBeforePost(DataSet: TDataSet);
    procedure tblDAEdPOClearFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  SREdJobsForm: TSREdJobsForm;

implementation

uses CommonDM, WSSecurity;

{$R *.dfm}

function TSREdJobsForm.Enter: Boolean;
begin
  tblDAEdPOClear.Open;
  tblDAEdPOClear.Insert;
  Result := ShowModal = mrOK;
end;
function TSREdJobsForm.Edit(const Params: Variant): Boolean;
begin
  tblDAEdPOClear.Open;
  tblDAEdPOClear.Locate('ID',Params,[]);
  Result := ShowModal = mrOK;
end;
procedure TSREdJobsForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if  tblDAEdPOClear.State in  [dsedit,dsinsert]then
  tblDAEdPOClear.Post;
  modalresult:=mrok;
end;

procedure TSREdJobsForm.tblDAEdPOClearBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dataset.State=dsinsert
  then dataset.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
end;

procedure TSREdJobsForm.tblDAEdPOClearFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='删除');
end;

procedure TSREdJobsForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  modalresult:=mrcancel;
end;

procedure TSREdJobsForm.FormShow(Sender: TObject);
begin
  inherited;
  DBComboBox1.SetFocus;
//  dbedit1.SelLength:=0;
  AdsBrief.Close;
  AdsBrief.CommandText := ' select Distinct Brief from SrJobs'  ;
  AdsBrief.Open;
  AdsBrief.First;
  while not AdsBrief.Eof do
  begin
    DBComboBox1.Items.Add(AdsBrief.fieldbyname('Brief').AsString);
    AdsBrief.Next;
  end;
  if AdsBrief.IsEmpty then   DBComboBox1.Items.Add('计件类别');
end;

end.
