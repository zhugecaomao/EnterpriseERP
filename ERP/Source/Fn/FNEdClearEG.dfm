inherited FNEdClearEGForm: TFNEdClearEGForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #39033#30446#25910#27454#21333
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
    Width = 800
    Height = 291
    Columns = <
      item
        Expanded = False
        FieldName = 'Project'
        Title.Alignment = taCenter
        Width = 201
        Visible = True
        ControlType = ctCustomControl
        CustomControl = ProjectLKUP
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Poclear'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
        ControlType = ctCustomControl
        CustomControl = PoclearLookup
      end
      item
        Expanded = False
        FieldName = 'CheckNo'
        Title.Alignment = taCenter
        Width = 120
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
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 800
  end
  inherited TopPanel: TPanel
    Width = 800
    Height = 190
    inherited RemarkLabel: TLabel
      Left = 18
      Top = 136
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
      Width = 48
      Height = 12
      Caption = #23458#25143#21517#31216
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
      Left = 516
      Top = 136
      Width = 72
      Height = 12
      Caption = #24212#25910#24080#27454#20313#39069
      Visible = False
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
      Top = 90
      Width = 48
      Height = 12
      Caption = #25910#27454#37329#39069
      FocusControl = DBEdit2
    end
    object Label9: TLabel [9]
      Left = 18
      Top = 90
      Width = 48
      Height = 12
      Caption = #25910#27454#24080#25143
      FocusControl = DBEdit2
    end
    object Label4: TLabel [10]
      Left = 516
      Top = 90
      Width = 48
      Height = 12
      Caption = #25240#25187#36820#21033
      FocusControl = DBEdit2
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 18
      Top = 152
      Width = 328
      DataField = 'Memo'
      TabOrder = 9
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
      Top = 110
      Width = 140
      Height = 20
      DataField = 'AmountD'
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
      Top = 110
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
      ParentCtl3D = False
      TabOrder = 6
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object DBEdit3: TDBEdit
      Left = 516
      Top = 110
      Width = 140
      Height = 20
      DataField = 'AmountRed'
      DataSource = MasterDataSource
      TabOrder = 8
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
  end
  inherited StatusBar1: TStatusBar
    Top = 510
    Width = 800
    Height = 24
  end
  object GEdit1: TGEdit [5]
    Left = 516
    Top = 182
    Width = 140
    Height = 20
    AutoSelect = True
    Enabled = False
    TabOrder = 4
    Text = '0.00'
    Visible = False
    Alignment = taRightJustify
    Currency = False
    Warning = #36755#20837#30340#25968#23383#38169#35823#65292#35831#37325#26032#36755#20837#25968#25454
    NeedWarning = True
    WarningFocus = True
  end
  object PoclearLookup: TQLDBLookupComboBox [6]
    Left = 336
    Top = 240
    Width = 121
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'PoClearID'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsPoclear
    ParentCtl3D = False
    TabOrder = 5
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object ProjectLKUP: TQLDBLookupComboBox [7]
    Left = 16
    Top = 241
    Width = 201
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
    ListSource = dsADOProject
    OnEnter = ProjectLKUPEnter
    OnExit = ProjectLKUPExit
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
    Top = 75
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsDetail
    Left = 26
    Top = 370
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
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name  from DAClient'#13#10'where RecordState<>'#39#21024#38500#39'  '
    Parameters = <>
    Left = 225
    Top = 43
  end
  object EmployeeName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 181
    Top = 43
  end
  object GoodName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 229
    Top = 327
  end
  object adsAccounts: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select  a.ID, a.Name,b.IsLocation  from dbo.FNAccounts a'#13#10'left o' +
      'uter join dbo.MSCurrency b on b.ID=a.CurrencyID'#13#10'where  a.Record' +
      'state<>'#39#21024#38500#39#13#10'and a.Name not like '#39'%'#19994#20027#36164#37329'%'#39#13#10'and  b.IsLocation=1'#13#10
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
      'select *'#13#10'from   FNClearEGMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ID' +
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
      DisplayFormat = '#,#.00'
      EditFormat = '#.00'
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
      DisplayLabel = #23458#25143#21517#31216
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
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from  FNClearEGDetail '#13#10'where MasterID = :ID'
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
    Left = 26
    Top = 327
    object adsDetailID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsDetailOriginID: TIntegerField
      FieldName = 'OriginID'
      Visible = False
      OnChange = adsDetailOriginIDChange
    end
    object adsDetailPoClearID: TIntegerField
      FieldName = 'PoClearID'
      Visible = False
    end
    object adsDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
    end
    object adsDetailProjectID: TIntegerField
      FieldName = 'ProjectID'
      Visible = False
    end
    object adsDetailBillTypeID: TIntegerField
      FieldName = 'BillTypeID'
      Visible = False
    end
    object adsDetailExpenseID: TIntegerField
      FieldName = 'ExpenseID'
      Visible = False
    end
    object adsDetailProject: TStringField
      DisplayLabel = #39033#30446#21517#31216
      FieldKind = fkLookup
      FieldName = 'Project'
      LookupDataSet = AdsProject
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ProjectID'
      Visible = False
      Lookup = True
    end
    object adsDetailOriginTable: TStringField
      FieldName = 'OriginTable'
      Visible = False
      Size = 30
    end
    object adsDetailOriginCode: TStringField
      DisplayLabel = #21407#22987#38144#21806#21333#32534#21495
      FieldKind = fkLookup
      FieldName = 'OriginCode'
      LookupDataSet = adsCode
      LookupKeyFields = 'ID'
      LookupResultField = 'Code'
      KeyFields = 'OriginID'
      Lookup = True
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #32467#31639#37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
    end
    object adsDetailAmountRed: TBCDField
      DisplayLabel = #25240#25187#36820#21033#37329#39069
      FieldName = 'AmountRed'
      DisplayFormat = '#,#.00'
      EditFormat = '#.00'
      Precision = 19
    end
    object adsDetailPoclear: TStringField
      DisplayLabel = #32467#31639#26041#24335
      FieldKind = fkLookup
      FieldName = 'Poclear'
      LookupDataSet = adsPoclear
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PoClearID'
      Lookup = True
    end
    object adsDetailCheckNo: TStringField
      DisplayLabel = #25903#31080#21495#30721
      FieldName = 'CheckNo'
    end
    object adsDetailBillCode: TStringField
      DisplayLabel = #21457#31080#32534#21495
      FieldName = 'BillCode'
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
    object adsDetailGoods: TStringField
      DisplayLabel = #25353#21830#21697#32467#31639
      FieldKind = fkLookup
      FieldName = 'Goods'
      LookupDataSet = GoodName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Lookup = True
    end
  end
  object adsPoclear: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name from POClear'#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 76
    Top = 327
  end
  object dsPoclear: TDataSource
    DataSet = adsPoclear
    Left = 76
    Top = 370
  end
  object AdsProject: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name  from   DAProject'#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 178
    Top = 327
  end
  object dsADOProject: TDataSource
    DataSet = AdsProject
    Left = 178
    Top = 370
  end
  object adsBrief: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select  distinct Brief  from FNClearSLMaster'
    Parameters = <>
    Left = 269
    Top = 43
  end
  object dsCode: TDataSource
    DataSet = adsCode
    Left = 120
    Top = 376
  end
  object adsCode: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select a.ID, a.Code,b.amount'#13#10'from SLSaleMaster a left outer joi' +
      'n '#13#10'( select masterID,   sum(isnull(amount,0) ) as amount from  ' +
      'SLSaleDetail group by  MasterID ) as b '#13#10'on b.MasterID=a.ID'#13#10'whe' +
      're a.recordstate<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 120
    Top = 328
  end
  object ProjectFTLAds: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name  from   DAProject'#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 306
    Top = 335
  end
  object ProjectFTLDS: TDataSource
    DataSet = ProjectFTLAds
    Left = 306
    Top = 378
  end
end
