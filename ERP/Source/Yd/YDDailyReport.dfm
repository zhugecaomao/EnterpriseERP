inherited YDDailyReportForm: TYDDailyReportForm
  Left = 64
  Top = 161
  Width = 725
  Height = 533
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #29983#20135#26085#25253
  Position = poMainFormCenter
  OnActivate = FormActivate
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
        Caption = #29983#20135#26085#25253#34920
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 86
      Width = 717
      Height = 352
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25688#35201
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#31867#21035
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #29983#20135#35745#21010#32534#21495
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20135#21697#21517#31216
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35268#26684#22411#21495
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
          FieldName = #21333#20301
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#20301#25104#26412
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25104#26412#37329#39069
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 86
      Align = alTop
      Caption = #29983#20135#26085#25253#34920
      TabOrder = 2
      object Label3: TLabel
        Left = 19
        Top = 17
        Width = 48
        Height = 12
        Caption = #29983#20135#26085#26399
      end
      object Label2: TLabel
        Left = 19
        Top = 48
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
      end
      object DateTimePicker1: TDateTimePicker
        Left = 76
        Top = 13
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
      object BitBtn1: TBitBtn
        Left = 192
        Top = 44
        Width = 75
        Height = 21
        Caption = #25191#34892#32467#26524
        TabOrder = 1
        OnClick = BitBtn1Click
      end
      object DateTimePicker2: TDateTimePicker
        Left = 77
        Top = 44
        Width = 100
        Height = 20
        CalAlignment = dtaLeft
        Date = 37596.1954960764
        Time = 37596.1954960764
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 2
        OnChange = DateTimePicker2Change
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
      'SELECT b.code ['#32534#21495'],b.Date ['#26085#26399'],'#13#10'b.brief ['#25688#35201'],b.BIllMode ['#19994#21153#31867#21035'],' +
      #13#10'c.code ['#29983#20135#35745#21010#32534#21495'],'#13#10'd.name ['#20135#21697#21517#31216'],a.GoodsSpec ['#35268#26684#22411#21495'],'#13#10'a.Quantit' +
      'y ['#25968#37327'],e.name ['#21333#20301'],'#13#10'a.PriceBase ['#21333#20301#25104#26412'],a.Amount ['#25104#26412#37329#39069']'#13#10'FROM '#13#10 +
      'YDGoodsInDetail A'#13#10'left outer join  YDGoodsInMaster  B on b.ID=a' +
      '.Masterid'#13#10'left outer join  YDProductPlanMaster  c on c.ID=b.Ori' +
      'ginID'#13#10'left outer join  DAGoods  d on d.ID=a.GoodsID'#13#10'left outer' +
      ' join  MSUnit   e on e.ID=a.PackunitID'#13#10'where b.recordstate<>'#39#21024#38500 +
      #39' and a.goodsid<>0'#13#10'and  1=2'#13#10
    Parameters = <>
    Left = 140
    Top = 220
    object adsMasterDSDesigner: TStringField
      FieldName = #32534#21495
      ReadOnly = True
    end
    object adsMasterDSDesigner2: TDateTimeField
      FieldName = #26085#26399
      ReadOnly = True
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #25688#35201
      ReadOnly = True
      Size = 30
    end
    object adsMasterDSDesigner4: TStringField
      FieldName = #19994#21153#31867#21035
      ReadOnly = True
      Size = 16
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #29983#20135#35745#21010#32534#21495
      ReadOnly = True
    end
    object adsMasterDSDesigner6: TStringField
      FieldName = #20135#21697#21517#31216
      ReadOnly = True
      Size = 30
    end
    object adsMasterDSDesigner7: TStringField
      FieldName = #35268#26684#22411#21495
      ReadOnly = True
      Size = 30
    end
    object adsMasterDSDesigner8: TBCDField
      FieldName = #25968#37327
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner9: TStringField
      FieldName = #21333#20301
      ReadOnly = True
    end
    object adsMasterDSDesigner10: TBCDField
      FieldName = #21333#20301#25104#26412
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner11: TBCDField
      FieldName = #25104#26412#37329#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 208
    Top = 232
  end
end
