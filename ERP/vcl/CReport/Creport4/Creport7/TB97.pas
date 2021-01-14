
unit TB97;

{

  Toolbar97 version 1.68
  Copyright (C) 1998 by Jordan Russell

  e-mail:     jordanr@iname.com
  home page:  http://www.connect.net/jordanr/
              (alternate address: http://www.digicron.com/jordanr/)

  *PLEASE NOTE*  Before making any bug reports please first verify you are
                 using the latest version by checking my home page. And if
                 you do report a bug, please, if applicable, include a code
                 sample.

  You are free to use Toolbar97 in compiled form for any purpose. However,
  use in commercial or shareware applications requires registration. The
  Toolbar97 source code or DCU, in whole or in part, modified or unmodified,
  may not be redistributed for profit or as part of another commercial or
  shareware software package without express written permission from me.

  This code is distributed "as is" without any warranties, express or implied.

  Notes:
  - I cannot support modified versions of this code. So if you encounter a
    possible bug while using a modified version, always first revert back to
    the my original code before making an attempt to contact me.
  - While debugging the toolbar code you might want to enable the
    'TB97DisableLock' conditional define, as described below.
  - In the WM_NCPAINT handlers, GetWindowRect is used to work around a possible
    VCL problem. The Width, Height, and BoundsRect properties are sometimes
    wrong. So it avoids any use of these properties in the WM_NCPAINT handlers.
  - In case you are unsure of its meaning, NewStyleControls is a VCL variable
    set to True at application startup if the user is running Windows 95 or NT
    4.0 or later.
}

{x$DEFINE TB97DisableLock}
{ Remove the 'x' to enable the define. It will disable calls to
  LockWindowUpdate, which it calls to disable screen updates while dragging.
  You should temporarily enable that while debugging so you are able to see
  your code window if you have something like a breakpoint that's set inside
  the dragging routines }

{$I TB97Ver.inc}

interface

uses
  Windows, Messages, Classes, Controls, Forms, Graphics;

const
  Toolbar97Version = '1.68';

  WM_TB97PaintDockedNCArea = WM_USER + 5039;  { used internally }

type
  { TDock97 }

  TDockBoundLinesValues = (blTop, blBottom, blLeft, blRight);
  TDockBoundLines = set of TDockBoundLinesValues;
  TDockPosition = (dpTop, dpBottom, dpLeft, dpRight);
  TDockType = (dtNotDocked, dtTopBottom, dtLeftRight);
  TDockableTo = set of TDockPosition;

  TCustomToolWindow97 = class;

  TInsertRemoveEvent = procedure(Sender: TObject; Inserting: Boolean;
    Bar: TCustomToolWindow97) of object;
  TRequestDockEvent = procedure(Sender: TObject; Bar: TCustomToolWindow97;
    var Accept: Boolean) of object;

  TDock97 = class(TCustomControl)
  private
    { Property values }
    FPosition: TDockPosition;
    FAllowDrag: Boolean;
    FBoundLines: TDockBoundLines;
    FBkg, FBkgCache: TBitmap;
    FBkgTransparent, FBkgOnToolbars: Boolean;
    FFixAlign: Boolean;
    FLimitToOneRow: Boolean;
    FOnInsertRemoveBar: TInsertRemoveEvent;
    FOnRequestDock: TRequestDockEvent;
    FOnResize: TNotifyEvent;

    { Internal }
    FDisableArrangeToolbars: Integer; { Increment to disable ArrangeToolbars }
    FArrangeToolbarsNeeded: Boolean;
    DockList: TList;  { List of the visible toolbars docked. Items are casted in TCustomToolWindow97's.
                        But, at design time, all docked toolbars are here regardless of visibility }
    RowSizes: TList;  { List of the width or height of each row, depending on what Position is set to.
                        Items are casted info Longint's }

    { Property access methods }
    procedure SetAllowDrag (Value: Boolean);
    procedure SetBackground (Value: TBitmap);
    procedure SetBackgroundOnToolbars (Value: Boolean);
    procedure SetBackgroundTransparent (Value: Boolean);
    procedure SetBoundLines (Value: TDockBoundLines);
    procedure SetFixAlign (Value: Boolean);
    procedure SetPosition (Value: TDockPosition);

    function GetToolbarCount: Integer;
    function GetToolbars (Index: Integer): TCustomToolWindow97;

    { Internal }
    function GetRowOf (const XY: Integer; var Before: Boolean): Integer;
    function GetDesignModeRowOf (const XY: Integer): Integer;
    function GetHighestRow: Integer;
    function GetNumberOfToolbarsOnRow (const Row: Integer;
      const NotIncluding: TCustomToolWindow97): Integer;
    procedure RemoveBlankRows;
    procedure InsertRowBefore (const BeforeRow: Integer);
    procedure BuildRowInfo;
    procedure ChangeDockList (const Insert: Boolean; const Bar: TCustomToolWindow97;
      const IsVisible: Boolean);
    procedure ChangeWidthHeight (const IsClientWidthAndHeight: Boolean;
      NewWidth, NewHeight: Integer);
    procedure ArrangeToolbars;
    procedure DrawBackground (const DC: HDC;
      const IntersectClippingRect: TRect; const ExcludeClippingRect: PRect;
      const DrawRect: TRect);
    procedure InvalidateBackgrounds;
    procedure BackgroundChanged (Sender: TObject);
    function UsingBackground: Boolean;

    { Messages }
    procedure CMColorChanged (var Message: TMessage); message CM_COLORCHANGED;
    procedure CMSysColorChange (var Message: TMessage); message CM_SYSCOLORCHANGE;
    procedure WMMove (var Message: TWMMove); message WM_MOVE;
    procedure WMSize (var Message: TWMSize); message WM_SIZE;
    procedure WMNCCalcSize (var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCPaint (var Message: TMessage); message WM_NCPAINT;
  protected
    procedure AlignControls (AControl: TControl; var Rect: TRect); override;
    function GetPalette: HPALETTE; override;
    procedure Loaded; override;
    procedure SetParent (AParent: TWinControl); override;
    procedure Paint; override;
  public
    constructor Create (AOwner: TComponent); override;
    procedure CreateParams (var Params: TCreateParams); override;
    destructor Destroy; override;

    procedure BeginUpdate;
    procedure EndUpdate;
    function GetRowSize (const Row: Integer;
      const DefaultToolbar: TCustomToolWindow97): Integer;

    property ToolbarCount: Integer read GetToolbarCount;
    property Toolbars[Index: Integer]: TCustomToolWindow97 read GetToolbars;
  published
    property AllowDrag: Boolean read FAllowDrag write SetAllowDrag default True;
    property Background: TBitmap read FBkg write SetBackground;
    property BackgroundOnToolbars: Boolean read FBkgOnToolbars write SetBackgroundOnToolbars default True;
    property BackgroundTransparent: Boolean read FBkgTransparent write SetBackgroundTransparent default False;
    property BoundLines: TDockBoundLines read FBoundLines write SetBoundLines default [];
    property Color default clBtnFace;
    property FixAlign: Boolean read FFixAlign write SetFixAlign default False;
    property LimitToOneRow: Boolean read FLimitToOneRow write FLimitToOneRow default False;
    property PopupMenu;
    property Position: TDockPosition read FPosition write SetPosition default dpTop;
    property Visible;

    property OnInsertRemoveBar: TInsertRemoveEvent read FOnInsertRemoveBar write FOnInsertRemoveBar;
    property OnRequestDock: TRequestDockEvent read FOnRequestDock write FOnRequestDock;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
  end;

  { TFloatingWindowParent - internal }

  TFloatingWindowParent = class(TForm)
  private
    FParentForm: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
    FShouldShow: Boolean;
    procedure CMShowingChanged (var Message: TMessage); message CM_SHOWINGCHANGED;
    procedure CMDialogKey (var Message: TCMDialogKey); message CM_DIALOGKEY;
  protected
    procedure CreateParams (var Params: TCreateParams); override;
  public
    property ParentForm: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF} read FParentForm;
    constructor Create (AOwner: TComponent); override;
  end;

  { TCustomToolWindow97 }

  TDockChangingExEvent = procedure(Sender: TObject; DockingTo: TDock97) of object;
  TDragHandleStyle = (dhDouble, dhNone, dhSingle);
  TToolWindowParams = record
    CallAlignControls, ResizeEightCorner, ResizeClipCursor: Boolean;
  end;
  TPositionReadIntProc = function(const ToolbarName, Value: String; const Default: Longint;
    const ExtraData: Pointer): Longint;
  TPositionReadStringProc = function(const ToolbarName, Value, Default: String;
    const ExtraData: Pointer): String;
  TPositionWriteIntProc = procedure(const ToolbarName, Value: String; const Data: Longint;
    const ExtraData: Pointer);
  TPositionWriteStringProc = procedure(const ToolbarName, Value, Data: String;
    const ExtraData: Pointer);

  TCustomToolWindow97 = class(TCustomControl)
  private
    { Property variables }
    FDockPos, FDockRow: Integer;
    FDocked: Boolean;
    FDockedTo, FDefaultDock: TDock97;
    FOnClose, FOnDockChanged, FOnDockChanging, FOnMove, FOnRecreated,
      FOnRecreating, FOnResize, FOnVisibleChanged: TNotifyEvent;
    FOnDockChangingEx, FOnDockChangingHidden: TDockChangingExEvent;
    FActivateParent, FHideWhenInactive, FCloseButton, FFullSize, FResizable: Boolean;
    FBorderStyle: TBorderStyle;
    FDragHandleStyle: TDragHandleStyle;
    FDockableTo: TDockableTo;
    FLastDockType: TDockType;
    FLastDockTypeSet: Boolean;
    FParams: TToolWindowParams;

    { Misc. }
    FUpdatingBounds,           { Incremented while internally changing the bounds. This allows
                                 it to move the toolbar freely in design mode and prevents the
                                 SizeChanging protected method from begin called }
    FDisableArrangeControls,   { Incremented to disable ArrangeControls }
    FDisableOnMove,            { Incremented to prevent WM_MOVE handler from calling the OnMoved handler }
    FHidden: Integer;          { Incremented while the toolbar is temporarily hidden }
    FArrangeNeeded, FMoved: Boolean;
    FInactiveCaption: Boolean; { True when the caption of the toolbar is currently the inactive color }
    FFloatingTopLeft: TPoint;
    FDockForms: TList;
    FSavedAtRunTime: Boolean;

    { When floating. These are not used in design mode }
    FFloatParent: TFloatingWindowParent; { Run-time only: The actual Parent of the toolbar when it is floating }
    FCloseButtonDown: Boolean; { True if Close button is currently depressed }

    { Property access methods }
    procedure SetBorderStyle (Value: TBorderStyle);
    procedure SetCloseButton (Value: Boolean);
    procedure SetDefaultDock (Value: TDock97);
    procedure SetDockedTo (Value: TDock97);
    procedure SetDockPos (Value: Integer);
    procedure SetDockRow (Value: Integer);
    procedure SetDragHandleStyle (Value: TDragHandleStyle);
    procedure SetFullSize (Value: Boolean);
    procedure SetResizable (Value: Boolean);

    { Internal }
    procedure MoveOnScreen (const OnlyIfFullyOffscreen: Boolean);
    procedure DrawDraggingOutline (const DC: HDC; const NewRect, OldRect: PRect;
      const NewDocking, OldDocking: Boolean);
    procedure BeginMoving (const InitX, InitY: Integer);
    procedure BeginSizing (const HitTestValue: Integer; var Accept: Boolean;
      var NewRect: TRect);
    procedure DrawFloatingNCArea (const Clip: HRGN; const RedrawBorder, RedrawCaption, RedrawCloseButton: Boolean);
    procedure DrawDockedNCArea (const Clip: HRGN);
    procedure InvalidateDockedNCArea;
    procedure ValidateDockedNCArea;
    procedure SetInactiveCaption (Value: Boolean);
    procedure Moved;
    function GetShowingState: Boolean;
    procedure UpdateVisibility;
    procedure ReadSavedAtRunTime (Reader: TReader);
    procedure WriteSavedAtRunTime (Writer: TWriter);

    { Messages }
    procedure CMColorChanged (var Message: TMessage); message CM_COLORCHANGED;
    procedure CMTextChanged (var Message: TMessage); message CM_TEXTCHANGED;
    procedure CMShowingChanged (var Message: TMessage); message CM_SHOWINGCHANGED;
    procedure CMVisibleChanged (var Message: TMessage); message CM_VISIBLECHANGED;
    procedure WMActivate (var Message: TWMActivate); message WM_ACTIVATE;
    procedure WMClose (var Message: TWMClose); message WM_CLOSE;
    procedure WMGetMinMaxInfo (var Message: TWMGetMinMaxInfo); message WM_GETMINMAXINFO;
    procedure WMMove (var Message: TWMMove); message WM_MOVE;
    procedure WMMouseActivate (var Message: TWMMouseActivate); message WM_MOUSEACTIVATE;
    procedure WMNCCalcSize (var Message: TWMNCCalcSize); message WM_NCCALCSIZE;
    procedure WMNCHitTest (var Message: TWMNCHitTest); message WM_NCHITTEST;
    procedure WMNCLButtonDown (var Message: TWMNCLButtonDown); message WM_NCLBUTTONDOWN;
    procedure WMNCPaint (var Message: TMessage); message WM_NCPAINT;
    procedure WMTB97PaintDockedNCArea (var Message: TMessage); message WM_TB97PaintDockedNCArea;
    procedure WMSize (var Message: TWMSize); message WM_SIZE;
  protected
    property ActivateParent: Boolean read FActivateParent write FActivateParent default True;
    property BorderStyle: TBorderStyle read FBorderStyle write SetBorderStyle default bsSingle;
    property Color default clBtnFace;
    property CloseButton: Boolean read FCloseButton write SetCloseButton default True;
    property DefaultDock: TDock97 read FDefaultDock write SetDefaultDock;
    property DockableTo: TDockableTo read FDockableTo write FDockableTo default [dpTop, dpBottom, dpLeft, dpRight];
    property DragHandleStyle: TDragHandleStyle read FDragHandleStyle write SetDragHandleStyle default dhDouble;
    property FullSize: Boolean read FFullSize write SetFullSize default False;
    property HideWhenInactive: Boolean read FHideWhenInactive write FHideWhenInactive default True;
    property Params: TToolWindowParams read FParams;
    property Resizable: Boolean read FResizable write SetResizable default True;

    property OnClose: TNotifyEvent read FOnClose write FOnClose;
    property OnDockChanged: TNotifyEvent read FOnDockChanged write FOnDockChanged;
    property OnDockChanging: TNotifyEvent read FOnDockChanging write FOnDockChanging;
    property OnDockChangingEx: TDockChangingExEvent read FOnDockChangingEx write FOnDockChangingEx;
    property OnDockChangingHidden: TDockChangingExEvent read FOnDockChangingHidden write FOnDockChangingHidden;
    property OnMove: TNotifyEvent read FOnMove write FOnMove;
    property OnRecreated: TNotifyEvent read FOnRecreated write FOnRecreated;
    property OnRecreating: TNotifyEvent read FOnRecreating write FOnRecreating;
    property OnResize: TNotifyEvent read FOnResize write FOnResize;
    property OnVisibleChanged: TNotifyEvent read FOnVisibleChanged write FOnVisibleChanged;

    { Overridden methods }
    procedure AlignControls (AControl: TControl; var Rect: TRect); override;
    procedure CreateParams (var Params: TCreateParams); override;
    procedure DefineProperties (Filer: TFiler); override;
    function GetPalette: HPALETTE; override;
    procedure Loaded; override;
    procedure MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Notification (AComponent: TComponent; Operation: TOperation); override;
    procedure Paint; override;
    function PaletteChanged (Foreground: Boolean): Boolean; override;
    procedure SetParent (AParent: TWinControl); override;

    { Methods accessible to descendants }
    procedure ArrangeControls;
    function ChildControlTransparent (Ctl: TControl): Boolean; dynamic;
    procedure CustomArrangeControls (const PreviousDockType: TDockType;
      const DockingTo: TDock97; const Resize: Boolean);
    procedure GetBarSize (var ASize: Integer; const DockType: TDockType); virtual; abstract;
    procedure GetDockRowSize (var AHeightOrWidth: Integer);
    procedure GetMinimumSize (var AClientWidth, AClientHeight: Integer); virtual; abstract;
    procedure GetParams (var Params: TToolWindowParams); dynamic;
    procedure InitializeOrdering; dynamic;
    function OrderControls (CanMoveControls: Boolean; PreviousDockType: TDockType;
      DockingTo: TDock97): TPoint; virtual; abstract;
    procedure ResizeBegin (HitTestValue: Integer); dynamic;
    procedure ResizeEnd (Accept: Boolean); dynamic;
    procedure ResizeTrack (var Rect: TRect; const OrigRect: TRect); dynamic;
    procedure SizeChanging (const AWidth, AHeight: Integer); virtual;
  public
    property Docked: Boolean read FDocked;
    property DockedTo: TDock97 read FDockedTo write SetDockedTo stored False;
    property DockPos: Integer read FDockPos write SetDockPos default -1;
    property DockRow: Integer read FDockRow write SetDockRow default 0;
    property FloatingPosition: TPoint read FFloatingTopLeft write FFloatingTopLeft;

    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    function GetParentComponent: TComponent; override;
    function HasParent: Boolean; override;
    procedure SetBounds (ALeft, ATop, AWidth, AHeight: Integer); override;

    procedure BeginUpdate;
    procedure EndUpdate;
    procedure AddDockForm (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF});
    procedure RemoveDockForm (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF});

    procedure ReadPositionData (const ReadIntProc: TPositionReadIntProc;
      const ReadStringProc: TPositionReadStringProc; const ExtraData: Pointer); dynamic;
    procedure DoneReadingPositionData (const ReadIntProc: TPositionReadIntProc;
      const ReadStringProc: TPositionReadStringProc; const ExtraData: Pointer); dynamic;
    procedure WritePositionData (const WriteIntProc: TPositionWriteIntProc;
      const WriteStringProc: TPositionWriteStringProc; const ExtraData: Pointer); dynamic;
  published
    property Height stored False;
    property Width stored False;
  end;

