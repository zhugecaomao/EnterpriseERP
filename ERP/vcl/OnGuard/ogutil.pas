{*********************************************************}
{*                   OGUTIL.PAS 1.13                     *}
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

unit OgUtil;
  {-general constants, types, and utility routines}

interface

uses
  {$IFDEF Win32} Windows, {$ELSE} WinTypes, WinProcs, OLE2, {$ENDIF}
  SysUtils,
  OgConst,
  OgSrMgr;                                                          {!!.08}

const
  DefAutoCheck      = True;
  DefAutoDecrease   = True;
  DefCheckSize      = True;
  DefStoreCode      = False;
  DefStoreModifier  = False;
  DefStoreRegString = False;

const
  OgVersionStr      = '1.13';



const
  {largest structure that can be created}
  {$IFDEF Win32}
  MaxStructSize = 1024 * 2000000; {2G}
  {$ELSE}
  MaxStructSize = 1024 * 64 - 1;  {64K}
  {$ENDIF}

type
  {$IFNDEF Win32}
  DWord      = LongInt;
  PDWord     = ^DWord;
  TGUID      = GUID;   {Delphi 1.0 defines it as GUID - Delphi 2.0 defines it as TGUID}
  AnsiChar   = Char;
  PAnsiChar  = PChar;
  {$ENDIF}

  PByte         = ^Byte;
  PByteArray    = ^TByteArray;
  TByteArray    = array [0..MaxStructSize div SizeOf(Byte) - 1] of Byte;
  PLongInt      = ^LongInt;
  PLongIntArray = ^TLongIntArray;
  TLongIntArray = array [0..MaxStructSize div SizeOf(LongInt) - 1] of LongInt;

  TLongIntRec = record
    case Byte of
      1: (Lo: Word;
          Hi: Word);
      2: (LoLo: Byte;
          LoHi: Byte;
          HiLo: Byte;
          HiHi: Byte);
  end;


function BufferToHex(const Buf; BufSize : Cardinal) : string;
function BufferToHexBytes(const Buf; BufSize : Cardinal) : string;
{$IFNDEF Win32}
function GetDiskSerialNumber(Drive : AnsiChar) : LongInt;
{$ENDIF}
function HexStringIsZero(const Hex : string) : Boolean;
function HexToBuffer(const Hex : string; var Buf; BufSize : Cardinal) : Boolean;
function Max(A, B : LongInt): LongInt;
function Min(A, B : LongInt) : LongInt;
procedure XorMem(var Mem1; const Mem2; Count : Cardinal);
function OgFormatDate(Value : TDateTime) : string;                     {!!.09}

{file related routines}
function GetFileSize(Handle : THandle) : Cardinal;
{$IFNDEF Win32}
function LockFile(Handle : THandle; FileOffsetLow, FileOffsetHigh,
                  LockCountLow, LockCountHigh : Word) : Boolean;
function UnlockFile(Handle : THandle; FileOffsetLow, FileOffsetHigh,
                    UnLockCountLow, UnLockCountHigh : Word) : Boolean;
function FlushFileBuffers(Handle : THandle) : Boolean;
{$ENDIF}

var
  StrRes : TOgStringResource;                                           {!!.08}

implementation

{$IFDEF TRIALRUN} uses OgTrial; {$ENDIF}

function BufferToHex(const Buf; BufSize : Cardinal) : string;
var
  Bytes : TByteArray absolute Buf;
  I     : LongInt;
begin
  {$IFDEF TRIALRUN}
    _CC_; _VC_;
  {$ENDIF}
  Result := '';
  for I := 0 to BufSize - 1 do
    Result := Result + IntToHex(Bytes[I], 2);
end;

function BufferToHexBytes(const Buf;  BufSize : Cardinal) : string;
var
  Bytes  : TByteArray absolute Buf;
  I      : LongInt;
  HexStr : string;
