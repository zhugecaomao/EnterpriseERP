unit Navigator;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus, ComCtrls, OleCtrls, Buttons, ToolWin, Isp3,
  ActnList, ImgList, shdocvw;

const
  CM_HOMEPAGEREQUEST = WM_USER + $1000;

type
  TNavigatorForm = class(TForm)
    NavigatorImages: TImageList;
    NavigatorHotImages: TImageList;
    LinksImages: TImageList;
    LinksHotImages: TImageList;
    CoolBar1: TCoolBar;
    ToolBar1: TToolBar;
    BackBtn: TToolButton;
    ForwardBtn: TToolButton;
    StopBtn: TToolButton;
    RefreshBtn: TToolButton;
    Animate1: TAnimate;
    URLs: TComboBox;
    ActionListNet: TActionList;
    BackAction: TAction;
    ForwardAction: TAction;
    StopAction: TAction;
    RefreshAction: TAction;
    WebBrowser: TWebBrowser;
    ToolBar4: TToolBar;
    procedure Exit1Click(Sender: TObject);
    procedure StopClick(Sender: TObject);
    procedure URLsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LinksClick(Sender: TObject);
    procedure RefreshClick(Sender: TObject);
    procedure BackClick(Sender: TObject);
    procedure ForwardClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure URLsClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure nStatusbarClick(Sender: TObject);
    procedure BackActionUpdate(Sender: TObject);
    procedure ForwardActionUpdate(Sender: TObject);
    procedure WebBrowserBeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowserDownloadBegin(Sender: TObject);
    procedure WebBrowserDownloadComplete(Sender: TObject);
    procedure nExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    HistoryIndex: Integer;
    HistoryList: TStringList;
    UpdateCombo: Boolean;
    procedure FindAddress;
    procedure HomePageRequest(var message: tmessage); message CM_HOMEPAGEREQUEST;
  public

  end;

var
  NavigatorForm: TNavigatorForm;
  cIntHomepage: string;

procedure NavigateExecute(PageName: string);

implementation

uses WSUtils, MAIN, WSSecurity;

{$R *.DFM}

procedure TNavigatorForm.Exit1Click(Sender: TObject);
begin
  Close;
end;

procedure TNavigatorForm.FindAddress;
var
  Flags: OLEVariant;
begin
  Flags := 0;
  UpdateCombo := True;
  try
    WebBrowser.Navigate(WideString(Urls.Text), Flags, Flags, Flags, Flags);
  except
    WebBrowser.Navigate(WideString(cIntHomepage), Flags, Flags, Flags, Flags);
  end;
end;

procedure TNavigatorForm.StopClick(Sender: TObject);
begin
  WebBrowser.Stop;
end;

procedure TNavigatorForm.URLsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
  begin
    FindAddress;
  end;
end;

procedure TNavigatorForm.URLsClick(Sender: TObject);
begin
  FindAddress;
end;

procedure TNavigatorForm.LinksClick(Sender: TObject);
begin
  if (Sender as TToolButton).Hint = '' then Exit;
  URLs.Text := (Sender as TToolButton).Hint;
  FindAddress;
end;

procedure TNavigatorForm.RefreshClick(Sender: TObject);
begin
  FindAddress;
end;

procedure TNavigatorForm.BackClick(Sender: TObject);
begin
  URLs.Text := HistoryList[HistoryIndex - 1];
  FindAddress;
end;

procedure TNavigatorForm.ForwardClick(Sender: TObject);
begin
  URLs.Text := HistoryList[HistoryIndex + 1];
  FindAddress;
end;

procedure TNavigatorForm.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Shift = [ssAlt] then
    if (Key = VK_RIGHT) and ForwardBtn.Enabled then
      ForwardBtn.Click
    else if (Key = VK_LEFT) and BackBtn.Enabled then
      BackBtn.Click;
end;

procedure TNavigatorForm.nStatusbarClick(Sender: TObject);
begin
{  with Sender as TMenuItem do
  begin
    Checked := not Checked;
    StatusBar1.Visible := Checked;
  end;}
end;

procedure TNavigatorForm.HomePageRequest(var Message: TMessage);
begin
  URLs.Text := cIntHomepage;
  FindAddress;
end;

procedure TNavigatorForm.FormDestroy(Sender: TObject);
begin
  HistoryList.Free;
