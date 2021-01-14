unit MSEdUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, DBCtrls, Mask;

type
  TMSEdUnitForm = class(TWSStandardEditForm)
    tblMSEdUnt: TADOTable;
    dsMSEdUnt: TDataSource;
    tblMSEdUntID: TAutoIncField;
    tblMSEdUntName: TStringField;
    tblMSEdUntGoalUnitID: TIntegerField;
    tblMSEdUntIsGoalUnit: TBooleanField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBCheckBox1: TDBCheckBox;
    Label4: TLabel;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    adotable1: TADOQuery;
    tblMSEdUntCreateDate: TDateTimeField;
    tblMSEdUntCreateUserID: TIntegerField;
    tblMSEdUntRecordState: TStringField;
    tblMSEdUntExchangeRate: TBCDField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure OKButtonClick(Sender: TObject);
    procedure ADOTable1FilterRecord(DataSet: TDataSet;
      var Accept: Boolean);
    procedure tblMSEdUntAfterInsert(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure tblMSEdUntAfterPost(DataSet: TDataSet);
    procedure tblMSEdUntBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  MSEdUnitForm: TMSEdUnitForm;

implementation

uses CommonDM;

{$R *.dfm}

function TMSEdUnitForm.Enter: Boolean;
begin
    tblMSEdUnt.Open;

 // adotable1.Parameters.ParamByName('ID').Value:=-11;
   adotable1.Open;
    tblMSEdUnt.Insert;

  Result := ShowModal = mrOK;
end;


function TMSEdUnitForm.Edit(const Params: Variant): Boolean;
begin
  tblMSEdUnt.Open;
//  adotable1.Parameters.ParamByName('ID').Value:=params;
  adotable1.Open;

  tblMSEdUnt.Locate('ID',Params,[]);
  tblmsedunt.Edit;

  Result := ShowModal = mrOK;
end;



procedure TMSEdUnitForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblMSEdUnt.close;
  adotable1.Close;
end;

procedure TMSEdUnitForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if   tblMSEdUnt.State in[dsedit,dsinsert]
  then  tblmsedunt.Post;

      modalresult:=MrOk;
end;

procedure TMSEdUnitForm.ADOTable1FilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
accept:=not (dataset.FieldByName('RecordState').AsString='É¾³ý');
end;

procedure TMSEdUnitForm.tblMSEdUntAfterInsert(DataSet: TDataSet);
begin
  inherited;
dataset.FieldByName('IsGoalUnit').Value:=false;
end;

procedure TMSEdUnitForm.FormShow(Sender: TObject);
begin
  inherited;
 dbedit1.SetFocus;
 dbedit1.SelLength:=0;
end;

procedure TMSEdUnitForm.tblMSEdUntAfterPost(DataSet: TDataSet);
var
tempquery:tadoquery;
begin
  inherited;    
if dataset.FieldByName('IsGoalUnit').AsBoolean and dataset.FieldByName('GoalUnitID').IsNull
then begin
       try
       tempquery:=tadoquery.Create(self);
       tempquery.Connection:=tblMSEdUnt.Connection;
       tempquery.Close;
       tempquery.SQL.Clear;
       tempquery.SQL.Add('update MSUnit set GoalUnitID = '+dataset.fieldbyname('ID').AsString
                           +' where ID='+dataset.fieldbyname('ID').AsString);
       tempquery.ExecSQL;
      finally

        tempquery.Free;
      end;  

     end;
end;

procedure TMSEdUnitForm.tblMSEdUntBeforePost(DataSet: TDataSet);
begin
  inherited;
if   dataset.FieldByName('IsGoalUnit').AsBoolean
then begin

      dataset.FieldByName('ExchangeRate').AsInteger:=1 ;
      dataset.FieldByName('GoalUnitID').Value:=null;

     end

end;

end.
