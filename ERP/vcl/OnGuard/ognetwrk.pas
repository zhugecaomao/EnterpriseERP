{*********************************************************}
{*                  OGNETWRK.PAS 1.13                    *}
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

unit OgNetWrk;
  {-network file routines}

interface

uses
  {$IFDEF Win32} Windows, {$ELSE} WinTypes, WinProcs, {$ENDIF}
  Classes, SysUtils,
  OgConst,
  OgUtil,
  OnGuard;

type
  TNetAccess = packed record
    Fh         : Integer;
    Key        : TKey;
    CheckValue : Word;
    Index      : Word;
  end;

  TNetAccessInfo = packed record
    Total   : Cardinal;
    Locked  : Cardinal;
    Invalid : Cardinal;
  end;

type
  TGetFileNameEvent =                                                  {!!.02}
    procedure(Sender : TObject; var Value : string)                    {!!.02}
    of object;                                                         {!!.02}

  TOgNetCode = class(TOgCodeBase)
  protected {private}
    {property variables}
    FFileName        : string;

    {event variables}                                                  {!!.02}
    FOnGetFileName   : TGetFileNameEvent;                              {!!.02}

    {internal variables}
    nacNetAccess     : TNetAccess;
    nacNetAccessInfo : TNetAccessInfo;

    {property methods}
    function GetActiveUsers : LongInt;
    function GetInvalidUsers : LongInt;
    function GetMaxUsers : LongInt;

  protected
    procedure Loaded;
      override;

    function DoOnGetFileName : string;                                 {!!.02}
      dynamic;                                                         {!!.02}

  public
    constructor Create(AOwner : TComponent);                           {!!.01}
      override;
    destructor Destroy;
      override;

    function CheckCode(Report : Boolean) : TCodeStatus;
      override;
    function CreateAccessFile : Boolean;
      {-creates the net access file}
    function IsRemoteDrive(const ExePath : string) : Boolean;
      {-returns True if the application is running on a remote drive}
    function ResetAccessFile : Boolean;
      {-rewrites the net access file, returning True if successful}

    property ActiveUsers : LongInt
      read GetActiveUsers;

    property InvalidUsers : LongInt
      read GetInvalidUsers;

    property MaxUsers : LongInt
      read GetMaxUsers;

  published
    {properties}
    property Code
      stored FStoreCode;

    property FileName : string
      read FFileName
      write FFileName;

    property StoreCode
      default DefStoreCode;

    {events}
    property OnGetFileName :  TGetFileNameEvent                        {!!.02}
      read FOnGetFileName                                              {!!.02}
      write FOnGetFileName;                                            {!!.02}
  end;

{network user access/count routines}
function CheckNetAccessFile(const NetAccess : TNetAccess) : Boolean;
  {-verifies that the NetAccess record provides authorized use}
function CreateNetAccessFile(const FileName : string; const Key : TKey; Count : Word) : Boolean;
  {-creates the net access file as FileName using Key for encryption}
function CreateNetAccessFileEx(const FileName : string; const Key : TKey;
         const Code : TCode) : Boolean;
  {-creates the net access file getting the user count from a previously encoded Code block}
function DecodeNAFCountCode(const Key : TKey; const Code : TCode) : LongInt;
  {-returns the user count from a previously encoded Code block}
procedure EncodeNAFCountCode(const Key : TKey; Count : Cardinal;  var Code : TCode);
  {-creates an encoded Code block for Count users}
function GetNetAccessFileInfo(const FileName : string; const Key : TKey;
         var NetAccessInfo : TNetAccessInfo) : Boolean;
  {-fills a TNetAccessInfo structure. returns Fasle on error}
function IsAppOnNetwork(const ExePath : string) : Boolean;
  {-returns True if the application is running on a netword drive}
function LockNetAccessFile(const FileName : string; const Key : TKey; var NetAccess : TNetAccess) : Boolean;
  {-locks a record in FileName and fills NetAccess. returns False on error}
function ResetNetAccessFile(const FileName : string; const Key : TKey) : Boolean;
  {-rewrites the net access file contents}
function UnlockNetAccessFile(var NetAccess : TNetAccess) : Boolean;
  {-unlocks the net access record defined by NetAccess. returns False on error}


implementation

