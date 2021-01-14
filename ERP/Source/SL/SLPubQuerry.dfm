inherited SLPubQuerryFrom: TSLPubQuerryFrom
  Left = 74
  Top = 102
  Width = 697
  Height = 338
  Caption = #19994#21153#26597#35810#32467#26524
  Position = poMainFormCenter
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 689
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
      Enabled = False
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = EditAction
      Enabled = False
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = DeleteAction
      Enabled = False
    end
    object ToolButton10: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
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
    object ToolButton11: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton12: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton8: TToolButton
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
    object ToolButton9: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 689
    Height = 270
    inherited PageControl: TPageControl
      Top = 243
      Width = 689
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #19994#21153#26597#35810#32467#26524
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 689
      Height = 243
      FooterRowCount = 1
    end
  end
  inherited ActionList: TActionList
    Left = 371
    Top = 77
  end
  inherited DataSource: TDataSource
    DataSet = adsPubQuerry
    Left = 206
    Top = 106
  end
  object adsPubQuerry: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select *'#13#10'from   MSEmployee  '#13#10'where 1=2 '
    Parameters = <>
    Left = 140
    Top = 108
  end
end
