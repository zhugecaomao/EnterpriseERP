

unit QLDBFlt;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, StdCtrls, DB, ExtCtrls, ComCtrls;

type

  {
    '等于;不等于;大于;大于或等于;小于;小于或等于;始于;并非起始于;' +
    '止于;并非结束于;包含;不包含';
  }

  TFilterLogical = (flAnd, flOr);

  TFilterCondition = (fcEqual, fcNotEqual, fcGreat, fcGreatEqual,
    fcLess, fcLessEqual, fcBeginWith, fcNotBeginWith, fcEndWith, fcNotEndWith,
    fcContain, fcNotContain);

  { Forward declare }

  TQLDBFilterDialog = class;

  { TQLDBFilterForm }

  TQLDBFilterForm = class(TForm)
    gbFilterConditions: TGroupBox;
    lbFilter: TListBox;
    gbDefineCondition: TGroupBox;
    cbFields: TComboBox;
    Label1: TLabel;
    rbAnd: TRadioButton;
    rbOr: TRadioButton;
    cbConditions: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    btnDelete: TButton;
    btnNewConditions: TButton;
    btnAddToList: TButton;
    nbValue: TNotebook;
    edtValue: TEdit;
    cbBoolean: TComboBox;
    dtpDate: TDateTimePicker;
    procedure btnAddToListClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnNewConditionsClick(Sender: TObject);
    procedure lbFilterDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lbFilterDblClick(Sender: TObject);
    procedure edtValueChange(Sender: TObject);
    procedure cbFieldsChange(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    FFilterDialog: TQLDBFilterDialog;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
  end;

  { TQLDBFilterDialog }

  TQLDBFilterDialogOption = (dfdOnlyBuildFilter);
  TQLDBFilterDialogOptions = set of TQLDBFilterDialogOption;

//  TFilterStrings = class(TStrings)

  TQLDBFilterDialog = class(TComponent)
  private
    FFilterStrings: TStrings;
    FFilterFields: string;
//    FFieldTypes: array of TFieldType;
    FDataSet: TDataSet;
    FConditions: TStrings;
    FTitle: string;
    FSaveOnFilterRecord: TFilterRecordEvent;
    FSaveFiltered: Boolean;
    FPreFiltered: Boolean;
    FOptions: TQLDBFilterDialogOptions;
//    function GetDataSet: TDataSet;
    function GetFilterFields: string;
    procedure SetTitle(const Value: string);
    procedure SetDataSet(Value: TDataSet);
    procedure SetFilterFields(const Value: string);
    function CanUseFilterCondition(Field: TField; FilterCondition: TFilterCondition): Boolean;
    procedure FilterStringsChange(Sender: TObject);
  protected
//    procedure InitFieldTypes;
    procedure DataSetFilterRecord(DataSet: TDataSet; var Accept: Boolean); virtual;
//    property DataSet: TDataSet read GetDataSet;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Execute: Boolean;
    function GetFilter: string; virtual;
    procedure GetFilterDescriptions(List: TStrings);
    property FilterStrings: TStrings read FFilterStrings;
  published
    property DataSet: TDataSet read FDataSet write SetDataSet;
    property FilterFields: string read GetFilterFields write SetFilterFields;
    property Title: string read FTitle write SetTitle;
    property Options: TQLDBFilterDialogOptions read FOptions write FOptions;
  end;

implementation

uses StrUtils;

{$R *.DFM}

function ExtractSubStr(const Str: string; var Pos: Integer; Delimiter: Char = ';'): string;
var
  I: Integer;
begin
  I := Pos;
  while (I <= Length(Str)) and (Str[I] <> Delimiter) do Inc(I);
  Result := Copy(Str, Pos, I - Pos);
  if (I <= Length(Str)) and (Str[I] = Delimiter) then Inc(I);
  Pos := I;
end;

function IndexOfFieldName(const Fields: string; Index: Integer): string;
var
  I, J, Pos: Integer;
begin
  Pos := 1;
  I := Pos;
  J := -1;
  while I <= Length(Fields) do
  begin
    if Fields[I] = ';' then
    begin
      Inc(J);
      if (J = Index) or (Index = -1) then Break;
      Pos := I + 1;
    end;
    Inc(I);
  end;
  Result := Trim(Copy(Fields, Pos, I - Pos));
//  if (I <= Length(Fields)) and (Fields[I] = ';') then Inc(I);
end;

{ TQLDBFilterForm }

constructor TQLDBFilterForm.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if AOwner is TQLDBFilterDialog then FFilterDialog := AOwner as TQLDBFilterDialog;
end;

procedure TQLDBFilterForm.btnAddToListClick(Sender: TObject);
var
  S: string;
begin
  if rbAnd.Checked then S := '0;'
  else S := '1;';
//  S := S + TField(cbFields.Items.Objects[cbFields.ItemIndex]).FieldName{IntToStr(cbFields.ItemIndex)} + ';' +
//    IntToStr(Integer(cbConditions.Items.Objects[cbConditions.ItemIndex])) + ';';
  S := S + IntToStr(Integer(cbConditions.Items.Objects[cbConditions.ItemIndex])) + ';';
  case nbValue.PageIndex of
    0: S := S + edtValue.Text;
    1: S := S + cbBoolean.Text;
    2: S := S + DateToStr(dtpDate.Date);
  end;
//    + edtValue.Text;
  lbFilter.Items.AddObject(S, cbFields.Items.Objects[cbFields.ItemIndex]);
  lbFilter.ItemIndex := lbFilter.Items.Count - 1;
//  lbFilter.Items.AddObject(cbFields.Text + ' ' + cbConditions.Text + ' ' +
//    edtValue.Text, TObject(Ord(rbAnd.Checked)));
end;

procedure TQLDBFilterForm.btnDeleteClick(Sender: TObject);
begin
  lbFilter.Items.Delete(lbFilter.ItemIndex);
  lbFilter.ItemIndex := lbFilter.Items.Count - 1;
end;

procedure TQLDBFilterForm.btnNewConditionsClick(Sender: TObject);
begin
  lbFilter.Clear;
end;

procedure TQLDBFilterForm.lbFilterDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
const
  Offset = 2;
var
  I: Integer;
  S, Temp: string;
begin
  with (Control as TListBox) do
  begin
    Temp := Items[Index];
    I := 1;
    if Index <> 0 then
    begin
      if ExtractSubStr(Temp, I, ';') = '0' then S := '与'
      else S := '或';
    end else ExtractSubStr(Temp, I);
    S := S + ' ' + TField(Items.Objects[Index]).DisplayLabel;//[StrToInt(ExtractSubStr(Temp, I))];
    S := S + ' ' + cbConditions.Items[StrToInt(ExtractSubStr(Temp, I))];
    S := S + ' ' + ExtractSubStr(Temp, I) + ' 。';
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left + Offset, Rect.Top, S);
  end;
