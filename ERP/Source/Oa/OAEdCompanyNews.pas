unit OAEdCompanyNews;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DBCtrls, Mask, DB, ADODB, Buttons;

type
  TOAEdCompanyNewsForm = class(TWSStandardEditForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    GroupBox1: TGroupBox;
    DBMemo1: TDBMemo;
    GroupBox2: TGroupBox;
    DBMemo2: TDBMemo;
    adsOACompanyNews: TADODataSet;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    adsDAAttribute: TADODataSet;
    adsDAAttribute1: TADODataSet;
    SpeedButton1: TSpeedButton;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  OAEdCompanyNewsForm: TOAEdCompanyNewsForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}

function TOAEdCompanyNewsForm.Edit(const Params: Variant): Boolean;
begin
  with adsOACompanyNews do
  begin
    close;
    CommandText := 'select * from OACompanyNews where RecordState<>' + QuotedStr('É¾³ý') + ' and ID=' + Format('%s', [VarToStr(Params)]);
    open;
    first;
    edit;
  end;
  Result := ShowModal = mrOK;
end;

function TOAEdCompanyNewsForm.Enter: Boolean;
begin
  with adsOACompanyNews do
  begin
    close;
    CommandText := 'select * from OACompanyNews where 1=2';
    open;
    Append;
    FieldByName('Code').AsString := GetMaxCode('Code', 'OACompanyNews', number);
//    FieldByName('Date').AsString := FormatDateTime('yyyy-mm-dd', date());
    FieldByName('Date').Asdatetime := date;
    FieldByName('CreateUserID').AsInteger := Guarder.UserID;
  end;
  Result := ShowModal = mrOK;
end;

procedure TOAEdCompanyNewsForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if adsOACompanyNews.State in [dsedit, dsinsert] then adsOACompanyNews.Post;
  ModalResult := mrOK;
end;

procedure TOAEdCompanyNewsForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
if adsOACompanyNews.State in [dsedit, dsinsert] then adsOACompanyNews.Cancel;
end;

procedure TOAEdCompanyNewsForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsDAAttribute.Close;
  adsDAAttribute.Open ;
  adsDAAttribute1.Close;
  adsDAAttribute1.Open ;
end;

end.

