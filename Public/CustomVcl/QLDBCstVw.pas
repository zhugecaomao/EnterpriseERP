
 
unit QLDBCstVw;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Buttons, StdCtrls, CheckLst, DB;

type
  TFieldsPickForm = class (TForm)
    bbtCheckAll: TBitBtn;
    bbtMoveDown: TBitBtn;
    bbtMoveUp: TBitBtn;
    Bevel1: TBevel;
    BitBtn1: TBitBtn;
    btnCancel: TButton;
    btnOK: TButton;
    clbFieldList: TCheckListBox;
    Label1: TLabel;
    procedure bbtCheckAllClick(Sender: TObject);
    procedure bbtMoveDownClick(Sender: TObject);
    procedure bbtMoveUpClick(Sender: TObject);
    procedure clbFieldListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure clbFieldListDragOver(Sender, Source: TObject; X, Y: Integer; 
            State: TDragState; var Accept: Boolean);
    procedure clbFieldListDrawItem(Control: TWinControl; Index: Integer; Rect: 
            TRect; State: TOwnerDrawState);
    procedure clbFieldListEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure clbFieldListMouseDown(Sender: TObject; Button: TMouseButton; 
            Shift: TShiftState; X, Y: Integer);
  private
    FDragItemIndex: Integer;
  end;
  
  EDBCustomViewDialogError = class (Exception)
  end;

  TDBFieldSelectDialog = class (TComponent)
  private
    FDataSet: TDataSet;
    FAvailableFields: string;
    FSelectedFields: string;
    FTitle: string;
    procedure SetTitle(const Value: string);
  protected
    procedure DoClose(Form: TFieldsPickForm); virtual;
    procedure DoShow(Form: TFieldsPickForm); virtual;
  public
    function Execute: Boolean; virtual;
  published
    property DataSet: TDataSet read FDataSet write FDataSet;
    property AvailableFields: string read FAvailableFields write FAvailableFields;
    property SelectedFields: string read FSelectedFields write FSelectedFields;
    property Title: string read FTitle write SetTitle;
  end;

  TQLDBCustomViewDialog = class (TDBFieldSelectDialog)
  protected
  public
    function Execute: Boolean; override;
    procedure Apply;
  end;
  
implementation

uses QLConsts, DBConsts;

{$R *.DFM}

resourcestring
  SDataSetNotSet = 'Missing DataSet property';

{ TFieldsPickForm }

{
******************************* TFieldsPickForm ********************************
}
procedure TFieldsPickForm.bbtCheckAllClick(Sender: TObject);
var
  I: Integer;
  AChecked: Boolean;
begin
  inherited;
  AChecked := TBitBtn(Sender).Tag = 1;
  with clbFieldList do
    for I := 0 to Items.Count - 1 do
      Checked[I] := AChecked;
end;

procedure TFieldsPickForm.bbtMoveDownClick(Sender: TObject);
begin
  inherited;
  with clbFieldList do
    if (ItemIndex >= 0) and (ItemIndex < Items.Count - 1) then
      Items.Exchange(ItemIndex, ItemIndex + 1);
end;

procedure TFieldsPickForm.bbtMoveUpClick(Sender: TObject);
begin
  inherited;
  with clbFieldList do
    if ItemIndex > 0 then
      Items.Exchange(ItemIndex, ItemIndex - 1);
end;

procedure TFieldsPickForm.clbFieldListDragDrop(Sender, Source: TObject; X, Y: 
        Integer);
var
  NewIndex: Integer;
begin
  inherited;
  with TCheckListBox(Sender) do
  begin
    NewIndex := ItemAtPos(Point(X, Y), True);
    Items.Move(ItemIndex, NewIndex);
    ItemIndex := NewIndex;
  end;
end;

procedure TFieldsPickForm.clbFieldListDragOver(Sender, Source: TObject; X, Y: 
        Integer; State: TDragState; var Accept: Boolean);
var
  I: Integer;
  Rect: TRect;
begin
  inherited;
  Accept := False;
  if Source = clbFieldList then
    with TCheckListBox(Sender) do
    begin
      I := ItemAtPos(Point(X, Y), True);
      if I = ItemIndex then I := -1;
      Accept := I >= 0;
      if I <> FDragItemIndex then
      begin
        Rect := ItemRect(FDragItemIndex);
        InvalidateRect(Handle, @Rect, False);
        FDragItemIndex := I;
        if FDragItemIndex >= 0 then
        begin
          Rect := ItemRect(FDragItemIndex);
          InvalidateRect(Handle, @Rect, False);
        end;
      end
    end;
end;

procedure TFieldsPickForm.clbFieldListDrawItem(Control: TWinControl; Index: 
        Integer; Rect: TRect; State: TOwnerDrawState);
var
  AState: TOwnerDrawState;
