unit DAEdGoods;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, Mask, DBCtrls, ExtDlgs;

type
  TDAGoodsEditForm = class(TWSStandardEditForm)
    tblGoodsEdit: TADOTable;
    dsGoodsEdie: TDataSource;
    tblGoodsEditID: TAutoIncField;
    tblGoodsEditCreateDate: TDateTimeField;
    tblGoodsEditCreateUserID: TIntegerField;
    tblGoodsEditRecordState: TStringField;
    tblGoodsEditCode: TStringField;
    tblGoodsEditSpec: TStringField;
    tblGoodsEditBarCode: TStringField;
    tblGoodsEditGoodsClassID: TIntegerField;
    tblGoodsEditUnitID: TIntegerField;
    tblGoodsEditStockMax: TBCDField;
    tblGoodsEditStockMin: TBCDField;
    tblGoodsEditPricePurchase: TBCDField;
    tblGoodsEditPriceSales: TBCDField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit5: TDBEdit;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    Label9: TLabel;
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBImage1: TDBImage;
    DBLookupComboBox1: TDBLookupComboBox;
    DataSource1: TDataSource;
    Label11: TLabel;
    OpenPic: TOpenPictureDialog;
    Label12: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DataSource2: TDataSource;
    tblGoodsEditGoodsPictrue: TBlobField;
    ADOTable1: TADODataSet;
    ADOTable2: TADODataSet;
    tblGoodsEditName: TStringField;
    tblGoodsEditAddUnitID: TIntegerField;
    tblGoodsEditAddUnitRate: TFloatField;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit4: TDBEdit;
    AddUnitLookup: TDBLookupComboBox;
    AdsAddUnit: TADODataSet;
    dsAddUnit: TDataSource;
    procedure tblGoodsEditBeforePost(DataSet: TDataSet);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBImage1DblClick(Sender: TObject);
    procedure ADOTable1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblGoodsEditFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure ADOTable2FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox2Enter(Sender: TObject);
    procedure DBEdit1Exit(Sender: TObject);
    procedure AddUnitLookupCloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
        function Enter(const Params: Variant): Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  DAGoodsEditForm: TDAGoodsEditForm;

implementation

uses CommonDM, WSUtils,WSSecurity;

{$R *.dfm}
function TDAGoodsEditForm.Enter(const Params: Variant): Boolean;
begin
  tblGoodsEdit.open;
  adotable1.open;
  adotable2.Open;
  AdsAddUnit.Open;
  tblGoodsEdit.Insert;
  tblGoodsEdit.FieldByName('UnitID').AsInteger  :=ADOTable2.FieldByName('ID').AsInteger;
  tblGoodsEdit.FieldByName('GoodsClassID').AsInteger  :=ADOTable1.FieldByName('ID').AsInteger;
  tblGoodsEdit.FieldByName('CODE').AsString  :=GetMaxCode('Code','DAGoods',number);
  dblookupcombobox1.Field.AsInteger:=params;
  Result := ShowModal = mrOK;
end;
function TDAGoodsEditForm.Edit(const Params: Variant): Boolean;
begin
  tblGoodsEdit.open;
  adotable1.open;
  adotable2.Open;
  AdsAddUnit.Open;
  tblGoodsEdit.Locate('ID',Params,[]);
  Result := ShowModal = mrOK;
end;

procedure TDAGoodsEditForm.tblGoodsEditBeforePost(DataSet: TDataSet);
begin
  inherited;
if dataset.State=dsinsert
then dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;

end;

procedure TDAGoodsEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if tblGoodsEdit.State in [dsedit,dsinsert]  then
  begin
    if (tblGoodsEdit.FieldByName('GoodsClassID').IsNull) or
       (tblGoodsEdit.FieldByName('GoodsClassID').AsInteger <1) then
    tblGoodsEdit.FieldByName('GoodsClassID').AsInteger :=1;
    tblGoodsEdit.Post;
  end;
  modalresult:=mrOk;
end;

procedure TDAGoodsEditForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TDAGoodsEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adotable1.Close;
  adotable2.Close;
  tblgoodsedit.Close;
end;

procedure TDAGoodsEditForm.DBImage1DblClick(Sender: TObject);
begin
  inherited;
  if openpic.Execute then
  begin
    if not (dbimage1.DataSource.DataSet.State in [dsedit,dsinsert]) then
    dbimage1.DataSource.DataSet.Edit ;
    dbimage1.Picture.LoadFromFile(openpic.FileName);
  end;
end;

procedure TDAGoodsEditForm.ADOTable1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;


accept:=(dataset.FieldByName('ID').AsInteger<>DBLookupComboBox1.DataSource.DataSet.FieldByName('ID').AsInteger  )
        and (not (dataset.FieldByName('RecordState').AsString='É¾³ý'));
end;

procedure TDAGoodsEditForm.tblGoodsEditFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TDAGoodsEditForm.ADOTable2FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:= (dataset.FieldByName('RecordState').AsString<>'É¾³ý') and (dataset.FieldByName('IsGoalUnit').Value=true)
end;

procedure TDAGoodsEditForm.FormShow(Sender: TObject);
begin
  inherited;
 dbedit1.SetFocus;
 dbedit1.SelLength:=0;
end;

procedure TDAGoodsEditForm.DBLookupComboBox2Enter(Sender: TObject);
begin
  inherited;
  tblGoodsEdit.Edit;
  if (tblGoodsEdit.FieldByName('UnitID').AsInteger =0) or
         (tblGoodsEdit.FieldByName('UnitID').IsNull) then
      tblGoodsEdit.FieldByName('UnitID').AsInteger :=ADOTable2.fieldbyname('ID').AsInteger;
end;

procedure TDAGoodsEditForm.DBEdit1Exit(Sender: TObject);
begin
  inherited;
  tblGoodsEdit.Edit;
  if (tblGoodsEdit.FieldByName('UnitID').AsInteger =0) or
         (tblGoodsEdit.FieldByName('UnitID').IsNull) then
   tblGoodsEdit.FieldByName('UnitID').AsInteger :=ADOTable2.fieldbyname('ID').AsInteger;
end;

procedure TDAGoodsEditForm.AddUnitLookupCloseUp(Sender: TObject);
begin
  inherited;
  tblGoodsEdit.Edit;
  if (tblGoodsEdit.FieldByName('AddUnitRate').AsFloat  =0) or
         (tblGoodsEdit.FieldByName('AddUnitRate').IsNull) then
      tblGoodsEdit.FieldByName('AddUnitRate').AsFloat :=AdsAddUnit.fieldbyname('ExchangeRate').AsFloat ;
end;

end.
