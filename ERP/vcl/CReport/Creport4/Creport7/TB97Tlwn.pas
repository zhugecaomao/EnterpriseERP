unit TB97Tlwn;

{
  Toolbar97
  Copyright (C) 1998 by Jordan Russell

  TToolWindow97
}

interface

{$I TB97Ver.inc}

uses
  Windows, Classes, Controls, TB97;

type
  { TToolWindow97 }

  TToolWindow97 = class(TCustomToolWindow97)
  private
    FMinClientWidth, FMinClientHeight: Integer;
    FBarHeight, FBarWidth: Integer;
    function GetClientAreaWidth: Integer;
    procedure SetClientAreaWidth (Value: Integer);
    function GetClientAreaHeight: Integer;
    procedure SetClientAreaHeight (Value: Integer);
    procedure SetClientAreaSize (AWidth, AHeight: Integer);
  protected
    procedure CreateParams (var Params: TCreateParams); override;

    procedure GetBarSize (var ASize: Integer; const DockType: TDockType); override;
    procedure GetMinimumSize (var AClientWidth, AClientHeight: Integer); override;
    function OrderControls (CanMoveControls: Boolean; PreviousDockType: TDockType;
      DockingTo: TDock97): TPoint; override;
    procedure SizeChanging (const AWidth, AHeight: Integer); override;
  public
    constructor Create (AOwner: TComponent); override;

    procedure ReadPositionData (const ReadIntProc: TPositionReadIntProc;
      const ReadStringProc: TPositionReadStringProc; const ExtraData: Pointer); override;
    procedure WritePositionData (const WriteIntProc: TPositionWriteIntProc;
      const WriteStringProc: TPositionWriteStringProc; const ExtraData: Pointer); override;
  published
    property ActivateParent;
    property BorderStyle;
    property Caption;
    property Color;
    property CloseButton;
    property ClientAreaHeight: Integer read GetClientAreaHeight write SetClientAreaHeight;
    property ClientAreaWidth: Integer read GetClientAreaWidth write SetClientAreaWidth;
    property DefaultDock;
    property DockableTo;
    property DockedTo;
    property DockPos;
    property DockRow;
    property DragHandleStyle;
    property FullSize;
    property HideWhenInactive;
    property MinClientHeight: Integer read FMinClientHeight write FMinClientHeight default 32;
    property MinClientWidth: Integer read FMinClientWidth write FMinClientWidth default 32;
    property ParentShowHint;
    property PopupMenu;
    property Resizable;
    property ShowHint;
    property TabOrder;
    property Visible;

    property OnClose;
    property OnDragDrop;
    property OnDragOver;
    property OnDockChanged;
    property OnDockChanging;
    property OnDockChangingEx;
    property OnDockChangingHidden;
    property OnMove;
    property OnRecreated;
    property OnRecreating;
    property OnResize;
    property OnVisibleChanged;
  end;

implementation

const
  { Constants for TToolWindow97-specific registry values. Do not localize! }
  rvClientWidth = 'ClientWidth';
  rvClientHeight = 'ClientHeight';


{ TToolWindow97 }

constructor TToolWindow97.Create (AOwner: TComponent);
begin
  inherited;
  FMinClientWidth := 32;
  FMinClientHeight := 32;
  { Initialize the client size to 32x32 }
  SetBounds (Left, Top, 32, 32);
end;

procedure TToolWindow97.CreateParams (var Params: TCreateParams);
begin
  inherited;
  { Disable complete redraws when size changes. CS_H/VREDRAW cause flicker
    and are not necessary for this control at run time }
  if not(csDesigning in ComponentState) then
    with Params.WindowClass do
      Style := Style and not(CS_HREDRAW or CS_VREDRAW);
end;

procedure TToolWindow97.ReadPositionData (const ReadIntProc: TPositionReadIntProc;
  const ReadStringProc: TPositionReadStringProc; const ExtraData: Pointer);
begin
  inherited;
  { Restore ClientAreaWidth/ClientAreaHeight variables }
  if Resizable then
    SetClientAreaSize (ReadIntProc(Name, rvClientWidth, FBarWidth, ExtraData),
      ReadIntProc(Name, rvClientHeight, FBarHeight, ExtraData));
end;

procedure TToolWindow97.WritePositionData (const WriteIntProc: TPositionWriteIntProc;
  const WriteStringProc: TPositionWriteStringProc; const ExtraData: Pointer);
begin
  inherited;
  { Write values of FBarWidth/FBarHeight }
  WriteIntProc (Name, rvClientWidth, FBarWidth, ExtraData);
  WriteIntProc (Name, rvClientHeight, FBarHeight, ExtraData);
end;

procedure TToolWindow97.GetMinimumSize (var AClientWidth, AClientHeight: Integer);
begin
  AClientWidth := FMinClientWidth;
  AClientHeight := FMinClientHeight;
end;

procedure TToolWindow97.SizeChanging (const AWidth, AHeight: Integer);
begin
  FBarWidth := AWidth;
  if Parent <> nil then Dec (FBarWidth, Width - ClientWidth);
  FBarHeight := AHeight;
  if Parent <> nil then Dec (FBarHeight, Height - ClientHeight);
end;

procedure TToolWindow97.GetBarSize (var ASize: Integer; const DockType: TDockType);
begin
  if DockType <> dtLeftRight then
    ASize := FBarHeight
  else
    ASize := FBarWidth;
end;

function TToolWindow97.OrderControls (CanMoveControls: Boolean;
  PreviousDockType: TDockType; DockingTo: TDock97): TPoint;
begin
  Result.X := FBarWidth;
  Result.Y := FBarHeight;
end;

function TToolWindow97.GetClientAreaWidth: Integer;
begin
  if Parent = nil then
    Result := Width
  else
    Result := ClientWidth;
end;

procedure TToolWindow97.SetClientAreaWidth (Value: Integer);
begin
  SetClientAreaSize (Value, ClientAreaHeight);
end;

function TToolWindow97.GetClientAreaHeight: Integer;
begin
  if Parent = nil then
    Result := Height
  else
    Result := ClientHeight;
end;

procedure TToolWindow97.SetClientAreaHeight (Value: Integer);
begin
  SetClientAreaSize (ClientAreaWidth, Value);
end;

procedure TToolWindow97.SetClientAreaSize (AWidth, AHeight: Integer);
var
  Client: TRect;
begin
  if Parent = nil then
    SetBounds (Left, Top, AWidth, AHeight)
  else begin
    Client := GetClientRect;
    SetBounds (Left, Top, Width - Client.Right + AWidth,
      Height - Client.Bottom + AHeight);
  end;
end;

end.
