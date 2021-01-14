//
//
//
//
//
//
// MSOption单元
//
//
//
//    小杨
//   2002.10.30
//



unit MSOption;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, ComCtrls, Mask, DBCtrls,
  ExtDlgs, Grids, DBGrids, Buttons;

type
  TMSOptionForm = class(TWSStandardEditForm)
    PageControl1: TPageControl;
    tblMSOption: TADOTable;
    dsMSOption: TDataSource;
    tblMSOptionID: TAutoIncField;
    tblMSOptionCreateDate: TDateTimeField;
    tblMSOptionCreateUserID: TIntegerField;
    tblMSOptionRecordState: TStringField;
    tblMSOptionAddress: TStringField;
    tblMSOptionTelephone: TStringField;
    tblMSOptionFax: TStringField;
    tblMSOptionRegisterDate: TDateTimeField;
    tblMSOptionRegisterCapital: TBCDField;
    tblMSOptionCharter: TStringField;
    tblMSOptionBossName: TStringField;
    tblMSOptionRunRange: TStringField;
    tblMSOptionCentralTax: TStringField;
    tblMSOptionLandTax: TStringField;
    tblMSOptionKeyCode: TStringField;
    tblMSOptionCertificates: TStringField;
    tblMSOptionBankOpened: TStringField;
    tblMSOptionBankAccount: TStringField;
    tblMSOptionSoftRegCode: TStringField;
    tblMSOptionMemo: TStringField;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    dbedit1: TDBEdit;
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
    DBEdit9: TDBEdit;
    Label10: TLabel;
    DBEdit10: TDBEdit;
    Label11: TLabel;
    DBEdit11: TDBEdit;
    Label12: TLabel;
    DBEdit12: TDBEdit;
    Label13: TLabel;
    DBEdit13: TDBEdit;
    Label14: TLabel;
    DBEdit14: TDBEdit;
    Label15: TLabel;
    DBEdit15: TDBEdit;
    Label16: TLabel;
    DBEdit16: TDBEdit;
    DBMemo1: TDBMemo;
    tblMSOptionLog: TBlobField;
    Label17: TLabel;
    DBImage1: TDBImage;
    openpic: TOpenPictureDialog;
    Label18: TLabel;
    tblMSOptionName: TStringField;
    tblMSOptionFullName: TStringField;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    dssysprarmetar: TDataSource;
    Adssysprarmetar: TADODataSet;
    AdssysprarmetarID: TAutoIncField;
    AdssysprarmetarCreateDate: TDateTimeField;
    AdssysprarmetarCreateUserID: TIntegerField;
    AdssysprarmetarRecordState: TStringField;
    AdssysprarmetarParaName: TStringField;
    AdssysprarmetarParaValues: TStringField;
    AdssysprarmetarParaNameA: TStringField;
    AdssysprarmetarMemo: TStringField;
    BitBtn1: TBitBtn;
    ADODataSet1: TADODataSet;
    AutoIncField1: TAutoIncField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dsMSOptionDataChange(Sender: TObject; Field: TField);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure DBImage1DblClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MSOptionForm: TMSOptionForm;

implementation

uses CommonDM ,WSUtils ;

{$R *.dfm}

procedure TMSOptionForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if tblmsoption.State in [dsedit, dsinsert] then
    tblmsoption.Post;
  close;
end;

procedure TMSOptionForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  if tblmsoption.State in [dsedit, dsinsert] then
    tblmsoption.Cancel;
  close;
end;

procedure TMSOptionForm.FormCreate(Sender: TObject);
begin
  inherited;
  tblmsoption.Open;
  if tblmsoption.IsEmpty then
    tblmsoption.Insert
  else
  begin
    tblmsoption.First;
    tblmsoption.Edit;
  end;
  Adssysprarmetar.Close;
  Adssysprarmetar.Open;

end;

procedure TMSOptionForm.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  tblmsoption.Close;
end;

procedure TMSOptionForm.dsMSOptionDataChange(Sender: TObject;
  Field: TField);
begin
  inherited;
  OKbutton.Enabled := true; //数据被改动,可以保存.
end;

procedure TMSOptionForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
    postmessage(handle, vk_tab, 0, 0);
end;

procedure TMSOptionForm.FormShow(Sender: TObject);
begin
  inherited;
  pagecontrol1.ActivePageIndex:=0;
  dbedit1.SetFocus;
  dbedit1.SelLength := 0;
end;

procedure TMSOptionForm.DBImage1DblClick(Sender: TObject);
begin
  inherited;

if openpic.Execute then
begin
  if not (dbimage1.DataSource.DataSet.State in [dsedit,dsinsert]) then
  dbimage1.DataSource.DataSet.Edit ;
  dbimage1.Picture.LoadFromFile(openpic.FileName);
end;
end;

procedure TMSOptionForm.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if Adssysprarmetar.Eof then exit;
  Adssysprarmetar.Edit;
  if Adssysprarmetar.FieldByName('ParaValues').AsString ='是' then
    Adssysprarmetar.FieldByName('ParaValues').AsString :='否'
  else Adssysprarmetar.FieldByName('ParaValues').AsString :='是';
  Adssysprarmetar.Post;
end;

procedure TMSOptionForm.BitBtn1Click(Sender: TObject);
var iPos :integer;
   StrDataSource :PChar;
   adoTemp: TADOQuery;
begin
  inherited;
{  iPos :=pos('Data Source=',Trim(CommonData.acnConnection.ConnectionString) );
  StrDataSource :=Trim(copy(Trim(CommonData.acnConnection.ConnectionString),iPos,20000)) ;
  iPos :=pos(';',StrDataSource);
  StrDataSource :=Trim(copy(StrDataSource,1,iPos-1)) ;
  StrDataSource :=Trim(copy(StrDataSource,13,20000)) ;
  if StrDataSource='.' then
     StrDataSource := GetComputerNameX;



  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.close;
  adoTemp.SQL.Text := ' select * from MSCompanyUser';
  adoTemp.open;
  adoTemp.Edit;
  adoTemp.fieldbyname('SoftRegCode').AsString :=Copy(Trim(adoTemp.fieldbyname('SoftRegCode').AsString),1,30)
        +strupper(Trim(StrDataSource));
  adoTemp.post;
  showmessage('注册成功!'+'  -  '+inttostr(pos(GetComputerNameX,adoTemp.fieldbyname('SoftRegCode').AsString)) );
  }
end;

         
end.