{$IFDEF TRIALRUN} uses OgTrial; {$ENDIF}

{*** TOgNetCode ***}

function TOgNetCode.CheckCode(Report : Boolean) : TCodeStatus;
var
  Key      : TKey;
begin
  Result := ogValidCode;

  DoOnGetKey(Key);
  ApplyModifierToKeyPrim(DoOnGetModifier, Key, SizeOf(Key));         {!!.09}
  if DecodeNAFCountCode(Key, DoOnGetCode) > 0 then begin             {!!.09}
    if (nacNetAccess.Fh = -1) then begin                             {!!.09}
      if (FFileName = '') then                                       {!!.09}
        FFileName := DoOnGetFileName;                                {!!.09}
      LockNetAccessFile(FFileName, Key, nacNetAccess);               {!!.09}
    end;                                                             {!!.09}
    if not CheckNetAccessFile(nacNetAccess) then
      Result := ogNetCountUsed;
  end else
    Result := ogInvalidCode;

  if Report then
    DoOnChecked(Result);
end;

{!!.01}
constructor TOgNetCode.Create(AOwner : TComponent);
begin
  inherited Create(AOwner);

  nacNetAccess.Fh := -1;
{$IFDEF TRIALRUN}
  _CC_;
  _VC_;
{$ENDIF}
end;

function TOgNetCode.CreateAccessFile : Boolean;
var
  Code     : TCode;
  Key      : TKey;
  Modifier : LongInt;
begin
  DoOnGetKey(Key);
  Code := DoOnGetCode;
  Modifier := DoOnGetModifier;
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  Result := CreateNetAccessFileEx(FFileName, Key, Code);
end;

destructor TOgNetCode.Destroy;
begin
  UnlockNetAccessFile(nacNetAccess);

  inherited Destroy;
end;

{!!.02}
function TOgNetCode.DoOnGetFileName : string;
begin
  if not Assigned(FOnGetFileName) then
    raise EOnGuardException.Create(StrRes[SCNoOnGetFileName]);

  FOnGetFileName(Self, Result);
end;

function TOgNetCode.GetActiveUsers : LongInt;
var
  Key           : TKey;
  Modifier      : LongInt;
  NetAccessInfo : TNetAccessInfo;
begin
  DoOnGetKey(Key);
  Modifier := DoOnGetModifier;
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  if GetNetAccessFileInfo(FileName, Key, NetAccessInfo) then
    Result := NetAccessInfo.Locked
  else
    Result := -1;
end;

function TOgNetCode.GetInvalidUsers : LongInt;
var
  Key           : TKey;
  Modifier      : LongInt;
  {NetAccessInfo : TNetAccessInfo;}                                  {!!.08}
begin
  DoOnGetKey(Key);
  Modifier := DoOnGetModifier;
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  if GetNetAccessFileInfo(FFileName, Key, nacNetAccessInfo) then
    Result := nacNetAccessInfo.Invalid                               {!!.08}
  else
    Result := -1;
end;

function TOgNetCode.GetMaxUsers : LongInt;
var
  Key      : TKey;
  Modifier : LongInt;
begin
  DoOnGetKey(Key);
  Modifier := DoOnGetModifier;
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  if GetNetAccessFileInfo(FFileName, Key, nacNetAccessInfo) then
    Result := nacNetAccessInfo.Total
  else
    Result := -1;
end;

function TOgNetCode.IsRemoteDrive(const ExePath : string) : Boolean;
begin
  Result := IsAppOnNetwork(ExePath);
end;

procedure TOgNetCode.Loaded;
var
  Key      : TKey;
  Code     : TCode;
  Modifier : LongInt;
