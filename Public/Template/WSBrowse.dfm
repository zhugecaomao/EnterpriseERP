inherited WSBrowseForm: TWSBrowseForm
  Left = 128
  Top = 132
  Width = 615
  Height = 326
  Caption = #22522#26412
  OldCreateOrder = True
  Visible = True
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 607
    Height = 41
    AutoSize = True
    ButtonHeight = 35
    ButtonWidth = 73
    EdgeBorders = [ebTop, ebBottom]
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = []
    Images = CommonData.ilToolBtn
    ParentFont = False
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 607
    Height = 258
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object PageControl: TPageControl
      Left = 0
      Top = 236
      Width = 607
      Height = 22
      ActivePage = TabSheet1
      Align = alBottom
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      PopupMenu = WsBrowsePop
      TabIndex = 0
      TabOrder = 0
      TabPosition = tpBottom
      OnChange = TabSheetShow
      object TabSheet1: TTabSheet
        Caption = #22522#26412
      end
    end
    object DBGrid: TQLDBGrid
      Left = 0
      Top = 0
      Width = 607
      Height = 236
      Align = alClient
      DataSource = DataSource
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      PopupMenu = WsBrowsePop
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = DBGridDblClick
      OnKeyDown = DBGridKeyDown
      OnTitleClick = DBGridTitleClick
      AlternateColor = 15399421
      CurrencyView.CurrencyTitle = False
      CurrencyView.DigitAlignment = taCenter
      CurrencyView.DigitWidth = 9
      CurrencyView.IntegerSeparateColor = clRed
      CurrencyView.SeparateColor = clSilver
      CurrencyView.ThousandSeparateColor = clGray
      CurrencyView.TitleLines = False
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 0
      OptionsEx = [dgAllowDelete, dgAllowInsert]
    end
  end
  object ActionList: TActionList
    Images = CommonData.ilToolBtn
    Left = 16
    Top = 112
    object AddNewAction: TAction
      Caption = #22686#21152
      Hint = #22686#21152
      ImageIndex = 0
      OnExecute = AddNewActionExecute
    end
    object DeleteAction: TAction
      Caption = #21024#38500
      Hint = #21024#38500
      ImageIndex = 1
      OnExecute = DeleteActionExecute
      OnUpdate = DeleteActionUpdate
    end
    object EditAction: TAction
      Caption = #20462#25913
      Hint = #20462#25913
      ImageIndex = 2
      OnExecute = EditActionExecute
      OnUpdate = EditActionUpdate
    end
    object PrintPreviewAction: TAction
      Caption = #25171#21360#39044#35272
      Hint = #25171#21360#39044#35272
      ImageIndex = 3
      OnExecute = PrintPreviewActionExecute
    end
    object PrintAction: TAction
      Caption = #25171#21360
      Hint = #25171#21360
      ImageIndex = 4
      OnExecute = PrintActionExecute
    end
    object ExportAction: TAction
      Caption = #23548#20986
      Hint = #23548#20986
      ImageIndex = 5
      OnExecute = ExportActionExecute
    end
    object FiltrateAction: TAction
      Caption = #36807#28388
      Hint = #36807#28388
      ImageIndex = 6
      OnExecute = FiltrateActionExecute
    end
    object RefreshAction: TAction
      Caption = #21047#26032
      Hint = #21047#26032
      ImageIndex = 7
      OnExecute = RefreshActionExecute
    end
    object ExitAction: TAction
      Caption = #20851#38381
      Hint = #20851#38381
      ImageIndex = 8
      OnExecute = ExitActionExecute
    end
    object CustomizeViewAction: TAction
      Caption = #26174#31034
      Hint = #35774#32622#26174#31034#21015
      ImageIndex = 17
      OnExecute = CustomizeViewActionExecute
    end
    object ShowChartAction: TAction
      Caption = #22270#34920
      Hint = #22270#34920
      ImageIndex = 18
      OnExecute = ShowChartActionExecute
    end
  end
  object DataSource: TDataSource
    Left = 48
    Top = 112
  end
  object WsBrowsePop: TPopupMenu
    Left = 104
    Top = 112
    object wsbrowsepopnRename: TMenuItem
      Caption = #37325#21629#21517
      OnClick = wsbrowsepopnRenameClick
    end
    object wsbrowsepopDelete: TMenuItem
      Caption = #21024#38500#39029
      Visible = False
      OnClick = wsbrowsepopDeleteClick
    end
  end
end
