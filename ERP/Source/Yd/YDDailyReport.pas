unit YDDailyReport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TYDDailyReportForm = class(TWSVoucherBrowseForm)
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
    ADOQuery: TADOQuery;
    Panel2: TPanel;
    Label3: TLabel;
    DateTimePicker1: TDateTimePicker;
    BitBtn1: TBitBtn;
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
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure UpdateDBGrid;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);

  private
    { Private declarations }
    year,month,day,year1,month1,day1 :word;
    Datestr,Datestr1 :string;
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  YDDailyReportForm: TYDDailyReportForm;

implementation

uses CommonDM ;

{$R *.dfm}

function TYDDailyReportForm.CreateEditForm: TWSEditForm;
begin
//  Result :=;
end;



procedure TYDDailyReportForm.FormCreate(Sender: TObject);
begin
  inherited;
  DateTimePicker1.DateTime :=date;
  DateTimePicker2.DateTime :=date;
end;

procedure TYDDailyReportForm.DBGridCellClick(Column: TColumn);
begin
  UpdateDBGrid;
end;

procedure TYDDailyReportForm.DBGridDblClick(Sender: TObject);
begin
  UpdateDBGrid;
end;

procedure TYDDailyReportForm.UpdateDBGrid;
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


procedure TYDDailyReportForm.BitBtn1Click(Sender: TObject);
begin
  inherited;
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DateStr :=Datetostr(DateTimePicker1.Date);
  DateStr1 :=Datetostr(DateTimePicker2.Date);
  adsMaster.Close;
  adsMaster.CommandText :=' SELECT b.code [编号],b.Date [日期], '
      +' b.brief [摘要],b.BIllMode [业务类别],  '
      +' c.code [生产计划编号],                 '
      +' d.name [产品名称],a.GoodsSpec [规格型号], '
      +' a.Quantity [数量],e.name [单位],          '
      +' a.PriceBase [单位成本],a.Amount [成本金额]'
      +' FROM                                      '
      +' YDGoodsInDetail A                         '
      +' left outer join  YDGoodsInMaster  B on b.ID=a.Masterid       '
      +' left outer join  YDProductPlanMaster  c on c.ID=b.OriginID   '
      +' left outer join  DAGoods  d on d.ID=a.GoodsID                '
      +' left outer join  MSUnit   e on e.ID=a.PackunitID             '
      +' where b.recordstate<>'+Quotedstr('删除')+' and a.goodsid<>0  '
      +' and b.date>='+ Quotedstr(DateStr)
      +' and b.date<='+Quotedstr(DateStr1);
  adsMaster.Open;
  UpdateDBGrid;
end;

procedure TYDDailyReportForm.FormActivate(Sender: TObject);
begin
  inherited;
  BitBtn1Click(sender);
end;

procedure TYDDailyReportForm.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker2.Date<DateTimePicker1.Date then
      DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TYDDailyReportForm.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker1.Date>DateTimePicker2.Date then
      DateTimePicker2.Date :=DateTimePicker1.Date;
end;

end.
