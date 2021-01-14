inherited SLSaleFruitListForm: TSLSaleFruitListForm
  Left = -4
  Top = -4
  Width = 812
  Height = 612
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #38144#21806#25490#34892#27036
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 804
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
    end
    object ToolButton7: TToolButton
      Left = 181
      Top = 2
      Action = FiltrateAction
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
    Top = 141
    Width = 804
    Height = 444
    inherited PageControl: TPageControl
      Top = 417
      Width = 804
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #38144#21806#25490#34892#27036#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 804
      Height = 417
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 41
    Width = 804
    Height = 100
    Align = alTop
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 20
      Top = 46
      Width = 60
      Height = 12
      Caption = #25490#34892#26041#24335#65306
    end
    object Label2: TLabel
      Left = 224
      Top = 18
      Width = 48
      Height = 12
      Caption = #32467#26463#26085#26399
    end
    object Label3: TLabel
      Left = 19
      Top = 17
      Width = 66
      Height = 12
      Caption = #25490#34892#26102#38388#27573':'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 89
      Top = 14
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
      Left = 285
      Top = 14
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
      Left = 81
      Top = 68
      Width = 79
      Height = 20
      Caption = #23458#25143#37329#39069
      TabOrder = 7
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 407
      Top = 68
      Width = 79
      Height = 20
      Caption = #19994#21153#21592
      TabOrder = 8
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 162
      Top = 68
      Width = 79
      Height = 20
      Caption = #21697#31181#37329#39069
      TabOrder = 9
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 244
      Top = 68
      Width = 79
      Height = 20
      Caption = #22320#21306#37329#39069
      TabOrder = 10
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 325
      Top = 68
      Width = 79
      Height = 20
      Caption = #21830#21697#20998#31867#37329#39069
      TabOrder = 11
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 81
      Top = 42
      Width = 79
      Height = 20
      Caption = #23458#25143#38144#21806#25968#37327
      TabOrder = 2
      OnClick = BitBtn6Click
    end
    object BitBtn7: TBitBtn
      Left = 162
      Top = 42
      Width = 79
      Height = 20
      Caption = #21697#31181#25968#37327
      TabOrder = 3
      OnClick = BitBtn7Click
    end
    object BitBtn8: TBitBtn
      Left = 244
      Top = 42
      Width = 79
      Height = 20
      Caption = #22320#21306#25968#37327
      TabOrder = 4
      OnClick = BitBtn8Click
    end
    object BitBtn9: TBitBtn
      Left = 325
      Top = 42
      Width = 79
      Height = 20
      Caption = #21830#21697#20998#31867#25968#37327
      TabOrder = 5
      OnClick = BitBtn9Click
    end
    object BitBtn10: TBitBtn
      Left = 407
      Top = 42
      Width = 79
      Height = 20
      Caption = #26102#38388#27573#25490#34892
      TabOrder = 6
      OnClick = BitBtn10Click
    end
    object BitBtn11: TBitBtn
      Left = 489
      Top = 42
      Width = 79
      Height = 20
      Caption = #22320#21306#27719#24635#25968#37327
      TabOrder = 12
      OnClick = BitBtn11Click
    end
    object BitBtn12: TBitBtn
      Left = 489
      Top = 68
      Width = 79
      Height = 20
      Caption = #22320#21306#27719#24635#37329#39069
      TabOrder = 13
      OnClick = BitBtn12Click
    end
  end
  object BitBtn13: TBitBtn [3]
    Left = 576
    Top = 108
    Width = 79
    Height = 20
    Caption = #20998#31867#27719#24635#37329#39069
    TabOrder = 3
    OnClick = BitBtn13Click
  end
  object BitBtn14: TBitBtn [4]
    Left = 576
    Top = 82
    Width = 79
    Height = 20
    Caption = #20998#31867#27719#24635#25968#37327
    TabOrder = 4
    OnClick = BitBtn14Click
  end
  inherited ActionList: TActionList
    Left = 83
    Top = 221
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 46
    Top = 218
  end
  inherited WsBrowsePop: TPopupMenu
    Top = 152
  end
  object adsMaster: TADODataSet
    AutoCalcFields = False
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    BeforeOpen = adsMasterBeforeOpen
    AfterOpen = adsMasterAfterOpen
    CommandText = 'select * from DAClient'#13#10'where 1=2'
    Parameters = <>
    Left = 140
    Top = 220
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 232
    Top = 224
  end
end