end;

procedure TQLDBFilterForm.lbFilterDblClick(Sender: TObject);
var
  I: Integer;
  Temp: string;
begin
  Temp := lbFilter.Items[lbFilter.ItemIndex];
  I := 1;
  if ExtractSubStr(Temp, I) = '0' then rbAnd.Checked := True
  else rbOR.Checked := True;
  cbFields.ItemIndex := cbFields.Items.IndexOfObject(lbFilter.Items.Objects[lbFilter.ItemIndex]);// StrToInt(ExtractSubStr(Temp, I));
  cbFields.OnChange(cbFields);
  cbConditions.ItemIndex := cbConditions.Items.IndexOfObject(
    TObject(StrToInt(ExtractSubStr(Temp, I))));
  case nbValue.PageIndex of
    0: edtValue.Text := ExtractSubStr(Temp, I);
    1: cbBoolean.ItemIndex := cbBoolean.Items.IndexOf(ExtractSubStr(Temp, I));
    2: dtpDate.Date := StrToDateTime(ExtractSubStr(Temp, I));
  end;
end;

procedure TQLDBFilterForm.edtValueChange(Sender: TObject);
begin
//  btnAddToList.Enabled := TEdit(Sender).Text <> '';
end;

procedure TQLDBFilterForm.cbFieldsChange(Sender: TObject);
var
  I: Integer;
