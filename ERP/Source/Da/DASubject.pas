unit DASubject;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, ComCtrls, StdCtrls, DB, ADODB;

type
  TDASubjectForm = class(TWSCustomForm)
    PageControl: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    OKButton: TButton;
    CancelButton: TButton;
    AddNewButton: TButton;
    AddSubButton: TButton;
    EditButton: TButton;
    DeleteButton: TButton;
    TreeView1: TTreeView;
    TabSheet5: TTabSheet;
    TreeView2: TTreeView;
    TreeView3: TTreeView;
    TreeView4: TTreeView;
    TreeView5: TTreeView;
    adsSubject: TADODataSet;
    Button1: TButton;
    Button2: TButton;
    procedure PageControlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure OKButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure AddNewButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    function TreeView: TTreeView;
    procedure BuildTreeRoot;
    procedure BuildTreeChild(Node: TTreeNode);
    function GetNewSubCode(const ParentSubCode: string): string;
  public
    { Public declarations }
    class function ShowSelect: Integer;
    class procedure ShowMaintenance;
  end;

implementation

uses CommonDM, DAEdSubject, Math, WSUtils;

{$R *.dfm}

{ TDASubject }

procedure TDASubjectForm.BuildTreeRoot;
var
  TreeNode: TTreeNode;
begin
  with adsSubject do
  begin
    Close;
    CommandText := Format(
      ' SELECT *, (SELECT COUNT(*) FROM DASubject' +
      '   WHERE SubCode LIKE M.SubCode + ''%%''' +
      '     AND LEN(SubCode) = %d) AS ChildCount' +
      ' FROM DASubject M' +
      ' WHERE SubCode LIKE ''%d%%'' AND LEN(SubCode) = 4',
      [7, PageControl.ActivePageIndex + 1]);
    Open;
    while not Eof do
    begin
      TreeNode := TreeView.Items.Add(nil, Format('%-20s %s',
        [adsSubject.FieldByName('SubCode').AsString,
        adsSubject.FieldByName('Name').AsString]));
      TreeNode.Data := Pointer(adsSubject.FieldByName('ID').AsInteger);
      TreeNode.HasChildren := adsSubject.FieldByName('ChildCount').AsInteger > 0;
      Next;
    end;
  end;
  adsSubject.Close;
end;

procedure TDASubjectForm.PageControlChange(Sender: TObject);
begin
  inherited;
  if TreeView.Items.Count = 0 then BuildTreeRoot;
end;

function TDASubjectForm.TreeView: TTreeView;
begin
  case PageControl.ActivePageIndex of
    0: Result := TreeView1;
    1: Result := TreeView2;
    2: Result := TreeView3;
    3: Result := TreeView4;
    else Result := TreeView5;
  end;
end;

procedure TDASubjectForm.FormShow(Sender: TObject);
begin
  inherited;
  PageControl.OnChange(PageControl);
end;

procedure TDASubjectForm.TreeView1Expanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  if Node.Count = 0 then BuildTreeChild(Node);
end;

procedure TDASubjectForm.BuildTreeChild(Node: TTreeNode);
var
  SubCode: string;
  TreeNode: TTreeNode;
begin
  SubCode := Trim(Copy(Node.Text, 1, 20));
  with adsSubject do
  begin
    Close;
    CommandText := Format(
      ' SELECT *, (SELECT COUNT(*) FROM DASubject' +
      '   WHERE SubCode LIKE M.SubCode + ''%%''' +
      '     AND LEN(SubCode) = %d) AS ChildCount' +
      ' FROM DASubject M' +
      ' WHERE SubCode LIKE ''%s%%'' AND LEN(SubCode) = %d',
      [(Node.Level + 3) * 3 + 1, SubCode, (Node.Level + 2) * 3 + 1]);
    Open;
    while not Eof do
    begin
      TreeNode := TreeView.Items.AddChild(Node, Format('%-20s %s',
        [adsSubject.FieldByName('SubCode').AsString,
        adsSubject.FieldByName('Name').AsString]));
      TreeNode.Data := Pointer(adsSubject.FieldByName('ID').AsInteger);
      TreeNode.HasChildren := adsSubject.FieldByName('ChildCount').AsInteger > 0;
      Next;
    end;
  end;
