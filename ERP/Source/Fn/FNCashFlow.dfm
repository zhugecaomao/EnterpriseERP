inherited FNCashFlowForm: TFNCashFlowForm
  Left = 65
  Top = 177
  Width = 725
  Height = 533
  Caption = #29616#37329#27969#37327#34920
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnDeactivate = FormDeactivate
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
    Width = 717
    Height = 465
    inherited PageControl: TPageControl
      Top = 438
      Width = 717
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #29616#37329#27969#37327#34920
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
          FieldName = #24080#25143#21517#31216
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#31867#22411
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26399#21021#20313#39069
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26412#26399#25910#20837
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26412#26399#25903#20986
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26399#26411#20313#39069
          Title.Alignment = taCenter
          Width = 200
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
        Caption = #29616#37329#27969#21160#26102#38388#27573#65306
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
    DataSet = adsStockChange
    Left = 46
    Top = 218
  end
  object adsStockChange: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select '#13#10'b.name ['#24080#25143#21517#31216'], BillMode as ['#19994#21153#31867#22411'],'#13#10'Amountc as ['#26399#21021#20313#39069'], ' +
      'AmountD as ['#26412#26399#25910#20837'], '#13#10'AmountC as ['#26412#26399#25903#20986'], Amountd as ['#26399#26411#20313#39069']'#13#10'from ' +
      'FNCashOutInMaster a   Left outer join FNAccounts b '#13#10'on b.id=a.a' +
      'ccountsID'#13#10'where 1=2'
    Parameters = <>
    Left = 212
    Top = 236
    object adsStockChangeDSDesigner: TStringField
      FieldName = #24080#25143#21517#31216
      Size = 40
    end
    object adsStockChangeDSDesigner2: TStringField
      FieldName = #19994#21153#31867#22411
      Size = 16
    end
    object adsStockChangeDSDesigner3: TBCDField
      FieldName = #26399#21021#20313#39069
      currency = True
      Precision = 19
    end
    object adsStockChangeDSDesigner4: TBCDField
      FieldName = #26412#26399#25910#20837
      currency = True
      Precision = 19
    end
    object adsStockChangeDSDesigner5: TBCDField
      FieldName = #26412#26399#25903#20986
      currency = True
      Precision = 19
    end
    object adsStockChangeDSDesigner6: TBCDField
      FieldName = #26399#26411#20313#39069
      currency = True
      Precision = 19
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 128
    Top = 224
  end
end
