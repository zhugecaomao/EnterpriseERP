inherited FNProfitLossForm: TFNProfitLossForm
  Left = 106
  Top = 32
  Width = 725
  Height = 533
  Caption = #33829#19994#21033#28070#26597#35810
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 717
    ButtonWidth = 55
    object ToolButton4: TToolButton
      Left = 0
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton5: TToolButton
      Left = 55
      Top = 2
      Action = PrintAction
    end
    object ToolButton11: TToolButton
      Left = 110
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 118
      Top = 2
      Action = ExportAction
    end
    object ToolButton12: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
      Visible = False
    end
    object ToolButton7: TToolButton
      Left = 181
      Top = 2
      Action = FiltrateAction
      Enabled = False
      Visible = False
    end
    object ToolButton1: TToolButton
      Left = 236
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton8: TToolButton
      Left = 291
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 354
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 717
    Height = 465
    inherited PageControl: TPageControl
      Top = 438
      Width = 717
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #33829#19994#21033#28070#26597#35810
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 60
      Width = 717
      Height = 378
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #39033#30446
          Title.Alignment = taCenter
          Width = 395
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37329#39069
          Title.Alignment = taCenter
          Width = 268
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 60
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object Label1: TLabel
        Left = 19
        Top = 29
        Width = 48
        Height = 12
        Caption = #24320#22987#26085#26399
      end
      object Label2: TLabel
        Left = 211
        Top = 29
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
      end
      object Label3: TLabel
        Left = 19
        Top = 8
        Width = 96
        Height = 12
        Caption = #21033#28070#26597#35810#26102#38388#27573#65306
      end
      object DateTimePicker1: TDateTimePicker
        Left = 76
        Top = 25
        Width = 100
        Height = 20
        CalAlignment = dtaLeft
        Date = 37596.1952293866
        Time = 37596.1952293866
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
        OnChange = DateTimePicker1Change
      end
      object DateTimePicker2: TDateTimePicker
        Left = 272
        Top = 25
        Width = 100
        Height = 20
        CalAlignment = dtaLeft
        Date = 37596.1954960764
        Time = 37596.1954960764
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        OnChange = DateTimePicker2Change
      end
      object BitBtn1: TBitBtn
        Left = 400
        Top = 23
        Width = 75
        Height = 25
        Caption = #25191#34892#32467#26524
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
  end
  inherited ActionList: TActionList
    Left = 91
    Top = 205
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 54
    Top = 202
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select memo as ['#39033#30446'], amountd as ['#37329#39069']'#13#10'from FNExpenseMaster '#13#10'whe' +
      're 1=2'#13#10
    Parameters = <>
    Left = 236
    Top = 196
    object adsMasterDSDesigner: TStringField
      FieldName = #39033#30446
      Size = 60
    end
    object adsMasterDSDesigner2: TBCDField
      FieldName = #37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
  end
end
