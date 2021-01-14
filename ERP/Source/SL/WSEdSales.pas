unit WSEdSales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, StdCtrls, Mask, DBCtrls,
  ExtCtrls, ToolWin, ComCtrls, Grids, DBGrids, QLDBGrid, ADODB, QLDBLkp;

type
  TWSSalesEditForm = class(TBaseVoucherEditForm)
    Label1: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBCheckBox3: TDBCheckBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBCheckBox4: TDBCheckBox;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    adsSalesMaster: TADODataSet;
    adsSalesDetail: TADODataSet;
    adsSalesDetailID: TAutoIncField;
    adsSalesDetailMasterID: TIntegerField;
    adsSalesDetailGoodsID: TIntegerField;
    adsSalesDetailQuantity: TBCDField;
    adsSalesDetailPackUnitID: TIntegerField;
    adsSalesDetailPriceBase: TBCDField;
    adsSalesDetailAmount: TBCDField;
    adsSalesDetailDiscountRate: TBCDField;
    adsSalesDetailDiscount: TBCDField;
    adsSalesDetailNetAmount: TBCDField;
    adsSalesDetailTexrate: TBCDField;
    adsSalesDetailTaxAmount: TBCDField;
    adsSalesDetailSalesMode: TStringField;
    adsSalesDetailGoalQuantity: TBCDField;
    adsSalesMasterID: TAutoIncField;
    adsSalesMasterCreateDate: TDateTimeField;
    adsSalesMasterCreateUserID: TIntegerField;
    adsSalesMasterRecordState: TStringField;
    adsSalesMasterDate: TDateTimeField;
    adsSalesMasterCode: TStringField;
    adsSalesMasterClientID: TIntegerField;
    adsSalesMasterEmployeID: TIntegerField;
    adsSalesMasterIsDiscount: TStringField;
    adsSalesMasterDiscountRate: TBCDField;
    adsSalesMasterIsTax: TStringField;
    adsSalesMasterTaxRate: TBCDField;
    adsSalesMasterIsDeliver: TStringField;
    adsSalesMasterOriginBillID: TIntegerField;
    adsSalesMasterOriginBillTypeID: TIntegerField;
    adsSalesMasterPeriodID: TIntegerField;
    adsSalesMasterClearDate: TDateTimeField;
    ADOTable1: TADOTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    ADOTable2: TADOTable;
    ADOTable3: TADOTable;
    ADOTable4: TADOTable;
    adsSalesDetailStringField1: TStringField;
    adsSalesDetailSaleDangWei: TStringField;
    adsSalesMasterMemo: TStringField;
    Label6: TLabel;
    DBEdit1: TDBEdit;
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
    ADOTable4ID: TAutoIncField;
    ADOTable4Name: TStringField;
    ADOTable4ExchangeRate: TStringField;
    ADOTable4GoalUnitID: TIntegerField;
    ADOTable4IsGoalUnit: TBooleanField;
    ADOTable4RecordState: TStringField;
    DataSource3: TDataSource;
    ADOTable3GoodsPictrue2: TBlobField;
    adsSalesMasterSundryFee: TBCDField;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    N7: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    adsSalesDetailSundryFee: TBCDField;
    DBComboBox3: TDBComboBox;
    adsSalesMasterIsApportion: TStringField;
    adsSalesMasterBillMode: TStringField;
    adsSalesMasterBillModeDC: TIntegerField;
    DBEdit5: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure ImportActionExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure adsSalesMasterBeforePost(DataSet: TDataSet);
    procedure adsSalesDetailBeforePost(DataSet: TDataSet);
    procedure ADOTable3FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure adsSalesMasterFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure adsSalesMasterAfterInsert(DataSet: TDataSet);
    procedure adsSalesDetailAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure adsSalesDetailQuantityChange(Sender: TField);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure adsSalesDetailGoodsIDChange(Sender: TField);
  private
    { Private declarations }
    procedure SetColumnAttributes;
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  WSSalesEditForm: TWSSalesEditForm;

implementation

uses WSUtils, PkVoucher, CommonDM, WSSecurity, SLSaleSearch;

{$R *.dfm}

procedure TWSSalesEditForm.FormCreate(Sender: TObject);
var
  tempquery: tadoquery;
begin
  adotable1.Open;
  adotable2.Open;
  adotable3.Open;
  adotable4.Open;
  inherited;
  VoucherTableName := 'SLSale';
end;

procedure TWSSalesEditForm.New;
begin
  inherited;
  SetColumnAttributes;
end;

procedure TWSSalesEditForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
  SetColumnAttributes;
end;

procedure TWSSalesEditForm.SetColumnAttributes;
//var
  //Column: TColumn;
