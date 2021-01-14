unit QLUtils;

interface

uses Windows, Graphics, Forms, SysUtils, ComObj, DBGrids, StdCtrls, Controls,
  ActiveX, DB;

type
  EDBConvertError = class(Exception);

procedure InitializeForm(Form: TForm);
function CompareGUID(const GUID1, GUID2: TGUID): Boolean;
function CreateGUID: TGUID;
//procedure AdjustGridColumns(Grid: TDBGrid);
procedure ShowMessageEx(const Msg: string);
function Left(const Str: string; Count: Integer): string;
function Right(const Str: string; Count: Integer): string;

function ExtractSubStr(const Str: string; var Pos: Integer; Delimiter: Char = ';'): string;
function SubStrOfIndex(const Str: string; Index: Integer; Delimiter: Char = ';'): string;
function IndexOfSubStr(const Str, SubStr: string; Delimiter: Char = ';'): Integer;
function CountOfSubStr(const Str: string; Delimiter: Char = ';'): Integer;

procedure ShowMessage(const Msg: string);
function ConfirmDlg(const Msg: string; const Caption: string = 'х╥хо'): Boolean;
function SumOfField(Field: TField): Extended;

const
  dbtUnknowDB = -1;
  dbtJetDB = 1;
  dbtMarketDB = 0;

function GetDatabaseType(const FileName: string): Integer;
procedure JetDBToMarketDB(const FileName: string);
procedure MarketDBToJetDB(const FileName: string);

procedure ExportDataSetToExcel(DataSet: TDataSet; DisableScreenUpdating: Boolean);

function GetPYM(const HZ: WideString): string;

function GetHDSerialNumber: Integer;

implementation

uses QlConsts;

const
  DBHeaderLength = $14;
  StandardJetDBHeaderArray: array[0..DBHeaderLength - 1] of Byte =
    ($00, $01, $00, $00, $53, $74, $61, $6E, $64, $61, $72, $64, $20, $4A, $65, $74,
    $20, $44, $42, $00);
  MarketDBHeaderArray: array[0..DBHeaderLength - 1] of Byte =
    ($00, $00, $00, $00, $56, $65, $6E, $64, $69, $74, $69, $6F, $6E, $20, $44, $42,
    $20, $31, $2E, $30);


procedure InitializeForm(Form: TForm);
var
  NonClientMetrics: TNonClientMetrics;
begin
  NonClientMetrics.cbSize := SizeOf(NonClientMetrics);
  if SystemParametersInfo(SPI_GETNONCLIENTMETRICS, 0, @NonClientMetrics, 0) then
    Form.Font.Handle := CreateFontIndirect(NonClientMetrics.lfMessageFont)
  else
    Form.Font.Handle := GetStockObject(SYSTEM_FONT);
end;

function CompareGUID(const GUID1, GUID2: TGUID): Boolean;
begin
  Result := (GUID1.D1 = GUID2.D1) and (GUID1.D2 = GUID2.D2) and
    (GUID1.D3 = GUID2.D3) and (Int64(GUID1.D4) = Int64(GUID2.D4));
end;

procedure AdjustGridColumns(Grid: TDBGrid);
var
  I: Integer;
  TotalWidth: Integer;
begin
  TotalWidth := 0;
  for I := 0 to Grid.Columns.Count - 1 do
    TotalWidth := TotalWidth + Grid.Columns[I].Width;
  for I := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[I].Width := Trunc(Grid.Columns[I].Width / TotalWidth * Grid.ClientWidth);
end;

procedure ShowMessageEx(const Msg: string);
var
  Form: TForm;
begin
  Form := TForm.Create(Application);
  with Form do
    try
      Caption := Application.Title;
      BorderIcons := [];
      BorderStyle := bsDialog;
      Width := 350;
      Height := 200;
      Position := poDesktopCenter;
      with TMemo.Create(Form) do
      begin
        Parent := Form;
        ParentColor := True;
        ReadOnly := True;
        Align := alTop;//Client;
        Height := Form.Height - 70;
        Lines.Text := Msg;
        WantReturns := False;
      end;
      with TButton.Create(Form) do
      begin
        Parent := Form;
        Caption := '&OK';
        Left := (Form.Width - Width) div 2;
        Top := Form.Height - 60;
        ModalResult := mrOK;
        Default := True;
        Cancel := True;
      end;
      ShowModal;
    finally
      Free;
    end;