procedure RegLoadToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF}; const BaseRegistryKey: String);
procedure RegLoadToolbarPositionsEx (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF}; const RootKey: HKEY; const BaseRegistryKey: String);
procedure RegSaveToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF}; const BaseRegistryKey: String);
procedure RegSaveToolbarPositionsEx (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF}; const RootKey: HKEY; const BaseRegistryKey: String);
procedure IniLoadToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF}; const Filename: String);
procedure IniSaveToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF}; const Filename: String);

procedure CustomLoadToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
  const ReadIntProc: TPositionReadIntProc;
  const ReadStringProc: TPositionReadStringProc; const ExtraData: Pointer);
procedure CustomSaveToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
  const WriteIntProc: TPositionWriteIntProc;
  const WriteStringProc: TPositionWriteStringProc; const ExtraData: Pointer);

function GetDockTypeOf (const Control: TDock97): TDockType;
function GetToolWindowParentForm (const ToolWindow: TCustomToolWindow97):
  {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
function ValidToolWindowParentForm (const ToolWindow: TCustomToolWindow97):
  {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};

procedure GetFloatingNCArea (var TopLeft, BottomRight: TPoint;
  const Resizable: Boolean);
procedure AddFloatingNCAreaToSize (var S: TPoint; const Resizable: Boolean);
procedure GetDockedNCArea (var TopLeft, BottomRight: TPoint;
  const LeftRight: Boolean; const DragHandleStyle: TDragHandleStyle);
procedure AddDockedNCAreaToSize (var S: TPoint; const LeftRight: Boolean;
  const DragHandleStyle: TDragHandleStyle);

implementation

uses
  Registry, IniFiles, SysUtils, Consts,
  TB97Cmn, TB97Cnst;

const
  DockedBorderSize = 2;
  DockedBorderSize2 = DockedBorderSize*2;
  DragHandleSizes: array[TDragHandleStyle] of Integer = (9, 0, 6);

  DefaultBarWidthHeight = 8;

  ForceDockAtTopRow = 0;
  ForceDockAtLeftPos = -8;

  PositionLeftOrRight = [dpLeft, dpRight];

  { Constants for TCustomToolWindow97 registry values/data.
    Don't localize any of these names! }
  rvRev = 'Rev';
  rdCurrentRev = 2;
  rvVisible = 'Visible';
  rvDockedTo = 'DockedTo';
  rdDockedToFloating = '+';
  rvDockRow = 'DockRow';
  rvDockPos = 'DockPos';
  rvFloatLeft = 'FloatLeft';
  rvFloatTop = 'FloatTop';

var
  FloatingToolWindows: TList = nil;


{ Misc. functions }

function GetSmallCaptionHeight: Integer;
{ Returns height of the caption of a small window }
begin
  if NewStyleControls then
    Result := GetSystemMetrics(SM_CYSMCAPTION)
  else
    { Win 3.x doesn't support small captions, so, like Office 97, use the size
      of normal captions minus one }
    Result := GetSystemMetrics(SM_CYCAPTION) - 1;
end;

function GetFloatingBorderSize (const Resizable: Boolean): TPoint;
{ Returns size of a thick border. Note that, depending on the Windows version,
  this may not be the same as the actual window metrics since it draws its
  own border }
const
  XMetrics: array[Boolean] of Integer = (SM_CXDLGFRAME, SM_CXFRAME);
  YMetrics: array[Boolean] of Integer = (SM_CYDLGFRAME, SM_CYFRAME);
begin
  Result.X := GetSystemMetrics(XMetrics[Resizable]);
  Result.Y := GetSystemMetrics(YMetrics[Resizable]);
end;

procedure GetFloatingNCArea (var TopLeft, BottomRight: TPoint;
  const Resizable: Boolean);
begin
  with GetFloatingBorderSize(Resizable) do begin
    TopLeft.X := X;
    TopLeft.Y := GetSmallCaptionHeight + Y;
    BottomRight.X := X;
    BottomRight.Y := Y;
  end;
end;

procedure AddFloatingNCAreaToSize (var S: TPoint; const Resizable: Boolean);
var
  TopLeft, BottomRight: TPoint;
begin
  GetFloatingNCArea (TopLeft, BottomRight, Resizable);
  Inc (S.X, TopLeft.X + BottomRight.X);
  Inc (S.Y, TopLeft.Y + BottomRight.Y);
end;

procedure GetDockedNCArea (var TopLeft, BottomRight: TPoint;
  const LeftRight: Boolean; const DragHandleStyle: TDragHandleStyle);
var
  Z: Integer;
begin
  Z := DockedBorderSize;  { code optimization... }
  TopLeft.X := Z;
  TopLeft.Y := Z;
  BottomRight.X := Z;
  BottomRight.Y := Z;
  if not LeftRight then
    Inc (TopLeft.X, DragHandleSizes[DragHandleStyle])
  else
    Inc (TopLeft.Y, DragHandleSizes[DragHandleStyle]);
end;

procedure AddDockedNCAreaToSize (var S: TPoint; const LeftRight: Boolean;
  const DragHandleStyle: TDragHandleStyle);
var
  TopLeft, BottomRight: TPoint;
begin
  GetDockedNCArea (TopLeft, BottomRight, LeftRight, DragHandleStyle);
  Inc (S.X, TopLeft.X + BottomRight.X);
  Inc (S.Y, TopLeft.Y + BottomRight.Y);
end;

function GetPrimaryDesktopArea: TRect;
{ Returns a rectangle containing the "work area" of the primary display
  monitor, which is the area not taken up by the taskbar. }
begin
  if not SystemParametersInfo(SPI_GETWORKAREA, 0, @Result, 0) then
    { SPI_GETWORKAREA is only supported by Win95 and NT 4.0. So it fails under
      Win 3.x. In that case, return a rectangle of the entire screen }
    Result := Rect(0, 0, GetSystemMetrics(SM_CXSCREEN),
      GetSystemMetrics(SM_CYSCREEN));
end;

function UsingMultipleMonitors: Boolean;
{ Returns True if the system has more than one display monitor configured. }
var
  NumMonitors: Integer;
begin
  NumMonitors := GetSystemMetrics(80 {SM_CMONITORS});
  Result := (NumMonitors <> 0) and (NumMonitors <> 1);
  { ^ NumMonitors will be zero if not running Win98, NT 5, or later }
end;

type
  HMONITOR = type Integer;
  PMonitorInfoA = ^TMonitorInfoA;
  TMonitorInfoA = record
    cbSize: DWORD;
    rcMonitor: TRect;
    rcWork: TRect;
    dwFlags: DWORD;
  end;
const
  MONITOR_DEFAULTTONEAREST = $2;
type
  TMultiMonApis = record
    funcMonitorFromRect: function(lprcScreenCoords: PRect; dwFlags: DWORD): HMONITOR; stdcall;
    funcMonitorFromPoint: function(ptScreenCoords: TPoint; dwFlags: DWORD): HMONITOR; stdcall;
    funcGetMonitorInfoA: function(hMonitor: HMONITOR; lpMonitorInfo: PMonitorInfoA): BOOL; stdcall;
  end;

{ Under D4 I could be using the MultiMon unit for the multiple monitor
  function imports, but its stubs for MonitorFromRect and MonitorFromPoint
  are seriously bugged... So I chose to avoid the MultiMon unit entirely. }

function InitMultiMonApis (var Apis: TMultiMonApis): Boolean;
var
  User32Handle: THandle;
begin
  User32Handle := GetModuleHandle(user32);
  Apis.funcMonitorFromRect := GetProcAddress(User32Handle, 'MonitorFromRect');
  Apis.funcMonitorFromPoint := GetProcAddress(User32Handle, 'MonitorFromPoint');
  Apis.funcGetMonitorInfoA := GetProcAddress(User32Handle, 'GetMonitorInfoA');
  Result := Assigned(Apis.funcMonitorFromRect) and
    Assigned(Apis.funcMonitorFromPoint) and Assigned(Apis.funcGetMonitorInfoA);
end;

function GetDesktopAreaOfMonitorContainingRect (const R: TRect): TRect;
{ Returns the work area of the monitor which the rectangle R intersects with
  the most, or the monitor nearest R if no monitors intersect. }
var
  Apis: TMultiMonApis;
  M: HMONITOR;
  MonitorInfo: TMonitorInfoA;
begin
  if UsingMultipleMonitors and InitMultiMonApis(Apis) then begin
    M := Apis.funcMonitorFromRect(@R, MONITOR_DEFAULTTONEAREST);
    MonitorInfo.cbSize := SizeOf(MonitorInfo);
    if Apis.funcGetMonitorInfoA(M, @MonitorInfo) then begin
      Result := MonitorInfo.rcWork;
      Exit;
    end;
  end;
  Result := GetPrimaryDesktopArea;
end;

function GetDesktopAreaOfMonitorContainingPoint (const P: TPoint): TRect;
{ Returns the work area of the monitor containing the point P, or the monitor
  nearest P if P isn't in any monitor's work area. }
var
  Apis: TMultiMonApis;
  M: HMONITOR;
  MonitorInfo: TMonitorInfoA;
begin
  if UsingMultipleMonitors and InitMultiMonApis(Apis) then begin
    M := Apis.funcMonitorFromPoint(P, MONITOR_DEFAULTTONEAREST);
    MonitorInfo.cbSize := SizeOf(MonitorInfo);
    if Apis.funcGetMonitorInfoA(M, @MonitorInfo) then begin
      Result := MonitorInfo.rcWork;
      Exit;
    end;
  end;
  Result := GetPrimaryDesktopArea;
end;

function GetMDIParent (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF}):
  {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
{ Returns the parent of the specified MDI child form. But, if Form isn't a
  MDI child, it simply returns Form. }
var
  I, J: Integer;
begin
  Result := Form;
  if Form = nil then Exit;
  if {$IFDEF TB97D3} (Form is TForm) and {$ENDIF}
     (TForm(Form).FormStyle = fsMDIChild) then
    for I := 0 to Screen.FormCount-1 do
      with Screen.Forms[I] do begin
        if FormStyle <> fsMDIForm then Continue;
        for J := 0 to MDIChildCount-1 do
          if MDIChildren[J] = Form then begin
            Result := Screen.Forms[I];
            Exit;
          end;
      end;
end;

function GetDockTypeOf (const Control: TDock97): TDockType;
begin
  if Control = nil then
    Result := dtNotDocked
  else begin
    if not(Control.Position in PositionLeftOrRight) then
      Result := dtTopBottom
    else
      Result := dtLeftRight;
  end;
end;

function GetToolWindowParentForm (const ToolWindow: TCustomToolWindow97):
  {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
var
  Ctl: TWinControl;
begin
  Result := nil;
  Ctl := ToolWindow;
  while Assigned(Ctl.Parent) do begin
    if Ctl.Parent is {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF} then
      Result := {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF}(Ctl.Parent);
    Ctl := Ctl.Parent;
  end;
  { ^ for compatibility with ActiveX controls, that code is used instead of
    GetParentForm because it returns nil unless the form is the *topmost*
    parent }
  if Result is TFloatingWindowParent then
    Result := TFloatingWindowParent(Result).ParentForm;
end;

function ValidToolWindowParentForm (const ToolWindow: TCustomToolWindow97):
  {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
begin
  Result := GetToolWindowParentForm(ToolWindow);
  if Result = nil then
    raise EInvalidOperation.{$IFDEF TB97D3}CreateFmt{$ELSE}CreateResFmt{$ENDIF}
      (SParentRequired, [ToolWindow.Name]);
end;

procedure ToolbarHookProc (Code: THookProcCode; Wnd: HWND; WParam: WPARAM; LParam: LPARAM);
var
  I: Integer;
  ToolWindow: TCustomToolWindow97;
  Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
begin
  case Code of
    hpSendActivateApp: begin
        if Assigned(FloatingToolWindows) then
          for I := 0 to FloatingToolWindows.Count-1 do
            with TCustomToolWindow97(FloatingToolWindows.List[I]) do
              { Hide or restore toolbars when application is deactivated or activated.
                UpdateVisibility also sets caption state active/inactive }
              UpdateVisibility;
      end;
    hpSendWindowPosChanged: begin
        if Assigned(FloatingToolWindows) then
          for I := 0 to FloatingToolWindows.Count-1 do begin
            ToolWindow := TCustomToolWindow97(FloatingToolWindows.List[I]);
            with ToolWindow do begin
              if HandleAllocated then begin
                with PWindowPos(LParam)^ do
                  { Call UpdateVisibility if parent form's visibility has
                    changed, or if it has been minimized or restored }
                  if ((flags and (SWP_SHOWWINDOW or SWP_HIDEWINDOW) <> 0) or
                      (flags and SWP_FRAMECHANGED <> 0)) then begin
                    Form := GetToolWindowParentForm(ToolWindow);
                    if Assigned(Form) and Form.HandleAllocated and ((Wnd = Form.Handle) or IsChild(Wnd, Form.Handle)) then
                      UpdateVisibility;
                  end;
              end;
            end;
          end;
      end;
    hpPreDestroy: begin
        if Assigned(FloatingToolWindows) then
          for I := 0 to FloatingToolWindows.Count-1 do begin
            with TCustomToolWindow97(FloatingToolWindows.List[I]) do
              { It must remove the form window's ownership of the tool window
                *before* the form gets destroyed, otherwise Windows will destroy
                the tool window's handle. }
              if HandleAllocated and (HWND(GetWindowLong(Handle, GWL_HWNDPARENT)) = Wnd) then
                SetWindowLong (Handle, GWL_HWNDPARENT, Parent.Handle);
                { ^ Restore GWL_HWNDPARENT back to the TFloatingWindowParent }
          end;
      end;
  end;
end;

procedure ProcessPaintMessages;
{ Dispatches all pending WM_PAINT messages. In effect, this is like an
  'UpdateWindow' on all visible windows }
var
  Msg: TMsg;
begin
  while PeekMessage(Msg, 0, WM_PAINT, WM_PAINT, PM_NOREMOVE) do begin
    case Integer(GetMessage(Msg, 0, WM_PAINT, WM_PAINT)) of
      -1: Break; { if GetMessage failed }
      0: begin
           { Repost WM_QUIT messages }
           PostQuitMessage (Msg.WParam);
           Break;
         end;
    end;
    DispatchMessage (Msg);
  end;
end;

type
  PFindWindowData = ^TFindWindowData;
  TFindWindowData = record
    TaskActiveWindow, TaskFirstWindow, TaskFirstTopMost: HWND;
  end;

function DoFindWindow (Wnd: HWND; Param: Longint): Bool; stdcall;
begin
  with PFindWindowData(Param)^ do
    if (Wnd <> TaskActiveWindow) and (Wnd <> Application.Handle) and
       IsWindowVisible(Wnd) and IsWindowEnabled(Wnd) then begin
      if GetWindowLong(Wnd, GWL_EXSTYLE) and WS_EX_TOPMOST = 0 then begin
        if TaskFirstWindow = 0 then TaskFirstWindow := Wnd;
      end
      else begin
        if TaskFirstTopMost = 0 then TaskFirstTopMost := Wnd;
      end;
    end;
  Result := True;
end;

function FindTopLevelWindow (ActiveWindow: HWND): HWND;
var
  FindData: TFindWindowData;
begin
  with FindData do begin
    TaskActiveWindow := ActiveWindow;
    TaskFirstWindow := 0;
    TaskFirstTopMost := 0;
    EnumThreadWindows (GetCurrentThreadID, @DoFindWindow, Longint(@FindData));
    if TaskFirstWindow <> 0 then
      Result := TaskFirstWindow
    else
      Result := TaskFirstTopMost;
  end;
end;

procedure RecalcNCArea (const Ctl: TWinControl);
begin
  if Ctl.HandleAllocated then
    SetWindowPos (Ctl.Handle, 0, 0, 0, 0, 0, SWP_FRAMECHANGED or
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE or SWP_NOZORDER);
end;


{ TDock97 - internal }

constructor TDock97.Create (AOwner: TComponent);
begin
  inherited;

  ControlStyle := ControlStyle +  [csAcceptsControls, csNoStdEvents] -
    [csClickEvents, csCaptureMouse, csOpaque];
  FAllowDrag := True;
  FBkgOnToolbars := True;
  DockList := TList.Create;
  RowSizes := TList.Create;
  FBkg := TBitmap.Create;
  FBkg.OnChange := BackgroundChanged;
  Color := clBtnFace;
  Position := dpTop;
end;

procedure TDock97.CreateParams (var Params: TCreateParams);
begin
  inherited;
  { Disable complete redraws when size changes. CS_H/VREDRAW cause flicker
    and are not necessary for this control at run time }
  if not(csDesigning in ComponentState) then
    with Params.WindowClass do
      Style := Style and not(CS_HREDRAW or CS_VREDRAW);
end;

destructor TDock97.Destroy;
begin
  FBkgCache.Free;
  FBkg.Free;
  RowSizes.Free;
  DockList.Free;
  inherited;
end;

procedure TDock97.SetParent (AParent: TWinControl);
begin
  if (AParent is TCustomToolWindow97) or (AParent is TDock97) then
    raise EInvalidOperation.Create(STB97DockParentNotAllowed);

  inherited;
end;

procedure TDock97.BeginUpdate;
begin
  Inc (FDisableArrangeToolbars);
end;

procedure TDock97.EndUpdate;
begin
  Dec (FDisableArrangeToolbars);
  if FArrangeToolbarsNeeded and (FDisableArrangeToolbars = 0) then
    ArrangeToolbars;
end;

procedure TDock97.BuildRowInfo;
var
  R, I, Size, HighestSize: Integer;
begin
  RowSizes.Clear;
  for R := 0 to GetHighestRow do begin
    HighestSize := DefaultBarWidthHeight;
    for I := 0 to DockList.Count-1 do begin
      with TCustomToolWindow97(DockList[I]) do begin
        if FDockRow <> R then Continue;
        GetBarSize (Size, GetDockTypeOf(Self));
        if Size > HighestSize then HighestSize := Size;
      end;
    end;
    RowSizes.Add (Pointer(HighestSize));
  end;
end;

function TDock97.GetRowSize (const Row: Integer;
  const DefaultToolbar: TCustomToolWindow97): Integer;
begin
  if Row < RowSizes.Count then
    Result := Longint(RowSizes[Row])
  else begin
    { If it's out of bounds }
    if DefaultToolbar = nil then
      Result := 0
    else
      DefaultToolbar.GetBarSize (Result, GetDockTypeOf(Self));
  end;
end;

function TDock97.GetRowOf (const XY: Integer; var Before: Boolean): Integer;
{ Returns row number of the specified coordinate. Before is set to True if it
  was close to being in between two rows. }
var
  HighestRow, R, CurY, NextY: Integer;
begin
  Result := 0;  Before := False;
  HighestRow := GetHighestRow;
  CurY := 0;
  for R := 0 to HighestRow+1 do begin
    if R <= HighestRow then
      NextY := CurY + GetRowSize(R, nil) + DockedBorderSize2
    else
      NextY := High(NextY);
    if XY <= CurY+5 then begin
      Result := R;
      Before := True;
      Break;
    end;
    if (XY >= CurY+5) and (XY <= NextY-5) then begin
      Result := R;
      Break;
    end;
    CurY := NextY;
  end;
end;

function TDock97.GetDesignModeRowOf (const XY: Integer): Integer;
{ Similar to GetRowOf, but is a little different to accomidate design mode
  better }
var
  HighestRowPlus1, R, CurY, NextY: Integer;
begin
  Result := 0;
  HighestRowPlus1 := GetHighestRow+1;
  CurY := 0;
  for R := 0 to HighestRowPlus1 do begin
    Result := R;
    if R = HighestRowPlus1 then Break;
    NextY := CurY + GetRowSize(R, nil) + DockedBorderSize2;
    if XY < NextY then
      Break;
    CurY := NextY;
  end;
end;

function TDock97.GetHighestRow: Integer;
{ Returns highest used row number, or -1 if no rows are used }
var
  I: Integer;
begin
  Result := -1;
  for I := 0 to DockList.Count-1 do
    with TCustomToolWindow97(DockList[I]) do
      if FDockRow > Result then
        Result := FDockRow;
end;

function TDock97.GetNumberOfToolbarsOnRow (const Row: Integer;
  const NotIncluding: TCustomToolWindow97): Integer;
{ Returns number of toolbars on the specified row. The toolbar specified by
  "NotIncluding" is not included in the count. }
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to DockList.Count-1 do
    if (TCustomToolWindow97(DockList[I]).FDockRow = Row) and
       (DockList[I] <> NotIncluding) then
      Inc (Result);
end;

procedure TDock97.RemoveBlankRows;
{ Deletes any blank row numbers, adjusting the docked toolbars' FDockRow as
  needed }
var
  HighestRow, R, I: Integer;
  RowIsEmpty: Boolean;
begin
  HighestRow := GetHighestRow;
  R := 0;
  while R <= HighestRow do begin
    RowIsEmpty := True;
    for I := 0 to DockList.Count-1 do
      if TCustomToolWindow97(DockList[I]).FDockRow = R then begin
        RowIsEmpty := False;
        Break;
      end;
    if RowIsEmpty then begin
      { Shift all ones higher than R back one }
      for I := 0 to DockList.Count-1 do
        with TCustomToolWindow97(DockList[I]) do
          if FDockRow > R then
            Dec (FDockRow);
      Dec (HighestRow);
    end;
    Inc (R);
  end;
end;

procedure TDock97.InsertRowBefore (const BeforeRow: Integer);
{ Inserts a blank row before BeforeRow, adjusting all the docked toolbars'
  FDockRow as needed }
var
  I: Integer;
begin
  for I := 0 to DockList.Count-1 do
    with TCustomToolWindow97(DockList[I]) do
      if FDockRow >= BeforeRow then
        Inc (FDockRow);
end;

procedure TDock97.ChangeWidthHeight (const IsClientWidthAndHeight: Boolean;
  NewWidth, NewHeight: Integer);
{ Same as setting Width/Height or ClientWidth/ClientHeight directly, but does
  not lose Align position. }
begin
  if IsClientWidthAndHeight then begin
    Inc (NewWidth, Width-ClientWidth);
    Inc (NewHeight, Height-ClientHeight);
  end;
  case Align of
    alTop, alLeft:
      SetBounds (Left, Top, NewWidth, NewHeight);
    alBottom:
      SetBounds (Left, Top-NewHeight+Height, NewWidth, NewHeight);
    alRight:
      SetBounds (Left-NewWidth+Width, Top, NewWidth, NewHeight);
  end;
end;

procedure TDock97.AlignControls (AControl: TControl; var Rect: TRect);
begin
  ArrangeToolbars;
end;

function CompareDockRowPos (const Item1, Item2, ExtraData: Pointer): Integer; far;
begin
  if TCustomToolWindow97(Item1).FDockRow <> TCustomToolWindow97(Item2).FDockRow then
    Result := TCustomToolWindow97(Item1).FDockRow - TCustomToolWindow97(Item2).FDockRow
  else
    Result := TCustomToolWindow97(Item1).FDockPos - TCustomToolWindow97(Item2).FDockPos;
end;

procedure TDock97.ArrangeToolbars;
{ The main procedure to arrange all the toolbars docked to it }
var
  LeftRight: Boolean;
  EmptySize: Integer;
  HighestRow, R, CurDockPos, CurRowPixel, I, J, K: Integer;
  CurRowSize: Integer;
begin
  if (FDisableArrangeToolbars > 0) or (csLoading in ComponentState) then begin
    FArrangeToolbarsNeeded := True;
    Exit;
  end;

  Inc (FDisableArrangeToolbars);
  try
    { Work around VCL alignment bug when docking toolbars taller or wider than
      the client height or width of the form. }
    if not(csDesigning in ComponentState) and HandleAllocated then
      SetWindowPos (Handle, HWND_TOP, 0, 0, 0, 0,
        SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

    LeftRight := Position in PositionLeftOrRight;

    if DockList.Count = 0 then begin
      EmptySize := Ord(FFixAlign);
      if csDesigning in ComponentState then
        EmptySize := 9;
      if not LeftRight then
        ChangeWidthHeight (False, Width, EmptySize)
      else
        ChangeWidthHeight (False, EmptySize, Height);
      Exit;
    end;

    { Ensure list is in correct ordering according to DockRow/DockPos }
    ListSortEx (DockList, CompareDockRowPos, nil);

    { If LimitToOneRow is True, only use the first row }
    if FLimitToOneRow then
      for I := 0 to DockList.Count-1 do
        with TCustomToolWindow97(DockList[I]) do
          FDockRow := 0;
    { Remove any blank rows }
    RemoveBlankRows;

    { Find highest row number }
    HighestRow := GetHighestRow;
    { Arrange, first without actually moving the toolbars onscreen }
    R := 0;
    while R <= HighestRow do begin
      CurDockPos := 0;
      for I := 0 to DockList.Count-1 do begin
        with TCustomToolWindow97(DockList[I]) do begin
          if FDockRow <> R then Continue;
          if FullSize then
            { If FullSize, make sure there aren't any other toolbars on the same
              row. If there are, shift them down a row. }
            for J := 0 to DockList.Count-1 do
              if (J <> I) and (TCustomToolWindow97(DockList[J]).FDockRow = R) then begin
                for K := 0 to DockList.Count-1 do
                  with TCustomToolWindow97(DockList[K]) do
                    if (K <> I) and (FDockRow >= R) then begin
                      Inc (FDockRow);
                      if FDockRow > HighestRow then
                        HighestRow := FDockRow;
                    end;
                Break;
              end;
          if FDockPos <= CurDockPos then
            FDockPos := CurDockPos
          else
            CurDockPos := FDockPos;
          if not LeftRight then
            Inc (CurDockPos, Width)
          else
            Inc (CurDockPos, Height);
        end;
      end;
      Inc (R);
    end;
    { Rebuild the RowInfo, since rows numbers may have shifted }
    BuildRowInfo;
    HighestRow := RowSizes.Count-1;
    { Try to move all the toolbars that are offscreen to a fully visible position }
    for R := 0 to HighestRow do
      for I := 0 to DockList.Count-1 do
        with TCustomToolWindow97(DockList[I]) do begin
          if FDockRow <> R then Continue;
          if FullSize then
            FDockPos := 0
          else
            for J := DockList.Count-1 downto I do
              with TCustomToolWindow97(DockList[J]) do begin
                if FDockRow <> R then Continue;
                if not LeftRight then begin
                  if FDockPos+Width > Self.ClientWidth then begin
                    Dec (TCustomToolWindow97(DockList[I]).FDockPos,
                      ((FDockPos+Width) - Self.ClientWidth));
                    Break;
                  end;
                end
                else begin
                  if FDockPos+Height > Self.ClientHeight then begin
                    Dec (TCustomToolWindow97(DockList[I]).FDockPos,
                      ((FDockPos+Height) - Self.ClientHeight));
                    Break;
                  end;
                end;
              end;
        end;
    { Arrange again, this time actually moving the toolbars }
    CurRowPixel := 0;
    for R := 0 to HighestRow do begin
      CurRowSize := DockedBorderSize2 + Longint(RowSizes[R]);
      CurDockPos := 0;
      for I := 0 to DockList.Count-1 do begin
        with TCustomToolWindow97(DockList[I]) do begin
          if FDockRow <> R then Continue;
          if FDockPos <= CurDockPos then
            FDockPos := CurDockPos
          else
            CurDockPos := FDockPos;
          Inc (FUpdatingBounds);
          try
            if not LeftRight then begin
              J := Width;
              if FullSize then J := Self.ClientWidth;
              SetBounds (CurDockPos, CurRowPixel, J, CurRowSize)
            end
            else begin
              J := Height;
              if FullSize then J := Self.ClientHeight;
              SetBounds (CurRowPixel, CurDockPos, CurRowSize, J);
            end;
          finally
            Dec (FUpdatingBounds);
          end;
          if not LeftRight then
            Inc (CurDockPos, Width)
          else
            Inc (CurDockPos, Height);
        end;
      end;
      Inc (CurRowPixel, CurRowSize);
    end;

    { Set the size of the dock }
    if not LeftRight then
      ChangeWidthHeight (True, ClientWidth, CurRowPixel)
    else
      ChangeWidthHeight (True, CurRowPixel, ClientHeight);
  finally
    Dec (FDisableArrangeToolbars);
    FArrangeToolbarsNeeded := False;
  end;
end;

procedure TDock97.ChangeDockList (const Insert: Boolean;
  const Bar: TCustomToolWindow97; const IsVisible: Boolean);
{ Inserts or removes Bar. It inserts only if IsVisible is True, or is in
  design mode }
var
  Modified: Boolean;
begin
  Modified := False;

  if Insert then begin
    { Delete if already exists }
    if DockList.IndexOf(Bar) <> -1 then
      DockList.Remove (Bar);
    { Only add to dock list if visible }
    if (csDesigning in ComponentState) or IsVisible then begin
      DockList.Add (Bar);
      Modified := True;
    end;
  end
  else begin
    if DockList.IndexOf(Bar) <> -1 then begin
      DockList.Remove (Bar);
      Modified := True;
    end;
  end;

  if Modified then begin
    ArrangeToolbars;
    { This corrects a problem in past versions when toolbar is shown after it
      was initially hidden }
    Bar.ArrangeControls;

    if Assigned(FOnInsertRemoveBar) then
      FOnInsertRemoveBar (Self, Insert, Bar);
  end;
end;

procedure TDock97.Loaded;
begin
  inherited;
  { Rearranging is disabled while the component is loading, so now that it's
    loaded, rearrange it. }
  ArrangeToolbars;
end;

function TDock97.GetPalette: HPALETTE;
begin
  Result := FBkg.Palette;
end;

procedure TDock97.DrawBackground (const DC: HDC;
  const IntersectClippingRect: TRect; const ExcludeClippingRect: PRect;
  const DrawRect: TRect);
var
  UseBmp: TBitmap;
  R2: TRect;
  SaveIndex: Integer;
  DC2: HDC;
begin
  UseBmp := FBkg;
  { When FBkgTransparent is True, it keeps a cached copy of the
    background that has the transparent color already translated. Without the
    cache, redraws can be very slow.
    Note: The cache is cleared in the OnChange event of FBkg }
  if FBkgTransparent then begin
    if FBkgCache = nil then begin
      FBkgCache := TBitmap.Create;
      with FBkgCache do begin
        Palette := CopyPalette(FBkg.Palette);
        Width := FBkg.Width;
        Height := FBkg.Height;
        Canvas.Brush.Color := Self.Color;
        Canvas.BrushCopy (Rect(0, 0, Width, Height), FBkg,
          Rect(0, 0, Width, Height), FBkg.Canvas.Pixels[0, Height-1] or $02000000);
      end;
    end;
    UseBmp := FBkgCache;
  end;

  SaveIndex := SaveDC(DC);
  try
    with IntersectClippingRect do
      IntersectClipRect (DC, Left, Top, Right, Bottom);
    if Assigned(ExcludeClippingRect) then
      with ExcludeClippingRect^ do
        ExcludeClipRect (DC, Left, Top, Right, Bottom);
    if UseBmp.Palette <> 0 then begin
      SelectPalette (DC, UseBmp.Palette, True);
      RealizePalette (DC);
    end;
    R2 := DrawRect;
    while R2.Left < R2.Right do begin
      while R2.Top < R2.Bottom do begin
        { Note: versions of Toolbar97 prior to 1.68 used 'UseBmp.Canvas.Handle'
          instead of DC2 in the BitBlt call. This was changed because there
          seems to be a bug in D2/BCB1's Graphics.pas: if you called
          <dockname>.Background.LoadFromFile(<filename>) twice the background
          would not be shown. }  
        DC2 := CreateCompatibleDC(DC);
        SelectObject (DC2, UseBmp.Handle);
        BitBlt (DC, R2.Left, R2.Top, UseBmp.Width, UseBmp.Height,
          DC2, 0, 0, SRCCOPY);
        DeleteDC (DC2);

        Inc (R2.Top, UseBmp.Height);
      end;
      R2.Top := DrawRect.Top;
      Inc (R2.Left, UseBmp.Width);
    end;
  finally
    { Restores the clipping region and palette back }
    RestoreDC (DC, SaveIndex);
  end;
end;

procedure TDock97.Paint;
var
  R, R2: TRect;
  P1, P2: TPoint;
begin
  inherited;
  with Canvas do begin
    R := ClientRect;

    { Draw dotted border in design mode }
    if csDesigning in ComponentState then begin
      Pen.Style := psDot;
      Pen.Color := clBtnShadow;
      Brush.Style := bsClear;
      Rectangle (R.Left, R.Top, R.Right, R.Bottom);
      Pen.Style := psSolid;
      InflateRect (R, -1, -1);
    end;

    { Draw the Background }
    if UsingBackground then begin
      R2 := ClientRect;
      { Make up for nonclient area }
      P1 := ClientToScreen(Point(0, 0));
      P2 := Parent.ClientToScreen(BoundsRect.TopLeft);
      Dec (R2.Left, Left + (P1.X-P2.X));
      Dec (R2.Top, Top + (P1.Y-P2.Y));
      DrawBackground (Canvas.Handle, R, nil, R2);
    end;
  end;
end;

procedure TDock97.WMMove (var Message: TWMMove);
begin
  inherited;
  if UsingBackground then
    InvalidateBackgrounds;
end;

procedure TDock97.WMSize (var Message: TWMSize);
begin
  inherited;
  ArrangeToolbars;
  if not(csLoading in ComponentState) and Assigned(FOnResize) then
    FOnResize (Self);
end;

procedure TDock97.WMNCCalcSize (var Message: TWMNCCalcSize);
begin
  inherited;
  with Message.CalcSize_Params^.rgrc[0] do begin
    if blTop in BoundLines then Inc (Top);
    if blBottom in BoundLines then Dec (Bottom);
    if blLeft in BoundLines then Inc (Left);
    if blRight in BoundLines then Dec (Right);
  end;
end;

procedure TDock97.WMNCPaint (var Message: TMessage);
var
  R, R2: TRect;
  DC: HDC;
  NewClipRgn: HRGN;
  HighlightPen, ShadowPen, SavePen: HPEN;
begin
  { Don't draw border when nothing is docked }
  if (DockList.Count = 0) and not(csDesigning in ComponentState) then
    Exit;

  { This works around WM_NCPAINT problem described at top of source code }
  {no!  R := Rect(0, 0, Width, Height);}
  GetWindowRect (Handle, R);  OffsetRect (R, -R.Left, -R.Top);

  DC := GetWindowDC(Handle);
  try
    { Use update region }
    if (Message.WParam <> 0) and (Message.WParam <> 1) then begin
      GetWindowRect (Handle, R2);
      if SelectClipRgn(DC, HRGN(Message.WParam)) = ERROR then begin
        NewClipRgn := CreateRectRgnIndirect(R2);
        SelectClipRgn (DC, NewClipRgn);
        DeleteObject (NewClipRgn);
      end;
      OffsetClipRgn (DC, -R2.Left, -R2.Top);
    end;

    { Draw BoundLines }
    HighlightPen := CreatePen(PS_SOLID, 1, GetSysColor(COLOR_BTNHIGHLIGHT));
    ShadowPen := CreatePen(PS_SOLID, 1, GetSysColor(COLOR_BTNSHADOW));
    if blTop in BoundLines then begin
      SavePen := SelectObject(DC, ShadowPen);
      MoveToEx (DC, R.Left, R.Top, nil);  LineTo (DC, R.Right, R.Top);
      SelectObject (DC, SavePen);
    end;
    if blLeft in BoundLines then begin
      SavePen := SelectObject(DC, ShadowPen);
      MoveToEx (DC, R.Left, R.Top, nil);  LineTo (DC, R.Left, R.Bottom);
      SelectObject (DC, SavePen);
    end;
    if blBottom in BoundLines then begin
      SavePen := SelectObject(DC, HighlightPen);
      MoveToEx (DC, R.Left, R.Bottom-1, nil);  LineTo (DC, R.Right, R.Bottom-1);
      SelectObject (DC, SavePen);
    end;
    if blRight in BoundLines then begin
      SavePen := SelectObject(DC, HighlightPen);
      MoveToEx (DC, R.Right-1, R.Top, nil);  LineTo (DC, R.Right-1, R.Bottom);
      SelectObject (DC, SavePen);
    end;
    DeleteObject (ShadowPen);
    DeleteObject (HighlightPen);
  finally
    ReleaseDC (Handle, DC);
  end;
end;

procedure TDock97.CMColorChanged (var Message: TMessage);
begin
  if UsingBackground then
    { Erase the cache }
    BackgroundChanged (FBkg);
  inherited;
end;

procedure TDock97.CMSysColorChange (var Message: TMessage);
begin
  inherited;
  if UsingBackground then
    { Erase the cache }
    BackgroundChanged (FBkg);
end;

{ TDock97 - property access methods }

procedure TDock97.SetAllowDrag (Value: Boolean);
var
  I: Integer;
begin
  if FAllowDrag <> Value then begin
    FAllowDrag := Value;
    for I := 0 to ControlCount-1 do
      if Controls[I] is TCustomToolWindow97 then
        RecalcNCArea (TCustomToolWindow97(Controls[I]));
  end;
end;

procedure TDock97.SetBackground (Value: TBitmap);
begin
  FBkg.Assign (Value);
end;

function TDock97.UsingBackground: Boolean;
begin
  Result := (FBkg.Width <> 0) and (FBkg.Height <> 0);
end;

procedure TDock97.InvalidateBackgrounds;
{ Called after background is changed }
var
  I: Integer;
begin
  Invalidate;
  { Synchronize child toolbars also }
  for I := 0 to DockList.Count-1 do
    with TCustomToolWindow97(DockList[I]) do begin
      InvalidateDockedNCArea;
      Invalidate;
    end;
end;

procedure TDock97.BackgroundChanged (Sender: TObject);
begin
  { Erase the cache }
  FBkgCache.Free;
  FBkgCache := nil;
  InvalidateBackgrounds;
end;

procedure TDock97.SetBackgroundOnToolbars (Value: Boolean);
begin
  if FBkgOnToolbars <> Value then begin
    FBkgOnToolbars := Value;
    InvalidateBackgrounds;
  end;
end;

procedure TDock97.SetBackgroundTransparent (Value: Boolean);
begin
  if FBkgTransparent <> Value then begin
    FBkgTransparent := Value;
    if UsingBackground then
      { Erase the cache }
      BackgroundChanged (FBkg);
  end;
end;

procedure TDock97.SetBoundLines (Value: TDockBoundLines);
begin
  if FBoundLines <> Value then begin
    FBoundLines := Value;
    RecalcNCArea (Self);
  end;
end;

procedure TDock97.SetFixAlign (Value: Boolean);
begin
  if FFixAlign <> Value then begin
    FFixAlign := Value;
    ArrangeToolbars;
  end;
end;

procedure TDock97.SetPosition (Value: TDockPosition);
begin
  if ControlCount <> 0 then
    raise EInvalidOperation.Create(STB97DockCannotChangePosition);
  FPosition := Value;
  case Position of
    dpTop: Align := alTop;
    dpBottom: Align := alBottom;
    dpLeft: Align := alLeft;
    dpRight: Align := alRight;
  end;
end;

function TDock97.GetToolbarCount: Integer;
begin
  Result := DockList.Count;
end;

function TDock97.GetToolbars (Index: Integer): TCustomToolWindow97;
begin
  Result := TCustomToolWindow97(DockList[Index]);
end;


{ TFloatingWindowParent - Internal }

constructor TFloatingWindowParent.Create (AOwner: TComponent);
begin
  { Don't use TForm's Create since it attempts to load a form resource, which
    TFloatingWindowParent doesn't have. }
  CreateNew (AOwner {$IFDEF VER93} , 0 {$ENDIF});
end;

procedure TFloatingWindowParent.CreateParams (var Params: TCreateParams);
begin
  inherited;
  { The WS_EX_TOOLWINDOW style is needed to prevent the form from having
    a taskbar button when Toolbar97 is used in a DLL or OCX. }
  Params.ExStyle := Params.ExStyle or WS_EX_TOOLWINDOW;
end;

procedure TFloatingWindowParent.CMShowingChanged (var Message: TMessage);
const
  ShowFlags: array[Boolean] of UINT = (
    SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE or SWP_HIDEWINDOW,
    SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE or SWP_SHOWWINDOW);
begin
  { Must override TCustomForm/TForm's CM_SHOWINGCHANGED handler so that the
    form doesn't get activated when Visible is set to True. }
  SetWindowPos (WindowHandle, 0, 0, 0, 0, 0, ShowFlags[Showing and FShouldShow]);
end;

procedure TFloatingWindowParent.CMDialogKey (var Message: TCMDialogKey);
begin
  { If Escape if pressed on a floating toolbar, return focus to the form }
  if (Message.CharCode = VK_ESCAPE) and (KeyDataToShiftState(Message.KeyData) = []) and
     Assigned(ParentForm) then begin
    ParentForm.SetFocus;
    Message.Result := 1;
  end
  else
    inherited;
end;


{ Global procedures }

procedure CustomLoadToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
  const ReadIntProc: TPositionReadIntProc;
  const ReadStringProc: TPositionReadStringProc; const ExtraData: Pointer);

  function FindDock (AName: String): TDock97;
  var
    I: Integer;
  begin
    Result := nil;
    for I := 0 to Form.ComponentCount-1 do
      if (Form.Components[I] is TDock97) and (Form.Components[I].Name = AName) then begin
        Result := TDock97(Form.Components[I]);
        Break;
      end;
  end;
  procedure ReadValues (const Toolbar: TCustomToolWindow97; const NewDock: TDock97);
  var
    Pos: TPoint;
  begin
    with Toolbar do begin
      DockRow := ReadIntProc(Name, rvDockRow, DockRow, ExtraData);
      DockPos := ReadIntProc(Name, rvDockPos, DockPos, ExtraData);
      Pos.X := ReadIntProc(Name, rvFloatLeft, 0, ExtraData);
      Pos.Y := ReadIntProc(Name, rvFloatTop, 0, ExtraData);
      ReadPositionData (ReadIntProc, ReadStringProc, ExtraData);
      if Assigned(NewDock) then
        Parent := NewDock
      else begin
        Parent := Form;
        SetBounds (Pos.X, Pos.Y, Width, Height);
      end;
      ArrangeControls;
      DoneReadingPositionData (ReadIntProc, ReadStringProc, ExtraData);
    end;
  end;
var
  DocksDisabled: TList;
  I: Integer;
  ToolWindow: TComponent;
  ADock: TDock97;
  DockedToName: String;
begin
  DocksDisabled := TList.Create;
  try
    with Form do
      for I := 0 to ComponentCount-1 do
        if Components[I] is TDock97 then begin
          TDock97(Components[I]).BeginUpdate;
          DocksDisabled.Add (Components[I]);
        end;

    for I := 0 to Form.ComponentCount-1 do begin
      ToolWindow := Form.Components[I];
      if ToolWindow is TCustomToolWindow97 then
        with TCustomToolWindow97(ToolWindow) do begin
          if Name = '' then
            raise Exception.Create (STB97ToolWinNameNotSet);
          if ReadIntProc(Name, rvRev, 0, ExtraData) = rdCurrentRev then begin
            Visible := ReadIntProc(Name, rvVisible, Ord(Visible), ExtraData) <> 0;
            DockedToName := ReadStringProc(Name, rvDockedTo, '', ExtraData);
            if DockedToName <> '' then begin
              if DockedToName <> rdDockedToFloating then begin
                ADock := FindDock(DockedToName);
                if (ADock <> nil) and (ADock.FAllowDrag) then
                  ReadValues (TCustomToolWindow97(ToolWindow), ADock);
              end
              else begin
                ReadValues (TCustomToolWindow97(ToolWindow), nil);
                MoveOnScreen (True);
              end;
            end;
          end;
        end;
    end;
  finally
    for I := DocksDisabled.Count-1 downto 0 do
      TDock97(DocksDisabled[I]).EndUpdate;
    DocksDisabled.Free;
  end;
end;

procedure CustomSaveToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
  const WriteIntProc: TPositionWriteIntProc;
  const WriteStringProc: TPositionWriteStringProc; const ExtraData: Pointer);
var
  I: Integer;
  N: String;
begin
  for I := 0 to Form.ComponentCount-1 do
    if Form.Components[I] is TCustomToolWindow97 then
      with TCustomToolWindow97(Form.Components[I]) do begin
        if Name = '' then
          raise Exception.Create (STB97ToolwinNameNotSet);
        if not Docked then
          N := rdDockedToFloating
        else begin
          if DockedTo.FAllowDrag then begin
            N := DockedTo.Name;
            if N = '' then
              raise Exception.Create (STB97ToolwinDockedToNameNotSet);
          end
          else
            N := '';
        end;
        WriteIntProc (Name, rvRev, rdCurrentRev, ExtraData);
        WriteIntProc (Name, rvVisible, Ord(Visible), ExtraData);
        WriteStringProc (Name, rvDockedTo, N, ExtraData);
        WriteIntProc (Name, rvDockRow, FDockRow, ExtraData);
        WriteIntProc (Name, rvDockPos, FDockPos, ExtraData);
        WriteIntProc (Name, rvFloatLeft, FFloatingTopLeft.X, ExtraData);
        WriteIntProc (Name, rvFloatTop, FFloatingTopLeft.Y, ExtraData);
        WritePositionData (WriteIntProc, WriteStringProc, ExtraData);
      end;
end;

function IniReadInt (const ToolbarName, Value: String; const Default: Longint;
  const ExtraData: Pointer): Longint; far;
begin
  Result := TIniFile(ExtraData).ReadInteger(ToolbarName, Value, Default);
end;
function IniReadString (const ToolbarName, Value, Default: String;
  const ExtraData: Pointer): String; far;
begin
  Result := TIniFile(ExtraData).ReadString(ToolbarName, Value, Default);
end;
procedure IniWriteInt (const ToolbarName, Value: String; const Data: Longint;
  const ExtraData: Pointer); far;
begin
  TIniFile(ExtraData).WriteInteger (ToolbarName, Value, Data);
end;
procedure IniWriteString (const ToolbarName, Value, Data: String;
  const ExtraData: Pointer); far;
begin
  TIniFile(ExtraData).WriteString (ToolbarName, Value, Data);
end;

procedure IniLoadToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
  const Filename: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(Filename);
  try
    CustomLoadToolbarPositions (Form, IniReadInt, IniReadString, Ini);
  finally
    Ini.Free;
  end;
end;

procedure IniSaveToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
  const Filename: String);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(Filename);
  try
    CustomSaveToolbarPositions (Form, IniWriteInt, IniWriteString, Ini);
  finally
    Ini.Free;
  end;
end;

function RegReadInt (const ToolbarName, Value: String; const Default: Longint;
  const ExtraData: Pointer): Longint; far;
begin
  Result := TRegIniFile(ExtraData).ReadInteger(ToolbarName, Value, Default);
end;
function RegReadString (const ToolbarName, Value, Default: String;
  const ExtraData: Pointer): String; far;
begin
  Result := TRegIniFile(ExtraData).ReadString(ToolbarName, Value, Default);
end;
procedure RegWriteInt (const ToolbarName, Value: String; const Data: Longint;
  const ExtraData: Pointer); far;
begin
  TRegIniFile(ExtraData).WriteInteger (ToolbarName, Value, Data);
end;
procedure RegWriteString (const ToolbarName, Value, Data: String;
  const ExtraData: Pointer); far;
begin
  TRegIniFile(ExtraData).WriteString (ToolbarName, Value, Data);
end;

procedure RegLoadToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
  const BaseRegistryKey: String);
begin
  RegLoadToolbarPositionsEx (Form, HKEY_CURRENT_USER, BaseRegistryKey);
end;

procedure RegLoadToolbarPositionsEx (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
  const RootKey: HKEY; const BaseRegistryKey: String);
var
  Reg: TRegIniFile;
begin
  Reg := TRegIniFile.Create(BaseRegistryKey);
  try
    Reg.RootKey := RootKey;
    CustomLoadToolbarPositions (Form, RegReadInt, RegReadString, Reg);
  finally
    Reg.Free;
  end;
end;

procedure RegSaveToolbarPositions (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
  const BaseRegistryKey: String);
begin
  RegSaveToolbarPositionsEx (Form, HKEY_CURRENT_USER, BaseRegistryKey);
end;

procedure RegSaveToolbarPositionsEx (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
  const RootKey: HKEY; const BaseRegistryKey: String);
var
  Reg: TRegIniFile;
begin
  Reg := TRegIniFile.Create(BaseRegistryKey);
  try
    Reg.RootKey := RootKey;
    CustomSaveToolbarPositions (Form, RegWriteInt, RegWriteString, Reg);
  finally
    Reg.Free;
  end;
end;


{ TCustomToolWindow97 - Internal }

constructor TCustomToolWindow97.Create (AOwner: TComponent);
begin
  inherited;

  ControlStyle := ControlStyle +
    [csAcceptsControls, csClickEvents, csDoubleClicks, csSetCaption] -
    [csCaptureMouse{capturing is done manually}, csOpaque];

  InstallHookProc (ToolbarHookProc,
    [hpSendActivateApp, hpSendWindowPosChanged, hpPreDestroy],
    csDesigning in ComponentState);

  GetParams (FParams);

  FActivateParent := True;
  FBorderStyle := bsSingle;
  FDockableTo := [dpTop, dpBottom, dpLeft, dpRight];
  FCloseButton := True;
  FResizable := True;
  FHideWhenInactive := True;
  FDockPos := -1;
  Color := clBtnFace;
end;

destructor TCustomToolWindow97.Destroy;
begin
  inherited;
  FDockForms.Free;  { must be done after 'inherited' because Notification accesses FDockForms }
  FFloatParent.Free;
  UninstallHookProc (ToolbarHookProc);
end;

function TCustomToolWindow97.HasParent: Boolean;
begin
  if Parent is TFloatingWindowParent then
    Result := False
  else
    Result := inherited HasParent;
end;

function TCustomToolWindow97.GetParentComponent: TComponent;
begin
  if Parent is TFloatingWindowParent then
    Result := nil
  else
    Result := inherited GetParentComponent;
end;

procedure TCustomToolWindow97.SetInactiveCaption (Value: Boolean);
begin
  if csDesigning in ComponentState then
    Value := False;
  if FInactiveCaption <> Value then begin
    FInactiveCaption := Value;
    DrawFloatingNCArea (0, False, True, False);
  end;
end;

procedure TCustomToolWindow97.Moved;
begin
  if not(csLoading in ComponentState) and Assigned(FOnMove) and (FDisableOnMove <= 0) then
    FOnMove (Self);
end;

procedure TCustomToolWindow97.WMMove (var Message: TWMMove);
begin
  inherited;
  FMoved := True;
  if Docked and DockedTo.UsingBackground then begin
    { Needs to redraw so that background is lined up with the dock at the
      new position }
    InvalidateDockedNCArea;
    { To minimize flicker, InvalidateRect is called with the Erase parameter
      set to False instead of calling the Invalidate method }
    if HandleAllocated then
      InvalidateRect (Handle, nil, False);
  end;
  Moved;
end;

procedure TCustomToolWindow97.WMSize (var Message: TWMSize);
begin
  inherited;
  if not(csLoading in ComponentState) and Assigned(FOnResize) then
    FOnResize (Self);
end;

procedure TCustomToolWindow97.WMGetMinMaxInfo (var Message: TWMGetMinMaxInfo);
begin
  inherited;
  { Because the window uses the WS_THICKFRAME style (but not for the usual
    purpose), it must process the WM_GETMINMAXINFO message to remove the
    minimum and maximum size limits it imposes by default. }
  with Message.MinMaxInfo^ do begin
    with ptMinTrackSize do begin
      X := 1;
      Y := 1;
      { Note to self: Don't put GetMinimumSize code here, since
        ClientWidth/Height values are sometimes invalid during a RecreateWnd }
    end;
    with ptMaxTrackSize do begin
      { Because of the 16-bit (signed) size limitations of Windows 95,
        Smallints must be used instead of Integers or Longints }
      X := High(Smallint);
      Y := High(Smallint);
    end;
  end;
end;

function TCustomToolWindow97.GetShowingState: Boolean;
var
  HideFloatingToolbars: Boolean;
  ParentForm, MDIParentForm: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
begin
  Result := Showing and (FHidden = 0);
  if not Docked and not(csDesigning in ComponentState) then begin
    HideFloatingToolbars := True;
    ParentForm := GetToolWindowParentForm(Self);
    MDIParentForm := GetMDIParent(ParentForm);
    if Assigned(ParentForm) and Assigned(MDIParentForm) then begin
      HideFloatingToolbars := not ParentForm.HandleAllocated or
        not MDIParentForm.HandleAllocated;
      if not HideFloatingToolbars then begin
        HideFloatingToolbars := IsIconic(Application.Handle) or
          not IsWindowVisible(ParentForm.Handle) or IsIconic(ParentForm.Handle);
        if MDIParentForm <> ParentForm then
          HideFloatingToolbars := HideFloatingToolbars or
            not IsWindowVisible(MDIParentForm.Handle) or IsIconic(MDIParentForm.Handle);
      end;
    end;
    Result := Result and not (HideFloatingToolbars or (FHideWhenInactive and not ApplicationIsActive));
  end;
end;

procedure TCustomToolWindow97.UpdateVisibility;
begin
  SetInactiveCaption (not Docked and (not FHideWhenInactive and not ApplicationIsActive));
  if HandleAllocated and (IsWindowVisible(Handle) <> GetShowingState) then
    Perform (CM_SHOWINGCHANGED, 0, 0);
end;

procedure TCustomToolWindow97.CMShowingChanged (var Message: TMessage);
  function GetPrevWnd (W: HWND): HWND;
  var
    Done: Boolean;
    ParentWnd: HWND;
  label 1;
  begin
    Result := W;
    repeat
      Done := True;
      Result := GetWindow(Result, GW_HWNDPREV);
      ParentWnd := Result;
      while ParentWnd <> 0 do begin
        ParentWnd := GetWindowLong(ParentWnd, GWL_HWNDPARENT);
        if ParentWnd = W then begin
          Done := False;
          Break;
        end;
      end;
    until Done;
  end;
const
  ShowFlags: array[Boolean] of UINT = (
    SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE or SWP_HIDEWINDOW,
    SWP_NOSIZE or SWP_NOMOVE or SWP_NOZORDER or SWP_NOACTIVATE or SWP_SHOWWINDOW);
var
  Show: Boolean;
  Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
begin
  { inherited isn't called since TCustomToolWindow97 handles CM_SHOWINGCHANGED
    itself. For reference, the original TWinControl implementation is:
    const
      ShowFlags: array[Boolean] of Word = (
        SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_NOACTIVATE + SWP_HIDEWINDOW,
        SWP_NOSIZE + SWP_NOMOVE + SWP_NOZORDER + SWP_NOACTIVATE + SWP_SHOWWINDOW);
    begin
      SetWindowPos(FHandle, 0, 0, 0, 0, 0, ShowFlags[FShowing]);
    end;
  }
  if HandleAllocated then begin
    Show := GetShowingState;
    if Parent is TFloatingWindowParent then begin
      { If the toolbar is floating, set its "owner window" to the parent form
        so that the toolbar window always stays on top of the form }
      if Show then begin
        Form := GetToolWindowParentForm(Self);
        if Assigned(Form) and Form.HandleAllocated and
           (GetWindowLong(Handle, GWL_HWNDPARENT) <> Integer(Form.Handle)) then begin
          SetWindowLong (Handle, GWL_HWNDPARENT, Form.Handle);
          { Following is necessarily to make it immediately realize the
            GWL_HWNDPARENT change }
          SetWindowPos (Handle, GetPrevWnd(Form.Handle), 0, 0, 0, 0, SWP_NOACTIVATE or
            SWP_NOMOVE or SWP_NOSIZE);
        end;
      end;
      { Show/hide the TFloatingWindowParent. The following lines had to be
        added to fix a problem that was in 1.65d/e. In 1.65d/e, it always
        kept TFloatingWindowParent visible (this change was made to improve
        compatibility with D4's Actions), but this for some odd reason would
        cause a Stack Overflow error if the program's main form was closed
        while a floating toolwindow was focused. (This problem did not occur
        on NT.) }
      TFloatingWindowParent(Parent).FShouldShow := Show;
      Parent.Perform (CM_SHOWINGCHANGED, 0, 0);
    end;
    SetWindowPos (Handle, 0, 0, 0, 0, 0, ShowFlags[Show]);
    if not Show and (GetActiveWindow = Handle) then
      { If the window is hidden but is still active, find and activate a
        different window }
      SetActiveWindow (FindTopLevelWindow(Handle));
  end;
end;

procedure TCustomToolWindow97.CreateParams (var Params: TCreateParams);
const
  ThickFrames: array[Boolean] of DWORD = (0, WS_THICKFRAME);
begin
  inherited;
  if not(Parent is TDock97) then
    with Params do begin
      { Note: WS_THICKFRAME and WS_BORDER styles are included to ensure that
        sizing grips are displayed on child controls with scrollbars. The
        thick frame or border is not drawn by Windows; TCustomToolWindow97
        handles all border drawing by itself. }
      if not(csDesigning in ComponentState) then
        Style := WS_POPUP or WS_BORDER or ThickFrames[FResizable]
      else
        Style := Style or WS_BORDER or ThickFrames[FResizable];
      ExStyle := 0;
    end;
end;

procedure TCustomToolWindow97.Notification (AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if Operation = opRemove then begin
    if AComponent = FDefaultDock then
      FDefaultDock := nil
    else begin
      if Assigned(FDockForms) then begin
        FDockForms.Remove (AComponent);
        if FDockForms.Count = 0 then begin
          FDockForms.Free;
          FDockForms := nil;
        end;
      end;
      if Assigned(FFloatParent) and (AComponent = FFloatParent.FParentForm) then begin
        if Parent = FFloatParent then
          Parent := nil
        else begin
          FFloatParent.Free;
          FFloatParent := nil;
        end;
      end;
    end;
  end;
end;

procedure TCustomToolWindow97.MoveOnScreen (const OnlyIfFullyOffscreen: Boolean);
{ Moves the (floating) toolbar so that it is fully (or at least mostly) in
  view on the screen }
var
  R, S, Test: TRect;
begin
  if not Docked then begin
    R := BoundsRect;
    S := GetDesktopAreaOfMonitorContainingRect(R);

    if OnlyIfFullyOffscreen and IntersectRect(Test, R, S) then
      Exit;

    if R.Right > S.Right then
      OffsetRect (R, S.Right - R.Right, 0);
    if R.Bottom > S.Bottom then
      OffsetRect (R, 0, S.Bottom - R.Bottom);
    if R.Left < S.Left then
      OffsetRect (R, S.Left - R.Left, 0);
    if R.Top < S.Top then
      OffsetRect (R, 0, S.Top - R.Top);
    BoundsRect := R;
  end;
end;

procedure TCustomToolWindow97.ReadPositionData (const ReadIntProc: TPositionReadIntProc;
  const ReadStringProc: TPositionReadStringProc; const ExtraData: Pointer);
begin
end;

procedure TCustomToolWindow97.DoneReadingPositionData (const ReadIntProc: TPositionReadIntProc;
  const ReadStringProc: TPositionReadStringProc; const ExtraData: Pointer);
begin
end;

procedure TCustomToolWindow97.WritePositionData (const WriteIntProc: TPositionWriteIntProc;
  const WriteStringProc: TPositionWriteStringProc; const ExtraData: Pointer);
begin
end;

procedure TCustomToolWindow97.InitializeOrdering;
begin
end;

procedure TCustomToolWindow97.GetDockRowSize (var AHeightOrWidth: Integer);
begin
  if Docked then
    with DockedTo do begin
      BuildRowInfo;
      AHeightOrWidth := DockedTo.GetRowSize(FDockRow, Self);
    end
  else
    GetBarSize (AHeightOrWidth, dtNotDocked);
end;

procedure TCustomToolWindow97.SizeChanging (const AWidth, AHeight: Integer);
begin
end;

procedure TCustomToolWindow97.ReadSavedAtRunTime (Reader: TReader);
begin
  FSavedAtRunTime := Reader.ReadBoolean;
end;

procedure TCustomToolWindow97.WriteSavedAtRunTime (Writer: TWriter);
begin
  { WriteSavedAtRunTime only called when not(csDesigning in ComponentState) }
  Writer.WriteBoolean (True);
end;

procedure TCustomToolWindow97.DefineProperties (Filer: TFiler);
begin
  inherited;
  Filer.DefineProperty ('SavedAtRunTime', ReadSavedAtRunTime,
    WriteSavedAtRunTime, not(csDesigning in ComponentState));
end;

procedure TCustomToolWindow97.Loaded;
var
  R: TRect;
begin
  inherited;
  { Adjust coordinates if it was initially floating }
  if not FSavedAtRunTime and not(csDesigning in ComponentState) and
     (Parent is TFloatingWindowParent) then begin
    R := BoundsRect;
    MapWindowPoints (ValidToolWindowParentForm(Self).Handle, 0, R, 2);
    BoundsRect := R;
    MoveOnScreen (False);
  end;
  InitializeOrdering;
  { Arranging of controls is disabled while component was loading, so rearrange
    it now }
  ArrangeControls;
end;

procedure TCustomToolWindow97.BeginUpdate;
begin
  Inc (FDisableArrangeControls);
end;

procedure TCustomToolWindow97.EndUpdate;
begin
  Dec (FDisableArrangeControls);
  if FArrangeNeeded and (FDisableArrangeControls = 0) then
    ArrangeControls;
end;

procedure TCustomToolWindow97.AddDockForm (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF});
begin
  if Form = nil then Exit;
  if FDockForms = nil then FDockForms := TList.Create;
  if FDockForms.IndexOf(Form) = -1 then begin
    FDockForms.Add (Form);
    Form.FreeNotification (Self);
  end;
end;

procedure TCustomToolWindow97.RemoveDockForm (const Form: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF});
begin
  if Assigned(FDockForms) then begin
    FDockForms.Remove (Form);
    if FDockForms.Count = 0 then begin
      FDockForms.Free;
      FDockForms := nil;
    end;
  end;
end;

procedure TCustomToolWindow97.CustomArrangeControls (const PreviousDockType: TDockType;
  const DockingTo: TDock97; const Resize: Boolean);
var
  WH: Integer;
begin
  if (FDisableArrangeControls > 0) or
     { Prevent flicker while loading or destroying }
     (csLoading in ComponentState) or
     { This will not work if it's destroying }
     (csDestroying in ComponentState) or
     (Parent = nil) or
     (Parent.HandleAllocated and (csDestroying in Parent.ComponentState)) then begin
    FArrangeNeeded := True;
    Exit;
  end;

  FArrangeNeeded := False;

  Inc (FDisableArrangeControls);
  try
    with OrderControls(True, PreviousDockType, DockingTo) do
      if Resize then begin
        if Docked then begin
          GetDockRowSize (WH);
          if not(DockedTo.Position in PositionLeftOrRight) then begin
            if WH > Y then Y := WH;
            if FullSize then
              X := DockedTo.ClientWidth - (Width-ClientWidth);
          end
          else begin
            if WH > X then X := WH;
            if FullSize then
              Y := DockedTo.ClientHeight - (Height-ClientHeight);
          end;
        end;
        if (ClientWidth <> X) or (ClientHeight <> Y) then begin
          Inc (FUpdatingBounds);
          try
            SetBounds (Left, Top, (Width-ClientWidth) + X, (Height-ClientHeight) + Y);
          finally
            Dec (FUpdatingBounds);
          end;
        end;
      end;
  finally
    Dec (FDisableArrangeControls);
  end;
end;

procedure TCustomToolWindow97.ArrangeControls;
begin
  CustomArrangeControls (GetDockTypeOf(DockedTo), DockedTo, True);
end;

procedure TCustomToolWindow97.AlignControls (AControl: TControl; var Rect: TRect);
{ VCL calls this whenever any child controls in the toolbar are moved, sized,
  inserted, etc. It doesn't need to make use of the AControl and Rect
  parameters. }
begin
  if Params.CallAlignControls then
    inherited;
  ArrangeControls;
end;

procedure TCustomToolWindow97.SetBounds (ALeft, ATop, AWidth, AHeight: Integer);
begin
  if (FUpdatingBounds = 0) and ((AWidth <> Width) or (AHeight <> Height)) then
    SizeChanging (AWidth, AHeight);
  { This allows you to drag the toolbar around the dock at design time }
  if (csDesigning in ComponentState) and not(csLoading in ComponentState) and
     Docked and (FUpdatingBounds = 0) and ((ALeft <> Left) or (ATop <> Top)) then begin
    if not(DockedTo.Position in PositionLeftOrRight) then begin
      FDockRow := DockedTo.GetDesignModeRowOf(ATop+(Height div 2));
      FDockPos := ALeft;
    end
    else begin
      FDockRow := DockedTo.GetDesignModeRowOf(ALeft+(Width div 2));
      FDockPos := ATop;
    end;
    inherited SetBounds (Left, Top, AWidth, AHeight);  { only pass any size changes }
    DockedTo.ArrangeToolbars;  { let ArrangeToolbars take care of position changes }
  end
  else begin
    inherited;
    if not(csLoading in ComponentState) and not Docked and (FUpdatingBounds = 0) then
      FFloatingTopLeft := BoundsRect.TopLeft;
  end;
end;

procedure TCustomToolWindow97.SetParent (AParent: TWinControl);
  procedure UpdateFloatingToolWindows;
  begin
    if Parent is TFloatingWindowParent then begin
      if FloatingToolWindows = nil then
        FloatingToolWindows := TList.Create;
      if FloatingToolWindows.IndexOf(Self) = -1 then
        FloatingToolWindows.Add (Self);
      SetBounds (FFloatingTopLeft.X, FFloatingTopLeft.Y, Width, Height);
    end
    else 
      if Assigned(FloatingToolWindows) then begin
        FloatingToolWindows.Remove (Self);
        if FloatingToolWindows.Count = 0 then begin
          FloatingToolWindows.Free;
          FloatingToolWindows := nil;
        end;
      end;
  end;
  function ParentToDockedTo (const Ctl: TWinControl): TDock97;
  begin
    if Ctl is TDock97 then
      Result := TDock97(Ctl)
    else
      Result := nil;
  end;
var
  NewFloatParent: TFloatingWindowParent;
  OldDockedTo, NewDockedTo: TDock97;
  OldParent: TWinControl;
begin
  if (AParent <> nil) and not(AParent is TDock97) and
     not(AParent is {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF}) then
    raise EInvalidOperation.Create(STB97ToolwinParentNotAllowed);

  if not(csDesigning in ComponentState) and
     (AParent is {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF}) then begin
    if (FFloatParent = nil) or (FFloatParent.FParentForm <> AParent) then begin
      NewFloatParent := TFloatingWindowParent.Create(nil);
      try
        with NewFloatParent do begin
          TWinControl(FParentForm) := AParent;
          BorderStyle := bsNone;
          SetBounds (0, 0, 0, 0);
          Visible := True;
        end;
      except
        NewFloatParent.Free;
        raise;
      end;
      FFloatParent := NewFloatParent;
    end;
    AParent.FreeNotification (Self);
    AParent := FFloatParent;
  end;

  OldDockedTo := ParentToDockedTo(Parent);
  NewDockedTo := ParentToDockedTo(AParent);

  if AParent = Parent then begin
    { Even though AParent is the same as the current Parent, this code is
      necessary because when the VCL destroys the parent of the tool window,
      it calls TWinControl.Remove to set FParent instead of using SetParent.
      However TControl.Destroy does call SetParent(nil), so it is
      eventually notified of the change before it is destroyed. }
    FDockedTo := ParentToDockedTo(Parent);
    FDocked := FDockedTo <> nil;
    UpdateFloatingToolWindows;
  end
  else begin
    if not(csDestroying in ComponentState) and Assigned(AParent) then begin
      if Assigned(FOnDockChanging) then
        FOnDockChanging (Self);
      if Assigned(FOnDockChangingEx) then
        FOnDockChangingEx (Self, NewDockedTo);
      if Assigned(FOnRecreating) then
        FOnRecreating (Self);
    end;

    { Before changing between docked and floating state (and vice-versa)
      or between docks, increment FHidden and call UpdateVisibility to hide the
      toolbar. This prevents any flashing while it's being moved }
    Inc (FHidden);
    Inc (FDisableOnMove);
    try
      UpdateVisibility;
      if Assigned(OldDockedTo) then
        OldDockedTo.BeginUpdate;
      if Assigned(NewDockedTo) then
        NewDockedTo.BeginUpdate;
      Inc (FUpdatingBounds);
      try
        if Assigned(AParent) then begin
          if not(csDestroying in ComponentState) and
             Assigned(FOnDockChangingHidden) then
            FOnDockChangingHidden (Self, NewDockedTo);
          { Must pre-arrange controls in new dock orientation before changing
            the Parent }
          if FLastDockTypeSet then
            CustomArrangeControls (FLastDockType, NewDockedTo, False);
        end;
        BeginUpdate;
        try
          if Parent is TDock97 then
            TDock97(Parent).ChangeDockList (False, Self, Visible);

          OldParent := Parent;

          { Ensure that the handle is destroyed now so that any messages in the queue
            get flushed. This is neccessary since existing messages may reference
            FDockedTo or FDocked, which is changed below. }
          inherited SetParent (nil);
          { ^ Note to self: SetParent is used instead of DestroyHandle because it does
            additional processing }
          FDockedTo := NewDockedTo;
          FDocked := FDockedTo <> nil;
          try
            inherited;
          except
            { Failure is rare, but just in case, restore FDockedTo and FDocked back. }
            FDockedTo := ParentToDockedTo(Parent);
            FDocked := FDockedTo <> nil;
            raise;
          end;

          if OldParent is TFloatingWindowParent then begin
            if FFloatParent = OldParent then FFloatParent := nil;
            OldParent.Free;
          end;

          if Parent is TDock97 then
            TDock97(Parent).ChangeDockList (True, Self, Visible);

          UpdateFloatingToolWindows;
        finally
          EndUpdate;
        end;
        if Assigned(Parent) then begin
          FLastDockType := GetDockTypeOf(NewDockedTo);
          FLastDockTypeSet := True;
        end;
      finally
        Dec (FUpdatingBounds);
        if Assigned(NewDockedTo) then
          NewDockedTo.EndUpdate;
        if Assigned(OldDockedTo) then
          OldDockedTo.EndUpdate;
      end;
    finally
      Dec (FDisableOnMove);
      Dec (FHidden);
      UpdateVisibility;
      { ^ The above UpdateVisibility call not only updates the tool window's
        visibility after decrementing FHidden, it also sets the
        active/inactive state of the caption. }
    end;
    if Assigned(Parent) then
      Moved;

    if not(csDestroying in ComponentState) and Assigned(AParent) then begin
      if Assigned(FOnRecreated) then
        FOnRecreated (Self);
      if Assigned(FOnDockChanged) then
        FOnDockChanged (Self);
    end;
  end;
end;

function GetCaptionRect (const Control: TCustomToolWindow97;
  const AdjustForBorder, MinusCloseButton: Boolean): TRect;
begin
  Result := Rect(0, 0, Control.ClientWidth, GetSmallCaptionHeight-1);
  if MinusCloseButton then
    Dec (Result.Right, GetSmallCaptionHeight-1);
  if AdjustForBorder then
    with GetFloatingBorderSize(Control.Resizable) do
      OffsetRect (Result, X, Y);
end;

function GetCloseButtonRect (const Control: TCustomToolWindow97;
  const AdjustForBorder: Boolean): TRect;
begin
  Result := Rect(0, 0, Control.ClientWidth, GetSmallCaptionHeight-1);
  if AdjustForBorder then
    with GetFloatingBorderSize(Control.Resizable) do
      OffsetRect (Result, X, Y);
  Result.Left := Result.Right - (GetSmallCaptionHeight-1);
end;

procedure TCustomToolWindow97.WMNCCalcSize (var Message: TWMNCCalcSize);
begin
  { Doesn't call inherited since it overrides the normal NC sizes }
  Message.Result := 0;
  with Message.CalcSize_Params^ do begin
    if not Docked then begin
      with GetFloatingBorderSize(Resizable) do
        InflateRect (rgrc[0], -X, -Y);
      Inc (rgrc[0].Top, GetSmallCaptionHeight);
    end
    else begin
      InflateRect (rgrc[0], -DockedBorderSize, -DockedBorderSize);
      if DockedTo.FAllowDrag then begin
        if not(DockedTo.Position in PositionLeftOrRight) then
          Inc (rgrc[0].Left, DragHandleSizes[FDragHandleStyle])
        else
          Inc (rgrc[0].Top, DragHandleSizes[FDragHandleStyle]);
      end;
    end;
  end;
end;

procedure TCustomToolWindow97.DrawFloatingNCArea (const Clip: HRGN;
  const RedrawBorder, RedrawCaption, RedrawCloseButton: Boolean);
{ Redraws all the non-client area (the border, title bar, and close button) of
  the toolbar when it is floating. }
const
  COLOR_GRADIENTACTIVECAPTION = 27;
  COLOR_GRADIENTINACTIVECAPTION = 28;
  CaptionBkColors: array[Boolean, Boolean] of Integer =
    ((COLOR_ACTIVECAPTION, COLOR_INACTIVECAPTION),
     (COLOR_GRADIENTACTIVECAPTION, COLOR_GRADIENTINACTIVECAPTION));
  CaptionTextColors: array[Boolean] of Integer =
    (COLOR_CAPTIONTEXT, COLOR_INACTIVECAPTIONTEXT);

  function GradientCaptionsEnabled: Boolean;
  const
    SPI_GETGRADIENTCAPTIONS = $1008;  { Win98/NT5 only }
  var
    S: BOOL;
  begin
    Result := False;
    if NewStyleControls and SystemParametersInfo(SPI_GETGRADIENTCAPTIONS, 0, @S, 0) then
      Result := S;
  end;

  procedure Win3DrawCaption (const DC: HDC; const R: TRect);
  { Emulates DrawCaption, which isn't supported in Win 3.x }
  const
    Ellipsis = '...';
  var
    R2: TRect;
    SaveTextColor, SaveBkColor: TColorRef;
    SaveFont: HFONT;
    Cap: String;

    function CaptionTextWidth: Integer;
    var
      Size: TSize;
    begin
      GetTextExtentPoint32 (DC, PChar(Cap), Length(Cap), Size);
      Result := Size.cx;
    end;
  begin
    R2 := R;

    { Fill the rectangle }
    FillRect (DC, R2, GetSysColorBrush(CaptionBkColors[False, FInactiveCaption]));

    Inc (R2.Left);
    Dec (R2.Right);

    SaveFont := SelectObject(DC, CreateFont(-11, 0, 0, 0, FW_NORMAL, 0, 0, 0, 0, 0, 0, 0, 0, 'MS Sans Serif'));

    { Add ellipsis to caption if necessary }
    Cap := Caption;
    if CaptionTextWidth > R2.Right-R2.Left then begin
      Cap := Cap + Ellipsis;
      while (CaptionTextWidth > R2.Right-R2.Left) and (Length(Cap) > 4) do
        Delete (Cap, Length(Cap)-Length(Ellipsis), 1)
    end;

    { Draw the text }
    SaveBkColor := SetBkColor(DC, GetSysColor(CaptionBkColors[False, FInactiveCaption]));
    SaveTextColor := SetTextColor(DC, GetSysColor(CaptionTextColors[FInactiveCaption]));
    DrawText (DC, PChar(Cap), Length(Cap), R2, DT_SINGLELINE or DT_NOPREFIX or DT_VCENTER);
    SetTextColor (DC, SaveTextColor);
    SetBkColor (DC, SaveBkColor);

    DeleteObject (SelectObject(DC, SaveFont));
  end;
const
  CloseButtonState: array[Boolean] of UINT = (0, DFCS_PUSHED);
  ActiveCaptionFlags: array[Boolean] of UINT = (DC_ACTIVE, 0);
  DC_GRADIENT = $20;
  GradientCaptionFlags: array[Boolean] of UINT = (0, DC_GRADIENT);
var
  DC: HDC;
  R: TRect;
  Gradient: Boolean;
  NewClipRgn: HRGN;
  NewDrawCaption: function(p1: HWND; p2: HDC; const p3: TRect; p4: UINT): BOOL; stdcall;
  SavePen: HPEN;
  SaveIndex: Integer;
begin
  if Docked or not HandleAllocated then Exit;

  DC := GetWindowDC(Handle);
  try
    { Use update region }
    if (Clip <> 0) and (Clip <> 1) then begin
      GetWindowRect (Handle, R);
      if SelectClipRgn(DC, Clip) = ERROR then begin
        NewClipRgn := CreateRectRgnIndirect(R);
        SelectClipRgn (DC, NewClipRgn);
        DeleteObject (NewClipRgn);
      end;
      OffsetClipRgn (DC, -R.Left, -R.Top);
    end;

    Gradient := GradientCaptionsEnabled;

    { Border }
    if RedrawBorder then begin
      { This works around WM_NCPAINT problem described at top of source code }
      {no!  R := Rect(0, 0, Width, Height);}
      GetWindowRect (Handle, R);  OffsetRect (R, -R.Left, -R.Top);
      DrawEdge (DC, R, EDGE_RAISED, BF_RECT);
      SaveIndex := SaveDC(DC);
      with R, GetFloatingBorderSize(Resizable) do
        ExcludeClipRect (DC, Left + X, Top + Y + GetSmallCaptionHeight,
          Right - X, Bottom - Y);
      InflateRect (R, -2, -2);
      FillRect (DC, R, GetSysColorBrush(COLOR_BTNFACE));
      RestoreDC (DC, SaveIndex);
    end;

    if RedrawCaption and FCloseButton and RedrawCloseButton then
      SaveIndex := SaveDC(DC)
    else
      SaveIndex := 0;
    try
      if SaveIndex <> 0 then
        with GetCloseButtonRect(Self, True) do
          { Reduces flicker }
          ExcludeClipRect (DC, Left, Top, Right, Bottom);

      { Caption }
      if RedrawCaption then begin
        R := GetCaptionRect(Self, True, FCloseButton);
        if NewStyleControls then begin
          { Use a dynamic import of DrawCaption since it's Win95/NT 4.0 only.
            Also note that Delphi's Win32 help for DrawCaption is totally wrong!
            I got updated info from www.microsoft.com/msdn/sdk/ }
          NewDrawCaption := GetProcAddress(GetModuleHandle(user32), 'DrawCaption');
          NewDrawCaption (Handle, DC, R, DC_TEXT or DC_SMALLCAP or
            ActiveCaptionFlags[FInactiveCaption] or
            GradientCaptionFlags[Gradient]);
        end
        else
          Win3DrawCaption (DC, R);

        { Line below caption }
        R := GetCaptionRect(Self, True, False);
        SavePen := SelectObject(DC, CreatePen(PS_SOLID, 1, GetSysColor(COLOR_BTNFACE)));
        MoveToEx (DC, R.Left, R.Bottom, nil);
        LineTo (DC, R.Right, R.Bottom);
        DeleteObject (SelectObject(DC, SavePen));
      end;
    finally
      if SaveIndex <> 0 then
        RestoreDC (DC, SaveIndex);
    end;

    { Close button }
    if FCloseButton then begin
      if RedrawCloseButton then begin
        R := GetCloseButtonRect(Self, True);
        InflateRect (R, -1, -1);
        DrawFrameControl (DC, R, DFC_CAPTION, DFCS_CAPTIONCLOSE or
          CloseButtonState[FCloseButtonDown]);
      end;
      if RedrawCaption then begin
        { Caption-colored frame around close button }
        R := GetCloseButtonRect(Self, True);
        FrameRect (DC, R, GetSysColorBrush(CaptionBkColors[Gradient, FInactiveCaption]));
      end;
    end;
  finally
    ReleaseDC (Handle, DC);
  end;
end;

procedure TCustomToolWindow97.ValidateDockedNCArea;
var
  Msg: TMsg;
begin
  if HandleAllocated then
    while PeekMessage(Msg, Handle, WM_TB97PaintDockedNCArea,
      WM_TB97PaintDockedNCArea, PM_REMOVE or PM_NOYIELD) do ;
end;

procedure TCustomToolWindow97.InvalidateDockedNCArea;
begin
  ValidateDockedNCArea;
  if HandleAllocated then
    PostMessage (Handle, WM_TB97PaintDockedNCArea, 0, 0);
end;

procedure TCustomToolWindow97.WMTB97PaintDockedNCArea (var Message: TMessage);
begin
  DrawDockedNCArea (0);
end;

procedure TCustomToolWindow97.DrawDockedNCArea (const Clip: HRGN);
{ Redraws all the non-client area of the toolbar when it is docked. }
var
  DC: HDC;
  R: TRect;
  NewClipRgn: HRGN;
  DockType: TDockType;
  X, Y: Integer;
  R2, R3, R4: TRect;
  P1, P2: TPoint;
  Brush: HBRUSH;
  Clr: TColorRef;
  UsingBackground: Boolean;
  procedure DrawRaisedEdge (R: TRect; const FillInterior: Boolean);
  const
    FillMiddle: array[Boolean] of UINT = (0, BF_MIDDLE);
  begin
    DrawEdge (DC, R, BDR_RAISEDINNER, BF_RECT or FillMiddle[FillInterior]);
  end;
begin
  ValidateDockedNCArea;
  if not Docked or not HandleAllocated then Exit;

  DC := GetWindowDC(Handle);
  try
    { Use update region }
    if (Clip <> 0) and (Clip <> 1) then begin
      GetWindowRect (Handle, R);
      if SelectClipRgn(DC, Clip) = ERROR then begin
        NewClipRgn := CreateRectRgnIndirect(R);
        SelectClipRgn (DC, NewClipRgn);
        DeleteObject (NewClipRgn);
      end;
      OffsetClipRgn (DC, -R.Left, -R.Top);
    end;

    { This works around WM_NCPAINT problem described at top of source code }
    {no!  R := Rect(0, 0, Width, Height);}
    GetWindowRect (Handle, R);  OffsetRect (R, -R.Left, -R.Top);

    if not(DockedTo.Position in PositionLeftOrRight) then
      DockType := dtTopBottom
    else
      DockType := dtLeftRight;

    Brush := CreateSolidBrush(ColorToRGB(Color));

    UsingBackground := DockedTo.UsingBackground and DockedTo.FBkgOnToolbars;

    { Border }
    if BorderStyle = bsSingle then
      DrawRaisedEdge (R, False)
    else
      FrameRect (DC, R, Brush);
    R2 := R;
    InflateRect (R2, -1, -1);
    if not UsingBackground then
      FrameRect (DC, R2, Brush);

    { Draw the Background }
    if UsingBackground then begin
      R2 := R;
      P1 := DockedTo.ClientToScreen(Point(0, 0));
      P2 := DockedTo.Parent.ClientToScreen(DockedTo.BoundsRect.TopLeft);
      Dec (R2.Left, Left + DockedTo.Left + (P1.X-P2.X));
      Dec (R2.Top, Top + DockedTo.Top + (P1.Y-P2.Y));
      InflateRect (R, -1, -1);
      GetWindowRect (Handle, R4);
      R3 := ClientRect;
      with ClientToScreen(Point(0, 0)) do
        OffsetRect (R3, X-R4.Left, Y-R4.Top);
      DockedTo.DrawBackground (DC, R, @R3, R2);
    end;

    { The drag handle at the left, or top }
    if DockedTo.FAllowDrag and (FDragHandleStyle <> dhNone) then begin
      Clr := GetSysColor(COLOR_BTNHIGHLIGHT);
      if DockType <> dtLeftRight then begin
        Y := ClientHeight+2;
        if not UsingBackground then
          FillRect (DC, Rect(2, 2, 4, Y), Brush);
        DrawRaisedEdge (Rect(4, 2, 7, Y), True);
        SetPixelV (DC, 4, Y-1, Clr);
        X := 7;
        if FDragHandleStyle = dhDouble then begin
          DrawRaisedEdge (Rect(7, 2, 10, Y), True);
          SetPixelV (DC, 7, Y-1, Clr);
          Inc (X, 3);
        end;
        if not UsingBackground then
          FillRect (DC, Rect(X, 2, X+1, Y), Brush);
      end
      else begin
        X := ClientWidth+2;
        if not UsingBackground then
          FillRect (DC, Rect(2, 2, X, 4), Brush);
        DrawRaisedEdge (Rect(2, 4, X, 7), True);
        SetPixelV (DC, X-1, 4, Clr);
        Y := 7;
        if FDragHandleStyle = dhDouble then begin
          DrawRaisedEdge (Rect(2, 7, X, 10), True);
          SetPixelV (DC, X-1, 7, Clr);
          Inc (Y, 3);
        end;
        if not UsingBackground then
          FillRect (DC, Rect(2, Y, X, Y+1), Brush);
      end;
    end;

    DeleteObject (Brush);
  finally
    ReleaseDC (Handle, DC);
  end;
end;

procedure TCustomToolWindow97.WMNCPaint (var Message: TMessage);
begin
  { Don't call inherited because it overrides the default NC painting }
  if Docked then
    DrawDockedNCArea (HRGN(Message.WParam))
  else
    DrawFloatingNCArea (HRGN(Message.WParam), True, True, True);
end;

procedure TCustomToolWindow97.Paint;
var
  R, R2, R3: TRect;
  P1, P2: TPoint;
begin
  inherited;

  if Docked and DockedTo.UsingBackground and DockedTo.FBkgOnToolbars then begin
    R := ClientRect;
    R2 := R;
    P1 := DockedTo.ClientToScreen(Point(0, 0));
    P2 := DockedTo.Parent.ClientToScreen(DockedTo.BoundsRect.TopLeft);
    Dec (R2.Left, Left + DockedTo.Left + (P1.X-P2.X));
    Dec (R2.Top, Top + DockedTo.Top + (P1.Y-P2.Y));
    GetWindowRect (Handle, R3);
    with ClientToScreen(Point(0, 0)) do begin
      Inc (R2.Left, R3.Left-X);
      Inc (R2.Top, R3.Top-Y);
    end;
    DockedTo.DrawBackground (Canvas.Handle, R, nil, R2);
  end;
end;

function TCustomToolWindow97.GetPalette: HPALETTE;
begin
  if Docked and DockedTo.UsingBackground then
    Result := DockedTo.FBkg.Palette
  else
    Result := 0;
end;

function TCustomToolWindow97.PaletteChanged (Foreground: Boolean): Boolean;
begin
  Result := inherited PaletteChanged(Foreground);
  if Result and not Foreground then begin
    { There seems to be a bug in Delphi's palette handling. When the form is
      inactive and another window realizes a palette, docked TToolbar97s
      weren't getting redrawn. So this workaround code was added. }
    InvalidateDockedNCArea;
    Invalidate;
  end;
end;

procedure DrawDragRect (const DC: HDC; const NewRect, OldRect: PRect;
  const NewSize, OldSize: TSize; const Brush: HBRUSH; BrushLast: HBRUSH);
{ Draws a dragging outline, hiding the old one if neccessary. This is
  completely flicker free, unlike the old DrawFocusRect method. In case
  you're wondering, I got a lot of ideas from the MFC sources.

  Either NewRect or OldRect can be nil or empty. }
  function CreateNullRegion: HRGN;
  var
    R: TRect;
  begin
    SetRectEmpty (R);
    Result := CreateRectRgnIndirect(R);
  end;
var
  SaveIndex: Integer;
  rgnNew, rgnOutside, rgnInside, rgnLast, rgnUpdate: HRGN;
  R: TRect;
begin
  rgnLast := 0;
  rgnUpdate := 0;

  { First, determine the update region and select it }
  if NewRect = nil then begin
    SetRectEmpty (R);
    rgnOutside := CreateRectRgnIndirect(R);
  end
  else begin
    R := NewRect^;
    rgnOutside := CreateRectRgnIndirect(R);
    InflateRect (R, -NewSize.cx, -NewSize.cy);
    IntersectRect (R, R, NewRect^);
  end;
  rgnInside := CreateRectRgnIndirect(R);
  rgnNew := CreateNullRegion;
  CombineRgn (rgnNew, rgnOutside, rgnInside, RGN_XOR);

  if BrushLast = 0 then
    BrushLast := Brush;

  if OldRect <> nil then begin
    { Find difference between new region and old region }
    rgnLast := CreateNullRegion;
    with OldRect^ do
      SetRectRgn (rgnOutside, Left, Top, Right, Bottom);
    R := OldRect^;
    InflateRect (R, -OldSize.cx, -OldSize.cy);
    IntersectRect (R, R, OldRect^);
    SetRectRgn (rgnInside, R.Left, R.Top, R.Right, R.Bottom);
    CombineRgn (rgnLast, rgnOutside, rgnInside, RGN_XOR);

    { Only diff them if brushes are the same }
    if Brush = BrushLast then begin
      rgnUpdate := CreateNullRegion;
      CombineRgn (rgnUpdate, rgnLast, rgnNew, RGN_XOR);
    end;
  end;

  { Save the DC state so that the clipping region can be restored }
  SaveIndex := SaveDC(DC);
  try
    if (Brush <> BrushLast) and (OldRect <> nil) then begin
      { Brushes are different -- erase old region first }
      SelectClipRgn (DC, rgnLast);
      GetClipBox (DC, R);
      SelectObject (DC, BrushLast);
      PatBlt (DC, R.Left, R.Top, R.Right-R.Left, R.Bottom-R.Top, PATINVERT);
    end;

    { Draw into the update/new region }
    if rgnUpdate <> 0 then
      SelectClipRgn (DC, rgnUpdate)
    else
      SelectClipRgn (DC, rgnNew);
    GetClipBox (DC, R);
    SelectObject (DC, Brush);
    PatBlt (DC, R.Left, R.Top, R.Right-R.Left, R.Bottom-R.Top, PATINVERT);
  finally
    { Clean up DC }
    RestoreDC (DC, SaveIndex);
  end;

  { Free regions }
  if rgnNew <> 0 then DeleteObject (rgnNew);
  if rgnOutside <> 0 then DeleteObject (rgnOutside);
  if rgnInside <> 0 then DeleteObject (rgnInside);
  if rgnLast <> 0 then DeleteObject (rgnLast);
  if rgnUpdate <> 0 then DeleteObject (rgnUpdate);
end;

procedure TCustomToolWindow97.DrawDraggingOutline (const DC: HDC;
  const NewRect, OldRect: PRect; const NewDocking, OldDocking: Boolean);

  function CreateHalftoneBrush: HBRUSH;
  const
    Patterns: array[Boolean] of Word = ($5555, $AAAA);
  var
    I: Integer;
    GrayPattern: array[0..7] of Word;
    GrayBitmap: HBITMAP;
  begin
    for I := 0 to 7 do
      GrayPattern[I] := Patterns[Odd(I)];
    GrayBitmap := CreateBitmap(8, 8, 1, 1, @GrayPattern);
    Result := CreatePatternBrush(GrayBitmap);
    DeleteObject (GrayBitmap);
  end;
var
  NewSize, OldSize: TSize;
  Brush: HBRUSH;
begin
  Brush := CreateHalftoneBrush;
  try
    with GetFloatingBorderSize(Resizable) do begin
      if NewDocking then NewSize.cx := 1 else NewSize.cx := X;
      NewSize.cy := NewSize.cx;
      if OldDocking then OldSize.cx := 1 else OldSize.cx := X;
      OldSize.cy := OldSize.cx;
    end;
    DrawDragRect (DC, NewRect, OldRect, NewSize, OldSize, Brush, Brush);
  finally
    DeleteObject (Brush);
  end;
end;


procedure TCustomToolWindow97.CMColorChanged (var Message: TMessage);
begin
  { Make sure non-client area is redrawn }
  InvalidateDockedNCArea;
  inherited;  { the inherited handler calls Invalidate }
end;

procedure TCustomToolWindow97.CMTextChanged (var Message: TMessage);
begin
  inherited;
  { Update the title bar to use the new Caption }
  DrawFloatingNCArea (0, False, True, False);
end;

procedure TCustomToolWindow97.CMVisibleChanged (var Message: TMessage);
begin
  if not(csDesigning in ComponentState) and Docked then
    DockedTo.ChangeDockList (Visible, Self, Visible);
  inherited;
  if Assigned(FOnVisibleChanged) then
    FOnVisibleChanged (Self);
end;

procedure TCustomToolWindow97.WMActivate (var Message: TWMActivate);
var
  ParentForm: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
begin
  if Docked or (csDesigning in ComponentState) then begin
    inherited;
    Exit;
  end;

  ParentForm := GetMDIParent(GetToolWindowParentForm(Self));

  if Assigned(ParentForm) and ParentForm.HandleAllocated then
    SendMessage (ParentForm.Handle, WM_NCACTIVATE, Ord(Message.Active <> WA_INACTIVE), 0);

  if Message.Active <> WA_INACTIVE then begin
    { This works around a "gotcha" in TCustomForm.CMShowingChanged. When a form
      is hidden, it uses the internal VCL function FindTopMostWindow to
      find a new active window. The problem is that handles of floating
      toolbars on the form being hidden can be returned by
      FindTopMostWindow, so the following code is used to prevent floating
      toolbars on the hidden form from being left active. }
    if not IsWindowVisible(Handle) then
      { ^ Calling IsWindowVisible with a floating toolbar handle will
         always return False if its parent form is hidden since the
         WH_CALLWNDPROC hook automatically updates the toolbars'
         visibility. }
      { Find and activate a window besides this toolbar }
      SetActiveWindow (FindTopLevelWindow(Handle))
    else
      { If the toolbar is being activated and the previous active window wasn't
        its parent form, the form is activated instead. This is done so that if
        the application is deactivated while a floating toolbar was active and
        the application is reactivated again, it returns focus to the form. }
      if Assigned(ParentForm) and ParentForm.HandleAllocated and
         (Message.ActiveWindow <> ParentForm.Handle) then
        SetActiveWindow (ParentForm.Handle);
  end;
end;

procedure TCustomToolWindow97.WMMouseActivate (var Message: TWMMouseActivate);
var
  ParentForm, MDIParentForm: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
begin
  if Docked or (csDesigning in ComponentState) then
    inherited
  else begin
    { When floating, prevent the toolbar from activating when clicked.
      This is so it doesn't take the focus away from the window that had it }
    Message.Result := MA_NOACTIVATE;

    { Similar to calling BringWindowToTop, but doesn't activate it }
    SetWindowPos (Handle, HWND_TOP, 0, 0, 0, 0,
      SWP_NOACTIVATE or SWP_NOMOVE or SWP_NOSIZE);

    { Since it is returning MA_NOACTIVATE, activate the form instead. }
    ParentForm := GetToolWindowParentForm(Self);
    MDIParentForm := GetMDIParent(ParentForm);
    if FActivateParent and Assigned(MDIParentForm) and
       (GetActiveWindow <> Handle) then begin
      { ^ Note to self: That must be in there so that double-clicks work
          properly on controls like Edits }
      if MDIParentForm.HandleAllocated then
        SetActiveWindow (MDIParentForm.Handle);
      if (MDIParentForm <> ParentForm) and  { if it's an MDI child form }
         ParentForm.HandleAllocated then
        BringWindowToTop (ParentForm.Handle);
    end;
  end;
end;

procedure TCustomToolWindow97.BeginMoving (const InitX, InitY: Integer);
type
  PDockedSize = ^TDockedSize;
  TDockedSize = record
    Dock: TDock97;
    Size: TPoint;
  end;
var
  DockList: TList;
  NewDockedSizes: TList; {items are pointers to TDockedSizes}
  MouseOverDock: TDock97;
  MoveRect: TRect;
  PreventDocking: Boolean;
  ScreenDC: HDC;
  NPoint, DPoint: TPoint;

  procedure Dropped;
  var
    NewDockRow: Integer;
    Before: Boolean;
    MoveRectClient: TRect;
    C: Integer;
  begin
    if MouseOverDock <> nil then begin
      MoveRectClient := MoveRect;
      MapWindowPoints (0, MouseOverDock.Handle, MoveRectClient, 2);
      if not(MouseOverDock.Position in PositionLeftOrRight) then
        C := (MoveRectClient.Top+MoveRectClient.Bottom) div 2
      else
        C := (MoveRectClient.Left+MoveRectClient.Right) div 2;
      NewDockRow := MouseOverDock.GetRowOf(C, Before);
      if Before then
        MouseOverDock.InsertRowBefore (NewDockRow)
      else
        if FullSize and
           (MouseOverDock.GetNumberOfToolbarsOnRow(NewDockRow, Self) <> 0) then begin
          Inc (NewDockRow);
          MouseOverDock.InsertRowBefore (NewDockRow);
        end;
      FDockRow := NewDockRow;
      if not(MouseOverDock.Position in PositionLeftOrRight) then
        FDockPos := MoveRectClient.Left
      else
        FDockPos := MoveRectClient.Top;
      Parent := MouseOverDock;
      DockedTo.ArrangeToolbars;
    end
    else begin
      FFloatingTopLeft := MoveRect.TopLeft;
      if DockedTo <> nil then
        Parent := ValidToolWindowParentForm(Self)
      else
        SetBounds (FFloatingTopLeft.X, FFloatingTopLeft.Y, Width, Height);
    end;

    { Make sure it doesn't go completely off the screen }
    MoveOnScreen (True);
  end;

  procedure MouseMoved;
  var
    OldMouseOverDock: TDock97;
    OldMoveRect: TRect;
    Pos: TPoint;

    function CheckIfCanDockTo (Control: TDock97): Boolean;
    const
      DockSensX = 32;
      DockSensY = 20;
    var
      R, S, Temp: TRect;
      I: Integer;
      Sens: Integer;
    begin
      with Control do begin
        Result := False;

        GetWindowRect (Handle, R);
        for I := 0 to NewDockedSizes.Count-1 do
          with PDockedSize(NewDockedSizes[I])^ do begin
            if Dock <> Control then Continue;
            S := Bounds(Pos.X-MulDiv(Size.X-1, NPoint.X, DPoint.X),
              Pos.Y-MulDiv(Size.Y-1, NPoint.Y, DPoint.Y),
              Size.X, Size.Y);
            Break;
          end;
        if (R.Left = R.Right) or (R.Top = R.Bottom) then begin
          if not(Control.Position in PositionLeftOrRight) then
            InflateRect (R, 0, 1)
          else
            InflateRect (R, 1, 0);
        end;

        { Like Office 97, distribute ~32 pixels of extra dock detection area
          to the left side if the toolbar was grabbed at the left, both sides
          if the toolbar was grabbed at the middle, or the right side if
          toolbar was grabbed at the right. If outside, don't try to dock. }
        Sens := MulDiv(DockSensX, NPoint.X, DPoint.X);
        if (Pos.X < R.Left-(DockSensX-Sens)) or (Pos.X > R.Right-1+Sens) then
          Exit;

        { Don't try to dock to the left or right if pointer is above or below
          the boundaries of the dock }
        if (Control.Position in PositionLeftOrRight) and
           ((Pos.Y < R.Top) or (Pos.Y >= R.Bottom)) then
          Exit;

        { And also distribute ~20 pixels of extra dock detection area to
          the top or bottom side }
        Sens := MulDiv(DockSensY, NPoint.Y, DPoint.Y);
        if (Pos.Y < R.Top-(DockSensY-Sens)) or (Pos.Y > R.Bottom-1+Sens) then
          Exit;

        Result := IntersectRect(Temp, R, S);
      end;
    end;
  var
    R, R2: TRect;
    I: Integer;
    Dock: TDock97;
    Accept: Boolean;
  begin
    OldMouseOverDock := MouseOverDock;
    OldMoveRect := MoveRect;

    GetCursorPos (Pos);

    { Check if it can dock }
    MouseOverDock := nil;
    if not PreventDocking then
      for I := 0 to DockList.Count-1 do begin
        Dock := DockList[I];
        if CheckIfCanDockTo(Dock) then begin
          MouseOverDock := Dock;
          Accept := True;
          if Assigned(MouseOverDock.FOnRequestDock) then
            MouseOverDock.FOnRequestDock (MouseOverDock, Self, Accept);
          if Accept then
            Break
          else
            MouseOverDock := nil;
        end;
      end;

    { If not docking, clip the point so it doesn't get dragged under the
      taskbar }
    if MouseOverDock = nil then begin
      R := GetDesktopAreaOfMonitorContainingPoint(Pos);
      if Pos.X < R.Left then Pos.X := R.Left;
      if Pos.X > R.Right then Pos.X := R.Right;
      if Pos.Y < R.Top then Pos.Y := R.Top;
      if Pos.Y > R.Bottom then Pos.Y := R.Bottom;
    end;

    for I := 0 to NewDockedSizes.Count-1 do
      with PDockedSize(NewDockedSizes[I])^ do begin
        if Dock <> MouseOverDock then Continue;
        MoveRect := Bounds(Pos.X-MulDiv(Size.X-1, NPoint.X, DPoint.X),
          Pos.Y-MulDiv(Size.Y-1, NPoint.Y, DPoint.Y),
          Size.X, Size.Y);
        Break;
      end;

    { Make sure title bar (or at least part of the toolbar) is still accessible
      if it's dragged almost completely off the screen. This prevents the
      problem seen in Office 97 where you drag it offscreen so that only the
      border is visible, sometimes leaving you no way to move it back short of
      resetting the toolbar. }
    if MouseOverDock = nil then begin
      R2 := GetDesktopAreaOfMonitorContainingPoint(Pos);
      R := R2;
      with GetFloatingBorderSize(Resizable) do
        InflateRect (R, -(X+4), -(Y+4));
      if MoveRect.Bottom < R.Top then
        OffsetRect (MoveRect, 0, R.Top-MoveRect.Bottom);
      if MoveRect.Top > R.Bottom then
        OffsetRect (MoveRect, 0, R.Bottom-MoveRect.Top);
      if MoveRect.Right < R.Left then
        OffsetRect (MoveRect, R.Left-MoveRect.Right, 0);
      if MoveRect.Left > R.Right then
        OffsetRect (MoveRect, R.Right-MoveRect.Left, 0);

      I := R2.Top - GetFloatingBorderSize(Resizable).Y -
        GetSmallCaptionHeight + 4;
      if MoveRect.Top < I then
        OffsetRect (MoveRect, 0, I-MoveRect.Top);
    end;

    { Update the dragging outline }
    DrawDraggingOutline (ScreenDC, @MoveRect, @OldMoveRect, MouseOverDock <> nil,
      OldMouseOverDock <> nil);
  end;
  procedure BuildDockList;
    procedure Recurse (const ParentCtl: TWinControl);
    var
      D: TDockPosition;
      I: Integer;
    begin
      if (ParentCtl is TDock97) and TDock97(ParentCtl).FAllowDrag and
         (TDock97(ParentCtl).Position in DockableTo) and
         TDock97(ParentCtl).Showing then
        DockList.Add (ParentCtl);
      with ParentCtl do begin
        for D := Low(D) to High(D) do
          for I := 0 to ParentCtl.ControlCount-1 do
            if (Controls[I] is TDock97) and (TDock97(Controls[I]).Position = D) then
              Recurse (TWinControl(Controls[I]));
        for I := 0 to ParentCtl.ControlCount-1 do
          if (Controls[I] is TWinControl) and not(Controls[I] is TDock97) then
            Recurse (TWinControl(Controls[I]));
      end;
    end;
  var
    ParentForm: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
    DockFormsList: TList;
    I, J: Integer;
  begin
    ParentForm := ValidToolWindowParentForm(Self);
    DockFormsList := TList.Create;
    try
      if Assigned(FDockForms) then begin
        for I := 0 to Screen.{$IFDEF TB97D3}CustomFormCount{$ELSE}FormCount{$ENDIF}-1 do begin
          J := FDockForms.IndexOf(Screen.{$IFDEF TB97D3}CustomForms{$ELSE}Forms{$ENDIF}[I]);
          if (J <> -1) and (FDockForms[J] <> ParentForm) then
            DockFormsList.Add (FDockForms[J]);
        end;
      end;
      DockFormsList.Insert (0, ParentForm);
      for I := 0 to DockFormsList.Count-1 do
        Recurse (DockFormsList[I]);
    finally
      DockFormsList.Free;
    end;
  end;
var
  Accept: Boolean;
  R: TRect;
  Msg: TMsg;
  NewDockedSize: PDockedSize;
  I: Integer;
begin
  Accept := False;

  NPoint := Point(InitX, InitY);
  { Adjust for non-client area }
  GetWindowRect (Handle, R);
  R.BottomRight := ClientToScreen(Point(0, 0));
  Dec (NPoint.X, R.Left-R.Right);
  Dec (NPoint.Y, R.Top-R.Bottom);

  DPoint := Point(Width-1, Height-1);

  PreventDocking := GetKeyState(VK_CONTROL) < 0;

  { Build list of all TDock97's on the form }
  DockList := TList.Create;
  try
    BuildDockList;
    { Set up potential sizes for each dock type }
    NewDockedSizes := TList.Create;
    try
      New (NewDockedSize);
      try
        with NewDockedSize^ do begin
          Dock := nil;
          Size := OrderControls(False, GetDockTypeOf(DockedTo), nil);
          AddFloatingNCAreaToSize (Size, Resizable);
        end;
        NewDockedSizes.Add (NewDockedSize);
      except
        Dispose (NewDockedSize);
        raise;
      end;
      for I := 0 to DockList.Count-1 do begin
        New (NewDockedSize);
        try
          with NewDockedSize^ do begin
            Dock := TDock97(DockList[I]);
            if DockList[I] <> DockedTo then
              Size := OrderControls(False, GetDockTypeOf(DockedTo), TDock97(DockList[I]))
            else
              Size := Self.ClientRect.BottomRight;
            AddDockedNCAreaToSize (Size, TDock97(DockList[I]).Position in PositionLeftOrRight,
              FDragHandleStyle);
          end;
          NewDockedSizes.Add (NewDockedSize);
        except
          Dispose (NewDockedSize);
          raise;
        end;
      end;

      { Before locking, make sure all pending paint messages are processed }
      ProcessPaintMessages;

      { This uses LockWindowUpdate to suppress all window updating so the
        dragging outlines doesn't sometimes get garbled. (This is safe, and in
        fact, is the main purpose of the LockWindowUpdate function)
        IMPORTANT! While debugging you might want to enable the 'TB97DisableLock'
        conditional define (see top of the source code). }
      {$IFNDEF TB97DisableLock}
      LockWindowUpdate (GetDesktopWindow);
      {$ENDIF}
      { Get a DC of the entire screen. Works around the window update lock
        by specifying DCX_LOCKWINDOWUPDATE. }
      ScreenDC := GetDCEx(GetDesktopWindow, 0,
        DCX_LOCKWINDOWUPDATE or DCX_CACHE or DCX_WINDOW);
      try
        SetCapture (Handle);

        { Initialize }
        MouseOverDock := nil;
        SetRectEmpty (MoveRect);
        MouseMoved;

        { Stay in message loop until capture is lost. Capture is removed either
          by this procedure manually doing it, or by an outside influence (like
          a message box or menu popping up) }
        while GetCapture = Handle do begin
          case Integer(GetMessage(Msg, 0, 0, 0)) of
            -1: Break; { if GetMessage failed }
            0: begin
                 { Repost WM_QUIT messages }
                 PostQuitMessage (Msg.WParam);
                 Break;
               end;
          end;

          case Msg.Message of
            WM_KEYDOWN, WM_KEYUP:
              { Ignore all keystrokes while dragging. But process Ctrl and Escape }
              case Msg.WParam of
                VK_CONTROL:
                  if PreventDocking <> (Msg.Message = WM_KEYDOWN) then begin
                    PreventDocking := Msg.Message = WM_KEYDOWN;
                    MouseMoved;
                  end;
                VK_ESCAPE:
                  Break;
              end;
            WM_MOUSEMOVE:
              { Note to self: WM_MOUSEMOVE messages should never be dispatched
                here to ensure no hints get shown during the drag process }
              MouseMoved;
            WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
              { Make sure it doesn't begin another loop }
              Break;
            WM_LBUTTONUP: begin
                Accept := True;
                Break;
              end;
            WM_RBUTTONDOWN..WM_MBUTTONDBLCLK:
              { Ignore all other mouse up/down messages }
              ;
          else
            TranslateMessage (Msg);
            DispatchMessage (Msg);
          end;
        end;
      finally
        { Since it sometimes breaks out of the loop without capture being
          released }
        if GetCapture = Handle then
          ReleaseCapture;

        { Hide dragging outline and release the DC }
        DrawDraggingOutline (ScreenDC, nil, @MoveRect, False, MouseOverDock <> nil);
        ReleaseDC (GetDesktopWindow, ScreenDC);

        { Release window update lock }
        {$IFNDEF TB97DisableLock}
        LockWindowUpdate (0);
        {$ENDIF}
      end;

      { Move to new position }
      if Accept then
        Dropped;
    finally
      for I := NewDockedSizes.Count-1 downto 0 do
        Dispose (PDockedSize(NewDockedSizes[I]));
      NewDockedSizes.Free;
    end;
  finally
    DockList.Free;
  end;
end;

function TCustomToolWindow97.ChildControlTransparent (Ctl: TControl): Boolean;
begin
  Result := False;
end;

procedure TCustomToolWindow97.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

  function ControlExistsAtPos (const P: TPoint): Boolean;
  var
    I: Integer;
  begin
    Result := False;
    if PtInRect(ClientRect, P) then
      for I := 0 to ControlCount-1 do
        if not ChildControlTransparent(Controls[I]) and Controls[I].Visible and
           PtInRect(Controls[I].BoundsRect, P) then begin
          Result := True;
          Break;
        end;
  end;
begin
  inherited;
  if (Button <> mbLeft) or
     { Ignore message if user clicked on a child control that was probably
       disabled }
     ControlExistsAtPos(Point(X, Y)) or
     (Docked and not DockedTo.FAllowDrag) then
    Exit;

  { Handle double click }
  if ssDouble in Shift then begin
    if Docked then
      Parent := GetToolWindowParentForm(Self)
    else
      if Assigned(DefaultDock) then begin
        FDockRow := ForceDockAtTopRow;
        FDockPos := ForceDockAtLeftPos;
        Parent := DefaultDock;
      end;
    Exit;
  end;

  BeginMoving (X, Y);
end;

procedure TCustomToolWindow97.WMNCHitTest (var Message: TWMNCHitTest);
var
  P: TPoint;
  BorderSize: TPoint;
  C: Integer;
begin
  inherited;
  with Message do
    if Docked then begin
      if Result = HTNOWHERE then
        Result := HTCLIENT;
    end
    else begin
      P := SmallPointToPoint(Pos);
      Dec (P.X, Left);  Dec (P.Y, Top);
      if Result <> HTCLIENT then begin
        if PtInRect(GetCaptionRect(Self, True, False), P) then begin
          if FCloseButton and PtInRect(GetCloseButtonRect(Self, True), P) then
            Result := HTCLOSE
          else
            Result := HTCLIENT;
        end
        else begin
          if Result in [HTLEFT..HTBOTTOMRIGHT] {set covers all resizing corners} then
            Result := HTNOWHERE;  { handles all resize hit-tests itself }

          if Resizable then begin
            BorderSize := GetFloatingBorderSize(Resizable);
            C := BorderSize.X + (GetSmallCaptionHeight-1);
            if not Params.ResizeEightCorner then begin
              if (P.Y >= 0) and (P.Y < BorderSize.Y) then Result := HTTOP else
              if (P.Y < Height) and (P.Y >= Height-BorderSize.Y-1) then Result := HTBOTTOM else
              if (P.X >= 0) and (P.X < BorderSize.X) then Result := HTLEFT else
              if (P.X < Width) and (P.X >= Width-BorderSize.X-1) then Result := HTRIGHT;
            end
            else begin
              if (P.X >= 0) and (P.X < BorderSize.X) then begin
                Result := HTLEFT;
                if (P.Y < C) then Result := HTTOPLEFT else
                if (P.Y >= Height-C) then Result := HTBOTTOMLEFT;
              end
              else
              if (P.X < Width) and (P.X >= Width-BorderSize.X-1) then begin
                Result := HTRIGHT;
                if (P.Y < C) then Result := HTTOPRIGHT else
                if (P.Y >= Height-C) then Result := HTBOTTOMRIGHT;
              end
              else
              if (P.Y >= 0) and (P.Y < BorderSize.Y) then begin
                Result := HTTOP;
                if (P.X < C) then Result := HTTOPLEFT else
                if (P.X >= Width-C) then Result := HTTOPRIGHT;
              end
              else
              if (P.Y < Height) and (P.Y >= Height-BorderSize.Y-1) then begin
                Result := HTBOTTOM;
                if (P.X < C) then Result := HTBOTTOMLEFT else
                if (P.X >= Width-C) then Result := HTBOTTOMRIGHT;
              end;
            end;
          end;
        end;
      end;
    end;
end;

procedure TCustomToolWindow97.WMNCLButtonDown (var Message: TWMNCLButtonDown);
  procedure CloseButtonLoop;
  var
    Accept, NewCloseButtonDown: Boolean;
    P: TPoint;
    Msg: TMsg;
  begin
    Accept := False;

    FCloseButtonDown := True;
    DrawFloatingNCArea (0, False, False, True);

    SetCapture (Handle);

    try
      while GetCapture = Handle do begin
        case Integer(GetMessage(Msg, 0, 0, 0)) of
          -1: Break; { if GetMessage failed }
          0: begin
               { Repost WM_QUIT messages }
               PostQuitMessage (Msg.WParam);
               Break;
             end;
        end;

        case Msg.Message of
          WM_KEYDOWN, WM_KEYUP:
            { Ignore all keystrokes while in a close button loop }
            ;
          WM_MOUSEMOVE: begin
              { Note to self: WM_MOUSEMOVE messages should never be dispatched
                here to ensure no hints get shown }
              GetCursorPos (P);
              Dec (P.X, Left);  Dec (P.Y, Top);

              NewCloseButtonDown := PtInRect(GetCloseButtonRect(Self, True), P);
              if FCloseButtonDown <> NewCloseButtonDown then begin
                FCloseButtonDown := NewCloseButtonDown;
                DrawFloatingNCArea (0, False, False, True);
              end;
            end;
          WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
            { Make sure it doesn't begin another loop }
            Break;
          WM_LBUTTONUP: begin
              if FCloseButtonDown then
                Accept := True;
              Break;
            end;
          WM_RBUTTONDOWN..WM_MBUTTONDBLCLK:
            { Ignore all other mouse up/down messages }
            ;
        else
          TranslateMessage (Msg);
          DispatchMessage (Msg);
        end;
      end;
    finally
      if GetCapture = Handle then
        ReleaseCapture;
      if FCloseButtonDown <> False then begin
        FCloseButtonDown := False;
        DrawFloatingNCArea (0, False, False, True);
      end;
    end;
    if Accept then begin
      { Hide the window after close button is pushed }
      Hide;
      if Assigned(FOnClose) then
        FOnClose (Self);
    end;
  end;
var
  Accept: Boolean;
  NewRect: TRect;
begin
  case Message.HitTest of
    HTLEFT..HTBOTTOMRIGHT:
      if not Docked then begin
        Accept := False;
        SetRectEmpty (NewRect);
        BeginSizing (Message.HitTest, Accept, NewRect);
        if Accept then begin
          BeginUpdate;
          try
            BoundsRect := NewRect;
          finally
            EndUpdate;
          end;

          { Make sure it doesn't go completely off the screen }
          MoveOnScreen (True);
        end;
      end;
    HTCLOSE:
      if not Docked then
        CloseButtonLoop;
  else
    inherited;
  end;
end;

procedure TCustomToolWindow97.GetParams (var Params: TToolWindowParams);
begin
  with Params do begin
    CallAlignControls := True;
    ResizeEightCorner := True;
    ResizeClipCursor := True;
  end;
end;

procedure TCustomToolWindow97.ResizeBegin;
begin
end;

procedure TCustomToolWindow97.ResizeTrack (var Rect: TRect; const OrigRect: TRect);
begin
end;

procedure TCustomToolWindow97.ResizeEnd;
begin
end;

procedure TCustomToolWindow97.BeginSizing (const HitTestValue: Integer;
  var Accept: Boolean; var NewRect: TRect);
var
  DragX, DragY, ReverseX, ReverseY: Boolean;
  MinWidth, MinHeight: Integer;
  DragRect, OrigDragRect: TRect;
  ScreenDC: HDC;
  OrigPos, OldPos: TPoint;

  procedure MouseMoved;
  var
    Pos: TPoint;
    OldDragRect: TRect;
  begin
    GetCursorPos (Pos);
    { It needs to check if the cursor actually moved since last time. This is
      because a call to LockWindowUpdate (apparently) generates a mouse move
      message even when mouse hasn't moved. }
    if (Pos.X = OldPos.X) and (Pos.Y = OldPos.Y) then Exit;
    OldPos := Pos;

    OldDragRect := DragRect;
    DragRect := OrigDragRect;
    if DragX then begin
      if not ReverseX then Inc (DragRect.Right, Pos.X-OrigPos.X)
      else Inc (DragRect.Left, Pos.X-OrigPos.X);
    end;
    if DragY then begin
      if not ReverseY then Inc (DragRect.Bottom, Pos.Y-OrigPos.Y)
      else Inc (DragRect.Top, Pos.Y-OrigPos.Y);
    end;
    if DragRect.Right-DragRect.Left < MinWidth then begin
      if not ReverseX then DragRect.Right := DragRect.Left + MinWidth
      else DragRect.Left := DragRect.Right - MinWidth;
    end;
    if DragRect.Bottom-DragRect.Top < MinHeight then begin
      if not ReverseY then DragRect.Bottom := DragRect.Top + MinHeight
      else DragRect.Top := DragRect.Bottom - MinHeight;
    end;

    ResizeTrack (DragRect, OrigDragRect);
    DrawDraggingOutline (ScreenDC, @DragRect, @OldDragRect, False, False);
  end;
var
  Msg: TMsg;
  R: TRect;
begin
  Accept := False;

  GetMinimumSize (MinWidth, MinHeight);
  Inc (MinWidth, Width-ClientWidth);
  Inc (MinHeight, Height-ClientHeight);

  DragX := HitTestValue in [HTLEFT, HTRIGHT, HTTOPLEFT, HTTOPRIGHT, HTBOTTOMLEFT, HTBOTTOMRIGHT];
  ReverseX := HitTestValue in [HTLEFT, HTTOPLEFT, HTBOTTOMLEFT];
  DragY := HitTestValue in [HTTOP, HTTOPLEFT, HTTOPRIGHT, HTBOTTOM, HTBOTTOMLEFT, HTBOTTOMRIGHT];
  ReverseY := HitTestValue in [HTTOP, HTTOPLEFT, HTTOPRIGHT];

  ResizeBegin (HitTestValue);
  try
    { Before locking, make sure all pending paint messages are processed }
    ProcessPaintMessages;

    { This uses LockWindowUpdate to suppress all window updating so the
      dragging outlines doesn't sometimes get garbled. (This is safe, and in
      fact, is the main purpose of the LockWindowUpdate function)
      IMPORTANT! While debugging you might want to enable the 'TB97DisableLock'
      conditional define (see top of the source code). }
    {$IFNDEF TB97DisableLock}
    LockWindowUpdate (GetDesktopWindow);
    {$ENDIF}
    { Get a DC of the entire screen. Works around the window update lock
      by specifying DCX_LOCKWINDOWUPDATE. }
    ScreenDC := GetDCEx(GetDesktopWindow, 0,
      DCX_LOCKWINDOWUPDATE or DCX_CACHE or DCX_WINDOW);
    try
      SetCapture (Handle);
      if Params.ResizeClipCursor and not UsingMultipleMonitors then begin
        R := GetPrimaryDesktopArea;
        ClipCursor (@R);
      end;

      { Initialize }
      OrigDragRect := BoundsRect;
      DragRect := OrigDragRect;
      DrawDraggingOutline (ScreenDC, @DragRect, nil, False, False);
      GetCursorPos (OrigPos);
      OldPos := OrigPos;

      { Stay in message loop until capture is lost. Capture is removed either
        by this procedure manually doing it, or by an outside influence (like
        a message box or menu popping up) }
      while GetCapture = Handle do begin
        case Integer(GetMessage(Msg, 0, 0, 0)) of
          -1: Break; { if GetMessage failed }
          0: begin
               { Repost WM_QUIT messages }
               PostQuitMessage (Msg.WParam);
               Break;
             end;
        end;

        case Msg.Message of
          WM_KEYDOWN, WM_KEYUP:
            { Ignore all keystrokes while sizing except for Escape }
            if Msg.WParam = VK_ESCAPE then
              Break;
          WM_MOUSEMOVE:
            { Note to self: WM_MOUSEMOVE messages should never be dispatched
              here to ensure no hints get shown during the drag process }
            MouseMoved;
          WM_LBUTTONDOWN, WM_LBUTTONDBLCLK:
            { Make sure it doesn't begin another loop }
            Break;
          WM_LBUTTONUP: begin
              Accept := True;
              Break;
            end;
          WM_RBUTTONDOWN..WM_MBUTTONDBLCLK:
            { Ignore all other mouse up/down messages }
            ;
        else
          TranslateMessage (Msg);
          DispatchMessage (Msg);
        end;
      end;
    finally
      { Since it sometimes breaks out of the loop without capture being
        released }
      if GetCapture = Handle then
        ReleaseCapture;
      ClipCursor (nil);

      { Hide dragging outline and release the DC }
      DrawDraggingOutline (ScreenDC, nil, @DragRect, False, False);
      ReleaseDC (GetDesktopWindow, ScreenDC);

      { Release window update lock }
      {$IFNDEF TB97DisableLock}
      LockWindowUpdate (0);
      {$ENDIF}
    end;
  finally
    ResizeEnd (Accept);
  end;

  if Accept then
    NewRect := DragRect;
end;

procedure TCustomToolWindow97.WMClose (var Message: TWMClose);
var
  MDIParentForm: {$IFDEF TB97D3} TCustomForm {$ELSE} TForm {$ENDIF};
begin
  { A floating toolbar does not use WM_CLOSE messages when its close button
    is clicked, but Windows still sends a WM_CLOSE message if the user
    presses Alt+F4 while one of the toolbar's controls is focused. Inherited
    is not called since we do not want Windows' default processing - which
    destroys the window. Instead, relay the message to the parent form. }
  MDIParentForm := GetMDIParent(GetToolWindowParentForm(Self));
  if Assigned(MDIParentForm) and MDIParentForm.HandleAllocated then
    SendMessage (MDIParentForm.Handle, WM_CLOSE, 0, 0);
  { Note to self: MDIParentForm is used instead of OwnerForm since MDI
    childs don't process Alt+F4 as Close }
end;

{ TCustomToolWindow97 - property access methods }

procedure TCustomToolWindow97.SetCloseButton (Value: Boolean);
begin
  if FCloseButton <> Value then begin
    FCloseButton := Value;

    { Update the close button's visibility }
    DrawFloatingNCArea (0, False, True, True);
  end;
end;

procedure TCustomToolWindow97.SetDefaultDock (Value: TDock97);
begin
  if FDefaultDock <> Value then begin
    FDefaultDock := Value;
    if Assigned(Value) then
      Value.FreeNotification (Self);
  end;
end;

procedure TCustomToolWindow97.SetDockedTo (Value: TDock97);
begin
  if Assigned(Value) then
    Parent := Value
  else
    Parent := ValidToolWindowParentForm(Self);
end;

procedure TCustomToolWindow97.SetDockPos (Value: Integer);
begin
  FDockPos := Value;
  if Docked then
    DockedTo.ArrangeToolbars;
end;

procedure TCustomToolWindow97.SetDockRow (Value: Integer);
begin
  FDockRow := Value;
  if Docked then
    DockedTo.ArrangeToolbars;
end;

procedure TCustomToolWindow97.SetBorderStyle (Value: TBorderStyle);
begin
  if FBorderStyle <> Value then begin
    FBorderStyle := Value;
    if Docked then
      RecalcNCArea (Self);
  end;
end;

procedure TCustomToolWindow97.SetDragHandleStyle (Value: TDragHandleStyle);
begin
  if FDragHandleStyle <> Value then begin
    FDragHandleStyle := Value;
    if Docked then
      RecalcNCArea (Self);
  end;
end;

procedure TCustomToolWindow97.SetFullSize (Value: Boolean);
begin
  if FFullSize <> Value then begin
    FFullSize := Value;
    ArrangeControls;
  end;
end;

procedure TCustomToolWindow97.SetResizable (Value: Boolean);
begin
  if FResizable <> Value then begin
    FResizable := Value;
    if not Docked then
      { Recreate the window handle because Resizable affects whether the
        tool window is created with a WS_THICKFRAME style }
      RecreateWnd;
  end;
end;


const
  Sig: PChar = '- Toolbar97 version ' + Toolbar97Version +
    {$IFDEF VER90}  '/D2'+ {$ENDIF} {$IFDEF VER93}  '/CB1'+ {$ENDIF}
    {$IFDEF VER100} '/D3'+ {$ENDIF} {$IFDEF VER110} '/CB3'+ {$ENDIF}
    {$IFDEF VER120} '/D4'+ {$ENDIF}
    ' by Jordan Russell -';

initialization
  Sig := Sig;
end.
