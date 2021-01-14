unit OutlookBar;

interface

uses
  Classes, SysUtils, Windows, Messages, Graphics, Controls, Imglist;

type
  TOutlookBarItems = class;
  TOutlookBarPage = class;
  TOutlookBarPages = class;
  TCustomOutlookBar = class;

  TDrawOutlookBarItemTitleBorderStyle = set of (dsFlat, dsHot, dsDown, dsRedraw);

  TOutlookBarItem = class(TPersistent)
  private
    FData: Pointer;
    FCaption: string;
    FExpanded: Boolean;
    FItems: TList;
    FOwner: TOutlookBarItems;
    FParent: TOutlookBarItem;
    FImageIndex: Integer;
    FDown: Boolean;
    FLastDrawBorderStyle: TDrawOutlookBarItemTitleBorderStyle;
    function GetCount:Integer;
    function GetPage: TOutlookBarPage;
    function GetParent: TOutlookBarItem;
    function GetOutlookBar: TCustomOutlookBar;
    function GetOutlookBarItems: TOutlookBarItems;
    function GetIndex: Integer;
    function GetParentList: TList;
    function GetItem(Index: Integer): TOutlookBarItem;
    function GetLevel: Integer;
    procedure SetCaption(Value: string);
    procedure SetImageIndex(Value: Integer);
    procedure SetItem(Index: Integer; Value: TOutlookBarItem);
    procedure SetExpanded(Value: Boolean);
  protected
    function GetOwner: TPersistent; override;
    function CanVisible: Boolean; virtual;
  public
    constructor Create(AOwner: TOutlookBarItems);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    procedure Clear;
    function GetPrev: TOutlookBarItem;
    function GetPrevVisible: TOutlookBarItem;
    function GetNext: TOutlookBarItem;
    function GetNextSibling: TOutlookBarItem;
    function GetNextVisible: TOutlookBarItem;
    property Count: Integer read GetCount;
    property Page: TOutlookBarPage read GetPage;
    property Parent: TOutlookBarItem read GetParent;
    property Owner: TOutlookBarItems read GetOutlookBarItems;
    property OutlookBar:TCustomOutlookBar read GetOutlookBar;
    property Items[Index: Integer]: TOutlookBarItem read GetItem write SetItem; default;
    property Index: Integer read GetIndex;
    property Data: Pointer read FData write FData;
    property Level: Integer read GetLevel;
  published
    property Expanded: Boolean read FExpanded write SetExpanded;
    property Caption: string read FCaption write SetCaption;
    property ImageIndex: Integer read FImageIndex write SetImageIndex;
  end;

  TOutlookBarItems = class(TPersistent)
  private
    FItems: TList;
    FOwner: TOutlookBarPage;
    function GetCount:Integer;
    function GetItem(Index: Integer): TOutlookBarItem;
    procedure SetItem(Index: Integer; Value: TOutlookBarItem);
    function GetPage: TOutlookBarPage;
  public
    constructor Create(AOwner: TOutlookBarPage);
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
    function Insert(Parent: TOutlookBarItem; Index: Integer): TOutlookBarItem;
    procedure Clear;
    function GetVisibleItem(Index:Integer): TOutlookBarItem;
//    function GetItemOfAll(Index:Integer): TOutlookBarItem;
    property Count: Integer read GetCount;
    property Owner: TOutlookBarPage read GetPage;
    property Items[Index: Integer]: TOutlookBarItem read GetItem write SetItem; default;
  end;

  TDrawOutlookBarPageTitleBorderStyle = TDrawOutlookBarItemTitleBorderStyle;

  TLookBarIconStyle = (isLarge, isSmall);

  TOutlookBarPage = class(TCollectionItem)
  private
    FData: Pointer;
    FOffset: Integer;
    FItems: TOutlookBarItems;
    FLastDrawTitleBorderStyle: TDrawOutlookBarPageTitleBorderStyle;
    FCaption: string;
    FDown: Boolean;
    FIconStyle: TLookBarIconStyle;
    FTitleRect: TRect;
    function GetPages: TOutlookBarPages;
    function GetOutlookBar: TCustomOutlookBar;
    function GetTitleRect: TRect;
    procedure SetCaption(Value: string);
    procedure SetItems(Value: TOutlookBarItems);
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    property Owner: TOutlookBarPages read GetPages;
    property OutlookBar:TCustomOutlookBar read GetOutlookBar;
    property Data: Pointer read FData write FData;
    property TitleRect: TRect read GetTitleRect;
  published
    property Caption: string read FCaption write SetCaption;
    property Items: TOutlookBarItems read FItems write SetItems;
    property IconStyle: TLookBarIconStyle read FIconStyle write FIconStyle;
  end;

  TOutlookBarPages = class(TCollection)
  private
    FOutlookBar: TCustomOutlookBar;
    function GetOutlookBar: TCustomOutlookBar;
    function GetItem(Index: Integer): TOutlookBarPage;
    procedure SetItem(Index: Integer; Value: TOutlookBarPage);
  protected
    function GetOwner: TPersistent; override;
    procedure Update(Item: TCollectionItem); override;
  public
    constructor Create(AOwner: TCustomOutlookBar); virtual;
    function Add: TOutlookBarPage;
    property Owner: TCustomOutlookBar read GetOutlookBar;
    property Items[Index: Integer]: TOutlookBarPage read GetItem write SetItem; default;
  end;

  TOutlookBarItemNotifyEvent = procedure (Sender: TObject; AItem: TOutlookBarItem) of object;

  TCustomOutlookBar = class(TCustomControl)
  private
    FAnimating: Boolean;
    FFlat: Boolean;
    FLargeChangeLink: TChangeLink;
    FLargeImages: TCustomImageList;
    FPages: TOutlookBarPages;
    FPageIndex: Integer;
    FSmallChangeLink: TChangeLink;
    FSmallImages: TCustomImageList;
    FVisibleItems: TList;
    FWorkArea: TRect;

    FScrollUpDown: Boolean;
    FScrollDownDown: Boolean;

    FOnItemClick: TOutlookBarItemNotifyEvent;
    FOnPageChange: TNotifyEvent;
    function CanScrollUp: Boolean;
    function CanScrollDown: Boolean;
    function GetScrollUpRect: TRect;
    function GetScrollDownRect: TRect;

    procedure DrawScrollButtons;
    procedure ScrollUp;
    procedure ScrollDown;

    procedure SetPages(Value: TOutlookBarPages);
    procedure SetPageIndex(Value: Integer);
    procedure SetLargeImages(Value: TCustomImageList);
    procedure SetSmallImages(Value: TCustomImageList);
    procedure CMMouseLeave(var Message:TMessage); message CM_MOUSELEAVE;
  protected
    procedure CreateParams(var Params: TCreateParams); override;

    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;

    procedure LayoutChanged; virtual;

    procedure ClickPageTitle(Page: TOutlookBarPage); virtual;
    procedure ClickItem(Item: TOutlookBarItem); virtual;

    function GetWorkArea: TRect;
    function GetPageTitleRect(Page: TOutlookBarPage): TRect;
    function GetItemRect(Item: TOutlookBarItem): TRect;
    function GetItemBorderRect(Item: TOutlookBarItem; ARect: TRect; IncludeCaption: 
        Boolean = False): TRect;

    procedure DrawPageTitle(Page: TOutlookBarPage; const ARect:TRect); virtual;
    procedure DrawPageTitleBorder(Page: TOutlookBarPage; const ARect:TRect; ADrawStyle: TDrawOutlookBarPageTitleBorderStyle); virtual;
    procedure DrawItems(const ARect: TRect); virtual;
    procedure MeasurePageTitle(Page: TOutlookBarPage; var Width, Height: Integer); virtual;

    procedure MeasureItem(Item: TOutlookBarItem; var Width, Height: Integer); virtual;
    procedure DrawItem(Item: TOutlookBarItem; const ARect: TRect); virtual;
    procedure DrawItemBorder(Item: TOutlookBarItem; const ARect: TRect; ADrawStyle: TDrawOutlookBarPageTitleBorderStyle); virtual;

    property LargeImages: TCustomImageList read FLargeImages write SetLargeImages;
    property SmallImages: TCustomImageList read FSmallImages write SetSmallImages;
    property Pages: TOutlookBarPages read FPages write SetPages;
    property Flat: Boolean read FFlat write FFlat;
    property Color default clAppWorkSpace;
    property OnItemClick: TOutlookBarItemNotifyEvent read FOnItemClick write FOnItemClick;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetBounds(ALeft, ATop, AWidth, AHeight: Integer); override;

    function GetPageAt(X, Y: Integer): TOutlookBarPage;
    function GetItemAt(X, Y: Integer): TOutlookBarItem;
    function GetFirstVisibleItem: TOutlookBarItem;

    procedure UpdateItem(Item: TOutlookBarItem);
    procedure UpdatePage(Page: TOutlookBarPage);
  published
    property PageIndex: Integer read FPageIndex write SetPageIndex;
    property OnPageChange: TNotifyEvent read FOnPageChange write FOnPageChange;
  end;

  TOutlookBar = class(TCustomOutlookBar)
  published
    //inherited
    property Align;
    property Anchors;
    property BevelInner;
    property BevelKind;
    property BevelOuter;
    property BevelWidth;
    property BiDiMode;
    property BorderWidth;
    property Color;
    property Constraints;
    property DragCursor;
    property DragKind;
    property DragMode;
    property Enabled;
    property Font;
    property ImeMode;
    property ImeName;
    property ParentBiDiMode;
    property ParentColor;
    property ParentCtl3D;
    property ParentFont;
    property ParentShowHint;
    property PopupMenu;
    property ShowHint;
    property TabOrder;
    property Visible;
    property OnClick;
    property OnContextPopup;
    property OnDblClick;
    property OnDragDrop;
    property OnDockDrop;
    property OnDockOver;
    property OnDragOver;
    property OnEndDock;
    property OnEndDrag;
    property OnGetSiteInfo;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
    property OnStartDock;
    property OnStartDrag;
    property OnUnDock;

    property Flat;
    property Pages;
    property LargeImages;
    property SmallImages;

    property OnItemClick;
  end;

