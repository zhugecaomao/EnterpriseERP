unit FNBrCredence;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSBrowse, Menus, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, WSEdit, WSStandardBrowse, StdCtrls;

type
  TFNCredenceBrowseForm = class(TWSStandardBrowseForm)
    adsCredence: TADODataSet;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    adsCredenceID: TAutoIncField;
    adsCredenceCreateDate: TDateTimeField;
    adsCredenceCreateUserID: TIntegerField;
    adsCredenceRecordState: TStringField;
    adsCredenceDSDesigner: TStringField;
    adsCredenceDSDesigner2: TDateTimeField;
    adsCredenceDSDesigner3: TStringField;
    adsCredenceDSDesigner4: TBCDField;
    adsCredenceDSDesigner5: TBCDField;
    adsCredenceDSDesigner6: TStringField;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    VourchTranIniADS: TADODataSet;
    VouchTranTemp: TADOQuery;
    TranVchPanel: TPanel;
    ToolButton16: TToolButton;
    procedure AddNewActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure ToolButton5Click(Sender: TObject);
    procedure DoingCase;
    procedure DoingCase0;
    procedure DoingCase1;
    procedure DoingCase2;
    procedure DoingCase3;
    procedure DoingCase4;
    procedure DoingCase5;
    procedure DoingCase6;
    procedure DoingCase7;
    procedure DoingCase8;
    procedure DoingCase9;
    procedure DoingCaseA;
    procedure DoingCaseB;
    procedure DoingCaseC;
    procedure DoingCaseD;

    procedure ToolButton6Click(Sender: TObject);
  private
    NewVoucherCode,NewVoucherID :string;
    AmountA,AmountB :real;
    FEndDate: TDate;
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

implementation

uses FNEdCredence, CommonDM,WSUtils,WSSecurity, FNVouchTranIni, DatePick;

{$R *.dfm}

{ TFNCredenceBrowseForm }

function TFNCredenceBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TFNCredenceEditForm.Create(Application);
end;

procedure TFNCredenceBrowseForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsCredence.Requery()  ;
end;

procedure TFNCredenceBrowseForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsCredence.Requery()  ;

end;

procedure TFNCredenceBrowseForm.DeleteActionExecute(Sender: TObject);
begin
  inherited;
  adsCredence.Requery()  ;
end;

procedure TFNCredenceBrowseForm.ToolButton5Click(Sender: TObject);
begin
  FEndDate := Date;
  if PickDateDlg('选择结束日期:', FEndDate) then
  begin
    TranVchPanel.Visible :=True;
    TranVchPanel.Repaint;
    CommonData.acnConnection.Execute('EXECUTE sp_FNSyncAllSubject');
    VourchTranIniADS.Close;
    VourchTranIniADS.CommandText :='select top 13 * from FNVourchTranIni';
    VourchTranIniADS.Open;
    VourchTranIniADS.First;
    while not VourchTranIniADS.eof do
    begin
      DoingCase;
      VourchTranIniADS.Next;
    end;
    TranVchPanel.Visible :=False;
    adsCredence.Requery()  ;
  end;
end;

procedure TFNCredenceBrowseForm.DoingCase;
begin
  case VourchTranIniADS.FieldByName('VouchTranNo').AsInteger of
    0: DoingCase0;//转换销售开单
    1: DoingCase1;// 转换采购开单
    2: DoingCase2; //转换收款申请
    3: DoingCase3; //转换付款结算
    4: DoingCase4; //转换收款申请
    5: DoingCase5; // 转换付款申请
    6: DoingCase6; //费用报销
    7: DoingCase7;// 资金调动
    8: DoingCase8;// 外币兑换
    9: DoingCase9;// 采购成本核算
    10: DoingCaseA;// 领料成本核算
    11:DoingCaseB;// 生产成本核算
    12:DoingCaseC;// 外发加工成本核算
    13:DoingCaseD;// 销售成本核算
  end;
end;