end;

function Left(const Str: string; Count: Integer): string;
begin
  Result := Copy(Str, 1, Count);
end;

function Right(const Str: string; Count: Integer): string;
begin
  if Length(Str) < Count then Result := Str
  else Result := Copy(Str, Length(Str) - Count + 1, Count);
end;

function ExtractSubStr(const Str: string; var Pos: Integer; Delimiter: Char): string;
var
  I: Integer;
begin
  I := Pos;
  while (I <= Length(Str)) and (Str[I] <> Delimiter) do Inc(I);
  Result := Copy(Str, Pos, I - Pos);
  if (I <= Length(Str)) and (Str[I] = Delimiter) then Inc(I);
  Pos := I;
end;

function SubStrOfIndex(const Str: string; Index: Integer; Delimiter: Char): string;
var
  I, J, Pos: Integer;
begin
  Pos := 1;
  I := Pos;
  J := -1;
  while I <= Length(Str) do
  begin
    if Str[I] = Delimiter then
    begin
      Inc(J);
      if (J = Index) or (Index = -1) then Break;
      Pos := I + 1;
    end;
    Inc(I);
  end;
  Result := Trim(Copy(Str, Pos, I - Pos));
end;

function IndexOfSubStr(const Str, SubStr: string; Delimiter: Char): Integer;
var
  Pos: Integer;
  Temp: string;
begin
  Result := 0;
  Pos := 1;
  Temp := ExtractSubStr(Str, Pos);
  while Temp <> EmptyStr do
  begin
    if Temp = SubStr then
    begin
      Result := Pos;
      Break;
    end;
    Temp := ExtractSubStr(Str, Pos);
  end;
end;

function CountOfSubStr(const Str: string; Delimiter: Char): Integer;
var
  Pos: Integer;
begin
  Result := 0;
  Pos := 1;
  while ExtractSubStr(Str, Pos) <> EmptyStr do Inc(Result);
end;

procedure ShowMessage(const Msg: string);
begin
  Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION or MB_OK);
end;

function ConfirmDlg(const Msg: string; const Caption: string): Boolean;
begin
  Result := Application.MessageBox(PChar(Msg), PChar(Caption),
    MB_ICONQUESTION + MB_YESNO) = IDYES;
end;

function SumOfField(Field: TField): Extended;
var
  Bm: TBookmarkStr;
  SaveActive: Boolean;
begin
  Result := 0;
  with Field.DataSet do
  begin
    SaveActive := Active;
    Active := True;
    DisableControls;
    try
      Bm := Bookmark;
      First;
      while not EOF do
      begin
        Result := Result + Field.AsCurrency;
        Next;
      end;
      Bookmark := Bm;
      Active := SaveActive;
    finally
      EnableControls;
    end;
  end;
end;

function GetDatabaseType(const FileName: string): Integer;
var
  Handle: THandle;
  Buffer: array[0..DBHeaderLength - 1] of Byte;
begin
  Result := dbtUnknowDB;
  Handle := FileOpen(FileName, fmOpenReadWrite or fmShareDenyNone);
  try
    if Handle <= 0 then
      raise EDBConvertError.CreateResFmt(@SFmtFileNotFoundError, [FileName]);
    if FileRead(Handle, Buffer, DBHeaderLength) <> DBHeaderLength then
      raise Exception.Create(SUnknowError);
    if CompareMem(@Buffer, @MarketDBHeaderArray, DBHeaderLength) then
      Result := dbtMarketDB
    else if CompareMem(@Buffer, @StandardJetDBHeaderArray, DBHeaderLength) then
      Result := dbtJetDB;
  finally
    FileClose(Handle);
  end;
end;

procedure JetDBToMarketDB(const FileName: string);
var
  Handle: THandle;
  CreationTime, LastAccessTime, LastWriteTime: TFileTime;
