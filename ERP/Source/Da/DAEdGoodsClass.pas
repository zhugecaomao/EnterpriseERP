unit DAEdGoodsClass;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, DBCtrls, Mask, QLDBLkp;

type
  TDAGoodsClassEditForm = class(TWSStandardEditForm)
    tblGoodEdit: TADOTable;
    dsGoodEdit: TDataSource;
    DataSource2: TDataSource;
    tblGoodEditID: TAutoIncField;
    tblGoodEditCreateDate: TDateTimeField;
    tblGoodEditCreateUserID: TIntegerField;
    tblGoodEditRecordState: TStringField;
    tblGoodEditName: TStringField;
    tblGoodEditUpID: TIntegerField;
    tblGoodEditLevelCode: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    ADOQuery1: TADOQuery;
    Label13: TLabel;
    Label3: TLabel;
    GeneralACIDAds: TADODataSet;
    GeneralACIDds: TDataSource;
    QLDBLookupComboBox1: TQLDBLookupComboBox;
    tblGoodEditGeneralACID: TIntegerField;
    TempAds: TADODataSet;
    Label4: TLabel;
    GeneralPACIDLKUP: TQLDBLookupComboBox;
    Label5: TLabel;
    GeneralCACIDLKUP: TQLDBLookupComboBox;
    GeneralPACIDAds: TADODataSet;
    GeneralPACIDDs: TDataSource;
    GeneralCACIDAds: TADODataSet;
    GeneralCACIDDs: TDataSource;
    tblGoodEditGeneralPACID: TIntegerField;
    tblGoodEditGeneralCACID: TIntegerField;
    procedure tblGoodEditBeforePost(DataSet: TDataSet);
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure ADOTable1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblGoodEditFilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure DBLookupComboBox1CloseUp(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter(const Params: Variant): Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  DAGoodsClassEditForm: TDAGoodsClassEditForm;

implementation

uses CommonDM, WSSecurity;

{$R *.dfm}
function TDAGoodsClassEditForm.Enter(const Params: Variant): Boolean;
begin
  tblGoodEdit.Open;
  tblGoodEdit.Insert;
  adoquery1.Parameters.ParamByName('Code').Value:='²»´æÔÚ';
  adoquery1.Open;
  dblookupcombobox1.Field.AsInteger:=params;
  Result := ShowModal = mrOK;
end;

function TDAGoodsClassEditForm.Edit(const Params: Variant): Boolean;
var LevelStr :String;
begin
  tblGoodEdit.Open;
  tblgoodedit.Locate('ID',params,[]);
  adoquery1.Parameters.ParamByName('Code').Value:='%'+trim(tblgoodedit.fieldbyname('LevelCode').AsString)+'%';
  adoquery1.Open;

  LevelStr :=tblgoodedit.fieldbyname('UpID').AsString;
  if Trim(LevelStr) ='' then  LevelStr :='0';
  if (tblgoodedit.FieldByName('GeneralACID').IsNull) or (tblgoodedit.FieldByName('GeneralACID').AsInteger=0 ) then
  begin
    TempAds.Close;
    TempAds.CommandText :='select distinct GeneralACID from DAGoodsClass'
    +' where ID='+LevelStr;
    TempAds.Open;
    if TempAds.IsEmpty then
    begin
      LevelStr :=Copy(Trim(tblgoodedit.fieldbyname('LevelCode').AsString),1,3);
      if Trim(LevelStr) ='' then  LevelStr :='001';
      TempAds.Close;
      TempAds.CommandText :='select distinct GeneralACID from DAGoodsClass'
          +' where LevelCode like'+Quotedstr(LevelStr+'%') ;
      TempAds.Open;
    end;
    if (not TempAds.FieldByName('GeneralACID').IsNull) then
    begin
      tblgoodedit.edit;
      tblgoodedit.FieldByName('GeneralACID').AsInteger :=TempAds.FieldByName('GeneralACID').AsInteger;
      tblgoodedit.Post;
    end;
  end;
  Result := ShowModal = mrOK;
end;


procedure TDAGoodsClassEditForm.tblGoodEditBeforePost(DataSet: TDataSet);
begin
  inherited;
  if dataset.State=dsinsert
  then begin
         dataset.FieldByName('CreateUserID').AsInteger:=Guarder.UserID;
         end;
  if dataset.FieldByName('Upid').IsNull
  then dataset.FieldByName('Upid').AsInteger:=-1;
end;

procedure TDAGoodsClassEditForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if tblGoodEdit.State in [dsedit,dsinsert]
  then  tblGoodEdit.Post;
  modalresult:=mroK;

end;

procedure TDAGoodsClassEditForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  modalresult:=mrcancel;
end;

procedure TDAGoodsClassEditForm.ADOTable1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  accept:=(dataset.FieldByName('ID').AsInteger<>DBLookupComboBox1.DataSource.DataSet.FieldByName('ID').AsInteger  )
        and (not (dataset.FieldByName('RecordState').AsString='É¾³ý'));
end;

procedure TDAGoodsClassEditForm.tblGoodEditFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TDAGoodsClassEditForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
adoquery1.Close;
end;

procedure TDAGoodsClassEditForm.FormShow(Sender: TObject);
begin
  inherited;
  GeneralACIDAds.Open;
  GeneralPACIDAds.Open;
  GeneralCACIDAds.Open;
  dbedit1.SetFocus;
  dbedit1.SelLength:=0;
end;

procedure TDAGoodsClassEditForm.DBLookupComboBox1CloseUp(Sender: TObject);
var LevelStr :String;
begin
  LevelStr :=tblgoodedit.fieldbyname('UpID').AsString;
  if Trim(LevelStr) ='' then  LevelStr :='0';
  TempAds.Close;
  TempAds.CommandText :='select distinct GeneralACID from DAGoodsClass'
  +' where ID='+LevelStr;
  TempAds.Open;
  if TempAds.IsEmpty then
  begin
    LevelStr :=Copy(Trim(tblgoodedit.fieldbyname('LevelCode').AsString),1,3);
    if Trim(LevelStr) ='' then  LevelStr :='001';
    TempAds.Close;
    TempAds.CommandText :='select distinct GeneralACID from DAGoodsClass'
        +' where LevelCode like'+Quotedstr(LevelStr+'%') ;
    TempAds.Open;
  end;
  if (not TempAds.FieldByName('GeneralACID').IsNull) then
  begin
    tblgoodedit.edit;
    tblgoodedit.FieldByName('GeneralACID').AsInteger :=TempAds.FieldByName('GeneralACID').AsInteger;
    tblgoodedit.Post;
  end;
end;

end.
