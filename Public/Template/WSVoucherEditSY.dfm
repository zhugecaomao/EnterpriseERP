inherited WSVoucherEditSYForm: TWSVoucherEditSYForm
  Left = 158
  Top = 125
  Width = 510
  Height = 345
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'WSVoucherEditSYForm'
  Menu = MainMenu
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 12
  object DBGrid: TQLDBGrid
    Left = 0
    Top = 97
    Width = 502
    Height = 180
    Align = alClient
    DataSource = DetailDataSource
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = DetailsPopupMenu
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnEnter = DBGridEnter
    OnExit = DBGridEnter
    AlternateColor = 15399421
    CurrencyView.CurrencyTitle = False
    CurrencyView.DigitAlignment = taCenter
    CurrencyView.DigitWidth = 9
    CurrencyView.IntegerSeparateColor = clRed
    CurrencyView.SeparateColor = clSilver
    CurrencyView.ThousandSeparateColor = clGray
    CurrencyView.TitleLines = False
    FooterColor = clMoneyGreen
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 0
    OptionsEx = [dgAllowDelete, dgAllowInsert, dgCurrencyView]
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 502
    Height = 29
    Caption = 'ToolBar'
    EdgeBorders = [ebTop, ebBottom]
    Images = CommonData.ilVoucherSmall
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = NewAction
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 2
      Action = SaveAction
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 2
      Action = DeleteAction
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object VourcherEditSYExportButton: TToolButton
      Left = 77
      Top = 2
      Action = VourcherEditSYExportAction
    end
    object ToolButton6: TToolButton
      Left = 100
      Top = 2
      Action = PrintPreviewAction
      ImageIndex = 5
    end
    object ToolButton5: TToolButton
      Left = 123
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 146
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 154
      Top = 2
      Action = FiltrateAction
      ImageIndex = 7
    end
    object ToolButton10: TToolButton
      Left = 177
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 14
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 185
      Top = 2
      Action = CloseAction
    end
  end
  object TopPanel: TPanel
    Left = 0
    Top = 29
    Width = 502
    Height = 68
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object RemarkLabel: TLabel
      Left = 8
      Top = 43
      Width = 30
      Height = 12
      Caption = #22791#27880':'
    end
    object VoucherNoLabel: TLabel
      Left = 192
      Top = 11
      Width = 30
      Height = 12
      Caption = #21333#21495':'
    end
    object VoucherDateLabel: TLabel
      Left = 344
      Top = 11
      Width = 30
      Height = 12
      Caption = #26085#26399':'
    end
    object RemarkDBEdit: TDBEdit
      Left = 40
      Top = 40
      Width = 457
      Height = 20
      DataSource = MasterDataSource
      TabOrder = 0
    end
    object VocherNoDBEdit: TDBEdit
      Left = 224
      Top = 8
      Width = 105
      Height = 20
      DataSource = MasterDataSource
      TabOrder = 1
    end
    object DateDBEdit: TDBEdit
      Left = 376
      Top = 8
      Width = 121
      Height = 20
      DataSource = MasterDataSource
      TabOrder = 2
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 277
    Width = 502
    Height = 22
    Panels = <>
    SimplePanel = True
    SimpleText = #25353'F7'#20026#19978#19968#24352#21333', F8'#20026#19979#19968#24352#21333', Ctrl+X'#20026#26032#22686#21333#25454',Ctrl+A'#20026#26032#22686#26126#32454
  end
  object MasterDataSource: TDataSource
    Left = 112
    Top = 152
  end
  object DetailDataSource: TDataSource
    Left = 144
    Top = 152
  end
  object ActionList: TActionList
    Images = CommonData.ilVoucherSmall
    Left = 176
    Top = 152
    object PrintAction: TAction
      Caption = #25171#21360
      Hint = #25171#21360
      ImageIndex = 4
      OnExecute = PrintActionExecute
    end
    object PrintPreviewAction: TAction
      Caption = #25171#21360#39044#35272'(&V)'
      Hint = #25171#21360#39044#35272
      ImageIndex = 7
      OnExecute = PrintPreviewActionExecute
    end
    object SaveAction: TAction
      Caption = #20445#23384'(&S)'
      Hint = #20445#23384
      ImageIndex = 11
      ShortCut = 16467
      OnExecute = SaveActionExecute
    end
    object NewAction: TAction
      Caption = #26032#24314'(&N)'
      Hint = #26032#24314
      ImageIndex = 0
      ShortCut = 16472
      OnExecute = NewActionExecute
    end
    object PriorAction: TAction
      Caption = #19978#19968#24352'(&P)'
      Hint = #19978#19968#24352
      ShortCut = 118
      OnExecute = PriorActionExecute
    end
    object NextAction: TAction
      Caption = #19979#19968#24352'(&N)'
      Hint = #19979#19968#24352
      ShortCut = 119
      OnExecute = NextActionExecute
    end
    object PageOptionsAction: TAction
      Caption = #39029#38754#35774#32622'(&O)...'
      Hint = #39029#38754#35774#32622
    end
    object FiltrateAction: TAction
      Caption = #36807#28388'(&L)...'
      Hint = #36807#28388
      ImageIndex = 9
      OnExecute = FiltrateActionExecute
    end
    object DeleteAction: TAction
      Caption = #21024#38500'(&D)...'
      Hint = #21024#38500
      ImageIndex = 1
      OnExecute = DeleteActionExecute
    end
    object CloseAction: TAction
      Caption = #20851#38381'(&C)'
      Hint = #20851#38381
      ImageIndex = 13
      OnExecute = CloseActionExecute
    end
    object DeleteDetailAction: TAction
      Caption = #21024#38500#26126#32454'(&D)'
      Hint = #21024#38500#26126#32454
      ImageIndex = 1
      OnExecute = DeleteDetailActionExecute
      OnUpdate = DeleteDetailActionUpdate
    end
    object NewDetailAction: TAction
      Caption = #26032#22686#26126#32454
      Hint = #26032#22686#26126#32454
      ImageIndex = 0
      ShortCut = 16449
      OnExecute = NewDetailActionExecute
    end
    object SaveAsAction: TAction
      Caption = #20811#38534#20973#21333'(&A)'
      Hint = #23558#24403#21069#20973#21333#20811#38534#20026#26032#20973#21333
      OnExecute = SaveAsActionExecute
    end
    object FindAction: TAction
      Caption = #26597#25214'(&F)...'
      Hint = #26597#25214
      ImageIndex = 5
    end
    object SubmitAction: TAction
      Caption = #25552#20132'(&U)...'
      Hint = #25552#20132
      OnExecute = SubmitActionExecute
    end
    object SendAsMailAction: TAction
      Caption = #21457#36865#37038#20214'(&N)'
      Hint = #21457#36865#37038#20214
      OnExecute = SendAsMailActionExecute
    end
    object ImportAction: TAction
      Caption = #24341#29992'(&I)...'
      Hint = #24341#29992
      OnExecute = ImportActionExecute
    end
    object WriteOffAction: TAction
      Caption = #27880#38144'(&W)...'
      OnExecute = WriteOffActionExecute
    end
    object VourcherEditSYExportAction: TAction
      Caption = 'VourcherEditSYExportAction'
      Hint = #23558#24403#21069#25968#25454#34920#30340#35760#24405#23548#20986#21040'EXCEL'#20013#12290
      ImageIndex = 6
      OnExecute = VourcherEditSYExportActionExecute
    end
  end
  object MainMenu: TMainMenu
    Left = 208
    Top = 152
    object FileMenuItem: TMenuItem
      Caption = #25991#20214'(&F)'
      object N2: TMenuItem
        Action = NewAction
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object S1: TMenuItem
        Action = SaveAction
      end
      object A1: TMenuItem
        Action = SaveAsAction
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object D2: TMenuItem
        Action = DeleteAction
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object O1: TMenuItem
        Action = PageOptionsAction
      end
      object P1: TMenuItem
        Action = PrintAction
      end
      object V1: TMenuItem
        Action = PrintPreviewAction
      end
      object N10: TMenuItem
        Caption = '-'
      end
      object C1: TMenuItem
        Action = CloseAction
      end
    end
    object EditMenuItem: TMenuItem
      Caption = #32534#36753'(&E)'
      object A2: TMenuItem
        Action = NewDetailAction
      end
      object D1: TMenuItem
        Action = DeleteDetailAction
      end
      object N11: TMenuItem
        Caption = '-'
      end
      object F1: TMenuItem
        Action = FindAction
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object N12: TMenuItem
        Action = ImportAction
      end
      object U1: TMenuItem
        Action = SubmitAction
      end
      object N33: TMenuItem
        Action = WriteOffAction
      end
    end
    object ViewMenuItem: TMenuItem
      Caption = #35270#22270'(&V)'
      object P2: TMenuItem
        Action = PriorAction
      end
      object N1: TMenuItem
        Action = NextAction
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object L1: TMenuItem
        Action = FiltrateAction
      end
    end
    object A3: TMenuItem
      Caption = #21160#20316'(&A)'
      object N9: TMenuItem
        Action = SendAsMailAction
      end
    end
  end
  object DetailsPopupMenu: TPopupMenu
    Left = 240
    Top = 128
    object AddNewDetailItem: TMenuItem
      Action = NewDetailAction
    end
    object DeleteDetailItem: TMenuItem
      Action = DeleteDetailAction
    end
  end
end
