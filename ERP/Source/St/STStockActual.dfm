inherited STStockActualFrom: TSTStockActualFrom
  Left = 62
  Top = 189
  Width = 725
  Height = 533
  Caption = #23454#26102#24211#23384#21830#21697#34920
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = nil
  OnDestroy = nil
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
    object ToolButton8: TToolButton
      Left = 236
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 291
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 299
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
        Caption = #23454#26102#24211#23384#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 53
      Width = 717
      Height = 385
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #20179#24211#21517#31216
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21830#21697#21517#31216
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#20301
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#20215
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25968#37327
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37329#39069
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26631#20934#21333#20301
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26631#20934#21333#20215
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26631#20934#25968#37327
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 53
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object Label2: TLabel
        Left = 491
        Top = 13
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
        Visible = False
      end
      object Label3: TLabel
        Left = 19
        Top = 20
        Width = 108
        Height = 12
        Caption = #24211#23384#21830#21697#25253#21578#26085#26399#65306
      end
      object DateTimePicker1: TDateTimePicker
        Left = 126
        Top = 16
        Width = 98
        Height = 20
        CalAlignment = dtaLeft
        Date = 37596.1952293866
        Time = 37596.1952293866
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 552
        Top = 9
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
        Visible = False
      end
      object BitBtn1: TBitBtn
        Left = 264
        Top = 14
        Width = 75
        Height = 25
        Caption = #25191#34892#32467#26524
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
  end
  inherited ActionList: TActionList
    Left = 99
    Top = 213
  end
  inherited DataSource: TDataSource
    DataSet = adsStockChange
    Left = 62
    Top = 210
  end
  object adsStockChange: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select   d.name as ['#20179#24211#21517#31216'] ,      '#13#10'       c.name  as ['#21830#21697#21517#31216'], '#13#10' ' +
      '      e.name  as ['#21333#20301'] ,  '#13#10'       [PriceBase] as ['#21333#20215']  ,        ' +
      '   '#13#10'       [Quantity] as ['#25968#37327'] ,'#13#10'       [Amount] as ['#37329#39069'] ,'#13#10'   ' +
      '    e.name  as ['#26631#20934#21333#20301'] ,        '#13#10'       [PriceBase] as ['#26631#20934#21333#20215']  ,' +
      '         '#13#10'       [Quantity] as ['#26631#20934#25968#37327']   '#13#10'from PCPurchaseDetail' +
      ' a '#13#10'left outer join PCPurchaseMaster b on b.Id=a.MasterID   '#13#10'l' +
      'eft outer join DAGoods  c on b.Id=a.GoodsID  '#13#10'left outer join S' +
      'TWarehouse  d on d.Id=b.warehouseID  '#13#10'left outer join MSUnit  e' +
      ' on d.Id=a.GoalUnitID  '#13#10'left outer join MSUnit  f on d.Id=a.Pac' +
      'kunitID  '#13#10'where 1=2'#13#10
    Parameters = <>
    Left = 284
    Top = 228
    object adsStockChangeDSDesigner: TStringField
      FieldName = #20179#24211#21517#31216
      Size = 30
    end
    object adsStockChangeDSDesigner2: TStringField
      FieldName = #21830#21697#21517#31216
      Size = 30
    end
    object adsStockChangeDSDesigner3: TStringField
      FieldName = #21333#20301
    end
    object adsStockChangeDSDesigner4: TBCDField
      FieldName = #21333#20215
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsStockChangeDSDesigner5: TBCDField
      FieldName = #25968#37327
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsStockChangeDSDesigner6: TBCDField
      FieldName = #37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsStockChangeDSDesigner7: TStringField
      FieldName = #26631#20934#21333#20301
    end
    object adsStockChangeDSDesigner8: TBCDField
      FieldName = #26631#20934#21333#20215
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsStockChangeDSDesigner9: TBCDField
      FieldName = #26631#20934#25968#37327
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 192
    Top = 224
  end
end
