unit FNBalanceSheet;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TFNBalanceSheetForm = class(TWSVoucherBrowseForm)
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
    ADOQuery: TADOQuery;
    adsMasterDSDesigner: TAutoIncField;
    adsMasterDSDesigner2: TStringField;
    adsMasterDSDesigner3: TBCDField;
    adsMasterDSDesigner4: TBCDField;
    adsMasterDSDesigner5: TBCDField;
    adsMasterDSDesigner6: TBCDField;
    adsMasterDSDesigner7: TBCDField;
    adsMasterDSDesigner8: TBCDField;
    ToolButton1: TToolButton;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure UpdateDBGrid;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
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
  FNBalanceSheetForm: TFNBalanceSheetForm;

implementation

uses CommonDM ;

{$R *.dfm}

function TFNBalanceSheetForm.CreateEditForm: TWSEditForm;
begin
//  Result :=;
end;


procedure TFNBalanceSheetForm.BitBtn1Click(Sender: TObject);
var year,month,day,year1,month1,day1 :word;
    Datestr1,Datestr2 :string;
    BalanceD :real;
begin
  DecodeDate(DateTimePicker1.Date,year, month, day);
  DecodeDate(DateTimePicker2.Date,year1, month1, day1);
  DAteStr1 := Datetostr(DateTimePicker1.Date);
  DAteStr2 := Datetostr(DateTimePicker2.Date);
