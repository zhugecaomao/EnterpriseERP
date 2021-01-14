unit DAEdWarehouse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, Mask, DBCtrls;

type
  TDAEdWarehouseForm = class(TWSStandardEditForm)
    tblSTEdWarehouse: TADOTable;
    tblSTEdWarehouseID: TAutoIncField;
    tblSTEdWarehouseCreateDate: TDateTimeField;
    tblSTEdWarehouseCreateUserID: TIntegerField;
    tblSTEdWarehouseRecordState: TStringField;
    tblSTEdWarehouseName: TStringField;
    tblSTEdWarehouseCode: TStringField;
    tblSTEdWarehouseUpid: TIntegerField;
    tblSTEdWarehouseMemo: TStringField;
    tblSTEdWarehouseLevelCode: TStringField;
    tblSTEdWarehouseLeaderID: TIntegerField;
    tblSTEdWarehouseAddress: TStringField;
    tblSTEdWarehousePhoneFax: TStringField;
    tblSTEdWarehouseEmail: TStringField;
    tblSTEdWarehouseWeb: TStringField;
    dsSTEdWarehouse: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    Label5: TLabel;
    Label11: TLabel;
    tblSTEdWarehouseHouseType: TStringField;
    DBComboBox1: TDBComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure tblSTEdWarehouseAfterInsert(DataSet: TDataSet);
    procedure tblSTEdWarehouseBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter(const Params: Variant): Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  DAEdWarehouseForm: TDAEdWarehouseForm;

implementation

uses CommonDM, WSSecurity;

{$R *.dfm}

function TDAEdWarehouseForm.Enter(const Params: Variant): Boolean;
begin
  tblSTEdWarehouse.Open;
  tblSTEdWarehouse.Insert;
  adoquery1.Parameters.ParamByName('Code').Value:='-1' ;
  adoquery1.Open;
  adoquery2.Open;
  dblookupcombobox1.Field.AsInteger:=params;
  Result := ShowModal = mrOK;
end;

function TDAEdWarehouseForm.Edit(const Params: Variant): Boolean;
begin
  tblSTEdWarehouse.Open;
  tblSTEdWarehouse.Locate('ID',Params,[]);
  adoquery1.Parameters.ParamByName('Code').Value:='%'+trim(tblSTEdWarehouse.fieldbyname('LevelCode').AsString)+'%';
  adoquery1.Open;
  adoquery2.Open;
  Result := ShowModal = mrOK;
end;

procedure TDAEdWarehouseForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblSTEdWarehouse.Close;
  adoquery1.close;
  adoquery2.Close;
end;

procedure TDAEdWarehouseForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if tblSTEdWarehouse.State in [dsedit,dsinsert]  then   tblSTEdWarehouse.Post;
  ModalResult := mrOK;
end;

procedure TDAEdWarehouseForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  ModalResult :=mrCancel;
end;

procedure TDAEdWarehouseForm.tblSTEdWarehouseAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
  dataset.FieldByName('HouseType').AsString:='втсп╡ж©Б';
end;

procedure TDAEdWarehouseForm.tblSTEdWarehouseBeforePost(DataSet: TDataSet);
begin
  inherited;
if dataset.FieldByName('Upid').IsNull   then
  dataset.FieldByName('Upid').AsInteger:=-1;
end;

procedure TDAEdWarehouseForm.FormShow(Sender: TObject);
begin
  inherited;
 dbedit1.SetFocus;
dbedit1.SelLength:=0;
end;

end.