end;

class function TDASubjectForm.ShowSelect: Integer;
begin
  with TDASubjectForm.Create(Application) do
  try
    if ShowModal = mrOK then
    begin
      Result := Integer(TreeView.Selected.Data);
    end
    else Result := -1;
  finally
    Free;
  end;
end;

procedure TDASubjectForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if TreeView.Selected <> nil then ModalResult := mrOK;
end;

procedure TDASubjectForm.EditButtonClick(Sender: TObject);
begin
  inherited;
  if TreeView.Selected <> nil then
    with TDAEdSubjectForm.Create(Application) do
    try
      Edit(Integer(TreeView.Selected.Data));
    finally
      Free;
    end;
end;

procedure TDASubjectForm.AddNewButtonClick(Sender: TObject);

  function GetParentID(ID: Integer): Integer;
  var
    SubCode: string;
  begin
    with TADOCommand.Create(Self) do
    try
      Connection := CommonData.acnConnection;
      CommandText := 'SELECT :Code = SubCode FROM DASubject WHERE ID = ' + IntToStr(ID);
      with Parameters[0] do
      begin
        Direction := pdOutput;
        DataType := ftString;
        Size := 255;
      end;
      Execute;
      SubCode := Parameters[0].Value;
      if Length(SubCode) > 4 then
      begin
        CommandText := 'SELECT :ID = ID FROM DASubject' +
          ' WHERE SubCode = ''' + Copy(SubCode, 1, Length(SubCode) - 3) + '''';
        with Parameters[0] do
        begin
          Direction := pdOutput;
          DataType := ftInteger;
        end;
        Execute;
        Result := Parameters[0].Value;
      end
      else Result := -1
    finally
      Free;
    end;
  end;

  function FindNodeByID(ID: Integer): TTreeNode;
  var
    I: Integer;
  begin
    Result := nil;
    for I := 0 to TreeView.Items.Count - 1 do
      if Integer(TreeView.Items[I].Data) = ID then
      begin
        Result := TreeView.Items[I];
        Exit;
      end;
  end;

var
  ID: Variant;
  ParentID: Integer;
  ParentNode, TreeNode: TTreeNode;
  SubCode: string;
begin
  inherited;
  with TDAEdSubjectForm.Create(Application) do
  try
    if TreeView.Selected <> nil then
    begin
      SubCode := Trim(Copy(TreeView.Selected.Text, 1, 20));
      if TButton(Sender).Tag = 0 then
        SubCode := Copy(SubCode, 1, Length(SubCode) - 3);
    end
    else SubCode := IntToStr(PageControl.ActivePageIndex + 1);
    SubCode := GetNewSubCode(SubCode);
    ID := SubCode;
    if EnterNew(ID) then
    begin
      ParentID := GetParentID(ID);
      if ParentID <> -1 then ParentNode := FindNodeByID(ParentID)
      else ParentNode := nil;
      with adsSubject do
      begin
        Close;
        if ParentNode = nil then
          CommandText := Format(
            ' SELECT *, (SELECT COUNT(*) FROM DASubject' +
            '   WHERE SubCode LIKE M.SubCode + ''%%''' +
            '     AND LEN(SubCode) = %d) AS ChildCount' +
            ' FROM DASubject M' +
            ' WHERE ID = %s', [7, ID])
        else
          CommandText := Format(
            ' SELECT *, (SELECT COUNT(*) FROM DASubject' +
            '   WHERE SubCode LIKE M.SubCode + ''%%''' +
            '     AND LEN(SubCode) = %d) AS ChildCount' +
            ' FROM DASubject M' +
            ' WHERE ID = %s',
            [(ParentNode.Level + 3) * 3 + 1, ID]);
        Open;
        while not Eof do
        begin
          TreeNode := TreeView.Items.AddChild(ParentNode, Format('%-20s %s',
            [adsSubject.FieldByName('SubCode').AsString,
            adsSubject.FieldByName('Name').AsString]));
          TreeNode.Data := Pointer(adsSubject.FieldByName('ID').AsInteger);
          TreeNode.HasChildren := adsSubject.FieldByName('ChildCount').AsInteger > 0;
          Next;
          TreeNode.Selected := True;
        end;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TDASubjectForm.DeleteButtonClick(Sender: TObject);
