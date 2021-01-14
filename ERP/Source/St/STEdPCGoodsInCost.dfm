inherited STEdPCGoodsInCostForm: TSTEdPCGoodsInCostForm
  Left = 2
  Top = 134
  Width = 808
  Height = 580
  Caption = #37319#36141#25104#26412#26680#31639
  WindowState = wsMaximized
  OnActivate = FormActivate
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
    Top = 187
    Width = 800
    Height = 323
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 231
        Visible = True
        ControlType = ctCustomControl
      end
      item
        Expanded = False
        FieldName = 'GoodsSpec'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 112
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoalUnit'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 61
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoalQuantity'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceGoal'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SundryFee'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceCost'
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 800
  end
  inherited TopPanel: TPanel
    Width = 800
    Height = 158
    inherited RemarkLabel: TLabel
      Left = 12
      Top = 136
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
    object Label2: TLabel [3]
      Left = 355
      Top = 44
      Width = 36
      Height = 12
      Caption = #32463#25163#20154
    end
    object Label3: TLabel [4]
      Left = 510
      Top = 45
      Width = 48
      Height = 12
      Caption = #19994#21153#31867#22411
    end
    object Label5: TLabel [5]
      Left = 12
      Top = 5
      Width = 48
      Height = 12
      Caption = #20179#24211#31649#29702
    end
    object Label9: TLabel [6]
      Left = 12
      Top = 45
      Width = 48
      Height = 12
      Caption = #19994#21153#25688#35201
    end
    object Label1: TLabel [7]
      Left = 12
      Top = 86
      Width = 72
      Height = 12
      Caption = #19978#27425#26680#31639#26085#26399
    end
    object Label4: TLabel [8]
      Left = 531
      Top = 86
      Width = 48
      Height = 12
      Caption = #26680#31639#26041#24335
    end
    object Label7: TLabel [9]
      Left = 267
      Top = 86
      Width = 48
      Height = 12
      Caption = #38468#21152#36153#29992
    end
    object Label6: TLabel [10]
      Left = 399
      Top = 86
      Width = 48
      Height = 12
      Caption = #38388#25509#36153#29992
    end
    object SpeedButton1: TSpeedButton [11]
      Left = 283
      Top = 133
      Width = 55
      Height = 20
      Caption = #25552#21462#25968#25454
      Enabled = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton [12]
      Left = 590
      Top = 133
      Width = 55
      Height = 20
      Caption = #20998#37197#36153#29992
      Enabled = False
      PopupMenu = FeeAportPopupMenu
      OnClick = SpeedButton2Click
    end
    object Label10: TLabel [13]
      Left = 144
      Top = 86
      Width = 72
      Height = 12
      Caption = #25130#27490#26680#31639#26085#26399
    end
    object SpeedButton3: TSpeedButton [14]
      Left = 651
      Top = 133
      Width = 55
      Height = 20
      Caption = #26356#26032#25104#26412
      Visible = False
      OnClick = SpeedButton3Click
    end
    inherited RemarkDBEdit: TDBEdit
      Top = 132
      Width = 229
      DataField = 'Memo'
      TabOrder = 10
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
      Top = 61
      Width = 328
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 3
    end
    object ClientQLDBLookup: TQLDBLookupComboBox
      Left = 12
      Top = 20
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
      ListSource = DSClientName
      ParentCtl3D = False
      TabOrder = 0
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object DBEdit2: TDBEdit
      Left = 12
      Top = 105
      Width = 110
      Height = 20
      DataField = 'LastCostDate'
      DataSource = MasterDataSource
      ReadOnly = True
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 531
      Top = 105
      Width = 120
      Height = 20
      DataField = 'Apportion'
      DataSource = MasterDataSource
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 9
    end
    object DBEdit5: TDBEdit
      Left = 267
      Top = 105
      Width = 120
      Height = 20
      DataField = 'SundryFee'
      DataSource = MasterDataSource
      ReadOnly = True
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 399
      Top = 105
      Width = 120
      Height = 20
      DataField = 'IndirectFee'
      DataSource = MasterDataSource
      TabOrder = 8
      OnExit = DBEdit4Exit
    end
    object BitBtn1: TBitBtn
      Left = 344
      Top = 133
      Width = 55
      Height = 20
      Hint = #25353#21152#26435#24179#22343#27861#35745#31639#21457#20986#21830#21697#25104#26412#12290
      Caption = #21152#26435#24179#22343
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = BitBtn1Click
    end
    object BitBtn3: TBitBtn
      Left = 467
      Top = 133
      Width = 55
      Height = 20
      Hint = #25353#21518#36827#20808#20986#27861#35745#31639#21457#20986#21830#21697#25104#26412#12290
      Caption = #21518#36827#20808#20986
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 12
      OnClick = BitBtn3Click
    end
    object BitBtn2: TBitBtn
      Left = 405
      Top = 133
      Width = 55
      Height = 20
      Hint = #25353#20808#36827#20808#20986#27861#35745#31639#21457#20986#21830#21697#25104#26412#12290
      Caption = #20808#36827#20808#20986
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 13
      OnClick = BitBtn2Click
    end
    object BitBtn4: TBitBtn
      Left = 528
      Top = 133
      Width = 55
      Height = 20
      Hint = #25353#24066#22330#23450#20215#27861#35745#31639#21457#20986#21830#21697#25104#26412#12290#27492#21151#33021#20063#21487#20197#30452#25509#29992#20110#37325#32622#35745#20215#27861#12289#33258#23450#35745#20215#31561#25104#26412#35745#31639#26041#27861#12290
      Caption = #24066#22330#23450#20215
      Enabled = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 14
      OnClick = BitBtn4Click
    end
    object DBEdit1: TDBEdit
      Left = 510
      Top = 61
      Width = 140
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      TabOrder = 5
    end
    object DBEdit6: TDBEdit
      Left = 144
      Top = 105
      Width = 110
      Height = 20
      DataField = 'ClearDate'
      DataSource = MasterDataSource
      TabOrder = 15
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 510
    Width = 800
    Height = 24
  end
  object TpcPanel: TPanel [5]
    Left = 272
    Top = 304
    Width = 281
    Height = 53
    Caption = #27491#22312#22788#29702#25968#25454','#35831#31245#21518'....'
    Color = cl3DLight
    TabOrder = 4
    Visible = False
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
  end
  inherited MainMenu: TMainMenu
    Left = 392
    Top = 1
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 456
    Top = 1
  end
  object ClientName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 153
    Top = 38
  end
  object EmployeeName: TADODataSet
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
    Left = 80
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
    Left = 172
    Top = 259
  end
  object dsPackUnit: TDataSource
    DataSet = PackUnit
    Left = 172
    Top = 298
  end
  object DSClientName: TDataSource
    DataSet = ClientName
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
    Left = 264
    Top = 260
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select *'#13#10'from STPCGoodsInCostMaster'#13#10'where RecordState<>'#39#21024#38500#39' an' +
      'd ID=:ID'
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
    object adsMasterLastCostDate: TDateTimeField
      FieldName = 'LastCostDate'
    end
    object adsMasterSundryFee: TBCDField
      FieldName = 'SundryFee'
      DisplayFormat = '#,#.00'
      EditFormat = '#'
      Precision = 19
      Size = 5
    end
    object adsMasterIndirectFee: TBCDField
      FieldName = 'IndirectFee'
      DisplayFormat = '#,#.00'
      EditFormat = '#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterClientName: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldKind = fkLookup
      FieldName = 'ClientName'
      LookupDataSet = ClientName
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
    CommandText = 'select *'#13#10'from STPCGoodsInCostDetail'#13#10'where MasterID = :ID'
    IndexFieldNames = 'ID'
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
      Visible = False
    end
    object adsDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
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
      DisplayLabel = #35268#26684#22411#21495
      FieldName = 'GoodsSpec'
      Size = 30
    end
    object adsDetailGoalUnit: TStringField
      DisplayLabel = #26631#20934#21333#20301
      FieldKind = fkLookup
      FieldName = 'GoalUnit'
      LookupDataSet = GoalUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoalUnitID'
      Lookup = True
    end
    object adsDetailGoalQuantity: TBCDField
      DisplayLabel = #26631#20934#25968#37327
      FieldName = 'GoalQuantity'
      Visible = False
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailPriceBase: TBCDField
      DisplayLabel = #21253#35013#25104#26412#21333#20215
      FieldName = 'PriceBase'
      Visible = False
      DisplayFormat = '#,#.000'
      Precision = 19
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #36141#20837#25104#26412#37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailSundryFee: TBCDField
      DisplayLabel = #36153#29992#20998#37197#37329#39069
      FieldName = 'SundryFee'
      OnChange = adsDetailSundryFeeChange
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailPriceGoal: TBCDField
      DisplayLabel = #36141#20837#25104#26412#21333#20215
      FieldName = 'PriceGoal'
      OnChange = adsDetailPriceGoalChange
      DisplayFormat = '#,#.000'
      Precision = 19
    end
    object adsDetailPriceCost: TBCDField
      DisplayLabel = #26680#31639#25104#26412#21333#20215
      FieldName = 'PriceCost'
      DisplayFormat = '#,#.000'
      Precision = 19
    end
    object adsDetailQuantity: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'Quantity'
      Visible = False
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailPackunit: TStringField
      DisplayLabel = #21253#35013#21333#20301
      FieldKind = fkLookup
      FieldName = 'Packunit'
      LookupDataSet = PackUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsDetailQuantityPcs: TBCDField
      DisplayLabel = #26680#31639#25104#26412
      FieldName = 'QuantityPcs'
      DisplayFormat = '#,#.000'
      Precision = 19
      Size = 5
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #38468#27880
      FieldName = 'Memo'
      Size = 30
    end
    object adsDetailTaxAmount: TBCDField
      FieldName = 'TaxAmount'
      Visible = False
      Precision = 19
    end
    object adsDetailDiscount: TBCDField
      FieldName = 'Discount'
      Visible = False
      Precision = 19
    end
    object adsDetailOriginID: TIntegerField
      FieldName = 'OriginID'
    end
    object adsDetailOriginTable: TStringField
      FieldName = 'OriginTable'
      Size = 30
    end
  end
  object adsGoodsSpec: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name  from DAAttribute  '#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 126
    Top = 259
  end
  object dsGoodsSpec: TDataSource
    DataSet = adsGoodsSpec
    Left = 126
    Top = 298
  end
  object adsWarehouse: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from STWarehouse'#13#10'where RecordState<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 233
    Top = 38
  end
  object dsWarehouse: TDataSource
    DataSet = adsWarehouse
    Left = 233
    Top = 78
  end
  object FeeAportPopupMenu: TPopupMenu
    Left = 600
    Top = 217
    object MenuItem1: TMenuItem
      Caption = #25353#37329#39069#20998#25674
      Hint = #25353#36153#29992#25353#24403#21069#37329#39069#20998#25674#35760#20837#25104#26412#12290
      ImageIndex = 0
      ShortCut = 16449
      OnClick = MenuItem1Click
    end
    object MenuItem2: TMenuItem
      Caption = #25353#25968#37327#20998#25674
      Hint = #25353#36153#29992#25353#24403#21069#25968#37327#20998#25674#35760#20837#25104#26412#12290
      ShortCut = 16450
      OnClick = MenuItem2Click
    end
    object ClearSundryFeeAct: TMenuItem
      Caption = #28165#38500#20998#25674#25968#25454
      ShortCut = 16451
      OnClick = ClearSundryFeeActClick
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
    Left = 218
    Top = 260
  end
  object dsGoalUnit: TDataSource
    DataSet = GoalUnit
    Left = 218
    Top = 299
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 312
    Top = 260
  end
  object TempQry: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 368
    Top = 260
  end
end
