inherited FNSubjectCollectReportForm: TFNSubjectCollectReportForm
  Caption = #24635#20998#31867#36134
  FormStyle = fsMDIChild
  Visible = True
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = PrintAction
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 110
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 118
      Top = 2
      Action = ExportAction
    end
    object ToolButton9: TToolButton
      Left = 173
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton8: TToolButton
      Left = 228
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 236
      Top = 2
      Action = RefreshAction
    end
    object ToolButton3: TToolButton
      Left = 291
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 299
      Top = 2
      Action = ExitAction
    end
  end
  object cxGrid: TcxGrid [1]
    Left = 0
    Top = 82
    Width = 688
    Height = 371
    Align = alClient
    TabOrder = 1
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = False
    object cxGridDBBandedTableView1: TcxGridDBBandedTableView
      DataController.DataSource = DataSource
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skSum
          Column = cxGridDBBandedTableView1BCredit
        end
        item
          Kind = skSum
          Column = cxGridDBBandedTableView1BDebit
        end
        item
          Kind = skSum
          Column = cxGridDBBandedTableView1CCredit
        end
        item
          Kind = skSum
          Column = cxGridDBBandedTableView1CDebit
        end
        item
          Kind = skSum
          FieldName = 'ECredit'
          Column = cxGridDBBandedTableView1ECredit
        end
        item
          Kind = skSum
          FieldName = 'EDebit'
          Column = cxGridDBBandedTableView1EDebit
        end
        item
          Format = 'gggggggg'
          Column = cxGridDBBandedTableView1SubName
        end
        item
          Kind = skSum
          Column = cxGridDBBandedTableView1YDebit
        end
        item
          Kind = skSum
          Column = cxGridDBBandedTableView1YCredit
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsCustomize.ColumnFiltering = False
      OptionsData.Deleting = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsSelection.CellSelect = False
      OptionsView.Footer = True
      OptionsView.GroupByBox = False
      Bands = <
        item
          Caption = #31185#30446
          Options.HoldOwnColumnsOnly = True
          Width = 257
        end
        item
          Caption = #26399#21021#20313#39069
          Options.HoldOwnColumnsOnly = True
          Width = 184
        end
        item
          Caption = #26412#26399#21512#35745
          Options.HoldOwnColumnsOnly = True
          Width = 172
        end
        item
          Caption = #26412#24180#32047#35745
          Options.HoldOwnColumnsOnly = True
          Width = 143
        end
        item
          Caption = #26399#26411#20313#39069
          Options.HoldOwnColumnsOnly = True
          Width = 166
        end>
      object cxGridDBBandedTableView1SubCode: TcxGridDBBandedColumn
        Caption = #20195#30721
        Position.BandIndex = 0
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'SubCode'
      end
      object cxGridDBBandedTableView1SubName: TcxGridDBBandedColumn
        Caption = #21517#31216
        Position.BandIndex = 0
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'SubName'
      end
      object cxGridDBBandedTableView1BDebit: TcxGridDBBandedColumn
        Position.BandIndex = 1
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'BDebit'
      end
      object cxGridDBBandedTableView1BCredit: TcxGridDBBandedColumn
        Position.BandIndex = 1
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'BCredit'
      end
      object cxGridDBBandedTableView1CDebit: TcxGridDBBandedColumn
        Position.BandIndex = 2
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'CDebit'
      end
      object cxGridDBBandedTableView1CCredit: TcxGridDBBandedColumn
        Position.BandIndex = 2
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'CCredit'
      end
      object cxGridDBBandedTableView1YDebit: TcxGridDBBandedColumn
        Position.BandIndex = 3
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'YDebit'
      end
      object cxGridDBBandedTableView1YCredit: TcxGridDBBandedColumn
        Position.BandIndex = 3
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'YCredit'
      end
      object cxGridDBBandedTableView1EDebit: TcxGridDBBandedColumn
        Position.BandIndex = 4
        Position.ColIndex = 0
        Position.RowIndex = 0
        DataBinding.FieldName = 'EDebit'
      end
      object cxGridDBBandedTableView1ECredit: TcxGridDBBandedColumn
        Position.BandIndex = 4
        Position.ColIndex = 1
        Position.RowIndex = 0
        DataBinding.FieldName = 'ECredit'
      end
    end
    object cxGridLevel1: TcxGridLevel
      GridView = cxGridDBBandedTableView1
    end
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 41
    Width = 688
    Height = 41
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
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
  end
  inherited ActionList: TActionList
    Top = 128
    inherited PrintPreviewAction: TAction
      OnExecute = PrintPreviewActionExecute
    end
    inherited PrintAction: TAction
      OnExecute = PrintActionExecute
    end
    inherited ExportAction: TAction
      OnExecute = ExportActionExecute
    end
    inherited FiltrateAction: TAction
      OnExecute = FiltrateActionExecute
    end
    inherited RefreshAction: TAction
      OnExecute = RefreshActionExecute
    end
    inherited ExitAction: TAction
      OnExecute = ExitActionExecute
    end
  end
  inherited DataSource: TDataSource
    DataSet = ADODataSet
    Top = 128
  end
  object ADODataSet: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT * FROM fn_FNSubjectCollect(:BeginDate, :EndDate, :SubLeve' +
      'l)'
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
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'SubCode'
      Size = 18
    end
    object ADODataSetSubName: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'SubName'
      Size = 50
    end
    object ADODataSetDebitCredit: TStringField
      DisplayLabel = #26041#21521
      FieldName = 'DebitCredit'
      Visible = False
      Size = 4
    end
    object ADODataSetBDebit: TBCDField
      DisplayLabel = #20511#26041
      FieldName = 'BDebit'
      OnGetText = ADODataSetBDebitGetText
      Precision = 19
    end
    object ADODataSetBCredit: TBCDField
      DisplayLabel = #36151#26041
      FieldName = 'BCredit'
      OnGetText = ADODataSetBDebitGetText
      Precision = 19
    end
    object ADODataSetCDebit: TBCDField
      DisplayLabel = #20511#26041
      FieldName = 'CDebit'
      OnGetText = ADODataSetBDebitGetText
      Precision = 19
    end
    object ADODataSetCCredit: TBCDField
      DisplayLabel = #36151#26041
      FieldName = 'CCredit'
      OnGetText = ADODataSetBDebitGetText
      Precision = 19
    end
    object ADODataSetYDebit: TBCDField
      DisplayLabel = #20511#26041
      FieldName = 'YDebit'
      OnGetText = ADODataSetBDebitGetText
      Precision = 19
    end
    object ADODataSetYCredit: TBCDField
      DisplayLabel = #36151#26041
      FieldName = 'YCredit'
      OnGetText = ADODataSetBDebitGetText
      Precision = 19
    end
    object ADODataSetEDebit: TBCDField
      DisplayLabel = #20511#26041
      FieldName = 'EDebit'
      OnGetText = ADODataSetBDebitGetText
      Precision = 19
    end
    object ADODataSetECredit: TBCDField
      DisplayLabel = #36151#26041
      FieldName = 'ECredit'
      OnGetText = ADODataSetBDebitGetText
      Precision = 19
    end
  end
  object dxComponentPrinter: TdxComponentPrinter
    CurrentLink = GridPrinterLink
    Version = 0
    OnCustomDrawReportTitle = dxComponentPrinterCustomDrawReportTitle
    OnMeasureReportTitle = dxComponentPrinterMeasureReportTitle
    Left = 112
    Top = 128
    object GridPrinterLink: TdxGridReportLink
      Active = True
      Caption = 'New Report'
      Component = cxGrid
      DateTime = 37831.8582365625
      DesignerHelpContext = 0
      PrinterPage.DMPaper = 9
      PrinterPage.Footer = 8500
      PrinterPage.Header = 8500
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
      ReportTitle.Font.Charset = GB2312_CHARSET
      ReportTitle.Font.Color = clWindowText
      ReportTitle.Font.Height = -20
      ReportTitle.Font.Name = #40657#20307
      ReportTitle.Font.Style = [fsBold]
      ReportTitle.Mode = tmOnFirstPage
      ReportTitle.Text = #24635#20998#31867#36134
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Times New Roman'
      Font.Style = []
      OptionsCards.Shadow.Color = clBlack
      OptionsView.Caption = False
      BuiltInReportLink = True
    end
  end
end
