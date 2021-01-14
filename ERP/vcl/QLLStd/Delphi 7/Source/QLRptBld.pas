
unit QLRptBld;

interface

uses Windows, SysUtils, Classes, QuickRpt, QRExtra, QRCtrls, DBGrids;

type
  TQLDBGridReportBuilder = class(TQRBuilder)
  private
    FDBGrid: TDBGrid;
    FAutoWidth: Boolean;
    FSummaryFields: TStrings;
    FAutoOrientation: Boolean;
    FHasRowLines: Boolean;
    FHasColLines: Boolean;
    FSubDetailAutoFit: Boolean;
    FSubDetailPrintFields: string;
    FPrintFields: string;
    FSubDetailDBGrid: TDBGrid;
    FSubDetailSummaryFields: TStrings;
    function GetReport: TCustomQuickRep;
    procedure SetReport(const Value: TCustomQuickRep);
    procedure SetDBGrid(const Value: TDBGrid);
  protected
    procedure SetActive(Value: Boolean); override;
    procedure Build;
    procedure BuildList(Grid: TDBGrid; AutoFit: Boolean; ColumnHeaderBand, DetailBand,
      SummaryBand: TQRCustomBand; FieldList: TList; SummaryFields: TStrings); virtual;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property AutoFit: Boolean read FAutoWidth write FAutoWidth;
    property SubDetailAutoFit: Boolean read FSubDetailAutoFit write FSubDetailAutoFit;
    property SubDetailDBGrid: TDBGrid read FSubDetailDBGrid write FSubDetailDBGrid;
    property SubDetailPrintFields: string read FSubDetailPrintFields write FSubDetailPrintFields;
    property SubDetailSummaryFields: TStrings read FSubDetailSummaryFields;
  published
    property Active;
    property AutoWidth: Boolean read FAutoWidth write FAutoWidth;
    property AutoOrientation: Boolean read FAutoOrientation write FAutoOrientation;
    property DBGrid: TDBGrid read FDBGrid write SetDBGrid;
    property HasColLines: Boolean read FHasColLines write FHasColLines;
    property HasRowLines: Boolean read FHasRowLines write FHasRowLines;
    property Report: TCustomQuickRep read GetReport write SetReport;
    property PrintFields: string read FPrintFields write FPrintFields;
    property SummaryFields: TStrings read FSummaryFields;
    property Font;
    property Orientation;
    property Title;
  end;

implementation

uses StrUtils, Printers, Graphics, DB, Controls, TypInfo, Dialogs{$IFDEF DEBUG}, DbugIntf{$ENDIF};

type
  THackDBGrid = class(TDBGrid);

  TQRDBText = class(TQRCustomLabel)
  private
//    ComboBox : TEdit;
    Field : TField;
    FieldNo : integer;
    FieldOK : boolean;
    DataSourceName : string[30];
    FDataSet : TDataSet;
    FDataField : string;
    FMask : string;
    IsMemo : boolean;
    procedure SetDataSet(Value : TDataSet);
    procedure SetDataField(Value : string);
    procedure SetMask(Value : string);
  protected
//    function GetCaptionBased : boolean; override;
    procedure Loaded; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
    procedure Prepare; override;
    procedure Print(OfsX, OfsY : integer); override;
    procedure Unprepare; override;
  public
    constructor Create(AOwner : TComponent); override;
{.$ifdef ver110}
    function UseRightToLeftAlignment: boolean; override;
{.$endif}
  published
    property Alignment;
    property AlignToBand;
    property AutoSize;
    property AutoStretch;
{.$ifdef ver110}
    property BiDiMode;
    property ParentBiDiMode;
{.$endif}
    property Color;
    property DataSet : TDataSet read FDataSet write SetDataSet;
    property DataField : string read FDataField write SetDataField;
    property Font;
    property Mask : string read FMask write SetMask;
    property OnPrint;
    property ParentFont;
    property Transparent;
    property WordWrap;
  end;