implementation

procedure TextSize(Font: TFont; const S: string; var Width, Height:Integer);
var
  DC: HDC;
  SaveFont: HFont;
  rt: TRect;
begin
  DC := GetDC(0);
  SaveFont := SelectObject(DC, Font.Handle);
  FillChar(rt,SizeOf(rt),0);
  DrawText(DC, PChar(S), Length(S), rt, DT_CALCRECT);
  SelectObject(DC, SaveFont);
  ReleaseDC(0, DC);
  Width := rt.Right - rt.Left;
  Height := rt.Bottom - rt.Top;
end;

{TOutlookBarItem}
constructor TOutlookBarItem.Create(AOwner: TOutlookBarItems);
begin
  inherited Create;
  FOwner := AOwner;
  FItems := TList.Create;
end;

destructor TOutlookBarItem.Destroy;
begin
  Clear;
  GetParentList.Remove(Self);
  FItems.Free;
  inherited Destroy;
end;

function TOutlookBarItem.GetCount:Integer;
begin
  Result := FItems.Count;
end;

function TOutlookBarItem.GetPage: TOutlookBarPage;
begin
  Result := Owner.Owner;
end;

function TOutlookBarItem.GetParent: TOutlookBarItem;
begin
  Result := FParent;
end;

function TOutlookBarItem.GetOutlookBar: TCustomOutlookBar;
begin
  Result := Page.OutlookBar;
end;

function TOutlookBarItem.GetIndex: Integer;
begin
  Result := GetParentList.IndexOf(Self);
end;

function TOutlookBarItem.GetParentList: TList;
begin
  if Assigned(Parent) then Result := Parent.FItems else Result := Owner.FItems;
end;

function TOutlookBarItem.GetItem(Index: Integer): TOutlookBarItem;
begin
  Result := FItems[Index];
end;

function TOutlookBarItem.GetOutlookBarItems: TOutlookBarItems;
begin
  Result := FOwner;
end;

function TOutlookBarItem.CanVisible: Boolean;
begin
  if Assigned(Parent) then Result := Parent.CanVisible and Parent.Expanded
    else Result := Outlookbar.Visible;
end;

function TOutlookBarItem.GetLevel: Integer;
var
  P: TOutlookBarItem;
begin
  Result := 0;
  P := Parent;
  while Assigned(P) do
  begin
    Inc(Result);
    P := P.Parent;
  end;
end;

procedure TOutlookBarItem.SetCaption(Value: string);
begin
  FCaption := Value;
  OutlookBar.UpdateItem(Self);
end;

procedure TOutlookBarItem.SetImageIndex(Value: Integer);
begin
  FImageIndex := Value;
  OutlookBar.UpdateItem(Self);
end;

procedure TOutlookBarItem.SetItem(Index: Integer; Value: TOutlookBarItem);
begin
  Items[Index].Assign(Value);
end;

procedure TOutlookBarItem.SetExpanded(Value: Boolean);
begin
  FExpanded := Value;
  if Count = 0 then OutlookBar.UpdateItem(Self) else OutlookBar.UpdateItem(nil);
end;

function TOutlookBarItem.GetOwner: TPersistent;
begin
  Result := FOwner;
end;

procedure TOutlookBarItem.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if Source is TOutlookBarItem then
  begin
    FData := TOutlookBarItem(Source).FData;
    FCaption := TOutlookBarItem(Source).FCaption;
    FExpanded := TOutlookBarItem(Source).FExpanded;
    Clear;
    for I := 0 to TOutlookBarItem(Source).Count - 1 do
      Owner.Insert(Self, -1).Assign(TOutlookBarItem(Source)[I]);
    OutlookBar.UpdateItem(Self);
  end else inherited Assign(Source);