begin
  cbConditions.Clear;
  for I := 0 to FFilterDialog.FConditions.Count - 1 do
    if FFilterDialog.CanUseFilterCondition(TField(cbFields.Items.Objects[cbFields.ItemIndex]),
      TFilterCondition(FFilterDialog.FConditions.Objects[I])) then
      cbConditions.Items.AddObject(FFilterDialog.FConditions[I],
        FFilterDialog.FConditions.Objects[I]);
  cbConditions.Enabled := cbConditions.Items.Count > 0;
  if cbConditions.Enabled then cbConditions.ItemIndex := 0;
  case TField(cbFields.Items.Objects[cbFields.ItemIndex]).DataType of
    ftBoolean: nbValue.PageIndex := 1;
    ftDate, ftDateTime: nbValue.PageIndex := 2;
    ftString, ftWideString, ftFixedChar, ftMemo, ftFmtMemo:
    begin
      cbConditions.ItemIndex := cbConditions.Items.IndexOfObject(TObject(fcContain));
      nbValue.PageIndex := 0;
    end
    else nbValue.PageIndex := 0;
  end;
end;

{ TQLDBFilterDialog }

constructor TQLDBFilterDialog.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FConditions := TStringList.Create;
  with FConditions do
  begin
    AddObject('等于', TObject(fcEqual));
    AddObject('不等于', TObject(fcNotEqual));
    AddObject('大于', TObject(fcGreat));
    AddObject('大于或等于', TObject(fcGreatEqual));
    AddObject('小于', TObject(fcLess));
    AddObject('小于或等于', TObject(fcLessEqual));
    AddObject('始于', TObject(fcBeginWith));
    AddObject('并非起始于', TObject(fcNotBeginWith));
    AddObject('止于', TObject(fcEndWith));
    AddObject('并非结束于', TObject(fcNotEndWith));
    AddObject('包含', TObject(fcContain));
    AddObject('不包含', TObject(fcNotContain));
  end;
  FTitle := '筛选';
  FFilterStrings := TStringList.Create;
  TStringList(FFilterStrings).OnChange := FilterStringsChange;
end;

destructor TQLDBFilterDialog.Destroy;
begin
  DataSet := nil;
  FConditions.Free;
  FFilterStrings.Free;
  inherited;
end;

function TQLDBFilterDialog.CanUseFilterCondition(Field: TField;
  FilterCondition: TFilterCondition): Boolean;
begin
  case Field.DataType of
    ftUnknown, ftString, ftFixedChar, ftWideString, ftMemo, ftVariant, ftBlob,
    ftFmtMemo:
      Result := True;
    ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD, ftBytes,
    ftVarBytes, ftAutoInc, ftLargeint:
      Result := FilterCondition in [fcEqual, fcNotEqual, fcGreat, fcGreatEqual,
        fcLess, fcLessEqual];
    ftBoolean: Result := FilterCondition in [fcEqual, fcNotEqual];
    ftDate, ftTime, ftDateTime:
      Result := FilterCondition in [fcEqual, fcNotEqual, fcGreat, fcGreatEqual,
        fcLess, fcLessEqual];
    {ftGraphic, ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor, ftADT
    ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, ftInterface,
    ftIDispatch, ftGuid}
    else Result := False;
  end;
end;

procedure TQLDBFilterDialog.DataSetFilterRecord(DataSet: TDataSet; var Accept: Boolean);

  function CompareFieldValue(Field: TField; Value: string): Double;
  begin
    case Field.DataType of
//      ftUnknown, ftString, ftFixedChar, ftWideString, ftMemo, ftVariant, ftBlob,
//      ftFmtMemo:
//        Result := True;
      ftSmallint, ftInteger, ftWord, ftAutoInc, ftLargeint:
        Result := Field.AsInteger - StrToInt(Value);
      ftFloat, ftCurrency, ftBCD, ftBytes, ftVarBytes:
          Result := Field.AsFloat - StrToFloat(Value);
//        Result := FilterCondition in [fcEqual, fcNotEqual, fcGreat, fcGreatEqual,
//          fcLess, fcLessEqual];
      ftBoolean: if Field.AsBoolean and (Value = '是') or
        (not Field.AsBoolean and (Value = '否')) then Result := 0
        else Result := 1;//FilterCondition in [fcEqual, fcNotEqual];
      ftDate: Result := Trunc(Field.AsDateTime) - StrToDate(Value);
      ftDateTime: Result := Field.AsDateTime - StrToDateTime(Value);
      ftTime: Result := Frac(Field.AsDateTime) - StrToTime(Value);