function OkToChangeFieldAlignment(AField: TField; Alignment: TAlignment): Boolean;
begin
  { dont change the alignment for these fields:
    ftSmallInt     ftInteger      ftWord         ftFloat        ftCurrency
    ftBCD          ftDate         ftTime         ftDateTime     ftAutoInc }
  if Assigned(AField) then with AField do
    Result := (DataType < ftSmallInt) or
              (DataType = ftBoolean) or
              ((DataType > ftDateTime) and (DataType <> ftAutoInc))
  else
    Result := Alignment <> taCenter;
end;


function QRDBUseRightToLeftAlignment(AControl: TControl; AField: TField): Boolean;
var
  AAlignment: TAlignment;
begin
  if Assigned(AField) then
    AAlignment := AField.Alignment
  else
    AAlignment := taLeftJustify;
  { Calling AControl.UseRightToLeftAlignment cause an endless recursion }
  Result := (AControl.BiDiMode = bdRightToLeft) and
    (OkToChangeFieldAlignment(AField, AAlignment));
end;

constructor TQRDBText.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);
  DataSourceName := '';
//  ComboBox := nil;
  IsMemo := false;
end;

procedure TQRDBText.SetDataSet(Value : TDataSet);
begin
  FDataSet := Value;
  if Value <> nil then
    Value.FreeNotification(self);
end;

//function TQRDBText.GetCaptionBased : boolean;
//begin
//  Result := not IsMemo;
//end;

procedure TQRDBText.SetDataField(Value : string);
begin
  FDataField := Value;
  Caption := Value;
end;

procedure TQRDBText.Loaded;
var
  aComponent : TComponent;
begin
  inherited Loaded;
  if DataSourceName<>'' then
  begin
    aComponent := Owner.FindComponent(DataSourceName);
    if (aComponent <> nil) and (aComponent is TDataSource) then
      DataSet:=TDataSource(aComponent).DataSet;
  end;
end;

procedure TQRDBText.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if (Operation = opRemove) then
    if AComponent = FDataSet then
      FDataSet := nil;
end;

procedure TQRDBText.SetMask(Value : string);
begin
  FMask := Value;
end;

procedure TQRDBText.Prepare;
begin
  inherited Prepare;
  if assigned(FDataSet) then
  begin
    Field := FDataSet.FindField(FDataField);
    if Field <> nil then
    begin
      FieldNo := Field.Index;
      FieldOK := true;
      if (Field is TMemoField) or (Field is TBlobField) then
      begin
        Caption := '';
        IsMemo := true;
      end
        else IsMemo := false;
    end;
  end else
  begin
    Field := nil;
    FieldOK := false;
  end;
end;

procedure TQRDBText.Print(OfsX, OfsY : integer);
begin
  if IsEnabled then
  begin
    if FieldOK then
    begin
      if FDataSet.DefaultFields then;
//        Field := FDataSet.Fields[FieldNo];
    end
    else
      Field := nil;
    if assigned(Field) then
    begin
      try
        if (Field is TMemoField) or
           (Field is TBlobField) then
        begin
          Lines.Text := TMemoField(Field).AsString;
        end else
          if (Mask = '') or (Field is TStringField) then
            if not (Field is TBlobField) then
              Caption := Field.DisplayText
            else
              Caption := Field.AsString
          else
          begin
            if (Field is TIntegerField) or
               (Field is TSmallIntField) or
               (Field is TWordField) then
               Caption := FormatFloat(Mask, TIntegerField(Field).Value * 1.0)
            else
              if (Field is TFloatField) or
                 (Field is TCurrencyField) or
                 (Field is TBCDField) then
                 Caption := FormatFloat(Mask,TFloatField(Field).Value)
              else
                if (Field is TDateTimeField) or
                   (Field is TDateField) or
                   (Field is TTimeField) then
                  Caption := FormatDateTime(Mask,TDateTimeField(Field).Value);
          end;
      except
        Caption := '';
      end;
    end else
      Caption := '';