end;

procedure TOutlookBarItem.Clear;
var
  i:Integer;
begin
  for i := Count - 1 downto 0 do Items[i].Free;
  FItems.Clear;
end;

function TOutlookBarItem.GetPrev: TOutlookBarItem;
begin
  if Index = 0 then
    if Assigned(Parent) then Result := Parent else Result := nil else
    begin
      Result := GetParentList[Index - 1];
      while Result.Count > 0 do Result := Result[Result.Count - 1];
    end;
end;

function TOutlookBarItem.GetPrevVisible: TOutlookBarItem;
begin
  Result := GetPrev;
  while Assigned(Result) and (not Result.CanVisible) do Result := Result.GetPrev;
end;

function TOutlookBarItem.GetNext: TOutlookBarItem;
var
  p: TOutlookBarItem;
begin
  if Count > 0 then Result := Items[0] else
    if Index = GetParentList.Count - 1 then
    begin
      Result := nil;
      p := Self;
      while (Result = nil) and (p <> nil) do
      begin
        p := p.Parent;
        if Assigned(p) then Result := p.GetNextSibling;
      end;
    end
    else
      Result := GetParentList[Index + 1];
end;

function TOutlookBarItem.GetNextSibling: TOutlookBarItem;
begin
  if index = GetParentList.Count - 1 then
    Result := nil else Result := GetParentList[Index + 1];
end;

function TOutlookBarItem.GetNextVisible: TOutlookBarItem;
begin
  Result := GetNext;
  while Assigned(Result) and (not Result.CanVisible) do Result := Result.GetNext;
end;

{TOutlookBarItems}
constructor TOutlookBarItems.Create(AOwner: TOutlookBarPage);
begin
  inherited Create;
  FOwner := AOwner;
  FItems := TList.Create;
end;

destructor TOutlookBarItems.Destroy;
begin
  Clear;
  FItems.Free;
  inherited Destroy;
end;

function TOutlookBarItems.GetCount:Integer;
begin
  Result := FItems.Count;
end;

function TOutlookBarItems.GetItem(Index: Integer): TOutlookBarItem;
begin
  Result := FItems[Index];
end;

procedure TOutlookBarItems.SetItem(Index: Integer; Value: TOutlookBarItem);
begin
  Items[Index].Assign(Value);
end;

function TOutlookBarItems.GetPage: TOutlookBarPage;
begin
  Result := FOwner;
end;

procedure TOutlookBarItems.Assign(Source: TPersistent);
var
  I: Integer;
begin
  if Source is TOutlookBarItems then
  begin
    Clear;
    for I := 0 to TOutlookBarItems(Source).Count - 1 do
      Insert(nil, -1).Assign(TOutlookBarItems(Source)[I]);
    Exit;
  end;
  if Source is TOutlookBarItem then
  begin
    Clear;
    for I := 0 to TOutlookBarItem(Source).Count - 1 do
      Insert(nil, -1).Assign(TOutlookBarItem(Source)[I]);
    Exit;
  end;
  inherited Assign(Source);
end;

function TOutlookBarItems.Insert(Parent: TOutlookBarItem; Index: Integer): TOutlookBarItem;
begin
  Result := TOutlookBarItem.Create(Self);
  Result.FParent := Parent;
  if index = -1 then
    if Assigned(Parent) then Parent.FItems.Add(Result) else FItems.Add(Result)
  else
    if Assigned(Parent) then Parent.FItems.Insert(Index, Result) else FItems.Insert(Index, Result)
end;

procedure TOutlookBarItems.Clear;
var
  i:Integer;
begin
  for i := FItems.Count - 1 downto 0 do TObject(FItems[i]).Free;
  FItems.Clear;
end;

function TOutlookBarItems.GetVisibleItem(Index:Integer): TOutlookBarItem;
begin
  if Count = 0 then Result := nil else
  begin
    Result := Items[0];
    if not Result.CanVisible then Result := Result.GetNextVisible;
    while (Index > 0) and Assigned(Result) do
    begin
      Result := Result.GetNextVisible;
      Dec(Index);
    end;
  end;
end;

{function TOutlookBarItems.GetItemOfAll(Index:Integer): TOutlookBarItem;
var
  i:Integer;
begin
  if Count = 0 then Result := nil else
  begin
    Result := Items[0];
    for i := 0 to Index - 1 do
    begin
      Result := Result.GetNext;
      if Result = nil then Break;
    end;
  end;
end;}

{TOutlookBarPage}
constructor TOutlookBarPage.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  FItems := TOutlookBarItems.Create(Self);
end;

destructor TOutlookBarPage.Destroy;
begin
  if OutlookBar.PageIndex = Index then if (Index = Owner.Count - 1) and (Index <> 0) then
    OutlookBar.PageIndex := Index - 1;
  FItems.Free;
  inherited Destroy;
end;

function TOutlookBarPage.GetPages:TOutlookBarPages;
begin
  Result := TOutlookBarPages(Collection);
end;

function TOutlookBarPage.GetOutlookBar:TCustomOutlookBar;
begin
  Result := Owner.Owner;
end;

function TOutlookBarPage.GetTitleRect: TRect;
var
  aw, ah: Integer;
begin
  if IsRectEmpty(FTitleRect) then
  begin
    Owner.Owner.MeasurePageTitle(Self, aw, ah);
    if Index <= Owner.Owner.PageIndex then
    begin
      if Index = 0 then
        Result := Classes.Rect(0, 0, Owner.Owner.ClientWidth, ah)
      else
      begin
        Result := Owner[Index - 1].GetTitleRect;
        with Result do
        begin
          Top := Bottom;
          Inc(Bottom, ah);
        end;
      end;
    end
    else
    begin
      if Index = Owner.Count - 1 then
        with Owner.Owner do
          Result := Classes.Rect(0, ClientHeight - ah, ClientWidth, ClientHeight)
      else
      begin
        Result := Owner[Index + 1].GetTitleRect;
        with Result do
        begin
          Bottom := Top;
          Dec(Top, ah);
        end;
      end;
    end;
  end
  else
    Result := FTitleRect;
end;

procedure TOutlookBarPage.SetCaption(Value: string);
begin
  FCaption := Value;
  OutlookBar.UpdatePage(Self);
end;

procedure TOutlookBarPage.SetItems(Value: TOutlookBarItems);
begin
  FItems.Assign(Value);
end;

{TOutlookBarPages}
function TOutlookBarPages.GetOutlookBar:TCustomOutlookBar;
begin
  Result := FOutlookBar;
end;

constructor TOutlookBarPages.Create(AOwner: TCustomOutlookBar);
begin
  inherited Create(TOutlookBarPage);
  FOutlookBar := AOwner;
end;

function TOutlookBarPages.GetItem(Index: Integer): TOutlookBarPage;
begin
  Result := TOutlookBarPage(inherited Items[Index]);
end;

