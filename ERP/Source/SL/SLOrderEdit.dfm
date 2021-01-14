inherited SLOrderEditForm: TSLOrderEditForm
  Left = 198
  Top = 17
  Width = 612
  Height = 456
  Caption = #38144#21806#35746#36135
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited DBGrid: TQLDBGrid
    Top = 185
    Width = 604
    Height = 225
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        Width = 131
        Visible = True
        ControlType = ctCustomControl
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'Spec'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PackUnitName'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceBase'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        ReadOnly = True
        Width = 100
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 604
  end
  inherited TopPanel: TPanel
    Width = 604
    Height = 156
    inherited RemarkLabel: TLabel
      Top = 123
    end
    inherited VoucherNoLabel: TLabel
      Left = 224
    end
    inherited VoucherDateLabel: TLabel
      Left = 408
    end
    object Label1: TLabel [3]
      Left = 8
      Top = 11
      Width = 30
      Height = 12
      Caption = #23458#25143':'
    end
    object Label5: TLabel [4]
      Left = 8
      Top = 40
      Width = 30
      Height = 12
      Caption = #21592#24037':'
    end
    object Label2: TLabel [5]
      Left = 408
      Top = 43
      Width = 54
      Height = 12
      Caption = #25552#37266#26085#26399':'
    end
    object Label3: TLabel [6]
      Left = 8
      Top = 99
      Width = 54
      Height = 12
      Caption = #20132#36135#22320#28857':'
    end
    object Label4: TLabel [7]
      Left = 224
      Top = 43
      Width = 54
      Height = 12
      Caption = #20132#36135#26085#26399':'
    end
    object Label7: TLabel [8]
      Left = 8
      Top = 75
      Width = 54
      Height = 12
      Caption = #35746#21333#29366#24577':'
    end
    object Label8: TLabel [9]
      Left = 224
      Top = 75
      Width = 54
      Height = 12
      Caption = #20572#27490#25552#37266':'
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 64
      Top = 120
      Width = 521
      DataField = 'Memo'
    end
    inherited VocherNoDBEdit: TDBEdit
      Left = 256
      Top = 7
      Width = 145
      DataField = 'Code'
    end
    inherited DateDBEdit: TDBEdit
      Left = 472
      Top = 7
      DataField = 'Date'
    end
    object dblcEmployee: TDBLookupComboBox
      Left = 40
      Top = 40
      Width = 177
      Height = 20
      DataField = 'EmployeID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = dsEmployee
      TabOrder = 3
    end
    object dblcClient: TDBLookupComboBox
      Left = 40
      Top = 7
      Width = 177
      Height = 20
      BevelInner = bvNone
      DataField = 'ClientID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = dsClient
      TabOrder = 4
    end
    object dbeAwokeDate: TDBEdit
      Left = 472
      Top = 40
      Width = 121
      Height = 20
      DataField = 'AwokeDate'
      DataSource = MasterDataSource
      TabOrder = 5
    end
    object dbeDeliveryAddress: TDBEdit
      Left = 64
      Top = 96
      Width = 529
      Height = 20
      DataField = 'DeliveryAddress'
      DataSource = MasterDataSource
      TabOrder = 6
    end
    object dbeDeliveryDate: TDBEdit
      Left = 280
      Top = 40
      Width = 121
      Height = 20
      DataField = 'Deliverydate'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object dbcbExcuteFlag: TDBComboBox
      Left = 64
      Top = 72
      Width = 153
      Height = 20
      DataField = 'Excuteflag'
      DataSource = MasterDataSource
      ItemHeight = 12
      Items.Strings = (
        #25191#34892
        #25191#34892#23436#27605)
      TabOrder = 8
    end
    object dbcbAwokeFlag: TDBComboBox
      Left = 280
      Top = 72
      Width = 121
      Height = 20
      DataField = 'AwokeFlag'
      DataSource = MasterDataSource
      ItemHeight = 12
      Items.Strings = (
        #26159
        #21542)
      TabOrder = 9
    end
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsOrderMaster
    Left = 264
    Top = 0
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsOrderDetail
    Left = 296
    Top = 0
  end
  inherited ActionList: TActionList
    Left = 328
    Top = 0
  end
  inherited MainMenu: TMainMenu
    Left = 360
    Top = 0
  end
  object adsOrderMaster: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'SELECT * FROM SLOrderMaster WHERE ID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 64
    Top = 336
    object adsOrderMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsOrderMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsOrderMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsOrderMasterRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsOrderMasterCode: TStringField
      FieldName = 'Code'
    end
    object adsOrderMasterDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsOrderMasterClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object adsOrderMasterDeliverydate: TDateTimeField
      FieldName = 'Deliverydate'
    end
    object adsOrderMasterDeliveryAddress: TStringField
      FieldName = 'DeliveryAddress'
      Size = 60
    end
    object adsOrderMasterExcuteflag: TStringField
      FieldName = 'Excuteflag'
      Size = 12
    end
    object adsOrderMasterEmployeID: TIntegerField
      FieldName = 'EmployeID'
    end
    object adsOrderMasterMemo: TStringField
      FieldName = 'Memo'
      Size = 12
    end
    object adsOrderMasterAwokeDate: TDateTimeField
      FieldName = 'AwokeDate'
    end
    object adsOrderMasterAwokeFlag: TStringField
      FieldName = 'AwokeFlag'
      Size = 2
    end
    object adsOrderMasterOriginBillID: TIntegerField
      FieldName = 'OriginBillID'
    end
    object adsOrderMasterOriginOriginBillTypeID2: TIntegerField
      FieldName = 'OriginOriginBillTypeID'
    end
    object adsOrderMasterPeriodID2: TIntegerField
      FieldName = 'PeriodID'
    end
  end
  object adsOrderDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select * from SLOrderDetail Where MasterID=:ID'
    IndexFieldNames = 'MasterID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 96
    Top = 336
    object adsOrderDetailID: TAutoIncField
      FieldName = 'ID'
      Visible = False
    end
    object adsOrderDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsOrderDetailGoodsID: TIntegerField
      DisplayLabel = #36135#21697#21517#31216' ID'
      FieldName = 'GoodsID'
      LookupDataSet = CommonData.adsDAGoods
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      OnChange = adsOrderDetailGoodsIDChange
    end
    object adsOrderDetailQuantity: TBCDField
      DisplayLabel = #25968#37327
      DisplayWidth = 10
      FieldName = 'Quantity'
      OnChange = adsOrderDetailQuantityChange
      Precision = 19
      Size = 5
    end
    object adsOrderDetailPackUnitID: TIntegerField
      DisplayLabel = #21333#20301
      FieldName = 'PackUnitID'
      LookupDataSet = CommonData.adsMSUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
    end
    object adsOrderDetailPriceBase: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PriceBase'
      OnChange = adsOrderDetailPriceBaseChange
      currency = True
      Precision = 19
    end
    object adsOrderDetailAmount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
    end
    object adsOrderDetailGoalQuantity: TBCDField
      DisplayLabel = #26631#20934#21333#20301#25968#37327
      FieldName = 'GoalQuantity'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsOrderDetailGoodsName: TStringField
      DisplayLabel = #36135#21697
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'GoodsName'
      LookupDataSet = CommonData.adsDAGoods
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Size = 25
      Lookup = True
    end
    object adsOrderDetailPackUnitName: TStringField
      DisplayLabel = #21333#20301
      FieldKind = fkLookup
      FieldName = 'PackUnitName'
      LookupDataSet = CommonData.adsMSUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsOrderDetailSpec: TStringField
      DisplayLabel = #35268#26684
      FieldKind = fkLookup
      FieldName = 'Spec'
      LookupDataSet = CommonData.adsDAGoods
      LookupKeyFields = 'ID'
      LookupResultField = 'Spec'
      KeyFields = 'GoodsID'
      Lookup = True
    end
  end
  object dsClient: TDataSource
    DataSet = CommonData.adsDAClient
    Left = 128
    Top = 32
  end
  object dsEmployee: TDataSource
    DataSet = CommonData.adsMSEmployee
    Left = 128
    Top = 64
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
    Left = 64
    Top = 288
  end
end
