unit MSEdUserTerm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, ExtCtrls, DB, ADODB,MSEdTermAddUser;

type
  TMSEdUserTermForm = class(TWSStandardEditForm)
    edtName: TLabeledEdit;
    Label1: TLabel;
    lbUser: TListBox;
    btnAddUser: TButton;
    btnDeleteUser: TButton;
    mem: TMemo;
    Label3: TLabel;
    adrUserTerm: TADOQuery;
    adsUserTerm: TADODataSet;
    DataSource1: TDataSource;
    procedure OKButtonClick(Sender: TObject);
    procedure btnDeleteUserClick(Sender: TObject);
    procedure btnAddUserClick(Sender: TObject);
  private
    nOptionType: integer; //操作类型：0:增加 1:编辑；
    vID:string;
    { Private declarations }
  public
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
    { Public declarations }
  end;

var
  MSEdUserTermForm: TMSEdUserTermForm;

implementation

{$R *.dfm}
function TMSEdUserTermForm.Edit(const Params: Variant): Boolean;
begin
  vID := Format('%s', [VarToStr(Params)]);
  nOptionType:=1;
  with adrUserTerm do
  begin
    Close;
    SQL.Clear;
    SQL.Add('select * from MSRole where id='''+vID+'''');
    Open;
    edtName.Text := FieldByName('name').AsString;
    mem.Lines.Add(FieldByName('memo').AsString);
    Close;
    SQL.Clear;
    SQL.Add('select name from MSRole where ID in (select UserId from MSUserTeamUsers where UserTermId='+vId+') and RecordState<>''删除''');
    Open;
    First;
    while not eof do
    begin
      lbUser.Items.Add(FieldByName('Name').AsString);
      Next;
    end;
  end;
  Result := ShowModal = mrOK;
end;

function TMSEdUserTermForm.Enter: Boolean;
begin
  nOptionType := 0;
  Result := ShowModal = mrOK;
end;

procedure TMSEdUserTermForm.OKButtonClick(Sender: TObject);
var
  nID:integer;
  i: integer;
begin
  inherited;
  if edtName.Text='' then
  begin
    MessageBox(Handle,'名称不能为空，请重新输入！','出错',MB_OK+MB_ICONERROR+MB_DEFBUTTON1);
    edtName.SetFocus;
    exit;
  end;
  case nOptionType of
    0:  //  增加；
    begin
      with adsUserTerm do
      begin
        CommandText := 'select * from MSRole where (name='''+edtName.Text+''') and (IsUserTerm=1) and (RecordState<>''删除'')';
        open;
        if not IsEmpty then
        begin
          ShowMessage('数据库中已经有相同名称的用户，不能再次输入！');
          edtName.SetFocus;
          Close;
          exit;
        end;
      end;
      with adrUserTerm do
      begin
        Close;
        SQL.Clear;
        SQL.Add('insert into MSRole(createUserID,name,IsUserTerm,Memo) values(1,'''
            +edtName.Text+''',1,'''+mem.Lines.Text+''')');
        ExecSQL;
        Close;
        SQL.Clear;
        SQL.Text :='select id from MSRole where name='''+edtName.Text+''' and IsUserTerm=1 and RecordState<>''删除''';
        Open;
        nId :=adrUserTerm.FieldValues['id'];
        Close;
        SQL.Clear;
        if lbUser.Items.Count>0 then
        begin
          SQL.Clear;
          for i := 0 to lbUser.Items.Count-1 do
          begin
            with adsUserTerm do
            begin
              Close;
              CommandText := 'select ID from MSRole where name='''
                  +lbUser.Items.Strings[i]+''' and IsUserTerm=0 and RecordState<>''删除''';
              Open;
            end;
            SQL.Add('insert into MSUserTeamUsers(UserTermID,UserID) Values('+IntToStr(nID)+','+adsUserTerm.FieldByName('ID').AsString+')');
          end;
          ExecSQL;
        end;
      end;
    end;
    1:  // 编辑；
    begin
      with adrUserTerm do
      begin
        Close;
        SQL.Clear;
        SQL.Add('update MSRole set createUserID=1,name='''+edtName.Text+''',IsUserTerm=1,Memo=''测试数据'' where id='''+vID+'''');
        ExecSQL;
        Close;
        SQL.Clear;
        Close;
        SQL.Clear;
        SQL.Add('delete MSUserTeamUsers where UserTermID='+vID);
        if lbUser.Items.Count>0 then
        begin
          for i := 0 to lbUser.Items.Count-1 do
          begin
            with adsUserTerm do
            begin
              Close;
              CommandText := 'select ID from MSRole where name='''
                  +lbUser.Items.Strings[i]+''' and IsUserTerm=0 and RecordState<>''删除''';
              Open;
            end;
            SQL.Add('insert into MSUserTeamUsers(UserTermID,UserID) Values('+vID+','+adsUserTerm.FieldByName('ID').AsString+')');
          end;
        end;
        ExecSQL;
      end;
    end;
  end;
  ModalResult := mrOK;
end;

procedure TMSEdUserTermForm.btnDeleteUserClick(Sender: TObject);
var
  nIndex: integer;
begin
  inherited;
  if lbUser.Items.Count=0 then
  begin
    showmessage('没有用户可删除了.');
    exit;
  end;
  nIndex := lbUser.ItemIndex;
  if nIndex<0 then
  begin
    lbUser.Selected[0]:=True;
    exit;
  end
  else
  begin
    lbUser.DeleteSelected;
    nIndex := nIndex - 1;
    if nIndex <0 then nIndex := 0;
  end;
  if lbUser.Items.Count<=0 then exit;
  lbUser.Selected[nIndex] := True;
end;

procedure TMSEdUserTermForm.btnAddUserClick(Sender: TObject);
var
  User : TStringList;
begin
  inherited;
  User:=TStringList.Create();
  User.AddStrings(lbUser.Items);
  User:=TermAddUser(User,vID);
  if User <> nil then
  begin
    lbUser.Clear;
    lbUser.Items.AddStrings(User);
  end;

end;

end.
