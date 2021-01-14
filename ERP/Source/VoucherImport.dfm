inherited VoucherImportForm: TVoucherImportForm
  Left = 365
  Top = 149
  Width = 766
  Height = 448
  Caption = #24341#29992#21333#25454
  Position = poDesigned
  Visible = False
  WindowState = wsNormal
  OnClick = FormClick
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 758
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = PrintAction
    end
    object ToolButton3: TToolButton
      Left = 55
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton2: TToolButton
      Left = 110
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 118
      Top = 2
      Action = ExportAction
    end
    object ToolButton9: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 181
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton10: TToolButton
      Left = 236
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton7: TToolButton
      Left = 291
      Top = 2
      Action = RefreshAction
    end
    object ToolButton5: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 354
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 758
    Height = 380
    inherited PageControl: TPageControl
      Top = 356
      Width = 758
      Height = 24
      inherited TabSheet1: TTabSheet
        Caption = #24341#29992#21333#25454#35814#32454#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 70
      Width = 758
      Height = 286
      FooterColor = clMoneyGreen
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'Code'
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'date'
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BillMode'
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'brief'
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Client'
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Goods'
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GoodsSpec'
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GoalQuantity'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GoalUnit'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PriceBase'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Amount'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PackUnit'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Quantity'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Employee'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Memo'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end>
    end
    object Panel3: TPanel
      Left = 0
      Top = 0
      Width = 758
      Height = 70
      Align = alTop
      TabOrder = 2
      object Label3: TLabel
        Left = 30
        Top = 15
        Width = 48
        Height = 12
        Caption = #24341#29992#26102#27573
      end
      object Label2: TLabel
        Left = 210
        Top = 15
        Width = 24
        Height = 12
        Caption = ' '#33267' '
        Visible = False
      end
      object Label1: TLabel
        Left = 30
        Top = 46
        Width = 48
        Height = 12
        Caption = #36873#25321#21333#25454
      end
      object DateTimePicker1: TDateTimePicker
        Left = 86
        Top = 11
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
        Left = 252
        Top = 11
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
      object CmbxTableName: TComboBox
        Left = 86
        Top = 42
        Width = 164
        Height = 20
        Style = csDropDownList
        ItemHeight = 12
        TabOrder = 2
        OnChange = CmbxTableNameChange
      end
      object BitBtn1: TBitBtn
        Left = 280
        Top = 42
        Width = 57
        Height = 20
        Caption = #21047#26032
        TabOrder = 3
        OnClick = BitBtn1Click
      end
    end
  end
  inherited ActionList: TActionList
    Left = 24
    Top = 160
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 104
    Top = 168
  end
  inherited WsBrowsePop: TPopupMenu
    Left = 64
    Top = 168
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select b.id, '#13#10'b.Code , '#13#10'b.date,'#13#10'b.BillMode,'#13#10'b.brief ,'#13#10'c.nam' +
      'e AS Client,'#13#10'A.GoodsID,'#13#10'e.name AS Goods, '#13#10'a.GoodsSpec, '#13#10'a.Go' +
      'alQuantity  , '#13#10'g.name AS GoalUnit,'#13#10'a.PriceBase ,'#13#10'a.Amount, '#13#10 +
      'A.GoalUnitID,'#13#10'A.PackUnitID,'#13#10'A.PriceGoal,'#13#10'f.name AS PackUnit, ' +
      #13#10'a.Quantity,'#13#10'D.name As Employee,   '#13#10'a.Memo '#13#10'from  SLOrderDet' +
      'ail a'#13#10'left outer join SLOrderMaster  b on b.ID=a.MasterID'#13#10'left' +
      ' outer join DAClient       C on C.ID =B.ClientID'#13#10'left outer joi' +
      'n MSEmployee     D on D.ID =B.EmployeeID'#13#10'left outer join DAGood' +
      's        e on e.ID =a.GoodsID'#13#10'left outer join MSUnit         f ' +
      'on f.ID =a.PackUnitID'#13#10'left outer join MSUnit         g on g.ID ' +
      '=a.GoalUnitID'#13#10'where 1<>1'
    Parameters = <>
    Left = 188
    Top = 172
    object adsMasterid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object adsMasterGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
    end
    object adsMasterCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object adsMasterdate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'date'
    end
    object adsMasterBillMode: TStringField
      DisplayLabel = #19994#21153#31867#21035
      FieldName = 'BillMode'
      Size = 16
    end
    object adsMasterbrief: TStringField
      DisplayLabel = #19994#21153#25688#35201
      FieldName = 'brief'
      Size = 30
    end
    object adsMasterClient: TStringField
      DisplayLabel = #23458#25143'/'#21378#21830#21517#31216
      FieldName = 'Client'
      Size = 50
    end
    object adsMasterGoods: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldName = 'Goods'
      Size = 60
    end
    object adsMasterGoodsSpec: TStringField
      DisplayLabel = #35268#26684#22411#21495
      FieldName = 'GoodsSpec'
      Size = 30
    end
    object adsMasterGoalQuantity: TBCDField
      DisplayLabel = #26631#20934#25968#37327
      FieldName = 'GoalQuantity'
      Precision = 19
      Size = 5
    end
    object adsMasterGoalUnit: TStringField
      DisplayLabel = #26631#20934#21333#20301
      FieldName = 'GoalUnit'
    end
    object adsMasterPriceBase: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PriceBase'
      Precision = 19
    end
    object adsMasterAmount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'Amount'
      Precision = 19
      Size = 5
    end
    object adsMasterPackUnit: TStringField
      DisplayLabel = #21253#35013#21333#20301
      FieldName = 'PackUnit'
    end
    object adsMasterQuantity: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'Quantity'
      Precision = 19
      Size = 5
    end
    object adsMasterEmployee: TStringField
      DisplayLabel = #32463#25163#20154
      FieldName = 'Employee'
      Size = 30
    end
    object adsMasterMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
    object adsMasterGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object adsMasterPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      Visible = False
    end
    object adsMasterPriceGoal: TBCDField
      FieldName = 'PriceGoal'
      Visible = False
      Precision = 19
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 312
    Top = 152
  end
end
