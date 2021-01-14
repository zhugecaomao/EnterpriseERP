unit DAAccountCodes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, ComCtrls, StdCtrls, DB, ADODB;

type
  TDAAccountCodesForm = class(TWSCustomForm)
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
    adsAccountCode: TADODataSet;
    procedure PageControlChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TreeView1Expanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure OKButtonClick(Sender: TObject);
    procedure EditButtonClick(Sender: TObject);
    procedure AddNewButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
    function TreeView: TTreeView;
    procedure BuildTreeRoot;
    procedure BuildTreeChild(Node: TTreeNode);
  public
    { Public declarations }
    class function ShowSelect: Integer;
  end;

implementation

uses CommonDM, DAEdAccountCode, Math;

{$R *.dfm}

{ TDAAccountCodes }

procedure TDAAccountCodesForm.BuildTreeRoot;
var
  TreeNode: TTreeNode;
begin
  with adsAccountCode do
  begin
    Close;
    CommandText := Format(
      ' SELECT *, (SELECT COUNT(*) FROM DAAccountCode' +
      '   WHERE AccountCode LIKE M.AccountCode + ''%%''' +
      '     AND LEN(AccountCode) = %d) AS ChildCount' +
      ' FROM DAAccountCode M' +
      ' WHERE AccountCode LIKE ''%d%%'' AND LEN(AccountCode) = 4',
      [7, PageControl.ActivePageIndex + 1]);
    Open;
    while not Eof do
    begin
      TreeNode := TreeView.Items.Add(nil, Format('%-20s %s',
        [adsAccountCode.FieldByName('AccountCode').AsString,
        adsAccountCode.FieldByName('AccountName').AsString]));
      TreeNode.Data := Pointer(adsAccountCode.FieldByName('ID').AsInteger);
      TreeNode.HasChildren := adsAccountCode.FieldByName('ChildCount').AsInteger > 0;
      Next;
    end;
  end;
  adsAccountCode.Close;
end;

procedure TDAAccountCodesForm.PageControlChange(Sender: TObject);
begin
  inherited;
  if TreeView.Items.Count = 0 then BuildTreeRoot;
end;

function TDAAccountCodesForm.TreeView: TTreeView;
begin
  case PageControl.ActivePageIndex of
    0: Result := TreeView1;
    1: Result := TreeView2;
    2: Result := TreeView3;
    3: Result := TreeView4;
    else Result := TreeView5;
  end;
end;

procedure TDAAccountCodesForm.FormShow(Sender: TObject);
begin
  inherited;
  PageControl.OnChange(PageControl);
end;

procedure TDAAccountCodesForm.TreeView1Expanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  if Node.Count = 0 then BuildTreeChild(Node);
end;

procedure TDAAccountCodesForm.BuildTreeChild(Node: TTreeNode);
var
  AccountCode: string;
  TreeNode: TTreeNode;
begin
  AccountCode := Trim(Copy(Node.Text, 1, 20));
  with adsAccountCode do
  begin
    Close;
    CommandText := Format(
      ' SELECT *, (SELECT COUNT(*) FROM DAAccountCode' +
      '   WHERE AccountCode LIKE M.AccountCode + ''%%''' +
      '     AND LEN(AccountCode) = %d) AS ChildCount' +
      ' FROM DAAccountCode M' +
      ' WHERE AccountCode LIKE ''%s%%'' AND LEN(AccountCode) = %d',
      [(Node.Level + 3) * 3 + 1, AccountCode, (Node.Level + 2) * 3 + 1]);
    Open;
    while not Eof do
    begin
      TreeNode := TreeView.Items.AddChild(Node, Format('%-20s %s',
        [adsAccountCode.FieldByName('AccountCode').AsString,
        adsAccountCode.FieldByName('AccountName').AsString]));
      TreeNode.Data := Pointer(adsAccountCode.FieldByName('ID').AsInteger);
      TreeNode.HasChildren := adsAccountCode.FieldByName('ChildCount').AsInteger > 0;
      Next;
    end;
  end;
