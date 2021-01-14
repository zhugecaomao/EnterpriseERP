unit FNRptSubjectDetails;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSBrowse, DB, ADODB, WSDateRangeFm, ComCtrls, Menus, ActnList,
  Grids, DBGrids, QLDBGrid, ExtCtrls, ToolWin;

type
  TFNSubjectDetailsReportform = class(TWSBrowseForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    Panel2: TPanel;
    DateRangeFrame: TWSDateRangeFrame;
    ADODataSet: TADODataSet;
    ADODataSetDate: TDateTimeField;
    ADODataSetCredType: TStringField;
    ADODataSetCredNo: TStringField;
    ADODataSetBrief: TStringField;
    ADODataSetDebit: TBCDField;
    ADODataSetCredit: TBCDField;
    ADODataSetDebitCredit: TStringField;
    ADODataSetBalance: TBCDField;
    TreeView: TTreeView;
    adsSubject: TADODataSet;
    Splitter1: TSplitter;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure TreeViewExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure ADODataSetBeforeOpen(DataSet: TDataSet);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
  private
    { Private declarations }
    procedure BuildTreeRoot;
    procedure BuildTreeChild(Node: TTreeNode);
  public
    { Public declarations }
  end;

implementation

uses CommonDM;

{$R *.dfm}

procedure TFNSubjectDetailsReportform.BuildTreeChild(Node: TTreeNode);
var
  SubCode: string;
  TreeNode: TTreeNode;
begin
  if Node.Level = 0 then SubCode := IntToStr(Node.Index + 1)
  else SubCode := Trim(Copy(Node.Text, 1, Pos('   ', Node.Text) - 1));
  with adsSubject do
  begin
    Close;
    CommandText := Format(
      ' SELECT *, (SELECT COUNT(*) FROM DASubject' +
      '   WHERE SubCode LIKE M.SubCode + ''%%''' +
      '     AND LEN(SubCode) = %d) AS ChildCount' +
      ' FROM DASubject M' +
      ' WHERE SubCode LIKE ''%s%%'' AND LEN(SubCode) = %d',
      [(Node.Level + 2) * 3 + 1, SubCode, (Node.Level + 1) * 3 + 1]);
//    CommandText := Format(
//      ' SELECT *, (SELECT COUNT(*) FROM DASubject' +
//      '   WHERE SubCode LIKE M.SubCode + ''%%''' +
//      '     AND LEN(SubCode) = %d) AS ChildCount' +
//      ' FROM DASubject M' +
//      ' WHERE SubCode LIKE ''%s%%'' AND LEN(SubCode) = %d AND EXISTS' +
//      '   (SELECT * FROM FNCredDetail CD JOIN' +
//      '     FNCredMaster CM ON CD.MasterID = CM.ID JOIN' +
//      '       DASubject S ON CD.GoodsID  = S.ID' +
//      '    WHERE CM.Date BETWEEN ''%s'' AND ''%s'' AND S.SubCode LIKE CM.SubCode + ''%%''',
//      [(Node.Level + 2) * 3 + 1, SubCode, (Node.Level + 1) * 3 + 1,
//      VarToStr(ADODataSet.Parameters.ParamByName('BeginDate').Value),
//      VarToStr(ADODataSet.Parameters.ParamByName('EndDate').Value)]);
//    ShowMessage(CommandText);
    Open;
    while not Eof do
    begin
      TreeNode := TreeView.Items.AddChild(Node, Format('%s   %s',
        [adsSubject.FieldByName('SubCode').AsString,
        adsSubject.FieldByName('Name').AsString]));
      TreeNode.Data := Pointer(adsSubject.FieldByName('ID').AsInteger);
      TreeNode.HasChildren := adsSubject.FieldByName('ChildCount').AsInteger > 0;
      Next;
    end;
  end;
end;

procedure TFNSubjectDetailsReportform.BuildTreeRoot;
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

procedure TFNSubjectDetailsReportform.FormCreate(Sender: TObject);
var
  I: Integer;
  Y, M, D: Word;
begin
  inherited;
  for I := 0 to TreeView.Items.Count - 1 do
    TreeView.Items[I].HasChildren := True;
  DateRangeFrame.DataSet := DataSource.DataSet;
  DecodeDate(Date, Y, M, D);
  DateRangeFrame.SetDateRange(EncodeDate(Y, M, 1), Date);
end;

procedure TFNSubjectDetailsReportform.TreeViewExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  inherited;
  if Node.Count = 0 then BuildTreeChild(Node);
end;

procedure TFNSubjectDetailsReportform.ADODataSetBeforeOpen(
  DataSet: TDataSet);
begin
  inherited;
  with ADODataSet do
    if TreeView.Selected <> nil then
      Parameters.ParamByName('SubID').Value := Integer(TreeView.Selected.Data)
    else Parameters.ParamByName('SubID').Value := 0;
end;

procedure TFNSubjectDetailsReportform.TreeViewChange(Sender: TObject;
  Node: TTreeNode);
begin
  inherited;
  RefreshAction.Execute;
end;

end.
