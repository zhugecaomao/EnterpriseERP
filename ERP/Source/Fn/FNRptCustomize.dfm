inherited FNCustomizeReportForm: TFNCustomizeReportForm
  Caption = #20250#35745#25253#34920
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 41
    Width = 688
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    inline DateRangeFrame: TWSDateRangeFrame
      Left = 0
      Top = 8
      Width = 281
      Height = 25
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object cxButton1: TcxButton
      Left = 304
      Top = 8
      Width = 75
      Height = 25
      Caption = #37325#26032#35745#31639
      TabOrder = 1
      OnClick = cxButton1Click
    end
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 688
    Height = 41
    AutoSize = True
    ButtonHeight = 35
    ButtonWidth = 55
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
    TabOrder = 1
    object ToolButton7: TToolButton
      Left = 0
      Top = 2
      Action = FileOpenAction
      Caption = #25171#24320
    end
    object ToolButton9: TToolButton
      Left = 55
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton1: TToolButton
      Left = 63
      Top = 2
      Action = PrintAction
    end
    object ToolButton2: TToolButton
      Left = 118
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 181
      Top = 2
      Action = ExportAction
      Visible = False
    end
    object ToolButton8: TToolButton
      Left = 236
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 244
      Top = 2
      Action = RefreshAction
    end
    object ToolButton3: TToolButton
      Left = 299
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 307
      Top = 2
      Action = ExitAction
    end
  end
  object SSBook: TcxSpreadSheetBook
    Left = 0
    Top = 82
    Width = 688
    Height = 371
    Align = alClient
    AutoRecalc = False
    DefaultStyle.Font.Name = 'MS Sans Serif'
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    RowHeaderWidth = 30
  end
  object DataSource: TDataSource
    DataSet = ADODataSet
    Left = 48
    Top = 128
  end
  object ActionList: TActionList
    Images = CommonData.ilToolBtn
    Left = 16
    Top = 128
    object ViewDetailsAction: TAction
      Caption = #26126#32454'(&V)'
      Hint = #26126#32454
      ImageIndex = 2
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
    end
    object FiltrateAction: TAction
      Caption = #36807#28388
      Hint = #36807#28388
      ImageIndex = 6
      Visible = False
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
    object FileOpenAction: TAction
      Caption = #25171#24320'(&O)...'
      Hint = #25171#24320
      ImageIndex = 9
      OnExecute = FileOpenActionExecute
    end
  end
  object ADODataSet: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    AfterOpen = ADODataSetAfterOpen
    CommandText = 
      'SELECT * FROM fn_FNSubjectCollectEx(:BeginDate, :EndDate, :SubLe' +
      'vel)'
    Parameters = <
      item
        Name = 'BeginDate'
        DataType = ftDateTime
        Size = -1
        Value = 36161d
      end
      item
        Name = 'EndDate'
        DataType = ftDateTime
        Size = -1
        Value = 37622d
      end
      item
        Name = 'SubLevel'
        DataType = ftInteger
        Value = 0
      end>
    Left = 80
    Top = 128
    object ADODataSetSubCode: TStringField
      FieldName = 'SubCode'
      Size = 18
    end
    object ADODataSetSubName: TStringField
      FieldName = 'SubName'
      Size = 50
    end
    object ADODataSetDebitCredit: TStringField
      FieldName = 'DebitCredit'
      Size = 4
    end
    object ADODataSetYBDebit: TBCDField
      FieldName = 'YBDebit'
      Precision = 19
    end
    object ADODataSetYBCredit: TBCDField
      FieldName = 'YBCredit'
      Precision = 19
    end
    object ADODataSetYBBalance: TBCDField
      FieldName = 'YBBalance'
      Precision = 19
    end
    object ADODataSetTBDebit: TBCDField
      FieldName = 'TBDebit'
      Precision = 19
    end
    object ADODataSetTBCredit: TBCDField
      FieldName = 'TBCredit'
      Precision = 19
    end
    object ADODataSetTBBalance: TBCDField
      FieldName = 'TBBalance'
      Precision = 19
    end
    object ADODataSetTCDebit: TBCDField
      FieldName = 'TCDebit'
      Precision = 19
    end
    object ADODataSetTCCredit: TBCDField
      FieldName = 'TCCredit'
      Precision = 19
    end
    object ADODataSetYEDebit: TBCDField
      FieldName = 'YEDebit'
      Precision = 19
    end
    object ADODataSetYECredit: TBCDField
      FieldName = 'YECredit'
      Precision = 19
    end
    object ADODataSetYEBalance: TBCDField
      FieldName = 'YEBalance'
      Precision = 19
    end
    object ADODataSetTEDebit: TBCDField
      FieldName = 'TEDebit'
      Precision = 19
    end
    object ADODataSetTECredit: TBCDField
      FieldName = 'TECredit'
      Precision = 19
    end
    object ADODataSetTEBalance: TBCDField
      FieldName = 'TEBalance'
      Precision = 19
    end
    object ADODataSetHYDebit: TBCDField
      FieldName = 'YHDebit'
      Precision = 19
    end
    object ADODataSetHYCredit: TBCDField
      FieldName = 'YHCredit'
      Precision = 19
    end
    object ADODataSetHYBalance: TBCDField
      FieldName = 'YHBalance'
      Precision = 19
    end
  end
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = SheetPrinterLink
    Version = 0
    Left = 112
    Top = 128
    object SheetPrinterLink: TdxSpreadSheetBookReportLink
      Caption = 'New Report'
      Component = SSBook
      DesignerHelpContext = 0
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 8460
      PrinterPage.Header = 8460
      PrinterPage.Margins.Bottom = 12700
      PrinterPage.Margins.Left = 12700
      PrinterPage.Margins.Right = 12700
      PrinterPage.Margins.Top = 12700
      PrinterPage.MinMargins.Bottom = 0
      PrinterPage.MinMargins.Left = 0
      PrinterPage.MinMargins.Right = 0
      PrinterPage.MinMargins.Top = 0
      PrinterPage.Orientation = poLandscape
      PrinterPage.PageFooter.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageFooter.Font.Color = clWindowText
      PrinterPage.PageFooter.Font.Height = -11
      PrinterPage.PageFooter.Font.Name = 'Tahoma'
      PrinterPage.PageFooter.Font.Style = []
      PrinterPage.PageHeader.Font.Charset = DEFAULT_CHARSET
      PrinterPage.PageHeader.Font.Color = clWindowText
      PrinterPage.PageHeader.Font.Height = -11
      PrinterPage.PageHeader.Font.Name = 'Tahoma'
      PrinterPage.PageHeader.Font.Style = []
      PrinterPage.PageSize.X = 210000
      PrinterPage.PageSize.Y = 297000
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportTitle.Font.Charset = DEFAULT_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -19
      ReportTitle.Font.Name = 'Times New Roman'
      ReportTitle.Font.Style = [fsBold]
      FixedFont.Charset = DEFAULT_CHARSET
      FixedFont.Color = clWindowText
      FixedFont.Height = -11
      FixedFont.Name = 'Times New Roman'
      FixedFont.Style = [fsBold]
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      OptionsView = []
      BuiltInReportLink = True
    end
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'xls'
    Filter = 'Excel '#24037#20316#31807'|*.xls|'#20840#37096#25991#20214'|*.*'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 168
    Top = 152
  end
end