//--期初数据开始插入
  ADOQuery.Close;
  ADOQuery.SQL.Text :='Truncate Table #TempBS';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,FAmountD,FAmountC )'
      +' select '  +Quotedstr('301--业主资本')
      +' as  caption,0.00 as amountD,isnull(AmountC,0) -isnull(AmountD,0) as amountC '
      +' from (        '
      +' select ClientID as AccountsID, date ,code,0.00 as amountD,'
      +' isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' a.recordstate from FnCashoutinMaster a '
      +' left Outer join FNAccounts b on B.ID=A.ClientID '
      +' UNION ALL '
      +' select AccountsID, date ,code,isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD,0.00 as  amountC, '
      +' a.recordstate from FnCashoutinMaster a  '
      +' left Outer join FNAccounts b on B.ID=A.AccountsID '
      +'   ) as a  '
      +' left Outer join FNAccounts b on B.ID=A.AccountsID '
      +' where a.RecordState<>'+Quotedstr('删除')+ ' and b.AccountType '
      +' like '+Quotedstr('%业主资金%')+' and date<='+Quotedstr(DateStr1);
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,FAmountD,FAmountC )'
      +' select '  +Quotedstr('101--现金银行')
      +' as  caption, isnull(AmountD,0)-isnull(amountC,0)  as amountD, 0.00 as amountC '
      +' from (        '
      +' select ClientID as AccountsID, date ,code,0.00 as amountD,isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' a.recordstate from FnCashoutinMaster a '
      +' left Outer join FNAccounts b on B.ID=A.ClientID '   //调出帐户
      +' UNION ALL '
      +' select AccountsID, date ,code,isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD,0.00 as  amountC, '
      +' a.recordstate from FnCashoutinMaster a  '
      +' left Outer join FNAccounts b on B.ID=A.AccountsID '  //调入帐户
      +' UNION ALL '
      +' select AccountsID, date ,code,isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD ,0.00 as  amountC, '
      +' recordstate from FnCashInMaster   '                 //收款申请
      +' UNION ALL '
      +' select AccountsID, date ,code,0.00 as amountD,  amountC*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' recordstate from FnCashOutMaster   '                //付款申请
      +' UNION ALL '
      +' select AccountsID, date ,code,isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD ,0.00 as  amountC, '
      +' recordstate from FnClearSLMaster   '                 //结算收款申请
      +' UNION ALL '
      +' select AccountsID, date ,code,0.00 as amountD,  amountC*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' recordstate from FnClearPCMaster   '                //结算付款申请
      +' UNION ALL '
      +' select AccountsID, date ,code,0.00 as amountD,  amountC*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' recordstate from FnExpenseMaster   '                //报销付款申请

      +'   ) as a  '
      +' left Outer join FNAccounts b on B.ID=A.AccountsID '
      +' where a.RecordState<>'+Quotedstr('删除')+ ' and b.AccountType not like '
      +Quotedstr('%业主资金%')+' and date<='+Quotedstr(DateStr1);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,FAmountD,FAmountC )'
      +' select '  +Quotedstr('161--库存商品')
      +' as  caption,isnull(AmountD,0)-isnull(amountC,0)  as amountD,0.00 as amountC '
      +' from (        '
      +' select a.GoodsID, b.date ,b.code,isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as amountD,0.00 as amountC, '
      +' b.recordstate from PCGoodsInDetail a '
      +' left Outer join PCGoodsInMaster b on B.ID=A.MasterID '//采购入库
      +' UNION ALL '
      +' select a.GoodsID, b.date ,b.code,0.00 as amountD,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' b.recordstate from SLGoodsOutDetail a '
      +' left Outer join SLGoodsOutMaster b on B.ID=A.MasterID '//销售出库
      +' UNION ALL '
      +' select a.GoodsID, b.date ,b.code,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD,0.00 as amountC, '
      +' b.recordstate from YDGoodsInDetail a '
      +' left Outer join YDGoodsInMaster b on B.ID=A.MasterID '//生产入库
      +' UNION ALL '
      +' select a.GoodsID, b.date ,b.code,0.00 as amountD,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' b.recordstate from YDGoodsOutDetail a '
      +' left Outer join YDGoodsOutMaster b on B.ID=A.MasterID '//生产出库
      +' UNION ALL '
      +' select a.GoodsID, b.date ,b.code,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD,0.00 as amountC, '
      +' b.recordstate from STGoodsOutInDetail a '
      +' left Outer join STGoodsOutInMaster b on B.ID=A.MasterID '//库存调入
      +' UNION ALL '
      +' select a.GoodsID, b.date ,b.code,0.00 as amountD,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' b.recordstate from STGoodsOutInDetail a '
      +' left Outer join STGoodsOutInMaster b on B.ID=A.MasterID '//生产出库
      +'   ) as a  '
      +' where a.RecordState<>'+Quotedstr('删除')
      +' and date<='+Quotedstr(DateStr1);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,FAmountD,FAmountC )'
      +' select '  +Quotedstr('321--营业利润')
      +'  as  caption,0.00 as amountD, isnull(AmountC,0)-isnull(AmountD,0) as amountC '
      +' from (                                                   '
      +' select b.date ,b.code,0.00 as amountD,isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as amountC, '
      +' b.recordstate from SLSaleDetail a                                           '
      +' left Outer join SLSaleMaster b on B.ID=A.MasterID                           '
      +' UNION ALL                                                                       '
      +' select b.date ,b.code,isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as amountD,0.00 as amountC, '
      +' b.recordstate from SLGoodsOutDetail a                                       '
      +' left Outer join SLGoodsOutMaster b on B.ID=A.MasterID                       '
      +' UNION ALL                                                                       '
      +' select date ,code,(isnull(AmountC,0)+isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD,0.00 as AmountC, '
      +' recordstate from FNExpenseMaster '
      +' UNION ALL                                                                       '
      +' select date ,code,(isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD,0.00 as AmountC, '
      +' recordstate from FNClearSLMaster '
      +' UNION ALL                                                                       '
      +' select date ,code,(isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as AmountD,0.00 as AmountC, '
      +' recordstate from FNClearPCMaster '
      +'   ) as a                          '
      +' where a.RecordState<>'+QuotedStr('删除')+' and date<='
      + Quotedstr(Datestr1);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,FAmountD,FAmountC )'
      +' select '
      +'  caption,0.00 as amountD,isnull(AmountC,0)-isnull(AmountD,0) as amountC '
      +' from (                                                   '
      +'  select  ' + Quotedstr('211--应付帐款')+' as caption, b.RecordState,b.Date,0.00 as AmountD, '
      +' isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as AmountC '
      +' from PCPurchaseDetail a '
      +' left outer join PCPurchaseMaster b on b.ID=a.MasterID '
      +' UNION ALL '
      +' select  '+Quotedstr('211--应付帐款')+'  as caption, RecordState,Date,0.00 as AmountD, '
      +' (isnull(AmountC,0)+isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as AmountC '
      +' from FNClearPCMaster '
      +' UNION ALL '
      +' select  '+QuoTedstr('113--应收帐款')+' as caption, b.RecordState,b.Date,isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)  as AmountD, '
      +'  0.00 as AmountC '
      +' from SLSaleDetail a '
      +' left outer join SLSaleMaster b on b.ID=a.MasterID '
      +' UNION ALL '
      +' select  '+Quotedstr('113--应收帐款')+' as caption, RecordState,Date,(isnull(AmountD,0)+isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1)  as AmountD, '
      +' 0.00 as AmountC '
      +' from FNClearSLMaster  ) as a'
      +' where a.RecordState<>'+QuotedStr('删除')+' and date<='
      + Quotedstr(Datestr1);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,FAmountD,FAmountC )'
      +' select '
      +'  caption,0.00 as amountD,isnull(AmountC,0)-isnull(AmountD,0) as amountC '
      +' from ( '
      +' select '+ Quotedstr('129--其它应付应付')+' as caption , 0.00 as AmountD, '
      +' (isnull(AmountD,0)+Isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountC, '
      +' Recordstate ,date  from FNCashInMaster '
      +' UNION ALL '
      +' select '+ Quotedstr('129--其它应付应付')+' as caption , '
      +' (isnull(AmountD,0)+Isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD, '
      +'  0.00 as AmountC, Recordstate ,date  from FNCashOutMaster '
      +' UNION ALL '
      +' select '+ Quotedstr('129--其它应付应付')+' as caption , 0.00 as AmountD, '
      +' ( Isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountC, '
      +'  Recordstate ,date  from FNCashOutMaster '
      +'  ) as a'
      +' where a.RecordState<>'+QuotedStr('删除')+' and a.date<='
      + Quotedstr(Datestr1);
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select sum(Isnull(FAmountD,0)) -'
      +' sum(Isnull(FAmountC,0)) as FAmountD from #TempBS '  ;
  ADOQuery.open;
  if (not ADOQuery.fieldbyname('FAmountD').IsNull) and (ADOQuery.fieldbyname('FAmountD').AsFloat<>0) then
  begin
    BalanceD :=-ADOQuery.fieldbyname('FAmountD').AsFloat;
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' insert into #TempBS (Caption,FAmountD )'
        +' Values ('+Quotedstr('421--待调整帐项')+',' + Floattostr(BalanceD)+')' ;
    ADOQuery.ExecSQL;
  end;
