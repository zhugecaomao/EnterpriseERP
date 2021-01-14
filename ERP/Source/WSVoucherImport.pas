unit WSVoucherImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TWSVoucherImportForm = class(TWSVoucherBrowseForm)
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    adsMaster: TADODataSet;
    Panel2: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    ADOQuery: TADOQuery;
    Label3: TLabel;
    CmbxTableName: TComboBox;
    Label1: TLabel;
    MainMenu1: TMainMenu;
    adsMasterid: TAutoIncField;
    adsMasterDSDesigner: TStringField;
    adsMasterDSDesigner2: TDateTimeField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner4: TStringField;
    adsMasterDSDesigner5: TStringField;
    adsMasterDSDesigner6: TStringField;
    adsMasterDSDesigner7: TStringField;
    adsMasterDSDesigner8: TBCDField;
    adsMasterDSDesigner9: TStringField;
    adsMasterDSDesigner10: TBCDField;
    adsMasterDSDesigner11: TBCDField;
    adsMasterDSDesigner12: TStringField;
    adsMasterDSDesigner13: TBCDField;
    adsMasterDSDesigner14: TStringField;
    adsMasterDSDesigner15: TStringField;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure UpdateDBGrid;
    procedure CmbxTableNameChange(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    STNameM,STNameD,STID,DateStr : string;
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  WSVoucherImportForm: TWSVoucherImportForm;


implementation

uses CommonDM,FNCashLeger ;

{$R *.dfm}

function TWSVoucherImportForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TWSVoucherImportForm.BitBtn1Click(Sender: TObject);
var year,month,day,year1,month1,day1 :word;
    DateStr,DateStr1,Sqlstr,FNstr :String;
begin
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DateStr :=Datetostr(DateTimePicker1.Date);
  DateStr1 :=Datetostr(DateTimePicker2.Date);
  if STNameM ='' then exit;
  Sqlstr:=' select b.id, '
    +' b.Code as [编号], '
    +' b.date [日期],             '
    +' b.BillMode [业务类别],     '
    +' b.brief  [业务摘要],       '
    +' c.name  [客户/厂商名称] ,  '
    +' e.name [商品名称],         '
    +' a.GoodsSpec [规格型号],    '
    +' a.GoalQuantity  [标准数量],'
    +' g.name  [标准单位],        '
    +' a.PriceBase  [单价],       '
    +' a.Amount as [金额],        '
    +' f.name [包装单位],         '
    +' a.Quantity  [数量],        '
    +' D.name  [经手人],          '
    +' a.Memo  [备注]             '
    +' from  '+STNameD + '   a      '
    +' left outer join '+STNameM+'  b on b.ID=a.MasterID   '
    +' left outer join DAClient       C on C.ID =B.ClientID  '
    +' left outer join MSEmployee     D on D.ID =B.EmployeeID'
    +' left outer join DAGoods        e on e.ID =a.GoodsID   '
    +' left outer join MSUnit         f on f.ID =a.PackUnitID'
    +' left outer join MSUnit         g on g.ID =E.UnitID'
    +' where b.date>'+Quotedstr(DateStr)+' and b.date<='
    +Quotedstr(DateStr1)+' and b.Recordstate<>'+QuotedStr('删除') ;

//  Memo1.Text :=  Sqlstr;

  adsMaster.close;
  adsMaster.CommandText := Sqlstr;
  adsMaster.open;
  if adsMaster.FieldByName('ID').IsNull then STID :=''
    else STID :=adsMaster.FieldByName('ID').AsString ;
  UpdateDBGrid;
end;

procedure TWSVoucherImportForm.FormCreate(Sender: TObject);
var year,month,day : word;
begin
  inherited;
  DecodeDate(Date,year, month, day);
  DateTimePicker1.Date :=EncodeDate(year, month, 1);
  DateTimePicker2.Date :=date;
  ADOQuery.Close;
  ADOQuery.sql.Text := ' select distinct brief from MSBillTable '
  +' where ModeDC=2 order by brief';
  ADOQuery.Open;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    CmbxTableName.Items.Add(ADOQuery.fieldbyname('brief').AsString);
    ADOQuery.Next;
  end;
end;


procedure TWSVoucherImportForm.DBGridCellClick(Column: TColumn);
begin
  UpdateDBGrid;
end;

procedure TWSVoucherImportForm.UpdateDBGrid;
var  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    Columns[0].Width :=100;
    for I := 1 to Columns.Count - 1 do
    begin
      Columns[i].Width :=90;
      if Pos('日',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Pos('编',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      if Pos('Price',Columns[I].FieldName)<=0 then
        Columns[I].Footer.ValueType := fvtSum;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TWSVoucherImportForm.CmbxTableNameChange(Sender: TObject);
begin
  inherited;
  STNameM := '';
  STNameD := '';
  if CmbxTableName.ItemIndex<>-1 then STNameM :=trim(CmbxTableName.Text);
  ADOQuery.Close;
  ADOQuery.sql.Text := ' select top 1 OriginTable from MSBillTable'
          +' where ModeDC='+Quotedstr('2')+' and brief like '
          + Quotedstr('%'+STNameM+'%')
          +' order by OriginTable Desc';
  ADOQuery.Open;
  if ADOQuery.fieldbyname('OriginTable').IsNull then STNameM :=''
     else STNameM:=ADOQuery.fieldbyname('OriginTable').AsString;
  if STNameM='' then  exit;
  STNameM :=Copy(Trim(STNameM),1,Length(Trim(STNameM))-6)+'Master';
  STNameD :=Copy(Trim(STNameM),1,Length(Trim(STNameM))-6)+'Detail';
//  showmessage(STNameM+' - '+STNameD);
  BitBtn1Click(Sender);
end;

procedure TWSVoucherImportForm.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if DateTimePicker1.Date>DateTimePicker2.Date then
      DateTimePicker2.Date :=DateTimePicker1.Date;
end;

procedure TWSVoucherImportForm.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
  if DateTimePicker2.Date<DateTimePicker1.Date then
      DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TWSVoucherImportForm.DBGridDblClick(Sender: TObject);
begin
  if adsMaster.FieldByName('ID').IsNull then STID :=''
    else STID :=adsMaster.FieldByName('ID').AsString ;
  inherited;
end;

end.
