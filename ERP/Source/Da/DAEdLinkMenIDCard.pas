unit DAEdLinkMenIDCard;
{******************************************
项目：
模块：联系人编辑—户籍资料
日期：2002年11月13日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, ExtCtrls, ComCtrls, DB, ADODB, CommonDM,
  DBCtrls, Mask;

type
  TDALinkMenIDCardEditForm = class(TWSStandardEditForm)
    Label4: TLabel;
    Label5: TLabel;
    adrDALinkMemIDCard: TADOQuery;
    dbeName: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    dbeIDCard: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    dbeBornPlace: TDBEdit;
    adsDALinkMenIDCard: TADODataSet;
    dsDALinkMenIDCard: TDataSource;
    adsDALinkMenIDCardID: TAutoIncField;
    adsDALinkMenIDCardCreateDate: TDateTimeField;
    adsDALinkMenIDCardCreateUserID: TIntegerField;
    adsDALinkMenIDCardRecordState: TStringField;
    adsDALinkMenIDCardName: TStringField;
    adsDALinkMenIDCardNationality: TStringField;
    adsDALinkMenIDCardNativePlace: TStringField;
    adsDALinkMenIDCardFolk: TStringField;
    adsDALinkMenIDCardIDCard: TStringField;
    adsDALinkMenIDCardBornPlace: TStringField;
    adsDALinkMenIDCardProvince: TStringField;
    adsDALinkMenIDCardCity: TStringField;
    adsDALinkMenIDCardCounty: TStringField;
    adsDALinkMenIDCardStreet: TStringField;
    adsDALinkMenIDCardPassport: TStringField;
    adsDALinkMenIDCardDrivingLicence: TStringField;
    adsDALinkMenIDCardResidencePlace: TStringField;
    adsDALinkMenIDCardPrivateFile: TStringField;
    dbeProvince: TDBEdit;
    dbeCity: TDBEdit;
    Label1: TLabel;
    dbeCounty: TDBEdit;
    dbeStreet: TDBEdit;
    Label2: TLabel;
    dbePassport: TDBEdit;
    Label3: TLabel;
    dbeDrivingLicence: TDBEdit;
    Label11: TLabel;
    dbeResidencePlace: TDBEdit;
    Label12: TLabel;
    Label13: TLabel;
    dbePrivateFile: TDBEdit;
    Label14: TLabel;
    dbeNativePlace: TDBEdit;
    adsPeriod: TADODataSet;
    dsPeriod: TDataSource;
    dsClient: TDataSource;
    adsPeriodID: TAutoIncField;
    adsPeriodCreateDate: TDateTimeField;
    adsPeriodCreateUserID: TIntegerField;
    adsPeriodRecordState: TStringField;
    adsPeriodName: TStringField;
    adsPeriodNationality: TStringField;
    adsPeriodNativePlace: TStringField;
    adsPeriodFolk: TStringField;
    adsPeriodIDCard: TStringField;
    adsPeriodBornPlace: TStringField;
    adsPeriodProvince: TStringField;
    adsPeriodCity: TStringField;
    adsPeriodCounty: TStringField;
    adsPeriodStreet: TStringField;
    adsPeriodPassport: TStringField;
    adsPeriodDrivingLicence: TStringField;
    adsPeriodResidencePlace: TStringField;
    adsPeriodPrivateFile: TStringField;
    dbcbNationality: TDBComboBox;
    dbcbFolk: TDBComboBox;
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private
    nOptionType: integer; //操作类型：0:增加 1:编辑；
    vID:string;
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  DALinkMenIDCardEditForm: TDALinkMenIDCardEditForm;

implementation

{$R *.dfm}
function TDALinkMenIDCardEditForm.Edit(const Params: Variant): Boolean;
begin
  vID := Format('%s', [VarToStr(Params)]);
  nOptionType:=1;
  adsPeriod.Active := True;
  with adsDALinkMenIDCard do
  begin
    Active := True;
    Locate('id',vID,[]);
  end;
  Result := ShowModal = mrOK;
end;

function TDALinkMenIDCardEditForm.Enter: Boolean;
begin
  nOptionType := 0;
  adsPeriod.Active := True;
  with adsDALinkMenIDCard do
  begin
    Active := True;
    Append;
    FieldByName('Nationality').AsString := '中华人民共和国';
    FieldByName('Folk').AsString := '汉';
    FieldByName('RecordState').AsString := '临时';
  end;
  Result := ShowModal = mrOK;
end;

procedure TDALinkMenIDCardEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  CommonData.adsDAClient.Active := True;
  with adrDALinkMemIDCard do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT Nationality FROM DALinkMenIDCard');
    Open;
    if not IsEmpty then
    begin
      First;
      while not eof do
      begin
        dbcbNationality.Items.Add(FieldByName('Nationality').AsString);
        Next;
      end;
    end;
    Close;
    SQL.Clear;
    SQL.Add('SELECT DISTINCT Folk FROM DALinkMenIDCard');
    Open;
    if not IsEmpty then
    begin
      First;
      while not eof do
      begin
        dbcbFolk.Items.Add(FieldByName('Folk').AsString);
        Next;
      end;
    end;
    Close;
  end;
end;

procedure TDALinkMenIDCardEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if adsDALinkMenIDCard.Modified then
  begin
    with adsDALinkMenIDCard do
    begin
      Edit;
      FieldByName('CreateUserID').AsInteger := 0;
      Post;
    end;
  end;
  ModalResult := mrOK;
end;

end.