//        Result := FilterCondition in [fcEqual, fcNotEqual, fcGreat, fcGreatEqual,
//          fcLess, fcLessEqual];
      {ftGraphic, ftParadoxOle, ftDBaseOle, ftTypedBinary, ftCursor, ftADT
      ftArray, ftReference, ftDataSet, ftOraBlob, ftOraClob, ftInterface,
      ftIDispatch, ftGuid}
      else Result := AnsiCompareStr(Trim(Field.DisplayText), Value);
    end;
  end;

var
  I, APos: Integer;
  Condition: TFilterCondition;
  FieldName, Value, Temp: string;
begin
  Accept := True;
//  if Accept = False then ShowMessage('Accept');
  if Assigned(FSaveOnFilterRecord) then FSaveOnFilterRecord(DataSet, Accept);
  if Accept then
    for I := 0 to FFilterStrings.Count - 1 do
    begin
      Temp := FFilterStrings[I];
//      ShowMessage(Temp);

      APos := 1;
      if I <> 0 then
      begin
        if ExtractSubStr(Temp, APos, ';') = '0' then // Logic AND
        begin
          if not Accept then Break
        end else if Accept then Break;
      end else ExtractSubStr(Temp, APos, ';');
      FieldName := TField(FFilterStrings.Objects[I]).FieldName;//ExtractFieldName(Temp, APos);//IndexOfFieldName(FFilterFields, StrToInt(ExtractFieldName(Temp, APos)));
      Condition := TFilterCondition(StrToInt(ExtractSubStr(Temp, APos, ';')));
      Value := ExtractSubStr(Temp, APos, ';');
//      if DataSet.FieldByName(FieldName).DataType in [ftDate, ftDateTime] then
//        Value := DateToStr(StrToDate(Value));
      case Condition of
        fcEqual: Accept := CompareFieldValue(DataSet.FieldByName(FieldName), Value) = 0;
        fcNotEqual: Accept := CompareFieldValue(DataSet.FieldByName(FieldName), Value) <> 0;
        fcGreat: Accept := CompareFieldValue(DataSet.FieldByName(FieldName), Value) > 0;
        fcGreatEqual: Accept := CompareFieldValue(DataSet.FieldByName(FieldName), Value) >= 0;
        fcLess: Accept := CompareFieldValue(DataSet.FieldByName(FieldName), Value) < 0;
        fcLessEqual: Accept := CompareFieldValue(DataSet.FieldByName(FieldName), Value) <= 0;
        fcBeginWith: Accept := LeftStr(DataSet.FieldByName(FieldName).AsString, Length(Value)) = Value;
        fcNotBeginWith: Accept := LeftStr(DataSet.FieldByName(FieldName).AsString, Length(Value)) <>  Value;
        fcEndWith: Accept := RightStr(DataSet.FieldByName(FieldName).AsString, Length(Value)) =  Value;
        fcNotEndWith: Accept := RightStr(DataSet.FieldByName(FieldName).AsString, Length(Value)) <>  Value;
        fcContain: Accept := AnsiPos(Value, DataSet.FieldByName(FieldName).AsString) > 0;
        fcNotContain: Accept := AnsiPos(Value, DataSet.FieldByName(FieldName).AsString) = 0;
      end;
//      ShowMessage(DataSet.FieldByName(FieldName).AsString + ' - ' + Value + ' = ' +
//        FloatToStr(CompareFieldValue(DataSet.FieldByName(FieldName), Value)));
    end;
end;

//function TQLDBFilterDialog.GetDataSet: TDataSet;
//begin
//  if Assigned(FDataSource) then Result := FDataSource.DataSet
//  else Result := nil;
//end;

function TQLDBFilterDialog.GetFilter;

  function ValueToFilterText(const FieldName, Value: string): string;
  begin
    if Assigned(DataSet) then
      case DataSet.FieldByName(FieldName).DataType of
         ftSmallint, ftInteger, ftWord, ftAutoInc: Result := Value;
         ftFloat, ftCurrency, ftBCD, ftVarBytes, ftBytes, ftTypedBinary: Result := Value;
  //       ftDate, ftTime, ftDateTime:
         ftBoolean:
           if Value = '是' then Result := 'True'
           else Result := 'False';
         else
           Result := '''' + Value + '''';
      end
    else Result := Value;
  end;