//    DoneFormat := false;
    inherited Print(OfsX,OfsY);
  end;
end;

procedure TQRDBText.Unprepare;
begin
  Field := nil;
  inherited Unprepare;
  if DataField <> '' then
    SetDataField(DataField) { Reset component caption }
  else
    SetDataField(Name);
end;

{.$ifdef ver110}
function TQRDBText.UseRightToLeftAlignment: Boolean;
begin
  Result := QRDBUseRightToLeftAlignment(Self, Field);
end;
{.$endif}

{ TQDBGridBuilder }

procedure TQLDBGridReportBuilder.SetActive(Value: Boolean);
begin
  if Value <> Active then begin
    if Value then
    begin
      inherited SetActive(True);
      Report.FreeNotification(Self);
      Build;
    end
    else begin
      // 如果 Report = nil 的话，调用 inherited SetActive(False) 会引起异常
      if Report = nil then Report := TCustomQuickRep.Create(Self);
      inherited SetActive(False);
    end;
  end;
end;

procedure TQLDBGridReportBuilder.Build;
var
  FieldList: TList;
  SubDetail: TQRSubDetail;
  I: Integer;
  S: string;
begin
  FieldList := TList.Create;
  try
    if FDBGrid <> nil then
    begin
      TQuickRep(Report).DataSet := FDBGrid.DataSource.DataSet;
      Report.Bands.HasColumnHeader := True;
      Report.Bands.HasDetail := True;
      if (FSummaryFields.Count > 0) and not Report.Bands.HasSummary then
        Report.Bands.HasSummary := True;
    //  AHeight := Round(Report.Bands.DetailBand.Height / 1.5);
      if FPrintFields = '' then
      begin
        for I := 0 to FDBGrid.Columns.Count - 1 do
          if S = '' then S := FDBGrid.Columns[I].FieldName
          else S := S + '; ' + FDBGrid.Columns[I].FieldName;
        FDBGrid.DataSource.DataSet.GetFieldList(FieldList, S);
      end
      else FDBGrid.DataSource.DataSet.GetFieldList(FieldList, FPrintFields);
      BuildList(FDBGrid, FAutoWidth, Report.Bands.ColumnHeaderBand, Report.Bands.DetailBand,
        Report.Bands.SummaryBand, FieldList, FSummaryFields);
    end;
    if FSubDetailDBGrid <> nil then
    begin
//      Report.Bands.DetailBand.HasChild := True;
      SubDetail := TQRSubDetail.Create(Report);
      SubDetail.Parent := Report;
      SubDetail.ParentReport := Report;
      SubDetail.Master := Report;
      SubDetail.DataSet := FSubDetailDBGrid.DataSource.DataSet;
      SubDetail.Bands.HasHeader := True;
//      SubDetail.HeaderBand := Report.Bands.DetailBand.ChildBand;
//      SubDetail.HasChild := True;
      if not SubDetail.Bands.HasFooter then
      begin
        SubDetail.Bands.HasFooter := True;
        SubDetail.FooterBand.Height := SubDetail.Height;
      end;
      if (FSubDetailSummaryFields.Count > 0) then
      begin
        SubDetail.FooterBand.HasChild := True;
//        SubDetail.FooterBand := SubDetail.ChildBand;
//        SubDetail.ChildBand.HasChild := True;
      end;
      if FSubDetailPrintFields = '' then
      begin
        for I := 0 to FSubDetailDBGrid.Columns.Count - 1 do
          if S = '' then S := FSubDetailDBGrid.Columns[I].FieldName
          else S := S + '; ' + FSubDetailDBGrid.Columns[I].FieldName;
        FSubDetailDBGrid.DataSource.DataSet.GetFieldList(FieldList, S);
      end
      else
        FSubDetailDBGrid.DataSource.DataSet.GetFieldList(FieldList, FSubDetailPrintFields);
      BuildList(FSubDetailDBGrid, FSubDetailAutoFit, SubDetail.HeaderBand,
        SubDetail, SubDetail.FooterBand, FieldList, FSubDetailSummaryFields);
    end;
  finally
    FieldList.Free;
  end;
