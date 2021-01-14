inherited YDStockInWorkFrom: TYDStockInWorkFrom
  Left = 127
  Top = 49
  Width = 643
  Height = 477
  Caption = #36710#38388#24211#23384#31649#29702
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 635
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
    Top = 89
    Width = 635
    Height = 361
    inherited PageControl: TPageControl
      Top = 334
      Width = 635
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #36710#38388#24211#23384#24773#20917
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 635
      Height = 334
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #29289#26009#21517#31216
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25968#37327
          Title.Alignment = taCenter
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#20301
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#20215
          Title.Alignment = taCenter
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25104#26412
          Title.Alignment = taCenter
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26631#20934#25968#37327
          Title.Alignment = taCenter
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26631#20934#21333#20215
          Title.Alignment = taCenter
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26631#20934#21333#20301
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end>
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 41
    Width = 635
    Height = 48
    Align = alTop
    BevelInner = bvSpace
    BevelOuter = bvLowered
    TabOrder = 2
    object Label1: TLabel
      Left = 211
      Top = 22
      Width = 48
      Height = 12
      Caption = #32467#26463#26085#26399
    end
    object Label4: TLabel
      Left = 19
      Top = 22
      Width = 48
      Height = 12
      Caption = #24320#22987#26085#26399
    end
    object DateTimePicker1: TDateTimePicker
      Left = 74
      Top = 18
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
      Top = 18
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
    object BitBtn2: TBitBtn
      Left = 400
      Top = 16
      Width = 75
      Height = 25
      Caption = #25191#34892#32467#26524
      TabOrder = 2
      OnClick = BitBtn1Click
    end
  end
  inherited ActionList: TActionList
    Left = 107
    Top = 229
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 86
    Top = 298
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select'#13#10'd.name as ['#29289#26009#21517#31216'], GoalQuantity as ['#25968#37327'],'#13#10'f.name as   ['#21333#20301 +
      '], pricebase as ['#21333#20215'],'#13#10'a.Amount as ['#25104#26412'],  GoalQuantity as ['#26631#20934#25968#37327']' +
      ','#13#10'pricebase as ['#26631#20934#21333#20215'], g.name as ['#26631#20934#21333#20301']'#13#10'from YDProductplanDeta' +
      'il a'#13#10'left outer join dagoods d on d.id=a.goodsid'#13#10'left outer jo' +
      'in msunit g on g.id=a.GoalunitID'#13#10'left outer join msunit f on f.' +
      'id=a.PackunitID'#13#10'where Quantity<>0 and 1=2'#13#10
    Parameters = <>
    Left = 172
    Top = 308
    object adsMasterDSDesigner: TStringField
      FieldName = #29289#26009#21517#31216
      Size = 30
    end
    object adsMasterDSDesigner2: TBCDField
      FieldName = #25968#37327
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #21333#20301
    end
    object adsMasterDSDesigner4: TBCDField
      FieldName = #21333#20215
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner5: TBCDField
      FieldName = #25104#26412
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner6: TBCDField
      FieldName = #26631#20934#25968#37327
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner7: TBCDField
      FieldName = #26631#20934#21333#20215
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner8: TStringField
      FieldName = #26631#20934#21333#20301
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 368
    Top = 224
  end
  object DataSource1: TDataSource
    DataSet = Adsgoodsin
    Left = 294
    Top = 146
  end
  object Adsgoodsin: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select GoodsID, b.name as goods,'#13#10'a.OriginID,c.code,  sum(isnull' +
      '(Quantity,0))'#13#10'as Quantity from (                               ' +
      '     '#13#10'select b.date,a.ID ,a.GoodsID,A.GoodsSpec, a.Quantity ,'#13#10 +
      'a.PackUnitID,a.QuantityPcs ,a.PriceBase ,               '#13#10'a.Amou' +
      'nt , a.GoalUnitID, a.GoalQuantity ,b.OriginID     '#13#10'from YDGoods' +
      'InDetail a                                  '#13#10'left outer join YD' +
      'GoodsInMaster b on b.ID=a.MasterID    '#13#10'where OriginID<>0 ) as a' +
      '                                '#13#10'left outer join Dagoods b on b' +
      '.id=a.Goodsid'#13#10'left outer join YDProductPlanMaster c on c.id=a.O' +
      'riginID'#13#10'where 1=21'#13#10'group by GoodsID,b.name,c.code,a.OriginID'
    Parameters = <>
    Left = 180
    Top = 132
    object AdsgoodsinGoodsID: TIntegerField
      FieldName = 'GoodsID'
    end
    object Adsgoodsingoods: TStringField
      FieldName = 'goods'
      Size = 30
    end
    object AdsgoodsinOriginID: TIntegerField
      FieldName = 'OriginID'
    end
    object Adsgoodsincode: TStringField
      FieldName = 'code'
    end
    object AdsgoodsinQuantity: TBCDField
      FieldName = 'Quantity'
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 32
      Size = 5
    end
  end
end