//--期初数据插入完毕

//--本期数据开始插入
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,AmountD,AmountC )'
      +' select '  +Quotedstr('301--业主资本')
      +' as  caption, isnull(AmountD,0),isnull(AmountC,0) '
      +' from (        '
      +' select ClientID as AccountsID, date ,code,0.00 as amountD,'
      +' isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' a.recordstate from FnCashoutinMaster a '
      +' left Outer join FNAccounts b on B.ID=A.ClientID '
      +' UNION ALL '
      +' select AccountsID, date ,code,isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD,0.00 as  amountC, '
      +' a.recordstate from FnCashoutinMaster a  '
      +' left Outer join FNAccounts b on B.ID=A.AccountsID '
      +'   ) as a  '
      +' left Outer join FNAccounts b on B.ID=A.AccountsID '
      +' where a.RecordState<>'+Quotedstr('删除')+ ' and b.AccountType '
      +' like '+Quotedstr('%业主资金%')+' and date>'+Quotedstr(DateStr1)
      +' and date<='+Quotedstr(Datestr2);
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,AmountD,AmountC )'
      +' select '  +Quotedstr('101--现金银行')
      +' as  caption, isnull(AmountD,0),  isnull(AmountC,0) '
      +' from (        '
      +' select ClientID as AccountsID, date ,code,0.00 as amountD,isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' a.recordstate from FnCashoutinMaster a '
      +' left Outer join FNAccounts b on B.ID=A.ClientID '   //调出帐户
      +' UNION ALL '
      +' select AccountsID, date ,code,isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD,0.00 as  amountC, '
      +' a.recordstate from FnCashoutinMaster a  '
      +' left Outer join FNAccounts b on B.ID=A.AccountsID '  //调入帐户
      +' UNION ALL '
      +' select AccountsID, date ,code,isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD ,0.00 as  amountC, '
      +' recordstate from FnCashInMaster   '                 //收款申请
      +' UNION ALL '
      +' select AccountsID, date ,code,0.00 as amountD,  isnull(AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' recordstate from FnCashOutMaster   '                //付款申请
      +' UNION ALL '
      +' select AccountsID, date ,code,isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD ,0.00 as  amountC, '
      +' recordstate from FnClearSLMaster   '                 //结算收款申请
      +' UNION ALL '
      +' select AccountsID, date ,code,0.00 as amountD,  isnull(AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' recordstate from FnClearPCMaster   '                //结算付款申请
      +' UNION ALL '
      +' select AccountsID, date ,code,0.00 as amountD,  isnull(AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' recordstate from FnExpenseMaster   '                //报销付款申请
      +'   ) as a  '
      +' left Outer join FNAccounts b on B.ID=A.AccountsID '
      +' where a.RecordState<>'+Quotedstr('删除')+ ' and b.AccountType not like '
      +Quotedstr('%业主资金%')+' and date>'+Quotedstr(DateStr1)
      +' and date<='+Quotedstr(Datestr2);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,AmountD,AmountC )'
      +' select '  +Quotedstr('161--库存商品')
      +' as  caption, isnull(AmountD,0) ,isnull(AmountC,0) '
      +' from (        '
      +' select a.GoodsID, b.date ,b.code,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD,0.00 as AmountC, '
      +' b.recordstate from PCGoodsInDetail a '
      +' left Outer join PCGoodsInMaster b on B.ID=A.MasterID '//采购入库
      +' UNION ALL '
      +' select a.GoodsID, b.date ,b.code,0.00 as amountD,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' b.recordstate from SLGoodsOutDetail a '
      +' left Outer join SLGoodsOutMaster b on B.ID=A.MasterID '//销售出库
      +' UNION ALL '
      +' select a.GoodsID, b.date ,b.code,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD,0.00 as amountC, '
      +' b.recordstate from YDGoodsInDetail a '
      +' left Outer join YDGoodsInMaster b on B.ID=A.MasterID '//生产入库
      +' UNION ALL '
      +' select a.GoodsID, b.date ,b.code,0.00 as amountD,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' b.recordstate from YDGoodsOutDetail a '
      +' left Outer join YDGoodsOutMaster b on B.ID=A.MasterID '//生产出库
      +' UNION ALL '
      +' select a.GoodsID, b.date ,b.code,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountD,0.00 as amountC, '
      +' b.recordstate from STGoodsOutInDetail a '
      +' left Outer join STGoodsOutInMaster b on B.ID=A.MasterID '//库存调入
      +' UNION ALL '
      +' select a.GoodsID, b.date ,b.code,0.00 as amountD,isnull(Amount,0)*b.Isnull(ModeDC,1)*Isnull(ModeC,1) as amountC, '
      +' b.recordstate from STGoodsOutInDetail a '
      +' left Outer join STGoodsOutInMaster b on B.ID=A.MasterID '//生产出库
      +'   ) as a  '
      +' where a.RecordState<>'+Quotedstr('删除')+' and date>'+Quotedstr(DateStr1)
      +' and date<='+Quotedstr(Datestr2);

