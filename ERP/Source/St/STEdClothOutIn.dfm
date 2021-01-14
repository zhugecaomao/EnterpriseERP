inherited STEdClothOutInForm: TSTEdClothOutInForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #26381#35013#35843#25320#21333
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label8: TLabel [0]
    Left = 124
    Top = 121
    Width = 36
    Height = 12
    Caption = #25240#25187#29575
  end
  inherited DBGrid: TQLDBGrid
    Top = 159
    Width = 800
    Height = 351
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        Title.Alignment = taCenter
        Width = 224
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoalUnit'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoodsSpec'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
        ControlType = ctCustomControl
        CustomControl = GoodsSpecLkup
      end
      item
        Expanded = False
        FieldName = 'CapStyle'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
        ControlType = ctCustomControl
        CustomControl = CapStyleLkup
      end
      item
        Expanded = False
        FieldName = 'SizeA'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SizeB'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SizeC'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SizeD'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SizeE'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SizeF'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QuantityPcs'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoalQuantity'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceGoal'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 160
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 800
  end
  inherited TopPanel: TPanel
    Width = 800
    Height = 130
    inherited RemarkLabel: TLabel
      Left = 355
      Top = 85
      Width = 24
      Caption = #22791#27880
    end
    inherited VoucherNoLabel: TLabel
      Left = 355
      Top = 5
      Width = 24
      Caption = #32534#21495
    end
    inherited VoucherDateLabel: TLabel
      Left = 510
      Top = 5
      Width = 24
      Caption = #26085#26399
    end
    object Label1: TLabel [3]
      Left = 12
      Top = 5
      Width = 48
      Height = 12
      Caption = #19994#21153#25688#35201
    end
    object Label2: TLabel [4]
      Left = 355
      Top = 44
      Width = 36
      Height = 12
      Caption = #32463#25163#20154
    end
    object Label3: TLabel [5]
      Left = 510
      Top = 45
      Width = 48
      Height = 12
      Caption = #19994#21153#31867#22411
    end
    object Label5: TLabel [6]
      Left = 12
      Top = 85
      Width = 48
      Height = 12
      Caption = #35843#20837#20179#24211
    end
    object Label9: TLabel [7]
      Left = 14
      Top = 45
      Width = 48
      Height = 12
      Caption = #35843#20986#20179#24211
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 355
      Top = 100
      Width = 296
      DataField = 'Memo'
      TabOrder = 7
    end
    inherited VocherNoDBEdit: TDBEdit
      Left = 355
      Top = 20
      Width = 140
      DataField = 'Code'
    end
    inherited DateDBEdit: TDBEdit
      Left = 510
      Top = 20
      Width = 140
      DataField = 'Date'
    end
    object LookupEmployee: TQLDBLookupComboBox
      Left = 355
      Top = 61
      Width = 140
      Height = 20
      BevelEdges = []
      BevelOuter = bvRaised
      Ctl3D = True
      DataField = 'EmployeeID'
      DataSource = MasterDataSource
      DropDownRows = 10
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = DSEmployeeName
      ParentCtl3D = False
      TabOrder = 4
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object BriefComboBox: TDBComboBox
      Left = 12
      Top = 20
      Width = 328
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 0
    end
    object WarehouseInLkup: TQLDBLookupComboBox
      Left = 12
      Top = 100
      Width = 328
      Height = 20
      BevelEdges = []
      BevelOuter = bvRaised
      Ctl3D = True
      DataField = 'WarehouseID'
      DataSource = MasterDataSource
      DropDownRows = 10
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = WarehouseInDS
      ParentCtl3D = False
      TabOrder = 6
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object DBComboBox1: TDBComboBox
      Left = 510
      Top = 61
      Width = 140
      Height = 20
      Style = csDropDownList
      DataField = 'BillMode'
      DataSource = MasterDataSource
      ItemHeight = 12
      Items.Strings = (
        #24211#23384#35843#25320
        #23492#38144#35843#25320
        #23492#23384#35843#25320
        #20854#23427#35843#25320)
      TabOrder = 5
    end
    object WareHouseOutLKup: TQLDBLookupComboBox
      Left = 12
      Top = 61
      Width = 328
      Height = 20
      BevelEdges = []
      BevelOuter = bvRaised
      Ctl3D = True
      DataField = 'ClientID'
      DataSource = MasterDataSource
      DropDownRows = 10
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = WareHouseOutDS
      OnExit = WareHouseOutLKupExit
      ParentCtl3D = False
      TabOrder = 3
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 510
    Width = 800
    Height = 24
  end
  inherited GoodsLookup: TQLDBLookupComboBox
    Left = 17
    Top = 180
    Width = 216
  end
  object GoodsSpecLkup: TQLDBLookupComboBox [6]
    Left = 296
    Top = 177
    Width = 57
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'GoodsSpec'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'Name'
    ListField = 'Name'
    ListSource = GoodsSpecDs
    ParentCtl3D = False
    TabOrder = 5
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object CapStyleLkup: TQLDBLookupComboBox [7]
    Left = 352
    Top = 209
    Width = 57
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'CapStyle'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'Name'
    ListField = 'Name'
    ListSource = CapStyleDs
    ParentCtl3D = False
    TabOrder = 6
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsMaster
    Left = 115
    Top = 78
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsDetail
    Left = 34
    Top = 298
  end
  inherited ActionList: TActionList
    Left = 339
    Top = 1
    inherited DeleteDetailAction: TAction [9]
      ImageIndex = -1
    end
    inherited NewDetailAction: TAction [10]
    end
    inherited SaveAsAction: TAction [11]
      ImageIndex = 11
    end
    inherited SubmitAction: TAction [12]
      ImageIndex = 8
    end
    inherited SendAsMailAction: TAction [13]
      ImageIndex = 8
    end
    inherited ImportAction: TAction [14]
      ImageIndex = 13
    end
    object DiscountMode: TAction [15]
      Caption = #25240#25187#26041#24335'(&D)'
      Hint = #35774#32622#24403#21069#21333#25454#30340#25240#25187#26041#24335
      ImageIndex = 7
    end
    object StockQuerry: TAction [16]
      Caption = #24211#23384#26597#35810'(&S)'
      Hint = #24211#23384#21830#21697#26597#35810#65292#24182#19988#21487#36827#34892#22810#27425#26597#35810
      ImageIndex = 3
    end
    inherited FindAction: TAction [17]
    end
    inherited CloseAction: TAction [18]
    end
    object SameQuantityAct: TAction
      Caption = #21508#23610#30721#25968#37327#30456#21516
      ImageIndex = 12
      ShortCut = 16471
      OnExecute = SameQuantityActExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 392
    Top = 1
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 456
    Top = 1
    object N33: TMenuItem
      Action = SameQuantityAct
    end
  end
  object WareHouseOutADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name'#13#10'from STWarehouse'#13#10'where RecordState<>'#39#21024#38500#39#13#10'and ' +
      'not (UpID=-1'#13#10'and Name like '#39'%'#25152#26377'%'#39' '#13#10'or Name like '#39'%'#20840#37096'%'#39' )'#13#10
    Parameters = <>
    Left = 153
    Top = 38
  end
  object EmployeeName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 192
    Top = 38
  end
  object GoodName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 85
    Top = 259
  end
  object PackUnit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 173
    Top = 259
  end
  object dsPackUnit: TDataSource
    DataSet = PackUnit
    Left = 172
    Top = 298
  end
  object WareHouseOutDS: TDataSource
    DataSet = WareHouseOutADS
    Left = 153
    Top = 78
  end
  object DSEmployeeName: TDataSource
    DataSet = EmployeeName
    Left = 192
    Top = 78
  end
  object TempAds: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 277
    Top = 259
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select *'#13#10'from  STGoodsOutInMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ' +
      'ID=:ID'
    IndexFieldNames = 'ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 115
    Top = 38
    object adsMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsMasterRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsMasterClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsMasterPeriodID: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object adsMasterWarehouseID: TIntegerField
      FieldName = 'WarehouseID'
    end
    object adsMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Visible = False
    end
    object adsMasterOriginID: TIntegerField
      FieldName = 'OriginID'
      Visible = False
    end
    object adsMasterOriginTable: TStringField
      FieldName = 'OriginTable'
      Visible = False
      Size = 30
    end
    object adsMasterBillAffix: TBytesField
      FieldName = 'BillAffix'
      Visible = False
      Size = 50
    end
    object adsMasterCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object adsMasterDate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
    end
    object adsMasterBillMode: TStringField
      DisplayLabel = #19994#21153#31867#21035
      FieldName = 'BillMode'
      Size = 16
    end
    object adsMasterBrief: TStringField
      DisplayLabel = #19994#21153#25688#35201
      FieldName = 'Brief'
      Size = 30
    end
    object adsMasterClearDate: TDateTimeField
      DisplayLabel = #32467#31639#26085#26399
      FieldName = 'ClearDate'
    end
    object adsMasterSundryFee: TBCDField
      FieldName = 'SundryFee'
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterClientName: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldKind = fkLookup
      FieldName = 'ClientName'
      LookupDataSet = WareHouseOutADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ClientID'
      Lookup = True
    end
    object adsMasterApportion: TStringField
      DisplayLabel = #20998#25674#35828#26126
      FieldName = 'Apportion'
      Size = 12
    end
    object adsMasterDeliver: TStringField
      DisplayLabel = #36865#36135
      FieldName = 'Deliver'
      Size = 30
    end
    object adsMasterMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object adsMasterEmployee: TStringField
      FieldKind = fkLookup
      FieldName = 'Employee'
      LookupDataSet = EmployeeName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'EmployeeID'
      Lookup = True
    end
    object adsMasterModeDC: TIntegerField
      FieldName = 'ModeDC'
      Visible = False
    end
    object adsMasterModeC: TIntegerField
      FieldName = 'ModeC'
      Visible = False
    end
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from STGoodsOutInDetail'#13#10'where MasterID = :ID'
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
    Top = 259
    object adsDetailID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
      OnChange = adsDetailGoodsIDChange
    end
    object adsDetailPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      Visible = False
    end
    object adsDetailGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object adsDetailGoodsName: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'GoodsName'
      LookupDataSet = GoodName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Size = 60
      Lookup = True
    end
    object adsDetailGoodsSpec: TStringField
      DisplayLabel = #39068#33394
      FieldName = 'GoodsSpec'
      Size = 30
    end
    object adsDetailQuantity: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'Quantity'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailPackUnit: TStringField
      DisplayLabel = #21253#35013#21333#20301
      FieldKind = fkLookup
      FieldName = 'PackUnit'
      LookupDataSet = PackUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsDetailPriceBase: TBCDField
      DisplayLabel = #25104#26412#21333#20215
      FieldName = 'PriceBase'
      Visible = False
      DisplayFormat = '#.00'
      Precision = 19
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'Amount'
      Visible = False
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailGoalQuantity: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'GoalQuantity'
      OnChange = adsDetailGoalQuantityChange
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailGoalUnit: TStringField
      DisplayLabel = #21333#20301
      FieldKind = fkLookup
      FieldName = 'GoalUnit'
      LookupDataSet = GoalUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoalUnitID'
      Lookup = True
    end
    object adsDetailPriceGoal: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PriceGoal'
      DisplayFormat = '#.00'
      Precision = 19
    end
    object adsDetailQuantityPcs: TBCDField
      DisplayLabel = #22343#30721
      FieldName = 'QuantityPcs'
      Visible = False
      OnChange = adsDetailSizeAChange
      Precision = 19
      Size = 5
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
    object adsDetailDiscount: TBCDField
      FieldName = 'Discount'
      Visible = False
      Precision = 19
    end
    object adsDetailTaxAmount: TBCDField
      FieldName = 'TaxAmount'
      Visible = False
      Precision = 19
    end
    object adsDetailSundryFee: TBCDField
      FieldName = 'SundryFee'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailCapStyle: TStringField
      DisplayLabel = #26479#22411
      FieldName = 'CapStyle'
      Size = 30
    end
    object adsDetailSizeA: TIntegerField
      DisplayLabel = 'S/70'
      FieldName = 'SizeA'
      OnChange = adsDetailSizeAChange
    end
    object adsDetailSizeB: TIntegerField
      DisplayLabel = 'M/75'
      FieldName = 'SizeB'
      OnChange = adsDetailSizeAChange
    end
    object adsDetailSizeC: TIntegerField
      DisplayLabel = 'L/80'
      FieldName = 'SizeC'
      OnChange = adsDetailSizeAChange
    end
    object adsDetailSizeD: TIntegerField
      DisplayLabel = 'XL/85'
      FieldName = 'SizeD'
      OnChange = adsDetailSizeAChange
    end
    object adsDetailSizeE: TIntegerField
      DisplayLabel = 'XXL/90'
      FieldName = 'SizeE'
      OnChange = adsDetailSizeAChange
    end
    object adsDetailSizeF: TIntegerField
      DisplayLabel = 'XXXL/95'
      FieldName = 'SizeF'
      OnChange = adsDetailSizeAChange
    end
  end
  object GoalUnit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 217
    Top = 259
  end
  object dsGoalUnit: TDataSource
    DataSet = GoalUnit
    Left = 218
    Top = 298
  end
  object WarehouseInADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name'#13#10'from STWarehouse'#13#10'where RecordState<>'#39#21024#38500#39#13#10'and ' +
      'not (UpID=-1'#13#10'and Name like '#39'%'#25152#26377'%'#39' '#13#10'or Name like '#39'%'#20840#37096'%'#39' )'#13#10
    Parameters = <>
    Left = 233
    Top = 38
  end
  object WarehouseInDS: TDataSource
    DataSet = WarehouseInADS
    Left = 233
    Top = 78
  end
  object PriceQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 345
    Top = 259
  end
  object TempAds1: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 280
    Top = 298
  end
  object GoodsSpecAds: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name'#13#10'from  DAAttribute'#13#10'where RecordState<>'#39#21024#38500#39' and ' +
      #13#10' SUBSTRING(LevelCode,1,3) in'#13#10'(select substring(LevelCode,1,3)' +
      ' as LevelCode from DAAttribute'#13#10'where name like '#39'%'#39068#33394'%'#39')'#13#10'and LEN' +
      ' (LevelCode)>3'
    Parameters = <>
    Left = 125
    Top = 263
  end
  object GoodsSpecDs: TDataSource
    DataSet = GoodsSpecAds
    Left = 125
    Top = 298
  end
  object CapStyleAds: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name'#13#10'from  DAAttribute'#13#10'where RecordState<>'#39#21024#38500#39' and ' +
      #13#10' SUBSTRING(LevelCode,1,3) in'#13#10'(select substring(LevelCode,1,3)' +
      ' as LevelCode from DAAttribute'#13#10'where name like '#39'%'#22411'%'#39')'#13#10'and LEN ' +
      '(LevelCode)>3'
    Parameters = <>
    Left = 397
    Top = 271
  end
  object CapStyleDs: TDataSource
    DataSet = CapStyleAds
    Left = 397
    Top = 306
  end
end
