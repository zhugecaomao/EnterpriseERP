unit STEdHouseMove;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, QLDBLkp;

type
  TSTEdHouseMoveForm = class(TBaseVoucherEditForm)
    Label1: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    adsSTHouseMoveDetail: TADODataSet;
    adsSTHouseMoveMaster: TADODataSet;
    adsSTHouseMoveMasterID: TAutoIncField;
    adsSTHouseMoveMasterCreateDate: TDateTimeField;
    adsSTHouseMoveMasterCreateUserID: TIntegerField;
    adsSTHouseMoveMasterRecordState: TStringField;
    adsSTHouseMoveMasterDate: TDateTimeField;
    adsSTHouseMoveMasterCode: TStringField;
    adsSTHouseMoveMasterEmployeeID: TIntegerField;
    adsSTHouseMoveMasterMemo: TStringField;
    adsSTHouseMoveDetailID: TAutoIncField;
    adsSTHouseMoveDetailMasterID: TIntegerField;
    adsSTHouseMoveDetailGoodsID: TIntegerField;
    adsSTHouseMoveDetailSpec: TStringField;
    adsSTHouseMoveDetailUnitID: TIntegerField;
    adsSTHouseMoveDetailQuantity: TBCDField;
    adsSTHouseMoveDetailGoalUnitID: TIntegerField;
    adsSTHouseMoveDetailGoalQuantity: TBCDField;
    adsSTHouseMoveDetailGoalCost: TBCDField;
    adsSTHouseMoveDetailWarehouseIDIn: TIntegerField;
    adsSTHouseMoveDetailWarehouseIDOut: TIntegerField;
    adsSTHouseMoveDetailMemo: TStringField;
    ADODataSet1: TADODataSet;
    DataSource1: TDataSource;
    adsSTHouseMoveDetailGoodsName: TStringField;
    adsSTHouseMoveDetailSpecN: TStringField;
    adsSTWarehouse: TADODataSet;
    dsSTWarehouse: TDataSource;
    adsSTHouseMoveDetailWInName: TStringField;
    adsSTWarehouse2: TADODataSet;
    dsSTWarehouse2: TDataSource;
    adsSTHouseMoveDetailWOutName: TStringField;
    adsSTHouseMoveDetailUnitName: TStringField;
    DataSource3: TDataSource;
    ADOTable4: TADOTable;
    ADOTable4ID: TAutoIncField;
    ADOTable4Name: TStringField;
    ADOTable4ExchangeRate: TStringField;
    ADOTable4GoalUnitID: TIntegerField;
    ADOTable4IsGoalUnit: TBooleanField;
    ADOTable4RecordState: TStringField;
    ADOTable3: TADOTable;
    ADOTable3ID: TAutoIncField;
    ADOTable3CreateDate: TDateTimeField;
    ADOTable3CreateUserID: TIntegerField;
    ADOTable3RecordState: TStringField;
    ADOTable3Name: TStringField;
    ADOTable3Code: TStringField;
    ADOTable3Spec: TStringField;
    ADOTable3BarCode: TStringField;
    ADOTable3GoodsClassID: TIntegerField;
    ADOTable3UnitID: TIntegerField;
    ADOTable3StockMax: TBCDField;
    ADOTable3StockMin: TBCDField;
    ADOTable3PricePurchase: TBCDField;
    ADOTable3PriceSales: TBCDField;
    ADOTable3GoodsPictrue2: TBlobField;
    adoTmp: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure adsSTHouseMoveDetailGoodsIDChange(Sender: TField);
    procedure adsSTHouseMoveDetailWarehouseIDInChange(Sender: TField);
    procedure adsSTHouseMoveDetailWarehouseIDOutChange(Sender: TField);
    procedure ADOTable4FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure ADOTable3FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure adsSTHouseMoveDetailUnitIDChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  STEdHouseMoveForm: TSTEdHouseMoveForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}

procedure TSTEdHouseMoveForm.New;
begin
  inherited;
  adsSTHouseMoveMaster.FieldByName('EmployeeID').AsInteger := Guarder.UserID;
  adsSTHouseMoveMaster.FieldByName('Code').AsString := GetMaxCode('Code', 'STHouseMoveMaster', number);
  adsSTHouseMoveMaster.FieldByName('Date').AsString := FormatDateTime('yyyy-mm-dd', date());
end;

procedure TSTEdHouseMoveForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
end;

