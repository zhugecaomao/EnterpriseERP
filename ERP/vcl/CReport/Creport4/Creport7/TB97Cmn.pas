unit TB97Cmn;

{
  Toolbar97
  Copyright (C) 1998 by Jordan Russell

  Internal common functions
}

interface

{$I TB97Ver.inc}

uses
  Windows, Classes;

type
  THookProcCode = (hpSendActivateApp, hpSendWindowPosChanged, hpPreDestroy,
    hpPostMouseMove);
  THookProcCodes = set of THookProcCode;
type
  THookProc = procedure(Code: THookProcCode; Wnd: HWND; WParam: WPARAM; LParam: LPARAM);
  TListSortExCompare = function (const Item1, Item2, ExtraData: Pointer): Integer;

function ApplicationIsActive: Boolean;
procedure InstallHookProc (AProc: THookProc; ACodes: THookProcCodes;
  OnlyIncrementCount: Boolean);
procedure UninstallHookProc (AProc: THookProc);
procedure ListSortEx (const List: TList; const Compare: TListSortExCompare;
  const ExtraData: Pointer);

{$IFNDEF TB97D3}
type
  PMaxLogPalette = ^TMaxLogPalette;
  TMaxLogPalette = packed record
    palVersion: Word;
    palNumEntries: Word;
    palPalEntry: array[Byte] of TPaletteEntry;
  end;
function CopyPalette (Palette: HPALETTE): HPALETTE;
{$ENDIF}

implementation

uses
  Messages, Forms;

type
  PHookProcData = ^THookProcData;
  THookProcData = record
    Proc: THookProc;
    RefCount: Longint;
    Codes: THookProcCodes;
  end;
  THookType = (htCallWndProc, htCBT, htGetMessage);
  THookTypes = set of THookType;

var
  HookHandles: array[THookType] of HHOOK;
  HookProcList: TList = nil;
  HookCounts: array[THookType] of Longint;


function CallWndProcHook (Code: Integer; WParam: WPARAM; LParam: LPARAM): LRESULT;
stdcall;
type
  THookProcCodeMsgs = hpSendActivateApp..hpSendWindowPosChanged;
const
  MsgMap: array[THookProcCodeMsgs] of UINT =
    (WM_ACTIVATEAPP, WM_WINDOWPOSCHANGED);
var
  J: THookProcCodeMsgs;
  I: Integer;
begin
  if Assigned(HookProcList) and (Code = HC_ACTION) then
    with PCWPStruct(LParam)^ do begin
      for J := Low(J) to High(J) do
        if Message = MsgMap[J] then begin
          for I := 0 to HookProcList.Count-1 do
            try
              with PHookProcData(HookProcList.List[I])^ do
                if J in Codes then
                  Proc (J, hwnd, WParam, LParam);
            except
            end;
          Break;
        end;
    end;
  Result := CallNextHookEx(HookHandles[htCallWndProc], Code, WParam, LParam);
end;

function CBTHook (Code: Integer; WParam: WPARAM; LParam: LPARAM): LRESULT;
stdcall;
var
  I: Integer;
begin
  if Assigned(HookProcList) and (Code = HCBT_DESTROYWND) then
    for I := 0 to HookProcList.Count-1 do
      try
        with PHookProcData(HookProcList.List[I])^ do
          if hpPreDestroy in Codes then
            Proc (hpPreDestroy, HWND(WParam), 0, 0);
      except
      end;
  Result := CallNextHookEx(HookHandles[htCBT], Code, WParam, LParam);
end;

function GetMessageHook (Code: Integer; WParam: WPARAM; LParam: LPARAM): LRESULT;
stdcall;
var
  I: Integer;
begin
  if Assigned(HookProcList) and (Code = HC_ACTION) and
     (PMsg(LParam).message = WM_MOUSEMOVE) then
    for I := 0 to HookProcList.Count-1 do
      try
        with PHookProcData(HookProcList.List[I])^, PMsg(LParam)^ do
          if hpPostMouseMove in Codes then
            Proc (hpPostMouseMove, hwnd, wParam, lParam);
      except
      end;
  Result := CallNextHookEx(HookHandles[htGetMessage], Code, WParam, LParam);
end;

function HookCodesToTypes (Codes: THookProcCodes): THookTypes;
const
  HookCodeToType: array[THookProcCode] of THookType =
    (htCallWndProc, htCallWndProc, htCBT, htGetMessage);
var
  J: THookProcCode;
begin
  Result := [];
  for J := Low(J) to High(J) do
    if J in Codes then
      Include (Result, HookCodeToType[J]);
end;

