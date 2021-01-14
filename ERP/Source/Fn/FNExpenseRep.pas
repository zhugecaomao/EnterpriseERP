unit FNExpenseRep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TFNExpenseRepForm = class(TWSVoucherBrowseForm)
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
    Label1: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    adsMasterDSDesigner: TDateTimeField;
    adsMasterDSDesigner2: TStringField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner4: TStringField;
    adsMasterDSDesigner5: TStringField;
    adsMasterDSDesigner7: TStringField;
    adsMasterDSDesigner8: TBCDField;
    adsMasterDSDesigner9: TStringField;
    adsMasterDSDesigner10: TStringField;
    adsMasterExpenseID: TIntegerField;
    adsMasterRecordState: TStringField;
    adsMasterDSDesigner6: TBCDField;
    adsMasterDSDesigner11: TStringField;
    adsMasterClientID: TIntegerField;
    ToolButton1: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpdateDBGrid;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FNExpenseRepForm: TFNExpenseRepForm;

implementation

uses CommonDM ;

{$R *.dfm}

function TFNExpenseRepForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TFNExpenseRepForm.BitBtn1Click(Sender: TObject);
var year,month,day,year1,month1,day1 :word;
    Datestr1,Datestr2 :string;
begin
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DateStr1 :=Datetostr(DateTimePicker1.Date);
  DateStr2 :=Datetostr(DateTimePicker2.Date);
  adsMaster.Close;
  adsMaster.CommandText :=' select b.Date as [日期] ,b.Code as [编号], '
        +' b.BillMode [业务类别],b.Brief [业务摘要],                  '
        +' c.name as [费用名称], a.Amount [费用金额],                 '
        +' f.name as [报销人], g.name as [部门名称],                  '
        +' a.AmountB [参考金额], d.name as [经手人],                  '
        +' a.Memo as [备注],                                          '
        +' a.ExpenseID, b.ClientID,b.RecordState                      '
        +' from FNExpenseDetail a                                     '
        +' left outer join FNExpensemaster b on b.ID=a.MasterID       '
        +' left outer join DAExpenseClass c on  c.ID=a.ExpenseID      '
        +' left outer join MSEmployee d on  d.ID=b.EmployeeID         '
        +' left outer join MSEmployee f on  f.ID=b.ClientID           '
        +' left outer join MSDepartment g on  g.ID=f.DepartmentID     '
        +' where b.RecordState<>'+Quotedstr('删除')+' and b.date>='
        +Quotedstr(DateStr1)+' and b.date<='+Quotedstr(Datestr2);
   adsMaster.Open;
   UpdateDBGrid;
end;

procedure TFNExpenseRepForm.FormCreate(Sender: TObject);
var year,month,day :word;
begin
  inherited;
  DecodeDate(date,year,month,day)  ;
  DateTimePicker1.Date :=Encodedate(year,month,1);
  DateTimePicker2.Date :=EndoftheMonth(date);
end;

procedure TFNExpenseRepForm.UpdateDBGrid;
var  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
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

procedure TFNExpenseRepForm.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker1.Date>DateTimePicker2.Date then
      DateTimePicker2.Date :=DateTimePicker1.Date;
end;

procedure TFNExpenseRepForm.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker2.Date<DateTimePicker1.Date then
      DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TFNExpenseRepForm.FormShow(Sender: TObject);
begin
  inherited;
  BitBtn1Click(sender);
end;

procedure TFNExpenseRepForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
   UpdateDBGrid;
end;

procedure TFNExpenseRepForm.DBGridDblClick(Sender: TObject);
begin
//  inherited;
end;

end.
