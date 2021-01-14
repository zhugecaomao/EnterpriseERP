unit DAProjectEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, Mask, DBCtrls;

type
  TDAProjectEditForm = class(TWSStandardEditForm)
    tblSTEdWarehouse: TADOTable;
    dsSTEdWarehouse: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    QrProjectClass: TADOQuery;
    DsProjectClass: TDataSource;
    QrDAArea: TADOQuery;
    DsDAArea: TDataSource;
    Label5: TLabel;
    DBMemo1: TDBMemo;
    tblSTEdWarehouseID: TAutoIncField;
    tblSTEdWarehouseCreateDate: TDateTimeField;
    tblSTEdWarehouseCreateUserID: TIntegerField;
    tblSTEdWarehouseRecordState: TStringField;
    tblSTEdWarehouseName: TStringField;
    tblSTEdWarehouseUpID: TIntegerField;
    tblSTEdWarehouseLevelCode: TStringField;
    tblSTEdWarehouseMemo: TStringField;
    tblSTEdWarehouseAreaID: TIntegerField;
    DBLookupComboBox2: TDBLookupComboBox;
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
  DAProjectEditForm: TDAProjectEditForm;

implementation

uses CommonDM, WSSecurity;

{$R *.dfm}

function TDAProjectEditForm.Enter(const Params: Variant): Boolean;
begin
  tblSTEdWarehouse.Open;
  tblSTEdWarehouse.Insert;
  QrProjectClass.Parameters.ParamByName('Code').Value:='-1' ;
  QrProjectClass.Open;
  QrDAArea.Open;
  dblookupcombobox1.Field.AsInteger:=params;
  Result := ShowModal = mrOK;
end;

function TDAProjectEditForm.Edit(const Params: Variant): Boolean;
begin
  tblSTEdWarehouse.Open;
  tblSTEdWarehouse.Locate('ID',Params,[]);
  QrProjectClass.Parameters.ParamByName('Code').Value:='%'+trim(tblSTEdWarehouse.fieldbyname('LevelCode').AsString)+'%';
  QrProjectClass.Open;
  QrDAArea.Open;
  Result := ShowModal = mrOK;
end;

procedure TDAProjectEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblSTEdWarehouse.Close;
  QrProjectClass.close;
  QrDAArea.Close;
end;

procedure TDAProjectEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if tblSTEdWarehouse.State in [dsedit,dsinsert]  then   tblSTEdWarehouse.Post;
  ModalResult := mrOK;
end;

procedure TDAProjectEditForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  ModalResult :=mrCancel;
end;

procedure TDAProjectEditForm.tblSTEdWarehouseAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
//  dataset.FieldByName('HouseType').AsString:='втсп╡ж©Б';
end;

procedure TDAProjectEditForm.tblSTEdWarehouseBeforePost(DataSet: TDataSet);
begin
  inherited;
if dataset.FieldByName('Upid').IsNull   then
  dataset.FieldByName('Upid').AsInteger:=-1;
end;

procedure TDAProjectEditForm.FormShow(Sender: TObject);
begin
  inherited;
 dbedit1.SetFocus;
 dbedit1.SelLength:=0;
end;

end.