end;

procedure TNavigatorForm.BackActionUpdate(Sender: TObject);
begin
  if HistoryList.Count > 0 then
    BackAction.Enabled := HistoryIndex > 0
  else
    BackAction.Enabled := False;
end;

procedure TNavigatorForm.ForwardActionUpdate(Sender: TObject);
begin
  if HistoryList.Count > 0 then
    ForwardAction.Enabled := HistoryIndex < HistoryList.Count - 1
  else
    ForwardAction.Enabled := False;
end;

procedure TNavigatorForm.WebBrowserDownloadBegin(Sender: TObject);
begin
  { Turn the stop button dark red }
  StopBtn.ImageIndex := 4;
  { Play the avi from the first frame indefinitely }
  Animate1.Active := True;
end;

procedure TNavigatorForm.WebBrowserDownloadComplete(Sender: TObject);
begin
  { Turn the stop button grey }
  StopBtn.ImageIndex := 2;
  { Stop the avi and show the first frame }
  Animate1.Active := False;
end;

procedure TNavigatorForm.nExitClick(Sender: TObject);
begin
  Close;
end;

procedure TNavigatorForm.FormShow(Sender: TObject);
begin
  cIntHomepage := ExtractFilePath(Application.ExeName) + 'Navigation\系统管理.htm';
  HistoryIndex := -1;
  HistoryList := TStringList.Create;
  try
    Animate1.FileName := ExtractFilePath(Application.ExeName) + 'Navigation\cool.avi';
    PostMessage(Handle, CM_HOMEPAGEREQUEST, 0, 0);
  except
  end;
end;

procedure NavigateExecute(PageName: string);
var
  Url: string;
  I: integer;
  Flags: OLEVariant;
begin
  FindShowForm(TNavigatorForm, '');
  if PageName = '系统维护' then Url := '系统维护'//'erp_1'
  else if PageName = '基本资料' then Url := '基本资料'//'erp_1'
  else if PageName = '办公管理' then Url := '办公管理'//'erp_1'
  else if PageName = '销售管理' then Url := '销售管理'//'erp_2'
  else if PageName = '生产管理' then Url := '生产管理'//'erp_3'
  else if PageName = '采购管理' then Url := '采购管理'//'erp_4'
  else if PageName = '库存管理' then Url := '库存管理'//'erp_5'
  else if PageName = '财务管理' then Url := '财务管理'//'erp_6'
  else if PageName = '工资考勤' then Url := '工资管理'//'erp_7'
  else if PageName = '资产管理' then Url := '资产管理'//'erp_8'
  else if PageName = '项目管理' then Url := '项目管理'//'erp_1'
  else Url := '系统管理';

  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I].Caption = '导航' then
    begin
      (Screen.Forms[I] as TNavigatorForm).SetFocus;
      (Screen.Forms[I] as TNavigatorForm).URLs.Text := WideString(ExtractFilePath(Application.ExeName)) + 'Navigation\' + Url + '.htm';
      Flags := 0;
      (Screen.Forms[I] as TNavigatorForm).UpdateCombo := True;
      try
        if Url <> '' then
          (Screen.Forms[I] as TNavigatorForm).WebBrowser.Navigate(WideString((Screen.Forms[I] as TNavigatorForm).Urls.Text), Flags, Flags, Flags, Flags)
        else
          (Screen.Forms[I] as TNavigatorForm).WebBrowser.Navigate(WideString(ExtractFilePath(Application.ExeName)) + 'Navigation\系统管理.htm', Flags, Flags, Flags, Flags);
      except
      end;
    end;
  end;
end;

procedure TNavigatorForm.WebBrowserBeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
var
  NewIndex: Integer;
  Cmd: string;
begin
  try
    if LowerCase(Copy(URL, 1, 8)) = 'command:' then
    begin
      Cmd := LowerCase(Copy(URL, 9, MaxInt));

