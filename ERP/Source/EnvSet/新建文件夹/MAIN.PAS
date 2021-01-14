unit MAIN;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus, Navigator,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,shellapi,
  ActnList, ToolWin, ImgList, OutlookBar, DB, ADODB;

type
  TMainForm = class(TForm)
    MainMenu: TMainMenu;
    File1: TMenuItem;
    Window1: TMenuItem;
    N1: TMenuItem;
    FileExitItem: TMenuItem;
    WindowCascadeItem: TMenuItem;
    WindowTileItem: TMenuItem;
    WindowArrangeItem: TMenuItem;
    WindowMinimizeItem: TMenuItem;
    StatusBar: TStatusBar;
    ActionList: TActionList;
    WindowCascade1: TWindowCascade;
    WindowTileHorizontal1: TWindowTileHorizontal;
    WindowArrangeAll1: TWindowArrange;
    WindowMinimizeAll1: TWindowMinimizeAll;
    WindowTileVertical1: TWindowTileVertical;
    WindowTileItem2: TMenuItem;
    ToolBar2: TToolBar;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    pnlLeft: TPanel;
    VertSplitter: TSplitter;
    LargeImageList: TImageList;
    SmallImageList: TImageList;
    ToolImageList: TImageList;
    A1: TMenuItem;
    B1: TMenuItem;
    D1: TMenuItem;
    G1: TMenuItem;
    H1: TMenuItem;
    ReportsMenu: TMenuItem;
    K1: TMenuItem;
    MSCompanyUserAction: TAction;
    MSPermissionsAction: TAction;
    MSUserAction: TAction;
    MSloginAction: TAction;
    MSPeriodAction: TAction;
    DAMSCurrency: TAction;
    DAFNAccounts: TAction;
    DAFNAccountCode: TAction;
    DASTWarehouse: TAction;
    DAGoodsAction: TAction;
    MSUnitsAction: TAction;
    MSBillTypeAction: TAction;
    DAFNExpense: TAction;
    DAClientAction: TAction;
    DAProviderAction: TAction;
    SLContractAction: TAction;
    SLOrderAction: TAction;
    SLSaleAction: TAction;
    SLFNClearSL: TAction;
    SLGoodsOutAction: TAction;
    SLSaleBackAction: TAction;
    SLDeliverAction: TAction;
    PCContractAction: TAction;
    PCOrderAction: TAction;
    PCClearPCAction: TAction;
    PCGoodsInAction: TAction;
    PCPurchaseBack: TAction;
    PCPurchaseForecast: TAction;
    STHouseOutOutAction: TAction;
    STAction49: TAction;
    STGoodsOutIn: TAction;
    STStockCountOff: TAction;
    STAction52: TAction;
    FNCashIn: TAction;
    FNBalanceSheet: TAction;
    FNCashOutIn: TAction;
    FNAccountAgeAction: TAction;
    FNCashOut: TAction;
    FNAction66: TAction;
    YDPlanAction: TAction;
    YDPrepareAction: TAction;
    YDPurchasePlan: TAction;
    YDpowerAction: TAction;
    YDProductNotes: TAction;
    YDGoodsOut: TAction;
    YDBOMBack: TAction;
    YDGoodsCost: TAction;
    YDForecastPL: TAction;
    YDStockInWork: TAction;
    FileLogonAction: TAction;
    FileExitAction: TAction;
    FileSetPrintAction: TAction;
    SRJobsAction: TAction;
    OAAction98: TAction;
    Action200: TAction;
    F11: TMenuItem;
    F21: TMenuItem;
    A11: TMenuItem;
    A31: TMenuItem;
    A41: TMenuItem;
    A51: TMenuItem;
    A61: TMenuItem;
    A101: TMenuItem;
    B11: TMenuItem;
    B21: TMenuItem;
    B31: TMenuItem;
    B51: TMenuItem;
    B61: TMenuItem;
    D21: TMenuItem;
    D51: TMenuItem;
    D61: TMenuItem;
    D71: TMenuItem;
    D81: TMenuItem;
    D101: TMenuItem;
    G11: TMenuItem;
    G31: TMenuItem;
    G51: TMenuItem;
    G81: TMenuItem;
    G101: TMenuItem;
    H11: TMenuItem;
    H21: TMenuItem;
    H31: TMenuItem;
    H41: TMenuItem;
    H51: TMenuItem;
    H61: TMenuItem;
    H71: TMenuItem;
    I11: TMenuItem;
    K11: TMenuItem;
    K31: TMenuItem;
    A131: TMenuItem;
    A141: TMenuItem;
    A151: TMenuItem;
    MSDepartmentAction: TAction;
    MSEmployeesAction: TAction;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    q21: TMenuItem;
    N8: TMenuItem;
    MSBrAreasAction: TAction;
    FilePasswordChangeAction: TAction;
    f1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    NavigatorAction: TAction;
    Panel2: TPanel;
    Label1: TLabel;
    Panel3: TPanel;
    SpeedButton3: TSpeedButton;
    btnOutlookBar: TSpeedButton;
    HelpAboutAction: TAction;
    FNReceiptPayableE: TAction;
    FNActuialCash: TAction;
    FNCashFlow: TAction;
    FNExpense: TAction;
    FNProfitLoss: TAction;
    FNAction6: TAction;
    FNAction7: TAction;
    FNAction8: TAction;
    FNAction9: TAction;
    EGContractAction: TAction;
    FNReceiptPayable: TAction;
    FNRunExpense: TAction;
    PCPurchaseAction: TAction;
    PCCreditAction: TAction;
    PCGoodsInBack: TAction;
    FAAssetAddAction: TAction;
    FADepreciation: TAction;
    PCPurchaseFruitAction: TAction;
    PCpurchaseStatistic: TAction;
    STGoodsOutCost: TAction;
    STYDGoodsIn: TAction;
    STActualStock: TAction;
    STYDGoodsOut: TAction;
    STAction26: TAction;
    STSLGoodsOut: TAction;
    STGoodsCountOff: TAction;
    STAction29: TAction;
    STAction30: TAction;
    STAction31: TAction;
    STAction32: TAction;
    STAction33: TAction;
    StockChange: TAction;
    STAction35: TAction;
    SLGoodsOutBAction: TAction;
    SLCreditAction: TAction;
    SLSaleChainList: TAction;
    SLSaleClientAction: TAction;
    SLSaleSpecail: TAction;
    SLSaleForecast: TAction;
    YDDealProductMngr: TAction;
    YDDailyReport: TAction;
    YDStatisticReport: TAction;
    YDAction47: TAction;
    YDGoodsIn: TAction;
    DAMaterialClassAction: TAction;
    DAMaterialAction: TAction;
    DASLDiscount: TAction;
    DASLSaleGift: TAction;
    DAFNClearMode: TAction;
    DAProjectAction: TAction;
    DAAccountPeriod: TAction;
    OAClientkRelation: TAction;
    OAClientcRelation: TAction;
    OABrJobRecordsMng: TAction;
    OABrJobRecordsAction: TAction;
    OACompanyNews: TAction;
    OAEMail: TAction;
    OABrJobArrangeAction: TAction;
    DAGoodsClass: TAction;
    MSAttrDictionary: TAction;
    MSPostionClass: TAction;
    MSPostionBrowse: TAction;
    OALinkMenIDCard: TAction;
    ReportsExplorerAction: TAction;
    SLContractPrice: TAction;
    YDFormulaAction: TAction;
    O1: TMenuItem;
    L1: TMenuItem;
    l11: TMenuItem;
    l21: TMenuItem;
    G111: TMenuItem;
    G121: TMenuItem;
    G2: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N32: TMenuItem;
    N28: TMenuItem;
    N33: TMenuItem;
    N36: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    N42: TMenuItem;
    N43: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N49: TMenuItem;
    N56: TMenuItem;
    N58: TMenuItem;
    N59: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    N65: TMenuItem;
    N69: TMenuItem;
    N72: TMenuItem;
    N74: TMenuItem;
    N77: TMenuItem;
    N80: TMenuItem;
    N85: TMenuItem;
    N79: TMenuItem;
    PCPurchsePrice: TAction;
    SLSaleFruitListAction: TAction;
    SLSalePrice: TAction;
    FNClearSLaction: TAction;
    FNClearPCAction: TAction;
    PCCotractPrice: TAction;
    N86: TMenuItem;
    MyReportsCustomizeAction: TAction;
    C1: TMenuItem;
    STPCGoodsIn: TAction;
    SRJobsPrice: TAction;
    SRWorkQuantity: TAction;
    SRSalaryAnalyze: TAction;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    N90: TMenuItem;
    N34: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N7: TMenuItem;
    N10: TMenuItem;
    N12: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N18: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    SRBaseSalary: TAction;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    FileSystemIni: TAction;
    N35: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    SRWorktimeAction: TAction;
    SRWorkScheduleAction: TAction;
    N44: TMenuItem;
    SRWorkRestAction: TAction;
    N48: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N52: TMenuItem;
    N19: TMenuItem;
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N57: TMenuItem;
    N64: TMenuItem;
    EGMaterialChangeAct: TAction;
    EGProjectProgress: TAction;
    EGMaterialBalance: TAction;
    N66: TMenuItem;
    N67: TMenuItem;
    N71: TMenuItem;
    EGconsignInAction: TAction;
    EGconsignOutAction: TAction;
    N75: TMenuItem;
    N76: TMenuItem;
    N81: TMenuItem;
    SRWorkTimeCnt: TAction;
    N82: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    N91: TMenuItem;
    FileDataBackup: TAction;
    B2: TMenuItem;
    SRLeaveRept: TAction;
    N92: TMenuItem;
    FAAssetRept: TAction;
    N93: TMenuItem;
    N94: TMenuItem;
    N95: TMenuItem;
    N96: TMenuItem;
    N97: TMenuItem;
    FAAssetReduce: TAction;
    FAAssetRepair: TAction;
    FAAssetRePlan: TAction;
    N98: TMenuItem;
    N99: TMenuItem;
    N100: TMenuItem;
    FAAssetChange: TAction;
    N101: TMenuItem;
    FAAssetPlanRept: TAction;
    N102: TMenuItem;
    N103: TMenuItem;
    N104: TMenuItem;
    UseTest: TADOQuery;
    N105: TMenuItem;
    N106: TMenuItem;
    SLSaleStatistic: TAction;
    N107: TMenuItem;
    N108: TMenuItem;
    N109: TMenuItem;
    FileDataRestore: TAction;
    N110: TMenuItem;
    FileShowHelpDoc: TAction;
    PCDealPurchase: TAction;
    N111: TMenuItem;
    N112: TMenuItem;
    N63: TMenuItem;
    N113: TMenuItem;
    N9: TMenuItem;
    N114: TMenuItem;
    N115: TMenuItem;
    N116: TMenuItem;
    EGMaterialInAction: TAction;
    EGMaterialOutAction: TAction;
    EGProExpenseAction: TAction;
    EGMaterialInSTTAction: TAction;
    EGMaterialOutSTTAction: TAction;
    EGProjectCostAction: TAction;
    EGProjectExpenseAction: TAction;
    N117: TMenuItem;
    N118: TMenuItem;
    N119: TMenuItem;
    N120: TMenuItem;
    N121: TMenuItem;
    N122: TMenuItem;
    N123: TMenuItem;
    N124: TMenuItem;
    N125: TMenuItem;
    N126: TMenuItem;
    FileClearBusData: TAction;
    N73: TMenuItem;
    N127: TMenuItem;
    N128: TMenuItem;
    N129: TMenuItem;
    N130: TMenuItem;
    N68: TMenuItem;
    DAProjectClassAct: TAction;
    N6: TMenuItem;
    FNCredenceAction: TAction;
    N70: TMenuItem;
    N78: TMenuItem;
    N134: TMenuItem;
    N136: TMenuItem;
    N138: TMenuItem;
    N139: TMenuItem;
    PayableAccountAct: TAction;
    N132: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure SLSaleActionExecute(Sender: TObject);
    procedure MSPeriodActionExecute(Sender: TObject);
    procedure MSPermissionsActionExecute(Sender: TObject);
    procedure MSloginActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FileExitActionExecute(Sender: TObject);
    procedure FileLogonActionExecute(Sender: TObject);
    procedure MSUserActionExecute(Sender: TObject);
    procedure SLSaleBackActionExecute(Sender: TObject);
    procedure SLGoodsOutActionExecute(Sender: TObject);
    procedure SLOrderActionExecute(Sender: TObject);
    procedure NavigatorActionExecute(Sender: TObject);
    procedure btnOutlookBarClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure HelpAboutActionExecute(Sender: TObject);
    procedure SLContractActionExecute(Sender: TObject);
    procedure SLClearActionExecute(Sender: TObject);
    procedure DAClientActionExecute(Sender: TObject);
    procedure DAGoodsActionExecute(Sender: TObject);
    procedure DASTWarehouseExecute(Sender: TObject);
    procedure DASLDiscountExecute(Sender: TObject);
    procedure DASLSaleGiftExecute(Sender: TObject);
    procedure DAFNClearModeExecute(Sender: TObject);
    procedure DAFNAccountCodeExecute(Sender: TObject);
    procedure DAMSCurrencyExecute(Sender: TObject);
    procedure DAFNExpenseExecute(Sender: TObject);
    procedure DAFNAccountsExecute(Sender: TObject);
    procedure MSUnitsActionExecute(Sender: TObject);
    procedure MSCompanyUserActionExecute(Sender: TObject);
    procedure MSDepartmentActionExecute(Sender: TObject);
    procedure MSEmployeesActionExecute(Sender: TObject);
    procedure MSBrAreasActionExecute(Sender: TObject);
    procedure DAGoodsClassExecute(Sender: TObject);
    procedure MSAttrDictionaryExecute(Sender: TObject);
    procedure MSPostionClassExecute(Sender: TObject);
    procedure MSPostionBrowseExecute(Sender: TObject);
    procedure MSBillTypeActionExecute(Sender: TObject);
    procedure PCGoodsInActionExecute(Sender: TObject);
    procedure STYDGoodsOutExecute(Sender: TObject);
    procedure STYDGoodsInExecute(Sender: TObject);
    procedure PCClearPCActionExecute(Sender: TObject);
    procedure OALinkMenIDCardExecute(Sender: TObject);
    procedure PCContractActionExecute(Sender: TObject);
    procedure ReportsExplorerActionExecute(Sender: TObject);
    procedure OABrJobRecordsActionExecute(Sender: TObject);
    procedure OABrJobRecordsMngExecute(Sender: TObject);
    procedure PCOrderActionExecute(Sender: TObject);
    procedure FNExpenseExecute(Sender: TObject);
    procedure OABrJobArrangeActionExecute(Sender: TObject);
    procedure YDFormulaActionExecute(Sender: TObject);
    procedure STGoodsOutInExecute(Sender: TObject);
    procedure STStockCountOffExecute(Sender: TObject);
    procedure SLContractPriceExecute(Sender: TObject);
    procedure FNCashInExecute(Sender: TObject);
    procedure FNCashOutExecute(Sender: TObject);
    procedure OAEMailExecute(Sender: TObject);
    procedure DAProviderActionExecute(Sender: TObject);
    procedure OAClientcRelationExecute(Sender: TObject);
    procedure OACompanyNewsExecute(Sender: TObject);
    procedure OAClientkRelationExecute(Sender: TObject);
    procedure PCPurchaseActionExecute(Sender: TObject);
    procedure YDpowerActionExecute(Sender: TObject);
    procedure YDPlanActionExecute(Sender: TObject);
    procedure YDPrepareActionExecute(Sender: TObject);
    procedure YDForecastPLExecute(Sender: TObject);
    procedure SLGoodsOutBActionExecute(Sender: TObject);
    procedure PCGoodsInBackExecute(Sender: TObject);
    procedure PCPurchaseBackExecute(Sender: TObject);
    procedure PCPurchsePriceExecute(Sender: TObject);
    procedure SLSaleFruitListActionExecute(Sender: TObject);
    procedure SLSalePriceExecute(Sender: TObject);
    procedure SLSaleSpecailExecute(Sender: TObject);
    procedure FNClearSLactionExecute(Sender: TObject);
    procedure FNClearPCActionExecute(Sender: TObject);
    procedure PCCotractPriceExecute(Sender: TObject);
    procedure ReportMenuItemClick(Sender: TObject);
    procedure MyReportsCustomizeActionExecute(Sender: TObject);
    procedure StockChangeExecute(Sender: TObject);
    procedure STActualStockExecute(Sender: TObject);
    procedure FNActuialCashExecute(Sender: TObject);
    procedure FNCashOutInExecute(Sender: TObject);
    procedure FNCashFlowExecute(Sender: TObject);
    procedure FNRunExpenseExecute(Sender: TObject);
    procedure FNReceiptPayableExecute(Sender: TObject);
    procedure FNReceiptPayableEExecute(Sender: TObject);
    procedure FNProfitLossExecute(Sender: TObject);
    procedure FNBalanceSheetExecute(Sender: TObject);
    procedure STGoodsOutCostExecute(Sender: TObject);
    procedure STGoodsCountOffExecute(Sender: TObject);
    procedure MSClearTestDataExecute(Sender: TObject);
    procedure SRJobsActionExecute(Sender: TObject);
    procedure SRJobsPriceExecute(Sender: TObject);
    procedure SRWorkQuantityExecute(Sender: TObject);
    procedure SRSalaryAnalyzeExecute(Sender: TObject);
    procedure PCCreditActionExecute(Sender: TObject);
    procedure SLCreditActionExecute(Sender: TObject);
    procedure YDBOMBackExecute(Sender: TObject);
    procedure YDGoodsCostExecute(Sender: TObject);
    procedure SRBaseSalaryExecute(Sender: TObject);
    procedure YDStockInWorkExecute(Sender: TObject);
    procedure YDPurchasePlanExecute(Sender: TObject);
    procedure FileSystemIniExecute(Sender: TObject);
    procedure PCPurchaseFruitActionExecute(Sender: TObject);
    procedure SRWorktimeActionExecute(Sender: TObject);
    procedure SRWorkScheduleActionExecute(Sender: TObject);
    procedure SRWorkRestActionExecute(Sender: TObject);
    procedure SLSaleClientActionExecute(Sender: TObject);
    procedure SRWorkTimeCntExecute(Sender: TObject);
    procedure SLSaleChainListExecute(Sender: TObject);
    procedure FileDataBackupExecute(Sender: TObject);
    procedure SRLeaveReptExecute(Sender: TObject);
    procedure FADepreciationExecute(Sender: TObject);
    procedure FAAssetAddActionExecute(Sender: TObject);
    procedure FAAssetReptExecute(Sender: TObject);
    procedure FAAssetReduceExecute(Sender: TObject);
    procedure FAAssetRepairExecute(Sender: TObject);
    procedure FAAssetRePlanExecute(Sender: TObject);
    procedure FAAssetChangeExecute(Sender: TObject);
    procedure FAAssetPlanReptExecute(Sender: TObject);
    procedure YDDailyReportExecute(Sender: TObject);
    procedure YDStatisticReportExecute(Sender: TObject);
    procedure FNAccountAgeActionExecute(Sender: TObject);
    procedure SLSaleForecastExecute(Sender: TObject);
    procedure SLSaleStatisticExecute(Sender: TObject);
    procedure PCpurchaseStatisticExecute(Sender: TObject);
    procedure PCPurchaseForecastExecute(Sender: TObject);
    procedure FileDataRestoreExecute(Sender: TObject);
    procedure FileShowHelpDocExecute(Sender: TObject);
    procedure FilePasswordChangeActionExecute(Sender: TObject);
    procedure DAMaterialClassActionExecute(Sender: TObject);
    procedure DAMaterialActionExecute(Sender: TObject);
    procedure DAProjectActionExecute(Sender: TObject);
    procedure EGMaterialInActionExecute(Sender: TObject);
    procedure EGMaterialOutActionExecute(Sender: TObject);
    procedure EGMaterialInSTTActionExecute(Sender: TObject);
    procedure EGMaterialOutSTTActionExecute(Sender: TObject);
    procedure FileClearBusDataExecute(Sender: TObject);
    procedure EGMaterialBalanceExecute(Sender: TObject);
    procedure EGMaterialChangeActExecute(Sender: TObject);
    procedure EGProjectExpenseActionExecute(Sender: TObject);
    procedure EGProExpenseActionExecute(Sender: TObject);
    procedure EGProjectCostActionExecute(Sender: TObject);
    procedure DAProjectClassActExecute(Sender: TObject);
    procedure FNCredenceActionExecute(Sender: TObject);
  private
    { Private declarations }
    FOutlookBar: TOutlookBar;
    //设置OutlookBar页面
    procedure SetOutlookBarPage;
    procedure OutlookBarItemClick(Sender: TObject; AItem: TOutlookBarItem);
    procedure OutlookBarPageChange(Sender: TObject);
    procedure OutlookBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DoEnterAsTab(var Msg: TMsg; var Handled: Boolean);
    procedure MyReportMenuItemClick(Sender: TObject);
    procedure RebuildReportMenu;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses WSUtils,  MSBrCurrency, MSOption,
  WSSecurity, CommonDM, DABrAreas, MSBrDepartment,   DABrClient, DABrGoods, DAAttributeBr, FNBrAccounts, DABrAccountCode,
  MSBrLogin,
  DABrGoodsClasses, MSBrPostion, DAAttributeEdit, About,
  MSBrUnits, DABrExpenseClass,
  DABrPOClear, SLBrSalePrice,

  {hcw:} DABrClientkRelation, DABrClientcRelation,
  SLBrCredit, DABillType, PCBrCredit,
  MSPermissions, MSPeriod,
  MSBrPostionClass, MSBrRoles, DABrLinkMenIDCard,
  PCBrContract, SLBrContract, OABrJobRecords, OABrJobRecordsMng,
  OABrJobArrange, SLBrSaleGift, FNBrExpense, STBrCountOff,
  DABrmanufacturer,
  OABrCompanyNews, YDBrPW, YDBrProductPlan, YDBrBalanceOf,
  YDBrExpressBalance, SLBrSaleS,FNBrClearSL,
  SLBrSaleB, SLBrOrder, SLBrGoodsOut,
  PCBrContractPrice, PCBrPurchasePrice, SLBrDiscount, RpCustomize,
  SLBrGoodsOutB, PCBrOrder, PCBrPurchase, PCBrPurchaseB, PCBrGoodsIn,
  FNBrClearPC, PCBrGoodsInB, SLBrContractPrice, STStockChange, FNBrCashIn,
  FNBrCashOut, YDBrGoodsIn, YDBrGoodsOut, FNBrCashOutIn,
  STBrGoodsOutIn, FNActualCash, FNCashFlow, FNExpenseRep,
  FNReceiptPayable, FNReceiptPayableE, FNProfitLoss, FNBalanceSheet,
  SLBrSale, STBrGoodsCountOff, STBrGoodsOutCost, SRBrJobPrice,
  SRBrWorkQuantity, SRBrBaseSalary, YDBrFormula, YDBrPurchasePlan,
  YDBOMBack, YDStockInWork, SLSaleFruitList, PCPurchaseFruitList,
  SRBrWorkTime, SRBrWorkSchedule, SREdWorkRest, SRBrWorkRest,
  SLBrSaleClient, SRBrWorkTimeCnt, SLSaleChainList, SRSalaryAnalyze,
  FABrAssetAdd, FABrDepreciation, FNAssetRept, MSBrEmployee,
  FABrAssetReduce, FABrAssetRepair, FABrAssetRePlan, FAAssetChange,
  FAAssetPlanRept, YDDailyReport, YDStatisticReport, MSBrUserNew, SRBrJobs,
  FNAccountAge, SLSaleForeCast, SLSaleStatistic, PCPurchaseStatistic,
  PCPurchaseForeCast ,MSDataRestore, MSEdUserPassWord,
  DAMaterialClassBrowse, DAMaterialBrowse, DAProjectBrowse, EGBrMaterialIn,
  EGBrMaterialOut, EGMaterialInStatistic, EGMaterialOutStatistic,
  EGBrExpense, EGMaterialBalance, EGExpenseStatistic,EGProjectCostSTT,
  DABrWarehouse, STActualStock, DABrProject, DABrProjectClass,
  EGMaterialChange, EGExpenseStatisticEgm, DASubject, FNBrCredence,
  FNExpenseSttc;

