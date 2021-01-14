unit BaseVoucherEditA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherEditSY, Menus, ActnList, DB, QLDBLkp, ComCtrls, StdCtrls,
  Mask, DBCtrls, ExtCtrls, ToolWin, Grids, DBGrids, QLDBGrid, QuickRpt,
  WSVoucherEdit;

type
  TBaseVoucherEditAForm = class(TWSVoucherEditSYForm)
    CheckAction: TAction;
    RedWordAction: TAction;
    C2: TMenuItem;
    R1: TMenuItem;
    N7: TMenuItem;
    ActualStock: TAction;
    A4: TMenuItem;
    StockChange: TAction;
    PCOrderTrail: TAction;
    SLOrderTrail: TAction;
    SLsaleLeger: TAction;
    SLClearLeger: TAction;
    SLActualPrice: TAction;
    SLCredit: TAction;
    SalePrice: TAction;
    SLContractPrice: TAction;
    PCPurchaseLeger: TAction;
    PCClearLeger: TAction;
    PCActualPrice: TAction;
    PCCredit: TAction;
    PurchasePrice: TAction;
    PCContractPrice: TAction;
    N14: TMenuItem;
    N15: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    SubmitCNLAction: TAction;
    N30: TMenuItem;
    StockConsign: TAction;
    CashBalance: TAction;
    N32: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    CashFlow: TAction;
    EmployeeLend: TAction;
    N36: TMenuItem;
    N37: TMenuItem;
    ReceiptPayable: TAction;
    N38: TMenuItem;
    FNExpenseReport: TAction;
    N39: TMenuItem;
    N40: TMenuItem;
    N13: TMenuItem;
    N31: TMenuItem;
    YDPurchasePlan: TAction;
    N48: TMenuItem;
    procedure SLActualPriceExecute(Sender: TObject);
    procedure RedWordActionExecute(Sender: TObject);
    procedure CheckActionExecute(Sender: TObject);
    procedure SLOrderTrailExecute(Sender: TObject);
    procedure StockChangeExecute(Sender: TObject);
    procedure SLsaleLegerExecute(Sender: TObject);
    procedure SLClearLegerExecute(Sender: TObject);
    procedure SLCreditExecute(Sender: TObject);
    procedure PCCreditExecute(Sender: TObject);
    procedure SalePriceExecute(Sender: TObject);
    procedure PurchasePriceExecute(Sender: TObject);
    procedure SLContractPriceExecute(Sender: TObject);
    procedure PCContractPriceExecute(Sender: TObject);
    procedure PCOrderTrailExecute(Sender: TObject);
    procedure PCActualPriceExecute(Sender: TObject);
    procedure PCClearLegerExecute(Sender: TObject);
    procedure CashBalanceExecute(Sender: TObject);
    procedure PCPurchaseLegerExecute(Sender: TObject);
    procedure ActualStockExecute(Sender: TObject);
    procedure ReceiptPayableExecute(Sender: TObject);
    procedure EmployeeLendExecute(Sender: TObject);
    procedure StockConsignExecute(Sender: TObject);
    procedure UpdateDBGrid;
    procedure FormShow(Sender: TObject);
    procedure YDPurchasePlanExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateReport: TQuickRep; override;
  public
    { Public declarations }
  end;

implementation

uses VoucherQuery, BaseVoucherRpt;

{$R *.dfm}

procedure TBaseVoucherEditAForm.SLActualPriceExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(SLActualPrice.Caption,SLActualPrice.Hint,' select a.Code as [编号],a.Date as [日期], '
        +' a.BillMode [业务类别],                     '
        +' a.Deliver [交货方式], c.name as [客户名称] ,'
        +' E.name as [商品名称],f.name as [包装单位],'
        +' b.Quantity as [商品数量],g.name as  [标准单位],'
        +' b.PriceBase as [单价],                          '
        +' d.name as [经手人]                              '
        +' from SLSaleDetail  b                           '
        +' left outer join SLSaleMaster a on  a.id=b.masterID '
        +' left outer join  DAClient c     on c. ID=a.ClientID '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID     '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID   '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID   '
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')
        +' order by a.Date Desc ');
end;

procedure TBaseVoucherEditAForm.RedWordActionExecute(Sender: TObject);
var
  Field: TField;
begin
  inherited;
  with MasterDataSet do
  begin
    Edit;
    Field := FindField('ModeC');
    if Field <> nil then
      if Field.AsInteger=-1 then exit
      else  Field.AsInteger :=-1;
    Field := FindField('BillMode');
    if Field <> nil then
    begin
      Field.ReadOnly :=False;
      Field.AsString := Field.AsString + '[红字]';
      Field.ReadOnly :=True;
    end;
  end;