begin
  Handle := FileOpen(FileName, fmOpenReadWrite or fmShareDenyNone);
  try
    if Handle <= 0 then
      raise EDBConvertError.CreateResFmt(@SFmtFileNotFoundError, [FileName]);
    GetFileTime(Handle, @CreationTime, @LastAccessTime, @LastWriteTime);
    if FileWrite(Handle, MarketDBHeaderArray, DBHeaderLength) <> DBHeaderLength then
      raise Exception.Create(SUnknowError);
    SetFileTime(Handle, @CreationTime, @LastAccessTime, @LastWriteTime);
  finally
    FileClose(Handle);
  end;
end;

procedure MarketDBToJetDB(const FileName: string);
var
  Handle: THandle;
  Buffer: array[0..DBHeaderLength - 1] of Byte;
  CreationTime, LastAccessTime, LastWriteTime: TFileTime;
begin
  Handle := FileOpen(FileName, fmOpenReadWrite or fmShareDenyNone);
  try
    if Handle <= 0 then
      raise EDBConvertError.CreateResFmt(@SFmtFileNotFoundError, [FileName]);
    if FileRead(Handle, Buffer, DBHeaderLength) <> DBHeaderLength then
      raise Exception.Create(SUnknowError);
    if not CompareMem(@Buffer, @MarketDBHeaderArray, DBHeaderLength) then
      raise Exception.Create(SFileFormatNotSupportError);
    GetFileTime(Handle, @CreationTime, @LastAccessTime, @LastWriteTime);
    FileSeek(Handle, 0, 0);
    if FileWrite(Handle, StandardJetDBHeaderArray, DBHeaderLength) <> DBHeaderLength then
      raise Exception.Create(SUnknowError);
    SetFileTime(Handle, @CreationTime, @LastAccessTime, @LastWriteTime);
  finally
    FileClose(Handle);
  end;
end;

procedure ExportDataSetToExcel(DataSet: TDataSet; DisableScreenUpdating: Boolean);
const
  CLASS_ExcelApplication: TGUID = '{00024500-0000-0000-C000-000000000046}';

var
  ExcelApp: OleVariant;
  Unknown: IUnknown;
  Bm: TBookmarkStr;
  Col, Row: Integer;
  I: Integer;
begin
  with DataSet do
  begin
    Open;
    if not Succeeded(GetActiveObject(CLASS_ExcelApplication, nil, Unknown)) then
      Unknown := CreateComObject(CLASS_ExcelApplication);
    ExcelApp := Unknown as IDispatch;
    ExcelApp.Visible := True;
    ExcelApp.Workbooks.Add;
    if DisableScreenUpdating then
      ExcelApp.ScreenUpdating := False;
    DisableControls;
    try
      Bm := Bookmark;
      First;
      Row := 1;
      Col := 1;
      for I := 0 to DataSet.Fields.Count - 1 do
      begin
        if DataSet.Fields[I].Visible then
        begin
          ExcelApp.Cells[Row, Col] := DataSet.Fields[I].DisplayLabel;
          Inc(Col);
        end;
      end;
      Inc(Row);
      while not EOF do
      begin
        Col := 1;
        for I := 0 to DataSet.Fields.Count - 1 do
        begin
          if DataSet.Fields[I].Visible then
          begin
            ExcelApp.Cells[Row, Col] := DataSet.Fields[I].DisplayText;
            Inc(Col);
          end;
        end;
        Inc(Row);
        Next;
      end;
      Col := 1;
      for I := 0 to Fields.Count - 1 do
      begin
        if Fields[I].Visible then
        begin
          ExcelApp.Columns[Col].AutoFit;;
          Inc(Col);
        end;
      end;
      Bookmark := Bm;
    finally
      EnableControls;
      if not ExcelApp.ScreenUpdating then
        ExcelApp.ScreenUpdating := True;
    end;
  end;
end;

function CreateGUID: TGUID;
begin
  CoCreateGUID(Result);
end;

function GetPYM(const HZ: WideString): string;
begin
  Result := EmptyStr;
end;

function GetHDSerialNumber: Integer;
var
  pdw : PDWord;
  mc, fl : DWord;
begin
  New(pdw);
  GetVolumeInformation(nil,nil,0,pdw,mc,fl,nil,0);
  Result := pdw^;
  Dispose(pdw);
end;

end.
