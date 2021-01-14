{*********************************************************}
{*                  OGFIRST.PAS 1.13                     *}
{*     Copyright (c) 1996-02 TurboPower Software Co      *}
{*                 All rights reserved.                  *}
{*********************************************************}

{$I ONGUARD.INC}

{$B-} {Complete Boolean Evaluation}
{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{$W-} {Windows Stack Frame}
{$X+} {Extended Syntax}

{$IFNDEF Win32}
{$G+} {286 Instructions}
{$N+} {Numeric Coprocessor}

{$C MOVEABLE,DEMANDLOAD,DISCARDABLE}
{$ENDIF}

unit OgFirst;
  {-limit instance routines}

interface

uses
  {$IFDEF Win32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  Forms, SysUtils,
  OgUtil;

{detect/Activate instance routines}
function IsFirstInstance: Boolean;
procedure ActivateFirstInstance;
{!!.04} {revised Win16 version}


implementation

{$IFDEF TRIALRUN} uses OgTrial; {$ENDIF}

{$IFDEF Win32}
var
  FirstInstance : Boolean;
  InstanceMutex : THandle;
{$ENDIF}

{limit instances routines}
function IsFirstInstance : Boolean;
begin
  {$IFDEF TRIALRUN}
  _CC_;
  _VC_;
  {$ENDIF}
  {$IFDEF Win32}
  Result := FirstInstance;
  {$ELSE}
  Result := HPrevInst = 0;
  {$ENDIF}
end;

{$IFDEF Win32}
procedure ActivateFirstInstance;
var
  ClassBuf,
  WindowBuf : array [0..255] of AnsiChar;
  Wnd,
  TopWnd    : hWnd;
  ThreadID  : DWord;                                                 {!!.07}
begin
  {$IFDEF TRIALRUN}
  _CC_;
  _VC_;
  {$ENDIF}
  if IsFirstInstance then begin
    if IsIconic(Application.Handle) then
      Application.Restore
    else
      Application.BringToFront;
  end else begin
    GetClassName(Application.Handle, ClassBuf, SizeOf(ClassBuf));
    GetWindowText(Application.Handle, WindowBuf, SizeOf(WindowBuf));
    Wnd := FindWindow(ClassBuf, WindowBuf);
    if (Wnd <> 0) then begin
      GetWindowThreadProcessId(Wnd, @ThreadID);
      if (ThreadID = GetCurrentProcessId) then begin
        Wnd := FindWindowEx(0, Wnd, ClassBuf, WindowBuf);
        if (Wnd <> 0) then
          if IsIconic(Wnd) then
            ShowWindow(Wnd, SW_RESTORE)
          else begin
            SetForegroundWindow(Wnd);                                {!!.09}
            TopWnd := GetLastActivePopup(Wnd);
            if (TopWnd <> 0) and (TopWnd <> Wnd) and
                IsWindowVisible(TopWnd) and IsWindowEnabled(TopWnd) then
              BringWindowToTop(TopWnd)
            else
              BringWindowToTop(Wnd);
          end;
      end;
    end;
  end;
end;
{$ELSE}

type
  PHWND = ^hWnd;

function EnumWndFunc(Wnd : hWnd; Target : PHWND) : Boolean; export;    {!!.07}
var
  Buf : array[0..255] of Char;
begin
  Result := True;
  if GetWindowWord(Wnd, GWW_HINSTANCE) = HPrevInst then begin
    GetClassName(Wnd, Buf, SizeOf(Buf)-1);
    {find our application window}
    if StrIComp(Buf, 'TApplication') = 0 then begin
      Target^ := Wnd;
      Result := False;
    end;
  end;
end;

procedure ActivateFirstInstance;
var
  Wnd    : hWnd;
  TopWnd : hWnd;
begin
  {$IFDEF TRIALRUN}
  _CC_;
  _VC_;
  {$ENDIF}
  if IsFirstInstance then begin
    if IsIconic(Application.Handle) then
      Application.Restore
    else
      Application.BringToFront;
  end else begin
    Wnd := 0;
    EnumWindows(@EnumWndFunc, LongInt(@Wnd));
    if Wnd <> 0 then begin
      if IsIconic(Wnd) then
        ShowWindow(Wnd, SW_RESTORE)
      else begin
        TopWnd := GetLastActivePopup(Wnd);
        if (TopWnd <> 0) and (TopWnd <> Wnd) and IsWindowVisible(TopWnd) and IsWindowEnabled(TopWnd) then begin
          ShowWindow(TopWnd, SW_SHOWNORMAL);
          SetFocus(TopWnd);
        end else begin
          ShowWindow(Wnd, SW_SHOWNORMAL);
          BringWindowToTop(Wnd);
          ShowOwnedPopups(Wnd, True);
          SetFocus(Wnd);
        end;
      end;
    end;
  end;
end;
{$ENDIF}

{$IFDEF Win32}
function GetMutexName : string;
var
  WindowBuf : array [0..512] of AnsiChar;
begin
  GetWindowText(Application.Handle, WindowBuf, SizeOf(WindowBuf));
  Result := 'PREVINST:' + WindowBuf;
end;

initialization
  InstanceMutex := CreateMutex(nil, True, PAnsiChar(GetMutexName));
  if (InstanceMutex <> 0) and (GetLastError = 0) then
    FirstInstance := True
  else
    FirstInstance := False;

finalization
  if (InstanceMutex <> 0) then
    CloseHandle(InstanceMutex);
{$ENDIF}

end.
