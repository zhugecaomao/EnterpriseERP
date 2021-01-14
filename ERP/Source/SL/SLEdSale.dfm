inherited SLEdSaleForm: TSLEdSaleForm
  Left = -4
  Top = -4
  Width = 808
  Height = 612
  Caption = #38144#21806#24320#21333
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
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
    Top = 202
    Width = 800
    Height = 340
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
        FieldName = 'GoodsSpec'
        Title.Alignment = taCenter
        Width = 138
        Visible = True
        ControlType = ctCustomControl
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PackUnit'
        Title.Alignment = taCenter
        Width = 50
        Visible = True
        ControlType = ctCustomControl
        CustomControl = LookupPackUint
      end
      item
        Expanded = False
        FieldName = 'PriceBase'
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
        FieldName = 'GoalUnit'
        ReadOnly = True
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
    inherited ToolButton5: TToolButton
      Action = FillInPrintAction
    end
    inherited ToolButton11: TToolButton
      Action = FillInPrintAction
    end
    inherited ToolButton12: TToolButton
      Action = RepeatPrintAction
    end
  end
  inherited TopPanel: TPanel
    Width = 800
    Height = 173
    inherited RemarkLabel: TLabel
      Left = 12
      Top = 127
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
      Top = 42
      Width = 36
      Height = 12
      Caption = #32463#25163#20154
    end
    object Label3: TLabel [5]
      Left = 510
      Top = 43
      Width = 48
      Height = 12
      Caption = #19994#21153#31867#22411
    end
    object Label5: TLabel [6]
      Left = 510
      Top = 127
      Width = 72
      Height = 12
      Caption = #24212#25910#24080#27454#20313#39069
    end
    object Label6: TLabel [7]
      Left = 12
      Top = 86
      Width = 48
      Height = 12
      Caption = #36865#36135#35201#27714
    end
    object Label7: TLabel [8]
      Left = 510
      Top = 86
      Width = 48
      Height = 12
      Caption = #32467#31639#26085#26399
    end
    object Label9: TLabel [9]
      Left = 12
      Top = 43
      Width = 48
      Height = 12
      Caption = #19994#21153#25688#35201
    end
    object Label10: TLabel [10]
      Left = 235
      Top = 86
      Width = 48
      Height = 12
      Caption = #38468#21152#36153#29992
    end
    object Label4: TLabel [11]
      Left = 355
      Top = 86
      Width = 96
      Height = 12
      Caption = #38468#21152#36153#29992#20998#25674#35828#26126
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 12
      Top = 143
      Width = 328
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
      Top = 59
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
      Top = 59
      Width = 328
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 510
      Top = 62
      Width = 140
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      ReadOnly = True
      TabOrder = 5
    end
    object DBEdit2: TDBEdit
      Left = 12
      Top = 101
      Width = 213
      Height = 20
      DataField = 'Deliver'
      DataSource = MasterDataSource
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 234
      Top = 101
      Width = 106
      Height = 20
      DataField = 'SundryFee'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 355
      Top = 101
      Width = 140
      Height = 20
      DataField = 'Apportion'
      DataSource = MasterDataSource
      TabOrder = 8
    end
    object DBEdit5: TDBEdit
      Left = 510
      Top = 102
      Width = 140
      Height = 20
      DataField = 'ClearDate'
      DataSource = MasterDataSource
      TabOrder = 9
    end
    object NoCreditSale: TCheckBox
      Left = 355
      Top = 125
      Width = 120
      Height = 17
      Caption = #25910#29616#27454#21450#29616#27454#25240#25187
      TabOrder = 11
      OnClick = NoCreditSaleClick
    end
    object DBEdit6: TDBEdit
      Left = 355
      Top = 143
      Width = 140
      Height = 20
      DataField = 'CashDiscount'
      DataSource = MasterDataSource
      TabOrder = 12
      OnEnter = DBEdit6Enter
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 542
    Width = 800
    Height = 24
  end
  inherited GoodsLookup: TQLDBLookupComboBox
    Left = 16
    Top = 217
    Width = 185
  end
  object LookupPackUint: TQLDBLookupComboBox [6]
    Left = 382
    Top = 219
    Width = 100
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'PackUnitID'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsPackUnit
    OnEnter = LookupPackUintEnter
    OnExit = LookupPackUintExit
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
    Top = 172
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
    object FillInPrintAction: TAction
      Caption = #22871#25171#21333#25454
      Hint = #25353#27492#38190#22871#25171#24403#21069#21333#25454#65292#35831#27880#24847#25171#21360#26426#21644#25171#21360#32440#20934#22791#22949#24403#12290
      ImageIndex = 4
      OnExecute = FillInPrintActionExecute
    end
    object RepeatPrintAction: TAction
      Caption = #37325#25171#21333#25454
      Hint = #25353#27492#38190#21487#37325#25171#21333#25454#65292#25171#21360#32467#26524#21487#20197#33258#30001#35843#25972#12290
      ImageIndex = 4
      OnExecute = RepeatPrintActionExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 344
    Top = 8
    inherited FileMenuItem: TMenuItem
      object FillInPrintMenu: TMenuItem [10]
        Action = FillInPrintAction
      end
      object RepeatPrintMenu: TMenuItem [11]
        Action = RepeatPrintAction
      end
    end
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 384
    Top = 0
    object DiscountTempAct: TMenuItem
      Caption = #20020#26102#25240#25187'(&C)'
      ShortCut = 16451
      OnClick = DiscountTempActClick
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
  object PackUnit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39' '#13#10'order by GoalUnitID, ExchangeRa' +
      'te'
    Parameters = <>
    Left = 173
    Top = 239
  end
  object dsPackUnit: TDataSource
    DataSet = PackUnit
    Left = 173
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
    Left = 96
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
      DisplayLabel = #35268#26684#22411#21495
      FieldName = 'GoodsSpec'
      Size = 30
    end
    object adsDetailQuantity: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'Quantity'
      OnChange = adsDetailQuantityChange
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
      DisplayLabel = #21253#35013#21333#20215
      FieldName = 'PriceBase'
      OnChange = adsDetailQuantityChange
      DisplayFormat = '#.00##'
      Precision = 19
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailGoalQuantity: TBCDField
      DisplayLabel = #26631#20934#25968#37327
      FieldName = 'GoalQuantity'
      DisplayFormat = '#,#.00##'
      Precision = 19
      Size = 5
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
    object adsDetailPriceGoal: TBCDField
      DisplayLabel = #26631#20934#21333#20215
      FieldName = 'PriceGoal'
      DisplayFormat = '#.00##'
      Precision = 19
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
    object adsDetailQuantityPcs: TBCDField
      DisplayLabel = #38646#25968
      FieldName = 'QuantityPcs'
      Visible = False
      OnChange = adsDetailQuantityChange
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailTaxAmount: TBCDField
      DisplayLabel = #31246#37329
      FieldName = 'TaxAmount'
      Visible = False
      currency = True
      Precision = 19
    end
    object adsDetailDiscount: TBCDField
      DisplayLabel = #25240#25187#37329#39069
      FieldName = 'Discount'
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
    object adsDetailPriceCost: TBCDField
      FieldName = 'PriceCost'
      Precision = 19
    end
    object adsDetailPriceRate: TFloatField
      FieldName = 'PriceRate'
      Visible = False
    end
    object adsDetailDiscountAmount: TFloatField
      FieldName = 'DiscountAmount'
      Visible = False
    end
    object adsDetailPriceStandard: TFloatField
      FieldName = 'PriceStandard'
      Visible = False
    end
  end
  object adsGoodsSpec: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name  from DAAttribute  '#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 132
    Top = 239
  end
  object dsGoodsSpec: TDataSource
    DataSet = adsGoodsSpec
    Left = 132
    Top = 274
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
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 352
    Top = 239
  end
  object PackUintFltAQ: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 405
    Top = 247
  end
  object PackUintFltDS: TDataSource
    DataSet = PackUintFltAQ
    Left = 405
    Top = 282
  end
end
