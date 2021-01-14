unit FAAssetChange;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TFAAssetChangeFrom = class(TWSVoucherBrowseForm)
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
    ADOQuery: TADOQuery;
    Label3: TLabel;
    adsMasterDSDesigner: TStringField;
    adsMasterDSDesigner2: TDateTimeField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner4: TStringField;
    adsMasterDSDesigner5: TStringField;
    adsMasterDSDesigner6: TStringField;
    adsMasterDSDesigner7: TStringField;
    adsMasterDSDesigner8: TStringField;
    adsMasterDSDesigner9: TBCDField;
    adsMasterDSDesigner10: TStringField;
    adsMasterDSDesigner11: TStringField;
    ToolButton1: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure UpdateDBGrid;
    procedure DBGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);

  private
    { Private declarations }
  public
     DateStr:string;
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FAAssetChangeFrom: TFAAssetChangeFrom;

implementation

uses CommonDM ;

{$R *.dfm}

function TFAAssetChangeFrom.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TFAAssetChangeFrom.BitBtn1Click(Sender: TObject);
var year,month,day,year1,month1,day1 :word;
    DateStr,DateStr1:string;
begin
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DateStr :=Datetostr(DateTimePicker1.Date);
  DateStr1 :=Datetostr(DateTimePicker2.Date);
  adsMaster.Close;
  adsMaster.CommandText :='select b.code [编号],b.date [日期], '
    +' b.BillMode [变动类别] ,  '
    +' b.Brief [资产名称],b.Apportion [资产类别], '
    +' b.Deliver [资产说明],b.memo [资产备注],    '
    +' c.name [具体资产],a.GoodsSpec [规格型号],  '
    +' a.Amount [资产原值],a.Memo [资产明细备注]  '
    +' from FAAssetAddDetail a                    '
    +' left outer join FAAssetAddMaster b on b.id=a.masterID '
    +' left outer join DAGoods c on c.id=a.GoodsID           '
    +' where b.Recordstate<>'+Quotedstr('删除')+' and A.goodsID<>0'
    +' and b.date>'+Quotedstr(DateStr)
    +' and b.date<='+Quotedstr(DateStr1)
    +' union all '
    +' select b.code [编号],b.date [日期],b.BillMode [变动类别] , '
    +' b.Brief [资产名称],b.Apportion [资产类别],                 '
    +' b.Deliver [资产说明],b.memo [资产备注],                    '
    +' c.name [具体资产],a.GoodsSpec [规格型号],                  '
    +' a.Amount [资产原值],a.Memo [资产明细备注]                  '
    +' from FAAssetReduceDetail a                                 '
    +' left outer join FAAssetReduceMaster b on b.id=a.masterID   '
    +' left outer join DAGoods c on c.id=a.GoodsID                '
    +' where b.Recordstate<>'+Quotedstr('删除')+' and A.goodsID<>0'
    +' and b.date>'+Quotedstr(DateStr)
    +' and b.date<='+Quotedstr(DateStr1);
  adsMaster.Open;
  UpdateDBGrid;
end;

procedure TFAAssetChangeFrom.FormCreate(Sender: TObject);
var year,month,day :word;
begin
  inherited;
  DecodeDate(date,year,month,day)  ;
  DateTimePicker1.Date :=Encodedate(year,month,1);
  DateTimePicker2.Date :=EndoftheMonth(date);
end;


procedure TFAAssetChangeFrom.DBGridCellClick(Column: TColumn);
begin
//  UpdateDBGrid;
end;

procedure TFAAssetChangeFrom.UpdateDBGrid;
var  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
//    Columns[0].Width :=150;
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

procedure TFAAssetChangeFrom.DBGridDblClick(Sender: TObject);
var E:string;
begin
  {if adsMaster.IsEmpty then exit;
  if adsMaster.FieldByName('Balance').AsFloat >0 then
    E :='1' else E :='-1'    ;
   FNReceiptPayLegerForm.ShowForm(adsMaster.FieldByName('client').AsString,
      '资产明细帐--', adsMaster.FieldByName('clientId').AsString,Datestr,E);
                      }
end;

procedure TFAAssetChangeFrom.FormShow(Sender: TObject);
begin
  inherited;
  BitBtn1Click(sender);
end;

procedure TFAAssetChangeFrom.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

procedure TFAAssetChangeFrom.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker2.Date<DateTimePicker1.Date then
      DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TFAAssetChangeFrom.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker1.Date>DateTimePicker2.Date then
      DateTimePicker2.Date :=DateTimePicker1.Date;
end;

end.