procedure TFNCredenceBrowseForm.DoingCase0;
begin
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
//转换销售开单
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from SLSaleMaster '
    +' where RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+ Quotedstr('作废')+' and '
    +'ID not in (select GoalUnitID from FNCredDetail where '
    +' OriginTable=' +Quotedstr('SLSaleMaster')
    +' ) and  Date<=' +Quotedstr(DateToStr(FEndDate));
  VouchTranTemp.Open;
  if VouchTranTemp.IsEmpty then exit;

  VouchTranTemp.Close;  //汇总转换金额
  VouchTranTemp.SQL.Text :=' select sum(isnull(AmountA,0)) as AmountA  ,'
    +' sum(isnull(AmountB,0)) as AmountB  from ( select  '
    +' sum(isnull(a.Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) as AmountA  ,    '
    +' sum(0.00)  as AmountB      '
    +' from SLSaleDetail a                                     '
    +' left outer join SLSaleMaster   b on a.MasterID=b.ID       '
    +' where b.RecordState<>'+Quotedstr('删除')
    +' and b.RecordState<>'+ Quotedstr('作废')
    +' and b.date<='
    +Quotedstr(DateToStr(FEndDate))+' and b.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('SLSaleMaster')+' )'
    +' union all '
    +' select '
    +' 0.00 as AmountA  ,    '
    +' sum(isnull(a.SundryFee,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) as AmountB      '
    +' from SLSaleMaster a                                     '
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('SLSaleMaster')+' ) ) as a ' ;
  VouchTranTemp.Open;//汇总转换金额
  AmountA := VouchTranTemp.FieldByName('AmountA').AsFloat ;
  AmountB := VouchTranTemp.FieldByName('AmountB').AsFloat ;

  NewVoucherCode :=GetMaxCode('Code','FNCredMaster',number);
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' Insert into FNCredMaster ( '
    +' CreateUserID,Code,Date,BillMode,ModeDC,ModeC,Brief,Memo)'
    +' Values ( '+Inttostr(Guarder.UserID)+' , '+ Quotedstr(NewVoucherCode)
    +' , '+Quotedstr(DateToStr(FEndDate))+' , '+ Quotedstr('自动转换')
    +' , 1, 1 ,'+ Quotedstr('自动转换')+' , '+ Quotedstr('销售开单自动转换凭证')
    +' ) ';
  VouchTranTemp.ExecSQL;  //插入凭证头
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCredMaster where Code='
    +Quotedstr(NewVoucherCode);
  VouchTranTemp.Open;
  NewVoucherID :=Inttostr(VouchTranTemp.fieldbyname('ID').AsInteger);
  VouchTranTemp.Close;  //插入子表借方金额---
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceBase,GoalUnitID, OriginTable,GoodsSpec )'
    +' select  MasterID ,GoodsID, sum(isnull(PriceBase,0)) as PriceBase ,'
    +' GoalUnitID,OriginTable,memo  from ( '
    +' select '+NewVoucherID+' as MasterID ,'
    +' e.ID as GoodsID, '
    +' (sum(isnull(a.Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) )                  '
    +' as PriceBase, b.ID  as GoalUnitID,               '
    +Quotedstr('SLSaleMaster')+' as OriginTable , ( '
    +Quotedstr('销售单号:')+' +b.code) as Memo '
    +' from SLSaleDetail  a                                     '
    +' left outer join SLSaleMaster b on b.ID=a.MasterID       '
    +' left outer join DaClient c on c.ID=b.ClientID           '
    +' left outer join DASubject d on d.ID=c.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('DAClient')+ ' and        '
    +'   e.RelativeID=b.ClientID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where b.RecordState<>'+Quotedstr('删除')
    +' and b.RecordState<>'+ Quotedstr('作废')
    +' and b.date<='
    +Quotedstr(DateToStr(FEndDate))+' and b.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('SLSaleMaster')+' )'
    +' group by b.ID,e.ID, b.Code  '
    +' union all '
    +' select '+NewVoucherID+' as MasterID ,'
    +' e.ID as GoodsID, '
    +' (sum(isnull(a.SundryFee,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)))        '
    +' as PriceBase, a.ID  as GoalUnitID,               '
    +Quotedstr('SLSaleMaster')+' as OriginTable , ( '
    +Quotedstr('销售单号:')+' +a.code) as Memo '
    +' from SLSaleMaster  a                                     '
    +' left outer join DaClient c on c.ID=a.ClientID           '
    +' left outer join DASubject d on d.ID=c.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('DAClient')+ ' and        '
    +'   e.RelativeID=a.ClientID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('SLSaleMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ) as a '
    +' Group by a.MasterID , a.GoodsID, a.GoalUnitID,a.OriginTable,a.memo ';
//  Memo1.Text := VouchTranTemp.SQL.Text;
  VouchTranTemp.ExecSQL; //插入子表借方金额---

  if AmountA<>0 then
  begin
    VouchTranTemp.Close;  //插入子表贷方金额====
    VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
      +' MasterID,GoodsID, PriceCost,GoodsSpec )'
      +' Values ( '+NewVoucherID+'   ,'
      + Inttostr(VourchTranIniADS.FieldByName('AccountFID').AsInteger)
      +' , ' + Floattostr(AmountA)+' , '
      +Quotedstr('汇总销售')+' ) ';
    VouchTranTemp.ExecSQL; //插入子表贷方金额 ====
  end;
  if AmountB<>0 then
  begin
    VouchTranTemp.Close;  //插入子表贷方金额****
    VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
      +' MasterID,GoodsID, PriceCost,GoodsSpec,Memo)'
      +' Values ( '+NewVoucherID + ' ,'
      + Inttostr(VourchTranIniADS.FieldByName('AccountGID').AsInteger)
      + ' , '   + Floattostr(AmountB)+' , '
      +Quotedstr('汇总附加费用')+' , '
      +Quotedstr('附加费用')+' ) ';
    VouchTranTemp.ExecSQL; //插入子表贷方金额****
  end;
end;

