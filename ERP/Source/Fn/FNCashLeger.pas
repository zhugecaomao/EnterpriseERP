unit FNCashLeger;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TFNCashLegerForm = class(TWSVoucherBrowseForm)
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
    adsMasterDSDesigner: TDateTimeField;
    adsMasterDSDesigner2: TStringField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner4: TStringField;
    adsMasterDSDesigner5: TStringField;
    adsMasterDSDesigner6: TStringField;
    adsMasterDSDesigner7: TBCDField;
    adsMasterDSDesigner8: TBCDField;
    adsMasterDSDesigner9: TBCDField;
    adsMasterDSDesigner10: TStringField;
    ToolButton1: TToolButton;
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure UpdateDBGrid;
    procedure ShowForm(const name,Strcaption,AccountsID,Datestr :string);

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FNCashLegerForm: TFNCashLegerForm;


implementation

uses CommonDM ;


{$R *.dfm}

function TFNCashLegerForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;


procedure TFNCashLegerForm.DBGridCellClick(Column: TColumn);
begin
//  inherited;
  UpdateDBGrid;
end;

procedure TFNCashLegerForm.DBGridDblClick(Sender: TObject);
begin
//  inherited;
  UpdateDBGrid;
end;

procedure TFNCashLegerForm.UpdateDBGrid;
var  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
//    Columns[0].Width :=130;
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

procedure TFNCashLegerForm.ShowForm(const name, Strcaption,AccountsID,datestr: string);
begin
  with TFNCashLegerForm.Create(APPLICATION)   do
  begin
    adsMaster.Close;
    adsMaster.CommandText :='select Date [日期], a.Code [编号] ,BillMode [业务类别] ,'
        +' Brief [业务摘要], ReceiptPayee [收款人/交款人] ,'
        +' b.name as [帐户名称],AmountD [收入金额], AmountC [支出金额],'
        +' AmountD-AmountC as [差额/余额],c.name as [经手人] from ( '
        +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
        +' AccountsID,Isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountD,'
        +' Isnull(AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountC,'
        +' EmployeeID from FNClearPCMaster a '
        +' left outer join  DaClient b on b.id=a.ClientID '    //采购付款表
        +' UNION ALL                                                                    '
        +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
        +' AccountsID,Isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountD,'
        +' Isnull(AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountC,'
        +' EmployeeID from FNClearSLMaster a   '
        +' left outer join  DaClient b on b.id=a.ClientID    '  //销售收款表
        +' UNION ALL                                                                    '
        +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
        +' AccountsID,Isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountD,'
        +' Isnull(AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountC,'
        +' EmployeeID from FNClearEGMaster a   '
        +' left outer join  DaClient b on b.id=a.ClientID    '  //项目收款表
        +' UNION ALL                                                                    '
        +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
        +' AccountsID,Isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountD,'
        +' Isnull(AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountC,'
        +' EmployeeID   from FNCashInMaster a  '
        +' left outer join  MsEmployee b on b.id=a.ClientID   '//内部收款表
        +' UNION ALL                                                                    '
        +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
        +' AccountsID,Isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountD,'
        +' Isnull(AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountC, '
        +' EmployeeID  from FNCashoutMaster a       '
        +' left outer join  MsEmployee b on b.id=a.ClientID  '  //内部付款表
        +' UNION ALL                                                                    '
        +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'
        +' ClientID,0.00 as AmountD, Isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)   '
        +' as Amountc ,EmployeeID   from FNCashOutInMaster a      '
        +' left outer join  FNAccounts b on b.id=a.AccountsID ' //资金调出表
        +' UNION ALL                                                                       '
        +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,   '
        +' AccountsID,Isnull(AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountD,'
        +' 0.00 as Amountc ,EmployeeID  from FNCashOutInMaster a    '
        +' left outer join  FNAccounts b on b.id=a.ClientID   '  //资金调入表
        +' UNION ALL                                                                       '
        +' select date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,   '
        +' AccountsID,0.00 as Amountd ,Isnull(AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)  AmountC ,'
        +' EmployeeID from FNExpenseMaster a   '
        +' left outer join  MsEmployee b on b.id=a.ClientID  '   //报销付款表
        +' ) AS a left Outer Join FNaccounts b on B.id=a.AccountsID '
        +'  left Outer Join MsEmployee c on c.id=a.EmployeeID '
        +' WHERE a.RecordState<>'+Quotedstr('删除')+' and a.AccountsID='+ Quotedstr(AccountsID)
        +' and date<='+Quotedstr(datestr) +' Order by date,a.code DESC';
    adsMaster.Open;
    caption :=Strcaption;
    TabSheet1.Caption :=Strcaption;
    ShowModal;
  end;
end;

end.
