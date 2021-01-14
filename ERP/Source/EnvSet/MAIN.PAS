unit MAIN;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, Menus, Navigator,
  StdCtrls, Dialogs, Buttons, Messages, ExtCtrls, ComCtrls, StdActns,shellapi,
  ActnList, ToolWin, ImgList, OutlookBar, DB, ADODB, Types;

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
    FNClearSLAction: TAction;
    SLGoodsOutAct: TAction;
    PCContractAction: TAction;
    PCOrderAction: TAction;
    PCGoodsInAction: TAction;
    PCPurchaseForecast: TAction;
    STHouseOutOutAction: TAction;
    STGoodsOutIn: TAction;
    FNCashIn: TAction;
    FNBalanceSheet: TAction;
    FNCashOutIn: TAction;
    FNAccountAgeAct: TAction;
    FNCashOut: TAction;
    YDPlanAction: TAction;
    YDPrepareAction: TAction;
    YDPurchasePlan: TAction;
    YDpowerAction: TAction;
    YDProductNotes: TAction;
    YDGoodsOutACT: TAction;
    YDBOMBackAction: TAction;
    YDGoodsCostAct: TAction;
    YDForecastPLAct: TAction;
    YDStockInWorkAct: TAction;
    FileLogonAction: TAction;
    FileExitAction: TAction;
    FileSetPrintAction: TAction;
    SRJobsAction: TAction;
    OAAction98: TAction;
    Action200: TAction;
    F11: TMenuItem;
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
    D71: TMenuItem;
    G11: TMenuItem;
    G31: TMenuItem;
    G51: TMenuItem;
    G81: TMenuItem;
    G101: TMenuItem;
    H11: TMenuItem;
    H21: TMenuItem;
    H31: TMenuItem;
    H41: TMenuItem;
    H61: TMenuItem;
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
    FNProfitLossAct: TAction;
    FNCredenceFilesAct: TAction;
    FNSubCodeDetailAct: TAction;
    FNSubCodeTotalAct: TAction;
    FNReceiptPayable: TAction;
    FNRunExpense: TAction;
    PCPurchaseAction: TAction;
    PCCreditAction: TAction;
    FAAssetAddAction: TAction;
    FADepreciation: TAction;
    PCPurchaseFruitAction: TAction;
    PCpurchaseStatistic: TAction;
    STPCGoodsInCostAct: TAction;
    STYDGoodsIn: TAction;
    STStockStatisticsAct: TAction;
    STYDGoodsOut: TAction;
    STGoodsCountOff: TAction;
    STStockChange: TAction;
    SLCreditAction: TAction;
    SLSaleChainList: TAction;
    SLSaleClientAction: TAction;
    SLSaleForecast: TAction;
    YDDealProductMngr: TAction;
    YDDailyReportAct: TAction;
    YDStatisticReport: TAction;
    YDGoodsInAction: TAction;
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
    G121: TMenuItem;
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
    PCPurchsePrice: TAction;
    SLSaleFruitListAct: TAction;
    SLSalePrice: TAction;
    PCCotractPrice: TAction;
    N86: TMenuItem;
    MyReportsCustomizeAction: TAction;
    C1: TMenuItem;
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
    N14: TMenuItem;
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
    EGProjectProgress: TAction;
    N66: TMenuItem;
    EGconsignOutAction: TAction;
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
    PCDealPurchaseAct: TAction;
    N111: TMenuItem;
    N112: TMenuItem;
    N63: TMenuItem;
    N113: TMenuItem;
    N115: TMenuItem;
    N116: TMenuItem;
    EGMaterialOutAction: TAction;
    EGFNClearEGAction: TAction;
    EGProjectCostSttAct: TAction;
    N119: TMenuItem;
    N120: TMenuItem;
    N124: TMenuItem;
    FileClearBusData: TAction;
    N73: TMenuItem;
    N127: TMenuItem;
    N128: TMenuItem;
    N68: TMenuItem;
    DAProjectClassAct: TAction;
    N6: TMenuItem;
    FNCredenceAction: TAction;
    N70: TMenuItem;
    PayableAccountAct: TAction;
    N132: TMenuItem;
    N15: TMenuItem;
    N78: TMenuItem;
    N131: TMenuItem;
    N133: TMenuItem;
    FNClearPCAction: TAction;
    FNReportsAction: TAction;
    FNSubjectCollectAction: TAction;
    FNSubjectDetailsCollectAction: TAction;
    FNCustomizeReportAction: TAction;
    C2: TMenuItem;
    FNSubjectDetailsReportAction: TAction;
    D2: TMenuItem;
    STYDGoodsOutCostAct: TAction;
    STYDGoodsInCostAct: TAction;
    N134: TMenuItem;
    N135: TMenuItem;
    STYDGoodsPrcCostAct: TAction;
    STSLGoodsOutCostAct: TAction;
    FileBusDataRar: TAction;
    N79: TMenuItem;
    N136: TMenuItem;
    STNewStockRepAct: TAction;
    N137: TMenuItem;
    N138: TMenuItem;
    N9: TMenuItem;
    N71: TMenuItem;
    N75: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    N76: TMenuItem;
    FashionSaleAction: TAction;
    FashionPurchaseAtc: TAction;
    FashionRemoveAct: TAction;
    FashionCountOffAct: TAction;
    FashionPOSAction: TAction;
    FashionStockAct: TAction;
    FashionChangeAct: TAction;
    FashionSaleSttAct: TAction;
    FashionACAgeAct: TAction;
    FashionSaleForecast: TAction;
    N67: TMenuItem;
    N121: TMenuItem;
    N122: TMenuItem;
    N130: TMenuItem;
    FashionPurchaseSttAct: TAction;
    N141: TMenuItem;
    N142: TMenuItem;
    N143: TMenuItem;
    N144: TMenuItem;
    N145: TMenuItem;
    N146: TMenuItem;
    N147: TMenuItem;
    FashionDataAreaConAct: TAction;
    FashionDataPOSConAct: TAction;
    N125: TMenuItem;
    FileBaseDataFDS: TAction;
    FileBaseDataCloth: TAction;
    FileBaseDataFashion: TAction;
    FileBaseDataEG: TAction;
    FileBaseDataDecorate: TAction;
    N129: TMenuItem;
    N140: TMenuItem;
    N148: TMenuItem;
    N149: TMenuItem;
    N150: TMenuItem;
    N151: TMenuItem;
    FileBaseDataMetals: TAction;
    FileBaseDataElectron: TAction;
    FileBaseDataElectric: TAction;
    N152: TMenuItem;
    N153: TMenuItem;
    N154: TMenuItem;
    EGProjectPlanAction: TAction;
    N155: TMenuItem;
    SRJanitorDataConAct: TAction;
    SRJanitorDataAction: TAction;
    N81: TMenuItem;
    N85: TMenuItem;
    FileBaseDataChemical: TAction;
    N103: TMenuItem;
    SLSaleDsctAction: TAction;
    N114: TMenuItem;
    FNCashExchangeAct: TAction;
    N117: TMenuItem;
    FNCashExchSttAct: TAction;
    N118: TMenuItem;
    EGFNClearEGOutAct: TAction;
    EGConsignOutSttAct: TAction;
    N123: TMenuItem;
    N126: TMenuItem;
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
    procedure SLGoodsOutActExecute(Sender: TObject);
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
    procedure YDForecastPLActExecute(Sender: TObject);
    procedure SLGoodsOutBActionExecute(Sender: TObject);
    procedure PCGoodsInBackExecute(Sender: TObject);
    procedure PCPurchaseBackExecute(Sender: TObject);
    procedure PCPurchsePriceExecute(Sender: TObject);
    procedure SLSaleFruitListActExecute(Sender: TObject);
    procedure SLSalePriceExecute(Sender: TObject);
    procedure SLSaleSpecailExecute(Sender: TObject);
    procedure FNClearSLactionExecute(Sender: TObject);
    procedure FNClearPCActionExecute(Sender: TObject);
    procedure PCCotractPriceExecute(Sender: TObject);
    procedure ReportMenuItemClick(Sender: TObject);
    procedure MyReportsCustomizeActionExecute(Sender: TObject);
    procedure STStockChangeExecute(Sender: TObject);
    procedure STStockStatisticsActExecute(Sender: TObject);
    procedure FNActuialCashExecute(Sender: TObject);
    procedure FNCashOutInExecute(Sender: TObject);
    procedure FNCashFlowExecute(Sender: TObject);
    procedure FNRunExpenseExecute(Sender: TObject);
    procedure FNReceiptPayableExecute(Sender: TObject);
    procedure FNReceiptPayableEExecute(Sender: TObject);
    procedure FNProfitLossActExecute(Sender: TObject);
    procedure FNBalanceSheetExecute(Sender: TObject);
    procedure STPCGoodsInCostActExecute(Sender: TObject);
    procedure STGoodsCountOffExecute(Sender: TObject);
    procedure MSClearTestDataExecute(Sender: TObject);
    procedure SRJobsActionExecute(Sender: TObject);
    procedure SRJobsPriceExecute(Sender: TObject);
    procedure SRWorkQuantityExecute(Sender: TObject);
    procedure SRSalaryAnalyzeExecute(Sender: TObject);
    procedure PCCreditActionExecute(Sender: TObject);
    procedure SLCreditActionExecute(Sender: TObject);
    procedure YDBOMBackActionExecute(Sender: TObject);
    procedure YDGoodsCostExecute(Sender: TObject);
    procedure SRBaseSalaryExecute(Sender: TObject);
    procedure YDStockInWorkActExecute(Sender: TObject);
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
    procedure YDDailyReportActExecute(Sender: TObject);
    procedure YDStatisticReportExecute(Sender: TObject);
    procedure FNAccountAgeActExecute(Sender: TObject);
    procedure SLSaleForecastExecute(Sender: TObject);
    procedure SLSaleStatisticExecute(Sender: TObject);
    procedure PCpurchaseStatisticExecute(Sender: TObject);
    procedure PCPurchaseForecastExecute(Sender: TObject);
    procedure FileDataRestoreExecute(Sender: TObject);
    procedure FileShowHelpDocExecute(Sender: TObject);
    procedure FilePasswordChangeActionExecute(Sender: TObject);
    procedure DAProjectActionExecute(Sender: TObject);
    procedure EGMaterialOutActionExecute(Sender: TObject);
    procedure FileClearBusDataExecute(Sender: TObject);
    procedure EGFNClearEGActionExecute(Sender: TObject);
    procedure EGProjectCostSttActExecute(Sender: TObject);
    procedure DAProjectClassActExecute(Sender: TObject);
    procedure FNCredenceActionExecute(Sender: TObject);
    procedure PayableAccountActExecute(Sender: TObject);
    procedure FNSubjectDetailsCollectActionExecute(Sender: TObject);
    procedure FNCustomizeReportActionExecute(Sender: TObject);
    procedure FNSubjectCollectActionExecute(Sender: TObject);
    procedure FNSubjectDetailsReportActionExecute(Sender: TObject);
    procedure STYDGoodsOutCostActExecute(Sender: TObject);
    procedure STYDGoodsInCostActExecute(Sender: TObject);
    procedure STSLGoodsOutCostActExecute(Sender: TObject);
    procedure STNewStockRepActExecute(Sender: TObject);
    procedure FashionSaleActionExecute(Sender: TObject);
    procedure FashionPurchaseAtcExecute(Sender: TObject);
    procedure FashionRemoveActExecute(Sender: TObject);
    procedure FashionCountOffActExecute(Sender: TObject);
    procedure FashionSaleSttActExecute(Sender: TObject);
    procedure FashionPurchaseSttActExecute(Sender: TObject);
    procedure FashionStockActExecute(Sender: TObject);
    procedure FileBaseDataFDSExecute(Sender: TObject);
    procedure FileBaseDataClothExecute(Sender: TObject);
    procedure FileBaseDataEGExecute(Sender: TObject);
    procedure SLSaleDsctActionExecute(Sender: TObject);
    procedure FNCashExchangeActExecute(Sender: TObject);
    procedure FNCashExchSttActExecute(Sender: TObject);
  private
    { Private declarations }
    FOutlookBar: TOutlookBar;

    procedure SetOutlookBarPage;
    procedure OutlookBarItemClick(Sender: TObject; AItem: TOutlookBarItem);
    procedure OutlookBarPageChange(Sender: TObject);
    procedure OutlookBarMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure DoEnterAsTab(var Msg: TMsg; var Handled: Boolean);
    procedure MyReportMenuItemClick(Sender: TObject);
    procedure RebuildReportMenu;
    procedure RegisterActions;
  public
    { Public declarations }
    procedure DisableMenuItems(Item: TMenuItem);
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

  DABrClientkRelation, DABrClientcRelation,
  SLBrCredit, DABillType, PCBrCredit,
  MSPermissions, MSPeriod,
  MSBrPostionClass, MSBrRoles, DABrLinkMenIDCard,
  PCBrContract, SLBrContract, OABrJobRecords, OABrJobRecordsMng,
  OABrJobArrange, SLBrSaleGift, FNBrExpense,
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
  SLBrSale, STBrGoodsCountOff,  SRBrJobPrice,
  SRBrWorkQuantity, SRBrBaseSalary, YDBrFormula, YDBrPurchasePlan,
  YDBOMBack, YDStockInWork, SLSaleFruitList, PCPurchaseFruitList,
  SRBrWorkTime, SRBrWorkSchedule, SREdWorkRest, SRBrWorkRest,
  SLBrSaleClient, SRBrWorkTimeCnt, SLSaleChainList, SRSalaryAnalyze,
  FABrAssetAdd, FABrDepreciation, FNAssetRept, MSBrEmployee,
  FABrAssetReduce, FABrAssetRepair, FABrAssetRePlan, FAAssetChange,
  FAAssetPlanRept, YDDailyReport, YDStatisticReport, MSBrUserNew, SRBrJobs,
  SLSaleForeCast, SLSaleStatistic, PCPurchaseStatistic,
  PCPurchaseForeCast ,MSDataRestore, MSEdUserPassWord,
  DAProjectBrowse, EGExpenseStatistic,
  DABrWarehouse, DABrProject, DABrProjectClass,
  DASubject, FNBrCredence,
  FNExpenseSttc, FNAccountAgePC, FNAccountAgeSL, FNRptSubjectCollect,
  FNRptSubjectDetailCollect, FNRptCustomize, FNRptSubjectDetails,
  STBrPCGoodsInCost, FNBrVouchTran, STActualStock, STNewStockRep,
  STBrSLGoodsOutCost, STBrYDGoodsInCost, EGBrGoodsOut, FNBrClearEG,
  EGProjectStatistic, SLBrSaleCloth, PCBrPurchaseCloth, STBrClothOutIn,
  STBRClothCountOff, SLSaleClothStatistic, PCPurchaseClothStatistic,
  STClothStockRep, STBrYDGoodsOutCost, SLBrSaleDsct, FNBrCashExchange,
  FNCashExchStatistic;