procedure TFNCredenceBrowseForm.DoingCase1;
begin
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
// 转换采购开单
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from PCPurchaseMaster '
    +' where RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+ Quotedstr('作废')+' and '
    +'ID not in (select GoalUnitID from FNCredDetail where '
    +' OriginTable=' +Quotedstr('PCPurchaseMaster')
    +' ) and  Date<=' +Quotedstr(DateToStr(FEndDate));

  VouchTranTemp.Open;
  if VouchTranTemp.IsEmpty then exit;

  VouchTranTemp.Close;  //汇总转换金额
  VouchTranTemp.SQL.Text :=' select sum(isnull(AmountA,0)) as AmountA  ,'
    +' sum(isnull(AmountB,0)) as AmountB  from ( select  '
    +' sum(isnull(a.Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) as AmountA  ,    '
    +' sum(0.00)  as AmountB      '
    +' from PCPurchaseDetail a                                     '
    +' left outer join PCPurchaseMaster   b on a.MasterID=b.ID       '
    +' where b.RecordState<>'+Quotedstr('删除')
    +' and b.RecordState<>'+ Quotedstr('作废')
    +' and b.date<='
    +Quotedstr(DateToStr(FEndDate))+' and b.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('PCPurchaseMaster')+' )'
    +' union all '
    +' select '
    +' 0.00 as AmountA  ,    '
    +' sum(isnull(a.SundryFee,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) as AmountB      '
    +' from PCPurchaseMaster a                                     '
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('PCPurchaseMaster')+' ) ) as a ' ;
  VouchTranTemp.Open;//汇总转换金额
  AmountA := VouchTranTemp.FieldByName('AmountA').AsFloat ;
  AmountB := VouchTranTemp.FieldByName('AmountB').AsFloat ;

  NewVoucherCode :=GetMaxCode('Code','FNCredMaster',number);
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' Insert into FNCredMaster ( '
    +' CreateUserID,Code,Date,BillMode,ModeDC,ModeC,Brief,Memo)'
    +' Values ( '+Inttostr(Guarder.UserID)+' , '+ Quotedstr(NewVoucherCode)
    +' , '+Quotedstr(DateToStr(FEndDate))+' , '+ Quotedstr('自动转换')
    +' , 1, 1 ,'+ Quotedstr('自动转换')+' , '+ Quotedstr('采购开单自动转换凭证')
    +' ) ';
  VouchTranTemp.ExecSQL;  //插入凭证头
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCredMaster where Code='
    +Quotedstr(NewVoucherCode);
  VouchTranTemp.Open;
  NewVoucherID :=Inttostr(VouchTranTemp.fieldbyname('ID').AsInteger);
  VouchTranTemp.Close;  //插入子表贷方金额---
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceCost,GoalUnitID, OriginTable,GoodsSpec )'
    +' select  MasterID ,GoodsID, sum(isnull(PriceBase,0)) as PriceBase ,'
    +' GoalUnitID,OriginTable,memo  from ( '

    +' select '+NewVoucherID+' as MasterID ,'
    +' e.ID as GoodsID, '
    +' (sum(isnull(a.Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) )                  '
    +' as PriceBase, b.ID  as GoalUnitID,               '
    +Quotedstr('PCPurchaseMaster')+' as OriginTable , ( '
    +Quotedstr('采购单号:')+' +b.code) as Memo '
    +' from PCPurchaseDetail  a                                     '
    +' left outer join PCPurchaseMaster b on b.ID=a.MasterID       '
    +' left outer join DaClient c on c.ID=b.ClientID           '
    +' left outer join DASubject d on d.ID=c.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('DAClient')+ ' and        '
    +'   e.RelativeID=b.ClientID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where b.RecordState<>'+Quotedstr('删除')
    +' and b.RecordState<>'+ Quotedstr('作废')
    +' and b.date<='
    +Quotedstr(DateToStr(FEndDate))+' and b.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('PCPurchaseMaster')+' )'
    +' group by b.ID,e.ID, b.Code  '

    +' union all '
    +' select '+NewVoucherID+' as MasterID ,'
    +' e.ID as GoodsID, '
    +' (sum(isnull(a.SundryFee,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)))        '
    +' as PriceBase, a.ID  as GoalUnitID,               '
    +Quotedstr('PCPurchaseMaster')+' as OriginTable , ( '
    +Quotedstr('采购单号:')+' +a.code) as Memo '
    +' from PCPurchaseMaster  a                                     '
    +' left outer join DaClient c on c.ID=a.ClientID           '
    +' left outer join DASubject d on d.ID=c.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('DAClient')+ ' and        '
    +'   e.RelativeID=a.ClientID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('PCPurchaseMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ) as a '
    +' Group by a.MasterID , a.GoodsID, a.GoalUnitID,a.OriginTable,a.memo ';
//  Memo1.Text := VouchTranTemp.SQL.Text;
  VouchTranTemp.ExecSQL; //插入子表贷方金额---

  if AmountA<>0 then
  begin
    VouchTranTemp.Close;  //插入子表借方金额====
    VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
      +' MasterID,GoodsID, PriceBase,GoodsSpec )'
      +' Values ( '+NewVoucherID+'   ,'
      + Inttostr(VourchTranIniADS.FieldByName('AccountFID').AsInteger)
      +' , ' + Floattostr(AmountA)+' , '
      +Quotedstr('汇总采购')+' ) ';
    VouchTranTemp.ExecSQL; //插入子表借方金额 ====
  end;
  if AmountB<>0 then
  begin
    VouchTranTemp.Close;  //插入子表借方金额****
    VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
      +' MasterID,GoodsID, PriceBase,GoodsSpec,Memo )'
      +' Values ( '+NewVoucherID + ' ,'
      + Inttostr(VourchTranIniADS.FieldByName('AccountGID').AsInteger)
      + ' , '   + Floattostr(AmountB)+' , '
      +Quotedstr('汇总附加费用')+' , '
      +Quotedstr('附加费用')+' ) ';
    VouchTranTemp.ExecSQL; //插入子表借方金额****
  end;
end;

procedure TFNCredenceBrowseForm.DoingCase2;
begin
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
// 转换收款结算
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNClearSLMaster '
    +' where RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+ Quotedstr('作废')
    +' and ( isnull(AmountD,0)+isnull(AmountRed,0) )<>0 and  '
    +' ID not in ( select GoalUnitID from FNCredDetail where '
    +' OriginTable=' +Quotedstr('FNClearSLMaster')
    +' ) and  Date<=' +Quotedstr(DateToStr(FEndDate));

  VouchTranTemp.Open;

  if VouchTranTemp.IsEmpty then exit;
  NewVoucherCode :=GetMaxCode('Code','FNCredMaster',number);
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' Insert into FNCredMaster ( '
    +' CreateUserID,Code,Date,BillMode,ModeDC,ModeC,Brief,Memo)'
    +' Values ( '+Inttostr(Guarder.UserID)+' , '+ Quotedstr(NewVoucherCode)
    +' , '+Quotedstr(DateToStr(FEndDate))+' , '+ Quotedstr('自动转换')
    +' , 1, 1 ,'+ Quotedstr('自动转换')+' , '+ Quotedstr('收款结算自动转换凭证')
    +' ) ';
  VouchTranTemp.ExecSQL;  //插入凭证头

  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCredMaster where Code='
    +Quotedstr(NewVoucherCode);
  VouchTranTemp.Open;
  NewVoucherID :=Inttostr(VouchTranTemp.fieldbyname('ID').AsInteger);

  VouchTranTemp.Close;  //插入子表借方金额---（收款帐户）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceBase,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    +' e.ID as GoodsID, '
    +' sum(isnull(a.AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceBase, a.ID  as GoalUnitID,               '
    +Quotedstr('FNClearSLMaster')+' as OriginTable , ( '
    +Quotedstr('收款结算:')+' +a.code) as Memo '
    +' from FNClearSLMaster a                                     '
    +' left outer join FNAccounts  b on b.ID=a.AccountsID       '
    +' left outer join DASubject d on d.ID=b.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('FNAccounts')+ ' and        '
    +'   e.RelativeID=a.AccountsID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountD,0)<>0 and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNClearSLMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表借方金额---

  VouchTranTemp.Close;  //插入子表借方金额===(折扣冲帐)
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceBase,GoalUnitID, OriginTable,GoodsSpec,Memo )'
    +' select '+NewVoucherID+' as MasterID , '
    + Inttostr(VourchTranIniADS.FieldByName('AccountFID').AsInteger)
    + 'as GoodsID, '
    +' sum(isnull(a.AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceBase, a.ID  as GoalUnitID,               '
    +Quotedstr('FNClearSLMaster_1')+' as OriginTable , ( '
    +Quotedstr('收款结算:')+' +a.code) as GoodsSpec, '
    +Quotedstr('折扣冲帐')+' as Memo '
    +' from FNClearSLMaster a                                     '
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountRed,0)<>0 and  a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNClearSLMaster_1')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNClearSLMaster')+' )'
    +' group by a.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表借方金额===

  VouchTranTemp.Close;  //插入子表贷方金额===（应收帐款）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceCost,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    + ' e.ID as GoodsID, '
    +' ( sum(isnull(a.AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))    +        '
    +' sum(isnull(a.AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) )           '
    +' as PriceCost, a.ID  as GoalUnitID,               '
    +Quotedstr('FNClearSLMaster_2')+' as OriginTable , ( '
    +Quotedstr('收款结算:')+' +a.code) as Memo '
    +' from FNClearSLMaster a                   '
    +' left outer join DaClient c on c.ID=a.ClientID           '
    +' left outer join DASubject d on d.ID=c.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('DAClient')+ ' and        '
    +'   e.RelativeID=a.ClientID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and (isnull(a.AmountD,0)+isnull(a.AmountRed,0))<>0 and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNClearSLMaster_2')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNClearSLMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表贷方金额===
