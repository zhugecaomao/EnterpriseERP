unit FAAssetPlanRept;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TFAAssetPlanReptFrom = class(TWSVoucherBrowseForm)
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
    ToolButton1: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure UpdateDBGrid;
    procedure DBGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridTitleClick(Column: TColumn);

  private
    { Private declarations }
  public
     DateStr:string;
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FAAssetPlanReptFrom: TFAAssetPlanReptFrom;

implementation

uses CommonDM ;

{$R *.dfm}

function TFAAssetPlanReptFrom.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TFAAssetPlanReptFrom.BitBtn1Click(Sender: TObject);
var year,month,day :word;
begin
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DateStr :=Datetostr(DateTimePicker1.Date);

   adsMaster.Close;
   adsMaster.CommandText :=' select b.code [计划编号],b.date [计划日期], '
      +' b.Brief [资产名称],b.Apportion [维修计划类别],  '
      +' b.Deliver [维修计划说明],b.memo [维修计划备注], '
      +' c.name [具体资产],a.GoodsSpec [规格型号], '
      +' a.Amount [维修计划费用],a.Memo [详细维修方案] '
      +' from FAAssetRePlanDetail a  '
      +' left outer join FAAssetRePlanMaster b on b.id=a.masterID '
      +' left outer join DAGoods c on c.id=a.GoodsID '
      +' where b.Recordstate<>'+Quotedstr('删除')
      +' and b.date<>'+Quotedstr(DateStr)+' and a.GoodsID<>0';
   adsMaster.Open;
   UpdateDBGrid;
end;

procedure TFAAssetPlanReptFrom.FormCreate(Sender: TObject);
begin
  inherited;
  DateTimePicker1.Date :=date;
end;


procedure TFAAssetPlanReptFrom.DBGridCellClick(Column: TColumn);
begin
//  UpdateDBGrid;
end;

procedure TFAAssetPlanReptFrom.UpdateDBGrid;
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

procedure TFAAssetPlanReptFrom.DBGridDblClick(Sender: TObject);
var E:string;
begin
  {if adsMaster.IsEmpty then exit;
  if adsMaster.FieldByName('Balance').AsFloat >0 then
    E :='1' else E :='-1'    ;
   FNReceiptPayLegerForm.ShowForm(adsMaster.FieldByName('client').AsString,
      '资产明细帐--', adsMaster.FieldByName('clientId').AsString,Datestr,E);
                      }
end;

procedure TFAAssetPlanReptFrom.FormShow(Sender: TObject);
begin
  inherited;
  
  BitBtn1Click(sender);
end;

procedure TFAAssetPlanReptFrom.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

end.
