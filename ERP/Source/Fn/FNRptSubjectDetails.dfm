inherited FNSubjectDetailsReportform: TFNSubjectDetailsReportform
  Caption = #26126#32454#20998#31867#36134
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter [0]
    Left = 217
    Top = 65
    Width = 3
    Height = 234
    Cursor = crHSplit
  end
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
    object ToolButton5: TToolButton
      Left = 110
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 118
      Top = 2
      Action = ExportAction
    end
    object ToolButton3: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 181
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton10: TToolButton
      Left = 236
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton7: TToolButton
      Left = 291
      Top = 2
      Action = RefreshAction
    end
    object ToolButton8: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 354
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Left = 220
    Top = 65
    Width = 387
    Height = 234
    inherited PageControl: TPageControl
      Top = 212
      Width = 387
      inherited TabSheet1: TTabSheet
        Caption = ''
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 387
      Height = 212
      OnDblClick = nil
      OnTitleClick = nil
      CurrencyView.ThousandSeparateColor = clBlue
      OptionsEx = [dgAllowDelete, dgAllowInsert, dgCurrencyView]
    end
  end
  object Panel2: TPanel [3]
    Left = 0
    Top = 41
    Width = 607
    Height = 24
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    inline DateRangeFrame: TWSDateRangeFrame
      Left = 8
      Top = 0
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
  object TreeView: TTreeView [4]
    Left = 0
    Top = 65
    Width = 217
    Height = 234
    Align = alLeft
    Indent = 19
    ReadOnly = True
    TabOrder = 3
    OnChange = TreeViewChange
    OnExpanding = TreeViewExpanding
    Items.Data = {
      050000001F0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
      06D7CAB2FAC0E01F0000000000000000000000FFFFFFFFFFFFFFFF0000000000
      00000006B8BAD5AEC0E01F0000000000000000000000FFFFFFFFFFFFFFFF0000
      00000000000006C8A8D2E6C0E01F0000000000000000000000FFFFFFFFFFFFFF
      FF000000000000000006B3C9B1BEC0E01F0000000000000000000000FFFFFFFF
      FFFFFFFF000000000000000006CBF0D2E6C0E0}
  end
  inherited DataSource: TDataSource
    DataSet = ADODataSet
  end
  object ADODataSet: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    BeforeOpen = ADODataSetBeforeOpen
    CommandText = 'SELECT * FROM fn_FNSubjectDetails(:SubID, :BeginDate, :EndDate)'
    Parameters = <
      item
        Name = 'SubID'
        DataType = ftInteger
        Size = -1
        Value = Null
      end
      item
        Name = 'BeginDate'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end
      item
        Name = 'EndDate'
        DataType = ftDateTime
        Size = -1
        Value = Null
      end>
    Left = 184
    Top = 72
    object ADODataSetDate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
    end
    object ADODataSetCredType: TStringField
      DisplayLabel = #31867#22411
      FieldName = 'CredType'
      Size = 8
    end
    object ADODataSetCredNo: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'CredNo'
    end
    object ADODataSetBrief: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'Brief'
      Size = 30
    end
    object ADODataSetDebit: TBCDField
      DisplayLabel = #20511#26041
      FieldName = 'Debit'
      currency = True
      Precision = 19
    end
    object ADODataSetCredit: TBCDField
      DisplayLabel = #36151#26041
      FieldName = 'Credit'
      currency = True
      Precision = 19
    end
    object ADODataSetDebitCredit: TStringField
      DisplayLabel = #26041#21521
      FieldName = 'DebitCredit'
      Size = 8
    end
    object ADODataSetBalance: TBCDField
      DisplayLabel = #20313#39069
      FieldName = 'Balance'
      currency = True
      Precision = 19
    end
  end
  object adsSubject: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'DASubject'
    IndexFieldNames = 'SubCode'
    Parameters = <>
    Left = 256
    Top = 192
  end
end
