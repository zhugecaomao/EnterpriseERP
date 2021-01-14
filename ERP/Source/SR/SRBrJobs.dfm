inherited SRBrJobsForm: TSRBrJobsForm
  Left = 92
  Top = 185
  Caption = #35745#20214#39033#30446
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = EditAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = DeleteAction
    end
    object ToolButton6: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton5: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton12: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton14: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton10: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #35745#20214#39033#30446#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#21517#31216
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Brief'
          Title.Alignment = taCenter
          Title.Caption = #31867#21035
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PriceBase'
          Title.Alignment = taCenter
          Title.Caption = #24037#20215
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Memo'
          Title.Alignment = taCenter
          Title.Caption = #22791#27880
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 226
    Top = 107
  end
  inherited DataSource: TDataSource
    DataSet = tblDABrPOClear
    Left = 258
    Top = 107
  end
  object tblDABrPOClear: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    TableName = 'SRJobs'
    Left = 157
    Top = 85
    object tblDABrPOClearID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblDABrPOClearCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblDABrPOClearCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblDABrPOClearRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblDABrPOClearName: TStringField
      FieldName = 'Name'
    end
    object tblDABrPOClearBrief: TStringField
      FieldName = 'Brief'
      Size = 30
    end
    object tblDABrPOClearPriceBase: TBCDField
      FieldName = 'PriceBase'
      Precision = 19
      Size = 5
    end
    object tblDABrPOClearMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
  end
end