end;

procedure TFNCredenceBrowseForm.DoingCase3;
begin
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
// 转换付款结算
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNClearPCMaster '
    +' where RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+ Quotedstr('作废')
    +' and ( isnull(AmountC,0)+isnull(AmountRed,0) )<>0 and  '
    +' ID not in (select GoalUnitID from FNCredDetail where '
    +' OriginTable=' +Quotedstr('FNClearPCMaster')
    +' ) and  Date<=' +Quotedstr(DateToStr(FEndDate));

  VouchTranTemp.Open;

  if VouchTranTemp.IsEmpty then exit;
  NewVoucherCode :=GetMaxCode('Code','FNCredMaster',number);
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' Insert into FNCredMaster ( '
    +' CreateUserID,Code,Date,BillMode,ModeDC,ModeC,Brief,Memo)'
    +' Values ( '+Inttostr(Guarder.UserID)+' , '+ Quotedstr(NewVoucherCode)
    +' , '+Quotedstr(DateToStr(FEndDate))+' , '+ Quotedstr('自动转换')
    +' , 1, 1 ,'+ Quotedstr('自动转换')+' , '+ Quotedstr('付款结算自动转换凭证')
    +' ) ';
  VouchTranTemp.ExecSQL;  //插入凭证头

  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCredMaster where Code='
    +Quotedstr(NewVoucherCode);
  VouchTranTemp.Open;
  NewVoucherID :=Inttostr(VouchTranTemp.fieldbyname('ID').AsInteger);

  VouchTranTemp.Close;  //插入子表贷方金额---（付款帐户）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceCost,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    +' e.ID as GoodsID, '
    +' sum(isnull(a.AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceCost, a.ID  as GoalUnitID,               '
    +Quotedstr('FNClearPCMaster')+' as OriginTable , ( '
    +Quotedstr('付款结算:')+' +a.code) as Memo '
    +' from FNClearPCMaster a                                     '
    +' left outer join FNAccounts  b on b.ID=a.AccountsID       '
    +' left outer join DASubject d on d.ID=b.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('FNAccounts')+ ' and        '
    +'   e.RelativeID=a.AccountsID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountC,0)<>0 and   a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNClearPCMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表贷方金额---

  VouchTranTemp.Close;  //插入子表贷方金额===(折扣冲帐)
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceCost,GoalUnitID, OriginTable,GoodsSpec,Memo )'
    +' select '+NewVoucherID+' as MasterID , '
    + Inttostr(VourchTranIniADS.FieldByName('AccountFID').AsInteger)
    + 'as GoodsID, '
    +' sum(isnull(a.AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceCost, a.ID  as GoalUnitID,               '
    +Quotedstr('FNClearPCMaster_1')+' as OriginTable , ( '
    +Quotedstr('付款结算:')+' +a.code) as GoodsSpec, '
    +Quotedstr('折扣冲帐')+' as Memo '
    +' from FNClearPCMaster a                                     '
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountRed,0) <>0 and  a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNClearPCMaster_1')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNClearPCMaster')+' )'
    +' group by a.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表贷方金额===

  VouchTranTemp.Close;  //插入子表借方金额===（应付帐款）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceBase,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    + ' e.ID as GoodsID, '
    +' ( sum(isnull(a.AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))    +        '
    +' sum(isnull(a.AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) )           '
    +' as PriceBase, a.ID  as GoalUnitID,               '
    +Quotedstr('FNClearPCMaster_2')+' as OriginTable , ( '
    +Quotedstr('付款结算:')+' +a.code) as Memo '
    +' from FNClearPCMaster a                   '
    +' left outer join DaClient c on c.ID=a.ClientID           '
    +' left outer join DASubject d on d.ID=c.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('DAClient')+ ' and        '
    +'   e.RelativeID=a.ClientID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and (isnull(a.AmountC,0)+isnull(a.AmountRed,0)<>0 ) and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNClearPCMaster_2')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNClearPCMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表借方金额===
//  Memo1.Text :=   VouchTranTemp.SQL.Text;
end;

