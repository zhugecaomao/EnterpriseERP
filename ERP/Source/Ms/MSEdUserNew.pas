unit MSEdUserNew;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DBCtrls, Mask, ComCtrls, DB, ADODB,
  Buttons, QLDBLkp, ExtCtrls, CheckLst, Grids, DBGrids;

type
  TMSEdUserNewForm = class(TWSStandardEditForm)
    ADODataSet1: TADODataSet;
    ADODataSet1ID: TAutoIncField;
    DataSource1: TDataSource;
    ADODataSet1CreateDate: TDateTimeField;
    ADODataSet1CreateUserID: TIntegerField;
    ADODataSet1RecordState: TStringField;
    ADODataSet1RoleID: TIntegerField;
    ADODataSet1EmployeeID: TIntegerField;
    ADODataSet1Code: TStringField;
    ADODataSet1Name: TStringField;
    ADODataSet1PassWord: TIntegerField;
    ADODataSet1BeginDate: TDateTimeField;
    ADODataSet1EndDate: TDateTimeField;
    AdsEmployee: TADODataSet;
    AutoIncField1: TAutoIncField;
    DsEmployee: TDataSource;
    Panel1: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    DBEdit1: TDBEdit;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    ListBox: TListBox;
    LookupEmployee: TQLDBLookupComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    ADODataSet1Employee: TStringField;
    AdsEmployeeCreateDate: TDateTimeField;
    AdsEmployeeCreateUserID: TIntegerField;
    AdsEmployeeRecordState: TStringField;
    AdsEmployeeName: TStringField;
    AdsEmployeeCode: TStringField;
    AdsEmployeeGender: TStringField;
    AdsEmployeeDepartmentID: TIntegerField;
    AdsEmployeePostDate: TDateTimeField;
    AdsEmployeePositionClassID: TIntegerField;
    AdsEmployeePostionID: TIntegerField;
    AdsEmployeeBarCode: TStringField;
    Edit1: TLabeledEdit;
    Edit2: TLabeledEdit;
    TempAds: TADODataSet;
    ADOQuery: TADOQuery;
    Listview: TListView;
    dsTempAds: TDataSource;
    ADODataSet2: TADODataSet;
    AutoIncField2: TAutoIncField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    IntegerField4: TIntegerField;
    StringField4: TStringField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    StringField5: TStringField;
    DataSource2: TDataSource;
    BitBtn5: TBitBtn;
    DBComboBox1: TDBLookupComboBox;
    ADODataSet1IsUsed: TIntegerField;
    procedure OKButtonClick(Sender: TObject);
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure updatePermission;
    procedure FormActivate(Sender: TObject);
    procedure ShowPermissions;
    procedure ListBoxClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure ListviewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListBoxExit(Sender: TObject);
    procedure LookupEmployeeClick(Sender: TObject);
  private
    EditFlag,StrPermission:string;

    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  MSEdUserNewForm: TMSEdUserNewForm;

implementation

uses CommonDM, WSUtils, WSSecurity;

{$R *.dfm}

function TMSEdUserNewForm.Edit(const Params: Variant): Boolean;
begin
  with ADODataSet1 do
  begin
//    AdsEmployee.Close;
//    AdsEmployee.CommandText :=' select * from MSEmployee where id in ('
//      +' select EmployeeID from MSUser )';
    AdsEmployee.Open;
    close;
    CommandText := 'select * from MSUser where RecordState<>'
    + QuotedStr('删除') + ' and ID=' + Format('%s', [VarToStr(Params)]);
    open;
    first;
    edit;
    Edit1.Text :=IntToStr(GetPassword(ADODataSet1.FieldByName('PassWord').AsString));
    Edit2.Text :=IntToStr(GetPassword(ADODataSet1.FieldByName('PassWord').AsString));
    Edit1.Enabled :=False;
    Edit2.Enabled :=False;
  end;
   Result := ShowModal = mrOK;
end;

function TMSEdUserNewForm.Enter: Boolean;
begin
  with ADODataSet1 do
  begin
//    AdsEmployee.Close;
//    AdsEmployee.CommandText :=' select * from MSEmployee where id not in ('
//      +' select EmployeeID from MSUser where Recordstate<>'
//      +Quotedstr('删除')+' )';
    AdsEmployee.Open;
    close;
    CommandText := 'select * from MSUser where 1=2';
    open;
    Append;
    FieldByName('CreateUserID').AsInteger := Guarder.UserID;
    FieldByName('RoleID').AsInteger := FieldByName('ID').AsInteger ;
  end;
  Result := ShowModal = mrOK;
