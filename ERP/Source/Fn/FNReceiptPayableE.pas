unit FNReceiptPayableE;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TFNReceiptPayableEFrom = class(TWSVoucherBrowseForm)
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
    adsMasterDSDesigner: TIntegerField;
    adsMasterDSDesigner2: TStringField;
    adsMasterDSDesigner3: TBCDField;
    adsMasterDSDesigner4: TBCDField;
    adsMasterDSDesigner5: TBCDField;
    adsMastername: TStringField;
    adsMasterbalance: TBCDField;
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
  FNReceiptPayableEFrom: TFNReceiptPayableEFrom;

implementation

uses CommonDM, FNReceiptPayLegerE ;

{$R *.dfm}

function TFNReceiptPayableEFrom.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TFNReceiptPayableEFrom.BitBtn1Click(Sender: TObject);
var year,month,day :word;
begin
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DAteStr := Datetostr(DateTimePicker1.Date);
  adsMaster.Close;
  adsMaster.CommandText :=' select clientID,clientID as [序号],'
    +' name, name as [职员姓名], AmountD as [其它应收余额],'
    +' AmountC as [其它应付余额], AmountD-AmountC as [差额/余额], '
    +' AmountD-AmountC as Balance  '
    +' from ('

    +' select clientID,name,Isnull(AmountD,0) AmountD ,Isnull(AmountC,0) AmountC'
    +' from ( '
    +' select clientID,name, sum(isnull(AmountD,0)-isnull(AmountC,0))'
    +' as AmountD ,'
    +' 0.00 as AmountC from #ReceiptPayE '
    +' where Recordstate<>'+Quotedstr('删除')+' and date <='+Quotedstr(DateStr)
    +' Group by clientID,name ) as a  '
    +' where a.AmountD>=0 '

    +' UNION ALL '

    +' select clientID,name,0.00 AS AmountD, Isnull(AmountD,0)*(-1) AS AmountC '
    +' from ( '
    +' select clientID,name, '
    +' sum(isnull(AmountD,0)-isnull(AmountC,0)) as AmountD, '
    +' 0.00 AmountC  '
    +' from #ReceiptPayE '
    +' where Recordstate<>'+Quotedstr('删除')+' and date <='+Quotedstr(DateStr)
    +' Group by clientID,name ) as a '
    +' where a.AmountD<0 '
    +' ) as a '  ;
  adsMaster.Open;
  UpdateDBGrid;
end;

procedure TFNReceiptPayableEFrom.FormCreate(Sender: TObject);
begin
  inherited;
  DateTimePicker1.Date :=date;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#ReceiptPayE')
        +' )) DROP TABLE #ReceiptPayE ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' CREATE TABLE #ReceiptPayE  ('
    +' [id] [int] IDENTITY (1, 1) NOT NULL , '
    +' [name] [varchar] (30)  NULL , '
    +' [clientID] [int] NULL ,                 '
    +' [AmountD] [Float] NULL ,                '
    +' [AmountC] [Float] NULL ,                '
    +' [billmode] [varchar] (16) NULL  ,  '
    +' [Recordstate] [varchar] (12) NULL  ,  '
    +' [date] [datetime] NULL  ) ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :='Truncate TABLE #ReceiptPayE ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :='insert into  #ReceiptPayE ( billmode,name,'
    +' clientID,AmountD, AmountC,Recordstate,date )'
    +' select a.billmode,b.name ,a.clientID, (isnull(AmountD,0)+Isnull(AmountRed,0) )* '
    +' Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1)  as AmountD,  0.00 as AmountC,   '
    +' a.Recordstate, a.date  from FNCashInMaster a '
    +' left outer join MSEmployee b on b.ID=a.ClientID '
    +' union all '
    +' select a.billmode,b.name,a.clientID, (isnull(AmountC,0)+Isnull(AmountRed,0) )* '
    +' Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD,  0.00 as AmountC,   '
    +' a.Recordstate ,a.date  from FNCashOutMaster a'
    +' left outer join MSEmployee b on b.ID=a.ClientID'
    +' union all '
    +' select a.billmode,b.name, a.clientID, ( Isnull(AmountRed,0) )* '
    +' Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1)  as AmountD,  0.00 as AmountC,   '
    +' a.Recordstate,a.date from FNExpenseMaster a'
    +' left outer join MSEmployee b on b.ID=a.ClientID'
    +' where isnull(AmountRed,0)<>0 '  ;
  ADOQuery.ExecSQL;
end;


procedure TFNReceiptPayableEFrom.DBGridCellClick(Column: TColumn);
begin
//  UpdateDBGrid;
end;

procedure TFNReceiptPayableEFrom.UpdateDBGrid;
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

procedure TFNReceiptPayableEFrom.DBGridDblClick(Sender: TObject);
begin
  if adsMaster.IsEmpty then exit;
   FNReceiptPayLegerEForm.ShowForm(adsMaster.FieldByName('Name').AsString,
       '其它应收明细帐--', adsMaster.FieldByName('clientId').AsString,Datestr,'');
end;

procedure TFNReceiptPayableEFrom.FormShow(Sender: TObject);
begin
  inherited;
  BitBtn1Click(sender);
end;

procedure TFNReceiptPayableEFrom.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

end.
