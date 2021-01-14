inherited WSTreeViewForm: TWSTreeViewForm
  Left = 215
  Top = 115
  Width = 503
  Height = 345
  Caption = 'WSTreeViewForm'
  FormStyle = fsMDIChild
  OldCreateOrder = True
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object TreeView: TTreeView
    Left = 0
    Top = 41
    Width = 495
    Height = 277
    Align = alClient
    Indent = 19
    MultiSelect = True
    PopupMenu = PopupMenu1
    ReadOnly = True
    TabOrder = 0
  end
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 495
    Height = 41
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
  end
  object ActionList: TActionList
    Images = CommonData.ilToolBtn
    Left = 66
    Top = 57
    object AddNewAction: TAction
      Caption = #22686#21152'(&N)...'
      Hint = #22686#21152
      ImageIndex = 0
      OnExecute = AddNewActionExecute
    end
    object EditAction: TAction
      Caption = #20462#25913'(&E)...'
      Hint = #20462#25913
      ImageIndex = 2
      OnExecute = EditActionExecute
    end
    object DeleteAction: TAction
      Caption = #21024#38500'(&D)...'
      Hint = #21024#38500
      ImageIndex = 1
      OnExecute = DeleteActionExecute
    end
    object PrintPreviewAction: TAction
      Caption = #25171#21360#39044#35272'(&V)'
      Hint = #25171#21360#39044#35272
      ImageIndex = 5
    end
    object PrintAction: TAction
      Caption = #25171#21360'(&P)'
      Hint = #25171#21360
      ImageIndex = 4
    end
    object ExportAction: TAction
      Caption = #23548#20986'(&E)'
      Hint = #23548#20986
      ImageIndex = 6
    end
    object RefreshAction: TAction
      Caption = #21047#26032'(R)'
      Hint = #21047#26032
      ImageIndex = 7
      OnExecute = RefreshActionExecute
    end
    object ExitAction: TAction
      Caption = #20851#38381'(&X)'
      Hint = #20851#38381
      ImageIndex = 9
      OnExecute = ExitActionExecute
    end
  end
  object DataSource: TDataSource
    OnDataChange = DataSourceDataChange
    Left = 128
    Top = 57
  end
  object PopupMenu1: TPopupMenu
    AutoHotkeys = maManual
    Left = 200
    Top = 100
    object N1: TMenuItem
      Action = AddNewAction
    end
    object N2: TMenuItem
      Action = EditAction
    end
    object N3: TMenuItem
      Action = DeleteAction
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      Action = RefreshAction
      AutoHotkeys = maManual
      AutoLineReduction = maManual
    end
  end
end
