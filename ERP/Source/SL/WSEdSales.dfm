inherited WSSalesEditForm: TWSSalesEditForm
  Left = 46
  Top = 62
  Width = 717
  Height = 486
  Caption = #38144#21806#24320#21333
  KeyPreview = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited DBGrid: TQLDBGrid
    Top = 187
    Width = 709
    Height = 231
    TabOrder = 3
  end
  inherited ToolBar: TToolBar
    Width = 709
    TabOrder = 0
  end
  inherited TopPanel: TPanel
    Width = 709
    Height = 158
    TabOrder = 1
    inherited RemarkLabel: TLabel
      Top = 102
    end
    inherited VoucherNoLabel: TLabel
      Left = 328
      Width = 54
      Caption = #20973#21333#32534#21495':'
    end
    inherited VoucherDateLabel: TLabel
      Left = 447
      Width = 54
      Caption = #24320#21333#26085#26399':'
    end
    object Label1: TLabel [3]
      Left = 8
      Top = 8
      Width = 48
      Height = 12
      Caption = #23458#25143#21517#31216
    end
    object Label2: TLabel [4]
      Left = 566
      Top = 50
      Width = 48
      Height = 12
      Caption = #35745#31639#31246#29575
      FocusControl = DBEdit2
    end
    object Label3: TLabel [5]
      Left = 447
      Top = 47
      Width = 48
      Height = 12
      Caption = #25240#25187#27604#29575
      FocusControl = DBEdit3
    end
    object Label4: TLabel [6]
      Left = 328
      Top = 48
      Width = 48
      Height = 12
      Caption = #38144#21806#31867#22411
    end
    object Label5: TLabel [7]
      Left = 8
      Top = 48
      Width = 48
      Height = 12
      Caption = #32463#21150#21592#24037
    end
    object Label6: TLabel [8]
      Left = 566
      Top = 11
      Width = 48
      Height = 12
      Caption = #32467#31639#26085#26399
      FocusControl = DBEdit1
    end
    object Label7: TLabel [9]
      Left = 391
      Top = 96
      Width = 48
      Height = 12
      Caption = #38468#21152#36153#29992
      FocusControl = DBEdit4
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 8
      Top = 115
      Width = 417
      DataField = 'Memo'
      TabOrder = 12
    end
    inherited VocherNoDBEdit: TDBEdit
      Left = 328
      Top = 24
      Width = 112
      DataField = 'Code'
    end
    inherited DateDBEdit: TDBEdit
      Left = 447
      Top = 24
      Width = 112
      DataField = 'Date'
    end
    object DBCheckBox1: TDBCheckBox
      Left = 235
      Top = 94
      Width = 56
      Height = 17
      Caption = #36865#36135
      DataField = 'IsDeliver'
      DataSource = MasterDataSource
      TabOrder = 10
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBCheckBox2: TDBCheckBox
      Left = 154
      Top = 94
      Width = 51
      Height = 17
      Caption = #21547#31246
      DataField = 'IsTax'
      DataSource = MasterDataSource
      TabOrder = 9
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBEdit2: TDBEdit
      Left = 566
      Top = 64
      Width = 112
      Height = 20
      DataField = 'TaxRate'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object DBCheckBox3: TDBCheckBox
      Left = 73
      Top = 94
      Width = 48
      Height = 17
      Caption = #25240#25187
      DataField = 'IsDiscount'
      DataSource = MasterDataSource
      TabOrder = 8
      ValueChecked = 'True'
      ValueUnchecked = 'False'
    end
    object DBEdit3: TDBEdit
      Left = 447
      Top = 64
      Width = 112
      Height = 20
      DataField = 'DiscountRate'
      DataSource = MasterDataSource
      TabOrder = 6
    end
    object DBCheckBox4: TDBCheckBox
      Left = 318
      Top = 94
      Width = 61
      Height = 17
      Caption = #24320#21457#31080
      TabOrder = 11
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Visible = False
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 8
      Top = 24
      Width = 306
      Height = 20
      DataField = 'ClientID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = DataSource1
      TabOrder = 0
    end
    object DBLookupComboBox2: TDBLookupComboBox
      Left = 8
      Top = 64
      Width = 306
      Height = 20
      DataField = 'EmployeID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = DataSource2
      TabOrder = 4
    end
    object DBEdit1: TDBEdit
      Left = 566
      Top = 24
      Width = 112
      Height = 20
      DataField = 'ClearDate'
      DataSource = MasterDataSource
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 447
      Top = 92
      Width = 112
      Height = 20
      DataField = 'SundryFee'
      DataSource = MasterDataSource
      TabOrder = 13
    end
    object DBComboBox3: TDBComboBox
      Left = 566
      Top = 90
      Width = 112
      Height = 20
      Style = csDropDownList
      DataField = 'IsApportion'
      DataSource = MasterDataSource
      ItemHeight = 12
      Items.Strings = (
        #19981#20998#25674
        #25353#37329#39069#20998#25674
        #25353#25968#37327#20998#25674)
      TabOrder = 14
    end
    object DBEdit5: TDBEdit
      Left = 328
      Top = 64
      Width = 112
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      TabOrder = 5
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 418
    Width = 709
    SimpleText = #25353'F7'#20026#19978#19968#24352#21333', F8'#20026#19979#19968#24352#21333', Ctrl+A'#20026#26032#22686#26126#32454',Ctrl+Z'#20026#29983#25104#32467#31639#21333
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsSalesMaster
    Left = 153
    Top = 226
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsSalesDetail
    Left = 94
    Top = 218
  end
  inherited ActionList: TActionList
    Left = 211
    Top = 207
    inherited ImportAction: TAction
      OnExecute = ImportActionExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 275
    Top = 0
    inherited A3: TMenuItem
      object N7: TMenuItem
        Caption = '-'
      end
      object N13: TMenuItem
        Caption = #29983#25104#32467#31639#21333
        OnClick = N13Click
      end
      object N14: TMenuItem
        Caption = #23458#25143#20215#26684#26597#35810
        OnClick = N14Click
      end
    end
  end
  object adsSalesMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    AfterInsert = adsSalesMasterAfterInsert
    BeforePost = adsSalesMasterBeforePost
    OnFilterRecord = adsSalesMasterFilterRecord
    CommandText = 
      'SELECT * FROM SLSaleMaster '#13#10'WHERE RecordState<>'#39#21024#38500#39' and  ID = :' +
      'ID '
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 40
    Top = 216
    object adsSalesMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsSalesMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsSalesMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsSalesMasterRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsSalesMasterDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsSalesMasterCode: TStringField
      FieldName = 'Code'
    end
    object adsSalesMasterClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object adsSalesMasterEmployeID: TIntegerField
      FieldName = 'EmployeID'
    end
    object adsSalesMasterIsDiscount: TStringField
      FieldName = 'IsDiscount'
    end
    object adsSalesMasterDiscountRate: TBCDField
      FieldName = 'DiscountRate'
      DisplayFormat = '00%'
      EditFormat = '00'
      MaxValue = 100
      Precision = 19
      Size = 5
    end
    object adsSalesMasterIsTax: TStringField
      FieldName = 'IsTax'
      Size = 6
    end
    object adsSalesMasterTaxRate: TBCDField
      FieldName = 'TaxRate'
      DisplayFormat = '00%'
      EditFormat = '00'
      MaxValue = 100
      Precision = 19
      Size = 5
    end
    object adsSalesMasterIsDeliver: TStringField
      FieldName = 'IsDeliver'
      Size = 6
    end
    object adsSalesMasterOriginBillID: TIntegerField
      FieldName = 'OriginBillID'
    end
    object adsSalesMasterOriginBillTypeID: TIntegerField
      FieldName = 'OriginBillTypeID'
    end
    object adsSalesMasterPeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
    object adsSalesMasterClearDate: TDateTimeField
      FieldName = 'ClearDate'
    end
    object adsSalesMasterMemo: TStringField
      FieldName = 'Memo'
      Size = 50
    end
    object adsSalesMasterSundryFee: TBCDField
      FieldName = 'SundryFee'
      Precision = 19
    end
    object adsSalesMasterIsApportion: TStringField
      FieldName = 'IsApportion'
      Size = 12
    end
    object adsSalesMasterBillMode: TStringField
      FieldName = 'BillMode'
      Size = 12
    end
    object adsSalesMasterBillModeDC: TIntegerField
      FieldName = 'BillModeDC'
    end
  end
  object adsSalesDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    AfterInsert = adsSalesDetailAfterInsert
    BeforePost = adsSalesDetailBeforePost
    CommandText = 'SELECT * FROM SLSaleDetail WHERE MasterID = :ID'
    IndexFieldNames = 'MasterID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 34
    Top = 279
    object adsSalesDetailStringField1: TStringField
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
    object adsSalesDetailQuantity: TBCDField
      DisplayLabel = #38144#21806#25968#37327
      FieldName = 'Quantity'
      OnChange = adsSalesDetailQuantityChange
      Precision = 19
      Size = 5
    end
    object adsSalesDetailSaleDangWei: TStringField
      DisplayLabel = #21333#20301
      DisplayWidth = 8
      FieldKind = fkLookup
      FieldName = 'SaleDangWei'
      LookupDataSet = ADOTable4
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsSalesDetailPriceBase: TBCDField
      DisplayLabel = #38144#21806#21333#20215
      DisplayWidth = 12
      FieldName = 'PriceBase'
      OnChange = adsSalesDetailQuantityChange
      currency = True
      Precision = 19
    end
    object adsSalesDetailAmount: TBCDField
      DisplayLabel = #37329#39069
      DisplayWidth = 10
      FieldName = 'Amount'
      ReadOnly = True
      currency = True
      Precision = 19
      Size = 5
    end
    object adsSalesDetailDiscountRate: TBCDField
      DisplayLabel = #25240#25187#29575
      DisplayWidth = 8
      FieldName = 'DiscountRate'
      OnChange = adsSalesDetailQuantityChange
      Precision = 19
      Size = 5
    end
    object adsSalesDetailDiscount: TBCDField
      DisplayLabel = #25240#25187#37329#39069
      DisplayWidth = 16
      FieldName = 'Discount'
      ReadOnly = True
      currency = True
      Precision = 19
    end
    object adsSalesDetailNetAmount: TBCDField
      DisplayLabel = #38144#21806#20928#20215
      DisplayWidth = 16
      FieldName = 'NetAmount'
      ReadOnly = True
      currency = True
      Precision = 19
    end
    object adsSalesDetailTexrate: TBCDField
      DisplayLabel = #31246#29575
      DisplayWidth = 8
      FieldName = 'Texrate'
      OnChange = adsSalesDetailQuantityChange
      Precision = 19
      Size = 5
    end
    object adsSalesDetailTaxAmount: TBCDField
      DisplayLabel = #31246#37329
      DisplayWidth = 16
      FieldName = 'TaxAmount'
      ReadOnly = True
      currency = True
      Precision = 19
    end
    object adsSalesDetailGoalQuantity: TBCDField
      DisplayLabel = #26631#20934#25968#37327
      FieldName = 'GoalQuantity'
      Precision = 19
      Size = 5
    end
    object adsSalesDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsSalesDetailID: TAutoIncField
      FieldName = 'ID'
      Visible = False
    end
    object adsSalesDetailPackUnitID: TIntegerField
      DisplayLabel = #38144#21806#21333#20301'ID'
      FieldName = 'PackUnitID'
      Visible = False
    end
    object adsSalesDetailGoodsID: TIntegerField
      DisplayLabel = #36135#21697#21517#31216
      FieldName = 'GoodsID'
      LookupDataSet = ADOTable3
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      LookupCache = True
      Visible = False
      OnChange = adsSalesDetailGoodsIDChange
    end
    object adsSalesDetailSalesMode: TStringField
      DisplayLabel = #38144#21806#26041#24335
      FieldName = 'SalesMode'
      Size = 12
    end
    object adsSalesDetailSundryFee: TBCDField
      DisplayLabel = #38468#21152#36153#29992
      FieldName = 'SundryFee'
      Precision = 19
      Size = 5
    end
  end
  object ADOTable1: TADOTable
    Tag = 22
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    OnFilterRecord = ADOTable3FilterRecord
    TableName = 'DAClient'
    Left = 355
    Top = 220
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 455
    Top = 220
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 455
    Top = 300
  end
  object ADOTable2: TADOTable
    Tag = 22
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    OnFilterRecord = ADOTable3FilterRecord
    TableName = 'MSEmployee'
    Left = 390
    Top = 265
  end
  object ADOTable3: TADOTable
    Tag = 22
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    OnFilterRecord = ADOTable3FilterRecord
    TableName = 'DAGoods'
    Left = 155
    Top = 290
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
  object ADOTable4: TADOTable
    Tag = 22
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    OnFilterRecord = ADOTable3FilterRecord
    IndexFieldNames = 'GoalUnitID'
    MasterFields = 'UnitID'
    MasterSource = DataSource3
    TableName = 'MSUnit'
    Left = 280
    Top = 265
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
  object DataSource3: TDataSource
    DataSet = ADOTable3
    Left = 215
    Top = 270
  end
end