procedure TOutlookBarPages.SetItem(Index: Integer; Value: TOutlookBarPage);
begin
  inherited Items[Index] := Value;
end;

function TOutlookBarPages.GetOwner: TPersistent;
begin
  Result := FOutlookBar;
end;

procedure TOutlookBarPages.Update(Item: TCollectionItem);
var
  I: Integer;
begin
  for I := 0 to Count - 1 do SetRectEmpty(Items[I].FTitleRect); //?????
  Owner.UpdatePage(TOutlookBarPage(Item));
end;

function TOutlookBarPages.Add: TOutlookBarPage;
begin
  Result := TOutlookBarPage(inherited Add);
end;

{TCustomOutlookBar}
constructor TCustomOutlookBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FVisibleItems := TList.Create;
  ControlStyle := ControlStyle + [csOpaque, csReplicatable, csDisplayDragImage];
  FLargeChangeLink := TChangeLink.Create;
  FSmallChangeLink := TChangeLink.Create;
  FPages:=TOutlookBarPages.Create(Self);
  ParentColor := False;
  Color := clAppWorkSpace;

  SetBounds(0, 0, 120, 200);
end;

destructor TCustomOutlookBar.Destroy;
begin
  FPages.Free;
  FLargeChangeLink.Free;
  FSmallChangeLink.Free;
  FVisibleItems.Free;
  inherited Destroy;
end;

function TCustomOutlookBar.CanScrollUp:Boolean;
begin
  Result := (Pages.Count > 0) and not FAnimating and (Pages[PageIndex].FOffset > 0);
end;

function TCustomOutlookBar.CanScrollDown:Boolean;
begin
  Result := not FAnimating and Assigned(GetItemAt(1, GetWorkArea.Bottom-1)); //À„∑®≤ª∫√
end;

const
  ScrollButtonIndent = 8;

function TCustomOutlookBar.GetScrollUpRect: TRect;
begin
  SetRectEmpty(Result);
  if (Pages.Count = 0) or not CanScrollUp then Exit;
  Result := GetWorkArea;
  with Result do
  begin
    Dec(Right, ScrollButtonIndent);
    Inc(Top, ScrollButtonIndent);
    Result.Left := Result.Right - GetSystemMetrics(SM_CXVSCROLL);
    Result.Bottom := Result.Top + GetSystemMetrics(SM_CYVSCROLL);
  end;
end;

function TCustomOutlookBar.GetScrollDownRect: TRect;
begin
  SetRectEmpty(Result);
  if (Pages.Count = 0) or not CanScrollDown then Exit;
  Result := GetWorkArea;
  with Result do
  begin
    Dec(Right, ScrollButtonIndent);
    Dec(Bottom, ScrollButtonIndent);
    Result.Left := Result.Right - GetSystemMetrics(SM_CXVSCROLL);
    Result.Top := Result.Bottom - GetSystemMetrics(SM_CYVSCROLL);
  end;
end;

procedure TCustomOutlookBar.DrawScrollButtons;
begin
  if CanScrollUp then
    if FScrollUpDown then
      DrawFrameControl(Canvas.Handle, GetScrollUpRect,DFC_SCROLL,DFCS_SCROLLUP or DFCS_PUSHED)
    else
      DrawFrameControl(Canvas.Handle, GetScrollUpRect,DFC_SCROLL,DFCS_SCROLLUP);
  if CanScrollDown then
    if FScrollDownDown then
      DrawFrameControl(Canvas.Handle, GetScrollDownRect,DFC_SCROLL,DFCS_SCROLLDown or DFCS_PUSHED)
    else
      DrawFrameControl(Canvas.Handle, GetScrollDownRect,DFC_SCROLL,DFCS_SCROLLDown);
end;

procedure TCustomOutlookBar.ScrollUp;
begin
  with Pages[PageIndex] do
    if FOffset <> 0 then Dec(FOffset);
  UpdateItem(nil);
end;

procedure TCustomOutlookBar.ScrollDown;
begin
  Inc(Pages[PageIndex].FOffset);
  UpdateItem(nil);
end;

procedure TCustomOutlookBar.SetPages(Value: TOutlookBarPages);
begin
  FPages.Assign(Value);
end;

procedure TCustomOutlookBar.SetPageIndex(Value: Integer);
  procedure Ani(pOrgin, pNew: TOutlookBarPage);
  const
    AniTime = 100;
    AniStep = 20;
    AniStepTiem = AniTime div AniStep;
  var
    i, ATop, dy: Integer;
    rt, rtbm: TRect;
    bm: TBitmap;
  begin
    if pOrgin.Index < pNew.Index then
    begin
      rtbm := GetWorkArea;
      rt.TopLeft := rtbm.TopLeft;
      rt.BottomRight := GetPageTitleRect(PNew).BottomRight;
      rtbm.Top := rtbm.Bottom;
      rtbm.Bottom := rt.Bottom;
      dy := -1;
    end
    else
    begin
      rtbm := GetWorkArea;
      rt.TopLeft := GetPageTitleRect(pNew).BottomRight;
      rt.Left := 0;
      rt.BottomRight := rtbm.BottomRight;
      rtbm.Bottom := rtbm.Top;
      rtbm.Top := rt.Top;
      dy := 1;
    end;
    bm := TBitmap.Create;
    try
      bm.Width := ClientWidth;
      bm.Height := rtbm.Bottom - rtbm.Top;
      bm.Canvas.CopyRect(Rect(0,0,bm.Width,bm.Height), Canvas, rtbm);
      if dy = 1 then
      begin
        Atop := rt.Top;
        rtbm.Bottom := rtbm.Top;
      end
      else
      begin
        ATop := rt.Bottom - bm.Height;
        rtbm.Top := rtbm.Bottom;
      end;
      dy := dy * ((rt.Bottom - rt.Top) div AniStep);
      for i := 0 to AniStep - 1 do
      begin
//        DrawItems(PNew, rtbm);
        Canvas.Brush.Color := Color;
        Canvas.FillRect(rtbm);
        Canvas.Draw(rt.Left, ATop, bm);
        if dy > 0 then
        begin
          Inc(rtbm.Bottom, dy);
        end
        else
        begin
          Inc(rtbm.Top, dy);
        end;
        Inc(ATop,dy);
        SleepEx(AniStepTiem, False);
      end;
    finally
      bm.Free;
    end;
  end;
begin
  if Value <> FPageIndex then
  begin
    if HandleAllocated then
    begin
      FAnimating := True;
      Ani(Pages[FPageIndex], Pages[Value]);
      FAnimating := False;
    end;
    FPageIndex := Value;
    Invalidate; //????
  end;
end;

procedure TCustomOutlookBar.SetLargeImages(Value: TCustomImageList);
begin
  if LargeImages <> nil then
    LargeImages.UnRegisterChanges(FLargeChangeLink);
  FLargeImages := Value;
  if LargeImages <> nil then
  begin
    LargeImages.RegisterChanges(FLargeChangeLink);
    LargeImages.FreeNotification(Self);
  end;
  Invalidate;