//  Memo1.text :=ADOQuery.SQL.Text;
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,AmountD,AmountC )'
      +' select '  +Quotedstr('321--营业利润')
      +'  as  caption, isnull(AmountD,0),isnull(AmountC,0) '
      +' from (                                                   '
      +' select b.date ,b.code,0.00 as amountD,isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as amountC, '
      +' b.recordstate from SLSaleDetail a                                           '
      +' left Outer join SLSaleMaster b on B.ID=A.MasterID                           '
      +' UNION ALL                                                                       '
      +' select b.date ,b.code,isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as amountD,0.00 as amountC, '
      +' b.recordstate from SLGoodsOutDetail a                                       '
      +' left Outer join SLGoodsOutMaster b on B.ID=A.MasterID                       '
      +' UNION ALL                                                                       '
      +' select date ,code,(isnull(AmountC,0)+isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD,0.00 as AmountC, '
      +' recordstate from FNExpenseMaster '
      +' UNION ALL                                                                       '
      +' select date ,code,(isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD,0.00 as AmountC, '
      +' recordstate from FNClearSLMaster '
      +' UNION ALL                                                                       '
      +' select date ,code,(isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1)*(-1) as AmountD,0.00 as AmountC, '
      +' recordstate from FNClearPCMaster '
      +'   ) as a                          '
      +' where a.RecordState<>'+QuotedStr('删除')+' and date>'+ Quotedstr(Datestr1)
      +' and date<='+Quotedstr(Datestr2);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,AmountD,AmountC )'
      +' select '
      +'  caption, isnull(AmountD,0), isnull(AmountC,0) '
      +' from (                                                   '
      +'  select  ' + Quotedstr('211--应付帐款')+' as caption, b.RecordState,b.Date,0.00 as AmountD, '
      +' isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) as AmountC '
      +' from PCPurchaseDetail a '
      +' left outer join PCPurchaseMaster b on b.ID=a.MasterID '
      +' UNION ALL '
      +' select  '+Quotedstr('211--应付帐款')+'  as caption, RecordState,Date,(isnull(AmountC,0)+isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1)  as AmountD, '
      +' 0.00 as AmountC '
      +' from FNClearPCMaster '
      +' UNION ALL '
      +' select  '+QuoTedstr('113--应收帐款')+' as caption, b.RecordState,b.Date,isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1)  as AmountD, '
      +'  0.00 as AmountC '
      +' from SLSaleDetail a '
      +' left outer join SLSaleMaster b on b.ID=a.MasterID '
      +' UNION ALL '
      +' select  '+Quotedstr('113--应收帐款')+' as caption, RecordState,Date, 0.00 as AmountD, '
      +' (isnull(AmountD,0)+isnull(AmountRed,0))*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountC '
      +' from FNClearSLMaster  ) as a'
      +' where a.RecordState<>'+QuotedStr('删除')+' and date>'+ Quotedstr(Datestr1)
      +' and date<='+Quotedstr(Datestr2);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' insert into #TempBS (Caption,AmountD,AmountC )'
      +' select '
      +'  caption,0.00 as amountD,isnull(AmountC,0)-isnull(AmountD,0) as amountC '
      +' from ( '
      +' select '+ Quotedstr('129--其它应付应付')+' as caption , 0.00 as AmountD, '
      +' (isnull(AmountD,0)+Isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountC, '
      +' Recordstate ,date  from FNCashInMaster '
      +' UNION ALL '
      +' select '+ Quotedstr('129--其它应付应付')+' as caption , '
      +' (isnull(AmountD,0)+Isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountD, '
      +'  0.00 as AmountC, Recordstate ,date  from FNCashOutMaster '
      +' UNION ALL '
      +' select '+ Quotedstr('129--其它应付应付')+' as caption , 0.00 as AmountD, '
      +' ( Isnull(AmountRed,0) )*Isnull(ModeDC,1)*Isnull(ModeC,1) as AmountC, '
      +'  Recordstate ,date  from FNCashOutMaster '
      +'  ) as a'
      +' where a.RecordState<>'+QuotedStr('删除')+' and date>'+ Quotedstr(Datestr1)
      +' and date<='+Quotedstr(Datestr2);
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' select sum(Isnull(AmountD,0)) -'
      +' sum(Isnull(AmountC,0)) as FAmountD from #TempBS ';
  ADOQuery.open;
  if (not ADOQuery.fieldbyname('FAmountD').IsNull) and (ADOQuery.fieldbyname('FAmountD').AsFloat<>0) then
  begin
    BalanceD :=-ADOQuery.fieldbyname('FAmountD').AsFloat;
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' insert into #TempBS (Caption,AmountD )'
        +' Values ('+Quotedstr('421--待调整帐项')+',' + Floattostr(BalanceD)+')' ;
    ADOQuery.ExecSQL;
  end;
