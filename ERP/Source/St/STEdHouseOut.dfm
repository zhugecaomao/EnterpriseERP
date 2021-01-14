inherited STHouseOutEditForm: TSTHouseOutEditForm
  Left = 105
  Top = 109
  Width = 632
  Height = 400
  Caption = #38144#21806#20986#24211#21333
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited DBGrid: TQLDBGrid
    Top = 141
    Width = 624
    Height = 191
    TabOrder = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodName'
        Width = 212
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SpecName'
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PackUnitName'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 77
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WarehouseName'
        Title.Caption = #20179#24211
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 624
  end
  inherited TopPanel: TPanel
    Width = 624
    Height = 112
    TabOrder = 0
    inherited RemarkLabel: TLabel
      Left = 32
      Top = 90
    end
    inherited VoucherNoLabel: TLabel
      Top = 12
    end
    inherited VoucherDateLabel: TLabel
      Left = 365
      Top = 12
    end
    object Label1: TLabel [3]
      Left = 20
      Top = 64
      Width = 42
      Height = 12
      Caption = #39046#26009#20154':'
    end
    object Label2: TLabel [4]
      Left = 8
      Top = 12
      Width = 54
      Height = 12
      Caption = #21333#25454#31867#22411':'
    end
    object Label3: TLabel [5]
      Left = 268
      Top = 38
      Width = 66
      Height = 12
      Caption = #20179#24211#31649#29702#21592':'
    end
    object Label5: TLabel [6]
      Left = 32
      Top = 38
      Width = 30
      Height = 12
      Caption = #20179#24211':'
    end
    object Label6: TLabel [7]
      Left = 280
      Top = 64
      Width = 54
      Height = 12
      Caption = #26469#28304#21333#25454':'
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 64
      Top = 86
      Width = 435
      DataField = 'Memo'
      TabOrder = 5
    end
    inherited VocherNoDBEdit: TDBEdit
      Width = 133
      DataField = 'Code'
    end
    inherited DateDBEdit: TDBEdit
      Left = 400
      Width = 99
      DataField = 'Date'
    end
    object dblkConsignee: TDBLookupComboBox
      Left = 64
      Top = 60
      Width = 183
      Height = 20
      DataField = 'ConsigneeID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = dsConsignee
      TabOrder = 6
    end
    object dblkWarehouse: TDBLookupComboBox
      Left = 64
      Top = 34
      Width = 196
      Height = 20
      DataField = 'WarehouseID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = dsSTWarehouse
      TabOrder = 3
    end
    object dblkEmployee: TDBLookupComboBox
      Left = 340
      Top = 34
      Width = 159
      Height = 20
      DataField = 'EmployeeID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = dsMSEmployee
      TabOrder = 4
    end
    object dblkOriginBillType: TDBLookupComboBox
      Left = 338
      Top = 60
      Width = 161
      Height = 20
      DataField = 'OriginBillTypeID'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object dbcbHouseOut: TDBComboBox
      Left = 64
      Top = 8
      Width = 123
      Height = 20
      DataField = 'HouseOut'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 0
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 332
    Width = 624
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsSTHouseOutMaster
    Left = 88
    Top = 184
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsSTHouseOutDetail
    Left = 120
    Top = 184
  end
  inherited ActionList: TActionList
    Left = 160
    Top = 184
    inherited ImportAction: TAction
      OnExecute = ImportActionExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 192
    Top = 184
  end
  object dsSTWarehouse: TDataSource
    DataSet = CommonData.adsSTWarehouse
    Left = 16
    Top = 56
  end
  object dsMSEmployee: TDataSource
    DataSet = CommonData.adsMSEmployee
    Left = 304
    Top = 56
  end
  object dsConsignee: TDataSource
    DataSet = adsConsignee
    Left = 17
    Top = 86
  end
  object adsConsignee: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'MSEmployee'
    CommandType = cmdTable
    Parameters = <>
    Left = 48
    Top = 88
  end
  object adsSTHouseOutMaster: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT * FROM STHouseOutMaster  WHERE ID = :ID and RecordState <' +
      '>'#39#21024#38500#39
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 88
    Top = 224
    object adsSTHouseOutMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsSTHouseOutMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsSTHouseOutMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsSTHouseOutMasterRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsSTHouseOutMasterDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsSTHouseOutMasterCode: TStringField
      FieldName = 'Code'
    end
    object adsSTHouseOutMasterConsigneeID: TIntegerField
      FieldName = 'ConsigneeID'
    end
    object adsSTHouseOutMasterHouseOut: TStringField
      FieldName = 'HouseOut'
      Size = 12
    end
    object adsSTHouseOutMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
    end
    object adsSTHouseOutMasterOriginBillID: TIntegerField
      FieldName = 'OriginBillID'
    end
    object adsSTHouseOutMasterOriginBillTypeID: TStringField
      FieldName = 'OriginBillTypeID'
      Size = 16
    end
    object adsSTHouseOutMasterPeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
    object adsSTHouseOutMasterWarehouseID: TIntegerField
      FieldName = 'WarehouseID'
    end
    object adsSTHouseOutMasterMemo: TStringField
      FieldName = 'Memo'
      Size = 50
    end
  end
  object adsSTHouseOutDetail: TADODataSet
    Connection = CommonData.acnConnection
    LockType = ltBatchOptimistic
    OnNewRecord = adsSTHouseOutDetailNewRecord
    CommandText = 'SELECT * FROM STHouseOutDetail  WHERE MasterID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 128
    Top = 224
    object adsSTHouseOutDetailMasterID: TIntegerField
      FieldName = 'MasterID'
    end
    object adsSTHouseOutDetailID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsSTHouseOutDetailWarehouseID: TIntegerField
      FieldName = 'WarehouseID'
    end
    object adsSTHouseOutDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      LookupDataSet = CommonData.adsDAGoods
      LookupKeyFields = 'Name'
      LookupResultField = 'ID'
      KeyFields = 'GoodsID'
      Visible = False
      OnChange = adsSTHouseOutDetailGoodsIDChange
    end
    object adsSTHouseOutDetailSpec: TStringField
      DisplayLabel = #21697#21517#35268#26684
      DisplayWidth = 16
      FieldName = 'Spec'
      LookupDataSet = CommonData.adsDAGoods
      LookupKeyFields = 'Name'
      LookupResultField = 'Name'
      KeyFields = 'Spec'
    end
    object adsSTHouseOutDetailPackUnitID: TStringField
      FieldName = 'PackUnitID'
      Size = 12
    end
    object adsSTHouseOutDetailQuantity: TBCDField
      DisplayLabel = #20986#24211#25968#37327
      DisplayWidth = 10
      FieldName = 'Quantity'
      Precision = 19
      Size = 5
    end
    object adsSTHouseOutDetailCostAmount: TBCDField
      DisplayWidth = 16
      FieldName = 'CostAmount'
      Precision = 19
    end
    object adsSTHouseOutDetailGoalQuantity: TBCDField
      FieldName = 'GoalQuantity'
      Precision = 19
      Size = 5
    end
    object adsSTHouseOutDetailGoodName: TStringField
      DisplayLabel = #36135#21697#21517#31216
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'GoodName'
      LookupDataSet = ADOTable3
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Lookup = True
    end
    object adsSTHouseOutDetailPackUnitName: TStringField
      DisplayLabel = #21253#35013#21333#20301
      DisplayWidth = 8
      FieldKind = fkLookup
      FieldName = 'PackUnitName'
      LookupDataSet = ADOTable4
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsSTHouseOutDetailSpecName: TStringField
      DisplayLabel = #21697#21517#35268#26684
      DisplayWidth = 16
      FieldKind = fkLookup
      FieldName = 'SpecName'
      LookupDataSet = CommonData.adsDAGoods
      LookupKeyFields = 'Spec'
      LookupResultField = 'Spec'
      KeyFields = 'Spec'
      Lookup = True
    end
    object adsSTHouseOutDetailWarehouseName: TStringField
      DisplayWidth = 12
      FieldKind = fkLookup
      FieldName = 'WarehouseName'
      LookupDataSet = adsSTWarehouse2
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'WarehouseID'
      Lookup = True
    end
    object adsSTHouseOutDetailGoalUnit: TIntegerField
      FieldName = 'GoalUnit'
      Visible = False
    end
  end
  object adrQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT IsNull(g.PriceSales,0) PriceBases,IsNull(g.Spec,'#39#40664#35748#21333#20301#39') S' +
        'pec,IsNull(u.Name,'#39#40664#35748#21333#20301#39') UnitName'
      
        ' FROM DAGoods g LEFT JOIN MSUnit u ON g.UnitID=u.ID where g.ID=:' +
        'ID')
    Left = 16
    Top = 248
  end
  object adsSTWarehouse2: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from STWarehouse where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 496
    Top = 184
  end
  object dsSTWarehouse2: TDataSource
    DataSet = adsSTWarehouse2
    Left = 528
    Top = 184
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
end
