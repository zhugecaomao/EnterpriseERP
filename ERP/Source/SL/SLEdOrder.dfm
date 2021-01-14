inherited SLEdOrderForm: TSLEdOrderForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #38144#21806#35746#21333
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
    Top = 184
    Width = 800
    Height = 326
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        Title.Alignment = taCenter
        Width = 200
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoodsSpec'
        Title.Alignment = taCenter
        Width = 140
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
        FieldName = 'GoalQuantity'
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
  end
  inherited TopPanel: TPanel
    Width = 800
    Height = 155
    inherited RemarkLabel: TLabel
      Left = 12
      Top = 134
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
      Caption = #35746#36135#23458#25143
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
      Left = 434
      Top = 134
      Width = 72
      Height = 12
      Caption = #24212#25910#24080#27454#20313#39069
    end
    object Label6: TLabel [7]
      Left = 12
      Top = 88
      Width = 48
      Height = 12
      Caption = #20132#36135#26041#24335
    end
    object Label7: TLabel [8]
      Left = 510
      Top = 88
      Width = 48
      Height = 12
      Caption = #20132#36135#26085#26399
    end
    object Label9: TLabel [9]
      Left = 14
      Top = 45
      Width = 48
      Height = 12
      Caption = #19994#21153#25688#35201
    end
    object Label10: TLabel [10]
      Left = 235
      Top = 88
      Width = 48
      Height = 12
      Caption = #38468#21152#36153#29992
    end
    object Label4: TLabel [11]
      Left = 355
      Top = 88
      Width = 96
      Height = 12
      Caption = #38468#21152#36153#29992#20998#25674#35828#26126
    end
    inherited RemarkDBEdit: TDBEdit
      Top = 130
      Width = 385
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
    object DBEdit1: TDBEdit
      Left = 510
      Top = 64
      Width = 140
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      TabOrder = 5
    end
    object DBEdit2: TDBEdit
      Left = 12
      Top = 103
      Width = 213
      Height = 20
      DataField = 'Deliver'
      DataSource = MasterDataSource
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 232
      Top = 103
      Width = 121
      Height = 20
      DataField = 'SundryFee'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object DBEdit4: TDBEdit
      Left = 355
      Top = 103
      Width = 140
      Height = 20
      DataField = 'Apportion'
      DataSource = MasterDataSource
      TabOrder = 8
    end
    object DBEdit5: TDBEdit
      Left = 510
      Top = 104
      Width = 140
      Height = 20
      DataField = 'ClearDate'
      DataSource = MasterDataSource
      TabOrder = 9
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 510
    Width = 800
    Height = 24
  end
  inherited GoodsLookup: TQLDBLookupComboBox
    Left = 16
    Top = 203
    Width = 193
  end
  object LookupPackUint: TQLDBLookupComboBox [6]
    Left = 448
    Top = 201
    Width = 81
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
    Top = 160
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
    Left = 104
    Top = 66
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsDetail
    Left = 24
    Top = 288
  end
  inherited ActionList: TActionList
    Left = 416
    Top = 2
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
    object TempOrderTrail: TAction [15]
      Caption = #20020#26102#35746#21333#36319#36394
      Hint = #36319#36394#24403#21069#23458#25143#35746#21333
      ImageIndex = 7
    end
    inherited FindAction: TAction [16]
    end
    inherited CloseAction: TAction [17]
    end
  end
  inherited MainMenu: TMainMenu
    Left = 448
    Top = 2
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 376
    Top = 0
  end
  object ClientName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name'#13#10'from DAClient'#13#10'where RecordState<>'#39#21024#38500#39#13#10'and Cli' +
      'entType <>'#39#21378#21830#39
    Parameters = <>
    Left = 144
    Top = 34
  end
  object EmployeeName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 184
    Top = 34
  end
  object GoodName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 71
    Top = 253
  end
  object PackUnit: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 167
    Top = 253
  end
  object dsPackUnit: TDataSource
    DataSet = PackUnit
    Left = 167
    Top = 288
  end
  object DSClientName: TDataSource
    DataSet = ClientName
    Left = 144
    Top = 66
  end
  object DSEmployeeName: TDataSource
    DataSet = EmployeeName
    Left = 184
    Top = 66
  end
  object TempAds: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 263
    Top = 253
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select *'#13#10'from SLOrderMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ID=:ID'
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
    Left = 104
    Top = 34
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
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from SLOrderDetail'#13#10'where MasterID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 24
    Top = 253
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
      OnChange = adsDetailGoodsIDChange
    end
    object adsDetailPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      Visible = False
      OnChange = adsDetailQuantityChange
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
      DisplayLabel = #21333#20215
      FieldName = 'PriceBase'
      OnChange = adsDetailQuantityChange
      DisplayFormat = '#.00'
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
      DisplayFormat = '#,#.00'
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
      DisplayFormat = '#.00'
      Precision = 19
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
    object adsDetailDiscount: TBCDField
      DisplayLabel = #25240#25187#37329#39069
      FieldName = 'Discount'
      currency = True
      Precision = 19
    end
    object adsDetailTaxAmount: TBCDField
      DisplayLabel = #31246#37329
      FieldName = 'TaxAmount'
      currency = True
      Precision = 19
    end
    object adsDetailSundryFee: TBCDField
      DisplayLabel = #38468#21152#36153#29992
      FieldName = 'SundryFee'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailQuantityPcs: TBCDField
      DisplayLabel = #38646#25968
      FieldName = 'QuantityPcs'
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
  end
  object adsGoodsSpec: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name  from DAAttribute  '#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 119
    Top = 253
  end
  object dsGoodsSpec: TDataSource
    DataSet = adsGoodsSpec
    Left = 119
    Top = 288
  end
  object GoalUnit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 216
    Top = 253
  end
  object dsGoalUnit: TDataSource
    DataSet = GoalUnit
    Left = 215
    Top = 288
  end
  object PackUintFltAQ: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 317
    Top = 287
  end
  object PackUintFltDS: TDataSource
    DataSet = PackUintFltAQ
    Left = 317
    Top = 322
  end
end
