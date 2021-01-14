unit FNCashBook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, DateUtils,ToolWin, ADODB, StdCtrls, Buttons;

type
  TFNCashBookFrom = class(TWSVoucherBrowseForm)
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    AdsMsater: TADODataSet;
    Panel2: TPanel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    Label3: TLabel;
    AdsCashBook: TADODataSet;
    AdsCashBookDSDesigner: TStringField;
    AdsCashBookDSDesigner2: TBCDField;
    AdsCashBookDSDesigner3: TBCDField;
    AdsCashBookDSDesigner4: TBCDField;
    dsCashBook: TDataSource;
    AdsCashBookAccountsID: TIntegerField;
    AdsCashBookDSDesigner5: TStringField;
    AdsMsaterDSDesigner: TDateTimeField;
    AdsMsaterDSDesigner2: TStringField;
    AdsMsaterDSDesigner3: TStringField;
    AdsMsaterDSDesigner4: TStringField;
    AdsMsaterDSDesigner5: TStringField;
    AdsMsaterDSDesigner6: TStringField;
    AdsMsaterDSDesigner7: TStringField;
    AdsMsaterDSDesigner8: TBCDField;
    AdsMsaterDSDesigner9: TBCDField;
    AdsMsaterDSDesigner10: TBCDField;
    QLDBGrid1: TQLDBGrid;
    Splitter1: TSplitter;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure QLDBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FNCashBookFrom: TFNCashBookFrom;

implementation

uses CommonDM ;

{$R *.dfm}

function TFNCashBookFrom.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;

procedure TFNCashBookFrom.BitBtn1Click(Sender: TObject);
var year,month,day :word;
begin
    DecodeDate(DateTimePicker1.Date,year, month, day);
    AdsCashBook.Close;
    AdsCashBook.CommandText :=' select AccountsID,b.name as [帐户名称], '
        +' sum(isnull(a.AmountD,0)) as [收入金额], '
        +' sum(isnull(a.Amountc,0)) as [支出金额],  '
        +' sum(isnull(a.AmountD,0))-sum(isnull(a.AmountC,0)) as [余额] '
        +' , b.AccountManger as [帐户管理员] from '
        +' (select Date,RecordState,AccountsID,  AmountD, AmountC      '
        +' from FNclearslMaster                                        '
        +' UNION ALL                                                       '
        +' select Date,RecordState,AccountsID,  AmountD, AmountC       '
        +' from FNclearPCMaster                                        '
        +' UNION ALL                                                       '
        +' select Date,RecordState,AccountsID,  AmountD, AmountC       '
        +' from FNcashinMaster                                         '
        +' UNION ALL                                                       '
        +' select Date,RecordState,AccountsID,  AmountD, AmountC       '
        +' from FNcashoutMaster                                        '
        +' UNION ALL                                                       '
        +' select Date,RecordState,AccountsID,  0.00, AmountC          '
        +' from FNExpenseMaster                                        '
        +' UNION ALL                                                       '
        +' select Date,RecordState,ClientID as AccountsID,  AmountD, AmountC '
        +' from FNCashoutInMaster                                       '
        +' UNION ALL                                                        '
        +' select Date,RecordState,AccountsID,  AmountC, AmountD        '
        +' from FNCashoutInMaster )  a                                  '
        +' left outer join FNAccounts b on b.ID=a.AccountsID            '
        +' where a.RecordState<>'+Quotedstr('删除')+' and Date<= '
        +Quotedstr(Inttostr(year)+'-'+Inttostr(month)+'-'+Inttostr(day))
        +' Group by b.name,b.AccountManger,a.AccountsID ' ;
    AdsCashBook.Open;
end;

procedure TFNCashBookFrom.FormCreate(Sender: TObject);
begin
  DateTimePicker1.Date :=Date;
  DateTimePicker2.Date :=Date;
end;

procedure TFNCashBookFrom.FormActivate(Sender: TObject);
begin
//  inherited;
  {ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #TempStocka ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[date] [datetime] null,              '
      +'	[warehouseID] [float] NULL ,      '
      +'	[GoodsID] [int] NULL ,               '
      +'	[PackunitID] [int] NULL ,            '
      +'	[Quantity] [float] NULL ,   '
      +'	[GoalUnitID] [int] NULL ,            '
      +'	[GoalQuantity] [float] NULL ,   '
      +'	[UnitPrice] [money] NULL ,           '
      +'	[PackPrice] [money] NULL ,           '
      +'	[Amount] [float] NULL   )     ';
  ADOQuery.ExecSQL;
  ADOQuery.SQL.Text :=' create table #TempStockb ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[date] [datetime] null,              '
      +'	[warehouseID] [float] NULL ,      '
      +'	[GoodsID] [int] NULL ,               '
      +'	[PackunitID] [int] NULL ,            '
      +'	[Quantity] [float] NULL ,   '
      +'	[GoalUnitID] [int] NULL ,            '
      +'	[GoalQuantity] [float] NULL ,   '
      +'	[UnitPrice] [money] NULL ,           '
      +'	[PackPrice] [money] NULL ,           '
      +'	[Amount] [float] NULL   )     ';
  ADOQuery.ExecSQL;   }
