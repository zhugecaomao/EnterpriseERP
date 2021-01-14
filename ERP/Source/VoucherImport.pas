unit VoucherImport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSBrowse, ComCtrls, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ExtCtrls, ToolWin, ADODB, StdCtrls, Menus,TypInfo, Buttons;

type
  TVoucherImportForm = class(TWSBrowseForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    adsMaster: TADODataSet;
    Panel3: TPanel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    Label1: TLabel;
    CmbxTableName: TComboBox;
    BitBtn1: TBitBtn;
    ADOQuery: TADOQuery;
    adsMasterid: TAutoIncField;
    adsMasterGoodsID: TIntegerField;
    adsMasterCode: TStringField;
    adsMasterdate: TDateTimeField;
    adsMasterBillMode: TStringField;
    adsMasterbrief: TStringField;
    adsMasterClient: TStringField;
    adsMasterGoods: TStringField;
    adsMasterGoodsSpec: TStringField;
    adsMasterGoalQuantity: TBCDField;
    adsMasterGoalUnit: TStringField;
    adsMasterPriceBase: TBCDField;
    adsMasterAmount: TBCDField;
    adsMasterPackUnit: TStringField;
    adsMasterQuantity: TBCDField;
    adsMasterEmployee: TStringField;
    adsMasterMemo: TStringField;
    adsMasterGoalUnitID: TIntegerField;
    adsMasterPackUnitID: TIntegerField;
    adsMasterPriceGoal: TBCDField;
    ToolButton10: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure CmbxTableNameChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure DBGridKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    STNameM,STNameD,STID :string;

  public
    { Public declarations }
    procedure UpdateGrid;
  end;

procedure ShowImportForm(const FSTNameM,FSTNameD,FSTID: string);
//procedure ShowImportForm(const TableNameM,TableNameD,TableNameMID: string);

implementation

uses CommonDM, ClipBrd;

{$R *.dfm}

procedure ShowImportForm(const FSTNameM,FSTNameD,FSTID: string);
var I :integer;
begin
  with TVoucherImportForm.Create(Application) do
  try
    {Caption := '';
    TabSheet1.Caption :='';
    adsMaster.Close;
    adsMaster.CommandType := '';
    adsMaster.CommandText := '';
    adsMaster.Open;}
    ShowModal;
  finally
    Free;
  end;
end;

procedure TVoucherImportForm.UpdateGrid;
var
  I: Integer;
  Field: TField;
  Balance:real;
begin
  inherited;

  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := 'ºÏ¼Æ:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    for I := 1 to Columns.Count - 1 do
    begin
      Columns[i].Width :=90;
      if Pos('Date',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Pos('Code',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      begin
        SetStrProp(Fields[I], 'DisplayFormat','#,#.00') ;
        if Pos('Price',Columns[I].FieldName)<=0 then
          Columns[I].Footer.ValueType := fvtSum;
        Columns[I].Width :=90;
      end;
    end;
    FooterRowCount := 1;
  end;

end;

procedure TVoucherImportForm.FormShow(Sender: TObject);
var I :integer;
begin
  inherited;
  for I:=0 to  CmbxTableName.Items.Count-1 do
  begin
    CmbxTableName.ItemIndex :=I;
    if adsMaster.IsEmpty then
    begin
      CmbxTableNameChange(sender);
      if not adsMaster.IsEmpty then exit;
    end;
  end;
  UpdateGrid;
end;

procedure TVoucherImportForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  UpdateGrid;
end;

procedure TVoucherImportForm.FormClick(Sender: TObject);
begin
  inherited;
  UpdateGrid;
end;

procedure TVoucherImportForm.BitBtn1Click(Sender: TObject);
var year,month,day,year1,month1,day1 :word;
    DateStr,DateStr1,Sqlstr,FNstr :String;
begin
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DateStr :=Datetostr(DateTimePicker1.Date);
  DateStr1 :=Datetostr(DateTimePicker2.Date);
  if STNameM ='' then exit;
  Sqlstr:=' select b.id, '
    +' b.Code, '
    +' b.date,             '
    +' b.BillMode,     '
    +' b.brief,       '
    +' c.name AS Client,  '
    +' A.GoodsID, '
    +' e.name AS Goods,         '
    +' a.GoodsSpec,    '
    +' a.GoalQuantity,'
    +' g.name AS GoalUnit,        '
    +' a.PriceBase,       '
    +' a.Amount,        '
    +' f.name AS PackUnit,         '
    +' a.Quantity,        '
    +' D.name AS Employee,          '
    +' a.Memo, '
    +' A.GoalUnitID, A.PackUnitID, A.PriceGoal'
    +' from  '+STNameD + '   a      '
    +' left outer join '+STNameM+'  b on b.ID=a.MasterID   '
    +' left outer join DAClient       C on C.ID =B.ClientID  '
    +' left outer join MSEmployee     D on D.ID =B.EmployeeID'
    +' left outer join DAGoods        e on e.ID =a.GoodsID   '
    +' left outer join MSUnit         f on f.ID =a.PackUnitID'
    +' left outer join MSUnit         g on g.ID =E.UnitID'
    +' where a.GoodsID<>0 and b.date>='+Quotedstr(DateStr)
    +' and b.date<=' +Quotedstr(DateStr1)
    +' and b.Recordstate<>'+QuotedStr('É¾³ý') ;
//  Memo1.Text :=  Sqlstr;

  adsMaster.close;
  adsMaster.CommandText := Sqlstr;
  adsMaster.open;
  if adsMaster.FieldByName('ID').IsNull then STID :=''
    else STID :=adsMaster.FieldByName('ID').AsString ;
  UpdateGrid;
end;

procedure TVoucherImportForm.DateTimePicker2Change(Sender: TObject);
begin
  if DateTimePicker2.Date<DateTimePicker1.Date then
      DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TVoucherImportForm.DateTimePicker1Change(Sender: TObject);
begin
  if DateTimePicker1.Date>DateTimePicker2.Date then
      DateTimePicker2.Date :=DateTimePicker1.Date;
end;

procedure TVoucherImportForm.CmbxTableNameChange(Sender: TObject);
begin
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

procedure TVoucherImportForm.FormCreate(Sender: TObject);
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

procedure TVoucherImportForm.DBGridDblClick(Sender: TObject);
begin
//  inherited;
//  ShowImportForm(STNameM,STNameD,STID);
   ModalResult := mrOK;
end;

procedure TVoucherImportForm.DBGridKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if ([ssCtrl] = Shift) and (Key = Ord('C')) and (DBGrid.SelectedField <> nil) then
    Clipboard.AsText := DBGrid.SelectedField.DisplayText;

end;

end.