procedure TFNCredenceBrowseForm.DoingCase4;
begin
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
// 转换收款申请
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCashInMaster '
    +' where RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+ Quotedstr('作废')
    +' and ( isnull(AmountD,0)+isnull(AmountRed,0) )<>0 and  '
    +' ID not in (select GoalUnitID from FNCredDetail where '
    +' OriginTable=' +Quotedstr('FNCashInMaster')
    +' ) and  Date<=' +Quotedstr(DateToStr(FEndDate));

  VouchTranTemp.Open;

  if VouchTranTemp.IsEmpty then exit;
  NewVoucherCode :=GetMaxCode('Code','FNCredMaster',number);
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' Insert into FNCredMaster ( '
    +' CreateUserID,Code,Date,BillMode,ModeDC,ModeC,Brief,Memo)'
    +' Values ( '+Inttostr(Guarder.UserID)+' , '+ Quotedstr(NewVoucherCode)
    +' , '+Quotedstr(DateToStr(FEndDate))+' , '+ Quotedstr('自动转换')
    +' , 1, 1 ,'+ Quotedstr('自动转换')+' , '+ Quotedstr('收款申请自动转换凭证')
    +' ) ';
  VouchTranTemp.ExecSQL;  //插入凭证头

  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCredMaster where Code='
    +Quotedstr(NewVoucherCode);
  VouchTranTemp.Open;
  NewVoucherID :=Inttostr(VouchTranTemp.fieldbyname('ID').AsInteger);

  VouchTranTemp.Close;  //插入子表借方金额---（收款帐户）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceBase,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    +' e.ID as GoodsID, '
    +' sum(isnull(a.AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceBase, a.ID  as GoalUnitID,               '
    +Quotedstr('FNCashInMaster')+' as OriginTable , ( '
    +Quotedstr('收款申请:')+' +a.code) as Memo '
    +' from FNCashInMaster a                                     '
    +' left outer join FNAccounts  b on b.ID=a.AccountsID       '
    +' left outer join DASubject d on d.ID=b.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('FNAccounts')+ ' and        '
    +'   e.RelativeID=a.AccountsID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountD,0)<>0 and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashInMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表借方金额---

  VouchTranTemp.Close;  //插入子表借方金额===(折扣冲帐)
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceBase,GoalUnitID, OriginTable,GoodsSpec,Memo )'
    +' select '+NewVoucherID+' as MasterID , '
    + Inttostr(VourchTranIniADS.FieldByName('AccountFID').AsInteger)
    + 'as GoodsID, '
    +' sum(isnull(a.AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceBase, a.ID  as GoalUnitID,               '
    +Quotedstr('FNCashInMaster_1')+' as OriginTable , ( '
    +Quotedstr('收款申请:')+' +a.code) as GoodsSpec, '
    +Quotedstr('折扣冲帐')+' as Memo '
    +' from FNCashInMaster a                                     '
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountRed,0)<>0 and  a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashInMaster_1')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashInMaster')+' )'
    +' group by a.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表借方金额===

  VouchTranTemp.Close;  //插入子表贷方金额===（其它应收款）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceCost,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    + ' e.ID as GoodsID, '
    +' ( sum(isnull(a.AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))    +        '
    +' sum(isnull(a.AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) )           '
    +' as PriceCost, a.ID  as GoalUnitID,               '
    +Quotedstr('FNCashInMaster_2')+' as OriginTable , ( '
    +Quotedstr('收款申请:')+' +a.code) as Memo '
    +' from FNCashInMaster a                   '
    +' left outer join MSEmployee c on c.ID=a.ClientID           '
    +' left outer join MSDepartment I on I.ID=C.DepartmentID       '
    +' left outer join DASubject d on d.ID=I.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('MSEmployee')+ ' and        '
    +'   e.RelativeID=a.ClientID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and (isnull(a.AmountD,0)+isnull(a.AmountRed,0))<>0 and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashInMaster_2')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashInMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表贷方金额===
end;

procedure TFNCredenceBrowseForm.DoingCase5;
begin
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
// 转换付款申请
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCashOutMaster '
    +' where RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+ Quotedstr('作废')
    +' and ( isnull(AmountC,0)+isnull(AmountRed,0) )<>0 and  '
    +' ID not in (select GoalUnitID from FNCredDetail where '
    +' OriginTable=' +Quotedstr('FNCashOutMaster')
    +' ) and  Date<=' +Quotedstr(DateToStr(FEndDate));

  VouchTranTemp.Open;

  if VouchTranTemp.IsEmpty then exit;
  NewVoucherCode :=GetMaxCode('Code','FNCredMaster',number);
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' Insert into FNCredMaster ( '
    +' CreateUserID,Code,Date,BillMode,ModeDC,ModeC,Brief,Memo)'
    +' Values ( '+Inttostr(Guarder.UserID)+' , '+ Quotedstr(NewVoucherCode)
    +' , '+Quotedstr(DateToStr(FEndDate))+' , '+ Quotedstr('自动转换')
    +' , 1, 1 ,'+ Quotedstr('自动转换')+' , '+ Quotedstr('付款申请自动转换凭证')
    +' ) ';
  VouchTranTemp.ExecSQL;  //插入凭证头

  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCredMaster where Code='
    +Quotedstr(NewVoucherCode);
  VouchTranTemp.Open;
  NewVoucherID :=Inttostr(VouchTranTemp.fieldbyname('ID').AsInteger);

  VouchTranTemp.Close;  //插入子表贷方金额---（付款帐户）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceCost,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    +' e.ID as GoodsID, '
    +' sum(isnull(a.AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceCost, a.ID  as GoalUnitID,               '
    +Quotedstr('FNCashOutMaster')+' as OriginTable , ( '
    +Quotedstr('付款申请:')+' +a.code) as Memo '
    +' from FNCashOutMaster a                                     '
    +' left outer join FNAccounts  b on b.ID=a.AccountsID       '
    +' left outer join DASubject d on d.ID=b.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('FNAccounts')+ ' and        '
    +'   e.RelativeID=a.AccountsID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountC,0)<>0  and    a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashOutMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表贷方金额---

  VouchTranTemp.Close;  //插入子表贷方金额===(折扣冲帐)
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceCost,GoalUnitID, OriginTable,GoodsSpec,Memo )'
    +' select '+NewVoucherID+' as MasterID , '
    + Inttostr(VourchTranIniADS.FieldByName('AccountFID').AsInteger)
    + 'as GoodsID, '
    +' sum(isnull(a.AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceCost, a.ID  as GoalUnitID,               '
    +Quotedstr('FNCashOutMaster_1')+' as OriginTable , ( '
    +Quotedstr('付款申请:')+' +a.code) as GoodsSpec, '
    +Quotedstr('折扣冲帐')+' as Memo '
    +' from FNCashOutMaster a                                     '
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountRed,0)<>0 and  a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashOutMaster_1')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashOutMaster')+' )'
    +' group by a.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表贷方金额===

  VouchTranTemp.Close;  //插入子表借方金额===（其它应收款）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, Pricebase,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    + ' e.ID as GoodsID, '
    +' ( sum(isnull(a.AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))    +        '
    +' sum(isnull(a.AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) )           '
    +' as PriceBase, a.ID  as GoalUnitID,               '
    +Quotedstr('FNCashOutMaster_2')+' as OriginTable , ( '
    +Quotedstr('付款申请:')+' +a.code) as Memo '
    +' from FNCashOutMaster a                   '
    +' left outer join MSEmployee c on c.ID=a.ClientID           '
    +' left outer join MSDepartment I on I.ID=C.DepartmentID       '
    +' left outer join DASubject d on d.ID=I.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('MSEmployee')+ ' and        '
    +'   e.RelativeID=a.ClientID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4) '
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and (isnull(a.AmountC,0)+isnull(a.AmountRed,0) )<>0 and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashOutMaster_2')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashOutMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表贷方金额===
end;