procedure TMainForm.DoEnterAsTab(var Msg: TMsg; var Handled: Boolean);
{在整个程序中,
Enter键使用作Tab键
//胡建平}
begin
  if Msg.Message = WM_KEYDOWN then
  begin
    if Msg.wParam = VK_RETURN then
      Keybd_event(VK_TAB, 0, 0, 0);
  end;
end;

//设置OutlookBar页面

procedure TMainForm.SetOutlookBarPage;
  function FindPage(const PageName: string): TOutlookBarPage;
  var
    I: Integer;
  begin
    for I := 0 to FOutlookBar.Pages.Count - 1 do
      if SameText(FOutlookBar.Pages[I].Caption, PageName) then
      begin
        Result := FOutlookBar.Pages[I];
        Exit;
      end;
    Result := nil;
  end;
var
  I: Integer;
  Page: TOutlookBarPage;
begin
  FOutlookBar := TOutlookBar.Create(Self);
  with FOutLookBar do
  begin
    Parent := pnlLeft;
    Align := alClient;
    Flat := True;
   // Color:=$00555555;
    ShowHint := true;
    Hint := '单击鼠标右键切换图标大小';
    Font.Charset := GB2312_CHARSET;
    Font.Color := clBlack;
    Font.Height := -12;
    Font.Name := '宋体';
    Font.Style := [];

    LargeImages := LargeImageList;
    SmallImages := SmallImageList;
    OnItemClick := OutlookBarItemClick;
    OnPageChange := OutlookBarPageChange;
    OnMouseDown := OutlookBarMouseDown;
    for I := 0 to ActionList.ActionCount - 1 do
      if ActionList[I].Tag and 1 = 1 then //tActionList.Tag>0则加入到OutlookBar页中
      begin
        Page := FindPage(ActionList[I].Category);
        if Page = nil then
        begin
          Page := Pages.Add;
          Page.Caption := ActionList[I].Category;
          // 下面一句用来控制某一页显示为小图标，请根据情况使用
          // if Page.Caption = ? then Page.IconStyle := isSmall;
          Page.IconStyle := isSmall;
//          if Page.Caption = '销售管理' then Page.IconStyle := isSmall;
        end;
        with Page.Items.Insert(nil, Page.Items.Count) do
        begin
          if ActionList[I] is TCustomAction then
          begin
            ImageIndex := TCustomAction(ActionList[I]).ImageIndex;
            Caption := TCustomAction(ActionList[I]).Caption;
          end;
          Data := ActionList.Actions[I];
        end;
      end;
  end;
end;

procedure TMainForm.OutlookBarMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
//单击鼠标右键切换图标大小
//胡建平
//2002-11-09
  if Button = mbRight then
  begin
    if (Sender as TOutlookBar).Pages[(Sender as TOutlookBar).PageIndex].IconStyle = isSmall then
      (Sender as TOutlookBar).Pages[(Sender as TOutlookBar).PageIndex].IconStyle := isLarge
    else
      (Sender as TOutlookBar).Pages[(Sender as TOutlookBar).PageIndex].IconStyle := isSmall;
  end;
  FOutlookBar.Refresh;
end;

procedure TMainForm.OutlookBarPageChange(Sender: TObject);
//胡建平
//2002-11-09
var
  vPage: string;
begin
  try
    vPage := (Sender as TOutlookBar).Pages[(Sender as TOutlookBar).PageIndex].Caption;
    NavigateExecute(vPage);
  except
  end;
end;

procedure TMainForm.OutlookBarItemClick(Sender: TObject;
  AItem: TOutlookBarItem);
begin
  if (Guarder.UserName = '系统管理员') then
    TBasicAction(AItem.Data).Execute
  else if Guarder.HasRight(AItem.Caption) then
    TBasicAction(AItem.Data).Execute
  else showmessage('你没有此功能权限,无法使用此功能!请与系统管理员联系!');
end;


procedure TMainForm.FormCreate(Sender: TObject);
begin
  SetOutlookBarPage;
  Application.OnMessage := DoEnterAsTab;
  RebuildReportMenu;
end;

procedure TMainForm.MSPeriodActionExecute(Sender: TObject);
begin
//管理期间
  PeriodDlg;
end;

procedure TMainForm.MSPermissionsActionExecute(Sender: TObject);
begin
//权限登记
  ManagePermissionsDlg;
end;

procedure TMainForm.MSloginActionExecute(Sender: TObject);
begin
  //登陆管理
  FindShowForm(TMSBrLoginForm, '');
end;

procedure TMainForm.FormShow(Sender: TObject);
var year,month,day :word;
    Datestr :string;
begin
//  Application.Title :=Application.Title
{$IFDEF NICE}
  Caption :=' '+Trim(Guarder.CompanyUserName)+
      ' (ERP)     操作员:'+Guarder.UserName;
{$ELSE}
  Caption := '';
{$ENDIF}
  with FindShowForm(TNavigatorForm, '') do
  begin
    Top := 0;
    Left := 0;
    Width := 640;
    Height := 480;
  end;
  if pos('东莞市益农饲料有限公司',GetCompanyName)<=0 then
  begin
    showmessage(' 产品没有授权,不能使用,请与供应商联系!');
    Application.Terminate;
  end;

  DecodeDate(Date-31,year, month, day);
  DateStr :=Datetostr(Date);
  if (pos('-',Datetostr(Date))<=4) then
     showmessage('本系统要求日期格式:"yyyy-mm-dd"; 而当前格式:"'
         +DateStr+'" '+#13+#13
         +',请在"开始->设置->控制面板->区域选项->日期" 中修改格式。');
  with UseTest do
  begin
    close;
    sql.Text :=' select top 1 * from MSPeriod ';
    open;
    if UseTest.IsEmpty then
    begin
      close;
      if month<10 then sql.Text :=' insert into  MSPeriod ( Name,RECORDSTATE)'+
         ' VALUES ( '+Quotedstr(inttostr(year)+'-0'+inttostr(month))+' , '+QUOTEDSTR('删除')+ ' )'
         else  sql.Text :=' insert into  MSPeriod ( Name)'+
         ' VALUES ( '+Quotedstr(inttostr(year)+'-'+inttostr(month))+' , '+QUOTEDSTR('删除')+' )';
      ExecSql;
    end;
    close;
  end;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    Close;
    sql.Text := 'update MSlogin set LogoutTime=getDate() ' +
      ' where LoginTime=(select max(LoginTime) from MSlogin where UserID=' + inttostr(Guarder.UserID) +
      ') and UserID=' + inttostr(Guarder.UserID);
    ExecSql;
  end;
end;

procedure TMainForm.FileExitActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.FileLogonActionExecute(Sender: TObject);
begin
  Guarder.Close;
  Guarder.Open;
  self.Caption :='  '+Trim(Guarder.CompanyUserName)+
      ' 管理系统(ERP)     操作员:'+Guarder.UserName;
end;

procedure TMainForm.MSUserActionExecute(Sender: TObject);
begin
  //用户定义
//  FindShowForm(TMSBrRolesForm, '');
  FindShowForm(TMSBrUserNewForm, '');
end;

procedure TMainForm.NavigatorActionExecute(Sender: TObject);
begin
  //导航
  FindShowForm(TNavigatorForm, '');
end;

procedure TMainForm.btnOutlookBarClick(Sender: TObject);
begin
  VertSplitter.Visible := btnOutlookBar.Down;
  pnlLeft.Visible := btnOutlookBar.Down;
end;

procedure TMainForm.SpeedButton3Click(Sender: TObject);
begin
  btnOutlookBar.Down := false;
  VertSplitter.Visible := btnOutlookBar.Down;
  pnlLeft.Visible := btnOutlookBar.Down;
end;

procedure TMainForm.HelpAboutActionExecute(Sender: TObject);
begin
//关于
  ShowAbout;
end;

procedure TMainForm.SLContractActionExecute(Sender: TObject);
begin
//销售合同
  FindShowForm(TSLBrContractForm, '');
end;

procedure TMainForm.SLSaleActionExecute(Sender: TObject);
begin
  //销售开单
  FindShowForm(TSLBrSaleForm, '');
end;

procedure TMainForm.SLSaleBackActionExecute(Sender: TObject);
begin
  //销售退货
  FindShowForm(TSLBrSaleBForm, '');
end;

procedure TMainForm.SLGoodsOutActionExecute(Sender: TObject);
begin
//销售出库
  FindShowForm(TSLBrGoodsOutForm, '');
end;

procedure TMainForm.SLOrderActionExecute(Sender: TObject);
begin
//销售订单
  FindShowForm(TSLBrOrderForm, '');
end;

procedure TMainForm.SLClearActionExecute(Sender: TObject);
begin
//销售结算
//  FindShowForm(TSLBrClearBillForm, '');   FNBrClearForm: ;
end;

procedure TMainForm.DAClientActionExecute(Sender: TObject);
begin
//客户资料
  findshowform(TDAClientBrowseForm, '');
end;

procedure TMainForm.DAGoodsActionExecute(Sender: TObject);
begin
//商品资料
  findshowform(TDAGoodsBrowseForm, '');
end;

procedure TMainForm.DASTWarehouseExecute(Sender: TObject);
begin
//仓库资料
  findshowform(TDABrWarehouseForm, '');
end;

procedure TMainForm.DASLDiscountExecute(Sender: TObject);
begin
//销售折扣
  FindShowForm(TSLBrDiscountForm, '');
end;

procedure TMainForm.DASLSaleGiftExecute(Sender: TObject);
begin
//商品赠送
  FIndShowForm(TSLBrSaleGiftForm, '');
end;

procedure TMainForm.DAFNClearModeExecute(Sender: TObject);
begin
//结算方式
  FindShowForm(TDABrPOClearForm, '');
end;

procedure TMainForm.DAFNAccountCodeExecute(Sender: TObject);
begin
//会计科目
  TDASubjectForm.ShowMaintenance;
//  FindShowForm(TDABrAccountCodeForm, '');
end;

procedure TMainForm.DAMSCurrencyExecute(Sender: TObject);
begin
  //币种资料
  FindShowForm(TMSBrCurrencyForm, '');
end;

procedure TMainForm.DAFNExpenseExecute(Sender: TObject);
begin
//费用资料
  findshowForm(TDABrExpenseClassForm, '')
end;

procedure TMainForm.DAFNAccountsExecute(Sender: TObject);
begin
//资金帐户
  FindShowForm(TFNBrAccountsForm, '');
end;

procedure TMainForm.MSUnitsActionExecute(Sender: TObject);
begin
//计量单位
  FindShowForm(TMSBrUnitForm, '');
end;

procedure TMainForm.MSCompanyUserActionExecute(Sender: TObject);
begin
  //公司资料
//  FindShowForm(TMSOptionForm, '');
  Application.CreateForm(TMSOptionForm, MSOptionForm);
  MSOptionForm.ShowModal;
  self.Caption :='  '+Trim(Guarder.CompanyUserName)+
      ' 管理系统(ERP)     操作员:'+Guarder.UserName;
end;

procedure TMainForm.MSDepartmentActionExecute(Sender: TObject);
begin
  //部门资料
  FindShowForm(TMSDepartmentBrowseForm, '');
end;

procedure TMainForm.MSEmployeesActionExecute(Sender: TObject);
begin
  //员工资料
  FindShowForm(TMSBrEmployeeForm, '');
end;

procedure TMainForm.MSBrAreasActionExecute(Sender: TObject);
begin
//地区资料
  findshowform(TDAAreasBrowseForm, '');
end;

procedure TMainForm.DAGoodsClassExecute(Sender: TObject);
begin
//商品分类
  FindShowForm(TDAGoodsClassesBrowseForm, '');
end;

procedure TMainForm.MSAttrDictionaryExecute(Sender: TObject);
begin
//属性字典
  FindShowForm(TDAAttributeBrForm, '');
end;

procedure TMainForm.MSPostionClassExecute(Sender: TObject);
begin
//职别工种
  FindShowForm(TMSPostionClassBrowseForm, '');
end;

procedure TMainForm.MSPostionBrowseExecute(Sender: TObject);
begin
//职位管理
  FindShowForm(TMSPostionBrowseForm, '');
end;

procedure TMainForm.MSBillTypeActionExecute(Sender: TObject);
begin
  //单据类型
  DABillTypeDlg;
end;

procedure TMainForm.PCGoodsInActionExecute(Sender: TObject);
begin
//采购入库
  FindShowForm(TPCBrGoodsInForm, '');
end;

procedure TMainForm.STYDGoodsOutExecute(Sender: TObject);
begin
//出库凭单
  FindShowForm(TYDBrGoodsOutForm, '');
end;

procedure TMainForm.STYDGoodsInExecute(Sender: TObject);
begin
//入库凭单
  FindShowForm(TYDBrGoodsInForm, '');
end;

procedure TMainForm.PCClearPCActionExecute(Sender: TObject);
begin
//采购结算
//  FindShowForm(TPCBrClearBillForm, '');
end;

procedure TMainForm.OALinkMenIDCardExecute(Sender: TObject);
begin
//联系人
  FindShowForm(TDALinkMenIDCardBrowseForm, '');
end;

procedure TMainForm.PCContractActionExecute(Sender: TObject);
begin
//采购合同
  FindShowForm(TPCBrContractForm, '');
end;

var
  ReportsDLLHandle: THandle;

procedure TMainForm.ReportsExplorerActionExecute(Sender: TObject);
var
  RunReportExplorer: procedure; stdcall;
  InitLibrary: procedure(App: TApplication); stdcall;
begin
  if ReportsDLLHandle = 0 then
  begin
    ReportsDLLHandle := LoadLibrary('Reports.DLL');
    if ReportsDLLHandle = 0 then
      raise Exception.Create('找不到报表动态连接库 Reports.DLL');
    @InitLibrary := GetProcAddress(ReportsDLLHandle, 'InitLibrary');
    InitLibrary(Application);
  end;
  @RunReportExplorer := GetProcAddress(ReportsDLLHandle, 'RunReportExplorer');
  RunReportExplorer;
end;

procedure TMainForm.OABrJobRecordsActionExecute(Sender: TObject);
begin
//工作日志
  FindShowForm(TOABrJobRecordsForm, '');
end;

procedure TMainForm.OABrJobRecordsMngExecute(Sender: TObject);
begin
//知识管理
  FindShowForm(TOABrJobRecordsMngForm, '');
end;

procedure TMainForm.PCOrderActionExecute(Sender: TObject);
begin
//采购订单
  FindShowForm(TPCBrOrderForm, '');
end;

procedure TMainForm.FNExpenseExecute(Sender: TObject);
begin
//报销申请
  FindShowForm(TFNBrExpenseForm, '');
end;

procedure TMainForm.OABrJobArrangeActionExecute(Sender: TObject);
begin
//工作安排
  FindShowForm(TOABrJobArrangeForm, '');
end;

procedure TMainForm.YDFormulaActionExecute(Sender: TObject);
begin
//物料清单
//  FindShowForm(TYDProductFormulaBrowseForm, '');
  FindShowForm(TYDBrFormulaForm, '');
end;

procedure TMainForm.STGoodsOutInExecute(Sender: TObject);
begin
//库存调拨
  FindShowForm(TSTBrGoodsOutInForm, '');
end;

procedure TMainForm.STStockCountOffExecute(Sender: TObject);
begin
//库存盘点
//  FindShowForm(TSTBrCountOffForm, '');
end;

procedure TMainForm.SLContractPriceExecute(Sender: TObject);
begin
//合同售价
  FindShowForm(TSLBrContractPriceForm,'');
end;

procedure TMainForm.FNCashInExecute(Sender: TObject);
begin
//收款申请
  FindShowForm(TFNBrCashInForm,'');
end;

procedure TMainForm.FNCashOutExecute(Sender: TObject);
begin
//付款申请
  FindShowForm(TFNBrCashOutForm,'');
end;

procedure TMainForm.OAEMailExecute(Sender: TObject);
begin
  ShellExecute(HWND_DESKTOP, 'OPEN', PChar('mailto:?subject= &body='), nil, nil, SW_SHOW);
end;

procedure TMainForm.DAProviderActionExecute(Sender: TObject);
begin
//厂商资料
FindShowForm(TDABrmanufacturerForm,'')
end;

procedure TMainForm.OAClientcRelationExecute(Sender: TObject);
begin
//厂商关系
FindShowForm(TDAClientcRelationBrowseForm,'')
end;

procedure TMainForm.OACompanyNewsExecute(Sender: TObject);
begin
//公司新闻
FindShowForm(TOABrCompanyNewsForm,'')
end;

procedure TMainForm.OAClientkRelationExecute(Sender: TObject);
begin
//客户关系
FindShowForm(TDAClientkRelationBrowseForm,'')
end;

procedure TMainForm.PCPurchaseActionExecute(Sender: TObject);
begin
//采购进货
FindShowForm(TPCBrPurchaseForm,'');
end;

procedure TMainForm.YDpowerActionExecute(Sender: TObject);
begin
//生产能力
FindShowForm(TYDBrPWForm,'');
end;

procedure TMainForm.YDPlanActionExecute(Sender: TObject);
begin
//生产计划
FindShowForm(TYDBrProductPlanForm,'');
end;

procedure TMainForm.YDPrepareActionExecute(Sender: TObject);
begin
//生产方案
FindShowForm(TYDBrBalanceForm,'');
end;

procedure TMainForm.YDForecastPLExecute(Sender: TObject);
begin
//效益测算
FindShowForm(TYDBrExpressBalanceForm,'');
end;

procedure TMainForm.SLGoodsOutBActionExecute(Sender: TObject);
begin
//退货入库
FindShowForm(TSLBrGoodsOutBForm,'');
end;

procedure TMainForm.PCGoodsInBackExecute(Sender: TObject);
begin
//退货出库
FindShowForm(TPCBrGoodsInBForm,'');
end;

procedure TMainForm.PCPurchaseBackExecute(Sender: TObject);
begin
//采购退货
FindShowForm(TPCBrPurchaseBForm,'');
end;

procedure TMainForm.PCPurchsePriceExecute(Sender: TObject);
begin
//商品进价
FindShowForm(TPCBrPurchasePriceForm, '');
end;

procedure TMainForm.SLSaleFruitListActionExecute(Sender: TObject);
begin
//销售排行榜
FindShowForm(TSLSaleFruitListForm,'');
end;

procedure TMainForm.SLSalePriceExecute(Sender: TObject);
begin
//商品售价
FindShowForm(TSLBrSalePriceForm, '');
end;

procedure TMainForm.SLSaleSpecailExecute(Sender: TObject);
begin
//特色销售开单
 FindShowForm(TSLBrSaleSForm,'');
end;

procedure TMainForm.FNClearSLactionExecute(Sender: TObject);
begin
//收款结算
 FindShowForm(TFNBrClearSLForm,'');
end;

procedure TMainForm.FNClearPCActionExecute(Sender: TObject);
begin
//付款结算
 FindShowForm(TFNBrClearPCForm,'');
end;

procedure TMainForm.PCCotractPriceExecute(Sender: TObject);
begin
//合同进价
 FindShowForm(TPCBrContractPriceForm,'');
end;

procedure TMainForm.ReportMenuItemClick(Sender: TObject);
begin
  PrintReport(TMenuItem(Sender).Caption, '', 'Screen');
end;

procedure TMainForm.MyReportMenuItemClick(Sender: TObject);
begin
  PrintReport(TMenuItem(Sender).Caption, '', 'Screen');
end;

procedure TMainForm.RebuildReportMenu;
var
  I: Integer;
  Reports: TStrings;
  FileName: string;
  Item: TMenuItem;
begin
  for I := ReportsMenu.Count - 1 downto 0 do
    if ReportsMenu.Items[I].Tag = 1 then ReportsMenu.Items[I].Free;
  FileName := ChangeFileExt(Application.ExeName, '.cfg');
  Reports := TStringList.Create;
  try
    if FileExists(FileName) then
      Reports.LoadFromFile(FileName);
    for I := 0 to Reports.Count - 1 do
    begin
      Item := TMenuItem.Create(Self);
      Item.Caption := Reports[I];
      Item.Tag := 1;
      Item.OnClick := MyReportMenuItemClick;
      ReportsMenu.Add(Item);
    end;
  finally
    Reports.Free;
  end;
end;

procedure TMainForm.MyReportsCustomizeActionExecute(Sender: TObject);
begin
  with TRpCustomizeForm.Create(Self) do
  try
    if ShowModal = mrOK then RebuildReportMenu;
  finally
    Free;
  end;
end;

procedure TMainForm.StockChangeExecute(Sender: TObject);
begin
//库存变动
 FindShowForm(TSTStockChangeFrom,'');
end;

procedure TMainForm.STActualStockExecute(Sender: TObject);
begin
//库存商品
 FindShowForm(TSTActualStockForm,'');
end;

procedure TMainForm.FNActuialCashExecute(Sender: TObject);
begin
//资金帐本
 FindShowForm(TFNActualCashFrom,'');
end;

procedure TMainForm.FNCashOutInExecute(Sender: TObject);
begin
//资金调动
  FindShowForm(TFNBrCashOutInForm, '');
end;

procedure TMainForm.FNCashFlowExecute(Sender: TObject);
begin
//现金流量
  FindShowForm(TFNCashFlowForm, '');
end;

procedure TMainForm.FNRunExpenseExecute(Sender: TObject);
begin
//费用台账
  FindShowForm(TFNExpenseSttcForm, '');
end;

procedure TMainForm.FNReceiptPayableExecute(Sender: TObject);
begin
//应收应付
  FindShowForm(TFNReceiptPayableFrom, '');
end;

procedure TMainForm.FNReceiptPayableEExecute(Sender: TObject);
begin
//其它应收款
  FindShowForm(TFNReceiptPayableEFrom, '');
end;

procedure TMainForm.FNProfitLossExecute(Sender: TObject);
begin
//营业利润
  FindShowForm(TFNProfitLossForm, '');
end;

procedure TMainForm.FNBalanceSheetExecute(Sender: TObject);
begin
//总帐余额
  FindShowForm(TFNBalanceSheetForm, '');
end;

procedure TMainForm.STGoodsOutCostExecute(Sender: TObject);
begin
//库存结帐
  FindShowForm(TSTBrGoodsOutCostForm, '');
end;

procedure TMainForm.STGoodsCountOffExecute(Sender: TObject);
begin
//盘盈盘亏
  FindShowForm(TSTBrGoodsCountOffForm, '');
end;

procedure TMainForm.MSClearTestDataExecute(Sender: TObject);
begin
//
end;

procedure TMainForm.SRJobsActionExecute(Sender: TObject);
begin
//计件项目
  FindShowForm(TSRBrJobsForm, '');
end;

procedure TMainForm.SRJobsPriceExecute(Sender: TObject);
begin
//计件工价
  FindShowForm(TSRBrJobPriceForm, '');
end;

procedure TMainForm.SRWorkQuantityExecute(Sender: TObject);
begin
// 工作量统计
  FindShowForm(TSRBrWorkQuantityForm, '');
end;

procedure TMainForm.SRBaseSalaryExecute(Sender: TObject);
begin
//工资表核算
  FindShowForm(TSRBrBaseSalaryForm, '');
end;

procedure TMainForm.SRSalaryAnalyzeExecute(Sender: TObject);
begin
//工资分析
  FindShowForm(TSRSalaryAnalyzeForm, '');
end;

procedure TMainForm.PCCreditActionExecute(Sender: TObject);
begin
//采购信用
  FindShowForm(TPCCreditBrowseForm, '');
end;

procedure TMainForm.SLCreditActionExecute(Sender: TObject);
begin
//客户信用
  FindShowForm(TSLCreditBrowseForm, '');
end;

procedure TMainForm.YDBOMBackExecute(Sender: TObject);
begin
//物料还原
  FindShowForm(TYDBOMBackFrom, '');
end;

procedure TMainForm.YDGoodsCostExecute(Sender: TObject);
begin
//生产成本
//
end;

procedure TMainForm.YDStockInWorkExecute(Sender: TObject);
begin
//车间库存
  FindShowForm(TYDStockInWorkFrom, '');
end;

procedure TMainForm.YDPurchasePlanExecute(Sender: TObject);
begin
//采购计划
  FindShowForm(TYDBrPurchasePlanForm, '');
end;

procedure TMainForm.FileSystemIniExecute(Sender: TObject);
var adoTemp,adoTemp1: TADOQuery;
   StrOfDat :string;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp1 := TADOQuery.Create(nil);
  adoTemp1.Connection := CommonData.acnConnection;

  StrOfDat :='.Dmo' ;
  adoTemp.Close;
  adoTemp.sql.Text := 'select ID,RecordState from MSCompanyUser where '
    +' RecordState like '+QuotedStr('%清除演示%') ;
  adoTemp.open;
  if not adoTemp.IsEmpty then
  if MessageDlg('演示数据已经清除过了,是否继续清除？', mtwarning, [mbyes, mbno], 0) = mrno then
   exit
   else StrOfDat :='.Dat';


  adoTemp.close;
  adoTemp.SQL.Text := Format('BACKUP DATABASE [%s] TO DISK = ''%s'' WITH DIFFERENTIAL',
    [CommonData.acnConnection.DefaultDatabase,
    ExtractFilePath(Application.ExeName) + 'Backup\' + CommonData.acnConnection.DefaultDatabase + StrOfDat]);

  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text := 'select ID,OriginTable from MSBillTable order by OriginTable' ;
  adoTemp.open;
  adoTemp.First;
  while not adoTemp.Eof do
  begin
    if not adoTemp.FieldByName('OriginTable').IsNull then
    begin
      adoTemp1.Close;
      adoTemp1.SQL.Text := ' truncate table ' + adoTemp.FieldByName('OriginTable').AsString;
      adoTemp1.ExecSQL;
    end;
    adoTemp.Next;
  end;
  adoTemp.Close;
  adoTemp.sql.Text := 'select ID,RecordState from MSCompanyUser' ;
  adoTemp.open;
  if  adoTemp.IsEmpty then adoTemp.Append;
  adoTemp.Edit;
  adoTemp.FieldByName('RecordState').AsString :='清除演示';
  adoTemp.Post;
  showmessage('演示数据整理完毕,请重新登陆系统！')  ;
  Application.Terminate ;
end;

procedure TMainForm.PCPurchaseFruitActionExecute(Sender: TObject);
begin
//采购排行榜
  FindShowForm(TPCPurchaseFruitListForm, '');

end;

procedure TMainForm.SRWorktimeActionExecute(Sender: TObject);
begin
//工作时段
  FindShowForm(TSRBrWorkTimeForm, '');
end;

procedure TMainForm.SRWorkScheduleActionExecute(Sender: TObject);
begin
//作息时间
  FindShowForm(TSRBrWorkScheduleForm, '');
end;

procedure TMainForm.SRWorkRestActionExecute(Sender: TObject);
begin
//生产排班
  FindShowForm(TSRBrWorkRestForm, '');
end;

procedure TMainForm.SLSaleClientActionExecute(Sender: TObject);
begin
//客户销售
  FindShowForm(TSLBrSaleClientForm, '');
end;

procedure TMainForm.SRWorkTimeCntExecute(Sender: TObject);
begin
//计时统计
  FindShowForm(TSRBrWorkTimeCntForm, '');
end;

procedure TMainForm.SLSaleChainListExecute(Sender: TObject);
begin
//连锁加盟排行榜
  FindShowForm(TSLSaleChainListForm, '');
end;

procedure TMainForm.FileDataBackupExecute(Sender: TObject);
var adoTemp: TADOQuery;
begin
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.close;
  adoTemp.SQL.Text := Format('BACKUP DATABASE [%s] TO DISK = ''%s'' WITH DIFFERENTIAL',
    [CommonData.acnConnection.DefaultDatabase,
    ExtractFilePath(Application.ExeName) + 'Backup\' + CommonData.acnConnection.DefaultDatabase + '.bak']);
  adoTemp.ExecSQL;
//  if  not  adoTemp.IsEmpty then    showmessage('数据备份完毕！');
  showmessage('数据备份完毕！');
end;

procedure TMainForm.SRLeaveReptExecute(Sender: TObject);
begin
//请假调班
//  FindShowForm(TSRBrWorkTimeCntForm, '');
end;

procedure TMainForm.FAAssetAddActionExecute(Sender: TObject);
begin
//资产增加
  FindShowForm(TFABrAssetAddForm, '');
end;

procedure TMainForm.FADepreciationExecute(Sender: TObject);
begin
//资产折旧
  FindShowForm(TFABrDepreciationForm, '');
end;


procedure TMainForm.FAAssetReptExecute(Sender: TObject);
begin
//资产总表
  FindShowForm(TFNAssetReptFrom, '');
end;

procedure TMainForm.FAAssetReduceExecute(Sender: TObject);
begin
//资产处置
  FindShowForm(TFABrAssetReduceForm, '');
end;

procedure TMainForm.FAAssetRepairExecute(Sender: TObject);
begin
//资产维修
  FindShowForm(TFABrAssetRepairForm, '');
end;

procedure TMainForm.FAAssetRePlanExecute(Sender: TObject);
begin
//维修计划
  FindShowForm(TFABrAssetRePlanForm, '');
end;

procedure TMainForm.FAAssetChangeExecute(Sender: TObject);
begin
//资产变动
  FindShowForm(TFAAssetChangeFrom, '');
end;

procedure TMainForm.FAAssetPlanReptExecute(Sender: TObject);
begin
//计划管理
  FindShowForm(TFAAssetPlanReptFrom, '');
end;

procedure TMainForm.YDDailyReportExecute(Sender: TObject);
begin
//生产日报
  FindShowForm(TYDDailyReportForm, '');
end;

procedure TMainForm.YDStatisticReportExecute(Sender: TObject);
begin
//生产统计
  FindShowForm(TYDStatisticReportForm, '');
end;

procedure TMainForm.FNAccountAgeActionExecute(Sender: TObject);
begin
//帐龄分析
  FindShowForm(TFNAccountAgeForm, '');
end;

procedure TMainForm.SLSaleForecastExecute(Sender: TObject);
begin
//销售分析预测
  FindShowForm(TSLSaleForeCastForm, '');
end;

procedure TMainForm.SLSaleStatisticExecute(Sender: TObject);
begin
//销售统计
  FindShowForm(TSLSaleStatisticForm, '');
end;

procedure TMainForm.PCpurchaseStatisticExecute(Sender: TObject);
begin
//采购统计
  FindShowForm(TPCPurchaseStatisticForm, '');
end;

procedure TMainForm.PCPurchaseForecastExecute(Sender: TObject);
begin
//采购分析预测
  FindShowForm(TPCPurchaseForecastForm, '');
end;

procedure TMainForm.FileDataRestoreExecute(Sender: TObject);
begin
  Application.CreateForm(TMSDataRestoreForm, MSDataRestoreForm);
  MSDataRestoreForm.ShowModal;
  MSDataRestoreForm.Free;
end;

procedure TMainForm.FileShowHelpDocExecute(Sender: TObject);
var Url: string;
  I: integer;
  Flags: OLEVariant;
begin
  FindShowForm(TNavigatorForm, '');
  Url := '《企业管理系统(ERP)》产品手册';
  for I := 0 to Screen.FormCount - 1 do
  begin
    if Screen.Forms[I].Caption = '导航' then
    begin
      (Screen.Forms[I] as TNavigatorForm).SetFocus;
      (Screen.Forms[I] as TNavigatorForm).URLs.Text := WideString(ExtractFilePath(Application.ExeName)) + 'Navigation\' + Url + '.htm';
      Flags := 0;
      try
        if Url <> '' then
          (Screen.Forms[I] as TNavigatorForm).WebBrowser.Navigate(WideString((Screen.Forms[I] as TNavigatorForm).Urls.Text), Flags, Flags, Flags, Flags)
        else
          (Screen.Forms[I] as TNavigatorForm).WebBrowser.Navigate(WideString(ExtractFilePath(Application.ExeName)) + 'Navigation\系统管理.htm', Flags, Flags, Flags, Flags);
      except
      end;
    end;
  end;
//  ShellExecute(0, 'open', PChar(GetCurrentDir + '\《企业管理系统(ERP)》产品手册.doc'), '', '', SW_SHOW);
end;

procedure TMainForm.FilePasswordChangeActionExecute(Sender: TObject);
begin
  Application.CreateForm(TMSEdUserPassWordForm, MSEdUserPassWordForm);
  MSEdUserPassWordForm.ShowModal;
  MSEdUserPassWordForm.Free;
end;

procedure TMainForm.DAMaterialClassActionExecute(Sender: TObject);
begin
//材料分类
  FindShowForm(TDAMaterialClassBrowseForm, '');
end;

procedure TMainForm.DAMaterialActionExecute(Sender: TObject);
begin
//材料资料
  FindShowForm(TDAMaterialBrowseForm, '');
end;

procedure TMainForm.DAProjectActionExecute(Sender: TObject);
begin
//项目名称
//  FindShowForm(TDAProjectBrowseForm, '');
  FindShowForm(TDABrProjectForm, '');

end;

procedure TMainForm.EGMaterialInActionExecute(Sender: TObject);
begin
//项目进料单
  FindShowForm(TEGBrMaterialInForm, '');
end;

procedure TMainForm.EGProExpenseActionExecute(Sender: TObject);
begin
//项目费用单
  FindShowForm(TEGBrExpenseForm, '');
end;

procedure TMainForm.EGMaterialOutActionExecute(Sender: TObject);
begin
//项目领料单
  FindShowForm(TEGBrMaterialOutForm, '');
end;

procedure TMainForm.EGMaterialInSTTActionExecute(Sender: TObject);
begin
//项目进料台帐
  FindShowForm(TEGMaterialInStatisticForm, '');
end;

procedure TMainForm.EGMaterialOutSTTActionExecute(Sender: TObject);
begin
//项目用料台帐
  FindShowForm(TEGMaterialOutStatisticForm, '');
end;

procedure TMainForm.FileClearBusDataExecute(Sender: TObject);
var adoTemp,adoTemp1: TADOQuery;
   StrOfDat :string;
begin
  inherited;
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp1 := TADOQuery.Create(nil);
  adoTemp1.Connection := CommonData.acnConnection;
  StrOfDat :='.Bus' ;

  adoTemp.close;
  adoTemp.SQL.Text := Format('BACKUP DATABASE [%s] TO DISK = ''%s'' WITH DIFFERENTIAL',
    [CommonData.acnConnection.DefaultDatabase,
    ExtractFilePath(Application.ExeName) + 'Backup\' + CommonData.acnConnection.DefaultDatabase + StrOfDat]);

  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text := 'select ID,OriginTable from MSBillTable '
    +' where OriginTable like '+Quotedstr('%Master')
    +' Or OriginTable like '+Quotedstr('%Detail')
    +' order by OriginTable' ;
  adoTemp.open;


  adoTemp.First;
  while not adoTemp.Eof do
  begin
    if not adoTemp.FieldByName('OriginTable').IsNull then
    begin
      adoTemp1.Close;
      adoTemp1.SQL.Text := ' truncate table ' + adoTemp.FieldByName('OriginTable').AsString;
      adoTemp1.ExecSQL;
    end;
    adoTemp.Next;
  end;
  showmessage('业务数据清理完毕！')  ;
end;

procedure TMainForm.EGMaterialBalanceExecute(Sender: TObject);
begin
//项目材料库存
  FindShowForm(TEGMaterialBalanceForm, '');
end;

procedure TMainForm.EGMaterialChangeActExecute(Sender: TObject);
begin
//项目材料变动
  FindShowForm(TEGMaterialChangeForm, '');
end;

procedure TMainForm.EGProjectExpenseActionExecute(Sender: TObject);
begin
//项目费用台帐
//  FindShowForm(TEGExpenseStatisticForm, '');
  FindShowForm(TEGExpenseStatisticEgmForm, ''); 
end;


procedure TMainForm.EGProjectCostActionExecute(Sender: TObject);
begin
  //项目成本总帐
  FindShowForm(TEGProjectCostSTTForm, '');
end;

procedure TMainForm.DAProjectClassActExecute(Sender: TObject);
begin
  //项目分类
  FindShowForm(TDAProjectClassBrowseForm, '');

end;

procedure TMainForm.FNCredenceActionExecute(Sender: TObject);
begin
  // 记帐凭证
  FindShowForm(TFNCredenceBrowseForm, '');
end;

end.

