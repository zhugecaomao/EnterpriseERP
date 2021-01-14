unit FNEdCredence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEditA, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB;

type
  TFNCredenceEditForm = class(TBaseVoucherEditAForm)
    adsCredMaster: TADODataSet;
    adsCredDetail: TADODataSet;
    adsCredMasterID: TAutoIncField;
    adsCredMasterCreateDate: TDateTimeField;
    adsCredMasterCreateUserID: TIntegerField;
    adsCredMasterRecordState: TStringField;
    adsCredMasterDate: TDateTimeField;
    adsCredMasterCode: TStringField;
    adsCredMasterClientID: TIntegerField;
    adsCredMasterEmployeeID: TIntegerField;
    adsCredMasterBillMode: TStringField;
    adsCredMasterModeDC: TIntegerField;
    adsCredMasterModeC: TIntegerField;
    adsCredMasterBrief: TStringField;
    adsCredMasterMemo: TStringField;
    adsCredMasterOriginID: TIntegerField;
    adsCredMasterOriginTable: TStringField;
    DBComboBox1: TDBComboBox;
    Label1: TLabel;
    adsCredDetailID: TAutoIncField;
    adsCredDetailMasterID: TIntegerField;
    adsCredDetailGoodsID: TIntegerField;
    adsCredDetailGoodsSpec: TStringField;
    adsCredDetailQuantity: TBCDField;
    adsCredDetailPriceBase: TBCDField;
    adsCredDetailPriceCost: TBCDField;
    adsCredDetailGoods: TStringField;
    adsCredDetailMemo: TStringField;
    procedure DBGridEditButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure adsCredDetailCalcFields(DataSet: TDataSet);
    procedure adsCredDetailPriceBaseChange(Sender: TField);
    procedure adsCredDetailPriceCostChange(Sender: TField);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure New; override;
  end;

implementation

uses CommonDM, DASubject, WSUtils, WSSecurity;

{$R *.dfm}

procedure TFNCredenceEditForm.DBGridEditButtonClick(Sender: TObject);
var
  SubID: Integer;
begin
  inherited;
  SubID := TDASubjectForm.ShowSelect;
  if SubID <> -1 then
    with DetailDataSet do
    begin
      Edit;
      FieldByName('GoodsID').AsInteger := SubID;
    end;
end;

procedure TFNCredenceEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'FNCred';
  CommonData.adsDASubject.Close;
end;

procedure TFNCredenceEditForm.New;
begin
  inherited;
  with MasterDataSet do
  begin
    FieldByName('Date').AsDateTime := Date;
    FieldByName('Code').AsString:= GetMaxCode('Code','FNCredMaster',number);
    FieldByName('CreateUserID').AsInteger := Guarder.UserID;
    FieldByName('BillMode').AsString :='สี';
  end;
end;

procedure TFNCredenceEditForm.adsCredDetailCalcFields(DataSet: TDataSet);
var
  SubCode, S: string;
  V: Variant;
  Len: Integer;
begin
  inherited;
  CommonData.adsDASubject.Open;
  with DataSet do
  begin
    V := CommonData.adsDASubject.Lookup('ID', FieldByName('GoodsID').Value, 'SubCode; Name');
    if not VarIsNull(V) then
    begin
      SubCode := V[0];
      S := V[1];
      Len := Length(SubCode);
      Dec(Len, 3);
      while Len > 3 do
      begin
        V := CommonData.adsDASubject.Lookup('SubCode', Copy(SubCode, 1, Len), 'Name');
        if not VarIsNull(V) then S := V + ' ก๚ ' + S;
        Dec(Len, 3);
      end;
    end;
    FieldByName('Goods').AsString := S; //CommonData.adsDASubject.Lookup('ID', FieldByName('GoodsID').Value, 'Name');
  end;
end;

procedure TFNCredenceEditForm.adsCredDetailPriceBaseChange(Sender: TField);
begin
  inherited;
  if Sender.AsCurrency <> 0 then DetailDataSet.FieldByName('PriceCost').Clear
end;

procedure TFNCredenceEditForm.adsCredDetailPriceCostChange(Sender: TField);
begin
  inherited;
  if Sender.AsCurrency <> 0 then DetailDataSet.FieldByName('PriceBase').Clear
end;

end.