procedure TMainForm.DoEnterAsTab(var Msg: TMsg; var Handled: Boolean);
begin
  if Msg.Message = WM_KEYDOWN then
  begin
    if Msg.wParam = VK_RETURN then
      Keybd_event(VK_TAB, 0, 0, 0);
  end;
end;



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
      if ActionList[I].Tag and 1 = 1 then
      begin
        Page := FindPage(ActionList[I].Category);
        if Page = nil then
        begin
          Page := Pages.Add;
          Page.Caption := ActionList[I].Category;
           Page.IconStyle := isSmall;
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
    TBasicAction(AItem.Data).Execute

end;


procedure TMainForm.FormCreate(Sender: TObject);
begin
  RegisterActions;

  SetOutlookBarPage;
  Application.OnMessage := DoEnterAsTab;
  RebuildReportMenu;
end;

procedure TMainForm.MSPeriodActionExecute(Sender: TObject);
begin

  PeriodDlg;
end;

procedure TMainForm.MSPermissionsActionExecute(Sender: TObject);
begin
  ManagePermissionsDlg;
end;

procedure TMainForm.MSloginActionExecute(Sender: TObject);
begin
  FindShowForm(TMSBrLoginForm, '');
end;

procedure TMainForm.FormShow(Sender: TObject);
var year,month,day :word;
    Datestr :string;