begin
  {$IFDEF TRIALRUN}
    _CC_; _VC_;
  {$ENDIF}
  {$IFDEF BCB}
  HexStr := '0x';
  {$ELSE}
  HexStr := '$';
  {$ENDIF}
  Result := HexStr + IntToHex(Bytes[0], 2);
  for I := 1 to BufSize - 1 do
    Result := Result + ',' + HexStr + IntToHex(Bytes[I], 2);
end;

{$IFNDEF Win32}
type
  PMediaIDRec = ^TMediaIDRec;
  TMediaIDRec = packed record
    InfoLevel    : Word;                      {reserved for future use}
    SerialNumber : LongInt;                   {disk serial number}
    VolumeLabel  : array[0..10] of AnsiChar;  {disk volume label}
    FileSystemID : array[0..7] of AnsiChar;   {string for internal use by the OS}
  end;

type
  DPMIRegisters = record
    DI : LongInt;
    SI : LongInt;
    BP : LongInt;
    Reserved : LongInt;
    case integer of
    1 : ( BX : LongInt;
          DX : LongInt;
          CX : LongInt;
          AX : LongInt;
          Flags : Word;
          ES : Word;
          DS : Word;
          FS : Word;
          GS : Word;
          IP : Word;
          CS : Word;
          SP : Word;
          SS : Word );
    2 : ( BL, BH : Byte; EBXH : Word;
          DL, DH : Byte; EDXH : Word;
          CL, CH : Byte; ECXH : Word;
          AL, AH : Byte; EAXH : Word );
  end;

  OS = record
    O, S : Word;
  end;

function GetCPUFlags : Byte; assembler;
asm
  lahf
  mov    al,ah
end;

function SimulateRealModeInt(IntNo : Byte; var Regs : DPMIRegisters) : Word; assembler;
asm
  xor     bx,bx
  mov     bl,IntNo
  xor     cx,cx       {StackWords = 0}
  les     di,Regs
  mov     ax,0300h
  int     31h
  jc      @@ExitPoint

  xor     ax,ax
@@ExitPoint:
end;

function GetMediaID(Drive : Byte; var MediaIDRec : TMediaIDRec) : Boolean;
type
  DoubleWord = record LoWord, HiWord : Word; end;
var
  L      : LongInt;
  RP, PP : PMediaIDRec;
  Regs   : DPMIRegisters;
begin
  Result := False;
  L := GlobalDosAlloc(SizeOf(TMediaIDRec));
  if L = 0 then
    Exit;
  try
    RP := Ptr(DoubleWord(L).HiWord, 0);
    PP := Ptr(DoubleWord(L).LoWord, 0);
    FillChar(Regs, SizeOf(Regs), 0);
    with Regs do begin
      DS := OS(RP).S;
      DX := OS(RP).O;
      AX := $440D;
      BX := Drive;
      CX := $0866;
      Flags := GetCPUFlags;
    end;
    SimulateRealModeInt($21, Regs);
    if not Odd(Regs.Flags) then begin
      MediaIDRec := PP^;
      Result := True;
    end;
  finally
    GlobalDosFree(OS(PP).S);
  end;
end;

function GetDiskSerialNumber(Drive : AnsiChar) : LongInt;
var
  MR : TMediaIDRec;
begin
  if GetMediaID(Ord(UpCase(Drive))-Ord('A')+1 ,MR) then
    Result := MR.SerialNumber
  else
    Result := -1;
end;
{$ENDIF}

function HexStringIsZero(const Hex : string) : Boolean;
var
  I   : Integer;
  Str : string;
begin
  Result := False;

  Str := '';
  for I := 1 to Length(Hex) do
    if Upcase(Hex[I]) in ['0'..'9', 'A'..'F'] then
      Str := Str + Hex[I];

  for I := 1 to Length(Str) do
    if Str[I] <> '0' then
      Exit;

  Result := True;
end;

function HexToBuffer(const Hex : string; var Buf; BufSize : Cardinal) : Boolean;
var
  Bytes : TByteArray absolute Buf;
  I, C  : Integer;
  Str   : string;
