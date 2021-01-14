inherited BaseVoucherEditForm: TBaseVoucherEditForm
  Left = 142
  Top = 122
  Caption = 'BaseVoucherEditForm'
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited ActionList: TActionList
    inherited NewDetailAction: TAction
      Caption = #26032#22686#26126#32454'(&F)'
    end
    inherited SaveAsAction: TAction
      Hint = #23558#24403#21069#20973#21333#20811#38534#20026#26032#20973#21333'.'
    end
    object CheckAction: TAction [18]
      Caption = #22797#26680'(&C)'
      OnExecute = CheckActionExecute
    end
    object RedWordAction: TAction [19]
      Caption = #32418#23383'(&R)'
      OnExecute = RedWordActionExecute
    end
    object ActualStock: TAction [20]
      Caption = #24403#21069#24211#23384
      Hint = #26597#35810#24403#21069#24211#23384#12290
      OnExecute = ActualStockExecute
    end
    object StockChange: TAction [21]
      Caption = #24211#23384#21464#21160
      Enabled = False
      Hint = #26597#35810#24211#23384#21464#21160#12290
      Visible = False
      OnExecute = StockChangeExecute
    end
    object PCOrderTrail: TAction [22]
      Caption = #37319#36141#35746#21333#36319#36394
      Hint = #36319#36394#37319#36141#35746#21333#30340#35814#32454#25191#34892#24773#20917#12290
      OnExecute = PCOrderTrailExecute
    end
    object SLOrderTrail: TAction [23]
      Caption = #38144#21806#35746#21333#36319#36394
      Hint = #36319#36394#38144#21806#35746#21333#30340#35814#32454#25191#34892#24773#20917#12290
      OnExecute = SLOrderTrailExecute
    end
    object SLsaleLeger: TAction [24]
      Caption = #38144#21806#26126#32454#24080
      Hint = #26597#35810#38144#21806#26126#32454#24080#12290
      OnExecute = SLsaleLegerExecute
    end
    object SLClearLeger: TAction [25]
      Caption = #38144#21806#32467#31639#26126#32454
      Hint = #26597#35810#38144#21806#32467#31639#26126#32454#24080#21450#23454#26102#20313#39069#12290
      OnExecute = SLClearLegerExecute
    end
    object SLActualPrice: TAction [26]
      Caption = #21382#21490#21806#20215
      Hint = #26597#35810#21830#21697#30340#21382#21490#38144#21806#20215#26684#12290
      OnExecute = SLActualPriceExecute
    end
    object SLCredit: TAction [27]
      Caption = #23458#25143#20449#29992#36164#26009
      Hint = #26597#35810#25105#26041#32473#30340#23458#25143#38144#21806#20449#29992#39069#24230#12290
      OnExecute = SLCreditExecute
    end
    object SalePrice: TAction [28]
      Caption = #21806#20215#31574#30053
      Hint = #26597#35810#38144#21806#25919#31574#35268#23450#30340#21830#21697#38144#21806#20215#26684#12290
      OnExecute = SalePriceExecute
    end
    object SLContractPrice: TAction [29]
      Caption = #21512#21516#21806#20215#36164#26009
      Hint = #26597#35810#25105#26041#19982#23458#25143#31614#35746#30340#21830#21697#38144#21806#21512#21516#20215#26684#12290' '
      OnExecute = SLContractPriceExecute
    end
    object PCPurchaseLeger: TAction [30]
      Caption = #37319#36141#26126#32454#24080
      Hint = #26597#35810#37319#36141#26126#32454#24080#12290
      OnExecute = PCPurchaseLegerExecute
    end
    object PCClearLeger: TAction [31]
      Caption = #37319#36141#32467#31639#26126#32454
      Hint = #26597#35810#21378#21830#30340#32467#31639#26126#32454#21450#23454#26102#20313#39069#12290
      OnExecute = PCClearLegerExecute
    end
    object PCActualPrice: TAction [32]
      Caption = #21382#21490#36827#20215
      Hint = #26597#35810#37319#36141#21830#21697#30340#21382#21490#36827#20215#12290
      OnExecute = PCActualPriceExecute
    end
    object PCCredit: TAction [33]
      Caption = #37319#36141#20449#29992#36164#26009
      Hint = #26597#35810#21378#21830#32473#25105#26041#30340#37319#36141#20449#29992#39069#24230#12290
      OnExecute = PCCreditExecute
    end
    object PurchasePrice: TAction [34]
      Caption = #36827#20215#31574#30053
      Hint = #26597#35810#36827#20215#25919#31574#35268#23450#30340#21830#21697#36827#36135#20215#26684#12290
      OnExecute = PurchasePriceExecute
    end
    object PCContractPrice: TAction [35]
      Caption = #21512#21516#36827#20215#36164#26009
      Hint = #26597#35810#25105#26041#19982#21378#21830#31614#35746#21830#21697#36827#36135#21512#21516#20215#26684#12290
      OnExecute = PCContractPriceExecute
    end
    object SubmitCNLAction: TAction [36]
      Caption = #25764#38144#25552#20132'(&G)...'
      Hint = #25764#28040#24050#32463#25552#20132','#20294#26410#23457#26680#30340#20973#21333#12290
    end
    object StockConsign: TAction [37]
      Tag = 1
      Caption = #21152#30431#36830#38145#24211#23384
      Hint = #26597#35810#20195#38144#23492#21806#21830#21697#32467#23384#24773#20917#12290
      OnExecute = StockConsignExecute
    end
    object CashBalance: TAction [38]
      Caption = #24403#21069#36164#37329
      Enabled = False
      Hint = #26597#35810#24403#21069#21487#20379#20351#29992#30340#36164#37329#24773#20917#12290
      Visible = False
      OnExecute = CashBalanceExecute
    end
    object CashFlow: TAction [39]
      Caption = #29616#37329#27969#37327
      Enabled = False
      Hint = #26597#35810#29616#37329#27969#37327#24773#20917#12290
      Visible = False
    end
    object EmployeeLend: TAction [40]
      Caption = #21592#24037#20511#27454
      Hint = #26597#35810#21592#24037#20511#29992#36164#37329#24773#20917#12290
      OnExecute = EmployeeLendExecute
    end
    object ReceiptPayable: TAction [41]
      Caption = #24212#25910#24212#20184
      Enabled = False
      Hint = #23454#26102#26597#35810#24212#25910#24212#20184#30340#27719#24635#24773#20917#12290
      Visible = False
      OnExecute = ReceiptPayableExecute
    end
    object FNExpenseReport: TAction [42]
      Caption = #32463#33829#36153#29992
      Enabled = False
      Hint = #26597#35810#29983#20135#32463#33829#36153#29992#30340#35814#32454#24773#20917#12290
      Visible = False
    end
    object YDPurchasePlan: TAction [43]
      Caption = #29983#20135#37319#36141#35745#21010
      Hint = #26597#35810#29983#20135#35745#21010#37319#36141#23454#34892#24773#20917#12290
      OnExecute = YDPurchasePlanExecute
    end
  end
  inherited MainMenu: TMainMenu
    inherited EditMenuItem: TMenuItem
      inherited U1: TMenuItem [5]
      end
      object N30: TMenuItem [6]
        Action = SubmitCNLAction
      end
      inherited N12: TMenuItem [7]
      end
      object C2: TMenuItem
        Action = CheckAction
      end
      object R1: TMenuItem
        Action = RedWordAction
      end
    end
    inherited ViewMenuItem: TMenuItem
      object N31: TMenuItem [2]
        Caption = '-'
      end
      inherited L1: TMenuItem [3]
      end
      inherited N8: TMenuItem [4]
      end
      object N13: TMenuItem
        Action = ActualStock
      end
      object A4: TMenuItem
        Action = StockConsign
      end
    end
    inherited A3: TMenuItem
      object N7: TMenuItem
        Caption = '-'
      end
      object N15: TMenuItem
        Action = SLOrderTrail
      end
      object N18: TMenuItem
        Action = SLClearLeger
      end
      object N48: TMenuItem
        Action = YDPurchasePlan
      end
      object N14: TMenuItem
        Action = PCOrderTrail
      end
      object N24: TMenuItem
        Action = PCClearLeger
      end
      object N16: TMenuItem
        Caption = '-'
      end
      object N17: TMenuItem
        Action = SLsaleLeger
      end
      object N19: TMenuItem
        Action = SalePrice
      end
      object N20: TMenuItem
        Action = SLActualPrice
      end
      object N22: TMenuItem
        Action = SLCredit
      end
      object N28: TMenuItem
        Action = SLContractPrice
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object N23: TMenuItem
        Action = PCPurchaseLeger
      end
      object N25: TMenuItem
        Action = PurchasePrice
      end
      object N27: TMenuItem
        Action = PCActualPrice
      end
      object N26: TMenuItem
        Action = PCCredit
      end
      object N29: TMenuItem
        Action = PCContractPrice
      end
    end
    object N34: TMenuItem
      Caption = #36130#21153'(&C)'
      Visible = False
      object N37: TMenuItem
        Action = CashBalance
      end
      object N35: TMenuItem
        Action = CashFlow
      end
      object N36: TMenuItem
        Action = EmployeeLend
        Enabled = False
        Visible = False
      end
      object N32: TMenuItem
        Action = ReceiptPayable
      end
      object N38: TMenuItem
        Caption = '-'
      end
      object N39: TMenuItem
        Action = FNExpenseReport
      end
      object N40: TMenuItem
        Caption = '-'
      end
    end
  end
end