var
  Node: TTreeNode;
begin
  inherited;
  if TreeView.Selected <> nil then
  begin
    if TreeView.Selected.HasChildren then
      raise Exception.Create('有下级科目存在，不能删除');
    if Application.MessageBox('确实要删除所选科目吗？', PChar(Caption), MB_ICONQUESTION or MB_YESNO) = IDYES then
    begin
      with CommonData.acnConnection do
      begin
        Execute('DELETE DASubject WHERE ID = ' + IntToStr(Integer(TreeView.Selected.Data)));
      end;
      Node := TreeView.Selected;
      TreeView.Selected := Node.Parent;
      Node.Delete;
    end;
  end;
end;

class procedure TDASubjectForm.ShowMaintenance;
begin
  with TDASubjectForm.Create(Application) do
  try
    OKButton.Visible := False;
    CancelButton.Top := OKButton.Top;
    CancelButton.Caption := '关闭';
    ShowModal;
  finally
    Free;
  end;
end;

procedure TDASubjectForm.TreeView1DblClick(Sender: TObject);
begin
  inherited;
  if OKButton.Visible and (TreeView.Selected <> nil) and
    not TreeView.Selected.HasChildren then OKButton.Click;
end;

procedure TDASubjectForm.Button1Click(Sender: TObject);
begin
  inherited;
  CommonData.acnConnection.Execute('EXECUTE sp_FNSyncAllSubject');
  TreeView.Items.BeginUpdate;
  try
    TreeView1.Items.Clear;
    TreeView2.Items.Clear;
    TreeView3.Items.Clear;
    TreeView4.Items.Clear;
    TreeView5.Items.Clear;
    PageControl.OnChange(PageControl);
  finally
    TreeView.Items.EndUpdate;
  end;
end;

function TDASubjectForm.GetNewSubCode(const ParentSubCode: string): string;
begin
  with TADOCommand.Create(Self) do
  try
    Connection := CommonData.acnConnection;
    CommandType := cmdText;
    CommandText := 'SELECT :SubCode = dbo.fn_GetNewSubCode(''' + ParentSubCode + ''')';
    with Parameters[0] do
    begin
      Direction := pdOutput;
      DataType := ftString;
      Size := 255;
      Execute;
      Result := VarToStr(Value);
    end;
  finally
    Free;
  end;
end;

procedure TDASubjectForm.Button2Click(Sender: TObject);
begin
  inherited;
  with adsSubject do
  begin
    Close;
    CommandText :=
      ' SELECT SubCode, Name, DebitCredit,Quantity,AmountD,AmountC, ' +
      '   CASE SubString(SubCode, 1, 1)' +
      '     WHEN 1 THEN ''资产类''' +
      '     WHEN 2 THEN ''负债类''' +
      '     WHEN 3 THEN ''权益类''' +
      '     WHEN 4 THEN ''成本类''' +
      '     WHEN 5 THEN ''损益类''' +
      '   END AS Type' +
      ' FROM DASubject ORDER BY SubCode';
    Open;
    FieldByName('SubCode').DisplayLabel := '科目代码';
    FieldByName('Name').DisplayLabel := '科目名称';
    FieldByName('DebitCredit').DisplayLabel := '余额方向';
    FieldByName('Type').DisplayLabel := '科目类别';
    FieldByName('Quantity').DisplayLabel := '参考数量';
    FieldByName('AmountD').DisplayLabel := '借方金额';
    FieldByName('AmountC').DisplayLabel := '贷方金额';
  end;
  ExportDataSetToExcel(adsSubject, False, Caption, '', '');
end;

end.