procedure TFNCredenceBrowseForm.DoingCase6;
begin
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
// 转换费用报销
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNExpenseMaster '
    +' where RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+ Quotedstr('作废')
    +' and ( isnull(AmountC,0)+isnull(AmountRed,0) )<>0 and  '
    +' ID not in (select GoalUnitID from FNCredDetail where '
    +' OriginTable=' +Quotedstr('FNExpenseMaster')
    +' ) and  Date<=' +Quotedstr(DateToStr(FEndDate));
  VouchTranTemp.Open;

  if VouchTranTemp.IsEmpty then exit;
  NewVoucherCode :=GetMaxCode('Code','FNCredMaster',number);
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' Insert into FNCredMaster ( '
    +' CreateUserID,Code,Date,BillMode,ModeDC,ModeC,Brief,Memo)'
    +' Values ( '+Inttostr(Guarder.UserID)+' , '+ Quotedstr(NewVoucherCode)
    +' , '+Quotedstr(DateToStr(FEndDate))+' , '+ Quotedstr('自动转换')
    +' , 1, 1 ,'+ Quotedstr('自动转换')+' , '+ Quotedstr('费用报销自动转换凭证')
    +' ) ';
  VouchTranTemp.ExecSQL;  //插入凭证头

  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCredMaster where Code='
    +Quotedstr(NewVoucherCode);
  VouchTranTemp.Open;
  NewVoucherID :=Inttostr(VouchTranTemp.fieldbyname('ID').AsInteger);

  VouchTranTemp.Close;  //插入子表借方金额===（费用科目）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, Pricebase,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    + ' e.ID as GoodsID, '
    +' sum(isnull(a.Amount,0)*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1))          '
    +' as PriceBase, b.ID  as GoalUnitID,               '
    +Quotedstr('FNExpenseMaster')+' as OriginTable , ( '
    +Quotedstr('费用报销:')+' +b.code) as Memo '
    +' from  FNExpenseDetail a                   '
    +' left outer join FNExpenseMaster b on b.ID=a.MasterID                 '
    +' left outer join DAExpenseClass c on c.ID=a.ExpenseID      '
    +' left outer join DASubject d on d.ID=c.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('DAExpenseClass')+ ' and        '
    +'   e.RelativeID=a.ExpenseID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where b.RecordState<>'+Quotedstr('删除')
    +' and b.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.Amount,0) <>0 and b.date<='
    +Quotedstr(DateToStr(FEndDate))+' and b.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNExpenseMaster')+' )'
    +' group by b.ID,e.ID, b.Code  ';
  VouchTranTemp.ExecSQL; //插入子表借方金额===

  VouchTranTemp.Close;  //插入子表贷方金额===(折扣冲帐)
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceCost,GoalUnitID, OriginTable,GoodsSpec,Memo )'
    +' select '+NewVoucherID+' as MasterID , '
    +' e.ID as GoodsID, '
    +' sum(isnull(a.AmountRed,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceCost, a.ID  as GoalUnitID,               '
    +Quotedstr('FNExpenseMaster_1')+' as OriginTable , ( '
    +Quotedstr('费用报销:')+' +a.code) as GoodsSpec, '
    +Quotedstr('折扣冲帐')+' as Memo '
    +' from FNExpenseMaster a  '
    +' left outer join MSEmployee s on s.ID=a.ClientID     '
    +' left outer join MSDepartment  b on b.ID=s.DepartMentID '
    +' left outer join DASubject d on d.ID=b.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('MSEmployee')+ ' and        '
    +'   e.RelativeID=a.ClientID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountRed,0)<>0 and  a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNExpenseMaster_1')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNExpenseMaster')+' )'
    +' group by e.ID, a.ID,a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表贷方金额===

  VouchTranTemp.Close;  //插入子表贷方金额---（付款帐户）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceCost,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    +' e.ID as GoodsID, '
    +' sum(isnull(a.AmountC,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceCost, a.ID  as GoalUnitID,               '
    +Quotedstr('FNExpenseMaster_2')+' as OriginTable , ( '
    +Quotedstr('费用报销:')+' +a.code) as Memo '
    +' from FNExpenseMaster a                                     '
    +' left outer join FNAccounts  b on b.ID=a.AccountsID       '
    +' left outer join DASubject d on d.ID=b.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('FNAccounts')+ ' and        '
    +'   e.RelativeID=a.AccountsID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountC,0)<>0  and  a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNExpenseMaster_2')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNExpenseMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';