var
  Temp, FieldName: string;
  I, Pos: Integer;
begin
  Result := '';
  for I := 0 to FFilterStrings.Count - 1 do
  begin
    Temp := FFilterStrings[I];
    Pos := 1;
    if I <> 0 then
    begin
      if ExtractSubStr(Temp, Pos, ';') = '0' then Result := Result + ' AND '
      else Result := Result + ' OR ';
    end else ExtractSubStr(Temp, Pos, ';');
    FieldName := TField(FFilterStrings.Objects[I]).FieldName;//ExtractFieldName(Temp, APos);//IndexOfFieldName(FFilterFields, StrToInt(ExtractFieldName(Temp, APos)));

//    FieldName := ExtractSubStr(Temp, Pos, ';');//IndexOfFieldName(FFilterFields, StrToInt(ExtractSubStr(Temp, Pos, ';')));
//    Result := Result + FieldName;
    case TFilterCondition(StrToInt(ExtractSubStr(Temp, Pos, ';'))) of
      fcEqual: Result := Result + FieldName + ' = ' + ValueToFilterText(FieldName, ExtractSubStr(Temp, Pos, ';'));
      fcNotEqual: Result := Result + FieldName + ' <> ' + ValueToFilterText(FieldName, ExtractSubStr(Temp, Pos, ';'));
      fcGreat: Result := Result + FieldName + ' >' + ValueToFilterText(FieldName, ExtractSubStr(Temp, Pos, ';'));
      fcGreatEqual: Result := Result + FieldName + ' >= ' + ValueToFilterText(FieldName, ExtractSubStr(Temp, Pos, ';'));
      fcLess: Result := Result + FieldName + ' < ' + ValueToFilterText(FieldName, ExtractSubStr(Temp, Pos, ';'));
      fcLessEqual: Result := Result + FieldName + ' <= ' + ValueToFilterText(FieldName, ExtractSubStr(Temp, Pos, ';'));
      fcBeginWith: Result := Result + FieldName + ' LIKE ''' + ExtractSubStr(Temp, Pos, ';') + '%''';
      fcNotBeginWith: Result := Result + ' NOT ' + FieldName + ' LIKE ''' + ExtractSubStr(Temp, Pos, ';') + '%''';
      fcEndWith: Result := Result + FieldName + ' LIKE ''%' +  ExtractSubStr(Temp, Pos, ';') + '''';
      fcNotEndWith: Result := Result + ' NOT ' + FieldName + ' LIKE ''%' +  ExtractSubStr(Temp, Pos, ';') + '''';
      fcContain: Result := Result + FieldName + ' LIKE ''%' +  ExtractSubStr(Temp, Pos, ';') + '%''';
      fcNotContain: Result := Result + ' NOT ' + FieldName + 'LIKE ''%' +  ExtractSubStr(Temp, Pos, ';') + '%''';
    end;
  end;
  Result := Trim(Result);
end;

procedure TQLDBFilterDialog.GetFilterDescriptions(List: TStrings);
var
  I, Pos: Integer;
  S, Temp: string;
begin
  List.Clear;
  for I := 0 to FFilterStrings.Count - 1 do
  begin
    Temp := FFilterStrings[I];
    Pos := 1;
    if I <> 0 then
    begin
      if ExtractSubStr(Temp, Pos) = '0' then S := '与'
      else S := '或';
    end else ExtractSubStr(Temp, Pos);
    S := S + ' ' + IndexOfFieldName(FilterFields, StrToInt(ExtractSubStr(Temp, Pos)));
    S := S + ' ' + FConditions[StrToInt(ExtractSubStr(Temp, Pos))];
    S := S + ' ' + ExtractSubStr(Temp, Pos) + ' 。';
    List.Add(S);
  end;
end;

function TQLDBFilterDialog.GetFilterFields: string;
begin
  Result := FFilterFields;
//  Result := StringReplace(FFilterFields.CommaText, ',', ';', rfReplaceAll);
end;

procedure TQLDBFilterDialog.SetFilterFields(const Value: string);
begin
  if FFilterFields <> Value then
  begin
    FFilterFields := Value;
//    InitFieldTypes;
  end;
end;

