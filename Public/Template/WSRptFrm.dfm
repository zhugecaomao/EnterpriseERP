inherited WSReportForm: TWSReportForm
  Caption = 'WSReportForm'
  PixelsPerInch = 96
  TextHeight = 12
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 688
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
  object ActionList: TActionList
    Images = CommonData.ilToolBtn
    Left = 16
    Top = 88
    object ViewDetailsAction: TAction
      Caption = #26126#32454'(&V)'
      Hint = #26126#32454
      ImageIndex = 2
    end
    object PrintPreviewAction: TAction
      Caption = #25171#21360#39044#35272
      Hint = #25171#21360#39044#35272
      ImageIndex = 3
    end
    object PrintAction: TAction
      Caption = #25171#21360
      Hint = #25171#21360
      ImageIndex = 4
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
    end
    object RefreshAction: TAction
      Caption = #21047#26032
      Hint = #21047#26032
      ImageIndex = 7
    end
    object ExitAction: TAction
      Caption = #20851#38381
      Hint = #20851#38381
      ImageIndex = 8
    end
  end
  object DataSource: TDataSource
    Left = 48
    Top = 88
  end
end
