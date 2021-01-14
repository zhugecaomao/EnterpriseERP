unit TB97Tlbr;

{
  Toolbar97
  Copyright (C) 1998 by Jordan Russell

  TCustomToolbar97, TToolbar97, TToolbarSep97
}

interface

{$I TB97Ver.inc}

uses
  Windows, Messages, Classes, Controls, Graphics,
  TB97;

type
  { TCustomToolbar97 }

  TToolbarParams = record
    InitializeOrderByPosition, DesignOrderByPosition: Boolean;
  end;

  TCustomToolbar97 = class(TCustomToolWindow97)
  private
    FToolbarParams: TToolbarParams;
    FFloatingRightX: Integer;
    SizeData: Pointer;

    { Lists }
    SlaveInfo,         { List of slave controls. Items are pointers to TSlaveInfo's }
    GroupInfo,         { List of the control "groups". List items are pointers to TGroupInfo's }
    LineSeps,          { List of the Y locations of line separators. Items are casted in TLineSep's }
    OrderList: TList;  { List of the child controls, arranged using the current "OrderIndex" values }

    { Property access methods }
    function GetOrderIndex (Control: TControl): Integer;
    procedure SetFloatingWidth (Value: Integer);
    procedure SetOrderIndex (Control: TControl; Value: Integer);

    { Internal }
    procedure SetControlVisible (const Control: TControl;
      const LeftOrRight: Boolean);
    function ShouldControlBeVisible (const Control: TControl;
      const LeftOrRight: Boolean): Boolean;
    procedure FreeGroupInfo (const List: TList);
    procedure BuildGroupInfo (const List: TList; const TranslateSlave: Boolean;
      const OldDockType, NewDockType: TDockType);

    { Messages }
    procedure CMControlListChange (var Message: TCMControlListChange); message CM_CONTROLLISTCHANGE;
  protected
    property ToolbarParams: TToolbarParams read FToolbarParams;

    procedure Paint; override;

    function ChildControlTransparent (Ctl: TControl): Boolean; override;
    procedure GetParams (var Params: TToolWindowParams); override;
    procedure GetToolbarParams (var Params: TToolbarParams); dynamic;
    procedure ResizeBegin (HitTestValue: Integer); override;
    procedure ResizeTrack (var Rect: TRect; const OrigRect: TRect); override;
    procedure ResizeEnd (Accept: Boolean); override;

    procedure GetBarSize (var ASize: Integer; const DockType: TDockType); override;
    procedure GetMinimumSize (var AClientWidth, AClientHeight: Integer); override;
    procedure InitializeOrdering; override;
    function OrderControls (CanMoveControls: Boolean; PreviousDockType: TDockType;
      DockingTo: TDock97): TPoint; override;
  public
    property OrderIndex[Control: TControl]: Integer read GetOrderIndex write SetOrderIndex;
    property FloatingWidth: Integer read FFloatingRightX write SetFloatingWidth;

    constructor Create (AOwner: TComponent); override;
    destructor Destroy; override;
    procedure ReadPositionData (const ReadIntProc: TPositionReadIntProc;
      const ReadStringProc: TPositionReadStringProc; const ExtraData: Pointer); override;
    procedure WritePositionData (const WriteIntProc: TPositionWriteIntProc;
      const WriteStringProc: TPositionWriteStringProc; const ExtraData: Pointer); override;

    procedure SetSlaveControl (const ATopBottom, ALeftRight: TControl);
  end;

  { TToolbar97 }

  TToolbar97 = class(TCustomToolbar97)
  published
    property ActivateParent;
    property BorderStyle;
    property Caption;
    property Color;
    property CloseButton;
    property DefaultDock;
    property DockableTo;
    property DockedTo;
    property DockPos;
    property DockRow;
    property DragHandleStyle;
    property FullSize;
    property HideWhenInactive;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property Visible;

    property OnClose;
    property OnDragDrop;
    property OnDragOver;
    property OnMove;
    property OnRecreated;
    property OnRecreating;
    property OnDockChanged;
    property OnDockChanging;
    property OnDockChangingEx;
    property OnDockChangingHidden;
    property OnResize;
    property OnVisibleChanged;
  end;

  { TToolbarSep97 }

  TToolbarSepSize = 1..MaxInt;

  TToolbarSep97 = class(TGraphicControl)
  private
    FBlank: Boolean;
    FSizeHorz, FSizeVert: TToolbarSepSize;
    procedure SetBlank (Value: Boolean);
    procedure SetSizeHorz (Value: TToolbarSepSize);
    procedure SetSizeVert (Value: TToolbarSepSize);
  protected
    procedure MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
    procedure SetParent (AParent: TWinControl); override;
  public
    constructor Create (AOwner: TComponent); override;
  published
    { These two properties don't need to be stored since it automatically gets
      resized based on the setting of SizeHorz and SizeVert }
    property Width stored False;
    property Height stored False;
    property Blank: Boolean read FBlank write SetBlank default False;
    property SizeHorz: TToolbarSepSize read FSizeHorz write SetSizeHorz default 6;
    property SizeVert: TToolbarSepSize read FSizeVert write SetSizeVert default 6;
    property Visible;
  end;

implementation

uses
  SysUtils, TB97Cmn, TB97Cnst;

const
  DefaultBarWidthHeight = 8;

  TopMarginNotDocked = 2;
  TopMargin: array[Boolean] of Integer = (TopMarginNotDocked, 0);
  BottomMarginNotDocked = 1;
  BottomMargin: array[Boolean] of Integer = (BottomMarginNotDocked, 0);
  LeftMarginNotDocked = 4;
  LeftMargin: array[Boolean] of Integer = (LeftMarginNotDocked, 0);
  RightMarginNotDocked = 4;
  RightMargin: array[Boolean] of Integer = (RightMarginNotDocked, 0);
  LineSpacing = 6;

  { Constants for registry values. Do not localize! }
  { TCustomToolbar97 specific }
  rvFloatRightX = 'FloatRightX';

type
  { Used internally by the TCustomToolbar97.Resize* procedures }
  PToolbar97SizeData = ^TToolbar97SizeData;
  TToolbar97SizeData = record
    HitTest: Integer;
    NewSizes: TList;  { List of valid new sizes. Items are casted into TSmallPoints }
    CurRightX: Integer;
    DisableSensCheck, OpSide: Boolean;
    SizeSens: Integer;
  end;

  { Used in TCustomToolbar97.GroupInfo lists }
  PGroupInfo = ^TGroupInfo;
  TGroupInfo = record
    GroupWidth,           { Width in pixels of the group, if all controls were
                            lined up left-to-right }
    GroupHeight: Integer; { Heights in pixels of the group, if all controls were
                            lined up top-to-bottom }
    Members: TList;
  end;

  { Used in TCustomToolbar97.SlaveInfo lists }
  PSlaveInfo = ^TSlaveInfo;
  TSlaveInfo = record
    LeftRight,
    TopBottom: TControl;
  end;

  { Used in TCustomToolbar97.LineSeps lists }
  TLineSep = packed record
    Y: SmallInt;
    Blank: Boolean;
    Unused: Boolean;
  end;

  { Use by CompareControls }
  PCompareExtra = ^TCompareExtra;
  TCompareExtra = record
    Toolbar: TCustomToolbar97;
    ComparePositions: Boolean;
    CurDockType: TDockType;
  end;


{ TCustomToolbar97 }

constructor TCustomToolbar97.Create (AOwner: TComponent);
begin
  inherited;
  GetToolbarParams (FToolbarParams);
  GroupInfo := TList.Create;
  SlaveInfo := TList.Create;
  LineSeps := TList.Create;
  OrderList := TList.Create;
end;

destructor TCustomToolbar97.Destroy;
var
  I: Integer;
begin
  OrderList.Free;
  LineSeps.Free;
  if Assigned(SlaveInfo) then begin
    for I := SlaveInfo.Count-1 downto 0 do
      FreeMem (SlaveInfo.Items[I]);
    SlaveInfo.Free;
  end;
  FreeGroupInfo (GroupInfo);
  GroupInfo.Free;
  inherited;
end;

procedure TCustomToolbar97.ReadPositionData (const ReadIntProc: TPositionReadIntProc;
  const ReadStringProc: TPositionReadStringProc; const ExtraData: Pointer);
begin
  inherited;
  FFloatingRightX := ReadIntProc(Name, rvFloatRightX, 0, ExtraData);
end;

procedure TCustomToolbar97.WritePositionData (const WriteIntProc: TPositionWriteIntProc;
  const WriteStringProc: TPositionWriteStringProc; const ExtraData: Pointer);
begin
  inherited;
  WriteIntProc (Name, rvFloatRightX, FFloatingRightX, ExtraData);
end;

procedure TCustomToolbar97.GetMinimumSize (var AClientWidth, AClientHeight: Integer);
begin
  AClientWidth := 0;
  AClientHeight := 0;
end;

function CompareControls (const Item1, Item2, ExtraData: Pointer): Integer; far;
begin
  with PCompareExtra(ExtraData)^ do
    if ComparePositions then begin
      if CurDockType <> dtLeftRight then
        Result := TControl(Item1).Left - TControl(Item2).Left
      else
        Result := TControl(Item1).Top - TControl(Item2).Top;
    end
    else
      with Toolbar.OrderList do
        Result := IndexOf(Item1) - IndexOf(Item2);
end;

procedure TCustomToolbar97.InitializeOrdering;
var
  Extra: TCompareExtra;
begin
  inherited;
  { Initialize order of items in OrderList }
  if ToolbarParams.InitializeOrderByPosition then begin
    with Extra do begin
      Toolbar := Self;
      ComparePositions := True;
      CurDockType := GetDockTypeOf(DockedTo);
    end;
    ListSortEx (OrderList, CompareControls, @Extra);
  end;
end;

procedure TCustomToolbar97.GetBarSize (var ASize: Integer; const DockType: TDockType);
var
  I: Integer;
begin
  ASize := DefaultBarWidthHeight;
  for I := 0 to ControlCount-1 do
    if not(Controls[I] is TToolbarSep97) then
      with Controls[I] do begin
        if ShouldControlBeVisible(Controls[I], DockType = dtLeftRight) then begin
          if DockType = dtLeftRight then begin
            if Width > ASize then ASize := Width;
          end
          else begin
            if Height > ASize then ASize := Height;
          end;
        end;
      end;
end;

procedure TCustomToolbar97.GetParams (var Params: TToolWindowParams);
begin
  inherited;
  with Params do begin
    CallAlignControls := False;
    ResizeEightCorner := False;
    ResizeClipCursor := False;
  end;
end;

procedure TCustomToolbar97.GetToolbarParams (var Params: TToolbarParams);
begin
  with Params do begin
    InitializeOrderByPosition := True;
    DesignOrderByPosition := True;
  end;
end;

procedure TCustomToolbar97.Paint;
var
  S: Integer;
begin
  inherited;
  { Long separators when not docked }
  if not Docked then
    for S := 0 to LineSeps.Count-1 do begin
      with TLineSep(LineSeps[S]) do begin
        if Blank then Continue;
        Canvas.Pen.Color := clBtnShadow;
        Canvas.MoveTo (1, Y-4);  Canvas.LineTo (ClientWidth-1, Y-4);
        Canvas.Pen.Color := clBtnHighlight;
        Canvas.MoveTo (1, Y-3);  Canvas.LineTo (ClientWidth-1, Y-3);
      end;
    end;
end;

function ControlVisibleOrDesigning (AControl: TControl): Boolean;
begin
  Result := AControl.Visible or (csDesigning in AControl.ComponentState);
end;

procedure TCustomToolbar97.SetControlVisible (const Control: TControl;
  const LeftOrRight: Boolean);
{ If Control is a master or slave control, it automatically adjusts the
  Visible properties of both the master and slave control based on the value
  of LeftOrRight }
var
  I: Integer;
begin
  for I := 0 to SlaveInfo.Count-1 do
    with PSlaveInfo(SlaveInfo[I])^ do
      if TopBottom = Control then begin
        if Assigned(TopBottom) then TopBottom.Visible := not LeftOrRight;
        if Assigned(LeftRight) then LeftRight.Visible := LeftOrRight;
        Exit;
      end
      else
      if LeftRight = Control then begin
        if Assigned(TopBottom) then TopBottom.Visible := LeftOrRight;
        if Assigned(LeftRight) then LeftRight.Visible := not LeftOrRight;
        Exit;
      end;
end;

function TCustomToolbar97.ShouldControlBeVisible (const Control: TControl;
  const LeftOrRight: Boolean): Boolean;
{ If Control is a master or slave control, it returns the appropriate visibility
  setting based on the value of LeftOrRight, otherwise it simply returns the
  current Visible setting }
var
  I: Integer;
begin
  for I := 0 to SlaveInfo.Count-1 do
    with PSlaveInfo(SlaveInfo[I])^ do
      if TopBottom = Control then begin
        Result := not LeftOrRight;
        Exit;
      end
      else
      if LeftRight = Control then begin
        Result := LeftOrRight;
        Exit;
      end;
  Result := ControlVisibleOrDesigning(Control);
end;

procedure TCustomToolbar97.FreeGroupInfo (const List: TList);
var
  I: Integer;
  L: PGroupInfo;
begin
  if List = nil then Exit;
  for I := List.Count-1 downto 0 do begin
    L := List.Items[I];
    if Assigned(L) then begin
      L^.Members.Free;
      FreeMem (L);
    end;
    List.Delete (I);
  end;
end;

procedure TCustomToolbar97.BuildGroupInfo (const List: TList;
  const TranslateSlave: Boolean; const OldDockType, NewDockType: TDockType);
var
  I: Integer;
  GI: PGroupInfo;
  Children: TList; {items casted into TControls}
  C: TControl;
  NewGroup: Boolean;
  Extra: TCompareExtra;
begin
  FreeGroupInfo (List);
  if ControlCount = 0 then Exit;

  Children := TList.Create;
  try
    for I := 0 to ControlCount-1 do 
      if (not TranslateSlave and ControlVisibleOrDesigning(Controls[I])) or
         (TranslateSlave and ShouldControlBeVisible(Controls[I], NewDockType = dtLeftRight)) then
        Children.Add (Controls[I]);

    with Extra do begin
      Toolbar := Self;
      CurDockType := OldDockType;
      ComparePositions := (csDesigning in ComponentState) and
        ToolbarParams.DesignOrderByPosition;
    end;
    if Extra.ComparePositions then
      ListSortEx (OrderList, CompareControls, @Extra);
    ListSortEx (Children, CompareControls, @Extra);

    GI := nil;
    NewGroup := True;
    for I := 0 to Children.Count-1 do begin
      if NewGroup then begin
        NewGroup := False;
        GI := AllocMem(SizeOf(TGroupInfo));
        { Note: AllocMem initializes the newly allocated data to zero }
        GI^.Members := TList.Create;
        List.Add (GI);
      end;
      C := Children[I];
      GI^.Members.Add (C);
      if C is TToolbarSep97 then
        NewGroup := True
      else begin
        with C do begin
          Inc (GI^.GroupWidth, Width);
          Inc (GI^.GroupHeight, Height);
        end;
      end;
    end;
  finally
    Children.Free;
  end;
end;

function TCustomToolbar97.OrderControls (CanMoveControls: Boolean;
  PreviousDockType: TDockType; DockingTo: TDock97): TPoint;
{ This arranges the controls on the toolbar }
var
  NewDockType: TDockType;
  NewDocked: Boolean;
  RightX, I: Integer;
  CurBarSize, DockRowSize: Integer;
  GInfo: TList;
  AllowWrap: Boolean;
  MinPosPixels, MinRowPixels, CurPosPixel, CurLinePixel, G: Integer;
  GoToNewLine: Boolean;
  GI: PGroupInfo;
  Member: TControl;
  MemberIsSep: Boolean;
  GroupPosSize, MemberPosSize: Integer;
  PreviousSep: TToolbarSep97;  PrevMinPosPixels: Integer;
  NewLineSep: TLineSep;
label 1;
begin
  NewDockType := GetDockTypeOf(DockingTo);
  NewDocked := Assigned(DockingTo);

  RightX := FFloatingRightX;
  if (NewDockType <> dtNotDocked) or (RightX = 0) then
    RightX := High(RightX)
  else begin
    { Make sure RightX isn't less than the smallest sized control + margins,
      in case one of the *LoadToolbarPositions functions happened to read
      a value too small. }
    for I := 0 to ControlCount-1 do
      if not(Controls[I] is TToolbarSep97) then
        with Controls[I] do
          if Width + (LeftMarginNotDocked+RightMarginNotDocked) > RightX then
            RightX := Width + (LeftMarginNotDocked+RightMarginNotDocked);
  end;

  if CanMoveControls then
    for I := 0 to ControlCount-1 do
      if not(Controls[I] is TToolbarSep97) then
        SetControlVisible (Controls[I], NewDockType = dtLeftRight);

  GetBarSize (CurBarSize, NewDockType);
  if (DockingTo <> nil) and (DockingTo = DockedTo) then
    GetDockRowSize (DockRowSize)
  else
    DockRowSize := CurBarSize;

  if CanMoveControls then
    GInfo := GroupInfo
  else
    GInfo := TList.Create;
  try
    BuildGroupInfo (GInfo, not CanMoveControls, PreviousDockType, NewDockType);

    if CanMoveControls then
      LineSeps.Clear;

    CurLinePixel := TopMargin[NewDocked];
    MinPosPixels := LeftMargin[NewDocked];
    if GInfo.Count <> 0 then begin
      AllowWrap := not NewDocked;
      CurPosPixel := MinPosPixels;
      GoToNewLine := False;
      PreviousSep := nil;  PrevMinPosPixels := 0;
      for G := 0 to GInfo.Count-1 do begin
        GI := PGroupInfo(GInfo[G]);

        if NewDockType <> dtLeftRight then
          GroupPosSize := GI^.GroupWidth
        else
          GroupPosSize := GI^.GroupHeight;
        if AllowWrap and
           (GoToNewLine or (CurPosPixel+GroupPosSize+RightMargin[NewDocked] > RightX)) then begin
          GoToNewLine := False;
          CurPosPixel := LeftMargin[NewDocked];
          if (G <> 0) and (PGroupInfo(GInfo[G-1])^.Members.Count <> 0) then begin
            Inc (CurLinePixel, CurBarSize + LineSpacing);
            if Assigned(PreviousSep) then begin
              MinPosPixels := PrevMinPosPixels;
              if CanMoveControls then begin
                PreviousSep.Width := 0;

                LongInt(NewLineSep) := 0;
                NewLineSep.Y := CurLinePixel;
                NewLineSep.Blank := PreviousSep.Blank;
                LineSeps.Add (Pointer(NewLineSep));
              end;
            end;
          end;
        end;
        if CurPosPixel > MinPosPixels then MinPosPixels := CurPosPixel;
        for I := 0 to GI^.Members.Count-1 do begin
          Member := TControl(GI^.Members[I]);
          MemberIsSep := Member is TToolbarSep97;
          with Member do begin
            if not MemberIsSep then begin
              if NewDockType <> dtLeftRight then
                MemberPosSize := Width
              else
                MemberPosSize := Height;
            end
            else begin
              if NewDockType <> dtLeftRight then
                MemberPosSize := TToolbarSep97(Member).SizeHorz
              else
                MemberPosSize := TToolbarSep97(Member).SizeVert;
            end;
            { If RightX is passed, proceed to next line }
            if AllowWrap and not MemberIsSep and
               (CurPosPixel+MemberPosSize+RightMargin[NewDocked] > RightX) then begin
              CurPosPixel := LeftMargin[NewDocked];
              Inc (CurLinePixel, CurBarSize);
              GoToNewLine := True;
            end;
            if NewDockType <> dtLeftRight then begin
              if not MemberIsSep then begin
                if CanMoveControls then
                  SetBounds (CurPosPixel, CurLinePixel+((DockRowSize-Height) div 2), Width, Height);
                Inc (CurPosPixel, Width);
              end
              else begin
                if CanMoveControls then
                  SetBounds (CurPosPixel, CurLinePixel, TToolbarSep97(Member).SizeHorz, DockRowSize);
                Inc (CurPosPixel, TToolbarSep97(Member).SizeHorz);
              end;
            end
            else begin
              if not MemberIsSep then begin
                if CanMoveControls then
                  SetBounds (CurLinePixel+((DockRowSize-Width) div 2), CurPosPixel, Width, Height);
                Inc (CurPosPixel, Height);
              end
              else begin
                if CanMoveControls then
                  SetBounds (CurLinePixel, CurPosPixel, DockRowSize, TToolbarSep97(Member).SizeVert);
                Inc (CurPosPixel, TToolbarSep97(Member).SizeVert);
              end;
            end;
            PrevMinPosPixels := MinPosPixels;
            if not MemberIsSep then
              PreviousSep := nil
            else
              PreviousSep := TToolbarSep97(Member);
            if CurPosPixel > MinPosPixels then MinPosPixels := CurPosPixel;
          end;
        end;
      end;
    end
    else
      Inc (MinPosPixels, DefaultBarWidthHeight);

    if csDesigning in ComponentState then
      Invalidate;
  finally
    if not CanMoveControls then begin
      FreeGroupInfo (GInfo);
      GInfo.Free;
    end;
  end;

  Inc (MinPosPixels, RightMargin[NewDocked]);
  MinRowPixels := CurLinePixel + CurBarSize + BottomMargin[NewDocked];
  if NewDockType <> dtLeftRight then begin
    Result.X := MinPosPixels;
    Result.Y := MinRowPixels;
  end
  else begin
    Result.X := MinRowPixels;
    Result.Y := MinPosPixels;
  end;
end;

procedure TCustomToolbar97.CMControlListChange (var Message: TCMControlListChange);
{ The VCL sends this message is sent whenever a child control is inserted into
  or deleted from the toolbar }
var
  I: Integer;
begin
  inherited;
  with Message, OrderList do begin
    { Delete any previous occurances of Control in OrderList. There shouldn't
      be any if Inserting=True, but just to be safe, check anyway. }
    while True do begin
      I := IndexOf(Control);
      if I = -1 then Break;
      Delete (I);
    end;
    if Inserting then
      Add (Control);
  end;
end;

function CompareNewSizes (const Item1, Item2, ExtraData: Pointer): Integer; far;
begin
  { Sorts in descending order }
  if ExtraData = nil then
    Result := TSmallPoint(Item2).X - TSmallPoint(Item1).X
  else
    Result := TSmallPoint(Item2).Y - TSmallPoint(Item1).Y;
end;

procedure TCustomToolbar97.ResizeBegin (HitTestValue: Integer);
var
  CurBarSize: Integer;

  procedure BuildNewSizes (const YOrdering: Boolean);
  { Adds items to the NewSizes list. The list must be empty when this is called }
  var
    SaveFloatingRightX: Integer;
    Max, X, LastY, SkipTo: Integer;
    S, S1: TPoint;
    S2: TSmallPoint;
  begin
    with PToolbar97SizeData(SizeData)^ do begin
      SaveFloatingRightX := FFloatingRightX;
      try
        FFloatingRightX := 0;
        S := OrderControls(False, dtNotDocked, nil);
        S1 := S;
        AddFloatingNCAreaToSize (S1, Resizable);
        S2 := PointToSmallPoint(S1);
        NewSizes.Add (Pointer(S2));
        LastY := S.Y;
        Max := S.X;
        SkipTo := High(SkipTo);
        for X := Max-1 downto LeftMarginNotDocked+CurBarSize+RightMarginNotDocked do begin
          if X > SkipTo then Continue;
          FFloatingRightX := X;
          S := OrderControls(False, dtNotDocked, nil);
          if X = S.X then begin
            if S.Y = LastY then
              NewSizes.Delete (NewSizes.Count-1);
            S1 := S;
            AddFloatingNCAreaToSize (S1, Resizable);
            S2 := PointToSmallPoint(S1);
            if NewSizes.IndexOf(Pointer(S2)) = -1 then
              NewSizes.Add (Pointer(S2));
            LastY := S.Y;
          end
          else
            SkipTo := S.X;
        end;
      finally
        FFloatingRightX := SaveFloatingRightX;
      end;
      ListSortEx (NewSizes, CompareNewSizes, Pointer(Longint(YOrdering)));
    end;
  end;
const
  MaxSizeSens = 12;
var
  I, NewSize: Integer;
  S, N: TSmallPoint;
begin
  inherited;

  SizeData := AllocMem(SizeOf(TToolbar97SizeData));

  with PToolbar97SizeData(SizeData)^ do begin
    HitTest := HitTestValue;
    CurRightX := FFloatingRightX;
    DisableSensCheck := False;
    OpSide := False;
    GetBarSize (CurBarSize, dtNotDocked);
    NewSizes := TList.Create;

    BuildNewSizes (HitTestValue in [HTTOP, HTBOTTOM]);

    SizeSens := MaxSizeSens;
    { Adjust sensitivity if it's too high }
    for I := 0 to NewSizes.Count-1 do begin
      Pointer(S) := NewSizes[I];
      if (S.X = Width) and (S.Y = Height) then begin
        if I > 0 then begin
          Pointer(N) := NewSizes[I-1];
          if HitTestValue in [HTLEFT, HTRIGHT] then
            NewSize := N.X - S.X - 1
          else
            NewSize := N.Y - S.Y - 1;
          if NewSize < SizeSens then SizeSens := NewSize;
        end;
        if I < NewSizes.Count-1 then begin
          Pointer(N) := NewSizes[I+1];
          if HitTestValue in [HTLEFT, HTRIGHT] then
            NewSize := S.X - N.X - 1
          else
            NewSize := S.Y - N.Y - 1;
          if NewSize < SizeSens then SizeSens := NewSize;
        end;
        Break;
      end;
    end;
    if SizeSens < 0 then SizeSens := 0;
  end;
end;

procedure TCustomToolbar97.ResizeTrack (var Rect: TRect; const OrigRect: TRect);
var
  Pos: TPoint;
  NCXDiff: Integer;
  NewOpSide: Boolean;
  Reverse: Boolean;
  I: Integer;
  P: TSmallPoint;
begin
  inherited;

  with PToolbar97SizeData(SizeData)^ do begin
    GetCursorPos (Pos);

    NCXDiff := ClientToScreen(Point(0, 0)).X - Left;
    Dec (Pos.X, Left);  Dec (Pos.Y, Top);
    if HitTest = HTLEFT then
      Pos.X := Width-Pos.X
    else
    if HitTest = HTTOP then
      Pos.Y := Height-Pos.Y;

    { Adjust Pos to make up for the "sizing sensitivity", as seen in Office 97 }
    if HitTest in [HTLEFT, HTRIGHT] then
      NewOpSide := Pos.X < Width
    else
      NewOpSide := Pos.Y < Height;
    if (not DisableSensCheck) or (OpSide <> NewOpSide) then begin
      DisableSensCheck := False;
      OpSide := NewOpSide;
      if HitTest in [HTLEFT, HTRIGHT] then begin
        if (Pos.X >= Width-SizeSens) and (Pos.X < Width+SizeSens) then
          Pos.X := Width;
      end
      else begin
        if (Pos.Y >= Height-SizeSens) and (Pos.Y < Height+SizeSens) then
          Pos.Y := Height;
      end;
    end;

    Rect := OrigRect;

    if HitTest in [HTLEFT, HTRIGHT] then
      Reverse := Pos.X > Width
    else
      Reverse := Pos.Y > Height;
    if not Reverse then
      I := NewSizes.Count-1
    else
      I := 0;
    while True do begin
      if (not Reverse and (I < 0)) or
         (Reverse and (I >= NewSizes.Count)) then
        Break;
      Pointer(P) := NewSizes[I];
      if HitTest in [HTLEFT, HTRIGHT] then begin
        if (not Reverse and ((I = NewSizes.Count-1) or (Pos.X >= P.X))) or
           (Reverse and ((I = 0) or (Pos.X < P.X))) then begin
          if I = 0 then
            CurRightX := 0
          else
            CurRightX := P.X - NCXDiff*2;
          if HitTest = HTRIGHT then
            Rect.Right := Rect.Left + P.X
          else
            Rect.Left := Rect.Right - P.X;
          Rect.Bottom := Rect.Top + P.Y;
          DisableSensCheck := not EqualRect(Rect, OrigRect);
        end;
      end
      else begin
        if (not Reverse and ((I = NewSizes.Count-1) or (Pos.Y >= P.Y))) or
           (Reverse and ((I = 0) or (Pos.Y < P.Y))) then begin
          if I = NewSizes.Count-1 then
            CurRightX := 0
          else
            CurRightX := P.X - NCXDiff*2;
          if HitTest = HTBOTTOM then
            Rect.Bottom := Rect.Top + P.Y
          else
            Rect.Top := Rect.Bottom - P.Y;
          Rect.Right := Rect.Left + P.X;
          DisableSensCheck := not EqualRect(Rect, OrigRect);
        end;
      end;
      if not Reverse then
        Dec (I)
      else
        Inc (I);
    end;
  end;
end;

procedure TCustomToolbar97.ResizeEnd (Accept: Boolean);
begin
  inherited;
  if Assigned(SizeData) then begin
    with PToolbar97SizeData(SizeData)^ do begin
      if Accept then
        FFloatingRightX := CurRightX;
      NewSizes.Free;
    end;
    FreeMem (SizeData);
  end;
end;

function TCustomToolbar97.GetOrderIndex (Control: TControl): Integer;
begin
  Result := OrderList.IndexOf(Control);
  if Result = -1 then
    raise EInvalidOperation.CreateFmt(STB97ToolbarControlNotChildOfToolbar,
      [Control.Name]);
end;

procedure TCustomToolbar97.SetOrderIndex (Control: TControl; Value: Integer);
var
  OldIndex: Integer;
begin
  with OrderList do begin
    OldIndex := IndexOf(Control);
    if OldIndex = -1 then
      raise EInvalidOperation.CreateFmt(STB97ToolbarControlNotChildOfToolbar,
        [Control.Name]);
    if Value < 0 then Value := 0;
    if Value >= Count then Value := Count-1;
    if Value <> OldIndex then begin
      Delete (OldIndex);
      Insert (Value, Control);
      ArrangeControls;
    end;
  end;
end;

procedure TCustomToolbar97.SetFloatingWidth (Value: Integer);
begin
  if FFloatingRightX <> Value then begin
    FFloatingRightX := Value;
    ArrangeControls;
  end;
end;

procedure TCustomToolbar97.SetSlaveControl (const ATopBottom, ALeftRight: TControl);
var
  NewVersion: PSlaveInfo;
begin
  GetMem (NewVersion, SizeOf(TSlaveInfo));
  with NewVersion^ do begin
    TopBottom := ATopBottom;
    LeftRight := ALeftRight;
  end;
  SlaveInfo.Add (NewVersion);
  ArrangeControls;
end;

function TCustomToolbar97.ChildControlTransparent (Ctl: TControl): Boolean;
begin
  Result := Ctl is TToolbarSep97;
end;


{ TToolbarSep97 }

constructor TToolbarSep97.Create (AOwner: TComponent);
begin
  inherited;
  FSizeHorz := 6;
  FSizeVert := 6;
  ControlStyle := ControlStyle - [csOpaque, csCaptureMouse];
end;

procedure TToolbarSep97.SetParent (AParent: TWinControl);
begin
  if (AParent <> nil) and not(AParent is TCustomToolbar97) then
    raise EInvalidOperation.Create(STB97SepParentNotAllowed);
  inherited;
end;

procedure TToolbarSep97.SetBlank (Value: Boolean);
begin
  if FBlank <> Value then begin
    FBlank := Value;
    Invalidate;
  end;
end;

procedure TToolbarSep97.SetSizeHorz (Value: TToolbarSepSize);
begin
  if FSizeHorz <> Value then begin
    FSizeHorz := Value;
    if Parent is TCustomToolbar97 then
      TCustomToolbar97(Parent).ArrangeControls;
  end;
end;

procedure TToolbarSep97.SetSizeVert (Value: TToolbarSepSize);
begin
  if FSizeVert <> Value then begin
    FSizeVert := Value;
    if Parent is TCustomToolbar97 then
      TCustomToolbar97(Parent).ArrangeControls;
  end;
end;

procedure TToolbarSep97.Paint;
var
  R: TRect;
  Z: Integer;
begin
  inherited;
  if not(Parent is TCustomToolbar97) then Exit;

  with Canvas do begin
    { Draw dotted border in design mode }
    if csDesigning in ComponentState then begin
      Pen.Style := psDot;
      Pen.Color := clBtnShadow;
      Brush.Style := bsClear;
      R := ClientRect;
      Rectangle (R.Left, R.Top, R.Right, R.Bottom);
      Pen.Style := psSolid;
    end;

    if not FBlank then
      if GetDockTypeOf(TCustomToolbar97(Parent).DockedTo) <> dtLeftRight then begin
        Z := Width div 2;
        Pen.Color := clBtnShadow;
        MoveTo (Z-1, 0);  LineTo (Z-1, Height);
        Pen.Color := clBtnHighlight;
        MoveTo (Z, 0);  LineTo (Z, Height);
      end
      else begin
        Z := Height div 2;
        Pen.Color := clBtnShadow;
        MoveTo (0, Z-1);  LineTo (Width, Z-1);
        Pen.Color := clBtnHighlight;
        MoveTo (0, Z);  LineTo (Width, Z);
      end;
  end;
end;

procedure TToolbarSep97.MouseDown (Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  inherited;
  if not(Parent is TCustomToolbar97) then Exit;

  { Relay the message to the parent toolbar }
  P := Parent.ScreenToClient(ClientToScreen(Point(X, Y)));
  TCustomToolbar97(Parent).MouseDown (Button, Shift, P.X, P.Y);
end;

end.