//--本期数据开始插入完毕

  ADOQuery.Close;
  ADOQuery.SQL.Text :='Truncate Table #TempBSE';
  ADOQuery.ExecSQL;
  ADOQuery.Close;   //统计汇总项目
  ADOQuery.SQL.Text :=' insert into  #TempBSE (caption,FamountD,FAmountC , '
      +' amountD,AmountC ,EamountD,EAmountC  )'
      +' select caption,sum(Isnull(FamountD,0))-sum(Isnull(FamountC,0)) '
      +' as FAmountD, 0.00 as FAmountC ,'
      +' sum(Isnull(amountD,0)) ,sum(Isnull(amountC,0)) , '
      +' sum(Isnull(FamountD,0))+sum(Isnull(amountD,0))- '
      +' sum(Isnull(FamountC,0))-sum(Isnull(amountC,0))  as EamountD,'
      +' 0.00 as EamountC  from #TempBS'
      +' Group by caption ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #TempBSE set FAmountC=FAmountD*(-1)'
      +' where FAmountD<0 ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #TempBSE set EAmountC=EAmountD*(-1)'
      +' where EAmountD<0 ';
  ADOQuery.ExecSQL;

  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #TempBSE set FAmountD=0'
      +' where FAmountD<0 ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' update #TempBSE set EAmountD=0'
      +' where EAmountD<0 ';
  ADOQuery.ExecSQL;
  ADOQuery.SQL.Text :=' update #TempBSE set EAmountC=EAmountC-EAmountD ,'
          +'  EAmountD=0 where caption='+Quotedstr('321--营业利润');
  ADOQuery.ExecSQL;

  adsMaster.Close;
  adsMaster.CommandText :=' select id as [序号],Caption as [项目名称],  '
        +' FAmountD as  [期初借方余额],  '
        +' FAmountC as  [期初贷方余额], '
        +' AmountD as  [本期借方发生],  '
        +' AmountC as  [本期贷方发生], '
        +' EAmountD as  [期末借方余额],  '
        +' EAmountC as  [期末贷方余额] '
        +' from  #TempBSE '
        +' where abs(FAmountD)+abs(FAmountC)+abs(AmountD)+abs(AmountC)+'
        +' abs(EAmountD)+abs(EAmountC) <>0' ;
   adsMaster.Open;
   UpdateDBGrid;
