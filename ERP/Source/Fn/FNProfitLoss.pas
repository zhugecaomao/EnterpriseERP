unit FNProfitLoss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TFNProfitLossForm = class(TWSVoucherBrowseForm)
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
    adsMasterDSDesigner: TStringField;
    adsMasterDSDesigner2: TBCDField;
    ToolButton1: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure UpdateDBGrid;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FNProfitLossForm: TFNProfitLossForm;

implementation

uses CommonDM ;

{$R *.dfm}

function TFNProfitLossForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TFNProfitLossForm.BitBtn1Click(Sender: TObject);
var year,month,day,year1,month1,day1 :word;
    Datestr1,Datestr2 :string;
begin
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DAteStr1 := Datetostr(DateTimePicker1.Date);
  DAteStr2 := Datetostr(DateTimePicker2.Date);
  adsMaster.Close;
  adsMaster.CommandText :=' select caption as [项目],'
      +' Sum(isnull(Amount,0)) as [金额] '
      +' from       '
      +' ( select  '+Quotedstr('1--销售收入')+' as caption, '
      +' b.RecordState,b.Date,isnull(a.Amount,0) as amount '
      +' from SlSaledetail a '
      +' left outer join SLSaleMaster b on b.ID=a.MasterID '
      +' UNION ALL   '
      +' select '+Quotedstr('2--[减]销售成本')+' as caption,b.RecordState,b.Date,isnull(a.Amount,0) as amount '
      +' from SlGoodsOutdetail a '
      +' left outer join SLGoodsOutMaster b on b.ID=a.MasterID '
      +' UNION ALL   '
      +' select  '+Quotedstr('3--[减]销售折扣折让')+' as caption, RecordState,Date,(isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1) as Amount '
      +' from FNClearSLMaster '
      +' UNION ALL   '
      +' select  '+Quotedstr('4--[加]采购折扣折让')+' as caption, RecordState,Date,'
      +' (isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1) as Amount '
      +' from FNClearPCMaster '
      +' UNION ALL '
      +' select '+Quotedstr('5--销售毛利')+' as caption,RecordState,Date,isnull(Amount,0) as Amount'
      +' from (  '
      +' select  '+Quotedstr('销售收入')+' as caption, b.RecordState,b.Date,isnull(a.Amount,0) as Amount '
      +' from SlSaledetail a '
      +' left outer join SLSaleMaster b on b.ID=a.MasterID '
      +' UNION ALL '
      +' select '+Quotedstr('销售成本')+' as caption,b.RecordState,b.Date,isnull(a.Amount,0)*(-1) as Amount  '
      +' from SlGoodsOutdetail a '
      +' left outer join SLGoodsOutMaster b on b.ID=a.MasterID '
      +' UNION ALL   '
      +' select  '+Quotedstr('销售折扣折让')+' as caption, RecordState,Date, '
      +'(isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as Amount '
      +' from FNClearSLMaster '
      +' UNION ALL   '
      +' select  '+Quotedstr('采购折扣折让')+' as caption, RecordState,Date, '
      +' (isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1) as Amount '
      +' from FNClearPCMaster '
      +'   ) as a     '
      +' UNION ALL '
      +' select  '+Quotedstr('6--[减]经营费用')+' as caption,RecordState,Date, '
      +' isnull(AmountC,0)+isnull(AmountRed,0) as  Amount '
      +' from FNExpenseMaster '
      +' UNION ALL '
      +' select '+Quotedstr('7--营业利润')+'  as caption,RecordState,Date,isnull(Amount,0) as Amount'
      +' from '
      +' ( select  '+Quotedstr('销售收入')+' as caption, b.RecordState,b.Date,isnull(a.Amount,0) as Amount '
      +' from SlSaledetail a '
      +' left outer join SLSaleMaster b on b.ID=a.MasterID '
      +' UNION ALL '
      +' select '+Quotedstr('销售成本')+' as caption,b.RecordState,b.Date,isnull(a.Amount,0)*(-1) as Amount'
      +' from SlGoodsOutdetail a '
      +' left outer join SLGoodsOutMaster b on b.ID=a.MasterID '
      +' UNION ALL   '
      +' select  '+Quotedstr('销售折扣折让')+' as caption, RecordState,Date,(isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as Amount'
      +' from FNClearSLMaster '
      +' UNION ALL   '
      +' select  '+Quotedstr('采购折扣折让')+' as caption, RecordState,Date, '
      +' (isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1) as Amount '
      +' from FNClearPCMaster '
      +' UNION ALL '
      +' select  '+Quotedstr('经营费用')+' as caption,RecordState,Date,(isnull(AmountC,0)+isnull(AmountRed,0))*(-1) as '
      +' Amount  '
      +' from FNExpenseMaster '
      +'   ) as a    ) as a '
      +' where a.Recordstate<>'+Quotedstr('删除')+' and a.date >='
      + Quotedstr(DateStr1) +'and a.date <='+ Quotedstr(DateStr2)
      +' group by a.caption order by caption '  ;
 adsMaster.Open;
// UpdateDBGrid;
end;

procedure TFNProfitLossForm.FormCreate(Sender: TObject);
var year,month,day :word;
begin
  inherited;
  DecodeDate(date,year,month,day)  ;
  DateTimePicker1.Date :=Encodedate(year,month,1);
  DateTimePicker2.Date :=EndoftheMonth(date);
end;

procedure TFNProfitLossForm.DBGridCellClick(Column: TColumn);
begin
//  UpdateDBGrid;
end;

procedure TFNProfitLossForm.DBGridDblClick(Sender: TObject);
begin
//  UpdateDBGrid;
end;

procedure TFNProfitLossForm.UpdateDBGrid;
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

procedure TFNProfitLossForm.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker1.Date>DateTimePicker2.Date then
      DateTimePicker2.Date :=DateTimePicker1.Date;
end;

procedure TFNProfitLossForm.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker2.Date<DateTimePicker1.Date then
      DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TFNProfitLossForm.FormShow(Sender: TObject);
begin
  inherited;
  BitBtn1Click(sender);
end;

procedure TFNProfitLossForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
//  UpdateDBGrid;
end;

end.