//  RenameObjects;
end;


constructor TQLDBGridReportBuilder.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FSummaryFields := TStringList.Create;
  FSubDetailSummaryFields := TStringList.Create;
  FAutoOrientation := True;
  FHasColLines := True;
  FHasRowLines := True;
end;

destructor TQLDBGridReportBuilder.Destroy;
begin
  FSummaryFields.Free;
  FSubDetailSummaryFields.Free;
  inherited;
end;

procedure TQLDBGridReportBuilder.BuildList(Grid: TDBGrid; AutoFit: Boolean;
  ColumnHeaderBand, DetailBand, SummaryBand: TQRCustomBand;
  FieldList: TList; SummaryFields: TStrings);
const
  HorzOffset = 2;
var
  I, TitleRowCount: Integer;
  AColumn: TColumn;
  AData: TQRDBText;
  ALabel: TQRLabel;
  AExpr: TQRExpr;
  AColumnShape, ADetailShape: TQRShape;
  AWidth: Integer;
  TotalWidth: Integer;
  HadDetail: Boolean;
  HadColHead: Boolean;
  VertLines, HorzLines: Boolean;
//  TM: TTextMetric;
  CurrentLefts: array of Integer;

  function GridLineWidth: Integer;
  begin
    Result := THackDBGrid(Grid).GridLineWidth;
  end;

  procedure AddColumn(AColumn: TColumn);

    function GetColumnCount: Integer;
    var
      I: Integer;
    begin
      Result := 0;
      if AColumn.ParentColumn <> nil then
        for I := 0 to Grid.Columns.Count - 1 do
          with Grid.Columns[I] do
            if ParentColumn = AColumn.ParentColumn then
              Inc(Result);
    end;

    function GetMasterCol(ACol: TColumn; ADepth: Integer): TColumn;
    begin
      Result := ACol;
      while (Result <> nil) and (Result.Depth > ADepth) do
        Result := Result.ParentColumn;
    end;

    function GetRowCount: Integer;
    var
      I: Integer;
      MasterCol: TColumn;
    begin
      Result := 0;
      MasterCol := GetMasterCol(AColumn, 0);
      with Grid do
        for I := 0 to Columns.Count - 1 do
          if (GetMasterCol(Columns[I], 0) = MasterCol) and (Columns[I].Depth + 1 > Result) then
            Result := Columns[I].Depth + 1;
    end;

    function GetColWidth: Integer;
    var
      I: Integer;
//      MasterCol: TColumn;
    begin
      Result := 0;
      with Grid do
        for I := 0 to Columns.Count - 1 do
          if GetMasterCol(Columns[I], AColumn.Depth) = AColumn then
            Result := Result + Columns[I].Width + GridLineWidth;
    end;

    function GetIsLastColumn: Boolean;
    var
      I: Integer;
    begin
      Result := True;
      for I := AColumn.Index + 1 to Grid.Columns.Count - 1 do
        if GetMasterCol(Grid.Columns[I], AColumn.Depth) <> AColumn then
        begin
          Result := False;
          Break;
        end;
    end;

    function GetIsChildLastCol: Boolean;
    var
      MasterCol: TColumn;
      I: Integer;
    begin
      Result := False;
      MasterCol := GetMasterCol(AColumn, AColumn.Depth - 1);
      if MasterCol <> nil then
      begin
        for I := AColumn.Index + 1 to Grid.Columns.Count - 1 do
          if GetMasterCol(Grid.Columns[I], AColumn.Depth - 1) = MasterCol then
            Exit;
        Result := True;
      end;
    end;

  var
    Temp: string;
    RowCount, RowHeight, ColWidth, I: Integer;
