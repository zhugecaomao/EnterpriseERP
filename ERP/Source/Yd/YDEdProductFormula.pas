unit YDEdProductFormula;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, BaseVoucherEdit, Menus, ActnList, DB, ComCtrls, StdCtrls, Mask,
  DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, ADODB, QLDBLkp;

type
  TYDProductFormulaEditForm = class(TBaseVoucherEditForm)
    adsYDProductFormula: TADODataSet;
    adsYDProductFormulaIn: TADODataSet;
    Label1: TLabel;
    dbcbFormulaClass: TDBComboBox;
    adsYDProductFormulaInID: TAutoIncField;
    adsYDProductFormulaInMasterID: TIntegerField;
    adsYDProductFormulaInGoodsID: TIntegerField;
    adsYDProductFormulaInUnitId: TIntegerField;
    adsYDProductFormulaInQuantity: TBCDField;
    adsYDProductFormulaInGoalQuantity: TBCDField;
    adsYDProductFormulaInGoalUnitCost: TBCDField;
    adsYDProductFormulaInCost: TBCDField;
    adsYDProductFormulaInGoodsName: TStringField;
    adsYDProductFormulaInUnitName: TStringField;
    adsYDProductFormulaOut: TADODataSet;
    adsYDProductFormulaOututoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    BCDField3: TBCDField;
    BCDField4: TBCDField;
    dsYDProductFormulaOut: TDataSource;
    Label2: TLabel;
    adsFormulaClass: TADODataSet;
    adsYDProductFormulaOutCostRate: TBCDField;
    adsMSUnit: TADODataSet;
    adrQuery: TADOQuery;
    GetDefaultAction: TAction;
    CalcCostAction: TAction;
    Panel2: TPanel;
    Panel1: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    QLDBGrid1: TQLDBGrid;
    Splitter1: TSplitter;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    adsYDProductFormulaID: TAutoIncField;
    adsYDProductFormulaCreateDate: TDateTimeField;
    adsYDProductFormulaCreateUserID: TIntegerField;
    adsYDProductFormulaRecordState: TStringField;
    adsYDProductFormulaDate: TDateTimeField;
    adsYDProductFormulaCode: TStringField;
    adsYDProductFormulaBrief: TStringField;
    adsYDProductFormulaFormulaClass: TStringField;
    Label6: TLabel;
    ADSDAgoods: TADODataSet;
    DSDAgoods: TDataSource;
    QLDBLookupComboBox1: TQLDBLookupComboBox;
    adsYDProductFormulaMemo: TMemoField;
    procedure FormCreate(Sender: TObject);
    procedure SaveActionExecute(Sender: TObject);
    procedure adsYDProductFormulaOutNewRecord(DataSet: TDataSet);
    procedure adsYDProductFormulaInNewRecord(DataSet: TDataSet);
    procedure adsYDProductFormulaInUnitNameChange(Sender: TField);
    procedure adsYDProductFormulaInGoodsIDChange(Sender: TField);
    procedure adsYDProductFormulaInGoalQuantityChange(Sender: TField);
    procedure adsYDProductFormulaInGoalUnitCostChange(Sender: TField);
    procedure BCDField2Change(Sender: TField);
    procedure GetDefaultActionExecute(Sender: TObject);
    procedure CalcCostActionExecute(Sender: TObject);
  private
    procedure CalcCostIn;
    procedure CalcCostOut;
    function CalcTotal(DataSet: TADODataSet;Field:string):single;
    { Private declarations }
  public
    procedure Open(VoucherID: Integer); override;
    procedure New; override;
    { Public declarations }
  end;

var
  YDProductFormulaEditForm: TYDProductFormulaEditForm;

implementation

uses WSUtils, CommonDM;

{$R *.dfm}

function TYDProductFormulaEditForm.CalcTotal(DataSet: TADODataSet;Field:string):single;
var
  dTotal: single;
  sBM: string;
begin
  dTotal := 0;
  with DataSet do
  begin
    if not IsEmpty then
    begin
      sBM := BookMark;
      First;
      while not eof do
      begin
//showmessage(floattostr(FieldByName(Field).AsFloat));
        dTotal := dTotal + FieldByName(Field).AsFloat;
        Next;
      end;
      BookMark := sBM;
    end;
  end;
  Result := dTotal;
end;

procedure TYDProductFormulaEditForm.New;
begin
  inherited;
  adsYDProductFormula.FieldByName('RecordState').AsString := '临时';
  adsYDProductFormula.FieldByName('Code').AsString:=GetMaxCode('Code','YDProductFormulamaster',number);
  adsYDProductFormula.FieldByName('Date').AsString:=FormatDateTime('yyyy-mm-dd',date());

  with adsYDProductFormulaOut do
  begin
    Close;
    Parameters.ParamByName(VoucherIDField.FieldName).Value := Null;
    Open;
  end;
end;

procedure TYDProductFormulaEditForm.Open(VoucherID: Integer);
begin
  inherited Open(VoucherID);
  with adsYDProductFormulaOut do
  begin
    Close;
    Parameters.ParamByName('ID').Value := VoucherID;
    Open;
  end;

end;

procedure TYDProductFormulaEditForm.FormCreate(Sender: TObject);
begin
  inherited;
  VoucherTableName := 'YDProductFormula';
  with CommonData.adsDAGoods do
  begin
    Close;
    Open;
    Filtered := False;
    Filter := 'RecordState<>' + QuotedStr('删除');
    Filtered := True;
  end;
  with CommonData.adsMSUnit do
  begin
    close;
    Open;
    Filtered := False;
    Filter := 'RecordState<>' + QuotedStr('删除');
    Filtered := True;
  end;
  with adsYDProductFormulaOut do
  begin
    Close;
    Open;
  end;
  with adsFormulaClass do
  begin
    Close;
    Open;
    if not IsEmpty then
    begin
      while not eof do
      begin
        dbcbFormulaClass.Items.Add(FieldByName('FormulaClass').AsString);
        Next;
      end;
    end;
  end;