procedure TSTEdHouseMoveForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'STHouseMove';
  ADODataSet1.Close;
  ADODataSet1.Open;
  ADOTable3.Close;
  ADOTable3.Open;
  ADOTable4.Close;
  ADOTable4.Open;
  adsSTWarehouse.Close;
  adsSTWarehouse.Open;
  adsSTWarehouse2.Close;
  adsSTWarehouse2.Open;
end;

procedure TSTEdHouseMoveForm.adsSTHouseMoveDetailGoodsIDChange(
  Sender: TField);
begin
  inherited;
  adsSTHouseMoveDetail.FieldValues['Spec'] := ADOTable3.FieldByName('spec').AsString;
  adsSTHouseMoveDetail.FieldByName('GoalQuantity').AsString:='0';
  try
    adsSTHouseMoveDetail.FieldByName('GoalUnitID').AsString := ADOTable3.FieldByName('UnitID').AsString;
    adsSTHouseMoveDetail.FieldByName('UnitID').AsString := ADOTable3.FieldByName('UnitID').AsString;
  except
  end;

  try
    with adoTmp do
    begin
      close;
      sql.Text := 'select CAST((select ExchangeRate from MSUnit where ID=' +
        adsSTHouseMoveDetail.FieldByName('UnitID').AsString + ') as float)*' + adsSTHouseMoveDetail.FieldByName('Quantity').AsString +
        ' As GSum';
      open;
      adsSTHouseMoveDetail.FieldByName('GoalQuantity').AsFloat := FieldByName('GSum').AsFloat;

      close;
      sql.Text := 'select CAST((select PricePurchase from DAGoods where UnitID='+
       adsSTHouseMoveDetail.FieldByName('UnitID').AsString+' and ID ='+
       adsSTHouseMoveDetail.FieldByName('GoodsID').AsString+') as float)*'+adsSTHouseMoveDetail.FieldByName('GoalQuantity').AsString+
        ' As GSum';
      open;
      adsSTHouseMoveDetail.FieldByName('GoalCost').AsFloat := FieldByName('GSum').AsFloat;

    end;
  except
  end;
end;

procedure TSTEdHouseMoveForm.adsSTHouseMoveDetailWarehouseIDInChange(
  Sender: TField);
begin
  inherited;
  with adsSTHouseMoveDetail do
  begin
    if FieldByName('WarehouseIDIn').AsInteger = FieldByName('WarehouseIDOut').AsInteger then
    begin
      showmessage('调入仓库与调出仓库不能相同');
      FieldByName('WarehouseIDIn').AsInteger := 0;
    end;
  end;
end;

procedure TSTEdHouseMoveForm.adsSTHouseMoveDetailWarehouseIDOutChange(
  Sender: TField);
begin
  inherited;
  with adsSTHouseMoveDetail do
  begin
    if FieldByName('WarehouseIDIn').AsInteger = FieldByName('WarehouseIDOut').AsInteger then
    begin
      showmessage('调入仓库与调出仓库不能相同');
      FieldByName('WarehouseIDOut').AsInteger := 0;
    end;
  end;
end;

procedure TSTEdHouseMoveForm.ADOTable4FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept := not (dataset.FieldByName('RecordState').AsString = '删除');
end;

procedure TSTEdHouseMoveForm.ADOTable3FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept := not (dataset.FieldByName('RecordState').AsString = '删除');
end;

procedure TSTEdHouseMoveForm.adsSTHouseMoveDetailUnitIDChange(
  Sender: TField);
begin
  inherited;
  try
    with adoTmp do
    begin
      close;
      sql.Text := 'select CAST((select ExchangeRate from MSUnit where ID=' +
        adsSTHouseMoveDetail.FieldByName('UnitID').AsString + ') as float)*' + adsSTHouseMoveDetail.FieldByName('Quantity').AsString +
        ' As GSum';
      open;
      adsSTHouseMoveDetail.FieldByName('GoalQuantity').AsFloat := FieldByName('GSum').AsFloat;


      close;
      sql.Text := 'select CAST((select PricePurchase from DAGoods where UnitID='+
       adsSTHouseMoveDetail.FieldByName('UnitID').AsString+' and ID ='+
       adsSTHouseMoveDetail.FieldByName('GoodsID').AsString+') as float)*'+adsSTHouseMoveDetail.FieldByName('GoalQuantity').AsString+
        ' As GSum';
      open;
      adsSTHouseMoveDetail.FieldByName('GoalCost').AsFloat := FieldByName('GSum').AsFloat;
    end;
  except
  end;
end;

end.