//  Memo1.Text := VouchTranTemp.SQL.Text ;

  VouchTranTemp.ExecSQL; //插入子表贷方金额---


end;

procedure TFNCredenceBrowseForm.DoingCase7;
begin
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
// 转换资金调动
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCashOutInMaster '
    +' where RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+ Quotedstr('作废')+' and '
    +' ID not in (select GoalUnitID from FNCredDetail where '
    +' OriginTable=' +Quotedstr('FNCashOutInMaster')
    +' ) and  Date<=' +Quotedstr(DateToStr(FEndDate));

  VouchTranTemp.Open;

  if VouchTranTemp.IsEmpty then exit;
  NewVoucherCode :=GetMaxCode('Code','FNCredMaster',number);
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' Insert into FNCredMaster ( '
    +' CreateUserID,Code,Date,BillMode,ModeDC,ModeC,Brief,Memo)'
    +' Values ( '+Inttostr(Guarder.UserID)+' , '+ Quotedstr(NewVoucherCode)
    +' , '+Quotedstr(DateToStr(FEndDate))+' , '+ Quotedstr('自动转换')
    +' , 1, 1 ,'+ Quotedstr('自动转换')+' , '+ Quotedstr('资金调动自动转换凭证')
    +' ) ';
  VouchTranTemp.ExecSQL;  //插入凭证头

  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCredMaster where Code='
    +Quotedstr(NewVoucherCode);
  VouchTranTemp.Open;
  NewVoucherID :=Inttostr(VouchTranTemp.fieldbyname('ID').AsInteger);

  VouchTranTemp.Close;  //插入子表贷方金额---（调出帐户）
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceCost,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    +' e.ID as GoodsID, '
    +' sum(isnull(a.AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceCost, a.ID  as GoalUnitID,               '
    +Quotedstr('FNCashOutInMaster')+' as OriginTable , ( '
    +Quotedstr('资金调动:')+' +a.code) as Memo '
    +' from FNCashOutInMaster a                                     '
    +' left outer join FNAccounts  b on b.ID=a.ClientID       '
    +' left outer join DASubject d on d.ID=b.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('FNAccounts')+ ' and        '
    +'   e.RelativeID=a.ClientID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountD,0)<>0  and  a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashOutInMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表贷方金额---调出

  VouchTranTemp.Close;  //插入子表借方金额===调入
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceBase,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID , '
    +' e.ID as GoodsID, '
    +' sum(isnull(a.AmountD,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))            '
    +' as PriceBase, a.ID  as GoalUnitID,               '
    +Quotedstr('FNCashOutInMaster_1')+' as OriginTable , ( '
    +Quotedstr('资金调动:')+' +a.code) as Memo '
    +' from FNCashOutInMaster a                                     '
    +' left outer join FNAccounts  b on b.ID=a.AccountsID       '
    +' left outer join DASubject d on d.ID=b.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('FNAccounts')+ ' and        '
    +'   e.RelativeID=a.AccountsID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and isnull(a.AmountD,0)<>0  and  a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashOutInMaster_1')+' )'
    +' and a.ID in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('FNCashOutInMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
//  Memo1.Text :=   VouchTranTemp.SQL.Text ;
  VouchTranTemp.ExecSQL; //插入子表借方金额===调入
end;

