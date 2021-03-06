inherited SLEdSaleClothForm: TSLEdSaleClothForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #38144#21806#24320#21333
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
    Top = 200
    Width = 800
    Height = 310
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        Title.Alignment = taCenter
        Width = 228
        Visible = True
        ControlType = ctCustomControl
        CustomControl = GoodsLookup
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
        CustomControl = GoodsSpecLKUP
      end
      item
        Expanded = False
        FieldName = 'CapStyle'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
        ControlType = ctCustomControl
        CustomControl = CapStyleLKup
      end
      item
        Expanded = False
        FieldName = 'SizeA'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SizeB'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SizeC'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SizeD'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SizeE'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SizeF'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QuantityPcs'
        Title.Alignment = taCenter
        Width = 50
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
    inherited ToolButton11: TToolButton
      Action = FilePrintAction
    end
  end
  inherited TopPanel: TPanel
    Width = 800
    Height = 171
    inherited RemarkLabel: TLabel
      Left = 12
      Top = 124
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
      Caption = #23458#25143#21517#31216
    end
    object Label2: TLabel [4]
      Left = 355
      Top = 43
      Width = 36
      Height = 12
      Caption = #32463#25163#20154
    end
    object Label3: TLabel [5]
      Left = 510
      Top = 44
      Width = 48
      Height = 12
      Caption = #19994#21153#31867#22411
    end
    object Label5: TLabel [6]
      Left = 510
      Top = 124
      Width = 72
      Height = 12
      Caption = #24212#25910#24080#27454#20313#39069
    end
    object Label6: TLabel [7]
      Left = 12
      Top = 85
      Width = 48
      Height = 12
      Caption = #20986#36135#20179#24211
    end
    object Label7: TLabel [8]
      Left = 510
      Top = 85
      Width = 48
      Height = 12
      Caption = #32467#31639#26085#26399
    end
    object Label9: TLabel [9]
      Left = 12
      Top = 44
      Width = 48
      Height = 12
      Caption = #19994#21153#25688#35201
    end
    object Label10: TLabel [10]
      Left = 219
      Top = 85
      Width = 48
      Height = 12
      Caption = #38468#21152#36153#29992
    end
    object Label4: TLabel [11]
      Left = 355
      Top = 85
      Width = 48
      Height = 12
      Caption = #36865#36135#35201#27714
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 12
      Top = 139
      Width = 328
      DataField = 'Memo'
      TabOrder = 9
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
    object ClientQLDBLookup: TQLDBLookupComboBox
      Left = 12
      Top = 21
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
      OnEnter = ClientQLDBLookupEnter
      OnExit = ClientQLDBLookupExit
      ParentCtl3D = False
      TabOrder = 0
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object LookupEmployee: TQLDBLookupComboBox
      Left = 355
      Top = 60
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
      Top = 60
      Width = 328
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 510
      Top = 63
      Width = 140
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit3: TDBEdit
      Left = 219
      Top = 100
      Width = 121
      Height = 20
      DataField = 'SundryFee'
      DataSource = MasterDataSource
      TabOrder = 6
    end
    object DBEdit4: TDBEdit
      Left = 355
      Top = 100
      Width = 140
      Height = 20
      DataField = 'Deliver'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object DBEdit5: TDBEdit
      Left = 510
      Top = 101
      Width = 140
      Height = 20
      DataField = 'ClearDate'
      DataSource = MasterDataSource
      TabOrder = 8
    end
    object NoCreditSale: TCheckBox
      Left = 355
      Top = 122
      Width = 118
      Height = 17
      Caption = #25910#29616#27454#21450#29616#27454#25240#25187
      TabOrder = 10
      OnClick = NoCreditSaleClick
    end
    object DBEdit6: TDBEdit
      Left = 355
      Top = 139
      Width = 140
      Height = 20
      DataField = 'CashDiscount'
      DataSource = MasterDataSource
      ReadOnly = True
      TabOrder = 11
      OnEnter = DBEdit6Enter
    end
    object QLDBLookupComboBox1: TQLDBLookupComboBox
      Left = 12
      Top = 100
      Width = 203
      Height = 20
      DataField = 'WarehouseID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = WareHouseIDDS
      TabOrder = 12
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
    Left = 16
    Top = 218
    Width = 225
  end
  object GoodsSpecLKUP: TQLDBLookupComboBox [6]
    Left = 240
    Top = 321
    Width = 105
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
  object GEdit1: TGEdit [7]
    Left = 510
    Top = 171
    Width = 140
    Height = 20
    AutoSelect = True
    TabOrder = 6
    Text = '0.00'
    Alignment = taRightJustify
    Currency = False
    Warning = #36755#20837#30340#25968#23383#38169#35823#65292#35831#37325#26032#36755#20837#25968#25454
    NeedWarning = True
    WarningFocus = True
  end
  object CapStyleLKup: TQLDBLookupComboBox [8]
    Left = 392
    Top = 321
    Width = 105
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
    TabOrder = 7
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsMaster
    Left = 101
    Top = 65
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsDetail
    Left = 50
    Top = 274
  end
  inherited ActionList: TActionList
    Left = 307
    Top = 65535
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
    inherited FindAction: TAction [16]
    end
    inherited CloseAction: TAction [17]
    end
    object FilePrintAction: TAction
      Caption = #22871#25171#21333#25454
      Hint = #25353#27492#38190#22871#25171#24403#21069#21333#25454#65292#35831#27880#24847#25171#21360#26426#21644#25171#21360#32440#20934#22791#22949#24403#12290
      ImageIndex = 4
      OnExecute = FilePrintActionExecute
    end
    object SameQuantityAct: TAction
      Caption = #21508#23610#30721#25968#37327#30456#21516
      ImageIndex = 12
      ShortCut = 16471
      OnExecute = SameQuantityActExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 344
    Top = 2
    inherited FileMenuItem: TMenuItem
      object N33: TMenuItem [10]
        Action = FilePrintAction
      end
    end
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 384
    Top = 0
    object N41: TMenuItem
      Action = SameQuantityAct
    end
  end
  object ClientName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name'#13#10'from DAClient'#13#10'where RecordState<>'#39#21024#38500#39#13#10'and Cli' +
      'entType <>'#39#21378#21830#39
    Parameters = <>
    Left = 146
    Top = 32
  end
  object EmployeeName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 197
    Top = 32
  end
  object GoodName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 91
    Top = 239
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
    Top = 239
  end
  object GoodsSpecDs: TDataSource
    DataSet = GoodsSpecAds
    Left = 125
    Top = 274
  end
  object DSClientName: TDataSource
    DataSet = ClientName
    Left = 149
    Top = 65
  end
  object DSEmployeeName: TDataSource
    DataSet = EmployeeName
    Left = 197
    Top = 65
  end
  object TempAds: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 256
    Top = 239
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select *'#13#10'from SLSaleMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ID=:ID'
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
    Left = 102
    Top = 32
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
      DisplayFormat = 'yyyy-mm-dd'
      EditMask = '9999-99-99;1;_'
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
    object adsMasterEmployee: TStringField
      FieldKind = fkLookup
      FieldName = 'Employee'
      LookupDataSet = EmployeeName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'EmployeeID'
      Lookup = True
    end
    object adsMasterMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object adsMasterModeDC: TIntegerField
      FieldName = 'ModeDC'
      Visible = False
    end
    object adsMasterModeC: TIntegerField
      FieldName = 'ModeC'
      Visible = False
    end
    object adsMasterWarehouseID: TIntegerField
      FieldName = 'WarehouseID'
      Visible = False
    end
    object adsMasterCashDiscount: TBCDField
      DisplayLabel = #29616#37329#25240#25187
      FieldName = 'CashDiscount'
      DisplayFormat = '#,#.00'
      EditFormat = '#.00'
      Precision = 19
      Size = 5
    end
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from SLSaleDetail'#13#10'where MasterID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 50
    Top = 239
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
      OnChange = adsDetailPackUnitIDChange
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
    object adsDetailCapStyle: TStringField
      DisplayLabel = #26479#22411
      FieldName = 'CapStyle'
      Size = 30
    end
    object adsDetailSizeA: TIntegerField
      DisplayLabel = 'S/70'
      FieldName = 'SizeA'
      OnChange = adsDetailSizeAChange
      DisplayFormat = '#,#.'
      EditFormat = '#'
    end
    object adsDetailSizeB: TIntegerField
      DisplayLabel = 'M/75'
      FieldName = 'SizeB'
      OnChange = adsDetailSizeAChange
      DisplayFormat = '#,#.'
      EditFormat = '#'
    end
    object adsDetailSizeC: TIntegerField
      DisplayLabel = 'L/80'
      FieldName = 'SizeC'
      OnChange = adsDetailSizeAChange
      DisplayFormat = '#,#.'
      EditFormat = '#'
    end
    object adsDetailSizeD: TIntegerField
      DisplayLabel = 'XL/85'
      FieldName = 'SizeD'
      OnChange = adsDetailSizeAChange
      DisplayFormat = '#,#.'
      EditFormat = '#'
    end
    object adsDetailSizeE: TIntegerField
      DisplayLabel = 'XXL/90'
      FieldName = 'SizeE'
      OnChange = adsDetailSizeAChange
      DisplayFormat = '#,#.'
      EditFormat = '#'
    end
    object adsDetailSizeF: TIntegerField
      DisplayLabel = 'XXXL/95'
      FieldName = 'SizeF'
      OnChange = adsDetailSizeAChange
      DisplayFormat = '#,#.'
      EditFormat = '#'
    end
    object adsDetailQuantityPcs: TBCDField
      DisplayLabel = #22343#30721
      FieldName = 'QuantityPcs'
      Visible = False
      OnChange = adsDetailSizeAChange
      DisplayFormat = '#,#.'
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
      OnChange = adsDetailGoalQuantityChange
      DisplayFormat = '#.00##'
      Precision = 19
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'Amount'
      DisplayFormat = '#.00'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailQuantity: TBCDField
      DisplayLabel = #21253#35013#25968#37327
      FieldName = 'Quantity'
      DisplayFormat = '#,#.00##'
      Precision = 19
      Size = 5
    end
    object adsDetailPackUnit: TStringField
      DisplayLabel = #21253#35013#21333#20301
      FieldKind = fkLookup
      FieldName = 'PackUnit'
      LookupDataSet = GoodsSpecAds
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsDetailPriceBase: TBCDField
      DisplayLabel = #21253#35013#21333#20215
      FieldName = 'PriceBase'
      DisplayFormat = '#.00##'
      Precision = 19
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
    object adsDetailPriceCost: TBCDField
      FieldName = 'PriceCost'
      Precision = 19
    end
    object adsDetailDiscount: TBCDField
      DisplayLabel = #25240#25187#37329#39069
      FieldName = 'Discount'
      Visible = False
      currency = True
      Precision = 19
    end
    object adsDetailTaxAmount: TBCDField
      DisplayLabel = #31246#37329
      FieldName = 'TaxAmount'
      Visible = False
      currency = True
      Precision = 19
    end
    object adsDetailSundryFee: TBCDField
      DisplayLabel = #38468#21152#36153#29992
      FieldName = 'SundryFee'
      Visible = False
      currency = True
      Precision = 19
      Size = 5
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
    Left = 214
    Top = 239
  end
  object dsGoalUnit: TDataSource
    DataSet = GoalUnit
    Left = 214
    Top = 274
  end
  object TempActualCost: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 304
    Top = 239
  end
  object TpPackUnit: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 384
    Top = 248
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
    Left = 165
    Top = 239
  end
  object CapStyleDs: TDataSource
    DataSet = CapStyleAds
    Left = 165
    Top = 274
  end
  object WareHouseIDADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from STWareHouse'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 245
    Top = 32
  end
  object WareHouseIDDS: TDataSource
    DataSet = WareHouseIDADS
    Left = 245
    Top = 65
  end
end
