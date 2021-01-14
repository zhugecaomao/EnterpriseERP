inherited FNEdExpenseFRGForm: TFNEdExpenseFRGForm
  Left = 7
  Top = 111
  Width = 801
  Height = 527
  Caption = #25253#38144#30003#35831#21333
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
    FocusControl = DBEdit2
  end
  inherited DBGrid: TQLDBGrid
    Top = 219
    Width = 793
    Height = 238
    Columns = <
      item
        Expanded = False
        FieldName = 'Expense'
        Title.Alignment = taCenter
        Width = 160
        Visible = True
        ControlType = ctCustomControl
        CustomControl = LookExpenseID
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
        FieldName = 'BillCode'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AmountB'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Client'
        Title.Alignment = taCenter
        Visible = True
        ControlType = ctCustomControl
        CustomControl = ClientLKUP
      end
      item
        Expanded = False
        FieldName = 'Project'
        Title.Alignment = taCenter
        Visible = True
        ControlType = ctCustomControl
        CustomControl = ProjectLKUP
      end
      item
        Expanded = False
        FieldName = 'Assets'
        Title.Alignment = taCenter
        Visible = True
        ControlType = ctCustomControl
        CustomControl = AssetsLKUP
      end
      item
        Expanded = False
        FieldName = 'ApportionMode'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
        ControlType = ctCustomControl
        CustomControl = ApportionModeQLLkup
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
    Width = 793
  end
  inherited TopPanel: TPanel
    Width = 793
    Height = 190
    inherited RemarkLabel: TLabel
      Left = 18
      Top = 127
      Width = 24
      Caption = #22791#27880
    end
    inherited VoucherNoLabel: TLabel
      Left = 361
      Top = 5
      Width = 24
      Caption = #32534#21495
    end
    inherited VoucherDateLabel: TLabel
      Left = 516
      Top = 5
      Width = 24
      Caption = #26085#26399
    end
    object Label1: TLabel [3]
      Left = 18
      Top = 5
      Width = 60
      Height = 12
      Caption = #25253#38144#21463#27454#20154
    end
    object Label2: TLabel [4]
      Left = 361
      Top = 45
      Width = 36
      Height = 12
      Caption = #32463#25163#20154
    end
    object Label3: TLabel [5]
      Left = 516
      Top = 45
      Width = 48
      Height = 12
      Caption = #19994#21153#31867#21035
    end
    object Label5: TLabel [6]
      Left = 440
      Top = 169
      Width = 72
      Height = 12
      Caption = #20854#23427#24212#20184#20313#39069
    end
    object Label6: TLabel [7]
      Left = 18
      Top = 45
      Width = 48
      Height = 12
      Caption = #19994#21153#25688#35201
    end
    object Label7: TLabel [8]
      Left = 361
      Top = 88
      Width = 48
      Height = 12
      Caption = #20184#27454#37329#39069
      FocusControl = DBEdit2
    end
    object Label9: TLabel [9]
      Left = 18
      Top = 88
      Width = 48
      Height = 12
      Caption = #20184#27454#24080#25143
      FocusControl = DBEdit2
    end
    object Label4: TLabel [10]
      Left = 516
      Top = 88
      Width = 48
      Height = 12
      Hint = #25269#28040#20197#21069#30340#24080#27454#20313#39069#25968#25110#32773#35843#25972#24080#39033#12290
      Caption = #20914#24080#37329#39069
      FocusControl = DBEdit2
    end
    object Label10: TLabel [11]
      Left = 363
      Top = 127
      Width = 48
      Height = 12
      Caption = #22806#24065#37329#39069
      FocusControl = DBEdit2
    end
    object Label11: TLabel [12]
      Left = 518
      Top = 127
      Width = 48
      Height = 12
      Hint = #25269#28040#20197#21069#30340#24080#27454#20313#39069#25968#25110#32773#35843#25972#24080#39033#12290
      Caption = #22806#24065#27719#29575
      FocusControl = DBEdit2
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 18
      Top = 142
      Width = 328
      DataField = 'Memo'
      TabOrder = 10
    end
    inherited VocherNoDBEdit: TDBEdit
      Left = 361
      Top = 20
      Width = 140
      DataField = 'Code'
    end
    inherited DateDBEdit: TDBEdit
      Left = 516
      Top = 20
      Width = 140
      DataField = 'Date'
    end
    object DBEdit2: TDBEdit
      Left = 361
      Top = 103
      Width = 120
      Height = 20
      DataField = 'AmountC'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object ClientQLDBLookup: TQLDBLookupComboBox
      Left = 18
      Top = 21
      Width = 328
      Height = 18
      BevelEdges = []
      BevelInner = bvSpace
      BevelKind = bkTile
      BevelOuter = bvSpace
      Ctl3D = False
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
    object EmployeeLookup: TQLDBLookupComboBox
      Left = 361
      Top = 61
      Width = 140
      Height = 18
      BevelEdges = []
      BevelInner = bvSpace
      BevelKind = bkTile
      BevelOuter = bvSpace
      Ctl3D = False
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
    object DBEdit1: TDBEdit
      Left = 516
      Top = 60
      Width = 140
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      ReadOnly = True
      TabOrder = 5
    end
    object LookUpAccount: TQLDBLookupComboBox
      Left = 18
      Top = 103
      Width = 328
      Height = 18
      BevelEdges = []
      BevelInner = bvSpace
      BevelKind = bkTile
      BevelOuter = bvSpace
      Ctl3D = False
      DataField = 'AccountsID'
      DataSource = MasterDataSource
      DropDownRows = 10
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = dsAccounts
      OnExit = LookUpAccountExit
      ParentCtl3D = False
      TabOrder = 6
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object BitBtn1: TBitBtn
      Left = 483
      Top = 103
      Width = 18
      Height = 20
      Hint = #28857#20987#21487#20197#33719#21462#21407#21333#25454#32467#31639#30340#37329#39069#12290
      Caption = '....'
      TabOrder = 8
      OnClick = BitBtn1Click
    end
    object DBEdit3: TDBEdit
      Left = 516
      Top = 103
      Width = 140
      Height = 20
      DataField = 'AmountRed'
      DataSource = MasterDataSource
      TabOrder = 9
    end
    object BriefComboBox: TDBComboBox
      Left = 18
      Top = 60
      Width = 328
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 3
    end
    object DBEdit4: TDBEdit
      Left = 361
      Top = 142
      Width = 140
      Height = 20
      DataField = 'AmountOrigin'
      DataSource = MasterDataSource
      ReadOnly = True
      TabOrder = 11
      OnExit = DBEdit4Exit
    end
    object DBEdit5: TDBEdit
      Left = 516
      Top = 142
      Width = 140
      Height = 20
      DataField = 'AmountRate'
      DataSource = MasterDataSource
      ReadOnly = True
      TabOrder = 12
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 457
    Width = 793
    Height = 24
  end
  object GEdit1: TGEdit [5]
    Left = 516
    Top = 194
    Width = 140
    Height = 20
    AutoSelect = True
    Enabled = False
    TabOrder = 4
    Text = '0.00'
    Alignment = taRightJustify
    Currency = False
    Warning = #36755#20837#30340#25968#23383#38169#35823#65292#35831#37325#26032#36755#20837#25968#25454
    NeedWarning = True
    WarningFocus = True
  end
  object ClientLKUP: TQLDBLookupComboBox [6]
    Left = 240
    Top = 256
    Width = 121
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'ClientID'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = ClientDS
    ParentCtl3D = False
    TabOrder = 5
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object LookExpenseID: TQLDBLookupComboBox [7]
    Left = 16
    Top = 249
    Width = 161
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'ExpenseID'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = ExpenseDS
    ParentCtl3D = False
    TabOrder = 6
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object AssetsLKUP: TQLDBLookupComboBox [8]
    Left = 576
    Top = 272
    Width = 121
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'GoodsID'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = AssetsDS
    ParentCtl3D = False
    TabOrder = 7
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object ProjectLKUP: TQLDBLookupComboBox [9]
    Left = 368
    Top = 256
    Width = 121
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'ProjectID'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = ProjectDS
    ParentCtl3D = False
    TabOrder = 8
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object ApportionModeQLLkup: TQLDBLookupComboBox [10]
    Left = 480
    Top = 312
    Width = 121
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'ApportionMode'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'ApportionMode'
    ListField = 'ApportionMode'
    ListSource = ApportionModeDS
    ParentCtl3D = False
    TabOrder = 9
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsMaster
    Left = 115
    Top = 75
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsDetail
    Left = 18
    Top = 327
  end
  inherited ActionList: TActionList
    Left = 443
    Top = 2
  end
  inherited MainMenu: TMainMenu
    Left = 390
    Top = 2
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 328
    Top = 2
  end
  object ClientName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 225
    Top = 43
  end
  object EmployeeName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 181
    Top = 43
  end
  object GoodName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 221
    Top = 284
  end
  object adsAccounts: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select  a.ID, a.Name,b.IsLocation  from dbo.FNAccounts a'#13#10'left o' +
      'uter join dbo.MSCurrency b on b.ID=a.CurrencyID'#13#10'where  a.Record' +
      'state<>'#39#21024#38500#39#13#10'and a.Name not like '#39'%'#19994#20027#36164#37329'%'#39
    Parameters = <>
    Left = 144
    Top = 43
  end
  object dsAccounts: TDataSource
    DataSet = adsAccounts
    Left = 144
    Top = 75
  end
  object DSClientName: TDataSource
    DataSet = ClientName
    Left = 225
    Top = 75
  end
  object DSEmployeeName: TDataSource
    DataSet = EmployeeName
    Left = 181
    Top = 75
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select *'#13#10'from   FNExpenseMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ID' +
      '=:ID'
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
    Top = 43
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
    object adsMasterOriginTable: TStringField
      FieldName = 'OriginTable'
      Visible = False
      Size = 30
    end
    object adsMasterAccountsID: TIntegerField
      FieldName = 'AccountsID'
      Visible = False
    end
    object adsMasterPeriodID: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object adsMasterBillAffix: TBytesField
      FieldName = 'BillAffix'
      Visible = False
      Size = 1
    end
    object adsMasterAmountBL: TBCDField
      FieldName = 'AmountBL'
      Visible = False
      Precision = 19
    end
    object adsMasterOriginID: TIntegerField
      FieldName = 'OriginID'
      Visible = False
    end
    object adsMasterClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsMasterAmountRed: TBCDField
      FieldName = 'AmountRed'
      Visible = False
      DisplayFormat = '#,#.00'
      EditFormat = '#.00'
      Precision = 19
    end
    object adsMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Visible = False
    end
    object adsMasterCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'CODE'
    end
    object adsMasterDate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
    end
    object adsMasterBrief: TStringField
      DisplayLabel = #19994#21153#25688#35201
      FieldName = 'Brief'
      Size = 30
    end
    object adsMasterBillMode: TStringField
      DisplayLabel = #19994#21153#31867#21035
      FieldName = 'BillMode'
      Size = 16
    end
    object adsMasterClient: TStringField
      DisplayLabel = #25910#27454#20154#21517#31216
      FieldKind = fkLookup
      FieldName = 'Client'
      LookupDataSet = ClientName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ClientID'
      Lookup = True
    end
    object adsMasterAmountD: TBCDField
      DisplayLabel = #25910#27454#37329#39069
      FieldName = 'AmountD'
      DisplayFormat = '#,#.00'
      EditFormat = '#.00'
      Precision = 19
    end
    object adsMasterAmountC: TBCDField
      DisplayLabel = #20184#27454#37329#39069
      FieldName = 'AmountC'
      DisplayFormat = '#,#.00'
      EditFormat = '#.00'
      Precision = 19
    end
    object adsMasterMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object adsMasterEmployee: TStringField
      DisplayLabel = #32463#25163#20154
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
    object adsMasterClearDate: TDateTimeField
      FieldName = 'ClearDate'
      Visible = False
    end
    object adsMasterAmountOrigin: TBCDField
      FieldName = 'AmountOrigin'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      Precision = 19
    end
    object adsMasterAmountRate: TFloatField
      FieldName = 'AmountRate'
      DisplayFormat = '#,#.0000'
      EditFormat = '#.#'
    end
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from  FNExpenseDetail '#13#10'where MasterID = :ID'
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
    Left = 18
    Top = 284
    object adsDetailID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsDetailPoClearID: TIntegerField
      FieldName = 'PoClearID'
      Visible = False
    end
    object adsDetailCheckNo: TStringField
      FieldName = 'CheckNo'
      Visible = False
    end
    object adsDetailOriginTable: TStringField
      FieldName = 'OriginTable'
      Visible = False
      Size = 30
    end
    object adsDetailBillTypeID: TIntegerField
      FieldName = 'BillTypeID'
      Visible = False
    end
    object adsDetailOriginID: TIntegerField
      FieldName = 'OriginID'
      Visible = False
    end
    object adsDetailExpenseID: TIntegerField
      FieldName = 'ExpenseID'
      Visible = False
      OnChange = adsDetailExpenseIDChange
    end
    object adsDetailClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsDetailProjectID: TIntegerField
      FieldName = 'ProjectID'
      Visible = False
    end
    object adsDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
    end
    object adsDetailExpense: TStringField
      DisplayLabel = #36153#29992#21517#31216
      FieldKind = fkLookup
      FieldName = 'Expense'
      LookupDataSet = ExpenseADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ExpenseID'
      Lookup = True
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #25253#38144#37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
    end
    object adsDetailAmountB: TBCDField
      DisplayLabel = #21442#32771#25968#37327
      FieldName = 'AmountB'
      currency = True
      Precision = 19
    end
    object adsDetailBillCode: TStringField
      DisplayLabel = #21457#31080#21495#30721
      FieldName = 'BillCode'
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
    object adsDetailClient: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldKind = fkLookup
      FieldName = 'Client'
      LookupDataSet = ClientADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ClientID'
      Lookup = True
    end
    object adsDetailAssets: TStringField
      DisplayLabel = #36164#20135#35774#22791
      FieldKind = fkLookup
      FieldName = 'Assets'
      LookupDataSet = AssetsADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Lookup = True
    end
    object adsDetailProject: TStringField
      DisplayLabel = #39033#30446#21517#31216
      FieldKind = fkLookup
      FieldName = 'Project'
      LookupDataSet = ProjectADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ProjectID'
      Lookup = True
    end
    object adsDetailApportionMode: TStringField
      DisplayLabel = #20998#25674#26041#24335
      FieldName = 'ApportionMode'
      Size = 16
    end
  end
  object ClientADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name from DAClient'#13#10'where Recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 99
    Top = 284
  end
  object ClientDS: TDataSource
    DataSet = ClientADS
    Left = 99
    Top = 327
  end
  object ProjectADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name  from   DAProject'#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 180
    Top = 284
  end
  object ProjectDS: TDataSource
    DataSet = ProjectADS
    Left = 180
    Top = 327
  end
  object adsBrief: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select  distinct Brief  from FNClearSLMaster'
    Parameters = <>
    Left = 269
    Top = 43
  end
  object ExpenseDS: TDataSource
    DataSet = ExpenseADS
    Left = 58
    Top = 327
  end
  object ExpenseADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name from DAExpenseClass'#13#10'where RecordState<>'#39#21024#38500#39#13#10'an' +
      'd upid<>-1'
    Parameters = <>
    Left = 58
    Top = 284
  end
  object AssetsADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select a.ID, a.Name   from DAGoods a'#13#10'Left join DAGoodsClass b o' +
      'n b.ID=a.GoodsClassID'#13#10'where a.Recordstate<>'#39#21024#38500#39#13#10'and a.GoodsCla' +
      'ssID in  '#13#10'( select ID  from DAGoodsClass'#13#10'where Name like '#39'%'#36164#20135'%' +
      #39' or Name like '#39'%'#35774#22791'%'#39' or'#13#10'Name like '#39'%'#36710#36742'%'#39' or Name like '#39'%'#24037#20855'%'#39' )' +
      #13#10#13#10#13#10
    Parameters = <>
    Left = 139
    Top = 284
  end
  object AssetsDS: TDataSource
    DataSet = AssetsADS
    Left = 139
    Top = 327
  end
  object ApportionModeADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select distinct a.ApportionMode from '#13#10'( select distinct Apporti' +
      'onMode from  FNExpenseDetail'#13#10'union  '#13#10'select top 1 '#39#26412#26399#39' Apporti' +
      'onMode from MSCompanyUser '#13#10'union  '#13#10'select top 1 '#39#36328#26399#39' Apportion' +
      'Mode from MSCompanyUser ) '#13#10'as a'#13#10'where a.ApportionMode<>'#39#39#13#10'and' +
      ' a.ApportionMode is not null'
    Parameters = <>
    Left = 268
    Top = 284
  end
  object ApportionModeDS: TDataSource
    DataSet = ApportionModeADS
    Left = 268
    Top = 327
  end
end