end;

class function TDAAccountCodesForm.ShowSelect: Integer;
begin
  with TDAAccountCodesForm.Create(Application) do
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

procedure TDAAccountCodesForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  if TreeView.Selected <> nil then ModalResult := mrOK;
end;

procedure TDAAccountCodesForm.EditButtonClick(Sender: TObject);
begin
  inherited;
  with TDAEdAccountCodeForm.Create(Application) do
  try
    Edit(Integer(TreeView.Selected.Data));
  finally
    Free;
  end;
end;

procedure TDAAccountCodesForm.AddNewButtonClick(Sender: TObject);

  function GetParentID(ID: Integer): Integer;
  var
    AccountCode: string;
  begin
    with TADOCommand.Create(Self) do
    try
      Connection := CommonData.acnConnection;
      CommandText := 'SELECT :Code = AccountCode FROM DAAccountCode WHERE ID = ' + IntToStr(ID);
      with Parameters[0] do
      begin
        Direction := pdOutput;
        DataType := ftString;
        Size := 255;
      end;
      Execute;
      AccountCode := Parameters[0].Value;
      if Length(AccountCode) > 4 then
      begin
        CommandText := 'SELECT :ID = ID FROM DAAccountCode' +
          ' WHERE AccountCode = ''' + Copy(AccountCode, 1, Length(AccountCode) - 3) + '''';
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
begin
  inherited;
  with TDAEdAccountCodeForm.Create(Application) do
  try
    if EnterNew(ID) then
    begin
      ParentID := GetParentID(ID);
      if ParentID <> -1 then ParentNode := FindNodeByID(ParentID)
      else ParentNode := nil;
      with adsAccountCode do
      begin
        Close;
        if ParentNode = nil then
          CommandText := Format(
            ' SELECT *, (SELECT COUNT(*) FROM DAAccountCode' +
            '   WHERE AccountCode LIKE M.AccountCode + ''%%''' +
            '     AND LEN(AccountCode) = %d) AS ChildCount' +
            ' FROM DAAccountCode M' +
            ' WHERE ID = %s', [7, ID])
        else
          CommandText := Format(
            ' SELECT *, (SELECT COUNT(*) FROM DAAccountCode' +
            '   WHERE AccountCode LIKE M.AccountCode + ''%%''' +
            '     AND LEN(AccountCode) = %d) AS ChildCount' +
            ' FROM DAAccountCode M' +
            ' WHERE ID = %s',
            [(ParentNode.Level + 3) * 3 + 1, ID]);
        Open;
        while not Eof do
        begin
          TreeNode := TreeView.Items.AddChild(ParentNode, Format('%-20s %s',
            [adsAccountCode.FieldByName('AccountCode').AsString,
            adsAccountCode.FieldByName('AccountName').AsString]));
          TreeNode.Data := Pointer(adsAccountCode.FieldByName('ID').AsInteger);
          TreeNode.HasChildren := adsAccountCode.FieldByName('ChildCount').AsInteger > 0;
          Next;
          TreeNode.Selected := True;
        end;
      end;
    end;
  finally
    Free;
  end;
end;

procedure TDAAccountCodesForm.DeleteButtonClick(Sender: TObject);
var
  Node: TTreeNode;
begin
  inherited;
  if TreeView.Selected <> nil then
  begin
    if TreeView.Selected.HasChildren then
      raise Exception.Create('有下级科目存在，不能删除');
    if Application.MessageBox('确实要删除所选科目码？', PChar(Caption), MB_ICONQUESTION or MB_YESNO) = IDYES then
    begin
      with CommonData.acnConnection do
      begin
        Execute('DELETE DAAccountCode WHERE ID = ' + IntToStr(Integer(TreeView.Selected.Data)));
      end;
      Node := TreeView.Selected;
      TreeView.Selected := Node.Parent;
      Node.Delete;
    end;
  end;
end;

end.