end;

procedure TCustomOutlookBar.SetSmallImages(Value: TCustomImageList);
begin
  if SmallImages <> nil then
    SmallImages.UnRegisterChanges(FSmallChangeLink);
  FSmallImages := Value;
  if SmallImages <> nil then
  begin
    SmallImages.RegisterChanges(FSmallChangeLink);
    SmallImages.FreeNotification(Self);
  end;
  Invalidate;
end;

procedure TCustomOutlookBar.CMMouseLeave(var Message:TMessage);
begin
  inherited;
  MouseMove([], -1, -1)
end;

procedure TCustomOutlookBar.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  with Params do
  begin
    WindowClass.style := WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
  end;
end;

procedure TCustomOutlookBar.SetBounds(ALeft, ATop, AWidth, AHeight: Integer);
var
  ow, oh:Integer;
  rt: TRect;
begin
  ow := Width;
  oh := Height;
  inherited;
  if ow <> AWidth then
  begin
    Invalidate;
    Exit;
  end;
  if oh = Height then Exit;
  if oh < Height then
  begin
    Invalidate;
  end
  else
  begin
    rt := GetWorkArea;
    if CanScrollDown then rt.Top := GetScrollDownRect.Top
      else rt.Top := rt.Bottom;
    rt.Bottom := ClientHeight;
  end;
  RedrawWindow(Handle, @rt, 0, RDW_INVALIDATE);
end;

procedure TCustomOutlookBar.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  m: TOutlookBarItem;
  p: TOutlookBarPage;
  ds: TDrawOutlookBarPageTitleBorderStyle;
begin
  if (Pages.Count = 0) or (Button <> mbLeft) then
  begin
    inherited;
    Exit;
  end;
  if ptinRect(GetWorkArea, Point(X, Y)) then
  begin
    if CanScrollDown and ptInRect(GetScrollDownRect,Point(X, Y)) then
    begin
      FScrollDownDown := True;
      DrawScrollButtons;
    end else
      if CanScrollUp and ptInRect(GetScrollUpRect,Point(X, Y)) then
      begin
        FScrollUpDown := True;
        DrawScrollButtons;
      end else
      begin
        m := GetItemAt(X, Y);
        if Assigned(m) and ptInRect(GetItemBorderRect(m, GetItemRect(m), True),Point(X, Y)) then
        begin
          m.FDown := True;
          DrawItemBorder(m, GetItemRect(m), [dsRedraw]);
        end;
      end;
  end
  else
  begin
    p := GetPageAt(X, Y);
    if Assigned(p) and (p.Index <> PageIndex) then
    begin
      ds:=[dsDown];
      p.FDown := True;
      DrawPageTitleBorder(p, GetPageTitleRect(p), ds);
    end;
  end;
  inherited;
end;

procedure TCustomOutlookBar.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  ds: TDrawOutlookBarPageTitleBorderStyle;
  p: TOutlookBarPage;
  im: TOutlookBarItem;
  i, pi: Integer;
  rt: TRect;
begin
  inherited;
  if Pages.Count = 0 then Exit;
  for i := 0 to Pages.Count - 1 do
  begin
    if Pages[i].FDown then
    begin
      p:=Pages[i];
      if ptinRect(GetPageTitleRect(p), Point(X, Y)) then ds := [dsDown] else ds := [dsHot];
      DrawPageTitleBorder(p, GetPageTitleRect(p), ds);
      Exit;
    end;
  end;
  im := GetFirstVisibleItem;
  while Assigned(im) do
  begin
    if im.FDown then
    begin
      if ptInRect(GetItemBorderRect(im, GetItemRect(im), True),Point(X, Y)) then ds := [dsDown] else ds := [dsHot];
      DrawItemBorder(im, GetItemRect(im), ds);
      Exit;
    end;
    im := im.GetNextVisible;
  end;
  rt := GetWorkArea;
  if ptinRect(rt, Point(X, Y)) then
  begin
    Cursor := crDefault;
    if FScrollUpDown then
      if ptInRect(GetScrollUpRect,Point(X, Y)) then
        DrawFrameControl(Canvas.Handle, GetScrollUpRect,DFC_SCROLL,DFCS_SCROLLUP or DFCS_PUSHED)
      else
        DrawFrameControl(Canvas.Handle, GetScrollUpRect,DFC_SCROLL,DFCS_SCROLLUP)
    else
      if FScrollDownDown then
        if ptInRect(GetScrollDownRect,Point(X, Y)) then
          DrawFrameControl(Canvas.Handle, GetScrollDownRect,DFC_SCROLL,DFCS_SCROLLDown or DFCS_PUSHED)
        else
          DrawFrameControl(Canvas.Handle, GetScrollDownRect,DFC_SCROLL,DFCS_SCROLLDown);
  end else Cursor := crHandPoint;
  if Flat then
  begin
    p := GetPageAt(X, Y);
    if Assigned(p) then pi := p.Index else pi := -1;
    for i := 0 to Pages.Count - 1 do
    begin
      if (pi = i) and (i <> PageIndex) then
        ds := [dsFlat, dsHot] else ds := [dsFlat];
      DrawPageTitleBorder(Pages[i], GetPageTitleRect(Pages[i]), ds);
    end;

    im := Pages[PageIndex].Items.GetVisibleItem(Pages[PageIndex].FOffset);
    while Assigned(im) and (GetItemRect(im).Top < rt.Bottom) do
    begin
      if ptinRect(rt, Point(X, Y)) and ptinRect(GetItemBorderRect(im, GetItemRect(im), True), Point(X, Y)) then
        ds := [dsFlat, dsHot] else ds := [dsFlat];
      DrawItemBorder(im, GetItemRect(im), ds);
      im := im.GetNextVisible;
    end;
  end;
end;

procedure TCustomOutlookBar.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  p: TOutlookBarPage;
  i: Integer;
  im: TOutlookBarItem;
  ds: TDrawOutlookBarPageTitleBorderStyle;
begin
  inherited;
  if Pages.Count = 0 then Exit;
  for i := 0 to Pages.Count - 1 do
  begin
    if Pages[i].FDown then
    begin
      p:=Pages[i];
      p.FDown := False;
      if ptinRect(GetPageTitleRect(p), Point(X, Y)) then
      begin
        ds:=[dsHot];
        ClickPageTitle(p);
      end
      else
        ds:=[dsRedraw];
      DrawPageTitleBorder(p, GetPageTitleRect(p), ds);
      Exit;
    end;
  end;
  im := GetFirstVisibleItem;
  while Assigned(im) do
  begin
    if im.FDown then
    begin
      im.FDown := False;
      if ptInRect(GetItemBorderRect(im, GetItemRect(im), True),Point(X, Y)) then
      begin
        ds := [dsHot];
        im.Expanded := (not im.Expanded) and (im.Count > 0);
        ClickItem(im);
      end
      else
        ds:=[dsRedraw];
      DrawItemBorder(im, GetItemRect(im), ds);
      Exit;
    end;
    im := im.GetNextVisible;
  end;
  if ptinRect(GetWorkArea, Point(X, Y)) then
  begin
    if FScrollUpDown or FScrollDownDown then
    begin
      if FScrollUpDown then
      begin
        FScrollUpDown := False;
        if ptinRect(GetScrollUpRect, Point(X, Y)) then ScrollUp;
      end;
      if FScrollDownDown then
      begin
        FScrollDownDown := False;
        if ptinRect(GetScrollDownRect, Point(X, Y)) then ScrollDown;
      end;
      DrawScrollButtons;
    end;
  end;
