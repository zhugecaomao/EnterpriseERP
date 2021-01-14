{*********************************************************}
{*                   OGFILE.PAS 1.13                     *}
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

unit OgFile;


interface

uses
  {$IFDEF Win32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  SysUtils,
  OgUtil;


function GetFileSize(Handle : THandle) : Cardinal;
{$IFNDEF Win32}
function LockFile(Handle : THandle; FileOffsetLow, FileOffsetHigh,
                  LockCountLow, LockCountHigh : Word) : Boolean;
function UnlockFile(Handle : THandle; FileOffsetLow, FileOffsetHigh,
                    UnLockCountLow, UnLockCountHigh : Word) : Boolean;
function FlushFileBuffers(Handle : THandle) : Boolean;
{$ENDIF}


implementation

{$IFDEF TRIALRUN} uses OgTrial; {$ENDIF}

function GetFileSize(Handle : THandle) : Cardinal;
{$IFDEF Win32}
begin
  Result := Windows.GetFileSize(Handle, nil);
{$ELSE}
var
  Save : LongInt;
begin
  Save := FileSeek(Handle, 0, 0);     {save current file position}
  Result := FileSeek(Handle, 0, 2);   {get file size}
  FileSeek(Handle, Save, 0);          {restore previous position}
{$ENDIF}
{$IFDEF TRIALRUN}
  _CC_; _VC_;
{$ENDIF}
end;

{$IFNDEF Win32}
function LockFile(Handle : THandle;
                  FileOffsetLow, FileOffsetHigh,
                  LockCountLow, LockCountHigh : Word) : Boolean;
var
  Error : Word;
begin
  asm
    mov   ax,$5C00
    mov   bx,Handle
    mov   cx,FileOffsetHigh
    mov   dx,FileOffsetLow
    mov   si,LockCountHigh
    mov   di,LockCountLow
    int   $21
    jc    @@001
    xor   ax,ax
  @@001:
    mov   Error,ax
  end;
{$IFDEF TRIALRUN}
  _CC_; _VC_;
{$ENDIF}
  Result := Error = 0;
end;

function UnlockFile(Handle : THandle;
                    FileOffsetLow, FileOffsetHigh,
                    UnLockCountLow, UnLockCountHigh : Word) : Boolean;
var
  Error : Word;
begin
  asm
    mov   ax, $5C01
    mov   bx,Handle
    mov   cx,FileOffsetHigh
    mov   dx,FileOffsetLow
    mov   si,UnLockCountHigh
    mov   di,UnLockCountLow
    int   $21
    jc    @@001
    xor   ax, ax
  @@001:
    mov   Error, ax
  end;
{$IFDEF TRIALRUN}
  _CC_; _VC_;
{$ENDIF}
  Result := Error = 0;
end;

function FlushFileBuffers(Handle : THandle) : Boolean;
var
  Error : Word;
begin
  asm
    mov   ah, $68
    mov   bx, Handle
    int   $21
    jc    @@001
    xor   ax, ax
  @@001:
    mov   Error, ax
  end;
{$IFDEF TRIALRUN}
  _CC_; _VC_;
{$ENDIF}
  Result := Error = 0;
end;
{$ENDIF}

end.