end;

procedure TMSEdUserNewForm.OKButtonClick(Sender: TObject);
var  MSRoleID :string;
begin
  ListBox.ItemIndex := ListBox.Count - 1;
  ListBox.OnClick(ListBox);
  ListBox.ItemIndex := 0;
  ListBox.OnClick(ListBox);
  Listview.SetFocus;
  ListBox.SetFocus;
  if (ADODataSet1.FieldByName('EmployeeID').IsNull) or (ADODataSet1.FieldByName('EmployeeID').AsInteger=0)
  then begin
    showmessage('没有选择员工,错误!') ;
    LookupEmployee.SetFocus;
    exit;
  end;
  if trim(Edit1.text)<>trim(Edit2.Text) then
  begin
    showmessage('密码效验错误,修改!') ;
    Edit1.SetFocus;
  end
  else begin
  inherited;
  if ADODataSet1.State in [dsedit, dsinsert] then
  begin
    if  ADODataSet1.State in [ dsinsert] then
    ADODataSet1.FieldByName('PassWord').AsString :=IntToStr(GetPassword(Edit1.Text));
    ADODataSet1.Post;
  end;
  MSRoleID :=ADODataSet1.fieldbyname('ID').AsString;
  ADOQuery.Close;
  ADOQuery.SQL.Text :='delete from  MSRolePermissions '
    +' where RoleID='+MSRoleID;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :='delete from  #Permission '
    +' where Isused<>1 ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :='insert into MSRolePermissions (RoleID,PermissionID )'
    +' select '+MSRoleID+' as RoleID,id from #Permission';
  ADOQuery.ExecSQL;
  ModalResult := mrOK;
  end;
end;

procedure TMSEdUserNewForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  if ADODataSet1.State in [dsedit, dsinsert] then ADODataSet1.Cancel;
end;

procedure TMSEdUserNewForm.FormCreate(Sender: TObject);
begin
  inherited;
  AdsEmployee.Open;
  TempAds.Close;
  TempAds.CommandText :='select distinct PermissionClass from '
      +' MSPermission';
  TempAds.Open;
  ListBox.Clear;
  ListBox.Items.Add(' <全部> ') ;
  while not TempAds.eof do
  begin
    ListBox.Items.Add(' <'+TempAds.FieldByName('PermissionClass').AsString+'>');
    TempAds.Next;
  end;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#Permission')
        +' )) DROP TABLE #Permission ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #Permission ('
      +'	[ID] [int] NULL ,'
      +'	[name] [varchar] (30)  ,          '
      +'	[PermissionClass] [varchar] (30)  , '
      +'	[Isused] [int] NULL   )';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Truncate  table #Permission';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #Permission (id,name,PermissionClass,Isused) '
      +' select id,name,PermissionClass,0 from MSPermission where'
      +' Recordstate<>' +Quotedstr('删除') ;
  ADOQuery.ExecSQL;
end;

procedure TMSEdUserNewForm.updatePermission;
var adoTemp: TADOQuery;
    I :integer;
    str :string;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  for i := 0 to Listview.Items.Count-1 do
  begin
    if Listview.Items.Item[i].Checked then
      str :='update  #Permission set Isused=1  where ID='
      + IntToStr(Listview.Items.Item[i].ImageIndex)
    else
      str :='update  #Permission set Isused=0 where ID='
      + IntToStr(Listview.Items.Item[i].ImageIndex)  ;
    adoTemp.Close;
    adoTemp.sql.Text :=str;
    adoTemp.ExecSQL;
  end;
end;

procedure TMSEdUserNewForm.FormActivate(Sender: TObject);
var str:string;
begin
  inherited;
  if not ADODataSet1.fieldbyname('ID').IsNull then
  begin
    Str :=ADODataSet1.fieldbyname('ID').AsString;
    str :='update  #Permission set Isused=1 where ID in'
      +' (select PermissionID from MSRolePermissions where  RoleID='
      +Str +' )';
    ADOQuery.Close;
    ADOQuery.SQL.Text :=Str;
    ADOQuery.ExecSQL;
  end;
  ListBox.ItemIndex :=0;
  StrPermission :=Copy(trim(ListBox.Items.Strings[ListBox.ItemIndex]),2,10);
  ShowPermissions;