end;

procedure TBaseVoucherEditAForm.CheckActionExecute(Sender: TObject);
begin
  inherited;
  with MasterDataSet do
  begin
    Edit;
    FieldByName('RecordState').AsString := '复核';
    ShowMessage('单据已经复核，在未提交之前仍可修改');
  end;
end;

procedure TBaseVoucherEditAForm.SLOrderTrailExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(SLOrderTrail.Caption,SLOrderTrail.Hint,' select * from ( '
        +' select a.Code as [编号],a.Date [日期],                 '
        +' a.BillMode [业务类别],                               '
        +' a.ClearDate [交货日期],                              '
        +' a.Deliver [交货方式], c.name as [客户名称] ,         '
        +' E.name as [商品名称],f.name as [包装单位],           '
        +' b.Quantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [数量], '
        +' g.name as  [标准单位],      '
        +' b.GoalQuantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [标准数量], '
        +' b.PriceBase as [单价],                               '
        +' b.Amount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [商品金额] ,            '
        +' b.TaxAmount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [税金] ,             '
        +' b.SundryFee*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [附加费用],          '
        +' b.Discount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [折扣金额],           '
        +' d.name as [经手人],                                  '
        +' a.RecordState as [凭单状态]                          '
        +' from SLOrderDetail  b                                '
        +' left outer join SLOrderMaster a on  a.id=b.masterID    '
        +' left outer join  DAClient c     on c. ID=a.ClientID   '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID    '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID'
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')
        +' and b.GoodsID<>0 and b.GoalQuantity<>0'
        +' UNION ALL  '
        +' select a.Code as [编号],a.Date [日期],                   '
        +' a.BillMode [业务类别],                               '
        +' a.ClearDate [交货日期],                              '
        +' a.Deliver [交货方式], c.name as [客户名称] ,         '
        +' E.name as [商品名称],f.name as [包装单位],           '
        +' b.Quantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [数量],'
        +' g.name as  [标准单位],      '
        +' b.GoalQuantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [标准数量], '
        +' b.PriceBase as [单价],                               '
        +' b.Amount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [商品金额] ,            '
        +' b.TaxAmount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [税金] ,             '
        +' b.SundryFee*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [附加费用],          '
        +' b.Discount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [折扣金额],           '
        +' d.name as [经手人],                                  '
        +' a.RecordState as [凭单状态]                          '
        +' from SLsaleDetail  b                                '
        +' left outer join SLsaleMaster a on  a.id=b.masterID    '
        +' left outer join  DAClient c     on c. ID=a.ClientID   '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID    '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID'
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')
        +' and b.GoodsID<>0 and b.GoalQuantity<>0'
        +' and a.ClientID in (select Distinct ClientID from SLOrderMaster) '
        +' ) as a  order by [日期] DESC');

end;