begin
  if FAutoCheck and not (csDesigning in ComponentState) then begin   {!!.08}
    Code := DoOnGetCode;
    DoOnGetKey(Key);
    Modifier := DoOnGetModifier;

    {if no file name, fire event to get one}                           {!!.02}
    if FFileName = '' then                                            {!!.02}
      FFilename := DoOnGetFileName;                                    {!!.02}

    ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
    if DecodeNAFCountCode(Key, Code) > 0 then begin
      try
        if not GetNetAccessFileInfo(FFileName, Key, nacNetAccessInfo) then
          CreateAccessFile; {wasn't there, try to create it}
        LockNetAccessFile(FFileName, Key, nacNetAccess); 
      except
        {ignore errors - CheckCode will report that record is not locked}
      end;
    end;
  end;

  inherited Loaded;
end;

function TOgNetCode.ResetAccessFile : Boolean;
var
  Key      : TKey;
  Modifier : LongInt;
begin
  DoOnGetKey(Key);
  Modifier := DoOnGetModifier;
  ApplyModifierToKeyPrim(Modifier, Key, SizeOf(Key));
  Result := ResetNetAccessFile(FFileName, Key);
end;


{network user access/count routines}
function CheckNetAccessFile(const NetAccess : TNetAccess) : Boolean;
var
  Code : TCode;
begin
  Result := False;

  if (NetAccess.Fh > -1) then begin
    FileSeek(NetAccess.Fh, NetAccess.Index * SizeOf(Code), 0);
    if (FileRead(NetAccess.Fh, Code, SizeOf(Code)) = SizeOf(Code)) then begin
      MixBlock(T128bit(NetAccess.Key), Code, False);
      Result := (Code.CheckValue = NetAccess.CheckValue) and (Code.NetIndex = NetAccess.Index);
    end;
  end;
end;

function CreateNetAccessFile(const FileName : string; const Key : TKey; Count : Word) : Boolean;
var
  Fh   : Integer;
  I    : LongInt;
  Code : TCode;
begin
  Result := False;

  Fh := FileCreate(FileName);
  if (Fh > -1) then begin
    for I := 0 to Count - 1 do begin
      Code.CheckValue := NetCheckCode;
      Code.Expiration := 0; {not used}
      Code.NetIndex := I;
      MixBlock(T128bit(Key), Code, True);
      FileWrite(Fh, Code, SizeOf(Code));
    end;

    FlushFileBuffers(Fh);
    Result := GetFileSize(Fh) = (Count * SizeOf(Code));
    FileClose(Fh);
  end;
end;

function CreateNetAccessFileEx(const FileName : string; const Key : TKey; const Code : TCode) : Boolean;
var
  L : LongInt;
begin
  L := DecodeNAFCountCode(Key, Code);
  if L > 0 then
    Result := CreateNetAccessFile(FileName, Key, L)
  else
    Result := False;
end;

function DecodeNAFCountCode(const Key : TKey; const Code : TCode) : LongInt;
var
  Work : TCode;
begin
  Work := Code;
  MixBlock(T128bit(Key), Work, False);
  if (Work.CheckValue = NetCheckCode) then
    Result := Work.NetIndex
  else
    Result := -1;
end;

procedure EncodeNAFCountCode(const Key : TKey; Count : Cardinal; var Code : TCode);
begin
  Code.CheckValue := NetCheckCode;
  Code.Expiration := 0; {not used}
  Code.NetIndex := Count;
  MixBlock(T128bit(Key), Code, True);
end;

function GetNetAccessFileInfo(const FileName : string; const Key : TKey;
         var NetAccessInfo : TNetAccessInfo) : Boolean;
var
  Fh   : Integer;
  I    : LongInt;
  Code : TCode;
begin
  Result := False;

  Fh := FileOpen(FileName, fmOpenRead or fmShareDenyNone);
  if (Fh > -1) then begin
    NetAccessInfo.Total := GetFileSize(Fh) div SizeOf(Code);
    NetAccessInfo.Locked := 0;
    NetAccessInfo.Invalid := 0;

    for I := 0 to NetAccessInfo.Total - 1 do begin
      if LockFile(Fh, I * SizeOf(Code), 0, SizeOf(Code), 0) then begin
        FileSeek(Fh, I * SizeOf(Code), 0);
        FileRead(Fh, Code, SizeOf(Code));
        MixBlock(T128bit(Key), Code, False);
        if (Code.NetIndex <> I) or (Code.CheckValue <> NetCheckCode) then
          Inc(NetAccessInfo.Invalid);
        UnlockFile(Fh, I * SizeOf(Code), 0, SizeOf(Code), 0);
      end else
        Inc(NetAccessInfo.Locked);
    end;

    FlushFileBuffers(Fh);
    FileClose(Fh);
    Result := True;
  end;
end;

{$IFDEF Win32}
function IsAppOnNetwork(const ExePath : string) : Boolean;
begin
  Result := (GetDriveType(PAnsiChar(ExtractFileDrive(ExePath) + '\')) = DRIVE_REMOTE);
end;
{$ELSE}
function IsAppOnNetwork(const ExePath : string) : Boolean;
var
  D : Integer;
begin
  D := Ord(UpCase(ExePath[1])) - Ord('A');                             {!!.07}
  Result := GetDriveType(D) = DRIVE_REMOTE;
end;
{$ENDIF}

function LockNetAccessFile(const FileName : string; const Key : TKey;
                           var NetAccess : TNetAccess) : Boolean;
var
  Fh    : Integer;
  Count : Cardinal;
  I     : LongInt;
  Code  : TCode;
begin
  Result := False;

  FillChar(NetAccess, SizeOf(NetAccess), 0);
  NetAccess.Fh := -1;

  Fh := FileOpen(FileName, fmOpenReadWrite or fmShareDenyNone);
  if (Fh > -1) then begin
    Count := GetFileSize(Fh) div SizeOf(Code);
    {find an unused record to use}
    for I := 0 to Count - 1 do begin
      if LockFile(Fh, I * SizeOf(Code), 0, SizeOf(Code), 0) then begin
        FileSeek(Fh, I * SizeOf(Code), 0);
        FileRead(Fh, Code, SizeOf(Code));
        MixBlock(T128bit(Key), Code, False);
        if (Code.NetIndex = I) and (Code.CheckValue = NetCheckCode) then begin
          NetAccess.Fh := Fh;
          NetAccess.Key := Key;
          NetAccess.Index := I;
          NetAccess.CheckValue := HiWord(GenerateUniqueModifierPrim);

          Code.CheckValue := NetAccess.CheckValue;
          Code.Expiration := 0; {not used}
          Code.NetIndex := NetAccess.Index;
          MixBlock(T128bit(Key), Code, True);

          FileSeek(Fh, I * SizeOf(Code), 0);
          FileWrite(Fh, Code, SizeOf(Code));
          FlushFileBuffers(Fh);
          Result := True;
          Exit;
        end else
          UnlockFile(Fh, I * SizeOf(Code), 0, SizeOf(Code), 0);
      end;
    end;
    FileClose(Fh);
  end;
end;

function ResetNetAccessFile(const FileName : string; const Key : TKey) : Boolean;
var
  Fh    : Integer;
  Count : Cardinal;
  I     : LongInt;
  Code  : TCode;
begin
  Result := False;

  Fh := FileOpen(FileName, fmOpenReadWrite or fmShareDenyNone);
  if (Fh > -1) then begin
    Count := GetFileSize(Fh) div SizeOf(Code);
    for I := 0 to Count - 1 do
      {attempt to lock this record. skip records that are locked}
      if LockFile(Fh, I * SizeOf(Code), 0, SizeOf(Code), 0) then begin
        try
          Code.CheckValue := NetCheckCode;
          Code.Expiration := 0; {not used}
          Code.NetIndex := I;
          MixBlock(T128bit(Key), Code, True);
          FileSeek(Fh, I * SizeOf(Code), 0);
          FileWrite(Fh, Code, SizeOf(Code));
        finally
          UnlockFile(Fh, I * SizeOf(Code), 0, SizeOf(Code), 0);
        end;
      end;
    FlushFileBuffers(Fh);
    FileClose(Fh);
    Result := True;
  end;
end;

function UnlockNetAccessFile(var NetAccess : TNetAccess) : Boolean;
var
  Code : TCode;
begin
  Result := False;

  if CheckNetAccessFile(NetAccess) then begin
    Code.CheckValue := NetCheckCode;
    Code.Expiration := 0; {not used}
    Code.NetIndex := NetAccess.Index;
    MixBlock(T128bit(NetAccess.Key), Code, True);
    FileSeek(NetAccess.Fh, NetAccess.Index * SizeOf(Code), 0);
    FileWrite(NetAccess.Fh, Code, SizeOf(Code));

    FlushFileBuffers(NetAccess.Fh);
    FileClose(NetAccess.Fh);

    FillChar(NetAccess, SizeOf(NetAccess), 0);
    NetAccess.Fh := -1;

    Result := True;
  end;
end;

end.
