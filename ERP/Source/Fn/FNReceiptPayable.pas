unit FNReceiptPayable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TFNReceiptPayableFrom = class(TWSVoucherBrowseForm)
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
    adsMasterclientID: TIntegerField;
    adsMasterclient: TStringField;
    adsMasterDSDesigner: TStringField;
    adsMasterDSDesigner2: TBCDField;
    adsMasterDSDesigner3: TBCDField;
    adsMasterDSDesigner4: TBCDField;
    adsMasterBalance: TBCDField;
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
  FNReceiptPayableFrom: TFNReceiptPayableFrom;

implementation

uses CommonDM, FNReceiptPayLeger ;

{$R *.dfm}

function TFNReceiptPayableFrom.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TFNReceiptPayableFrom.BitBtn1Click(Sender: TObject);
var year,month,day :word;
begin
   DecodeDate(DateTimePicker1.Date,year, month, day);
   DateStr := Datetostr(DateTimePicker1.Date);
   adsMaster.Close;
   adsMaster.CommandText :='select clientID,b.name as client, b.name as [客户/厂商], '
      +' isnull(AmountD,0) as [应收帐款余额], isnull(AmountC,0) as [应付帐款余额], '
      +' isnull(AmountD,0)-isnull(AmountC,0) as [差额/余额], '
      +' isnull(AmountD,0)-isnull(AmountC,0) as Balance  '
      +' from (                                                       '
      +' select ClientID,Sum(Isnull(AmountD,0)) as AmountD,0.00 as AmountC  '
      +' from (                                                                '
      +' select billmode,b.clientID,isnull(a.amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD,b.Recordstate ,b.date  '
      +' from slsaledetail a  left outer join SLSaleMaster b on b.ID=a.MasterID     '
      +' UNION ALL                                                                       '
      +' select billmode,clientID,( isnull(AmountD,0)+isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as AmountD,            '
      +' Recordstate,date from FNClearSLMaster                                         '
      +' UNION ALL                                                                          '
      +' select billmode,b.clientID,isnull(a.amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as AmountD,b.Recordstate ,b.date   '
      +' from PcPurchasedetail a  left outer join PcPurchaseMaster b on b.ID=a.MasterID  '
      +' UNION ALL                                                                           '
      +' select billmode,clientID,(isnull(AmountC,0)+isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD,Recordstate,date    '
      +' from FNClearPCMaster ) as a                                                     '
      +' where a.Recordstate<>'+Quotedstr('删除')+' and date<='+Quotedstr(Datestr)
      +' group by ClientID   ) as a                                                      '
      +' left outer join DAClient b on b.ID=a.ClientID                                   '
      +' where AmountD>0                                                                 '
      +' UNION ALL                                                                           '
      +' select clientID,b.name as client, b.name as [客户/厂商],                        '
      +' isnull(AmountC,0) as [应收帐款余额], isnull(AmountD,0)*(-1) as [应付帐款余额],                      '
      +' isnull(AmountD,0)-isnull(AmountC,0) as [差额/余额], isnull(AmountD,0)-isnull(AmountC,0) as Balance                      '
      +' from (                                                                          '
      +' select ClientID,Sum(Isnull(AmountD,0)) as AmountD,0.00 as AmountC               '
      +' from (                                                                           '
      +' select billmode,b.clientID,isnull(a.amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD,b.Recordstate ,b.date         '
      +' from slsaledetail a  left outer join SLSaleMaster b on b.ID=a.MasterID           '
      +' UNION ALL                                                                            '
      +' select billmode,clientID,(isnull(AmountD,0)+isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as AmountD,                '
      +' Recordstate,date from FNClearSLMaster                                           '
      +' UNION ALL                                                                           '
      +' select billmode,b.clientID,isnull(a.amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as AmountD,b.Recordstate ,b.date   '
      +' from PcPurchasedetail a  left outer join PcPurchaseMaster b on b.ID=a.MasterID  '
      +' UNION ALL                                                                            '
      +' select billmode,clientID,(isnull(AmountC,0)+isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD,Recordstate,date     '
      +' from FNClearPCMaster ) as a                                                      '
      +' where a.Recordstate<>'+Quotedstr('删除')+' and date<='+Quotedstr(Datestr)
      +' group by ClientID   ) as a                                                       '
      +' left outer join DAClient b on b.ID=a.ClientID                                    '
      +' where AmountD<0   ';
   adsMaster.Open;
   UpdateDBGrid;
end;

procedure TFNReceiptPayableFrom.FormCreate(Sender: TObject);
begin
  inherited;
  DateTimePicker1.Date :=date;
end;


procedure TFNReceiptPayableFrom.DBGridCellClick(Column: TColumn);
begin
//  UpdateDBGrid;
end;

procedure TFNReceiptPayableFrom.UpdateDBGrid;
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

procedure TFNReceiptPayableFrom.DBGridDblClick(Sender: TObject);
var E:string;
begin
  if adsMaster.IsEmpty then exit;
  if adsMaster.FieldByName('Balance').AsFloat >0 then
    E :='1' else E :='-1'    ;
   FNReceiptPayLegerForm.ShowForm(adsMaster.FieldByName('client').AsString,
       '应收应付明细帐--', adsMaster.FieldByName('clientId').AsString,Datestr,E);
end;

procedure TFNReceiptPayableFrom.FormShow(Sender: TObject);
begin
  inherited;
  BitBtn1Click(sender);
end;

procedure TFNReceiptPayableFrom.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

end.
