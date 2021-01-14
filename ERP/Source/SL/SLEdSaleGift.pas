unit SLEdSaleGift;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, Mask, DBCtrls;

type
  TSLEdSaleGiftForm = class(TWSStandardEditForm)
    tblSLEdSaleGift: TADODataSet;
    tblSLEdSaleGiftID: TAutoIncField;
    tblSLEdSaleGiftGoodsID: TIntegerField;
    tblSLEdSaleGiftCode: TStringField;
    tblSLEdSaleGiftDiscountClass: TStringField;
    tblSLEdSaleGiftDate: TDateTimeField;
    tblSLEdSaleGiftGiftGoodsID: TIntegerField;
    tblSLEdSaleGiftPriceGift: TBCDField;
    tblSLEdSaleGiftStartDate: TDateTimeField;
    tblSLEdSaleGiftExpireDate: TDateTimeField;
    tblSLEdSaleGiftMemo: TStringField;
    tblSLEdSaleGiftMinAmount: TBCDField;
    tblSLEdSaleGiftPeriodID: TIntegerField;
    tblSLEdSaleGiftQuantity: TBCDField;
    tblSLEdSaleGiftGiftUnitID: TIntegerField;
    tblSLEdSaleGiftCreateDate: TDateTimeField;
    tblSLEdSaleGiftCreateUserID: TIntegerField;
    tblSLEdSaleGiftQuantityGift: TBCDField;
    tblSLEdSaleGiftRecordState: TStringField;
    dsSLEdSaleGift: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBMemo1: TDBMemo;
    GoodName1: TADODataSet;
    GoodUnit: TADODataSet;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    DBLookupComboBox2: TDBLookupComboBox;
    tblSLEdSaleGiftGoodUnitName: TStringField;
    DBLookupComboBox3: TDBLookupComboBox;
    GoodName: TADODataSet;
    DataSource2: TDataSource;
    GoodNameID: TAutoIncField;
    GoodNameCreateDate: TDateTimeField;
    GoodNameCreateUserID: TIntegerField;
    GoodNameRecordState: TStringField;
    GoodNameName: TStringField;
    GoodNameCode: TStringField;
    GoodNameSpec: TStringField;
    GoodNameBarCode: TStringField;
    GoodNameGoodsClassID: TIntegerField;
    GoodNameUnitID: TIntegerField;
    GoodNameStockMax: TBCDField;
    GoodNameStockMin: TBCDField;
    GoodNamePricePurchase: TBCDField;
    GoodNamePriceSales: TBCDField;
    GoodNameGoodsPictrue: TBlobField;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure tblSLEdSaleGiftAfterInsert(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override ;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  SLEdSaleGiftForm: TSLEdSaleGiftForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}
function TSLEdSaleGiftForm.Enter: Boolean;
begin
   GoodName.Open;
   GoodName1.Open;
   GoodUnit.Open;
   tblSLEdSaleGift.Open;
   tblSLEdSaleGift.Insert;


     Result := ShowModal = mrOK;
end;

function TSLEdSaleGiftForm.Edit(const Params: Variant): Boolean;
begin
  GoodName.Open;
  GoodName1.Open;
  GoodUnit.Open;
  tblSLEdSaleGift.Open;
  tblSLEdSaleGift.Locate('ID',params,[]);
  Result := ShowModal = mrOK;
end;
procedure TSLEdSaleGiftForm.OKButtonClick(Sender: TObject);
begin
  inherited;
   if tblSLEdSaleGift.State in [dsedit,dsinsert]
   then tblSLEdSaleGift.Post;
    modalresult:=mrok;
end;

procedure TSLEdSaleGiftForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
   modalresult:=mrcancel;
end;

procedure TSLEdSaleGiftForm.tblSLEdSaleGiftAfterInsert(DataSet: TDataSet);
begin
  inherited;
dataset.FieldByName('Code').AsString:=GetMaxCode('Code','SLSaleGift',number);
dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
dataset.FieldByName('Date').AsDateTime:=date;
end;

procedure TSLEdSaleGiftForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
   GoodName.Close;
   GoodName1.Close;
   GoodUnit.close;
   tblSLEdSaleGift.Close;
end;

procedure TSLEdSaleGiftForm.FormShow(Sender: TObject);
begin
  inherited;
dbedit2.SetFocus;
dbedit2.SelLength:=0;
end;

end.
