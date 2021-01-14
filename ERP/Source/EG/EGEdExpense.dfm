inherited EGEdExpenseForm: TEGEdExpenseForm
  Left = 29
  Top = 156
  Width = 806
  Height = 491
  Caption = #39033#30446#36153#29992#21333
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
    Top = 184
    Width = 798
    Height = 237
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        Title.Alignment = taCenter
        Title.Caption = #39033#30446#36153#29992#21517#31216
        Width = 217
        Visible = True
        ControlType = ctCustomControl
        CustomControl = GoodsLookup
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Alignment = taCenter
        Width = 138
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 341
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 798
  end
  inherited TopPanel: TPanel
    Width = 798
    Height = 155
    inherited RemarkLabel: TLabel
      Left = 12
      Top = 109
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
      Caption = #39033#30446#21517#31216
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
    object Label9: TLabel [6]
      Left = 14
      Top = 45
      Width = 48
      Height = 12
      Caption = #19994#21153#25688#35201
    end
    inherited RemarkDBEdit: TDBEdit
      Top = 105
      Width = 385
      DataField = 'Memo'
      TabOrder = 6
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
    object DBEdit1: TDBEdit
      Left = 510
      Top = 64
      Width = 140
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      ReadOnly = True
      TabOrder = 5
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
      ParentCtl3D = False
      TabOrder = 0
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 421
    Width = 798
    Height = 24
  end
  object GoodsLookup: TQLDBLookupComboBox [5]
    Left = 16
    Top = 200
    Width = 217
    Height = 20
    DataField = 'GoodsID'
    DataSource = DetailDataSource
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsExpense
    TabOrder = 4
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsMaster
    Left = 93
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
  end
  inherited MainMenu: TMainMenu
    Left = 344
    Top = 2
    inherited ViewMenuItem: TMenuItem
      inherited N13: TMenuItem
        Visible = False
      end
      inherited A4: TMenuItem
        Visible = False
      end
      object MaterialBalance: TMenuItem
        Caption = #26448#26009#24211#23384
        OnClick = MaterialBalanceClick
      end
    end
    inherited A3: TMenuItem
      Visible = False
    end
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 384
    Top = 0
  end
  object EmployeeName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 197
    Top = 32
  end
  object GoodName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAExpenseClass '#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 91
    Top = 239
  end
  object PackUnit: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 173
    Top = 239
  end
  object dsPackUnit: TDataSource
    DataSet = PackUnit
    Left = 173
    Top = 274
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
    CommandText = 
      'select *'#13#10'from EGExpenseMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ID=:' +
      'ID'
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
    Left = 88
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
    object adsMasterProjectName: TStringField
      FieldKind = fkLookup
      FieldName = 'ProjectName'
      LookupDataSet = ClientName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ClientID'
      Lookup = True
    end
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from EGExpenseDetail'#13#10'where MasterID = :ID'
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
    end
    object adsDetailGoodsSpec: TStringField
      DisplayLabel = #35268#26684#22411#21495
      FieldName = 'GoodsSpec'
      Visible = False
      Size = 30
    end
    object adsDetailQuantity: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'Quantity'
      Visible = False
      OnChange = adsDetailQuantityChange
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      Visible = False
    end
    object adsDetailPriceBase: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PriceBase'
      Visible = False
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsDetailPackUnit: TStringField
      DisplayLabel = #21253#35013#21333#20301
      FieldKind = fkLookup
      FieldName = 'PackUnit'
      LookupDataSet = PackUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Visible = False
      Lookup = True
    end
    object adsDetailQuantityPcs: TBCDField
      DisplayLabel = #38646#25968
      FieldName = 'QuantityPcs'
      Visible = False
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
      Visible = False
      Lookup = True
    end
    object adsDetailGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object adsDetailGoalQuantity: TBCDField
      DisplayLabel = #26631#20934#25968#37327
      FieldName = 'GoalQuantity'
      ReadOnly = True
      Visible = False
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
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
    object adsDetailAmount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
  end
  object dsExpense: TDataSource
    DataSet = GoodName
    Left = 92
    Top = 274
  end
  object GoalUnit: TADODataSet
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
  object AdsWareHouse: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from STWarehouse'#13#10'where RecordState<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 266
    Top = 32
  end
  object DsWareHouse: TDataSource
    DataSet = AdsWareHouse
    Left = 269
    Top = 65
  end
  object ClientName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from DAProject'#13#10'where RecordState<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 146
    Top = 32
  end
  object DSClientName: TDataSource
    DataSet = ClientName
    Left = 149
    Top = 65
  end
end
