inherited PCPurchasePriceForm: TPCPurchasePriceForm
  Left = 141
  Top = 147
  Width = 548
  Height = 527
  Caption = #21830#21697#36827#20215#32534#36753
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label5: TLabel [0]
    Left = 310
    Top = 67
    Width = 48
    Height = 12
    Caption = #21253#35013#21333#20301
  end
  object Label6: TLabel [1]
    Left = 310
    Top = 96
    Width = 48
    Height = 12
    Caption = #22522#26412#21333#20215
    FocusControl = DBEdit6
  end
  object Label8: TLabel [2]
    Left = 310
    Top = 124
    Width = 48
    Height = 12
    Caption = #26368#20302#38480#20215
    FocusControl = DBEdit8
  end
  object Label9: TLabel [3]
    Left = 30
    Top = 153
    Width = 48
    Height = 12
    Caption = #26377#25928#26085#26399
    FocusControl = DBEdit9
  end
  object Label2: TLabel [4]
    Left = 30
    Top = 39
    Width = 48
    Height = 12
    Caption = #25919#31574#32534#21495
    FocusControl = DBEdit2
  end
  object Label10: TLabel [5]
    Left = 310
    Top = 153
    Width = 48
    Height = 12
    Caption = #29983#25928#26085#26399
    FocusControl = DBEdit10
  end
  object Label1: TLabel [6]
    Left = 310
    Top = 39
    Width = 48
    Height = 12
    Caption = #21457#24067#26085#26399
    FocusControl = DBEdit1
  end
  object Label7: TLabel [7]
    Left = 31
    Top = 124
    Width = 48
    Height = 12
    Caption = #26368#39640#38480#20215
    FocusControl = DBEdit7
  end
  object Label3: TLabel [8]
    Left = 30
    Top = 96
    Width = 48
    Height = 12
    Caption = #20215#26684#31867#21035
    FocusControl = DBEdit3
  end
  object Label4: TLabel [9]
    Left = 30
    Top = 67
    Width = 48
    Height = 12
    Caption = #36135#21697#21517#31216
  end
  object Label11: TLabel [10]
    Left = 31
    Top = 178
    Width = 72
    Height = 12
    Caption = #35843#20215#25919#31574#25688#35201
  end
  inherited CancelButton: TButton
    Left = 458
    Top = 467
    TabOrder = 12
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 378
    Top = 467
    TabOrder = 11
    OnClick = OKButtonClick
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 91
    Top = 63
    Width = 205
    Height = 20
    DataField = 'GoodsID'
    DataSource = dsSLEdBuyPrice
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource1
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 91
    Top = 92
    Width = 205
    Height = 20
    DataField = 'PriceClass'
    DataSource = dsSLEdBuyPrice
    TabOrder = 4
  end
  object DBEdit7: TDBEdit
    Left = 91
    Top = 120
    Width = 140
    Height = 20
    DataField = 'PriceMax'
    DataSource = dsSLEdBuyPrice
    TabOrder = 6
  end
  object DBEdit1: TDBEdit
    Left = 363
    Top = 35
    Width = 140
    Height = 20
    DataField = 'Date'
    DataSource = dsSLEdBuyPrice
    TabOrder = 1
  end
  object DBEdit10: TDBEdit
    Left = 363
    Top = 149
    Width = 140
    Height = 20
    DataField = 'ExpireDate'
    DataSource = dsSLEdBuyPrice
    TabOrder = 9
  end
  object DBMemo1: TDBMemo
    Left = 63
    Top = 200
    Width = 418
    Height = 225
    DataField = 'Meno'
    DataSource = dsSLEdBuyPrice
    TabOrder = 10
  end
  object DBEdit2: TDBEdit
    Left = 91
    Top = 35
    Width = 140
    Height = 20
    DataField = 'Code'
    DataSource = dsSLEdBuyPrice
    TabOrder = 0
  end
  object DBEdit9: TDBEdit
    Left = 91
    Top = 149
    Width = 140
    Height = 20
    DataField = 'StartDate'
    DataSource = dsSLEdBuyPrice
    TabOrder = 8
  end
  object DBEdit8: TDBEdit
    Left = 363
    Top = 120
    Width = 140
    Height = 20
    DataField = 'PriceMin'
    DataSource = dsSLEdBuyPrice
    TabOrder = 7
  end
  object DBEdit6: TDBEdit
    Left = 363
    Top = 92
    Width = 140
    Height = 20
    DataField = 'PriceBase'
    DataSource = dsSLEdBuyPrice
    TabOrder = 5
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 362
    Top = 63
    Width = 140
    Height = 20
    DataField = 'PackUnitID'
    DataSource = dsSLEdBuyPrice
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsGoodUnit
    TabOrder = 3
  end
  object tblSLEdBuyPrice: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    BeforeOpen = tblSLEdBuyPriceBeforeOpen
    TableName = 'PCPurchasePrice'
    Left = 76
    Top = 238
    object tblSLEdBuyPriceID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblSLEdBuyPriceCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblSLEdBuyPriceCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblSLEdBuyPriceRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblSLEdBuyPriceDate: TDateTimeField
      FieldName = 'Date'
    end
    object tblSLEdBuyPriceCode: TStringField
      FieldName = 'Code'
    end
    object tblSLEdBuyPricePriceClass: TStringField
      FieldName = 'PriceClass'
      Size = 12
    end
    object tblSLEdBuyPriceGoodsID: TIntegerField
      FieldName = 'GoodsID'
    end
    object tblSLEdBuyPricePackUnitID: TIntegerField
      FieldName = 'PackUnitID'
    end
    object tblSLEdBuyPricePriceBase: TBCDField
      FieldName = 'PriceBase'
      Precision = 19
    end
    object tblSLEdBuyPricePriceMax: TBCDField
      FieldName = 'PriceMax'
      Precision = 19
    end
    object tblSLEdBuyPricePriceMin: TBCDField
      FieldName = 'PriceMin'
      Precision = 19
    end
    object tblSLEdBuyPriceStartDate: TDateTimeField
      FieldName = 'StartDate'
    end
    object tblSLEdBuyPriceExpireDate: TDateTimeField
      FieldName = 'ExpireDate'
    end
    object tblSLEdBuyPriceMeno: TStringField
      FieldName = 'Meno'
      Size = 60
    end
    object tblSLEdBuyPricePeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
  end
  object dsSLEdBuyPrice: TDataSource
    DataSet = tblSLEdBuyPrice
    Left = 120
    Top = 238
  end
  object ADOQuery1: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from DaGoods'
      'where RecordState<>'#39#21024#38500#39)
    Left = 165
    Top = 238
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 210
    Top = 238
  end
  object adsGoodUnit: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from MSUnit'#13#10'where RecordState<>'#39#21024#38500#39' '
    IndexFieldNames = 'GoalUnitID'
    MasterFields = 'UnitID'
    Parameters = <>
    Left = 255
    Top = 238
  end
  object dsGoodUnit: TDataSource
    DataSet = adsGoodUnit
    Left = 255
    Top = 278
  end
end