procedure TFNCredenceBrowseForm.DoingCase8;
begin
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
// exit;
//转换采购成本
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from STGoodsOutCostMaster '
    +' where RecordState<>'+Quotedstr('删除')
    +' and RecordState<>'+ Quotedstr('作废')
    +' and BillMode='+ Quotedstr('采购成本核算')+ ' and '
    +' ID not in (select GoalUnitID from FNCredDetail where '
    +' OriginTable=' +Quotedstr('STGoodsOutCostMaster')
    +' ) and  Date<=' +Quotedstr(DateToStr(FEndDate));
  VouchTranTemp.Open;
  if VouchTranTemp.IsEmpty then exit;

  VouchTranTemp.Close;  //汇总转换金额
  VouchTranTemp.SQL.Text :=' select '
    +' sum(isnull(b.Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) as AmountA  ,    '
    +' sum(isnull(b.SundryFee,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) as AmountA1      '
    +' from STGoodsOutCostMaster a                             '
    +' left outer join STGoodsOutCostDetail b on b.MasterID=a.ID       '
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and BillMode='+ Quotedstr('采购成本核算')
    +' and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('STGoodsOutCostMaster')+' )' ;
  VouchTranTemp.Open;//汇总转换金额
  AmountA := VouchTranTemp.FieldByName('AmountA').AsFloat+
     VouchTranTemp.FieldByName('AmountA1').AsFloat;
  VouchTranTemp.Close;  //汇总转换金额
  VouchTranTemp.SQL.Text :=' select '
    +' sum(isnull(a.IndirectFee,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)) as AmountB     '
    +' from STGoodsOutCostMaster a                             '
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and BillMode='+ Quotedstr('采购成本核算')
    +' and isnull(a.IndirectFee,0)<>0 and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('STGoodsOutCostMaster')+' )' ;
  VouchTranTemp.Open;//汇总转换金额
  AmountB := VouchTranTemp.FieldByName('AmountB').AsFloat ;

  NewVoucherCode :=GetMaxCode('Code','FNCredMaster',number);
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' Insert into FNCredMaster ( '
    +' CreateUserID,Code,Date,BillMode,ModeDC,ModeC,Brief,Memo)'
    +' Values ( '+Inttostr(Guarder.UserID)+' , '+ Quotedstr(NewVoucherCode)
    +' , '+Quotedstr(DateToStr(FEndDate))+' , '+ Quotedstr('自动转换')
    +' , 1, 1 ,'+ Quotedstr('自动转换')+' , '+ Quotedstr('采购成本核算自动转换凭证')
    +' ) ';
  VouchTranTemp.ExecSQL;  //插入凭证头
  VouchTranTemp.Close;
  VouchTranTemp.SQL.Text :=' select ID from FNCredMaster where Code='
    +Quotedstr(NewVoucherCode);
  VouchTranTemp.Open;
  NewVoucherID :=Inttostr(VouchTranTemp.fieldbyname('ID').AsInteger);
  VouchTranTemp.Close;  //插入子表借方金额---
  VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
    +' MasterID,GoodsID, PriceBase,GoalUnitID, OriginTable,GoodsSpec )'
    +' select '+NewVoucherID+' as MasterID ,'
    +' e.ID as GoodsID, '
    +' (sum(isnull(b.Amount,0)*Isnull(ModeDC,1)*Isnull(ModeC,1))                   '
    +' +sum(isnull(b.SundryFee,0)*Isnull(ModeDC,1)*Isnull(ModeC,1)))               '
    +' as PriceBase, a.ID  as GoalUnitID,               '
    +Quotedstr('STGoodsOutCostMaster')+' as OriginTable , ( '
    +Quotedstr('采购成本核算:')+' +a.code) as Memo '
    +' from STGoodsOutCostMaster a                                     '
    +' left outer join STGoodsOutCostDetail b on b.MasterID=a.ID       '
    +' left outer join DaGoods c on c.ID=b.GoodsID           '
    +' left outer join DaGoodsClass  I on I.ID=C.GoodsClassID           '
    +' left outer join DASubject d on d.ID=I.GeneralACID       '
    +' Left outer join DASubject e on                          '
    +'   e.RelativeTable='+Quotedstr('DAGoods')+ ' and        '
    +'   e.RelativeID=b.GoodsID and substring(d.subCode,1,4)='
    +'   substring(e.subCode,1,4)'
    +' where a.RecordState<>'+Quotedstr('删除')
    +' and a.RecordState<>'+ Quotedstr('作废')
    +' and BillMode='+ Quotedstr('采购成本核算')
    +' and (isnull(b.Amount,0)+isnull(b.SundryFee,0) )<>0 and a.date<='
    +Quotedstr(DateToStr(FEndDate))+' and a.ID not in '
    +' ( select GoalUnitID from FNCredDetail where OriginTable='
    +Quotedstr('STGoodsOutCostMaster')+' )'
    +' group by a.ID,e.ID, a.Code  ';
  VouchTranTemp.ExecSQL; //插入子表借方金额---

  if AmountA<>0 then
  begin
    VouchTranTemp.Close;  //插入子表贷方金额====
    VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
      +' MasterID,GoodsID, PriceCost,GoodsSpec )'
      +' Values ( '+NewVoucherID+'   ,'
      + Inttostr(VourchTranIniADS.FieldByName('AccountFID').AsInteger)
      +' , ' + Floattostr(AmountA-AmountB)+' , '
      +Quotedstr('采购成本核算')+' ) ';
    VouchTranTemp.ExecSQL; //插入子表贷方金额 ====
  end;
  if AmountB<>0 then
  begin
    VouchTranTemp.Close;  //插入子表贷方金额****
    VouchTranTemp.SQL.Text :=' Insert Into FNCredDetail ( '
      +' MasterID,GoodsID, PriceCost,GoodsSpec,Memo)'
      +' Values ( '+NewVoucherID + ' ,'
      + Inttostr(VourchTranIniADS.FieldByName('AccountGID').AsInteger)
      + ' , '   + Floattostr(AmountB)+' , '
      +Quotedstr('间接费用')+' , '
      +Quotedstr('间接费用分摊')+' ) ';
    VouchTranTemp.ExecSQL; //插入子表贷方金额****
  end;
//转换完成后，关闭转换参数
  VourchTranIniADS.Edit;
  VourchTranIniADS.FieldByName('Code').AsString :='否';
  VourchTranIniADS.Post;
end;

procedure TFNCredenceBrowseForm.DoingCase9;
begin
//外币兑换
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
//
//转换完成后，关闭转换参数
  VourchTranIniADS.Edit;
  VourchTranIniADS.FieldByName('Code').AsString :='否';
  VourchTranIniADS.Post;

end;

procedure TFNCredenceBrowseForm.DoingCaseA;
begin
//领料成本核算
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
//
//转换完成后，关闭转换参数
  VourchTranIniADS.Edit;
  VourchTranIniADS.FieldByName('Code').AsString :='否';
  VourchTranIniADS.Post;
end;

procedure TFNCredenceBrowseForm.DoingCaseB;
begin
//外发加工核算
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
//
//转换完成后，关闭转换参数
  VourchTranIniADS.Edit;
  VourchTranIniADS.FieldByName('Code').AsString :='否';
  VourchTranIniADS.Post;
end;

procedure TFNCredenceBrowseForm.DoingCaseC;
begin
//生产成本核算

//转换完成后，关闭转换参数
  VourchTranIniADS.Edit;
  VourchTranIniADS.FieldByName('Code').AsString :='否';
  VourchTranIniADS.Post;
end;

procedure TFNCredenceBrowseForm.DoingCaseD;
begin
//销售成本核算
  if VourchTranIniADS.FieldByName('Code').AsString<>'是' then Exit;
//
//转换完成后，关闭转换参数
  VourchTranIniADS.Edit;
  VourchTranIniADS.FieldByName('Code').AsString :='否';
  VourchTranIniADS.Post;
end;

procedure TFNCredenceBrowseForm.ToolButton6Click(Sender: TObject);
begin
  Application.CreateForm(TFNVouchTranIniForm, FNVouchTranIniForm);
  FNVouchTranIniForm.ShowModal;
  FNVouchTranIniForm.Free;
end;


end.