{procedure TQLDBFilterDialog.InitFieldTypes;
var
  Pos: Integer;
  FieldName: string;
begin
  if Assigned(DataSet) then
  begin
    SetLength(FFieldTypes, 0);
    Pos := 1;
    FieldName := ExtractFieldName(FFilterFields, Pos);
    while FieldName <> '' do
    begin
      SetLength(FFieldTypes, Length(FFieldTypes) + 1);
      FFieldTypes[High(FFieldTypes)] := DataSet.FieldByName(FieldName).DataType;
      FieldName := ExtractFieldName(FFilterFields, Pos);
    end;
  end;
end;
}
procedure TQLDBFilterDialog.SetTitle(const Value: string);
begin
  if FTitle <> Value then
  begin
    FTitle := Value;
  end;
end;

procedure TQLDBFilterDialog.SetDataSet(Value: TDataSet);
begin
  if FDataSet <> Value then
  begin
    if Assigned(DataSet) then
    begin
      DataSet.OnFilterRecord := FSaveOnFilterRecord;
      DataSet.Filtered := FSaveFiltered;
    end;
    FDataSet := Value;
    if Assigned(DataSet) then
    begin
      FSaveOnFilterRecord := DataSet.OnFilterRecord;
      FSaveFiltered := DataSet.Filtered;
      DataSet.OnFilterRecord := DataSetFilterRecord;
    end;
  end;
end;


function TQLDBFilterDialog.Execute;
var
  FilterForm: TQLDBFilterForm;

  procedure FillFieldsComboBox;
  var
    I: Integer;
//    FieldName: string;
    AFields: TList;
  begin
//    I := 1;
//    FieldName := ExtractFieldName(FFilterFields, I);
    if Assigned(DataSet) then
    begin
      AFields := TList.Create;
      try
        with DataSet do
        begin
          GetFieldList(AFields, FFilterFields);
          for I := 0 to Fields.Count - 1 do
            if AFields.IndexOf(Fields[I]) >= 0 then
              FilterForm.cbFields.Items.AddObject(Fields[I].DisplayLabel, Fields[I]);
        end;
      finally
        AFields.Free;
      end;
    end;

//      while FieldName <> '' do
//      begin
//        FilterForm.cbFields.Items.Add(FDataSource.DataSet.FieldByName(FieldName).DisplayLabel);
//        FieldName := ExtractFieldName(FFilterFields, I);
//      end
//    else
//      while FieldName <> '' do
//      begin
//        FilterForm.cbFields.Items.Add(FieldName);
//        FieldName := ExtractFieldName(FFilterFields, I);
//      end
  end;

begin
  Result := False;
  if not Assigned(FDataSet) then
    raise Exception.Create('Missing DataSet property');
  FilterForm := TQLDBFilterForm.Create(Self);
  with FilterForm do
    try
      Caption := FTitle;
      FillFieldsComboBox;
      cbConditions.Items.Assign(FConditions); //.Items.CommaText := StringReplace(FConditions, ';', ',', [rfReplaceAll]);
      lbFilter.Items.Assign(FFilterStrings);
      cbConditions.ItemIndex := 0;
      if cbFields.Items.Count > 0 then
      begin
        cbFields.ItemIndex := 0;
        cbFields.OnChange(cbFields);
      end;
      if ShowModal = mrOK then
      begin
        FFilterStrings.Assign(lbFilter.Items);
        Result := True;
      end;
    finally
      Free;
    end;
end;

procedure TQLDBFilterDialog.FilterStringsChange(Sender: TObject);
var
  DataSetFiltered: Boolean;
begin
  if not (dfdOnlyBuildFilter in FOptions) and Assigned(DataSet) then
  begin
    DataSetFiltered := DataSet.Filtered;
    DataSet.Filtered := False;
    if (FFilterStrings.Count > 0) or (DataSetFiltered and not FPreFiltered) then
      DataSet.Filtered := True;
    if DataSetFiltered and not FPreFiltered and not FSaveFiltered then FSaveFiltered := True;
    FPreFiltered := DataSet.Filtered;
  end;
end;

procedure TQLDBFilterForm.btnOKClick(Sender: TObject);
begin
  if (lbFilter.Count = 0) and (MessageDlg('是否将定义的条件添加至列表？', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    btnAddToList.Click;
  ModalResult := mrOK;
end;

end.