procedure TBaseVoucherEditAForm.StockChangeExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(StockChange.Caption,StockChange.Hint,
        ' select a.Code as [编号],a.Date [日期],           '
        +' a.BillMode [业务类别],                           '
        +' w.name as [仓库名称] ,                           '
        +' E.name as [商品名称],f.name as [包装单位],       '
        +' b.Quantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [数量],      '
        +' g.name as  [标准单位],                            '
        +' b.GoalQuantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [标准数量],     '
        +' a.Deliver [提货/交货方式], c.name as [提货人/交货人] ,  '
        +' d.name as [经手人],                                     '
        +' a.RecordState as [凭单状态]                             '
        +' from SLGoodsOutDetail  b                                '
        +' left outer join SLGoodsOutMaster a on  a.id=b.masterID  '
        +' left outer join  DAClient c     on c. ID=a.ClientID     '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID    '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID        '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID      '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID      '
        +' left outer join  STWarehouse w   on w.id=a.WarehouseID  '
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')
        +' UNION ALL '
        +' select a.Code as [编号],a.Date [日期],                  '
        +' a.BillMode [业务类别],                                  '
        +' w.name as [仓库名称] ,                                  '
        +' E.name as [商品名称],f.name as [包装单位],              '
        +' b.Quantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [数量],                  '
        +' g.name as  [标准单位],                                  '
        +' b.GoalQuantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [标准数量],          '
        +' a.Deliver [提货/交货方式], c.name as [提货人/交货人] ,  '
        +' d.name as [经手人],                                     '
        +' a.RecordState as [凭单状态]                             '
        +' from PCGoodsInDetail  b                                 '
        +' left outer join PCGoodsInMaster a on  a.id=b.masterID   '
        +' left outer join  DAClient c     on c. ID=a.ClientID     '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID    '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID        '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID      '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID      '
        +' left outer join  STWarehouse w   on w.id=a.WarehouseID  '
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')+' '  );
end;

procedure TBaseVoucherEditAForm.SLsaleLegerExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(SLsaleLeger.Caption,SLsaleLeger.Hint,
        ' select a.Code as [编号],a.Date as [日期],    '
        +' a.BillMode [业务类别],                      '
        +' a.ClearDate [交货日期],                              '
        +' a.Deliver [交货方式], c.name as [客户名称] ,         '
        +' E.name as [商品名称],f.name as [包装单位],           '
        +' b.Quantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [数量],'
        +' g.name as  [标准单位],      '
        +' b.GoalQuantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [标准数量], '
        +' b.PriceBase as [单价],                               '
        +' b.Amount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [商品金额] ,            '
        +' b.TaxAmount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [税金] ,             '
        +' b.SundryFee*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [附加费用],          '
        +' b.Discount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [折扣金额],           '
        +' d.name as [经手人],                                  '
        +' a.RecordState as [凭单状态]                          '
        +' from SLsaleDetail  b                                '
        +' left outer join SLsaleMaster a on  a.id=b.masterID    '
        +' left outer join  DAClient c     on c. ID=a.ClientID   '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID    '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID'
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除') +' and b.goodsID<>0'
        +' order by [日期] DESC');
end;

procedure TBaseVoucherEditAForm.SLClearLegerExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(SLClearLeger.Caption,SLClearLeger.Hint,
        ' select Date as [日期], Code as [编号],'
        +' BillMode as [业务类别],Client as [客户/厂商名称] ,'
        +' Accounts AS [帐户名称],AmountD  as [收款金额],'
        +' AmountC as  [销售/折扣/返利], AmountC-AmountD as [应收帐款额] ,'
        +' Employee as [经手人] ,Brief  as [业务摘要],                   '
        +' Memo  as [备注] ,RecordState as [凭单状态]                    '
        +' from                                                          '
        +' (select f.id,  f.ClientID, f.EmployeeID,                      '
        +' f.Date , f.Code , f.BillMode ,                                '
        +' C.name as Client , FA.NAME AS Accounts,                       '
        +' f.AmountD  as AmountD,                                        '
        +' f. AmountRed*Isnull(f.ModeDC,1)*Isnull(f.ModeC,1)*(-1)  as AmountC,                    '
        +' E.name as Employee ,f.Brief  , F.Memo  ,                      '
        +' F.RecordState                                                 '
        +' from FNClearSLMaster F                                        '
        +' LEFT Outer join  MSEmployee E on E.ID=F.EmployeeID            '
        +' LEFT Outer join  DAClient C on C.ID=F.ClientID                '
        +' LEFT Outer join   FNAccounts  FA  on FA.ID=F.AccountsID  '
        +' where F.RecordState<>'+Quotedstr('删除')
        +' UNION ALL    '
        +' select f.id,  f.ClientID, f.EmployeeID,                  '
        +' f.Date , f.Code , f.BillMode ,                            '
        +' C.name as Client , '+Quotedstr('_ _')+ ' as accounts, 0  as AmountD ,                                           '
        +' sd.AmountC*Isnull(f.ModeDC,1)*Isnull(f.ModeC,1)  as AmountC,                  '
        +' E.name as Employee ,f.Brief  , F.Memo  ,                  '
        +' F.RecordState                                             '
        +' from SLSaleMaster F                                       '
        +' LEFT Outer join  MSEmployee E on E.ID=F.EmployeeID        '
        +' LEFT Outer join  DAClient C on C.ID=F.ClientID            '
        +' LEFT Outer join  '
        +' ( select MasterID,(Sum(ISnull(Amount,0) )- '
        +' Sum(ISnull(discount,0) )+ '
        +' Sum(ISnull(taxAmount,0) )+Sum(ISnull(Sundryfee,0) ) ) '
        +' as AmountC  from SLSaleDetail group by MasterID ) as '
        +' sd on SD.masterID=F.id '
        +' where F.RecordState<>'+Quotedstr('删除')
        +' ) as SLclear Order By Date Desc  ' );
end;

procedure TBaseVoucherEditAForm.SLCreditExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(SLCredit.Caption,SLCredit.Hint,
        ' select Date as [日期], Code as [编号],  '
        +' c.name as [客户名称], CreditClass as [信用等级],'
        +' QuotaAmount as [信用额度], QuotaAmountMax as [最大额度], '
        +' QuotaAmountMin as [最低额度], StartDate as [生效日期], '
        +' ExpireDate as [终止日期], a.Memo as  [备注] '
        +' from SLCredit a  '
        +' LEFT Outer join  DAClient C on C.ID=a.ClientID '
        +' where a.RecordState<>'+Quotedstr('删除')  );
end;

procedure TBaseVoucherEditAForm.PCCreditExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(PCCredit.Caption,PCCredit.Hint,
        ' select Date as [日期], Code as [编号],  '
        +' c.name as [厂商名称], CreditClass as [信用等级],'
        +' QuotaAmount as [信用额度], QuotaAmountMax as [最大额度], '
        +' QuotaAmountMin as [最低额度], StartDate as [生效日期], '
        +' ExpireDate as [终止日期], a.Memo as  [备注] '
        +' from PCCredit a  '
        +' LEFT Outer join  DAClient C on C.ID=a.ClientID '
        +' where a.RecordState<>'+Quotedstr('删除')  );
end;

procedure TBaseVoucherEditAForm.SalePriceExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(SalePrice.Caption,SalePrice.Hint,' select'
        +' Date as [日期], a.Code as [编号], '
        +' PriceClass AS [价格类别],b.name as [货品名称], '
        +' c.name as [包装单位], PriceBase as [基本售价],  '
        +' PriceMax as [最高限价], PriceMin as [最低限价], '
        +' StartDate as [生效日期], '
        +' ExpireDate as [终止日期], '
        +' a.Memo as [备注]  from SLSalePrice  a '
        +' left Outer Join DAGoods  b on b.ID=a.GoodsID '
        +' left Outer Join MSUnit  c  on c.ID=a.PackUnitID '
        +' where a.RecordState<>'+Quotedstr('删除') );
end;

procedure TBaseVoucherEditAForm.PurchasePriceExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(PurchasePrice.Caption,PurchasePrice.Hint,' select'
        +' Date as [日期], a.Code as [编号], '
        +' PriceClass AS [价格类别],b.name as [货品名称], '
        +' c.name as [包装单位], PriceBase as [基本售价],  '
        +' PriceMax as [最高限价], PriceMin as [最低限价], '
        +' StartDate as [生效日期], '
        +' ExpireDate as [终止日期], '
        +' a.Memo as [备注]  from PCPurchasePrice  a '
        +' left Outer Join DAGoods  b on b.ID=a.GoodsID '
        +' left Outer Join MSUnit  c  on c.ID=a.PackUnitID '
        +' where a.RecordState<>'+Quotedstr('删除') );
end;

procedure TBaseVoucherEditAForm.SLContractPriceExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(SLContractPrice.Caption,SLContractPrice.Hint,' select'
        +' Date [日期], b.Code [编号], ContractClass [合同价格类别],'
        +' c.name [客户名称] ,e.name [货品名称],                     '
        +' a.Spec [规格型号], d.name [包装单位],               '
        +' a.Quantity [数量范围下限], a.QuantityE  [数量范围上限],   '
        +' a.PriceClear [结算价格],                                  '
        +' a.PriceMin [最低价格],                                    '
        +' a.PriceMax [最高价格],                                    '
        +' b.StartDate [生效日期], b.ExpireDate [终止日期], b.Memo [备注]'
        +' from SLContractPriceDetail  a                                 '
        +' left Outer Join SLContractPriceMaster b   on b.ID=a.MasterID  '
        +' left Outer Join daclient   c   on c.ID=b.ClientID             '
        +' left Outer Join MSUnit  d   on d.ID=a.PackUnitID              '
        +' left Outer Join DAGoods  e   on e.ID=a.GoodsID                '
        +' where a.GoodsID<>0 and b.RecordState<>'+Quotedstr('删除') );
end;

procedure TBaseVoucherEditAForm.PCContractPriceExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(PCContractPrice.Caption,PCContractPrice.Hint,' select'
        +' Date [日期], b.Code [编号], ContractClass [合同价格类别],'
        +' c.name [客户名称] ,e.name [货品名称],                     '
        +' a.Spec [规格型号], d.name [包装单位],               '
        +' a.Quantity [数量范围下限], a.QuantityE  [数量范围上限],   '
        +' a.PriceClear [结算价格],                                  '
        +' a.PriceMin [最低价格],                                    '
        +' a.PriceMax [最高价格],                                    '
        +' b.StartDate [生效日期], b.ExpireDate [终止日期], b.Memo [备注]'
        +' from PCContractPriceDetail  a                                 '
        +' left Outer Join PCContractPriceMaster b   on b.ID=a.MasterID  '
        +' left Outer Join daclient   c   on c.ID=b.ClientID             '
        +' left Outer Join MSUnit  d   on d.ID=a.PackUnitID              '
        +' left Outer Join DAGoods  e   on e.ID=a.GoodsID                '
        +' where a.GoodsID<>0 and b.RecordState<>'+Quotedstr('删除') );
end;

procedure TBaseVoucherEditAForm.PCOrderTrailExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(PCOrderTrail.Caption,PCOrderTrail.Hint,' select * from ( '
        +' select a.Code as [编号],a.Date [日期],                 '
        +' a.BillMode [业务类别],                               '
        +' a.ClearDate [交货日期],                              '
        +' a.Deliver [交货方式], c.name as [厂商名称] ,         '
        +' E.name as [商品名称],f.name as [包装单位],           '
        +' b.Quantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [数量], '
        +' g.name as  [标准单位],      '
        +' b.GoalQuantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [标准数量], '
        +' b.PriceBase as [单价],                               '
        +' b.Amount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [商品金额] ,            '
        +' b.TaxAmount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [税金] ,             '
        +' b.SundryFee*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [附加费用],          '
        +' b.Discount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [折扣金额],           '
        +' d.name as [经手人],                                  '
        +' a.RecordState as [凭单状态]                          '
        +' from PCOrderDetail  b                                '
        +' left outer join PCOrderMaster a on  a.id=b.masterID    '
        +' left outer join  DAClient c     on c. ID=a.ClientID   '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID    '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID'
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')
        +' and b.GoodsID<>0 and b.GoalQuantity<>0'
        +' UNION ALL  '
        +' select a.Code as [编号],a.Date [日期],                   '
        +' a.BillMode [业务类别],                               '
        +' a.ClearDate [交货日期],                              '
        +' a.Deliver [交货方式], c.name as [厂商名称] ,         '
        +' E.name as [商品名称],f.name as [包装单位],           '
        +' b.Quantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [数量],'
        +' g.name as  [标准单位],      '
        +' b.GoalQuantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [标准数量], '
        +' b.PriceBase as [单价],                               '
        +' b.Amount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [商品金额] ,            '
        +' b.TaxAmount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [税金] ,             '
        +' b.SundryFee*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [附加费用],          '
        +' b.Discount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as [折扣金额],           '
        +' d.name as [经手人],                                  '
        +' a.RecordState as [凭单状态]                          '
        +' from PCPurchaseDetail  b                                '
        +' left outer join PCPurchaseMaster a on  a.id=b.masterID    '
        +' left outer join  DAClient c     on c. ID=a.ClientID   '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID    '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID'
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')
        +' and b.GoodsID<>0 and b.GoalQuantity<>0'
        +' and a.ClientID in (select Distinct ClientID from PCOrderMaster) '
        +' ) as a order by [日期] DESC');
end;

procedure TBaseVoucherEditAForm.PCActualPriceExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(PCActualPrice.Caption,PCActualPrice.Hint,' select a.Code as [编号],a.Date as [日期], '
        +' a.BillMode [业务类别],                     '
        +' a.Deliver [交货方式], c.name as [客户名称] ,'
        +' E.name as [商品名称],f.name as [包装单位],'
        +' b.Quantity as [商品数量],g.name as  [标准单位],'
        +' b.PriceBase as [单价],                          '
        +' d.name as [经手人]                              '
        +' from PCPurchaseDetail  b                           '
        +' left outer join PCPurchaseMaster a on  a.id=b.masterID '
        +' left outer join  DAClient c     on c. ID=a.ClientID '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID     '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID   '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID   '
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')
        +' order by a.Date Desc ');
end;

procedure TBaseVoucherEditAForm.PCClearLegerExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(PCClearLeger.Caption,PCClearLeger.Hint,
        ' select Date as [日期], Code as [编号],'
        +' BillMode as [业务类别],Client as [客户/厂商名称] ,'
        +' Accounts AS [帐户名称],AmountC  as [付款金额], '
        +' AmountD as  [采购/折扣/返利], AmountD-Amountc as [应付帐款额] ,'
        +' Employee as [经手人] ,Brief  as [业务摘要],                   '
        +' Memo  as [备注] ,RecordState as [凭单状态]                    '
        +' from                                                          '
        +' (select f.id,  f.ClientID, f.EmployeeID,                      '
        +' f.Date , f.Code , f.BillMode ,                                '
        +' C.name as Client , FA.NAME AS Accounts,                       '
        +' f.AmountC  as AmountC,                                        '
        +' f. AmountRed*Isnull(f.ModeDC,1)*Isnull(f.ModeC,1)*(-1)  as AmountD,                    '
        +' E.name as Employee ,f.Brief  , F.Memo  ,                      '
        +' F.RecordState                                                 '
        +' from FNClearPCMaster F                                        '
        +' LEFT Outer join  MSEmployee E on E.ID=F.EmployeeID            '
        +' LEFT Outer join  DAClient C on C.ID=F.ClientID                '
        +' LEFT Outer join   FNAccounts  FA  on FA.ID=F.AccountsID  '
        +' where F.RecordState<>'+Quotedstr('删除')
        +' UNION ALL    '
        +' select f.id,  f.ClientID, f.EmployeeID,                  '
        +' f.Date , f.Code , f.BillMode ,                            '
        +' C.name as Client , '+Quotedstr('_ _')+ ' as accounts, 0  as AmountC ,                                           '
        +' sd.AmountC*Isnull(f.ModeDC,1)*Isnull(f.ModeC,1)  as AmountD,                  '
        +' E.name as Employee ,f.Brief  , F.Memo  ,                  '
        +' F.RecordState                                             '
        +' from PCPurchaseMaster F                                       '
        +' LEFT Outer join  MSEmployee E on E.ID=F.EmployeeID        '
        +' LEFT Outer join  DAClient C on C.ID=F.ClientID            '
        +' LEFT Outer join  '
        +' ( select MasterID,(Sum(ISnull(Amount,0) )- '
        +' Sum(ISnull(discount,0) )+ '
        +' Sum(ISnull(taxAmount,0) )+Sum(ISnull(Sundryfee,0) ) ) '
        +' as AmountC  from PCPurchaseDetail group by MasterID ) as '
        +' sd on SD.masterID=F.id '
        +' where F.RecordState<>'+Quotedstr('删除')
        +' ) as PCclear Order By Date Desc  ' );
end;

procedure TBaseVoucherEditAForm.CashBalanceExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(CashBalance.Caption,CashBalance.Hint,
        ' select  '
        +' a.AccountsID as [帐户序号],b.name as [帐户名称] , '
        +' sum(isnull(AmountD,0)) as  [收入金额], '
        +' sum(isnull(AmountC,0)) as  [支出金额],            '
        +' sum(isnull(AmountD,0))- sum(isnull(AmountC,0)) as [差额/余额]  '
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
        +' from FNCashoutInMaster a left outer join  FNAccounts b on b.id=a.clientid     '  //调入帐户记录
        +' UNION ALL                                                                                            '
        +' select Date,a.code,billmode,brief,b.name as Client,a.RecordState,clientid,  AmountC, AmountD   '
        +' from FNCashoutInMaster a left outer join  FNAccounts b on b.id=a.AccountsID ) '  //调出帐户记录
        +' as a left outer join FNAccounts b on b.ID=a.AccountsID                                           '
        +' where a.RecordState<>'+Quotedstr('删除')+'  and b.AccountType not like '+Quotedstr('%业主资金%')
        +' and a.AccountsID<>0 group by a.AccountsID,b.name' );
end;

procedure TBaseVoucherEditAForm.PCPurchaseLegerExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(SLsaleLeger.Caption,SLsaleLeger.Hint,
        ' select a.Code as [编号],a.Date as [日期],    '
        +' a.BillMode [业务类别],                      '
        +' a.ClearDate [交货日期],                              '
        +' a.Deliver [交货方式], c.name as [厂商名称] ,         '
        +' E.name as [商品名称],f.name as [包装单位],           '
        +' b.Quantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [数量],'
        +' g.name as  [标准单位],      '
        +' b.GoalQuantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [标准数量], '
        +' b.PriceBase as [单价],                               '
        +' b.Amount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [商品金额] ,            '
        +' b.TaxAmount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [税金] ,             '
        +' b.SundryFee*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [附加费用],          '
        +' b.Discount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [折扣金额],           '
        +' d.name as [经手人],                                  '
        +' a.RecordState as [凭单状态]                          '
        +' from PCPurchaseDetail  b                                '
        +' left outer join PCPurchaseMaster a on  a.id=b.masterID    '
        +' left outer join  DAClient c     on c. ID=a.ClientID   '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID    '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID'
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')
        +' order by [日期] DESC');
end;

procedure TBaseVoucherEditAForm.ActualStockExecute(Sender: TObject);
var year,month,day :word;
    datestr :string;
begin
  inherited;
  DecodeDate(Date,year, month, day);
  datestr:=datetoSTR(Date);
  ShowQueryForm(ActualStock.Caption,ActualStock.Hint, 'select '
        +' w.name as [仓库名称] ,                           '
        +' E.name as [商品名称],f.name as [包装单位],       '
        +' sum(isnull(b.Quantity,0))  as [数量],            '
        +' g.name as  [标准单位],                           '
        +' sum(isnull(b.GoalQuantity,0))  as [标准数量]     '

        +' FROM ('
        +' select b.recordstate,b.date ,b.warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity*(-1) as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity*(-1) AS GoalQuantity, '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount*(-1) as Amount from  SLGoodsOutDetail a    '
        +' left outer join SLGoodsOutMaster b on b.ID=a.MasterID   '  //销售出库表
        +' UNION ALL '
        +' select b.recordstate,b.date ,b.warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity AS GoalQuantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount AS Amount from  PCGoodsInDetail a  '
        +' left outer join PCGoodsInMaster b on b.ID=a.MasterID   '   //采购入库表
        +' UNION ALL '
        +' select b.recordstate,b.date ,b.warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity*(-1) as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity*(-1) AS GoalQuantity,  '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount*(-1) AS Amount from  YDGoodsOutDetail a  '
        +' left outer join YDGoodsOutMaster b on b.ID=a.MasterID   ' //生产领料表
        +' UNION ALL '
        +' select b.recordstate,b.date ,b.warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity AS GoalQuantity,     '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount AS Amount from  YDGoodsInDetail a    '
        +' left outer join YDGoodsInMaster b on b.ID=a.MasterID   '  //生产入库表
        +' UNION ALL '
        +' select b.recordstate,b.date ,b.ClientID as warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity*(-1) as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity*(-1) AS GoalQuantity,     '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount*(-1) AS Amount from  STGoodsOutInDetail a   '
        +' left outer join STGoodsOutInMaster b on b.ID=a.MasterID   ' //库存变动表 (出货仓库)
        +' UNION ALL '
        +' select b.recordstate,b.date ,warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity AS GoalQuantity,      '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount AS Amount from  STGoodsOutInDetail a  '
        +' left outer join STGoodsOutInMaster b on b.ID=a.MasterID   ' //库存变动表 （入货仓库）
        //
        +' UNION ALL '
        +' select b.recordstate,b.date ,b.ClientID as warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity*(-1) as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity*(-1) AS GoalQuantity,     '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount*(-1) AS Amount from  STGoodsCountOffDetail a   '
        +' left outer join STGoodsCountOffMaster b on b.ID=a.MasterID   '
        +' where b.BillMode<>'+Quotedstr('库存盘盈') //库存盘点表 (盘亏\生产损耗仓库)
        +' UNION ALL '
        +' select b.recordstate,b.date ,warehouseID,GoodsID,PackunitID,'
        +' GoalUnitID, Isnull(ModeDC,1)*Isnull(ModeC,1)*Quantity as Quantity,   '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*GoalQuantity AS GoalQuantity,      '
        +' Isnull(ModeDC,1)*Isnull(ModeC,1)*Amount AS Amount from  STGoodsCountOffDetail a  '
        +' left outer join STGoodsCountOffMaster b on b.ID=a.MasterID   '
        +' where b.BillMode='+Quotedstr('库存盘盈')  //库存盘点表 （盘盈入货仓库）
        +'   ) as b '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID       '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID     '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID     '
        +' left outer join  STWarehouse w   on w.id=b.WarehouseID '
        +' WHERE b.DATE<='+Quotedstr(datestr)+' and b.recordstate<>'+Quotedstr('删除')
        +' group by  w.name , E.name ,f.name ,g.name  ');
end;

procedure TBaseVoucherEditAForm.ReceiptPayableExecute(Sender: TObject);
begin
  inherited;
//
end;

procedure TBaseVoucherEditAForm.EmployeeLendExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(EmployeeLend.Caption,EmployeeLend.Hint, 'select b.name '
      +' as [职员姓名], '
      +' Sum(Isnull(a.AmountD,0))-sum(Isnull(a.AmountC,0)) as [其它应收余额]'
      +' from (                                                '
      +' select Code,date,ClientID, BillMode,0.00 as  AmountD,'
      +' AmountD+AmountRed as  AmountC,recordstate from FnCashinmaster'
      +' UNION ALL '
      +' select Code,date,ClientID, BillMode,AmountC+AmountRed  as'
      +' AmountD, 0.00 as  AmountC,recordstate from FnCashOutmaster'
      +' UNION ALL  '
      +' select Code,date,ClientID, BillMode,0.00  as  AmountD, '
      +' AmountRed as  AmountC,recordstate from FnExpensemaster ) as a '
      +' left outer join MsEmployee b on b.ID=A.ClientID  '
      +' where a.Recordstate<>'+QUOTEDSTR('删除')
      +' Group by a.ClientID, b.name' );
end;

function TBaseVoucherEditAForm.CreateReport: TQuickRep;
begin
  Result := TBaseVoucherReport.Create(Self);
  TBaseVoucherReport(Result).SetMasterDataSet(MasterDataSet);
end;

procedure TBaseVoucherEditAForm.StockConsignExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(StockConsign.Caption,StockConsign.Hint, ' select Client as [客户名称] , '
        +' Goods  as [库存商品名称],PackUnit as [包装单位], '
        +' sum(isnull(Quantity,0)) as [库存数量],                          '
        +' GoalUnit as  [标准单位],                         '
        +' sum(isnull(GoalQuantity,0))  as [库存标准数量],                 '
        +' Employee as [经手人]                             '
        +' from  (                                          '
        +' select c.name as Client ,                        '
        +' E.name as Goods,f.name as Packunit,              '
        +' b.Quantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as Quantity,    '
        +' g.name as  GoalUnit,                             '
        +' b.GoalQuantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)*(-1) as GoalQuantity, '
        +' d.name as Employee                                    '
        +' from SLSaleClientDetail  b                            '
        +' left outer join SLSaleClientMaster a on  a.id=b.masterID '
        +' left outer join  DAClient c     on c. ID=a.ClientID      '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID     '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID         '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID       '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID       '
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')+' and Quantity<>0'
        +' UNION ALL                                                    '
        +' select c.name as Client ,                                '
        +' E.name as Goods,f.name as Packunit,                      '
        +' b.Quantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as Quantity,                 '
        +' g.name as  GoalUnit,                                     '
        +' b.GoalQuantity*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as GoalQuantity,         '
        +' d.name as Employee                                        '
        +' from SLGoodsOutDetail  b                                  '
        +' left outer join SLGoodsOutMaster a on  a.id=b.masterID    '
        +' left outer join  DAClient c     on c. ID=a.ClientID       '
        +' left outer join  MSEmployee  d  on d.id=a.EmployeeID      '
        +' left outer join  DAGoods   e   on e.id=b.GoodsID          '
        +' left outer join  MSunit   f   on f.id=b.PackUnitID        '
        +' left outer join  MSunit   g   on g.id=b.GoalUnitID        '
        +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除') +' and Quantity<>0'
        +' and a.ClientID in ( select distinct ClientID from '
        +' SLSaleClientMaster WHERE  RECORDSTATE<>'+Quotedstr('删除')
        +' )  ) as a group by Client,Goods,PackUnit,GoalUnit,Employee ' );
end;

procedure TBaseVoucherEditAForm.UpdateDBGrid;
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

procedure TBaseVoucherEditAForm.FormShow(Sender: TObject);
begin
  inherited;
//  UpdateDBGrid;
end;

procedure TBaseVoucherEditAForm.YDPurchasePlanExecute(Sender: TObject);
begin
  inherited;
  ShowQueryForm(YDPurchasePlan.Caption,YDPurchasePlan.Hint,
    ' select  '
   +' b.CODE [采购计划编号] ,b.date [编制日期], '
   +' b.ClearDate [到货日期],   '
   +' f.name [商品名称],        '
   +' d.Name [单位名称],        '
   +' a.PriceBase [计划单价],   '
   +' a.GoalQuantity [数量],    '
   +' a.Amount [成本金额],      '
   +' a.Memo   [生产计划编号],  '
   +' b.memo [备注],            '
   +' b.Recordstate [采购状态]  '
   +' from YDPurchasePlanDetail a  '
   +' left outer join  YDPurchasePlanMaster b on a.MasterID=b.ID '
   +' left outer join  MSEmployee c on b.EmployeeID =c.ID        '
   +' left outer join  MSUnit d on a.GoalUnitID=d.ID             '
   +' left outer join  MSEmployee e on b.ClientID =e.ID          '
   +' left outer join  DAGoods f on a.GoodsID =f.ID ' );

end;

end.

