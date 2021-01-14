inherited STBrStockCostForm: TSTBrStockCostForm
  Left = 73
  Top = 144
  Caption = #23384#36135#25104#26412#32467#31639
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
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
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
    object ToolButton13: TToolButton
      Left = 464
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #23384#36135#25104#26412#32467#31639
      end
    end
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 88
    Top = 112
  end
end