end;

procedure TFNBalanceSheetForm.FormCreate(Sender: TObject);
var year,month,day :word;
begin
  inherited;
  DecodeDate(date,year,month,day)  ;
  DateTimePicker1.Date :=Encodedate(year,month,1);
  DateTimePicker2.Date :=EndoftheMonth(date);
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempBS')
        +' )) DROP TABLE #TempBS ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempBSE')
        +' )) DROP TABLE #TempBSE ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #TempBS ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[caption] [varchar] (30) ,          '
      +'	[FAmountD] [float] NULL ,   '
      +'	[FAmountC] [float] NULL ,   '
      +'	[AmountD] [float] NULL ,   '
      +'	[AmountC] [float] NULL ,   '
      +'	[EAmountD] [float] NULL ,   '
      +'	[EAmountC] [float] NULL ,   '
      +'	[Memo] [varchar] (30) )   ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' create table #TempBSE ('
      +'	[ID] [int] IDENTITY (1, 1) NOT NULL ,'
      +'	[caption] [varchar] (30) ,          '
      +'	[FAmountD] [float] NULL ,   '
      +'	[FAmountC] [float] NULL ,   '
      +'	[AmountD] [float] NULL ,   '
      +'	[AmountC] [float] NULL ,   '
      +'	[EAmountD] [float] NULL ,   '
      +'	[EAmountC] [float] NULL ,   '
      +'	[Memo] [varchar] (30) )   ';
  ADOQuery.ExecSQL;
end;

procedure TFNBalanceSheetForm.UpdateDBGrid;
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

procedure TFNBalanceSheetForm.DateTimePicker1Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker1.Date>DateTimePicker2.Date then
      DateTimePicker2.Date :=DateTimePicker1.Date;
end;

procedure TFNBalanceSheetForm.DateTimePicker2Change(Sender: TObject);
begin
  inherited;
  if  DateTimePicker2.Date<DateTimePicker1.Date then
      DateTimePicker1.Date :=DateTimePicker2.Date;
end;

procedure TFNBalanceSheetForm.FormActivate(Sender: TObject);
begin
  inherited;
  BitBtn1Click(sender);
end;

procedure TFNBalanceSheetForm.DBGridTitleClick(Column: TColumn);
begin
  inherited;
  UpdateDBGrid;
end;

procedure TFNBalanceSheetForm.DBGridDblClick(Sender: TObject);
begin
//  inherited;

end;

end.