begin
  {$IFDEF TRIALRUN}
    _CC_; _VC_;
  {$ENDIF}
  Result := False;

  Str := '';
  for I := 1 to Length(Hex) do
    if Upcase(Hex[I]) in ['0'..'9', 'A'..'F'] then
      Str := Str + Hex[I];

  if (Cardinal(Length(Str) div 2) <> BufSize) then                     {!!.07}
    Exit;

  for I := 0 to BufSize - 1 do begin
    Val('$' + Copy(Str, (I shl 1) + 1, 2), Bytes[I], C);
    if (C <> 0) then
      Exit;
  end;

  Result := True;
end;

{$IFDEF Win32}
function Max(A, B : LongInt) : LongInt; register;
asm
  cmp  eax, edx
  jge  @Exit
  mov  eax, edx
@Exit:
end;
{$ELSE}
function Max(A, B : LongInt) : LongInt;
begin
  if A > B then
    Result := A
  else
    Result := B;
end;
{$ENDIF}

{$IFDEF Win32}
function Min(A, B : LongInt) : LongInt; register;
asm
  cmp  eax, edx
  jle  @Exit
  mov  eax, edx
@Exit:
end;
{$ELSE}
function Min(A, B : LongInt) : LongInt;
begin
  if A < B then
    Result := A
  else
    Result := B;
end;
{$ENDIF}

{$IFDEF Win32}
procedure XorMem(var Mem1; const Mem2; Count : Cardinal); register;
asm
  push esi
  push edi

  mov  esi, eax         //esi = Mem1
  mov  edi, edx         //edi = Mem2

  push ecx              //save byte count
  shr  ecx, 2           //convert to dwords
  jz   @Continue

  cld
@Loop1:                 //xor dwords at a time
  mov  eax, [edi]
  xor  [esi], eax
  add  esi, 4
  add  edi, 4
  dec  ecx
  jnz  @Loop1

@Continue:              //handle remaining bytes (3 or less)
  pop  ecx
  and  ecx, 3
  jz   @Done

@Loop2:                 //xor remaining bytes
  mov  al, [edi]
  xor  [esi], al
  inc  esi
  inc  edi
  dec  ecx
  jnz  @Loop2

@Done:
  pop  edi
  pop  esi
end;
{$ELSE}
{!!.02} {revised}
procedure XorMem(var Mem1; const Mem2; Count : Cardinal); assembler;
asm
  push  ds
  push  es
  lds   si, Mem2
  les   di, Mem1
  mov   cx, Count
  jz    @Done
  cld
@Loop1:
  mov  al, ds:[si]
  xor  es:[di], al
  inc  si
  inc  di
  dec  cx
  jnz  @Loop1
@Done:
  pop  es
  pop  ds
end;
{$ENDIF}

{!!.09}
function OgFormatDate(Value : TDateTime) : string;
  {convert date to string with 4-digit year and 2-digit month}
var
  S : string;
begin
  S := ShortDateFormat;
  if Pos('yyyy', S) = 0 then
    Insert('yy', S, Pos('yy', S));
  if Pos('MMM', S) > 0 then
    Delete(S, Pos('MMM', S), 1);
  Result := FormatDateTime(S, Value)
end;


{file related routines}
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
  Result := Error = 0;
end;
{$ENDIF}

(*
{$IFDEF Win32}
function RolByteX(I, C : Byte) : Byte; register;
asm
  mov  cl, dl
  rol  al, cl
end;
{$ELSE}
function RolByteX(I, C : Byte) : Byte; assembler;
asm
  mov  al, I
  mov  cl, C
  rol  al, cl
end;
{$ENDIF}
*)

procedure FreeStrRes; far;
begin
  StrRes.Free;
  StrRes := nil;
end;

initialization
  StrRes := TOgStringResource.Create(HInstance, 'ONGUARD_STRINGS_ENGLISH');  {!!.08}

{$IFDEF Win32}
finalization
  FreeStrRes;
{$ELSE}
  AddExitProc(FreeStrRes);
{$ENDIF}
end.