begin
 { with adotable4 do
  begin
    Open;
    Column := ColumnByFieldName(DBGrid, 'GoodsID');
    First;
    while not Eof do
    begin
      Column.PickList.Add(FieldByName('Name').AsString);
      Next;
    end;
  end; }
 { with CommonData.adsBaseUnits do
  begin
    Open;
    Column := ColumnByFieldName(DBGrid, 'Units');
    First;
    while not Eof do
    begin
      Column.PickList.Add(FieldByName('fUnitName').AsString);
      Next;
    end;
  end;}
end;

procedure TWSSalesEditForm.ImportActionExecute(Sender: TObject);
begin
  inherited;
  Application.CreateForm(TVoucherPickForm, VoucherPickForm);
  VoucherPickForm.ShowModal;
end;

procedure TWSSalesEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adotable1.close;
  adotable2.close;
  adotable3.close;
  adotable4.close;
end;

procedure TWSSalesEditForm.adsSalesMasterBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dataset.State = dsinsert then
    dataset.FieldByName('CreateUserID').Value := Guarder.UserID;
end;

procedure TWSSalesEditForm.adsSalesDetailBeforePost(DataSet: TDataSet);
begin
  inherited;
//dataset.FieldByName('MasterID').Value:=adsSalesMaster.fieldbyname('ID').Value;
//  dataset.FieldByName('SalesMode').Value := adsSalesMaster.FieldByName('SaleMode').Value;


end;

procedure TWSSalesEditForm.ADOTable3FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept := not (dataset.FieldByName('RecordState').AsString = '删除');
end;

procedure TWSSalesEditForm.adsSalesMasterFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept := (not (DataSet.FieldByName('RecordState').AsString = '删除')) and (not ((adsSalesMaster.FieldByName('SaleMode').AsString) = '退货'))

end;

procedure TWSSalesEditForm.adsSalesMasterAfterInsert(DataSet: TDataSet);
begin
  inherited;
  dataset.FieldByName('Date').Value := date;
  dataset.FieldByName('IsDeliver').Value := false;

  dataset.FieldByName('IsDiscount').Value := false;
  dataset.FieldByName('IsTax').Value := false;
  dataset.FieldByName('Code').AsString := GetMaxCode('Code', 'SLSaleMaster', Ascii);
  dataset.FieldByName('SaleMode').AsString :='销售开单';
end;

procedure TWSSalesEditForm.adsSalesDetailAfterInsert(DataSet: TDataSet);
begin
  inherited;
  adsSalesDetail.FieldByName('DiscountRate').Value := adsSalesMaster.FieldByName('DiscountRate').Value;


  adsSalesDetail.FieldByName('Texrate').Value := adsSalesMaster.FieldByName('TaxRate').Value;



end;

procedure TWSSalesEditForm.FormShow(Sender: TObject);
VAR I:INTEGER;
begin
  inherited;
  dblookupcombobox1.SetFocus;
  with DBGrid do
  begin
    for I := 0 to Columns.Count -  1 do
    begin
    Columns[I].Title.Alignment :=taCenter;
    end;
  end;

end;

procedure TWSSalesEditForm.adsSalesDetailQuantityChange(Sender: TField);
begin
  inherited;

  adssalesdetailNetAmount.ReadOnly := false;
  adssalesdetailTaxAmount.ReadOnly := false;
  adsSalesdetailDiscount.ReadOnly := false;
  adsSalesdetailAmount.ReadOnly := false;

  if adsSalesMaster.FieldByName('IsDiscount').AsBoolean
    then adsSalesDetail.FieldByName('Discount').AsFloat :=
    adsSalesDetail.FieldByName('PriceBase').AsFloat
      * (adsSalesDetail.FieldByName('DiscountRate').AsFloat / 100)
      * adsSalesDetail.FieldByName('Quantity').AsInteger

  else adsSalesDetail.FieldByName('Discount').AsFloat := 0; //折扣金额

  adsSalesDetail.FieldByName('Amount').AsFloat := adsSalesDetail.FieldByName('PriceBase').AsFloat
    * adsSalesDetail.FieldByName('Quantity').AsInteger;
  if not adsSalesMaster.FieldByName('IsTax').AsBoolean
    then begin //不含税
    adsSalesDetail.FieldByName('NetAmount').AsFloat := adsSalesDetail.FieldByName('Amount').AsFloat
      - adsSalesDetail.FieldByName('Discount').AsFloat; //销售净价
    adsSalesDetail.FieldByName('TaxAmount').AsFloat := adsSalesDetail.FieldByName('NetAmount').AsFloat
      * (adsSalesDetail.FieldByName('Texrate').AsFloat / 100);
                                               //税金
  end
  else begin
    adsSalesDetail.FieldByName('NetAmount').AsFloat := (adsSalesDetail.FieldByName('Amount').AsFloat
      - adsSalesDetail.FieldByName('Discount').AsFloat)
      / ((100 + adsSalesDetail.FieldByName('Texrate').AsFloat) / 100);
    adsSalesDetail.FieldByName('TaxAmount').AsFloat := adsSalesDetail.FieldByName('NetAmount').AsFloat
      * (adsSalesDetail.FieldByName('Texrate').AsFloat / 100);
  end;

  adssalesdetailNetAmount.ReadOnly := true;
  adssalesdetailTaxAmount.ReadOnly := true;
  adsSalesdetailDiscount.ReadOnly := true;
  adsSalesdetailAmount.ReadOnly := true;