//    ARect: TRect;
    IsLastCol: Boolean;
  begin
{$IFDEF DEBUG}
    SendDebug('-------------------------------------------');
    SendDebug('AColumn.FieldName = ' + AColumn.FieldName);
    SendInteger('AColumn.Depth', AColumn.Depth);
{$ENDIF}
//    ARect := THackDBGrid(Grid).CalcTitleRect(AColumn, AColumn.Depth, MasterCol);
    if Length(CurrentLefts) <= AColumn.Depth then SetLength(CurrentLefts, Length(CurrentLefts) + 1);
//    ColWidth := ARect.Right - ARect.Left;
    ColWidth := GetColWidth;
    RowCount := GetRowCount;
    RowHeight := ColumnHeaderBand.Height div RowCount;
//    ColCount := GetColumnCount;
    IsLastCol := GetIsLastColumn;
    AData := nil;

    ALabel := TQRLabel(ColumnHeaderBand.AddPrintable(TQRLabel));
    ALabel.Top := RowHeight * AColumn.Depth + (RowHeight - ALabel.Height) div 2;
    ALabel.AutoSize := False;
    ALabel.Font.Assign(AColumn.Title.Font);
    ALabel.Alignment := AColumn.Title.Alignment;
    if AutoFit then
    begin
      if IsLastCol  then
        AWidth := ColumnHeaderBand.Width - CurrentLefts[AColumn.Depth]
      else
        AWidth := Trunc(ColWidth / TotalWidth * ColumnHeaderBand.Width);
      ALabel.Width := AWidth - HorzOffset;
//      ALabel.Transparent := True;
    end
    else begin
//      ALabel.AutoSize := True;
//      GetTextMetrics(Grid.Canvas.Handle, TM);
//      ALabel.Caption := MakeStr('X', (ColWidth + (TM.tmAveCharWidth div 2) - TM.tmOverhang - 3)
//          div TM.tmAveCharWidth);
//      ALabel.AutoSize := False;
      ALabel.Width := ColWidth - HorzOffset;
      AWidth := ColWidth + GridLineWidth;
//      AWidth := ALabel.Width + HorzOffset;
    end;
//    ALabel.AutoSize := False;
//    ALabel.Font.Style := ALabel.Font.Style + [fsBold];
    if ALabel.Alignment = taRightJustify then
      ALabel.Left := CurrentLefts[AColumn.Depth]
    else
      ALabel.Left := CurrentLefts[AColumn.Depth] + HorzOffset;
    ALabel.Caption := AColumn.Title.Caption;
//    ALabel.Frame.DrawBottom := True;
    if HorzLines and (AColumn.Depth < RowCount - 1) then
    begin
      with TQRShape(ColumnHeaderBand.AddPrintable(TQRShape)) do
      begin
        Shape := qrsHorLine;
        Top := RowHeight * (AColumn.Depth + 1) - 1;
        Left := CurrentLefts[AColumn.Depth];
        if IsLastCol then Width := ColumnHeaderBand.Width - Left
        else Width := AWidth;
        Height := 1;
{$IFDEF DEBUG}
        SendInteger('HorzShape.Width', Width);
        SendInteger('ColumnHeaderBand.Width', ColumnHeaderBand.Width);
{$ENDIF}
      end;
