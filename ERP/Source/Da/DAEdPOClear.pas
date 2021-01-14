unit DAEdPOClear;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, DBCtrls, Mask;

type
  TDAEdPOClearForm = class(TWSStandardEditForm)
    tblDAEdPOClear: TADOTable;
    tblDAEdPOClearID: TAutoIncField;
    tblDAEdPOClearCreateDate: TDateTimeField;
    tblDAEdPOClearCreateUserID: TIntegerField;
    tblDAEdPOClearRecordState: TStringField;
    tblDAEdPOClearName: TStringField;
    tblDAEdPOClearMemo: TStringField;
    dsDAEdPOClear: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBMemo1: TDBMemo;
    tblDAEdPOClearBrief: TStringField;
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
  DAEdPOClearForm: TDAEdPOClearForm;

implementation

uses CommonDM, WSSecurity;

{$R *.dfm}

function TDAEdPOClearForm.Enter: Boolean;
begin
   tblDAEdPOClear.Open;
   tblDAEdPOClear.Insert;
  Result := ShowModal = mrOK;
end;
function TDAEdPOClearForm.Edit(const Params: Variant): Boolean;
begin
   tblDAEdPOClear.Open;
   tblDAEdPOClear.Locate('ID',Params,[]);
   

  Result := ShowModal = mrOK;
end;
procedure TDAEdPOClearForm.OKButtonClick(Sender: TObject);
begin
  inherited;
if  tblDAEdPOClear.State in  [dsedit,dsinsert]then
tblDAEdPOClear.Post;
 modalresult:=mrok;
end;

procedure TDAEdPOClearForm.tblDAEdPOClearBeforePost(DataSet: TDataSet);
begin
  inherited;
if dataset.State=dsinsert
then dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
end;

procedure TDAEdPOClearForm.tblDAEdPOClearFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TDAEdPOClearForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
 modalresult:=mrcancel;
end;

procedure TDAEdPOClearForm.FormShow(Sender: TObject);
begin
  inherited;
dbedit1.SetFocus;
dbedit1.SelLength:=0;
end;

end.