end;

procedure TWSSalesEditForm.N13Click(Sender: TObject);
var
  tempquery: tadoquery;
  Menory: single;
  ID: integer;
begin
  inherited;
  try
    if adsSalesMaster.State in [dsedit,dsinsert]
    then begin
           messagebox(handle,'请 先 提 交 当 前 数 据 !','提 示',MB_OK+MB_iconInformation);
           abort;
         end;
    tempquery := tadoquery.Create(self);
    tempquery.Connection := adsSalesMaster.Connection;
    tempquery.Close;
    tempquery.SQL.Clear;
    tempquery.SQL.Add('select Sum(NetAmount+TaxAmount) as Menory'
      + ' From SLSaleDetail'
      + ' Where MasterID = ' + adsSalesMaster.fieldbyname('ID').AsString);
    tempquery.Open;
    Menory := tempquery.fieldbyname('Menory').AsFloat;

    tempquery.Close;
    tempquery.SQL.Clear;
    tempquery.SQL.Add('select ID from DABillType '
      + ' where Name = ' + '''销售开单''');
    tempquery.Open;
    ID := tempquery.fieldbyname('ID').AsInteger;

    tempquery.Close;
    tempquery.SQL.Clear;
    tempquery.SQL.Add('select * From SLClearBillMaster where OriginBillID = '
      + adsSalesMaster.FieldByName('ID').AsString);
    tempquery.Open;
    if tempquery.IsEmpty
      then tempquery.Insert
    else tempquery.Edit;
    tempquery.FieldByName('OriginBillID').Value := adsSalesMaster.FieldByName('ID').AsString;

    tempquery.FieldByName('EmployeID').Value := adsSalesMaster.FieldByName('EmployeID').AsString;

    tempquery.FieldByName('CreateUserID').Value := 0;

    tempquery.FieldByName('AcceptAmount').Value := Menory;

    tempquery.FieldByName('OriginBillTypeID').AsInteger := ID;
    tempquery.Post;
    messagebox(handle,'成 功 生 成 结 算 单 .','提 示',MB_OK+MB_ICONINFORMATION);


  finally
    tempquery.Free;
  end;
end;

procedure TWSSalesEditForm.N14Click(Sender: TObject);
begin
  inherited;
  if (not adsSalesMaster.FieldByName('ClientID').IsNull) and (not adsSalesDetail.FieldByName('GoodsID').IsNull)
    then begin
    SLSaleSearchForm := tSLSaleSearchForm.Create(self);
    with SLSaleSearchForm do
    begin
      tblSaleSearcher.Close;
      tblSaleSearcher.CommandText := 'select M.CreateDate,D.* from SLSaleDetail D ,SLSaleMaster M '
        + '  where D.MasterID=M.ID and M.CLientID=:CLientID'
        + '  and D.GoodsID=:GoodsID';
      tblSaleSearcher.Parameters.ParamByName('ClientID').Value
        := adsSalesMaster.FieldByName('ClientID').Value;
      tblSaleSearcher.Parameters.ParamByName('GoodsID').Value
        := adsSalesDetail.FieldByName('GoodsID').Value;

      tblSaleSearcher.Open;
      SLSaleSearchForm.Show;
    end;
  end
  else begin
    if (not adsSalesMaster.FieldByName('ClientID').IsNull) and adsSalesDetail.FieldByName('GoodsID').IsNull
      then begin
      SLSaleSearchForm := tSLSaleSearchForm.Create(self);
      with SLSaleSearchForm do
      begin
        tblSaleSearcher.Close;
        tblSaleSearcher.CommandText := 'select M.CreateDate,D.* from SLSaleDetail D ,SLSaleMaster M '
          + '  where D.MasterID=M.ID and M.CLientID=:CLientID';

        tblSaleSearcher.Parameters.ParamByName('ClientID').Value
          := adsSalesMaster.FieldByName('ClientID').Value;
        tblSaleSearcher.Open;
        SLSaleSearchForm.Show;
      end;
    end;
  end;
end;

procedure TWSSalesEditForm.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

if  (shift=[ssCtrl]) and (Key=ord('Z'))
then N13.Click;
end;

procedure TWSSalesEditForm.adsSalesDetailGoodsIDChange(Sender: TField);
begin
  inherited;
  adsSalesDetailSaleDangWei.Value:='';
end;

end.

