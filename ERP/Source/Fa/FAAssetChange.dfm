inherited FAAssetChangeFrom: TFAAssetChangeFrom
  Left = 19
  Top = 14
  Width = 725
  Height = 558
  Caption = #36164#20135#21464#21160#26597#35810#12290
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
    Height = 490
    inherited PageControl: TPageControl
      Top = 463
      Width = 717
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #36164#20135#27719#24635#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 60
      Width = 717
      Height = 403
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
          FieldName = #21464#21160#31867#21035
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36164#20135#21517#31216
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36164#20135#31867#21035
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36164#20135#35828#26126
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36164#20135#22791#27880
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20855#20307#36164#20135
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
          FieldName = #36164#20135#21407#20540
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36164#20135#26126#32454#22791#27880
          Title.Alignment = taCenter
          Width = 120
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
        Left = 23
        Top = 31
        Width = 48
        Height = 12
        Caption = #25253#21578#26085#26399
      end
      object Label2: TLabel
        Left = 194
        Top = 31
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
      end
      object Label3: TLabel
        Left = 24
        Top = 8
        Width = 72
        Height = 12
        Caption = #36164#20135#21464#21160#24635#34920
      end
      object DateTimePicker1: TDateTimePicker
        Left = 80
        Top = 27
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
        Left = 255
        Top = 27
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
        Left = 383
        Top = 27
        Width = 75
        Height = 20
        Caption = #25191#34892#32467#26524
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
  end
  inherited ActionList: TActionList
    Left = 147
    Top = 261
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 46
    Top = 218
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select b.code ['#32534#21495'],b.date ['#26085#26399'],b.BillMode ['#21464#21160#31867#21035'] ,'#13#10'b.Brief ['#36164#20135#21517 +
      #31216'],b.Apportion ['#36164#20135#31867#21035'],'#13#10'b.Deliver ['#36164#20135#35828#26126'],b.memo ['#36164#20135#22791#27880'],'#13#10'c.name ' +
      '['#20855#20307#36164#20135'],a.GoodsSpec ['#35268#26684#22411#21495'],'#13#10'a.Amount ['#36164#20135#21407#20540'],a.Memo ['#36164#20135#26126#32454#22791#27880']'#13#10'fro' +
      'm FAAssetAddDetail a '#13#10'left outer join FAAssetAddMaster b on b.i' +
      'd=a.masterID'#13#10'left outer join DAGoods c on c.id=a.GoodsID'#13#10'where' +
      ' 1=11'#13#10'union all'#13#10#13#10'select b.code ['#32534#21495'],b.date ['#26085#26399'],b.BillMode ['#21464 +
      #21160#31867#21035'] ,'#13#10'b.Brief ['#36164#20135#21517#31216'],b.Apportion ['#36164#20135#31867#21035'],'#13#10'b.Deliver ['#36164#20135#35828#26126'],b.m' +
      'emo ['#36164#20135#22791#27880'],'#13#10'c.name ['#20855#20307#36164#20135'],a.GoodsSpec ['#35268#26684#22411#21495'],'#13#10'a.Amount ['#36164#20135#21407#20540'],' +
      'a.Memo ['#36164#20135#26126#32454#22791#27880']'#13#10'from FAAssetReduceDetail a '#13#10'left outer join FA' +
      'AssetReduceMaster b on b.id=a.masterID'#13#10'left outer join DAGoods ' +
      'c on c.id=a.GoodsID'#13#10'where 1=11'
    Parameters = <>
    Left = 268
    Top = 260
    object adsMasterDSDesigner: TStringField
      FieldName = #32534#21495
      ReadOnly = True
    end
    object adsMasterDSDesigner2: TDateTimeField
      FieldName = #26085#26399
      ReadOnly = True
    end
    object adsMasterDSDesigner11: TStringField
      FieldName = #21464#21160#31867#21035
      ReadOnly = True
      Size = 16
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #36164#20135#21517#31216
      ReadOnly = True
      Size = 30
    end
    object adsMasterDSDesigner4: TStringField
      FieldName = #36164#20135#31867#21035
      ReadOnly = True
      Size = 12
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #36164#20135#35828#26126
      ReadOnly = True
      Size = 30
    end
    object adsMasterDSDesigner6: TStringField
      FieldName = #36164#20135#22791#27880
      ReadOnly = True
      Size = 60
    end
    object adsMasterDSDesigner7: TStringField
      FieldName = #20855#20307#36164#20135
      ReadOnly = True
      Size = 30
    end
    object adsMasterDSDesigner8: TStringField
      FieldName = #35268#26684#22411#21495
      ReadOnly = True
      Size = 30
    end
    object adsMasterDSDesigner9: TBCDField
      FieldName = #36164#20135#21407#20540
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner10: TStringField
      FieldName = #36164#20135#26126#32454#22791#27880
      ReadOnly = True
      Size = 30
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 200
    Top = 264
  end
end