end;

procedure TCustomOutlookBar.Paint;
var
  rt: TRect;
  i: Integer;
  ps, pe: TOutlookBarPage;
begin
  if Pages.Count = 0 then
  begin
    rt := Canvas.ClipRect;
    Brush.Color := Color;
    Canvas.FillRect(rt);
  end
  else
  begin
    rt := Canvas.ClipRect;
    ps := GetPageAt(rt.Left, rt.Top);
    if ps = nil then ps := Pages[0];
    pe := GetPageAt(rt.Right, rt.Bottom);
    if pe = nil then if ptinRect(GetWorkArea, rt.BottomRight) then
      pe := Pages[PageIndex] else pe := Pages[Pages.Count - 1];
    for i := ps.Index to pe.Index do
    begin
      DrawPageTitle(Pages[i], GetPageTitleRect(Pages[i]));
    end;
    DrawItems(rt);
  end;
end;

procedure TCustomOutlookBar.LayoutChanged;
var
  I, T, W, H: Integer;
begin
  FWorkArea := ClientRect;
  if Pages.Count = 0 then Exit;
  MeasurePageTitle(Pages[0], W, H);
//  Pages[0].FRect := Rect(0, 0, ClientWidth, H);
  T := H;
  for I := 1 to FPageIndex do
  begin
    MeasurePageTitle(Pages[I], W, H);
//    Pages[I].FRect := Rect(0, T, ClientWidth, T + H);
    Inc(T, H);
  end;
  for I := Pages.Count - 1 downto FPageIndex + 1 do
  begin
  end;
end;

procedure TCustomOutlookBar.ClickPageTitle(Page: TOutlookBarPage);
begin
  PageIndex := Page.Index;
  if Assigned(FOnPageChange) then FOnPageChange(Self);
end;

procedure TCustomOutlookBar.ClickItem(Item: TOutlookBarItem);
begin
  if Assigned(OnItemClick) then OnItemClick(Self, Item);
end;

function TCustomOutlookBar.GetWorkArea: TRect;
begin
  if Pages.Count = 0 then Result := ClientRect else
  begin
    Result := GetPageTitleRect(Pages[PageIndex]);
    Result.Left := 0;
    Result.Right := ClientWidth;
    Result.Top := Result.Bottom;
    if PageIndex = Pages.Count - 1 then
      Result.Bottom := ClientHeight else
        Result.Bottom := GetPageTitleRect(Pages[PageIndex+1]).Top;
  end;
end;

function TCustomOutlookBar.GetPageTitleRect(Page: TOutlookBarPage): TRect;
var
  aw, ah: Integer;
begin
  MeasurePageTitle(Page, aw, ah);
  if Page.Index <= PageIndex then
  begin
    if Page.Index = 0 then
      Result := Classes.Rect(0, 0, ClientWidth, ah)
    else
    begin
      Result := GetPageTitleRect(Pages[Page.Index - 1]);
      with Result do
      begin
        Top := Bottom;
        Inc(Bottom, ah);
      end;
    end;
  end
  else
  begin
    if Page.Index = Pages.Count - 1 then
      Result := Classes.Rect(0, ClientHeight - ah, ClientWidth, ClientHeight)
    else
    begin
      Result := GetPageTitleRect(Pages[Page.Index + 1]);
      with Result do
      begin
        Bottom := Top;
        Dec(Top, ah);
      end;
    end;
  end;
end;

const
  ItemIndent = 4;

function TCustomOutlookBar.GetItemRect(Item: TOutlookBarItem): TRect;
var
  aw, ah, oh, i: Integer;
  p: TOutlookBarItem;
begin
  SetRectEmpty(Result);
//  if Item.Page.Index <> PageIndex then Exit;
  if Item = Item.Page.Items.GetVisibleItem(0) then
  begin
    oh := 0;
    p := Item;
    for i := 0 to Pages[PageIndex].FOffset - 1 do
    begin
      MeasureItem(p, aw, ah);
      Inc(oh, ah);
      p:=p.GetNextVisible;
      if not Assigned(p) then Break;
    end;
    MeasureItem(Item, aw, ah);
    Result := GetWorkArea;
    with Result do
    begin
//      Inc(Left);
//      Dec(Right);
      Top := Top + ItemIndent;
      Bottom := Top + ah -  oh;
    end;
  end
  else
  begin
    MeasureItem(Item, aw, ah);
    p := Item.GetPrevVisible;
    if Assigned(p) then
    begin
      Result := GetItemRect(p);
      Result.Top := Result.Bottom;
      Result.Bottom := Result.Top + ah;
    end;
  end;
//  case Item.Page.IconStyle of
//    isLarge:
//    with Result do
//    begin
//      Inc(Left, (Right - Left - aw) div 2 - 2);
//      Inc(Top, (Bottom - Top - ah) div 2 - 2);
//      Right := Left + aw + 4;
//      Bottom := Top + ah + 4;
//    end;
//    isSmall: with Result do Right := Left + ItemIndent * 2;
//  end;
end;

function TCustomOutlookBar.GetItemBorderRect(Item: TOutlookBarItem; ARect: 
    TRect; IncludeCaption: Boolean = False): TRect;
var
  i, lb, tb, lt, tt: Integer;
  s: TSize;
  ml: TCustomImageList;
begin
  ml := nil;
  Canvas.Font := Font;
  s := Canvas.TextExtent(Item.Caption);
  case Item.Page.IconStyle of
    isLarge:
    begin
      i := ARect.Right - ARect.Left;
      tb := ItemIndent + ARect.Top;
      lt := (i - s.Cx) div 2 + ARect.Left;
      if Assigned(LargeImages) then
      begin
        ml := LargeImages;
        tt := tb + LargeImages.Height + ItemIndent;
        lb := (i - LargeImages.Width) div 2 + ARect.Left;
      end
      else
      begin
        tt := tb;
        lb := 0;
      end;
    end;
    isSmall:
    begin
      i := ARect.Bottom - ARect.Top;
      lb := ItemIndent + ARect.Left;
      tt := (i - s.Cy) div 2 + ARect.Top;
      if Assigned(SmallImages) then
      begin
        ml := SmallImages;
        lt := lb + SmallImages.Height + ItemIndent;
        tb := (i - SmallImages.Height) div 2 + ARect.Top;
        s := Canvas.TextExtent(Item.Caption);
      end
      else
      begin
        lt := lb;
        tb := 0;
      end;
    end;
  else
    lt := 0;
    tt := 0;
    lb := 0;
    tb := 0;
  end;
  if Assigned(ml) then
  begin
    Result.Left := lb - 2;
    Result.Top := tb - 2;
    Result.Right := Result.Left + ml.Width + 4;
    Result.Bottom := Result.Top + ml.Height + 4;
    if IncludeCaption then
      case Item.Page.IconStyle of
        isLarge:;
        isSmall: Result.Right := Result.Right + s.cx + 4;
      end;
  end
  else
  begin
    Result.Left := lt - 2;
    Result.Top := tt - 2;
    Result.Right := Result.Left + s.cx + 4;
    Result.Bottom := Result.Top + s.cy + 4;
  end;
  OffsetRect(Result, Item.Level shl 4, 0);