//      if (Guarder.UserName = '系统管理员') then
//      else if not (Guarder.HasRight(Cmd)) then
//      begin
//        showmessage('你没有此功能权限,无法使用此功能!请与系统管理员联系!');
//        exit;
//      end;

      with MainForm do
      begin
        if Cmd = '客户资料' then DAClientAction.Execute
        else if Cmd = '商品赠送' then DASLSaleGift.Execute
        else if Cmd = '客户信用' then SLCreditAction.Execute
        else if Cmd = '销售合同' then SLContractAction.Execute
        else if Cmd = '销售统计' then SLSaleStatistic.Execute
        else if Cmd = '销售分析预测' then SLSaleForecast.Execute
  //      else if Cmd = '销售排行' then SLSaleFruitListAction.Execute
        else if Cmd = '商品资料' then DAGoodsAction.Execute
        else if Cmd = '商品售价' then SLSalePrice.Execute
        else if Cmd = '销售订单' then SLOrderAction.Execute
        else if Cmd = '销售开单' then SLSaleAction.Execute
        else if Cmd = '销售结算' then FNClearSLAction.Execute
  //      else if Cmd = '销售出库' then SLGoodsOutAction.Execute
  //      else if Cmd = '销售退货' then SLSaleBackAction.Execute
  //      else if Cmd = '退货入库' then  SLGoodsOutBAction.Execute
        else if Cmd = '销售折扣' then  DASLDiscount.Execute
        else if Cmd = '送货登记' then
        else if Cmd = '装车放行' then
        else if Cmd = '售后服务' then
        else if Cmd = '销售单证审核' then
        else if Cmd = '销售单证管理' then
        else if Cmd = '客户档案' then

        else if Cmd = '厂商资料' then DApROVIDERAction.Execute
        else if Cmd = '商品进价' then PCPurchsePrice.Execute
        else if Cmd = '采购信用' then PCCreditAction.Execute
        else if Cmd = '采购结算' then FNClearPCAction.Execute
        else if Cmd = '采购合同' then PCContractAction.Execute
        else if Cmd = '采购订单' then PCOrderAction.Execute
        else if Cmd = '采购开单' then PCPurchaseAction.Execute
        else if Cmd = '采购入库' then PCGoodsInAction.Execute
  //      else if Cmd = '退货出库' then PCGoodsInBack.Execute
  //      else if Cmd = '采购退货' then PCPurchaseBack.Execute
        else if Cmd = '报销申请' then FNExpense.Execute
        else if Cmd = '采购统计' then PCpurchaseStatistic.Execute
        else if Cmd = '采购分析预测' then PCPurchaseForecast.Execute
        else if Cmd = '采购排行' then  PCPurchaseFruitAction.Execute


        else if Cmd = '联系人' then OALinkMenIDCard.Execute
        else if Cmd = '工作日志' then OABrJobRecordsAction.Execute
        else if Cmd = '知识管理' then OABrJobRecordsMng.Execute
        else if Cmd = '公司新闻' then OACompanyNews.Execute
        else if Cmd = '邮件收发' then OAEMail.Execute
        else if Cmd = '工作安排' then OABrJobArrangeAction.Execute
        else if Cmd = '客户关系' then OAClientkRelation.Execute
        else if Cmd = '厂商关系' then OAClientcRelation.Execute


        else if Cmd = '资金帐户' then DAFNAccounts.Execute
        else if Cmd = '计量单位' then MSUnitsAction.Execute
        else if Cmd = '币种资料' then DAMSCurrency.Execute
        else if Cmd = '会计科目' then DAFNAccountCode.Execute
        else if Cmd = '管理期间' then MSPeriodAction.Execute
        else if Cmd = '结算方式' then DAFNClearMode.Execute
        else if Cmd = '费用资料' then DAFNExpense.Execute
        else if Cmd = '资金调动' then FNCashOutIn.Execute
        else if Cmd = '现金流量' then FNCashFlow.Execute
        else if Cmd = '资金帐本' then FNActuialCash.Execute
        else if Cmd = '收款申请' then FNCashIn.Execute
        else if Cmd = '付款申请' then FNCashOut.Execute
        else if Cmd = '结算收款' then FNClearSLaction.Execute
        else if Cmd = '结算付款' then FNClearPCAction.Execute

        else if Cmd = '应收应付' then FNReceiptPayable.Execute
        else if Cmd = '其它应收款' then FNReceiptPayableE.Execute
        else if Cmd = '经营费用' then FNRunExpense.Execute
  //      else if Cmd = '营业利润' then FNProfitLoss.Execute
        else if Cmd = '资产负债' then FNBalanceSheet.Execute
        else if Cmd = '费用分析' then FNRunExpense.Execute
  //      else if Cmd = '帐龄分析' then FNAccountAgeAction.Execute




        else if Cmd = '仓库资料' then DASTWarehouse.Execute
        else if Cmd = '库存盘点' then STGoodsCountOff.Execute
        else if Cmd = '出库凭单' then STYDGoodsOut.Execute
        else if Cmd = '入库凭单' then STYDGoodsIn.Execute
        else if Cmd = '库存结帐' then STPCGoodsInCostAct.Execute
        else if Cmd = '当前库存' then STStockStatisticsAct.Execute
        else if Cmd = '库存变动' then STStockChange.Execute
        else if Cmd = '库存调拨' then STGoodsOutIn.Execute
