inherited FNAssetReptFrom: TFNAssetReptFrom
  Left = 53
  Top = 7
  Width = 725
  Height = 558
  Caption = #36164#20135#31649#29702#26597#35810#12290
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
          FieldName = #36164#20135#32534#21495
          Title.Alignment = taCenter
          Width = 120
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
          FieldName = #25152#23646#37096#38376
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
          FieldName = #21407#20540
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39044#35745#27531#20540
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25240#26087#29575
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25240#26087#37329#39069
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36164#20135#20928#20540
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
      Caption = #36164#20135#24635#34920
      TabOrder = 2
      object Label1: TLabel
        Left = 23
        Top = 23
        Width = 48
        Height = 12
        Caption = #25253#21578#26085#26399
      end
      object Label2: TLabel
        Left = 194
        Top = 40
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
        Visible = False
      end
      object DateTimePicker1: TDateTimePicker
        Left = 80
        Top = 19
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
      end
      object DateTimePicker2: TDateTimePicker
        Left = 255
        Top = 36
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
        Left = 383
        Top = 34
        Width = 75
        Height = 25
        Caption = #25191#34892#32467#26524
        TabOrder = 2
        Visible = False
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
      'select b.ID, b.Code ['#36164#20135#32534#21495'], b.brief ['#36164#20135#21517#31216'],'#13#10'c.name as ['#25152#23646#37096#38376'],'#13#10 +
      'd.name ['#20855#20307#36164#20135'],a.GoodsSpec ['#35268#26684#22411#21495'],'#13#10'a.Amount ['#21407#20540'],a.GoalQuantity ' +
      '['#39044#35745#27531#20540'],'#13#10'a.SundryFee ['#25240#26087#29575'],e.DepAmount ['#25240#26087#37329#39069'],'#13#10'(a.Amount-e.DepA' +
      'mount) as  ['#36164#20135#20928#20540'] '#13#10'from FAAssetAddDetail a '#13#10'left outer join FA' +
      'AssetAddMaster b on b.ID=a.MasterID'#13#10'left outer join MSDepartmen' +
      't c on c.ID=b.ClientID'#13#10'left outer join DAGoods d on d.ID=a.Good' +
      'sID'#13#10'left outer join '#13#10'( select GoodsID,PackUnitID,sum(isnull(Am' +
      'ount,0)) as DepAmount'#13#10'from FADepreciationDetail a  '#13#10'left outer' +
      ' join FADepreciationMaster b on b.ID=a.MasterID'#13#10'where b.Records' +
      'tate<>'#39#21024#38500#39'  '#13#10'group by GoodsID,PackUnitID )   e on e.PackUnitID=' +
      'b.ID'#13#10'where b.Recordstate<>'#39#21024#38500#39' and a.GoodsID<>0'#13#10
    Parameters = <>
    Left = 268
    Top = 260
    object adsMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsMasterDSDesigner: TStringField
      FieldName = #36164#20135#32534#21495
      Required = True
    end
    object adsMasterDSDesigner2: TStringField
      FieldName = #36164#20135#21517#31216
      Required = True
      Size = 30
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #25152#23646#37096#38376
      Required = True
      Size = 30
    end
    object adsMasterDSDesigner4: TStringField
      FieldName = #20855#20307#36164#20135
      Required = True
      Size = 30
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #35268#26684#22411#21495
      Required = True
      Size = 30
    end
    object adsMasterDSDesigner6: TBCDField
      FieldName = #21407#20540
      Required = True
      currency = True
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner7: TBCDField
      FieldName = #39044#35745#27531#20540
      Required = True
      currency = True
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner8: TBCDField
      FieldName = #25240#26087#29575
      Required = True
      DisplayFormat = '#,#.00%'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner9: TBCDField
      FieldName = #25240#26087#37329#39069
      Required = True
      currency = True
      Precision = 32
      Size = 5
    end
    object adsMasterDSDesigner10: TBCDField
      FieldName = #36164#20135#20928#20540
      ReadOnly = True
      Required = True
      currency = True
      Precision = 32
      Size = 5
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 200
    Top = 264
  end
end