end;

procedure TYDProductFormulaEditForm.SaveActionExecute(Sender: TObject);
var
  InParentTrans: Boolean;
  Connection: TADOConnection;
begin
  inherited;
  Connection := adsyDProductFormulaout.Connection;
  InParentTrans := Connection.InTransaction;
  if not InParentTrans then Connection.BeginTrans;
  try
    InternalSave;
    if not InParentTrans then Connection.CommitTrans;
  except
    if not InParentTrans then Connection.RollbackTrans;
    raise;
  end;

end;

procedure TYDProductFormulaEditForm.adsYDProductFormulaOutNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('MasterID').AsInteger := VoucherIDField.AsInteger;
end;

procedure TYDProductFormulaEditForm.adsYDProductFormulaInNewRecord(
  DataSet: TDataSet);
begin
  inherited;
  DataSet.FieldByName('MasterID').AsInteger := VoucherIDField.AsInteger;
end;

procedure TYDProductFormulaEditForm.adsYDProductFormulaInUnitNameChange(
  Sender: TField);
begin
  inherited;
{  with adsMSUnit do
  begin
    Close;
    CommandText := 'SELECT * FROM MSUnit WHERE RecordState<>''删除'' AND GoalUnitID='+FieldByName('ID').AsString;
    Open;
  end;
}
end;

procedure TYDProductFormulaEditForm.adsYDProductFormulaInGoodsIDChange(
  Sender: TField);
begin
  inherited;
  with adrQuery do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM DAGoods WHERE RecordState<>''删除'' AND ID='+adsYDProductFormulaIn.FieldByName('GoodsID').AsString);
    Open;
  end;
  with adsYDProductFormulaIn do
  begin
    FieldByName('UnitId').AsInteger := adrQuery.FieldByName('UnitId').AsInteger;
    FieldByName('GoalUnitCost').AsFloat := adrQuery.FieldByName('PriceSales').AsFloat;
  end;
end;

procedure TYDProductFormulaEditForm.CalcCostIn;
begin
  with adsYDProductFormulaIn do
  begin
    FieldByName('Cost').AsFloat := FieldByName('GoalQuantity').AsInteger
       * FieldByName('GoalUnitCost').AsFloat;
  end;
end;
procedure TYDProductFormulaEditForm.adsYDProductFormulaInGoalQuantityChange(
  Sender: TField);
begin
  inherited;
  CalcCostIn;
end;

procedure TYDProductFormulaEditForm.adsYDProductFormulaInGoalUnitCostChange(
  Sender: TField);
begin
  inherited;
  CalcCostIn;
end;

procedure TYDProductFormulaEditForm.CalcCostOut;
begin
  with adsYDProductFormulaOut do
  begin
    FieldByName('Cost').AsFloat := FieldByName('GoalQuantity').AsInteger
       * FieldByName('GoalUnitCost').AsFloat;
  end;
end;

procedure TYDProductFormulaEditForm.BCDField2Change(Sender: TField);
begin
  inherited;
  CalcCostOut;
end;

procedure TYDProductFormulaEditForm.GetDefaultActionExecute(
  Sender: TObject);
var
  dTotalOut,dCheck: single;
  sBM: string;
begin
  inherited;
// 取默认分配系数；
  dTotalOut := CalcTotal(adsYDProductFormulaOut,'GoalQuantity');
  with adsYDProductFormulaOut do
  begin
    if not IsEmpty then
    begin
      sBM := BookMark;
      First;
      while not eof do
      begin
        Edit;
        FieldByName('CostRate').AsFloat := FieldByName('GoalQuantity').AsInteger/dTotalOut;
        Next;
      end;
      dTotalOut := CalcTotal(adsYDProductFormulaOut,'CostRate');
      dCheck := 1.0 - dTotalOut;
      if dCheck<>0 then
      begin
        Edit;
        FieldByName('CostRate').AsFloat := FieldByName('CostRate').AsFloat + dCheck;
      end;
      BookMark := sBM;
    end;
  end;
end;

procedure TYDProductFormulaEditForm.CalcCostActionExecute(Sender: TObject);
var
  dTotalOut,dTotalOutRate: single;
  sBM: string;
begin
  inherited;
// 计算成本；
  dTotalOutRate := CalcTotal(adsYDProductFormulaOut,'CostRate');

  {if dTotalOut <> 1 then
  begin
    MessageBox(Handle,'提示：分配系数输入不正确，分配系数之生应为 1 ，请重新输入之后再计算成本！','提示',MB_OK+MB_ICONERROR);
    exit;
  end;    }

  dTotalOut := CalcTotal(adsYDProductFormulaIn,'Cost');

  with adsYDProductFormulaOut do
  begin
    if not IsEmpty then
    begin
      sBM := BookMark;
      First;
      while not eof do
      begin
        Edit;
        FieldByName('Cost').AsFloat := FieldByName('CostRate').AsFloat*dTotalOut/dTotalOutRate;
        FieldByName('GoalUnitCost').AsFloat := FieldByName('Cost').AsCurrency /
        FieldByName('GoalQuantity').AsFloat;
        Next;
      end;
      BookMark := sBM;
    end;
  end;
end;

end.
