unit DAEdAreas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, Mask, DBCtrls, DB, ADODB;

type
  TDAAreasEditForm = class(TWSStandardEditForm)
    lblName: TLabel;
    lbllocation: TLabel;
    DBEdit1: TDBEdit;
    dsDAEDAreas: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource2: TDataSource;
    tblDAEDAreas: TADOTable;
    ADOQuery1: TADOQuery;
    Label13: TLabel;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure tblDAEDAreasBeforePost(DataSet: TDataSet);
    procedure tblDAEDAreasFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter(const Params: Variant): Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  DAAreasEditForm: TDAAreasEditForm;

implementation

uses CommonDM,WSSecurity;

{$R *.dfm}

function TDAAreasEditForm.Enter(const Params: Variant): Boolean;
begin
tblDAEDAreas.Open;

tblDAEDAreas.Insert;
 adoquery1.Parameters.ParamByName('Code').Value:='²»´æÔÚ';
adoquery1.Open;
 dblookupcombobox1.Field.AsInteger:=params;
  Result := ShowModal = mrOK;
end;

function TDAAreasEditForm.Edit(const Params: Variant): Boolean;

begin
tblDAEDAreas.Open;
//adotable1.Open;

tblDAEDAreas.Locate('ID',params,[]);
adoquery1.Parameters.ParamByName('Code').Value:='%'+trim(tblDAEDAreas.fieldbyname('LevelCode').AsString)+'%';
adoquery1.Open;

Result := ShowModal = mrOK;
end;

procedure TDAAreasEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;

if tblDAEDAreas.State in [dsedit,dsinsert]
then   tblDAEDAreas.Post;

             ModalResult := mrOK;
end;

procedure TDAAreasEditForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
 ModalResult := mrCancel;

end;

procedure TDAAreasEditForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  tblDAEDAreas.Close;

end;

procedure TDAAreasEditForm.tblDAEDAreasBeforePost(DataSet: TDataSet);
begin
  inherited;

if dataset.State=dsinsert
then begin
       dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
     end;
if dataset.FieldByName('Upid').IsNull
then dataset.FieldByName('Upid').AsInteger:=-1;
end;

procedure TDAAreasEditForm.tblDAEDAreasFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TDAAreasEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
adoquery1.Close;
end;

procedure TDAAreasEditForm.FormShow(Sender: TObject);
begin
  inherited;
 dbedit1.SetFocus;
 dbedit1.SelLength:=0;
end;

end.
