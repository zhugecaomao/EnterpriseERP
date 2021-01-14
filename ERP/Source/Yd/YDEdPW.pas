unit YDEdPW;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DBCtrls, Mask, DB, ADODB;

type
  TYDEdPWForm = class(TWSStandardEditForm)
    tblYDEdPW: TADODataSet;
    tblYDEdPWID: TAutoIncField;
    tblYDEdPWCreateDate: TDateTimeField;
    tblYDEdPWCreateUserID: TIntegerField;
    tblYDEdPWRecordState: TStringField;
    tblYDEdPWClass: TStringField;
    tblYDEdPWName: TStringField;
    tblYDEdPWPowerIndex: TBCDField;
    tblYDEdPWMemo: TStringField;
    dsYDEdPW: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    procedure OKButtonClick(Sender: TObject);
    procedure tblYDEdPWAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  YDEdPWForm: TYDEdPWForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}

function TYDEdPWForm.Enter: Boolean;
begin
  tblYDEdPW.open;
  tblYDEdPW.insert;
  Result := ShowModal = mrOK;
end;


function TYDEdPWForm.Edit(const Params: Variant): Boolean;
begin
    tblYDEdPW.open;
    tblydedpw.Locate('ID',params,[]);
    tblydedpw.Edit;
  Result := ShowModal = mrOK;
end;


procedure TYDEdPWForm.OKButtonClick(Sender: TObject);
begin
  inherited;
if tblYDEdPW.State in [dsedit,dsinsert]
then   tblYDEdPW.Post;

             ModalResult := mrOK;
end;

procedure TYDEdPWForm.tblYDEdPWAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dataset.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
end;

procedure TYDEdPWForm.FormShow(Sender: TObject);
begin
  inherited;
dbedit1.SetFocus;
dbedit1.SelLength:=0;
end;

end.
