unit SLEdBuyPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DBCtrls, Mask, ADODB, DB;

type
  TSLEdBuyPriceForm = class(TWSStandardEditForm)
    tblSLEdBuyPrice: TADOTable;
    dsSLEdBuyPrice: TDataSource;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    DBEdit3: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit10: TDBEdit;
    DBMemo1: TDBMemo;
    DBEdit2: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit6: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label1: TLabel;
    Label7: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label11: TLabel;
    adsGoodUnit: TADODataSet;
    DBLookupComboBox2: TDBLookupComboBox;
    tblSLEdBuyPriceID: TAutoIncField;
    tblSLEdBuyPriceCreateDate: TDateTimeField;
    tblSLEdBuyPriceCreateUserID: TIntegerField;
    tblSLEdBuyPriceRecordState: TStringField;
    tblSLEdBuyPriceDate: TDateTimeField;
    tblSLEdBuyPriceCode: TStringField;
    tblSLEdBuyPricePriceClass: TStringField;
    tblSLEdBuyPriceGoodsID: TIntegerField;
    tblSLEdBuyPricePackUnitID: TIntegerField;
    tblSLEdBuyPricePriceBase: TBCDField;
    tblSLEdBuyPricePriceMax: TBCDField;
    tblSLEdBuyPricePriceMin: TBCDField;
    tblSLEdBuyPriceStartDate: TDateTimeField;
    tblSLEdBuyPriceExpireDate: TDateTimeField;
    tblSLEdBuyPriceMeno: TStringField;
    tblSLEdBuyPricePeriodID: TIntegerField;
    dsGoodUnit: TDataSource;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tblSLEdBuyPriceBeforeOpen(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override ;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  SLEdBuyPriceForm: TSLEdBuyPriceForm;

implementation

uses CommonDM, WSSecurity;

{$R *.dfm}

function TSLEdBuyPriceForm.Enter: Boolean;
begin
  tblSLEdBuyPrice.open ;
   adoquery1.Open;
    tblSLEdBuyPrice.Insert;
    goodunit.Open;
    Result := ShowModal = mrOK;
end;


function TSLEdBuyPriceForm.Edit(const Params: Variant): Boolean;
begin
      tblSLEdBuyPrice.open ;
   adoquery1.Open;
      tblSLEdBuyPrice.Locate('ID',params,[]);
      goodunit.Open;
    Result := ShowModal = mrOK;

end;
procedure TSLEdBuyPriceForm.OKButtonClick(Sender: TObject);
begin
  inherited;
if  tblSLEdBuyPrice.State in  [dsedit,dsinsert]then

  tblSLEdBuyPrice.Post;


    modalresult:=mrok;
end;

procedure TSLEdBuyPriceForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
   modalresult:=mrcancel;
end;

procedure TSLEdBuyPriceForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblSLEdBuyPrice.Close ;
   adoquery1.Close;
     goodunit.Close;
end;

procedure TSLEdBuyPriceForm.tblSLEdBuyPriceBeforeOpen(DataSet: TDataSet);
begin
  inherited;
if dataset.State=dsinsert
then dataset.FieldByName('CreateUserID').Value:=Guarder.UserID;
end;

procedure TSLEdBuyPriceForm.FormShow(Sender: TObject);
begin
  inherited;
  //dblookupcombobox1.SetFocus;
end;

end.