end;

procedure TMSEdUserNewForm.ShowPermissions;
var Str:string;
begin
//  显示当前设定权限;
  StrPermission :=Trim(StrPermission);
  if StrPermission<>'全部>' then
      Str :='select * from #Permission where PermissionClass ='
        +Quotedstr(StrPermission)
    else Str :='select * from #Permission ';
  TempAds.Close;
  TempAds.CommandText :=str;
  TempAds.Open;
  TempAds.First;
  Listview.Items.Clear ;
  while not TempAds.eof do
  begin
    Listview.AddItem(TempAds.FieldByName('Name').AsString,nil);
    Listview.Items.Item[Listview.Items.Count-1].ImageIndex := TempAds.FieldbyName('ID').AsInteger;
    if TempAds.FieldByName('Isused').AsString='1' then Listview.Items.Item[Listview.Items.Count-1].Checked := True ;
    TempAds.Next;
  end;
end;

procedure TMSEdUserNewForm.ListBoxClick(Sender: TObject);
begin
  inherited;
//  ListBox.Selected;
  if  StrPermission <>Copy(trim(ListBox.Items.Strings[ListBox.ItemIndex]),2,10)
  then updatePermission;
  StrPermission :=Copy(trim(ListBox.Items.Strings[ListBox.ItemIndex]),2,10);
  ShowPermissions;
end;

procedure TMSEdUserNewForm.BitBtn1Click(Sender: TObject);
var i: integer;
begin
  for i := 0 to Listview.Items.Count - 1 do
    Listview.Items.Item[i].Checked := true;
//  ListBox.Items.SetText('');
end;

procedure TMSEdUserNewForm.BitBtn2Click(Sender: TObject);
var i: integer;
begin
  for i := 0 to Listview.Items.Count - 1 do
    Listview.Items.Item[i].Checked := False;
//             ListBoxClick(sender);
end;

procedure TMSEdUserNewForm.BitBtn5Click(Sender: TObject);
var str :string;
begin
//  继承选择已用户的权限
  DBComboBox1.Visible :=false;
  BitBtn5.Visible :=false;
  if not ADODataSet2.fieldbyname('ID').IsNull then
  begin
    Str :=ADODataSet2.fieldbyname('ID').AsString;
    str :='update  #Permission set Isused=1 where ID in'
      +' (select PermissionID from MSRolePermissions where  RoleID='
      +Str +' )';
//    showmessage(str);
    ADOQuery.Close;
    ADOQuery.SQL.Text :=Str;
    ADOQuery.ExecSQL;
  end;
  ListBox.ItemIndex :=0;
  StrPermission :=Copy(trim(ListBox.Items.Strings[ListBox.ItemIndex]),2,10);
  ShowPermissions;
end;

procedure TMSEdUserNewForm.BitBtn3Click(Sender: TObject);
var str :string;
begin
  inherited;
  if ADODataSet1.fieldbyname('id').IsNull then
    str := ' select * from  MSUser where RecordState<>' +Quotedstr('删除')
    else
    str := ' select * from  MSUser where RecordState<>'
    +Quotedstr('删除')+' and ID <>'+ADODataSet1.fieldbyname('id').AsString;
  ADODataSet2.CLOSE;
  ADODataSet2.CommandText := str;
  ADODataSet2.Open;
  DBComboBox1.Visible :=true;
  BitBtn5.Visible :=true;
end;

procedure TMSEdUserNewForm.ListviewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  inherited;
//  ListBoxClick(sender);
end;

procedure TMSEdUserNewForm.ListBoxExit(Sender: TObject);
begin
//  inherited;
  if  StrPermission <>Copy(trim(ListBox.Items.Strings[ListBox.ItemIndex]),2,10)
  then updatePermission;
  StrPermission :=Copy(trim(ListBox.Items.Strings[ListBox.ItemIndex]),2,10);
  ShowPermissions;

end;

procedure TMSEdUserNewForm.LookupEmployeeClick(Sender: TObject);
begin
  if (ADODataSet1.FieldByName('name').IsNull) or (Trim(ADODataSet1.FieldByName('name').AsString)='' )  then
     ADODataSet1.FieldByName('name').AsString :=AdsEmployee.FieldByName('Name').AsString;
end;

end.

