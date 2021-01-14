unit MSEdUserAddTerm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, DB, ADODB, StdCtrls;

type
  TMSEdUserAddTermForm = class(TWSCustomForm)
    btnAdd: TButton;
    btnAddAll: TButton;
    btnDelete: TButton;
    btnDeleteAll: TButton;
    lbLeft: TListBox;
    lbRight: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    btnOK: TButton;
    btnCancel: TButton;
    adsEdUserAddTerm: TADODataSet;
    procedure btnAddClick(Sender: TObject);
    procedure btnAddAllClick(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure btnDeleteAllClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
  private
    { Private declarations }
    procedure move(lbFrom: TListBox;lbTo: TListBox);
  public
    { Public declarations }
  end;
function UserAddTerm(sTerm: TStringList;sID: string): TStringList;
var
  term: TStringList;
  ID: String;
implementation

{$R *.dfm}

procedure TMSEdUserAddTermForm.move(lbFrom: TListBox;lbTo: TListBox);
var
  i:integer;
begin
  for i:=0 to lbFrom.Items.Count - 1 do
  begin
    if lbFrom.Selected[i] then
    begin
      lbFrom.MoveSelection(lbTo);
      break;
    end;
  end;
end;

function UserAddTerm(sTerm:TStringList;sID:string): TStringList;
begin
  term := sTerm;
  ID := sID;
  Result := nil;
  with TMSEduserAddTermForm.Create(Application) do
  try
    if ShowModal = mrOK then
    begin
      Result :=term;
    end;
  finally
    Free;
  end;
end;

procedure TMSEdUserAddTermForm.btnAddClick(Sender: TObject);
var
  nIndex: integer;
begin
  inherited;
  if lbLeft.Items.Count=0 then
  begin
    showmessage('没有组可添加了.');
    exit;
  end;
  nIndex := lbLeft.ItemIndex;
  if nIndex<0 then
  begin
    lbLeft.Selected[0]:=True;
    exit;
  end
  else
  begin
    move(lbLeft,lbRight);
    nIndex := nIndex - 1;
    if nIndex <0 then nIndex := 0;
  end;
  if lbLeft.Items.Count<=0 then
  begin
    exit;
  end;
  lbLeft.Selected[nIndex] := True;
end;

procedure TMSEdUserAddTermForm.btnAddAllClick(Sender: TObject);
begin
  inherited;
  if lbLeft.Items.Count=0 then
  begin
    showmessage('没有组可添加了.');
    exit;
  end;
  while lbLeft.Items.Count>0 do
  begin
    lbLeft.Selected[0]:=True;
    lbLeft.SetFocus;
    move(lbLeft,lbRight);
  end;

end;

procedure TMSEdUserAddTermForm.btnDeleteClick(Sender: TObject);
var
  nIndex: integer;
begin
  inherited;
  if lbRight.Items.Count=0 then
  begin
    showmessage('没有组可删除了.');
    exit;
  end;
  nIndex := lbRight.ItemIndex;
  if nIndex<0 then
  begin
    lbRight.Selected[0]:=True;
    exit;
  end
  else
  begin
    move(lbRight,lbLeft);
    nIndex := nIndex - 1;
    if nIndex <0 then nIndex := 0;
  end;
  if lbRight.Items.Count<=0 then exit;
  lbRight.Selected[nIndex] := True;
end;

procedure TMSEdUserAddTermForm.btnDeleteAllClick(Sender: TObject);
begin
  inherited;
  if lbRight.Items.Count=0 then
  begin
    showmessage('没有组可删除了.');
    exit;
  end;
  while lbRight.Items.Count>0 do
  begin
    lbRight.Selected[0]:=True;
    lbRight.SetFocus;
    move(lbRight,lbLeft);
  end;
end;

procedure TMSEdUserAddTermForm.FormCreate(Sender: TObject);
var
  i,j: integer;
begin
  inherited;
  lbRight.Items.AddStrings(Term);
  with adsEdUserAddTerm do
  begin
    CommandText := 'select Name from MSRole where IsUserTerm=1 and RecordState<>''删除''';
    Open;
    first;
    while not eof do
    begin
      lbLeft.Items.Add(FieldByName('Name').AsString);
      Next;
    end;
    i:=0;
    while i<lbLeft.Items.Count do
    begin
      for j:=0 to lbRight.Items.Count-1 do
      begin
        if lbLeft.Items.Strings[i]=lbRight.Items.Strings[j] then
        begin
          lbLeft.Items.Delete(i);
          continue;
        end;
      end;
      i:=i+1;
    end;
  end;
end;

procedure TMSEdUserAddTermForm.FormShow(Sender: TObject);
begin
  inherited;
{  MSEdUserAddTermForm.Width:=335;
  MSEdUserAddTermForm.Height := 301;
}
end;

procedure TMSEdUserAddTermForm.btnOKClick(Sender: TObject);
begin
  inherited;
  Term.Clear;
  term.AddStrings(lbRight.Items);
end;

end.