const
  HookProcs: array[THookType] of TFNHookProc =
    (CallWndProcHook, CBTHook, GetMessageHook);
  HookIDs: array[THookType] of Integer =
    (WH_CALLWNDPROC, WH_CBT, WH_GETMESSAGE);

procedure InstallHooks (ATypes: THookTypes);
var
  T: THookType;
begin
  for T := Low(T) to High(T) do
    if T in ATypes then begin
      Inc (HookCounts[T]);
      if HookHandles[T] = 0 then
        HookHandles[T] := SetWindowsHookEx(HookIDs[T], HookProcs[T],
          0, GetCurrentThreadId);
    end;
end;

procedure UninstallHooks (const ATypes: THookTypes; const Force: Boolean);
var
  T: THookType;
begin
  for T := Low(T) to High(T) do
    if T in ATypes then begin
      if HookCounts[T] > 0 then
        Dec (HookCounts[T]);
      if (Force or (HookCounts[T] = 0)) and (HookHandles[T] <> 0) then begin
        UnhookWindowsHookEx (HookHandles[T]);
        HookHandles[T] := 0;
      end;
    end;
end;

procedure InstallHookProc (AProc: THookProc; ACodes: THookProcCodes;
  OnlyIncrementCount: Boolean);
var
  Found: Boolean;
  I: Integer;
  Data: PHookProcData;
begin
  if HookProcList = nil then
    HookProcList := TList.Create;
  Found := False;
  for I := 0 to HookProcList.Count-1 do
    with PHookProcData(HookProcList[I])^ do
      if @Proc = @AProc then begin
        Inc (RefCount);
        Found := True;
        Break;
      end;
  if not Found then begin
    New (Data);
    with Data^ do begin
      Proc := AProc;
      RefCount := 1;
      Codes := ACodes;
    end;
    HookProcList.Add (Data);
  end;
  if not OnlyIncrementCount then
    InstallHooks (HookCodesToTypes(ACodes));
end;

procedure UninstallHookProc (AProc: THookProc);
var
  I: Integer;
  Data: PHookProcData;
  T: THookTypes;
begin
  if HookProcList = nil then Exit;
  for I := 0 to HookProcList.Count-1 do begin
    Data := PHookProcData(HookProcList[I]);
    if @Data.Proc = @AProc then begin
      T := HookCodesToTypes(Data.Codes);
      Dec (Data.RefCount);
      if Data.RefCount = 0 then begin
        HookProcList.Delete (I);
        Dispose (Data);
      end;
      UninstallHooks (T, False);
      Break;
    end;
  end;
  if HookProcList.Count = 0 then begin
    HookProcList.Free;
    HookProcList := nil;
  end;
end;

function ApplicationIsActive: Boolean;
{ Returns True if the application is in the foreground }
begin
  Result := GetActiveWindow <> 0;
end;

{$IFNDEF TB97D3}
function CopyPalette (Palette: HPALETTE): HPALETTE;
var
  PaletteSize: Integer;
  LogPal: TMaxLogPalette;
begin
  Result := 0;
  if Palette = 0 then Exit;
  PaletteSize := 0;
  if GetObject(Palette, SizeOf(PaletteSize), @PaletteSize) = 0 then Exit;
  if PaletteSize = 0 then Exit;
  with LogPal do begin
    palVersion := $0300;
    palNumEntries := PaletteSize;
    GetPaletteEntries (Palette, 0, PaletteSize, palPalEntry);
  end;
  Result := CreatePalette(PLogPalette(@LogPal)^);
end;
{$ENDIF}

procedure ListSortEx (const List: TList; const Compare: TListSortExCompare;
  const ExtraData: Pointer);
{ Similar to TList.Sort, but lets you pass a user-defined ExtraData pointer }
  procedure QuickSortEx (L: Integer; const R: Integer);
  var
    I, J: Integer;
    P: Pointer;
  begin
    repeat
      I := L;
      J := R;
      P := List[(L + R) shr 1];
      repeat
        while Compare(List[I], P, ExtraData) < 0 do Inc(I);
        while Compare(List[J], P, ExtraData) > 0 do Dec(J);
        if I <= J then
        begin
          List.Exchange (I, J);
          Inc (I);
          Dec (J);
        end;
      until I > J;
      if L < J then QuickSortEx (L, J);
      L := I;
    until I >= R;
  end;
begin
  if List.Count > 1 then
    QuickSortEx (0, List.Count-1);
end;

initialization
finalization
  UninstallHooks ([Low(THookType)..High(THookType)], True);
  HookProcList.Free;
  { Following line needed because, under certain circumstances, HookProcList
    may be referenced after the 'finalization' section is processed. (This
    can happen if a 'Halt' call is placed in the main form's OnCreate
    handler, for example.) }
  HookProcList := nil;
end.
