inherited WSVoucherImportForm: TWSVoucherImportForm
  Left = 34
  Top = 171
  Width = 725
  Height = 533
  Caption = #20973#21333#24341#29992
  Menu = MainMenu1
  Position = poMainFormCenter
  Visible = False
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
        Caption = #20973#21333#24341#29992#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 89
      Width = 717
      Height = 349
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#31867#21035
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#25688#35201
          Title.Alignment = taCenter
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143'/'#21378#21830#21517#31216
          Title.Alignment = taCenter
          Width = 171
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21830#21697#21517#31216
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35268#26684#22411#21495
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26631#20934#21333#20301
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26631#20934#25968#37327
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#20215
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37329#39069
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21253#35013#21333#20301
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25968#37327
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#25163#20154
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 89
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object Label2: TLabel
        Left = 225
        Top = 56
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
        Visible = False
      end
      object Label3: TLabel
        Left = 30
        Top = 56
        Width = 48
        Height = 12
        Caption = #36807#28388#26102#38388
      end
      object Label1: TLabel
        Left = 30
        Top = 20
        Width = 48
        Height = 12
        Caption = #36873#25321#21333#25454
      end
      object DateTimePicker1: TDateTimePicker
        Left = 86
        Top = 52
        Width = 108
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
        Left = 286
        Top = 52
        Width = 108
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
        Left = 296
        Top = 16
        Width = 75
        Height = 20
        Caption = #21047#26032#32467#26524
        TabOrder = 2
        OnClick = BitBtn1Click
      end
      object CmbxTableName: TComboBox
        Left = 86
        Top = 16
        Width = 187
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 3
        OnChange = CmbxTableNameChange
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
      'select b.id, '#13#10'b.Code as ['#32534#21495'], '#13#10'b.date ['#26085#26399'],'#13#10'b.BillMode ['#19994#21153#31867#21035']' +
      ','#13#10'b.brief  ['#19994#21153#25688#35201'],'#13#10'c.name  ['#23458#25143'/'#21378#21830#21517#31216'] ,'#13#10'e.name ['#21830#21697#21517#31216'], '#13#10'a.Goo' +
      'dsSpec ['#35268#26684#22411#21495'], '#13#10'a.GoalQuantity  ['#26631#20934#25968#37327'], '#13#10'g.name  ['#26631#20934#21333#20301'],'#13#10'a.Pr' +
      'iceBase  ['#21333#20215'],'#13#10'a.Amount as ['#37329#39069'], '#13#10'f.name ['#21253#35013#21333#20301'], '#13#10'a.Quantity ' +
      ' ['#25968#37327'],'#13#10'D.name  ['#32463#25163#20154'],   '#13#10'a.Memo  ['#22791#27880']'#13#10'from  SLOrderDetail a'#13#10 +
      'left outer join SLOrderMaster  b on b.ID=a.MasterID'#13#10'left outer ' +
      'join DAClient       C on C.ID =B.ClientID'#13#10'left outer join MSEmp' +
      'loyee     D on D.ID =B.EmployeeID'#13#10'left outer join DAGoods      ' +
      '  e on e.ID =a.GoodsID'#13#10'left outer join MSUnit         f on f.ID' +
      ' =a.PackUnitID'#13#10'left outer join MSUnit         g on g.ID =a.Goal' +
      'UnitID'#13#10'where 1<>1'
    Parameters = <>
    Left = 268
    Top = 260
    object adsMasterid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object adsMasterDSDesigner: TStringField
      FieldName = #32534#21495
    end
    object adsMasterDSDesigner2: TDateTimeField
      FieldName = #26085#26399
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #19994#21153#31867#21035
      Size = 16
    end
    object adsMasterDSDesigner4: TStringField
      FieldName = #19994#21153#25688#35201
      Size = 30
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #23458#25143'/'#21378#21830#21517#31216
      Size = 50
    end
    object adsMasterDSDesigner6: TStringField
      FieldName = #21830#21697#21517#31216
      Size = 60
    end
    object adsMasterDSDesigner7: TStringField
      FieldName = #35268#26684#22411#21495
      Size = 30
    end
    object adsMasterDSDesigner9: TStringField
      FieldName = #26631#20934#21333#20301
    end
    object adsMasterDSDesigner8: TBCDField
      FieldName = #26631#20934#25968#37327
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner10: TBCDField
      FieldName = #21333#20215
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner11: TBCDField
      FieldName = #37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner12: TStringField
      FieldName = #21253#35013#21333#20301
    end
    object adsMasterDSDesigner13: TBCDField
      FieldName = #25968#37327
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner14: TStringField
      FieldName = #32463#25163#20154
      Size = 30
    end
    object adsMasterDSDesigner15: TStringField
      FieldName = #22791#27880
      Size = 30
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 200
    Top = 264
  end
  object MainMenu1: TMainMenu
    Left = 344
    Top = 24
  end
end
