unit STEdCountOff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, QLDBLkp;

type
  TSTEdCountOffForm = class(TBaseVoucherEditForm)
    tblSTCountOffDetail: TADODataSet;
    tblSTCountOffMaster: TADODataSet;
    tblSTCountOffMasterID: TAutoIncField;
    tblSTCountOffMasterCreateDate: TDateTimeField;
    tblSTCountOffMasterCreateUserID: TIntegerField;
    tblSTCountOffMasterRecordState: TStringField;
    tblSTCountOffMasterDate: TDateTimeField;
    tblSTCountOffMasterCode: TStringField;
    tblSTCountOffMasterBrief: TStringField;
    tblSTCountOffMasterEmployeID: TIntegerField;
    tblSTCountOffMasterCountManID: TIntegerField;
    tblSTCountOffMasterCheckID: TIntegerField;
    tblSTCountOffMasterMemo: TStringField;
    tblSTCountOffMasterEmployeeName: TStringField;
    tblSTCountOffMasterCountManName: TStringField;
    tblSTCountOffMasterCheckName: TStringField;
    EmployeeName: TADODataSet;
    tblSTCountOffDetailID: TAutoIncField;
    tblSTCountOffDetailMasterID: TIntegerField;
    tblSTCountOffDetailWarehouseID: TIntegerField;
    tblSTCountOffDetailGoodsID: TIntegerField;
    tblSTCountOffDetailSpec: TStringField;
    tblSTCountOffDetailCountQuantity: TBCDField;
    tblSTCountOffDetailCountUnitID: TIntegerField;
    tblSTCountOffDetailCountGoalQuantity: TBCDField;
    tblSTCountOffDetailQuantity: TBCDField;
    tblSTCountOffDetailUnitID: TIntegerField;
    tblSTCountOffDetailGoalQuantity: TBCDField;
    tblSTCountOffDetailEmployeID: TIntegerField;
    tblSTCountOffDetailCountManID: TIntegerField;
    tblSTCountOffDetailCheckID: TIntegerField;
    tblSTCountOffDetailMemo: TStringField;
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Button1: TButton;
    Temp: TADODataSet;
    Warehouse: TADODataSet;
    tblSTCountOffDetailWarehouseName: TStringField;
    WarehouseID: TAutoIncField;
    WarehouseCreateDate: TDateTimeField;
    WarehouseCreateUserID: TIntegerField;
    WarehouseRecordState: TStringField;
    WarehouseName: TStringField;
    WarehouseCode: TStringField;
    WarehouseUpid: TIntegerField;
    WarehouseMemo: TStringField;
    WarehouseLevelCode: TStringField;
    WarehouseLeaderID: TIntegerField;
    WarehouseAddress: TStringField;
    WarehousePhoneFax: TStringField;
    WarehouseEmail: TStringField;
    WarehouseWeb: TStringField;
    EmployeeName1: TADODataSet;
    dsWarehouse: TDataSource;
    tblSTCountOffDetailEmployeeName: TStringField;
    tblSTCountOffDetailCountName: TStringField;
    tblSTCountOffDetailCheckName: TStringField;
    GoodName: TADODataSet;
    tblSTCountOffDetailGoodName: TStringField;
    UnitName: TADODataSet;
    tblSTCountOffDetailCountUnitName: TStringField;
    tblSTCountOffDetailUnitName: TStringField;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  STEdCountOffForm: TSTEdCountOffForm;

implementation

uses WSUtils, WSSecurity, CommonDM;

{$R *.dfm}

procedure TSTEdCountOffForm.New;
begin
EmployeeName.Open;

Warehouse.Open;
goodname.Open;

Unitname.Open;
employeename1.Open;

  inherited;
 MasterDataSource.DataSet.FieldByName('Date').AsDateTime:=date;
MasterDataSource.DataSet.FieldByName('Code').AsString:=GetMaxCode('Code','STHouseOutMaster',number);
MasterDataSource.DataSet.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;


end;

procedure TSTEdCountOffForm.Open(VoucherID: Integer);
begin
EmployeeName.Open;
goodname.Open;
Unitname.Open;
employeename1.Open;
Warehouse.Open;
  inherited Open(VoucherID);
end;

procedure TSTEdCountOffForm.FormCreate(Sender: TObject);
begin
  inherited;
VoucherTableName := 'STCountOff';
end;

procedure TSTEdCountOffForm.Button1Click(Sender: TObject);
var
i:integer;
begin
  inherited;
if not tblSTCountOffDetail.IsEmpty
then  if   messagebox(handle,'已 经 有 数 据 存 在, 是 否 重 新 盘 点 ?','警 告', MB_OKCANCEL+MB_ICONQUESTION)=IDCANCEL
      then abort
      else begin
             tblSTCountOffDetail.DisableControls;
             tblSTCountOffDetail.First;
             while not tblSTCountOffDetail.Eof do
             tblSTCountOffDetail.Delete;
             tblSTCountOffDetail.EnableControls;
           end;
    tblSTCountOffDetail.Cancel;

    temp.Open;

    temp.First;
   for i:=1 to temp.RecordCount do
    begin
      tblSTCountOffDetail.Insert;
      tblSTCountOffDetail.FieldByName('WarehouseID').AsInteger       :=        temp.FieldByName('WarehouseID').AsInteger;
      tblSTCountOffDetail.FieldByName('GoodsID').AsInteger           :=        temp.FieldByName('GoodsID').AsInteger;
      tblSTCountOffDetail.FieldByName('CountQuantity').AsInteger     :=        temp.FieldByName('GoalUnitID').AsInteger ;
      tblSTCountOffDetail.FieldByName('CountGoalQuantity').AsFloat :=        temp.FieldByName('CountGoalQuantity').AsFloat;
      tblSTCountOffDetail.Post;
      temp.Next;
    end;

  
 end;
procedure TSTEdCountOffForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
EmployeeName.Close;
goodname.close;
Unitname.close;
employeename1.close;
Warehouse.Close;
end;

procedure TSTEdCountOffForm.FormShow(Sender: TObject);
begin
  inherited;
dblookupcombobox1.SetFocus;
end;

end.