//      if AutoFit then ADetailShape.Left := CurrentLeft + ALabel.Width + HorzOffset;
    end;
    if VertLines and not IsLastCol and not GetIsChildLastCol then
    begin
      AColumnShape := TQRShape(ColumnHeaderBand.AddPrintable(TQRShape));
      AColumnShape.Shape := qrsVertLine;
      if AColumn.Depth = 0 then AColumnShape.Top := 0
      else AColumnShape.Top := RowHeight * AColumn.Depth;
      AColumnShape.Width := 1;
      AColumnShape.Height := ColumnHeaderBand.Height - AColumnShape.Top;
      {if AutoFit then }AColumnShape.Left := CurrentLefts[AColumn.Depth] + AWidth - 1;
    end;
    if not AColumn.Expanded then
    begin
      AData := TQRDBText(DetailBand.AddPrintable(TQRDBText));
      AData := TQRDBText.Create(Report);
      AData.Parent := DetailBand;
      AData.AutoSize := False;
      AData.DataSet := AColumn.Field.DataSet;
      AData.DataField := AColumn.FieldName;
      if AColumn.Field.DataSet.FindField(AColumn.FieldName) = nil then
        ShowMessage('');
      AData.Top := (DetailBand.Height - AData.Height) div 2;
      AData.Width := ALabel.Width;
      AData.Alignment := AColumn.Alignment;
{$IFDEF DEBUG}
      SendDebug('AData.DataName = ''' + AData.DataField+ '''');
{$ENDIF}
  //    if AutoFit then
      if AData.Alignment = taRightJustify then
        AData.Left := CurrentLefts[AColumn.Depth]
      else AData.Left := CurrentLefts[AColumn.Depth] + HorzOffset;
      if VertLines and not IsLastCol and FHasColLines then
      begin
        ADetailShape := TQRShape(DetailBand.AddPrintable(TQRShape));
        ADetailShape.Shape := qrsVertLine;
        ADetailShape.Top := 0;//ALabel.Top;
        ADetailShape.Left := CurrentLefts[AColumn.Depth] + AWidth - 1;
        ADetailShape.Width := 1;
        ADetailShape.Height := DetailBand.Height;
  //      if AutoFit then ADetailShape.Left := CurrentLeft + ALabel.Width + HorzOffset;
      end;
    end;
    Temp := SummaryFields.Values[AColumn.FieldName];
    if Temp <> '' then
    begin
      AExpr := TQRExpr(SummaryBand.AddPrintable(TQRExpr));
      AExpr.AutoSize := False;
      AExpr.Expression := Temp;
      if IsPublishedProp(AColumn.Field, 'currency') and
        (GetOrdProp(AColumn.Field, 'currency') = 1) then
        AExpr.Mask := CurrencyString + '0.00';
      AExpr.Alignment := AData.Alignment;
      AExpr.Left := AData.Left;
      AExpr.Width := AData.Width;
      AExpr.Top := (SummaryBand.Height - AExpr.Height) div 2;
      AExpr.ResetAfterPrint := True;
    end;
    if (Temp <> '') and VertLines and not IsLastCol and FHasColLines then
    begin
      with TQRShape(SummaryBand.AddPrintable(TQRShape)) do
      begin
        Shape := qrsVertLine;
        Top := 0;
        Left := ADetailShape.Left;
        Width := 1;
        Height := SummaryBand.Height;
      end;
//      if AutoFit then ADetailShape.Left := CurrentLeft + ALabel.Width + HorzOffset;
    end;
{$IFDEF DEBUG}
    SendInteger('AWidth', AWidth);
    SendInteger('ColWidth', ColWidth);
    SendInteger('CurrentLeft', CurrentLefts[AColumn.Depth]);
    SendInteger('RowCount', RowCount);
{$ENDIF}
    if AColumn.Depth = RowCount - 1 then
      for I := Length(CurrentLefts) - 1 downto AColumn.Depth + 1 do
        CurrentLefts[I] := CurrentLefts[I] + AWidth;
    CurrentLefts[AColumn.Depth] := CurrentLefts[AColumn.Depth] + AWidth;
//    if not AColumn.Expanded then
//      CurrentLeft := CurrentLeft + AWidth;
//    else begin
      if FAutoOrientation and (AData <> nil) and (AData.Left + AData.Width > DetailBand.Width) and
        (Orientation = poPortrait) then Orientation := poLandscape;
      if (AData <> nil) and (AData.Left + AData.Width > DetailBand.Width) then
      begin
        ALabel.Free;
        AData.Free;
      end;
//    end;
  end;

begin
  TotalWidth := 0;
  for I := 0 to Grid.Columns.Count - 1 do
    if Grid.Columns[I].Visible and not Grid.Columns[I].Expanded and
      (FieldList.IndexOf(Grid.Columns[I].Field) >= 0) then
      TotalWidth := TotalWidth + Grid.Columns[I].Width + GridLineWidth;
  Font.Assign(Grid.Font);
  HadColHead := ColumnHeaderBand <> nil;
  HadDetail := DetailBand <> nil;
  if HadColHead then
    with TQRLabel(ColumnHeaderBand.AddPrintable(TQRLabel)) do
    try
      Caption := 'Wg';
      Font.Style := Font.Style + [fsBold];
      ColumnHeaderBand.Height := Round(Height * 1.5)
    finally
      Free;
    end;
  if HadDetail then
    with TQRLabel(DetailBand.AddPrintable(TQRLabel)) do
    try
      Caption := 'Wg';
      DetailBand.Height := Round(Height * 1.5)
    finally
      Free;
    end;
  VertLines := DBGrids.dgColLines in Grid.Options;
  HorzLines := DBGrids.dgRowLines in Grid.Options;
  if DBGrids.dgTitles in Grid.Options then
  begin
//    if HadColHead then
//      ColumnHeaderBand.Height := 20;
    if VertLines then
    begin
      if HadColHead then
        with ColumnHeaderBand.Frame do
        begin
          DrawLeft := True;
          DrawRight := True;
        end;
      if FHasColLines then
        with DetailBand.Frame do
        begin
          DrawLeft := True;
          DrawRight := True;
        end;
    end;
    if HorzLines then
    begin
      if HadColHead then
        with ColumnHeaderBand.Frame do
        begin
          DrawTop := True;
          DrawBottom := True;
        end;
      if FHasRowLines then
        with DetailBand.Frame do DrawBottom := True;
    end;
  end;
//  ColumnHeaderBand.Height := ColumnHeaderBand.Height * 2;
  if Grid <> nil then
  begin
//    CurrentLeft := 0;
    TitleRowCount := 0;
    with Grid do
      for I := 0 to Columns.Count - 1 do
        if Columns[I].Depth + 1 > TitleRowCount then
          TitleRowCount := Columns[I].Depth + 1;
    if ColumnHeaderBand <> nil then
      with ColumnHeaderBand do Height := Height * TitleRowCount;
    SetLength(CurrentLefts, TitleRowCount);
    for I := 0 to Grid.Columns.Count - 1 do begin
      AColumn := Grid.Columns[I];
      if AColumn.Visible and (FieldList.IndexOf(AColumn.Field) >= 0) {and not (AField.DataType in ftNonTextTypes +
        [ftUnknown]) }then AddColumn(AColumn);
    end;
  end;
  RenameObjects;
end;

procedure TQLDBGridReportBuilder.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);
  if Operation = opRemove then
    if (AComponent = Report) then Report := nil
    else if AComponent = DBGrid then DBGrid := nil
    else if AComponent = SubDetailDBGrid then SubDetailDBGrid := nil;
end;

function TQLDBGridReportBuilder.GetReport: TCustomQuickRep;
begin
  Result := inherited Report;
end;

procedure TQLDBGridReportBuilder.SetReport(const Value: TCustomQuickRep);
begin
  if Value <> Report then
  begin
//    if Report <> nil then Report.RemoveFreeNotification(Self);
    inherited Report := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

procedure TQLDBGridReportBuilder.SetDBGrid(const Value: TDBGrid);
begin
  if FDBGrid <> Value then
  begin
    FDBGrid := Value;
    if Value <> nil then Value.FreeNotification(Self);
  end;
end;

end.
