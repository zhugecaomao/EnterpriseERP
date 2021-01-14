inherited DAGoodsEditForm: TDAGoodsEditForm
  Left = 187
  Top = 147
  Width = 503
  Height = 330
  Caption = #36135#21697#36164#26009#32534#36753
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 16
    Top = 20
    Width = 42
    Height = 12
    Caption = #21517'   '#31216
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 15
    Top = 50
    Width = 42
    Height = 12
    Caption = #32534'   '#30721
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 81
    Width = 42
    Height = 12
    Caption = #35268'   '#26684
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 15
    Top = 112
    Width = 42
    Height = 12
    Caption = #20998'   '#31867
  end
  object Label5: TLabel [4]
    Left = 17
    Top = 142
    Width = 42
    Height = 12
    Caption = #26465'   '#30721
    FocusControl = DBEdit5
  end
  object Label6: TLabel [5]
    Left = 15
    Top = 173
    Width = 48
    Height = 12
    Caption = #24211#23384#19978#38480
    FocusControl = DBEdit6
  end
  object Label7: TLabel [6]
    Left = 257
    Top = 173
    Width = 48
    Height = 12
    Caption = #24211#23384#19979#38480
    FocusControl = DBEdit7
  end
  object Label8: TLabel [7]
    Left = 15
    Top = 204
    Width = 48
    Height = 12
    Caption = #21442#32771#36827#20215
    FocusControl = DBEdit8
  end
  object Label9: TLabel [8]
    Left = 257
    Top = 204
    Width = 48
    Height = 12
    Caption = #21442#32771#38144#20215
    FocusControl = DBEdit9
  end
  object Label10: TLabel [9]
    Left = 257
    Top = 54
    Width = 42
    Height = 12
    Caption = #22270'   '#29255
  end
  object Label11: TLabel [10]
    Left = 227
    Top = 74
    Width = 84
    Height = 12
    Caption = '('#21452#20987#20462#25913#22270#29255')'
  end
  object Label12: TLabel [11]
    Left = 257
    Top = 142
    Width = 48
    Height = 12
    Caption = #26631#20934#21333#20301
  end
  object Label13: TLabel [12]
    Left = 16
    Top = 235
    Width = 48
    Height = 12
    Caption = #36741#21161#21333#20301
    FocusControl = DBEdit4
  end
  object Label14: TLabel [13]
    Left = 249
    Top = 235
    Width = 60
    Height = 12
    Caption = #36741#21161#25442#31639#29575
  end
  inherited CancelButton: TButton
    Left = 413
    Top = 270
    TabOrder = 14
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 333
    Top = 270
    TabOrder = 13
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 64
    Top = 18
    Width = 229
    Height = 20
    DataField = 'Name'
    DataSource = dsGoodsEdie
    TabOrder = 0
    OnExit = DBEdit1Exit
  end
  object DBEdit2: TDBEdit
    Left = 64
    Top = 47
    Width = 157
    Height = 20
    DataField = 'Code'
    DataSource = dsGoodsEdie
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 64
    Top = 78
    Width = 157
    Height = 20
    DataField = 'Spec'
    DataSource = dsGoodsEdie
    TabOrder = 2
  end
  object DBEdit5: TDBEdit
    Left = 65
    Top = 138
    Width = 157
    Height = 20
    DataField = 'BarCode'
    DataSource = dsGoodsEdie
    TabOrder = 4
  end
  object DBEdit6: TDBEdit
    Left = 65
    Top = 169
    Width = 157
    Height = 20
    DataField = 'StockMax'
    DataSource = dsGoodsEdie
    TabOrder = 6
  end
  object DBEdit7: TDBEdit
    Left = 312
    Top = 169
    Width = 157
    Height = 20
    DataField = 'StockMin'
    DataSource = dsGoodsEdie
    TabOrder = 7
  end
  object DBEdit8: TDBEdit
    Left = 65
    Top = 200
    Width = 157
    Height = 20
    DataField = 'PricePurchase'
    DataSource = dsGoodsEdie
    TabOrder = 8
  end
  object DBEdit9: TDBEdit
    Left = 312
    Top = 200
    Width = 157
    Height = 20
    DataField = 'PriceSales'
    DataSource = dsGoodsEdie
    TabOrder = 9
  end
  object DBImage1: TDBImage
    Left = 312
    Top = 16
    Width = 156
    Height = 114
    DataField = 'GoodsPictrue'
    DataSource = dsGoodsEdie
    TabOrder = 12
    OnDblClick = DBImage1DblClick
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 64
    Top = 109
    Width = 157
    Height = 20
    DataField = 'GoodsClassID'
    DataSource = dsGoodsEdie
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource1
    NullValueKey = 16449
    TabOrder = 3
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 312
    Top = 138
    Width = 157
    Height = 20
    DataField = 'UnitID'
    DataSource = dsGoodsEdie
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource2
    TabOrder = 5
    OnEnter = DBLookupComboBox2Enter
  end
  object DBEdit4: TDBEdit
    Left = 312
    Top = 231
    Width = 157
    Height = 20
    DataField = 'AddUnitRate'
    DataSource = dsGoodsEdie
    TabOrder = 11
  end
  object AddUnitLookup: TDBLookupComboBox
    Left = 65
    Top = 231
    Width = 157
    Height = 20
    DataField = 'AddUnitID'
    DataSource = dsGoodsEdie
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsAddUnit
    TabOrder = 10
    OnCloseUp = AddUnitLookupCloseUp
    OnEnter = DBLookupComboBox2Enter
  end
  object tblGoodsEdit: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    BeforePost = tblGoodsEditBeforePost
    OnFilterRecord = tblGoodsEditFilterRecord
    TableName = 'DAGoods'
    Left = 136
    Top = 54
    object tblGoodsEditID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblGoodsEditCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblGoodsEditCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblGoodsEditRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblGoodsEditName: TStringField
      FieldName = 'Name'
      Size = 60
    end
    object tblGoodsEditCode: TStringField
      DisplayLabel = #32534#30721
      FieldName = 'Code'
    end
    object tblGoodsEditSpec: TStringField
      DisplayLabel = #35268#26684
      FieldName = 'Spec'
    end
    object tblGoodsEditBarCode: TStringField
      DisplayLabel = #26465#30721
      FieldName = 'BarCode'
    end
    object tblGoodsEditGoodsClassID: TIntegerField
      DisplayLabel = #20998#31867
      FieldName = 'GoodsClassID'
    end
    object tblGoodsEditUnitID: TIntegerField
      DisplayLabel = #26631#20934#21333#20301
      FieldName = 'UnitID'
    end
    object tblGoodsEditStockMax: TBCDField
      DisplayLabel = #24211#23384#19978#38480
      FieldName = 'StockMax'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      Precision = 18
      Size = 0
    end
    object tblGoodsEditStockMin: TBCDField
      DisplayLabel = #24211#23384#19979#38480
      FieldName = 'StockMin'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      Precision = 18
      Size = 0
    end
    object tblGoodsEditPricePurchase: TBCDField
      DisplayLabel = #21442#32771#36827#20215
      FieldName = 'PricePurchase'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      Precision = 19
    end
    object tblGoodsEditPriceSales: TBCDField
      DisplayLabel = #21442#32771#38144#20215
      FieldName = 'PriceSales'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      Precision = 19
    end
    object tblGoodsEditGoodsPictrue: TBlobField
      FieldName = 'GoodsPictrue'
    end
    object tblGoodsEditAddUnitID: TIntegerField
      FieldName = 'AddUnitID'
    end
    object tblGoodsEditAddUnitRate: TFloatField
      FieldName = 'AddUnitRate'
    end
  end
  object dsGoodsEdie: TDataSource
    DataSet = tblGoodsEdit
    Left = 167
    Top = 52
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 117
    Top = 102
  end
  object OpenPic: TOpenPictureDialog
    Left = 341
    Top = 52
  end
  object DataSource2: TDataSource
    DataSet = ADOTable2
    Left = 375
    Top = 136
  end
  object ADOTable1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select * from DAGoodsClass'#13#10'where RecordState<>'#39#21024#38500#39#13#10'order by Le' +
      'velCode'
    Parameters = <>
    Left = 80
    Top = 104
  end
  object ADOTable2: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select * from MSUnit '#13#10'where RecordState<>'#39#21024#38500#39' and IsGoalUnit='#39'1' +
      #39#13#10
    Parameters = <>
    Left = 336
    Top = 136
  end
  object AdsAddUnit: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select * from MSUnit '#13#10'where RecordState<>'#39#21024#38500#39' and IsGoalUnit<>'#39 +
      '1'#39#13#10
    Parameters = <>
    Left = 96
    Top = 248
  end
  object dsAddUnit: TDataSource
    DataSet = AdsAddUnit
    Left = 135
    Top = 248
  end
end
