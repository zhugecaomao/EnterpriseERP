inherited FNBalanceSheetForm: TFNBalanceSheetForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #24635#24080#20313#39069#26597#35810
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 800
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
    Width = 800
    Height = 512
    inherited PageControl: TPageControl
      Top = 485
      Width = 800
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #24635#24080#20313#39069#26597#35810
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 60
      Width = 800
      Height = 425
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #24207#21495
          Title.Alignment = taCenter
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39033#30446#21517#31216
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26399#21021#20511#26041#20313#39069
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26399#21021#36151#26041#20313#39069
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26412#26399#20511#26041#21457#29983
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26412#26399#36151#26041#21457#29983
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26399#26411#20511#26041#20313#39069
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26399#26411#36151#26041#20313#39069
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 800
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
        Width = 90
        Height = 12
        Caption = #24635#24080#26597#35810#26102#38388#27573':'
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
    Left = 83
    Top = 221
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 46
    Top = 218
  end
  object adsMaster: TADODataSet
    AutoCalcFields = False
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      ' select id as ['#24207#21495'],'#13#10'          Memo  as ['#39033#30446#21517#31216'],'#13#10'         Amount' +
      ' as  ['#26399#21021#20511#26041#20313#39069'], '#13#10'         Amount as  ['#26399#21021#36151#26041#20313#39069'], '#13#10'         Amount' +
      ' as  ['#26412#26399#20511#26041#21457#29983'],'#13#10'         Amount as  ['#26412#26399#36151#26041#21457#29983'],'#13#10'         Amount a' +
      's  ['#26399#26411#20511#26041#20313#39069'],'#13#10'         Amount as  ['#26399#26411#36151#26041#20313#39069'] '#13#10'         from  FNEx' +
      'penseDetail '#13#10'where 1=2'
    Parameters = <>
    Left = 140
    Top = 220
    object adsMasterDSDesigner: TAutoIncField
      FieldName = #24207#21495
      ReadOnly = True
      Visible = False
    end
    object adsMasterDSDesigner2: TStringField
      FieldName = #39033#30446#21517#31216
      Size = 30
    end
    object adsMasterDSDesigner3: TBCDField
      FieldName = #26399#21021#20511#26041#20313#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner4: TBCDField
      FieldName = #26399#21021#36151#26041#20313#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner5: TBCDField
      FieldName = #26412#26399#20511#26041#21457#29983
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner6: TBCDField
      FieldName = #26412#26399#36151#26041#21457#29983
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner7: TBCDField
      FieldName = #26399#26411#20511#26041#20313#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner8: TBCDField
      FieldName = #26399#26411#36151#26041#20313#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 232
    Top = 224
  end
end
