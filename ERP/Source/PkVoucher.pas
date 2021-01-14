unit PkVoucher;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, StdCtrls, Grids, DBGrids, QLDBGrid, ComCtrls, Spin,
  ExtCtrls, DBCtrls, DB, ADODB;

type
  TVoucherPickForm = class(TWSCustomForm)
    DBGrid: TQLDBGrid;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    CmbxTableName: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    dtpBegin: TDateTimePicker;
    Label4: TLabel;
    dtpEnd: TDateTimePicker;
    btnRefresh: TButton;
    aqrTemp: TADOQuery;
    adsTemp: TADODataSet;
    dsTemp: TDataSource;
    CmbxClient: TComboBox;
    Label5: TLabel;
    CmbCode: TComboBox;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbDateTypeChange(Sender: TObject);
    procedure btnRefreshClick(Sender: TObject);
    procedure CmbxTableNameClick(Sender: TObject);
  private
    { Private declarations }
    STNameM,STNameD: string;
  public
    { Public declarations }
  end;

var
  VoucherPickForm: TVoucherPickForm;

function PickVoucherDlg(const VoucherTypeID: Integer; var VoucherID: Integer): Boolean;

implementation

uses CommonDM;

{$R *.dfm}

function PickVoucherDlg(const VoucherTypeID: Integer; var VoucherID: Integer): Boolean;
begin
  result := false;
end;

procedure TVoucherPickForm.FormShow(Sender: TObject);
begin
  inherited;
  dtpBegin.Date :=date;
  dtpEnd.Date :=date;
  CmbxTableName.Style :=csDropDown;
  CmbxClient.Style :=csDropDown;
  aqrTemp.Close;
  aqrTemp.SQL.Text :=' select distinct Brief from MSBillTable order by Brief';
  aqrTemp.Open;
  aqrTemp.First;
  while not aqrTemp.Eof do
  begin
    CmbxTableName.Items.Add(Trim(aqrTemp.fieldbyname('brief').AsString));
    aqrTemp.Next;
  end;
  aqrTemp.Close;
  aqrTemp.SQL.Text :=' select ID,name from DaClient where RecordState<>'
      +Quotedstr('删除');
  aqrTemp.Open;
  aqrTemp.First;
  while not aqrTemp.Eof do
  begin
    CmbxClient.Items.AddObject(aqrTemp.fieldbyname('Name').AsString, pointer(aqrTemp.FieldByName('ID').AsInteger) );
    aqrTemp.Next;
  end;
  CmbxTableName.Style :=csDropDownList;
  CmbxClient.Style :=csDropDownList;
end;

procedure TVoucherPickForm.Button2Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TVoucherPickForm.Button1Click(Sender: TObject);
begin
  inherited;
  ModalResult := mrOk;
end;

procedure TVoucherPickForm.cbDateTypeChange(Sender: TObject);
var
  Year, Month, Day: Word;
begin
  inherited;
  DecodeDate(Now, Year, Month, Day);


end;

procedure TVoucherPickForm.btnRefreshClick(Sender: TObject);
var S:string;
begin
  inherited;
  s:='select b.Code as [编号], date [日期],BillMode [业务类别],
     +' brief as [业务摘要],c.name as [客户/厂商]'
     +' D.name as [经手人], a.* from '
     +' a left outer join ' +STNameM +' b on a.MasterID=b.ID'
     +' left outer join DAClient C on C.ID =B.ClientID'
     +' left outer join MSEmployee D on D.ID =B.EmployeeID'
  adsTemp.close;
  adsTemp.CommandText := S;
  adsTemp.open;

end;

procedure TVoucherPickForm.CmbxTableNameClick(Sender: TObject);
begin
  inherited;
  if CmbxTableName.ItemIndex<>-1 then STNameM :=trim(CmbxTableName.Text)
    else STNameM := '';
  aqrTemp.Close;
  aqrTemp.sql.Text := ' select OriginTable from MSBillTable'
          +' where brief like '+Quotedstr('%'+STNameM+'%')
          +' order by OriginTable Desc';
  aqrTemp.Open;
  aqrTemp.First;
  if not aqrTemp.fieldbyname('OriginTable').IsNull then
     STNameM:=aqrTemp.fieldbyname('OriginTable').AsString else STNameM :='';
  if STNameM='' then  exit;

  aqrTemp.Next;
  if not aqrTemp.fieldbyname('OriginTable').IsNull then
     STNameD:=aqrTemp.fieldbyname('OriginTable').AsString else STNameD :='';
  aqrTemp.Close;
  aqrTemp.sql.Text := ' select  code from '+STNameM +' where RecordState<>'
      +Quotedstr('删除')+' order by Date Desc';
  aqrTemp.Open;
  aqrTemp.first;

  CmbCode.Clear;
  while not aqrTemp.Eof do
  begin
    CmbCode.Items.Add(aqrTemp.fieldbyname('Code').AsString);
    aqrTemp.Next;
  end;
end;

end.