end;

procedure TCustomOutlookBar.DrawPageTitle(Page:TOutlookBarPage; const ARect:TRect);
var
  s:TSize;
begin
  with Canvas do
  begin
    Brush.Color := clBtnFace; //????
    Canvas.Font := Font;
    Canvas.Font.Color := clBtnText;
    s := TextExtent(Page.Caption);
    with ARect Do
      TextRect(ARect, Left + (Right - Left - s.Cx) div 2,
        Top + (Bottom - Top - s.Cy) div 2, Page.Caption);
  end;
  DrawPageTitleBorder(Page, ARect,[dsRedraw]);
end;

procedure TCustomOutlookBar.DrawPageTitleBorder(Page:TOutlookBarPage; const ARect:TRect; ADrawStyle: TDrawOutlookBarPageTitleBorderStyle);
var
  pt:TPoint;
  rt:TRect;
begin
//  if (Page.FLastDrawTitleBorderStyle = ADrawStyle) and not (dsRedraw in ADrawStyle) then Exit;
  Page.FLastDrawTitleBorderStyle := ADrawStyle;
  if dsRedraw in Page.FLastDrawTitleBorderStyle then
  begin
    Page.FLastDrawTitleBorderStyle := [];
    if Flat then Include(Page.FLastDrawTitleBorderStyle, dsFlat);
    if Page.FDown then Include(Page.FLastDrawTitleBorderStyle, dsDown);
    GetCursorPos(pt);
    pt := ScreenToClient(pt);
    if ptinRect(rt, pt) then Include(Page.FLastDrawTitleBorderStyle, dsHot);
  end;
  rt := ARect;
  Canvas.Brush.Color := clBtnface; //????
  Canvas.FrameRect(rt);
  InflateRect(rt, -1, -1);
  Canvas.FrameRect(rt);
  //…æ≥˝±ﬂøÚ

  rt := ARect;
  if dsDown in Page.FLastDrawTitleBorderStyle then
  begin
    DrawEdge(Canvas.Handle, rt, BDR_SUNKENINNER, BF_TOPLEFT);
    DrawEdge(Canvas.Handle, rt, BDR_SUNKENOUTER, BF_BOTTOMRIGHT);
    InflateRect(rt, -1, -1);
    DrawEdge(Canvas.Handle, rt, BDR_SUNKENOUTER, BF_TOPLEFT);
    DrawEdge(Canvas.Handle, rt, BDR_SUNKENINNER, BF_BOTTOMRIGHT);
  end
  else
    if dsFlat in Page.FLastDrawTitleBorderStyle then
    begin
      if dsHot in Page.FLastDrawTitleBorderStyle then
      begin
        DrawEdge(Canvas.Handle, rt, BDR_RAISEDINNER, BF_TopLeft);
        DrawEdge(Canvas.Handle, rt, BDR_RAISEDOuter, BF_BottomRight);
        InflateRect(rt, -1, -1);
        DrawEdge(Canvas.Handle, rt, BDR_RAISEDInner, BF_BottomRight);
      end
      else
      begin
        DrawEdge(Canvas.Handle, rt, BDR_RAISEDINNER, BF_RECT);
        InflateRect(rt, -1, -1);
      end;
    end
    else
      DrawEdge(Canvas.Handle, rt, EDGE_RAISED, BF_RECT);
end;

procedure TCustomOutlookBar.DrawItems(const ARect: TRect);
var
  rt, wkrt, irt: TRect;
  n: TOutlookBarItem;
  orgn, rgn: HRGN;
begin
  wkrt := GetWorkArea;
  IntersectRect(rt, ARect, wkrt);
  if IsRectEmpty(rt) then Exit;
  Canvas.Brush.Color := Color;
  Canvas.FillRect(rt);
  if Pages.Count = 0 then Exit;
  n := GetItemAt(ARect.Left, ARect.Top);
  if not Assigned(n) then n := Pages[PageIndex].Items.GetVisibleItem(Pages[PageIndex].FOffset);
  orgn := CreateRectRgnIndirect(rt);
  rgn := CreateRectRgnIndirect(rt);
  try
    GetClipRgn(Canvas.Handle, orgn);
    SelectClipRgn(Canvas.Handle, rgn);
    while Assigned(n) do
    begin
      irt := GetItemRect(n);
      if irt.Top > rt.Bottom then Break;
      DrawItem(n, irt);
      DrawItemBorder(n, irt, [dsRedraw]);
      n := n.GetNextVisible;
    end;
    SelectClipRgn(Canvas.Handle, orgn);
  finally
    DeleteObject(rgn);
    DeleteObject(orgn);
  end;
  if not FAnimating then DrawScrollButtons;
  DrawEdge(Canvas.Handle, wkrt, BDR_SUNKENINNER, BF_TopLeft);
end;

procedure TCustomOutlookBar.MeasurePageTitle(Page:TOutlookBarPage; var Width, Height: Integer);
var
  S: string;
begin
  if Page.Caption = EmptyStr then S := 'Wg' else S := Page.Caption;
  TextSize(Font, S, Width, Height);
  Inc(Width,8); //????
  Inc(Height,8); //????
end;

procedure TCustomOutlookBar.MeasureItem(Item:TOutlookBarItem; var Width, Height: Integer);
begin
  TextSize(Font, Item.Caption, Width, Height);
  case Item.Page.IconStyle of
    isLarge:
    begin
      if Assigned(LargeImages) then
      begin
        if LargeImages.Width > Width then Width := LargeImages.Width;
        Inc(Height, LargeImages.Height + ItemIndent);
      end;
    end;
    isSmall:
    begin
      if Assigned(SmallImages) then
      begin
        if SmallImages.Height > Height then Height := SmallImages.Height;
        Inc(Width, SmallImages.Width + ItemIndent);
      end;
    end;
  end;
  Inc(Width, ItemIndent shl 1);
  Inc(Height, ItemIndent shl 1);
end;

procedure TCustomOutlookBar.DrawItem(Item:TOutlookBarItem; const ARect: TRect);
var
  i, lb, tb, lt, tt: Integer;
  s: TSize;
  ml: TCustomImageList;
