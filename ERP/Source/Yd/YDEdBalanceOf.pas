unit YDEdBalanceOf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, QLDBLkp;

type
  TYDEdBalanceOfForm = class(TBaseVoucherEditForm)
    BalanceOfMaster: TADODataSet;
    BalanceOfMasterID: TAutoIncField;
    BalanceOfMasterCreateDate: TDateTimeField;
    BalanceOfMasterCreateUserID: TIntegerField;
    BalanceOfMasterRecordState: TStringField;
    BalanceOfMasterCode: TStringField;
    BalanceOfMasterDate: TStringField;
    BalanceOfMasterBrief: TStringField;
    BalanceOfMasterPlanID: TIntegerField;
    BalanceOfMasterMemo: TStringField;
    BalanceOfDetial: TADODataSet;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    BalanceOfDetialID: TAutoIncField;
    BalanceOfDetialMasterID: TIntegerField;
    BalanceOfDetialFormulaID: TIntegerField;
    BalanceOfDetialPowerID: TIntegerField;
    BalanceOfDetialPowerIndex: TBCDField;
    BalanceOfDetialFormulaScale: TBCDField;
    BalanceOfDetialMemo: TStringField;
    PlanName: TADODataSet;
    BalanceOfMasterPlanName: TStringField;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    ADODataSet1: TADODataSet;
    ADODataSet2: TADODataSet;
    BalanceOfDetialFormulaName: TStringField;
    BalanceOfDetialPowerName: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
  end;

var
  YDEdBalanceOfForm: TYDEdBalanceOfForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}

procedure TYDEdBalanceOfForm.New;
begin
  inherited;
PlanName.Open;
ADODataSet1.Open;
ADODataSet2.Open;
BalanceOfMaster.FieldByName('Date').AsDateTime :=date;
BalanceOfMaster.FieldByName('Code').AsString:=GetMaxCode('Code','YDBalanceOfMaterialMaster',Number);
BalanceOfMaster.FieldByName('CreateUserID').AsInteger :=Guarder.UserID;
end;

procedure TYDEdBalanceOfForm.Open(VoucherID: Integer);
begin
PlanName.open;

ADODataSet1.Open;
ADODataSet2.Open;
  inherited Open(VoucherID);

end;




procedure TYDEdBalanceOfForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'YDBalanceOfMaterial';
end;

end.