//        else if Cmd = '代销寄销' then STGoodsOutIn.Execute

        else if Cmd = '物料清单' then YDFormulaAction.Execute
  //      else if Cmd = '生产能力' then YDpowerAction.Execute
  //      else if Cmd = '能力平衡' then YDForecastPL.Execute
        else if Cmd = '生产计划' then YDPlanAction.Execute
        else if Cmd = '物料计算' then YDPurchasePlan.Execute
  //      else if Cmd = '生产方案' then YDPrepareAction.Execute
  //      else if Cmd = '生产通知' then YDProductNotes.Execute
        else if Cmd = '生产领料' then STYDGoodsOut.Execute
        else if Cmd = '生产入库' then STYDGoodsIn.Execute
//        else if Cmd = '成本核算' then YDGoodsCost.Execute

        else if Cmd = '生产日报' then YDDailyReportAct.Execute
        else if Cmd = '生产统计' then YDStatisticReport.Execute
        else if Cmd = '车间库存' then YDStockInWorkAct.Execute
        else if Cmd = '物料还原' then YDBOMBackAction.Execute

        else if Cmd = '工作时段' then SRWorktimeAction.Execute
        else if Cmd = '作息时间' then SRWorkScheduleAction.Execute
        else if Cmd = '生产排班' then SRWorkRestAction.Execute
        else if Cmd = '计件项目' then SRJobsAction.Execute
        else if Cmd = '计件工价' then SRJobsPrice.Execute
        else if Cmd = '计件统计' then SRWorkQuantity.Execute
        else if Cmd = '计时统计' then SRWorkTimeCnt.Execute
        else if Cmd = '工资核算表' then SRBaseSalary.Execute
        else if Cmd = '工资统计' then
        else if Cmd = '工资分析' then SRSalaryAnalyze.Execute

        else if Cmd = '资产计划' then
        else if Cmd = '资产增加' then FAAssetAddAction.Execute
        else if Cmd = '资产折旧' then FADepreciation.Execute
        else if Cmd = '资产处置' then FAAssetReduce.Execute
        else if Cmd = '资产维修' then FAAssetReduce.Execute
        else if Cmd = '维修计划' then FAAssetRePlan.Execute
        else if Cmd = '资产总表' then FAAssetRept.Execute
        else if Cmd = '资产变动' then FAAssetChange.Execute
        else if Cmd = '计划管理' then FAAssetPlanRept.Execute

      end;
  //    ExecuteCommand(Cmd);
      Cancel := True;
    end;
  //胡建平
    if LowerCase(Copy(URL, 1, 3)) = 'res' then
      exit;
    NewIndex := HistoryList.IndexOf(URL);
    if NewIndex = -1 then
    begin
      { Remove entries in HistoryList between last address and current address }
      if (HistoryIndex >= 0) and (HistoryIndex < HistoryList.Count - 1) then
        while HistoryList.Count > HistoryIndex do
          HistoryList.Delete(HistoryIndex);
      HistoryIndex := HistoryList.Add(URL);
    end
    else
      HistoryIndex := NewIndex;
    if UpdateCombo then
    begin
      UpdateCombo := False;
      NewIndex := URLs.Items.IndexOf(URL);
      if NewIndex = -1 then
        URLs.Items.Insert(0, URL)
      else
        URLs.Items.Move(NewIndex, 0);
    end;
    URLs.Text := URL;
    MainForm.StatusBar.SimpleText := URL;
  except
    on E: Exception do
    begin
      Application.ShowException(E);
      Cancel := True;
    end;
  end;
end;

procedure TNavigatorForm.FormActivate(Sender: TObject);
begin
  self.WindowState := wsMaximized;
end;

end.