begin
  ml := nil;
  Canvas.Font := Font; //????
  Canvas.Font.Color := clHighLightText;
  s := Canvas.TextExtent(Item.Caption);
  case Item.Page.IconStyle of
    isLarge:
    begin
      i := ARect.Right - ARect.Left;
      tb := ItemIndent + ARect.Top;
      lt := (i - s.Cx) div 2 + ARect.Left;
      if Assigned(LargeImages) then
      begin
        ml := LargeImages;
        tt := tb + LargeImages.Height + ItemIndent;
        lb := (i - LargeImages.Width) div 2 + ARect.Left;
      end
      else
      begin
        tt := tb;
        lb := 0;
      end;
    end;
    isSmall:
    begin
      i := ARect.Bottom - ARect.Top;
      lb := ItemIndent + ARect.Left;
      tt := (i - s.Cy) div 2 + ARect.Top;
      if Assigned(SmallImages) then
      begin
        ml := SmallImages;
        lt := lb + SmallImages.Height + ItemIndent;
        tb := (i - SmallImages.Height) div 2 + ARect.Top;
        s := Canvas.TextExtent(Item.Caption);
      end
      else
      begin
        lt := lb;
        tb := 0;
      end;
    end;
  else
    lt := 0;
    tt := 0;
    lb := 0;
    tb := 0;
  end;
  Inc(lb, Item.Level shl 4);
  Inc(lt, Item.Level shl 4);
  if Assigned(ml) then ml.Draw(Canvas, lb, tb, Item.ImageIndex);
  Canvas.TextOut(lt, tt, Item.Caption);
//  DrawItemBorder(Item, ARect, [dsRedraw]);
end;

procedure TCustomOutlookBar.DrawItemBorder(Item: TOutlookBarItem; const ARect: TRect; ADrawStyle: TDrawOutlookBarPageTitleBorderStyle);
var
  rt: TRect;
  pt: TPoint;
//  orgn, rgn:HRGN;
begin
  if (Item.FLastDrawBorderStyle = ADrawStyle) and not (dsRedraw in ADrawStyle) then Exit;
  rt := GetItemBorderRect(Item, ARect);
  Item.FLastDrawBorderStyle := ADrawStyle;
  if dsRedraw in Item.FLastDrawBorderStyle then
  begin
    Item.FLastDrawBorderStyle := [];
    if Flat then Include(Item.FLastDrawBorderStyle, dsFlat);
    if Item.FDown then Include(Item.FLastDrawBorderStyle, dsDown);
    GetCursorPos(pt);
    pt := ScreenToClient(pt);
    if ptinRect(rt, pt) then Include(Item.FLastDrawBorderStyle, dsHot);
  end;

  if Item.Expanded then Include(Item.FLastDrawBorderStyle, dsDown);

//  GetClipRgn(Canvas.Handle, orgn);
//  rgn := CreateRectRgnIndirect(GetWorkArea);
//  SelectClipRgn(Canvas.HAndle, rgn);
  with GetWorkArea do IntersectClipRect(Canvas.Handle, Left, Top, Right, Bottom);

  if dsDown in Item.FLastDrawBorderStyle then
    DrawEdge(Canvas.Handle, rt, BDR_SUNKENINNER, BF_RECT)
  else
    if dsFlat in Item.FLastDrawBorderStyle then
    begin
      if dsHot in Item.FLastDrawBorderStyle then
        DrawEdge(Canvas.Handle, rt, BDR_RAISEDOUTER, BF_RECT)
      else
      begin
        Canvas.Brush.Color := Color;
        Canvas.FrameRect(rt);
      end;
    end
    else
      DrawEdge(Canvas.Handle, rt, BDR_RAISEDOUTER, BF_RECT);
//      DrawEdge(Canvas.Handle, rt, EDGE_RAISED, BF_RECT);
//  SelectClipRgn(Canvas.HAndle, orgn);
//  DeleteObject(rgn)
end;

function TCustomOutlookBar.GetPageAt(X, Y: Integer): TOutlookBarPage;
var
  i:Integer;
  rt:TRect;
  pt:TPoint;
  aw,ah:Integer;
begin
  if Pages.Count = 0 then
  begin
    Result := nil;
    Exit;
  end;
  pt := Point(X, Y);
  rt := Rect(0, 0, ClientWidth, ClientHeight);
  for i := Pages.Count - 1 downto PageIndex + 1 do
  begin
    MeasurePageTitle(Pages[i], aw, ah);
    rt.Top := rt.Bottom - ah;
    if ptInRect(rt, pt) then
    begin
      Result := Pages[i];
      Exit;
    end;
    rt.Bottom := rt.Top;
  end;
  rt := Rect(0,0,ClientWidth,0);
  for i := 0 to PageIndex do
  begin
    MeasurePageTitle(Pages[i], aw, ah);
    rt.Bottom := rt.Top + ah;
    if ptInRect(rt, pt) then
    begin
      Result := Pages[i];
      Exit;
    end;
    rt.Top := rt.Bottom;
  end;
  Result := nil;
end;

function TCustomOutlookBar.GetItemAt(X, Y: Integer): TOutlookBarItem;
var
  rt: TRect;
begin
  Result := nil;
  rt := GetWorkArea;
  if not ptinRect(rt, Point(X, Y)) then Exit;
  if Pages.Count = 0 then Exit;
  with Pages[PageIndex] do
  begin
    Result := Items.GetVisibleItem(FOffset);
    if not Assigned(Result) then Exit;
    rt := GetItemRect(Result);
    while not ptInRect(rt, Point(X, Y)) do
    begin
      Result := Result.GetNextVisible;
      if not Assigned(Result) then Exit;
      rt := GetItemRect(Result);
    end;
  end;
end;

function TCustomOutlookBar.GetFirstVisibleItem: TOutlookBarItem;
begin
  Result := nil;
  if (Pages.Count = 0) or (Pages[PageIndex].Items.Count = 0) then Exit;
  Result := Pages[PageIndex].Items[0];
  if not Result.CanVisible then Result := Result.GetNextVisible;
end;

procedure TCustomOutlookBar.UpdateItem(Item: TOutlookBarItem);
var
  rt: TRect;
begin
  if Assigned(Item) then
  begin
    if Item.Page.Index <> PageIndex then Exit;
    rt := GetItemRect(Item);
  end else rt := GetWorkArea;
  RedrawWindow(Handle, @rt, 0, RDW_INVALIDATE);
end;

procedure TCustomOutlookBar.UpdatePage(Page: TOutlookBarPage);
var
  rt: TRect;
begin
  if Assigned(Page) then rt := GetPageTitleRect(Page) else rt := ClientRect;
  RedrawWindow(Handle, @rt, 0, RDW_INVALIDATE);
  if Assigned(Page) and (Page.Index = PageIndex) then UpdateItem(nil);
end;

end.
