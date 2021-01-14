inherited STEdHouseMoveForm: TSTEdHouseMoveForm
  Left = 118
  Top = 131
  Width = 644
  Height = 415
  Caption = #36135#21697#35843#25320
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited DBGrid: TQLDBGrid
    Top = 98
    Width = 636
    Height = 249
    FooterRowCount = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'MasterID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GoodsID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GoodsName'
        Visible = True
        Footer.Value = #21512#35745':'
        Footer.ValueType = fvtStaticText
      end
      item
        Expanded = False
        FieldName = 'Spec'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SpecN'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'UnitID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'UnitName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoalUnitID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Visible = True
        Footer.ValueType = fvtSum
      end
      item
        Expanded = False
        FieldName = 'GoalQuantity'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'GoalCost'
        ReadOnly = True
        Visible = True
        Footer.ValueType = fvtSum
      end
      item
        Expanded = False
        FieldName = 'WarehouseIDIn'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'WarehouseIDOut'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'WInName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WOutName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 636
  end
  inherited TopPanel: TPanel
    Width = 636
    Height = 69
    inherited VoucherNoLabel: TLabel
      Left = 8
      Caption = #32534#21495':'
    end
    inherited VoucherDateLabel: TLabel
      Left = 160
      Width = 54
      Caption = #35843#25320#26085#26399':'
    end
    object Label1: TLabel [3]
      Left = 349
      Top = 11
      Width = 54
      Height = 12
      Caption = #24320#21333#21592#24037':'
    end
    inherited RemarkDBEdit: TDBEdit
      Width = 510
      DataField = 'Memo'
    end
    inherited VocherNoDBEdit: TDBEdit
      Left = 40
      Top = 7
      DataField = 'Code'
    end
    inherited DateDBEdit: TDBEdit
      Left = 220
      Top = 7
      DataField = 'Date'
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 405
      Top = 7
      Width = 145
      Height = 20
      DataField = 'EmployeeID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = DataSource1
      TabOrder = 3
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 347
    Width = 636
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsSTHouseMoveMaster
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsSTHouseMoveDetail
  end
  object adsSTHouseMoveDetail: TADODataSet
    Connection = CommonData.acnConnection
    LockType = ltBatchOptimistic
    CommandText = 'SELECT * FROM STHouseMoveDetail  WHERE MasterID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 152
    Top = 192
    object adsSTHouseMoveDetailID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsSTHouseMoveDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsSTHouseMoveDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
      OnChange = adsSTHouseMoveDetailGoodsIDChange
    end
    object adsSTHouseMoveDetailGoodsName: TStringField
      DisplayLabel = #36135#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'GoodsName'
      LookupDataSet = ADOTable3
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Lookup = True
    end
    object adsSTHouseMoveDetailSpec: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldName = 'Spec'
      LookupKeyFields = 'Spec'
      LookupResultField = 'Spec'
      Visible = False
    end
    object adsSTHouseMoveDetailSpecN: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldKind = fkLookup
      FieldName = 'SpecN'
      LookupDataSet = ADOTable3
      LookupKeyFields = 'Spec'
      LookupResultField = 'Spec'
      KeyFields = 'Spec'
      Lookup = True
    end
    object adsSTHouseMoveDetailUnitID: TIntegerField
      FieldName = 'UnitID'
      Visible = False
      OnChange = adsSTHouseMoveDetailUnitIDChange
    end
    object adsSTHouseMoveDetailUnitName: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 8
      FieldKind = fkLookup
      FieldName = 'UnitName'
      LookupDataSet = ADOTable4
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'UnitID'
      Lookup = True
    end
    object adsSTHouseMoveDetailGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object adsSTHouseMoveDetailQuantity: TBCDField
      DisplayLabel = #25968#37327
      DisplayWidth = 10
      FieldName = 'Quantity'
      OnChange = adsSTHouseMoveDetailUnitIDChange
      Precision = 18
      Size = 0
    end
    object adsSTHouseMoveDetailGoalQuantity: TBCDField
      DisplayLabel = #26631#20934#25968#37327
      DisplayWidth = 10
      FieldName = 'GoalQuantity'
      Precision = 18
      Size = 0
    end
    object adsSTHouseMoveDetailGoalCost: TBCDField
      DisplayLabel = #30446#26631#25104#26412
      FieldName = 'GoalCost'
      currency = True
      Precision = 18
      Size = 0
    end
    object adsSTHouseMoveDetailWarehouseIDIn: TIntegerField
      FieldName = 'WarehouseIDIn'
      Visible = False
      OnChange = adsSTHouseMoveDetailWarehouseIDInChange
    end
    object adsSTHouseMoveDetailWarehouseIDOut: TIntegerField
      FieldName = 'WarehouseIDOut'
      Visible = False
      OnChange = adsSTHouseMoveDetailWarehouseIDOutChange
    end
    object adsSTHouseMoveDetailWInName: TStringField
      DisplayLabel = #35843#20837#20179#24211
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'WInName'
      LookupDataSet = adsSTWarehouse
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'WarehouseIDIn'
      Lookup = True
    end
    object adsSTHouseMoveDetailWOutName: TStringField
      DisplayLabel = #35843#20986#20179#24211
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'WOutName'
      LookupDataSet = adsSTWarehouse
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'WarehouseIDOut'
      Lookup = True
    end
    object adsSTHouseMoveDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
  end
  object adsSTHouseMoveMaster: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT * FROM STHouseMoveMaster  WHERE ID = :ID and RecordState ' +
      '<>'#39#21024#38500#39
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 192
    object adsSTHouseMoveMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsSTHouseMoveMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsSTHouseMoveMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsSTHouseMoveMasterRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsSTHouseMoveMasterDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsSTHouseMoveMasterCode: TStringField
      FieldName = 'Code'
    end
    object adsSTHouseMoveMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
    end
    object adsSTHouseMoveMasterMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select * from MSEmployee where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 592
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 560
    Top = 32
  end
  object adsSTWarehouse: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from STWarehouse where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 520
    Top = 136
  end
  object dsSTWarehouse: TDataSource
    DataSet = adsSTWarehouse
    Left = 552
    Top = 136
  end
  object adsSTWarehouse2: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from STWarehouse where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 528
    Top = 192
  end
  object dsSTWarehouse2: TDataSource
    DataSet = adsSTWarehouse2
    Left = 560
    Top = 192
  end
  object DataSource3: TDataSource
    DataSet = ADOTable3
    Left = 311
    Top = 278
  end
  object ADOTable4: TADOTable
    Tag = 22
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    OnFilterRecord = ADOTable4FilterRecord
    IndexFieldNames = 'GoalUnitID'
    MasterFields = 'UnitID'
    MasterSource = DataSource3
    TableName = 'MSUnit'
    Left = 344
    Top = 273
    object ADOTable4ID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object ADOTable4Name: TStringField
      FieldName = 'Name'
    end
    object ADOTable4ExchangeRate: TStringField
      FieldName = 'ExchangeRate'
      FixedChar = True
      Size = 10
    end
    object ADOTable4GoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
    end
    object ADOTable4IsGoalUnit: TBooleanField
      FieldName = 'IsGoalUnit'
    end
    object ADOTable4RecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
  end
  object ADOTable3: TADOTable
    Tag = 22
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    OnFilterRecord = ADOTable3FilterRecord
    TableName = 'DAGoods'
    Left = 315
    Top = 306
    object ADOTable3ID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object ADOTable3CreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object ADOTable3CreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object ADOTable3RecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object ADOTable3Name: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object ADOTable3Code: TStringField
      FieldName = 'Code'
    end
    object ADOTable3Spec: TStringField
      FieldName = 'Spec'
    end
    object ADOTable3BarCode: TStringField
      FieldName = 'BarCode'
    end
    object ADOTable3GoodsClassID: TIntegerField
      FieldName = 'GoodsClassID'
    end
    object ADOTable3UnitID: TIntegerField
      FieldName = 'UnitID'
    end
    object ADOTable3StockMax: TBCDField
      FieldName = 'StockMax'
      Precision = 18
      Size = 0
    end
    object ADOTable3StockMin: TBCDField
      FieldName = 'StockMin'
      Precision = 18
      Size = 0
    end
    object ADOTable3PricePurchase: TBCDField
      FieldName = 'PricePurchase'
      Precision = 19
    end
    object ADOTable3PriceSales: TBCDField
      FieldName = 'PriceSales'
      Precision = 19
    end
    object ADOTable3GoodsPictrue2: TBlobField
      FieldName = 'GoodsPictrue'
    end
  end
  object adoTmp: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 528
    Top = 280
  end
end