begin

{$IFDEF NICE}
  Caption :='  '+Trim(Guarder.CompanyUserName)+
      ' 操作员:'+Guarder.UserName;
{$ELSE}
  Caption := '企业智能管理系统(ERP)';
{$ENDIF}
  with FindShowForm(TNavigatorForm, '') do
  begin
    Top := 0;
    Left := 0;
    Width := 640;
    Height := 480;
  end;
  if pos('',GetCompanyName)<=0 then
  begin
    showmessage(' 产品没有授权,请与供应商联系!'+
    #13+#13+'     专家：');
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
  self.Caption :=' '+Trim(Guarder.CompanyUserName)+
      '  操作员:'+Guarder.UserName;
  MainForm.DisableMenuItems(MainForm.MainMenu.Items);
end;

procedure TMainForm.MSUserActionExecute(Sender: TObject);
begin

  FindShowForm(TMSBrUserNewForm, '');
end;

procedure TMainForm.NavigatorActionExecute(Sender: TObject);
begin
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

  ShowAbout;
end;

procedure TMainForm.SLContractActionExecute(Sender: TObject);
begin
  FindShowForm(TSLBrContractForm, '');
end;

procedure TMainForm.SLSaleActionExecute(Sender: TObject);
begin
  FindShowForm(TSLBrSaleForm, '');
end;

procedure TMainForm.SLSaleBackActionExecute(Sender: TObject);
begin
 FindShowForm(TSLBrSaleBForm, '');
end;

procedure TMainForm.SLGoodsOutActExecute(Sender: TObject);
begin

  FindShowForm(TSLBrGoodsOutForm, '');
end;

procedure TMainForm.SLOrderActionExecute(Sender: TObject);
begin
  FindShowForm(TSLBrOrderForm, '');
end;

procedure TMainForm.SLClearActionExecute(Sender: TObject);
begin

//  FindShowForm(TSLBrClearBillForm, '');   FNBrClearForm: ;
end;

procedure TMainForm.DAClientActionExecute(Sender: TObject);
begin
  findshowform(TDAClientBrowseForm, '');
end;

procedure TMainForm.DAGoodsActionExecute(Sender: TObject);
begin
  findshowform(TDAGoodsBrowseForm, '');
end;

procedure TMainForm.DASTWarehouseExecute(Sender: TObject);
begin
  findshowform(TDABrWarehouseForm, '');
end;

procedure TMainForm.DASLDiscountExecute(Sender: TObject);
begin
  FindShowForm(TSLBrDiscountForm, '');
end;

procedure TMainForm.DASLSaleGiftExecute(Sender: TObject);
begin
  FIndShowForm(TSLBrSaleGiftForm, '');
end;

procedure TMainForm.DAFNClearModeExecute(Sender: TObject);
begin
  FindShowForm(TDABrPOClearForm, '');
end;

procedure TMainForm.DAFNAccountCodeExecute(Sender: TObject);
begin
  TDASubjectForm.ShowMaintenance;
end;

procedure TMainForm.DAMSCurrencyExecute(Sender: TObject);
begin
  FindShowForm(TMSBrCurrencyForm, '');
end;

procedure TMainForm.DAFNExpenseExecute(Sender: TObject);
begin
  findshowForm(TDABrExpenseClassForm, '')
end;

procedure TMainForm.DAFNAccountsExecute(Sender: TObject);
begin
  FindShowForm(TFNBrAccountsForm, '');
end;

procedure TMainForm.MSUnitsActionExecute(Sender: TObject);
begin
  FindShowForm(TMSBrUnitForm, '');
end;

procedure TMainForm.MSCompanyUserActionExecute(Sender: TObject);
begin
  Application.CreateForm(TMSOptionForm, MSOptionForm);
  MSOptionForm.ShowModal;
  self.Caption :=''+Trim(Guarder.CompanyUserName)+
      '操作员:'+Guarder.UserName;
end;

procedure TMainForm.MSDepartmentActionExecute(Sender: TObject);
begin
  FindShowForm(TMSDepartmentBrowseForm, '');
end;

procedure TMainForm.MSEmployeesActionExecute(Sender: TObject);
begin
  FindShowForm(TMSBrEmployeeForm, '');
end;

procedure TMainForm.MSBrAreasActionExecute(Sender: TObject);
begin
  findshowform(TDAAreasBrowseForm, '');
end;

procedure TMainForm.DAGoodsClassExecute(Sender: TObject);
begin
  FindShowForm(TDAGoodsClassesBrowseForm, '');
end;

procedure TMainForm.MSAttrDictionaryExecute(Sender: TObject);
begin
  FindShowForm(TDAAttributeBrForm, '');
end;

procedure TMainForm.MSPostionClassExecute(Sender: TObject);
begin
  FindShowForm(TMSPostionClassBrowseForm, '');
end;

procedure TMainForm.MSPostionBrowseExecute(Sender: TObject);
begin
  FindShowForm(TMSPostionBrowseForm, '');
end;

procedure TMainForm.MSBillTypeActionExecute(Sender: TObject);
begin
  DABillTypeDlg;
end;

procedure TMainForm.PCGoodsInActionExecute(Sender: TObject);
begin
  FindShowForm(TPCBrGoodsInForm, '');
end;

procedure TMainForm.STYDGoodsOutExecute(Sender: TObject);
begin
  FindShowForm(TYDBrGoodsOutForm, '');
end;

procedure TMainForm.STYDGoodsInExecute(Sender: TObject);
begin
  FindShowForm(TYDBrGoodsInForm, '');
end;

procedure TMainForm.OALinkMenIDCardExecute(Sender: TObject);
begin
  FindShowForm(TDALinkMenIDCardBrowseForm, '');
end;

procedure TMainForm.PCContractActionExecute(Sender: TObject);
begin
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
  FindShowForm(TOABrJobRecordsForm, '');
end;

procedure TMainForm.OABrJobRecordsMngExecute(Sender: TObject);
begin
  FindShowForm(TOABrJobRecordsMngForm, '');
end;

procedure TMainForm.PCOrderActionExecute(Sender: TObject);
begin
  FindShowForm(TPCBrOrderForm, '');
end;

procedure TMainForm.FNExpenseExecute(Sender: TObject);
begin
  FindShowForm(TFNBrExpenseForm, '');
end;

procedure TMainForm.OABrJobArrangeActionExecute(Sender: TObject);
begin
  FindShowForm(TOABrJobArrangeForm, '');
end;

procedure TMainForm.YDFormulaActionExecute(Sender: TObject);
begin
  FindShowForm(TYDBrFormulaForm, '');
end;

procedure TMainForm.STGoodsOutInExecute(Sender: TObject);
begin
  FindShowForm(TSTBrGoodsOutInForm, '');
end;

procedure TMainForm.SLContractPriceExecute(Sender: TObject);
begin
  FindShowForm(TSLBrContractPriceForm,'');
end;

procedure TMainForm.FNCashInExecute(Sender: TObject);
begin
  FindShowForm(TFNBrCashInForm,'');
end;

procedure TMainForm.FNCashOutExecute(Sender: TObject);
begin
  FindShowForm(TFNBrCashOutForm,'');
end;

procedure TMainForm.OAEMailExecute(Sender: TObject);
begin
  ShellExecute(HWND_DESKTOP, 'OPEN', PChar('mailto:?subject= &body='), nil, nil, SW_SHOW);
end;

procedure TMainForm.DAProviderActionExecute(Sender: TObject);
begin
FindShowForm(TDABrmanufacturerForm,'')
end;

procedure TMainForm.OAClientcRelationExecute(Sender: TObject);
begin
FindShowForm(TDAClientcRelationBrowseForm,'')
end;

procedure TMainForm.OACompanyNewsExecute(Sender: TObject);
begin
FindShowForm(TOABrCompanyNewsForm,'')
end;

procedure TMainForm.OAClientkRelationExecute(Sender: TObject);
begin
FindShowForm(TDAClientkRelationBrowseForm,'')
end;

procedure TMainForm.PCPurchaseActionExecute(Sender: TObject);
begin
FindShowForm(TPCBrPurchaseForm,'');
end;

procedure TMainForm.YDpowerActionExecute(Sender: TObject);
begin
FindShowForm(TYDBrPWForm,'');
end;

procedure TMainForm.YDPlanActionExecute(Sender: TObject);
begin
FindShowForm(TYDBrProductPlanForm,'');
end;

procedure TMainForm.YDPrepareActionExecute(Sender: TObject);
begin
FindShowForm(TYDBrBalanceForm,'');
end;

procedure TMainForm.YDForecastPLActExecute(Sender: TObject);
begin
FindShowForm(TYDBrExpressBalanceForm,'');
end;

procedure TMainForm.SLGoodsOutBActionExecute(Sender: TObject);
begin
FindShowForm(TSLBrGoodsOutBForm,'');
end;

procedure TMainForm.PCGoodsInBackExecute(Sender: TObject);
begin
FindShowForm(TPCBrGoodsInBForm,'');
end;

procedure TMainForm.PCPurchaseBackExecute(Sender: TObject);
begin
FindShowForm(TPCBrPurchaseBForm,'');
end;

procedure TMainForm.PCPurchsePriceExecute(Sender: TObject);
begin
FindShowForm(TPCBrPurchasePriceForm, '');
end;

procedure TMainForm.SLSaleFruitListActExecute(Sender: TObject);
begin
FindShowForm(TSLSaleFruitListForm,'');
end;

procedure TMainForm.SLSalePriceExecute(Sender: TObject);
begin
FindShowForm(TSLBrSalePriceForm, '');
end;

procedure TMainForm.SLSaleSpecailExecute(Sender: TObject);
begin
 FindShowForm(TSLBrSaleSForm,'');
end;

procedure TMainForm.FNClearSLactionExecute(Sender: TObject);
begin
 FindShowForm(TFNBrClearSLForm,'');
end;

procedure TMainForm.FNClearPCActionExecute(Sender: TObject);
begin
 FindShowForm(TFNBrClearPCForm,'');
end;

procedure TMainForm.PCCotractPriceExecute(Sender: TObject);
begin
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

procedure TMainForm.STStockStatisticsActExecute(Sender: TObject);
begin
 FindShowForm(TSTActualStockForm,'');
end;

procedure TMainForm.STStockChangeExecute(Sender: TObject);
begin
 FindShowForm(TSTStockChangeFrom,'');
end;

procedure TMainForm.STNewStockRepActExecute(Sender: TObject);
begin
  FindShowForm(TSTNewStockRepForm, '');
end;

procedure TMainForm.FNActuialCashExecute(Sender: TObject);
begin
 FindShowForm(TFNActualCashFrom,'');
end;

procedure TMainForm.FNCashOutInExecute(Sender: TObject);
begin
  FindShowForm(TFNBrCashOutInForm, '');
end;

procedure TMainForm.FNCashFlowExecute(Sender: TObject);
begin
  FindShowForm(TFNCashFlowForm, '');
end;

procedure TMainForm.FNRunExpenseExecute(Sender: TObject);
begin
  FindShowForm(TFNExpenseSttcForm, '');
end;

procedure TMainForm.FNReceiptPayableExecute(Sender: TObject);
begin

  FindShowForm(TFNReceiptPayableFrom, '');
end;

procedure TMainForm.FNReceiptPayableEExecute(Sender: TObject);
begin

  FindShowForm(TFNReceiptPayableEFrom, '');
end;

procedure TMainForm.FNProfitLossActExecute(Sender: TObject);
begin

  FindShowForm(TFNProfitLossForm, '');
end;

procedure TMainForm.FNBalanceSheetExecute(Sender: TObject);
begin

  FindShowForm(TFNBalanceSheetForm, '');
end;


procedure TMainForm.STGoodsCountOffExecute(Sender: TObject);
begin

  FindShowForm(TSTBrGoodsCountOffForm, '');
end;

procedure TMainForm.MSClearTestDataExecute(Sender: TObject);
begin
//
end;

procedure TMainForm.SRJobsActionExecute(Sender: TObject);
begin
  FindShowForm(TSRBrJobsForm, '');
end;

procedure TMainForm.SRJobsPriceExecute(Sender: TObject);
begin
  FindShowForm(TSRBrJobPriceForm, '');
end;

procedure TMainForm.SRWorkQuantityExecute(Sender: TObject);
begin
  FindShowForm(TSRBrWorkQuantityForm, '');
end;

procedure TMainForm.SRBaseSalaryExecute(Sender: TObject);
begin
  FindShowForm(TSRBrBaseSalaryForm, '');
end;

procedure TMainForm.SRSalaryAnalyzeExecute(Sender: TObject);
begin
  FindShowForm(TSRSalaryAnalyzeForm, '');
end;

procedure TMainForm.PCCreditActionExecute(Sender: TObject);
begin
  FindShowForm(TPCCreditBrowseForm, '');
end;

procedure TMainForm.SLCreditActionExecute(Sender: TObject);
begin
  FindShowForm(TSLCreditBrowseForm, '');
end;

procedure TMainForm.YDBOMBackActionExecute(Sender: TObject);
begin
  FindShowForm(TYDBOMBackFrom, '');
end;

procedure TMainForm.YDGoodsCostExecute(Sender: TObject);
begin

//
end;

procedure TMainForm.YDStockInWorkActExecute(Sender: TObject);
begin
  FindShowForm(TYDStockInWorkFrom, '');
end;

procedure TMainForm.YDPurchasePlanExecute(Sender: TObject);
begin
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
  adoTemp.SQL.Text := Format('BACKUP DATABASE [%s] TO DISK = ''%s'' ',
    [CommonData.acnConnection.DefaultDatabase,
    ExtractFilePath(Application.ExeName) + 'Backup\' + CommonData.acnConnection.DefaultDatabase
    +  FormatDateTime('yymmdd-hhnnss', Now) + StrOfDat]);

  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text := 'select ID,OriginTable from MSBillTable '
    +' where OriginID>=1  order by OriginTable' ;
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
  FindShowForm(TPCPurchaseFruitListForm, '');

end;

procedure TMainForm.SRWorktimeActionExecute(Sender: TObject);
begin
  FindShowForm(TSRBrWorkTimeForm, '');
end;

procedure TMainForm.SRWorkScheduleActionExecute(Sender: TObject);
begin
  FindShowForm(TSRBrWorkScheduleForm, '');
end;

procedure TMainForm.SRWorkRestActionExecute(Sender: TObject);
begin
  FindShowForm(TSRBrWorkRestForm, '');
end;

procedure TMainForm.SLSaleClientActionExecute(Sender: TObject);
begin
  FindShowForm(TSLBrSaleClientForm, '');
end;

procedure TMainForm.SRWorkTimeCntExecute(Sender: TObject);
begin
  FindShowForm(TSRBrWorkTimeCntForm, '');
end;

procedure TMainForm.SLSaleChainListExecute(Sender: TObject);
begin
  FindShowForm(TSLSaleChainListForm, '');
end;

procedure TMainForm.FileDataBackupExecute(Sender: TObject);
var adoTemp: TADOQuery;
begin
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.close;
  adoTemp.SQL.Text := Format('BACKUP DATABASE [%s] TO DISK = ''%s''',
    [CommonData.acnConnection.DefaultDatabase,
    ExtractFilePath(Application.ExeName) + 'Backup\' +
    CommonData.acnConnection.DefaultDatabase +
    FormatDateTime('yymmdd-hhnnss', Now) + '.bak']);
  adoTemp.ExecSQL;
  showmessage('数据备份完毕！');
end;

procedure TMainForm.SRLeaveReptExecute(Sender: TObject);
begin
//  FindShowForm(TSRBrWorkTimeCntForm, '');
end;

procedure TMainForm.FAAssetAddActionExecute(Sender: TObject);
begin
  FindShowForm(TFABrAssetAddForm, '');
end;

procedure TMainForm.FADepreciationExecute(Sender: TObject);
begin
  FindShowForm(TFABrDepreciationForm, '');
end;


procedure TMainForm.FAAssetReptExecute(Sender: TObject);
begin
  FindShowForm(TFNAssetReptFrom, '');
end;

procedure TMainForm.FAAssetReduceExecute(Sender: TObject);
begin
  FindShowForm(TFABrAssetReduceForm, '');
end;

procedure TMainForm.FAAssetRepairExecute(Sender: TObject);
begin
  FindShowForm(TFABrAssetRepairForm, '');
end;

procedure TMainForm.FAAssetRePlanExecute(Sender: TObject);
begin
  FindShowForm(TFABrAssetRePlanForm, '');
end;

procedure TMainForm.FAAssetChangeExecute(Sender: TObject);
begin
  FindShowForm(TFAAssetChangeFrom, '');
end;

procedure TMainForm.FAAssetPlanReptExecute(Sender: TObject);
begin
  FindShowForm(TFAAssetPlanReptFrom, '');
end;

procedure TMainForm.YDDailyReportActExecute(Sender: TObject);
begin
  FindShowForm(TYDDailyReportForm, '');
end;

procedure TMainForm.YDStatisticReportExecute(Sender: TObject);
begin
  FindShowForm(TYDStatisticReportForm, '');
end;

procedure TMainForm.FNAccountAgeActExecute(Sender: TObject);
begin
  FindShowForm(TFNAccountAgeSLForm, '');
end;

procedure TMainForm.SLSaleForecastExecute(Sender: TObject);
begin
  FindShowForm(TSLSaleForeCastForm, '');
end;

procedure TMainForm.SLSaleStatisticExecute(Sender: TObject);
begin
  FindShowForm(TSLSaleStatisticForm, '');
end;

procedure TMainForm.PCpurchaseStatisticExecute(Sender: TObject);
begin
  FindShowForm(TPCPurchaseStatisticForm, '');
end;

procedure TMainForm.PCPurchaseForecastExecute(Sender: TObject);
begin
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

procedure TMainForm.DAProjectActionExecute(Sender: TObject);
begin
  FindShowForm(TDABrProjectForm, '');
end;

procedure TMainForm.EGFNClearEGActionExecute(Sender: TObject);
begin
  FindShowForm(TFNBrClearEGForm, '');
end;

procedure TMainForm.EGMaterialOutActionExecute(Sender: TObject);
begin
  FindShowForm(TEGBrGoodsOutForm, '');
end;

procedure TMainForm.EGProjectCostSttActExecute(Sender: TObject);
begin
  FindShowForm(TEGProjectStatisticForm, '');
end;

procedure TMainForm.DAProjectClassActExecute(Sender: TObject);
begin
   FindShowForm(TDAProjectClassBrowseForm, '');

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
  adoTemp.SQL.Text := Format('BACKUP DATABASE [%s] TO DISK = ''%s'' ',
    [CommonData.acnConnection.DefaultDatabase,
    ExtractFilePath(Application.ExeName) + 'Backup\'
    + CommonData.acnConnection.DefaultDatabase
    +  FormatDateTime('yymmdd-hhnnss', Now)
    + StrOfDat]);
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text := 'select ID,OriginTable from MSBillTable '
    +' where OriginID>=1 and ( '
    +' OriginTable like '+Quotedstr('%Master')
    +' Or OriginTable like '+Quotedstr('%Detail')
    +' Or OriginTable like '+Quotedstr('%DAProject')
    +' ) order by OriginTable' ;
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

procedure TMainForm.FNCredenceActionExecute(Sender: TObject);
begin
    FindShowForm(TFNCredenceBrowseForm, '');
end;

procedure TMainForm.PayableAccountActExecute(Sender: TObject);
begin
  FindShowForm(TFNAccountAgePCForm, '');
end;

procedure TMainForm.FNSubjectDetailsCollectActionExecute(Sender: TObject);
begin
  FindShowForm(TFNSubjectDetailsCollectReportForm, '');
end;

procedure TMainForm.FNCustomizeReportActionExecute(Sender: TObject);
begin
  FindShowForm(TFNCustomizeReportForm, '');
end;

procedure TMainForm.FNSubjectCollectActionExecute(Sender: TObject);
begin
  FindShowForm(TFNSubjectCollectReportForm, '');
end;

procedure TMainForm.FNSubjectDetailsReportActionExecute(Sender: TObject);
begin
  FindShowForm(TFNSubjectDetailsReportForm, '');
end;

procedure TMainForm.RegisterActions;

  function GetPermissionName(const ACaption: string): string;
  var
    Idx: Integer;
  begin
    Idx := Pos('($', ACaption);
    if Idx > 0 then Result := Copy(ACaption, 1, Idx - 1)
    else Result := ACaption;
  end;

var
  I, L: Integer;
  Actions: array of TBasicAction;
  PmsNames: TStringDynArray;
begin
  SetLength(Actions, ActionList.ActionCount);
  SetLength(PmsNames, ActionList.ActionCount);
  L := 0;
  for I := 0 to ActionList.ActionCount - 1 do
  begin

    Actions[I] := ActionList.Actions[I];
    PmsNames[I] := GetPermissionName(TAction(ActionList.Actions[I]).Caption);
    Inc(L);
  end;
  SetLength(Actions, L);
  SetLength(PmsNames, L);
  Guarder.RegisterActions(Actions, PmsNames);
end;

procedure TMainForm.STPCGoodsInCostActExecute(Sender: TObject);
begin
  FindShowForm(TSTBrPCGoodsInCostForm, '');
end;

procedure TMainForm.STYDGoodsOutCostActExecute(Sender: TObject);
begin
  FindShowForm(TSTBrYDGoodsOutCostForm, '');
end;

procedure TMainForm.STYDGoodsInCostActExecute(Sender: TObject);
begin
  FindShowForm(TSTBrYDGoodsInCostForm, '');
end;

procedure TMainForm.STSLGoodsOutCostActExecute(Sender: TObject);
begin
  FindShowForm(TSTBrSLGoodsOutCostForm, '');
end;

procedure TMainForm.DisableMenuItems(Item: TMenuItem);
var
  I: Integer;
begin
  for I := 0 to Item.Count - 1 do
  begin
    DisableMenuItems(Item.Items[I]);
    if Item.Items[I].Action <> nil then
      Item.Items[I].Enabled := Guarder.HasPermission(Item.Items[I].Action);
  end;
end;

procedure TMainForm.FashionSaleActionExecute(Sender: TObject);
begin
  FindShowForm(TSLBrSaleClothForm, '');
end;

procedure TMainForm.FashionPurchaseAtcExecute(Sender: TObject);
begin
  FindShowForm(TPCBrPurchaseClothForm, '');
end;

procedure TMainForm.FashionRemoveActExecute(Sender: TObject);
begin
  FindShowForm(TSTBrClothOutInForm, '');
end;

procedure TMainForm.FashionCountOffActExecute(Sender: TObject);
begin
  FindShowForm(TSTBRClothCountOffForm, '');
end;

procedure TMainForm.FashionSaleSttActExecute(Sender: TObject);
begin
  FindShowForm(TSLSaleClothStatisticForm, '');
end;

procedure TMainForm.FashionPurchaseSttActExecute(Sender: TObject);
begin
  FindShowForm(TPCPurchaseClothStatisticForm, '');
end;

procedure TMainForm.FashionStockActExecute(Sender: TObject);
begin
  FindShowForm(TSTClothStockRepForm, '');
end;

procedure TMainForm.FileBaseDataFDSExecute(Sender: TObject);
var adoTemp: TADOQuery;
begin
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.close;
  adoTemp.SQL.Text :='truncate table MSUnit ' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text :='Insert Into MSUnit ( '
    +' CreateDate, CreateUserID, RecordState, Name, ExchangeRate, '
    +' GoalUnitID, IsGoalUnit ) '
    +' select '
    +' CreateDate, CreateUserID, RecordState, Name, ExchangeRate, '
    +' GoalUnitID, IsGoalUnit '
    +' from MSUnitFDS  ';
  adoTemp.ExecSQL;

  adoTemp.close;
  adoTemp.SQL.Text :='truncate table DAGoodsClass' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text :='Insert Into DAGoodsClass ( '
    +' CreateDate, CreateUserID, RecordState, Name, GeneralPACID, '
    +' GeneralCACID, GeneralACID, UpID, LevelCode ) '
    +' select '
    +' CreateDate, CreateUserID, RecordState, Name, GeneralPACID, '
    +' GeneralCACID, GeneralACID, UpID, LevelCode '
    +' from DAGoodsClassFDS  ';
  adoTemp.ExecSQL;

  adoTemp.close;
  adoTemp.SQL.Text :='truncate table DAGoods' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text :='Insert Into DAGoods  ( '
    +' CreateDate, CreateUserID, RecordState, Name, Code, Spec, '
    +' BarCode, GoodsClassID, UnitID, AddUnitID, AddUnitRate, '
    +' StockMax, StockMin, PricePurchase, PriceSales, GoodsPictrue )'
    +' select '
    +' CreateDate, CreateUserID, RecordState, Name, Code, Spec, '
    +' BarCode, GoodsClassID, UnitID, AddUnitID, AddUnitRate, '
    +' StockMax, StockMin, PricePurchase, PriceSales, GoodsPictrue '
    +' from DAGoodsFDS ';
  adoTemp.ExecSQL;
  Showmessage('饲料业资料更新完毕！');
end;

procedure TMainForm.FileBaseDataClothExecute(Sender: TObject);
var adoTemp: TADOQuery;
begin
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.close;
  adoTemp.SQL.Text :='truncate table MSUnit ' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text :='Insert Into MSUnit ( '
    +' CreateDate, CreateUserID, RecordState, Name, ExchangeRate, '
    +' GoalUnitID, IsGoalUnit ) '
    +' select '
    +' CreateDate, CreateUserID, RecordState, Name, ExchangeRate, '
    +' GoalUnitID, IsGoalUnit '
    +' from MSUnitCloth   ';
  adoTemp.ExecSQL;
  adoTemp.close;
  adoTemp.SQL.Text :='truncate table DAGoodsClass' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text :='Insert Into DAGoodsClass ( '
    +' CreateDate, CreateUserID, RecordState, Name, GeneralPACID, '
    +' GeneralCACID, GeneralACID, UpID, LevelCode ) '
    +' select '
    +' CreateDate, CreateUserID, RecordState, Name, GeneralPACID, '
    +' GeneralCACID, GeneralACID, UpID, LevelCode '
    +' from DAGoodsClassCloth ';
  adoTemp.ExecSQL;

  adoTemp.close;
  adoTemp.SQL.Text :='truncate table DAGoods' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text :='Insert Into DAGoods  ( '
    +' CreateDate, CreateUserID, RecordState, Name, Code, Spec, '
    +' BarCode, GoodsClassID, UnitID, AddUnitID, AddUnitRate, '
    +' StockMax, StockMin, PricePurchase, PriceSales, GoodsPictrue )'
    +' select '
    +' CreateDate, CreateUserID, RecordState, Name, Code, Spec, '
    +' BarCode, GoodsClassID, UnitID, AddUnitID, AddUnitRate, '
    +' StockMax, StockMin, PricePurchase, PriceSales, GoodsPictrue '
    +' from DAGoodsCloth  '  ;
  adoTemp.ExecSQL;
  Showmessage('内衣业资料更新完毕！');
end;

procedure TMainForm.FileBaseDataEGExecute(Sender: TObject);
var adoTemp: TADOQuery;
begin
  adoTemp := TADOQuery.Create(nil);
  adoTemp.Connection := CommonData.acnConnection;
  adoTemp.close;
  adoTemp.SQL.Text :='truncate table MSUnit ' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text :='Insert Into MSUnit ( '
    +' CreateDate, CreateUserID, RecordState, Name, ExchangeRate, '
    +' GoalUnitID, IsGoalUnit ) '
    +' select '
    +' CreateDate, CreateUserID, RecordState, Name, ExchangeRate, '
    +' GoalUnitID, IsGoalUnit '
    +' from MSUnitEGM   ';
  adoTemp.ExecSQL;
  adoTemp.close;
  adoTemp.SQL.Text :='truncate table DAGoodsClass' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text :='Insert Into DAGoodsClass ( '
    +' CreateDate, CreateUserID, RecordState, Name, GeneralPACID, '
    +' GeneralCACID, GeneralACID, UpID,LevelCode ) '
    +' select '
    +' CreateDate, CreateUserID, RecordState, Name, GeneralPACID, '
    +' GeneralCACID, GeneralACID, UpID,LevelCode '
    +' from DAGoodsClassEGM ';
  adoTemp.ExecSQL;

  adoTemp.close;
  adoTemp.SQL.Text :='truncate table DAGoods' ;
  adoTemp.ExecSQL;
  adoTemp.Close;
  adoTemp.sql.Text :='Insert Into DAGoods  ( '
    +' CreateDate, CreateUserID, RecordState, Name, Code, Spec, '
    +' BarCode, GoodsClassID, UnitID, AddUnitID, AddUnitRate, '
    +' StockMax, StockMin, PricePurchase, PriceSales, GoodsPictrue )'
    +' select '
    +' CreateDate, CreateUserID, RecordState, Name, Code, Spec, '
    +' BarCode, GoodsClassID, UnitID, AddUnitID, AddUnitRate, '
    +' StockMax, StockMin, PricePurchase, PriceSales, GoodsPictrue '
    +' from DAGoodsEGM  '  ;
  adoTemp.ExecSQL;
  Showmessage('建筑业资料更新完毕！');
end;

procedure TMainForm.SLSaleDsctActionExecute(Sender: TObject);
begin
  FindShowForm(TSLBrSaleDsctForm, '');
end;

procedure TMainForm.FNCashExchangeActExecute(Sender: TObject);
begin
  FindShowForm(TFNBrCashExchangeForm, '');
end;

procedure TMainForm.FNCashExchSttActExecute(Sender: TObject);
begin
  FindShowForm(TFNCashExchStatisticForm, '');
end;

end.