end;

procedure TFNCashBookFrom.FormDeactivate(Sender: TObject);
begin
//  inherited;
  {ADOQuery.Close;
  ADOQuery.SQL.Text :=' Drop table #TempStocka ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' Drop table #TempStockb ';
  ADOQuery.ExecSQL; }
end;

procedure TFNCashBookFrom.DBGridCellClick(Column: TColumn);
var
  I: Integer;
  Field: TField;
  Balance:real;
begin
//  inherited;
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    Columns[0].Width :=70;
    for I := 1 to Columns.Count - 1 do
    begin
//      Columns[I].Width :=70;
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      begin
        Columns[I].Footer.ValueType := fvtSum;
      end
      else Columns[I].Footer.ValueType := fvtNon;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TFNCashBookFrom.FormShow(Sender: TObject);
begin
  DateTimePicker1.Date :=Date;
  DateTimePicker2.Date :=Date;
  BitBtn1Click(sender);
end;

procedure TFNCashBookFrom.DBGridDblClick(Sender: TObject);
var
  I: Integer;
  Field: TField;
  Balance:real;
begin
//  inherited;
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
//    Columns[0].Width :=70;
    for I := 1 to Columns.Count - 1 do
    begin
//      Columns[I].Width :=70;
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      begin
        Columns[I].Footer.ValueType := fvtSum;
      end
      else Columns[I].Footer.ValueType := fvtNon;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TFNCashBookFrom.Splitter1Moved(Sender: TObject);
begin
  inherited;
  if QLDBGrid1.Height<20 then  QLDBGrid1.Height:=30;
end;

procedure TFNCashBookFrom.QLDBGrid1DblClick(Sender: TObject);
begin
  inherited;
  AdsMsater.Close;
  AdsMsater.CommandText :=' select Date [日期],a.code [编号],billmode [业务类型], '
        +' brief [业务摘要], b.name [帐户名称] , '
        +' Client [收款人/付款人],a.RecordState [凭证状态],   '
        +' AmountD [收入金额], AmountC [支出金额],            '
        +' AmountD-AmountC [差额/余额]                        '
        +' from                                               '
        +' (select Date,a.code,billmode,brief,b.name as Client,a.RecordState,AccountsID,  AmountD, AmountC  '
        +' from FNclearslMaster a left outer join  daclient b on b.id=a.clientid                            '
        +' UNION ALL                                                                                            '
        +' select Date,a.code,billmode,brief,b.name as Client,a.RecordState,AccountsID,  AmountD, AmountC   '
        +' from FNclearPCMaster a left outer join  daclient b on b.id=a.clientid                            '
        +' UNION ALL                                                                                            '
        +' select Date,a.code,billmode,brief,b.name as Client,a.RecordState,AccountsID,  AmountD, AmountC   '
        +' from FNcashinMaster a left outer join  MSEmployee b on b.id=a.clientid                           '
        +' UNION ALL                                                                                            '
        +' select Date,a.code,billmode,brief,b.name as Client,a.RecordState,AccountsID,  AmountD, AmountC   '
        +' from FNcashoutMaster a left outer join  MSEmployee b on b.id=a.clientid                          '
        +' UNION ALL                                                                                            '
        +' select Date,a.code,billmode,brief,b.name as Client,a.RecordState,AccountsID,  0.00, AmountC      '
        +' from FNExpenseMaster a left outer join  MSEmployee b on b.id=a.clientid                          '
        +' UNION ALL                                                                                            '
        +' select Date,a.code,billmode,brief,b.name as Client,a.RecordState,AccountsID,  AmountD, AmountC   '
        +' from FNCashoutInMaster a left outer join  FNAccounts b on b.id=a.clientid                        '
        +' UNION ALL                                                                                            '
        +' select Date,a.code,billmode,brief,b.name as Client,a.RecordState,AccountsID,  AmountC, AmountD   '
        +' from FNCashoutInMaster a left outer join  MSEmployee b on b.id=a.clientid )                      '
        +' as a left outer join FNAccounts b on b.ID=a.AccountsID                                           '
        +' where a.RecordState<>'+Quotedstr('删除')+'  and a.AccountsID ='
        +AdsCashBook.fieldbyname('AccountsID').AsString  ;
  AdsMsater.Open;
end;

end.