begin
  inherited;
  AState := State;
  with TCheckListBox(Control) do
  begin
    Canvas.FillRect(Rect);
    Canvas.TextOut(Rect.Left + 2, Rect.Top, Items[Index]);
    if ([odFocused] * AState = [odFocused]) or
      (Dragging and (Index = FDragItemIndex)) then
      Canvas.DrawFocusRect(Rect);
  end;
end;

procedure TFieldsPickForm.clbFieldListEndDrag(Sender, Target: TObject; X, Y: 
        Integer);
var
  Rect: TRect;
begin
  inherited;
  with TCheckListBox(Sender) do
  begin
    Rect := ItemRect(FDragItemIndex);
    InvalidateRect(Handle, @Rect, False);
  end;
end;

procedure TFieldsPickForm.clbFieldListMouseDown(Sender: TObject; Button: 
        TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then
  begin
    clbFieldList.BeginDrag(False);
    FDragItemIndex := clbFieldList.ItemIndex;
  end;
end;

{ TQLDBCustomViewDialog }

procedure DBCustomViewDialogError(const Message: string);
begin
  raise EDBCustomViewDialogError.Create(Message);
end;

{
***************************** TDBFieldSelectDialog *****************************
}
procedure TDBFieldSelectDialog.DoClose(Form: TFieldsPickForm);
begin
end;

procedure TDBFieldSelectDialog.DoShow(Form: TFieldsPickForm);
begin
end;

function TDBFieldSelectDialog.Execute: Boolean;
var
  Form: TFieldsPickForm;
  AvailableList, SelectedList: TList;
  I: Integer;
begin
  Result := False;
  if not Assigned(FDataSet) then
    DBCustomViewDialogError(SDataSetNotSet);
  Form := TFieldsPickForm.Create(Self);
  with Form do
    try
      AvailableList := TList.Create;
      try
        FDataSet.GetFieldList(AvailableList, FAvailableFields);
        SelectedList := TList.Create;
        try
          FDataSet.GetFieldList(SelectedList, FSelectedFields);
          with clbFieldList do
            for I := 0 to FDataSet.Fields.Count - 1 do
              if AvailableList.IndexOf(FDataSet.Fields[I]) >= 0 then
                Checked[Items.AddObject(TField(FDataSet.Fields[I]).DisplayLabel, FDataSet.Fields[I])] :=
                  SelectedList.IndexOf(TField(FDataSet.Fields[I])) >= 0;
        finally
          SelectedList.Free;
        end;
      finally
        AvailableList.Free;
      end;
      Self.DoShow(Form);
      Result := ShowModal = mrOK;
      Self.DoClose(Form);
      if Result then
      begin
        SelectedFields := '';
        AvailableFields := '';
        with clbFieldList do
          for I := 0 to Items.Count - 1 do
          begin
            if AvailableFields = '' then
              AvailableFields := TField(Items.Objects[I]).FieldName
            else AvailableFields := AvailableFields + '; ' + TField(Items.Objects[I]).FieldName;
            if Checked[I] then
              if SelectedFields = '' then
                SelectedFields := TField(Items.Objects[I]).FieldName
              else SelectedFields := SelectedFields + '; ' + TField(Items.Objects[I]).FieldName;
          end;
        Result := True;
      end;
    finally
      Free;
    end;
end;

procedure TDBFieldSelectDialog.SetTitle(const Value: string);
begin
  if FTitle <> Value then
  begin
    FTitle := Value;
  end;
end;

{
***************************** TQLDBCustomViewDialog ******************************
}
procedure TQLDBCustomViewDialog.Apply;
var
  AvailableList: TList;
  SelectedList: TList;
  I: Integer;
begin
  AvailableList := TList.Create;
  try
    DataSet.GetFieldList(AvailableList, AvailableFields);
    SelectedList := TList.Create;
    try
      DataSet.GetFieldList(SelectedList, SelectedFields);
      for I := 0 to AvailableList.Count - 1 do
      begin
        TField(AvailableList[I]).Visible := SelectedList.IndexOf(AvailableList[I]) >= 0;
        TField(AvailableList[I]).Index := I;
      end;
    finally
      SelectedList.Free;
    end;
  finally
    AvailableList.Free;
  end;
end;

function TQLDBCustomViewDialog.Execute: Boolean;
var
  I: Integer;
  AvailableList: TList;
begin
  SelectedFields := '';
  AvailableList := TList.Create;
  try
    DataSet.GetFieldList(AvailableList, AvailableFields);
    for I := 0 to AvailableList.Count - 1 do
      if TField(AvailableList[I]).Visible then
        if SelectedFields = '' then SelectedFields := TField(AvailableList[I]).FieldName
        else SelectedFields := SelectedFields + '; ' + TField(AvailableList[I]).FieldName;
  finally
    AvailableList.Free;
  end;
  Result := inherited Execute;
  if Result then Apply;
end;

end.


