inherited SLEdSaleGiftForm: TSLEdSaleGiftForm
  Left = 107
  Top = 61
  Width = 562
  Height = 509
  Caption = #21830#21697#36192#36865
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 287
    Top = 79
    Width = 48
    Height = 12
    Caption = #20027#35201#36135#21697
  end
  object Label2: TLabel [1]
    Left = 34
    Top = 27
    Width = 48
    Height = 12
    Caption = #25919#31574#32534#21495
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 34
    Top = 79
    Width = 48
    Height = 12
    Caption = #36192#36865#31867#21035
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 287
    Top = 27
    Width = 48
    Height = 12
    Caption = #21457#24067#26085#26399
    FocusControl = DBEdit4
  end
  object Label5: TLabel [4]
    Left = 34
    Top = 131
    Width = 48
    Height = 12
    Caption = #36192#36865#36135#21697
  end
  object Label6: TLabel [5]
    Left = 287
    Top = 157
    Width = 48
    Height = 12
    Caption = #36192#36865#21333#20215
    FocusControl = DBEdit6
  end
  object Label7: TLabel [6]
    Left = 287
    Top = 53
    Width = 48
    Height = 12
    Caption = #26377#25928#26085#26399
    FocusControl = DBEdit7
  end
  object Label8: TLabel [7]
    Left = 34
    Top = 53
    Width = 48
    Height = 12
    Caption = #29983#25928#26085#26399
    FocusControl = DBEdit8
  end
  object Label9: TLabel [8]
    Left = 34
    Top = 183
    Width = 48
    Height = 12
    Caption = #25919#31574#25688#35201
  end
  object Label10: TLabel [9]
    Left = 34
    Top = 105
    Width = 48
    Height = 12
    Caption = #36215#28857#37329#39069
    FocusControl = DBEdit10
  end
  object Label11: TLabel [10]
    Left = 287
    Top = 105
    Width = 48
    Height = 12
    Caption = #36215#28857#25968#37327
    FocusControl = DBEdit11
  end
  object Label12: TLabel [11]
    Left = 34
    Top = 157
    Width = 48
    Height = 12
    Caption = #36192#36865#25968#37327
    FocusControl = DBEdit12
  end
  object Label13: TLabel [12]
    Left = 286
    Top = 133
    Width = 48
    Height = 12
    Caption = #36192#36865#21333#20301
  end
  inherited CancelButton: TButton
    Left = 472
    Top = 449
    TabOrder = 14
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 392
    Top = 449
    TabOrder = 13
    OnClick = OKButtonClick
  end
  object DBEdit2: TDBEdit
    Left = 85
    Top = 22
    Width = 180
    Height = 20
    DataField = 'Code'
    DataSource = dsSLEdSaleGift
    TabOrder = 0
  end
  object DBEdit3: TDBEdit
    Left = 85
    Top = 75
    Width = 180
    Height = 20
    DataField = 'DiscountClass'
    DataSource = dsSLEdSaleGift
    TabOrder = 4
  end
  object DBEdit4: TDBEdit
    Left = 338
    Top = 22
    Width = 180
    Height = 20
    DataField = 'Date'
    DataSource = dsSLEdSaleGift
    TabOrder = 1
  end
  object DBEdit6: TDBEdit
    Left = 338
    Top = 155
    Width = 180
    Height = 20
    DataField = 'PriceGift'
    DataSource = dsSLEdSaleGift
    TabOrder = 11
  end
  object DBEdit7: TDBEdit
    Left = 338
    Top = 48
    Width = 180
    Height = 20
    DataField = 'StartDate'
    DataSource = dsSLEdSaleGift
    TabOrder = 3
  end
  object DBEdit8: TDBEdit
    Left = 85
    Top = 48
    Width = 180
    Height = 20
    DataField = 'ExpireDate'
    DataSource = dsSLEdSaleGift
    TabOrder = 2
  end
  object DBEdit10: TDBEdit
    Left = 85
    Top = 101
    Width = 180
    Height = 20
    DataField = 'MinAmount'
    DataSource = dsSLEdSaleGift
    TabOrder = 6
  end
  object DBEdit11: TDBEdit
    Left = 338
    Top = 101
    Width = 180
    Height = 20
    DataField = 'Quantity'
    DataSource = dsSLEdSaleGift
    TabOrder = 7
  end
  object DBEdit12: TDBEdit
    Left = 85
    Top = 155
    Width = 180
    Height = 20
    DataField = 'QuantityGift'
    DataSource = dsSLEdSaleGift
    TabOrder = 10
  end
  object DBMemo1: TDBMemo
    Left = 34
    Top = 200
    Width = 484
    Height = 225
    DataField = 'Memo'
    DataSource = dsSLEdSaleGift
    TabOrder = 12
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 338
    Top = 75
    Width = 180
    Height = 20
    DataField = 'GoodsID'
    DataSource = dsSLEdSaleGift
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource1
    TabOrder = 5
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 85
    Top = 128
    Width = 180
    Height = 20
    DataField = 'GiftGoodsID'
    DataSource = dsSLEdSaleGift
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource2
    TabOrder = 8
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 338
    Top = 128
    Width = 180
    Height = 20
    DataField = 'GoodUnitName'
    DataSource = dsSLEdSaleGift
    TabOrder = 9
  end
  object tblSLEdSaleGift: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    AfterInsert = tblSLEdSaleGiftAfterInsert
    CommandText = 'select *'#13#10' from SLSaleGift'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 35
    Top = 266
    object tblSLEdSaleGiftID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblSLEdSaleGiftGoodsID: TIntegerField
      DisplayLabel = #20027#35201#36135#21697'ID'
      FieldName = 'GoodsID'
    end
    object tblSLEdSaleGiftCode: TStringField
      DisplayLabel = #36192#36865#25919#31574#32534#21495
      FieldName = 'Code'
      Size = 12
    end
    object tblSLEdSaleGiftDiscountClass: TStringField
      DisplayLabel = #36192#36865#31867#21035
      FieldName = 'DiscountClass'
      Size = 12
    end
    object tblSLEdSaleGiftDate: TDateTimeField
      DisplayLabel = #21457#24067#26085#26399
      FieldName = 'Date'
    end
    object tblSLEdSaleGiftGiftGoodsID: TIntegerField
      DisplayLabel = #36192#36865#36135#21697'ID'
      FieldName = 'GiftGoodsID'
    end
    object tblSLEdSaleGiftPriceGift: TBCDField
      DisplayLabel = #36192#36865#21333#20215
      FieldName = 'PriceGift'
      DisplayFormat = '#,#.00'
      
      Precision = 19
    end
    object tblSLEdSaleGiftStartDate: TDateTimeField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'StartDate'
    end
    object tblSLEdSaleGiftExpireDate: TDateTimeField
      DisplayLabel = #29983#25928#26085#26399
      FieldName = 'ExpireDate'
    end
    object tblSLEdSaleGiftMemo: TStringField
      DisplayLabel = #36192#36865#25919#31574#25688#35201
      FieldName = 'Memo'
      Size = 60
    end
    object tblSLEdSaleGiftMinAmount: TBCDField
      DisplayLabel = #36215#28857#37329#39069
      FieldName = 'MinAmount'
      DisplayFormat = '#,#.00'
      
      Precision = 19
    end
    object tblSLEdSaleGiftQuantity: TBCDField
      DisplayLabel = #36215#28857#25968#37327
      FieldName = 'Quantity'
      DisplayFormat = '#,#.00'
      
      Precision = 18
      Size = 0
    end
    object tblSLEdSaleGiftQuantityGift: TBCDField
      DisplayLabel = #36192#36865#25968#37327
      FieldName = 'QuantityGift'
      DisplayFormat = '#,#.00'
      
      Precision = 18
      Size = 0
    end
    object tblSLEdSaleGiftGiftUnitID: TIntegerField
      DisplayLabel = #36192#36865#21333#20301'ID'
      FieldName = 'GiftUnitID'
    end
    object tblSLEdSaleGiftCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblSLEdSaleGiftCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblSLEdSaleGiftPeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
    object tblSLEdSaleGiftRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblSLEdSaleGiftGoodUnitName: TStringField
      FieldKind = fkLookup
      FieldName = 'GoodUnitName'
      LookupDataSet = GoodUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GiftUnitID'
      Lookup = True
    end
  end
  object dsSLEdSaleGift: TDataSource
    DataSet = tblSLEdSaleGift
    Left = 30
    Top = 226
  end
  object GoodName1: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 81
    Top = 266
  end
  object GoodUnit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from MSUnit'#13#10'where RecordState<>'#39#21024#38500#39' '
    DataSource = DataSource2
    IndexFieldNames = 'GoalUnitID'
    MasterFields = 'UnitID'
    Parameters = <>
    Left = 280
    Top = 266
  end
  object DataSource1: TDataSource
    DataSet = GoodName1
    Left = 139
    Top = 266
  end
  object GoodName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 170
    Top = 266
    object GoodNameID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object GoodNameCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object GoodNameCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object GoodNameRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object GoodNameName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object GoodNameCode: TStringField
      FieldName = 'Code'
    end
    object GoodNameSpec: TStringField
      FieldName = 'Spec'
    end
    object GoodNameBarCode: TStringField
      FieldName = 'BarCode'
    end
    object GoodNameGoodsClassID: TIntegerField
      FieldName = 'GoodsClassID'
    end
    object GoodNameUnitID: TIntegerField
      FieldName = 'UnitID'
    end
    object GoodNameStockMax: TBCDField
      FieldName = 'StockMax'
      Precision = 18
      Size = 0
    end
    object GoodNameStockMin: TBCDField
      FieldName = 'StockMin'
      Precision = 18
      Size = 0
    end
    object GoodNamePricePurchase: TBCDField
      FieldName = 'PricePurchase'
      Precision = 19
    end
    object GoodNamePriceSales: TBCDField
      FieldName = 'PriceSales'
      Precision = 19
    end
    object GoodNameGoodsPictrue: TBlobField
      FieldName = 'GoodsPictrue'
    end
  end
  object DataSource2: TDataSource
    DataSet = GoodName
    Left = 230
    Top = 266
  end
end
