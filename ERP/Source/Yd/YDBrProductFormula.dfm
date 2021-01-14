inherited YDProductFormulaBrowseForm: TYDProductFormulaBrowseForm
  Left = 154
  Top = 145
  Caption = #29289#26009#28165#21333
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
      Action = DeleteAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = EditAction
    end
    object ToolButton4: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Hint = #22686#21152
      Caption = #22686#21152
      ImageIndex = 0
      Style = tbsSeparator
      OnClick = AddNewActionExecute
    end
    object ToolButton5: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton9: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton11: TToolButton
      Left = 409
      Top = 2
      Action = RefreshAction
    end
    object ToolButton12: TToolButton
      Left = 464
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #29289#26009#28165#21333
      end
    end
  end
  inherited DataSource: TDataSource
    DataSet = adsYDProductFormula
  end
  object adsYDProductFormula: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'SELECT * FROM YDProductFormulaMaster  WHERE RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 80
    Top = 112
    object adsYDProductFormulaID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsYDProductFormulaCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsYDProductFormulaCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsYDProductFormulaRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsYDProductFormulaCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object adsYDProductFormulaDate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
    end
    object adsYDProductFormulaFormulaClass: TStringField
      DisplayLabel = #24403#37327#31867#21035
      FieldName = 'FormulaClass'
    end
    object adsYDProductFormulaBrief: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'Brief'
      Size = 30
    end
    object adsYDProductFormulaMemo: TMemoField
      FieldName = 'Memo'
      Visible = False
      BlobType = ftMemo
    end
  end
end
