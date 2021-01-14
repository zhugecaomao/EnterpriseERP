inherited FNEdCashExchangeForm: TFNEdCashExchangeForm
  Left = -22
  Top = 45
  Width = 808
  Height = 580
  Caption = #22806#24065#20817#25442#20973#21333
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
    Top = 200
    Width = 800
    Height = 310
    Columns = <
      item
        Expanded = False
        FieldName = 'CheckNo'
        Title.Alignment = taCenter
        Width = 137
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Alignment = taCenter
        Width = 123
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BillCode'
        Title.Alignment = taCenter
        Width = 136
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ReLationClient'
        Title.Alignment = taCenter
        Width = 173
        Visible = True
        ControlType = ctCustomControl
        CustomControl = RelationClientLkup
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 200
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 800
  end
  inherited TopPanel: TPanel
    Width = 800
    Height = 171
    inherited RemarkLabel: TLabel
      Left = 18
      Top = 124
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
      Top = 46
      Width = 48
      Height = 12
      Caption = #20817#20986#24080#25143
    end
    object Label2: TLabel [4]
      Left = 516
      Top = 46
      Width = 36
      Height = 12
      Caption = #32463#25163#20154
    end
    object Label3: TLabel [5]
      Left = 361
      Top = 46
      Width = 48
      Height = 12
      Caption = #19994#21153#31867#21035
    end
    object Label6: TLabel [6]
      Left = 18
      Top = 5
      Width = 48
      Height = 12
      Caption = #19994#21153#25688#35201
    end
    object Label7: TLabel [7]
      Left = 361
      Top = 128
      Width = 48
      Height = 12
      Caption = #26412#24065#37329#39069
      FocusControl = DBEdit2
    end
    object Label9: TLabel [8]
      Left = 18
      Top = 86
      Width = 48
      Height = 12
      Caption = #20817#20837#24080#25143
      FocusControl = DBEdit2
    end
    object Label4: TLabel [9]
      Left = 361
      Top = 87
      Width = 48
      Height = 12
      Caption = #21407#24065#37329#39069
      FocusControl = DBEdit3
    end
    object Label5: TLabel [10]
      Left = 516
      Top = 86
      Width = 48
      Height = 12
      Caption = #20817#25442#27719#29575
      FocusControl = DBEdit4
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
      Top = 142
      Width = 140
      Height = 20
      DataField = 'AmountD'
      DataSource = MasterDataSource
      TabOrder = 9
    end
    object ClientQLDBLookup: TQLDBLookupComboBox
      Left = 18
      Top = 60
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
      OnExit = ClientQLDBLookupExit
      ParentCtl3D = False
      TabOrder = 3
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object EmployeeLookup: TQLDBLookupComboBox
      Left = 516
      Top = 60
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
      TabOrder = 6
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object DBEdit1: TDBEdit
      Left = 361
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
      Top = 101
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
      OnExit = ClientQLDBLookupExit
      ParentCtl3D = False
      TabOrder = 4
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object BriefComboBox: TDBComboBox
      Left = 18
      Top = 20
      Width = 328
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 0
    end
    object DBEdit3: TDBEdit
      Left = 361
      Top = 101
      Width = 140
      Height = 20
      DataField = 'AmountOrigin'
      DataSource = MasterDataSource
      TabOrder = 7
      OnExit = DBEdit4Exit
    end
    object DBEdit4: TDBEdit
      Left = 516
      Top = 101
      Width = 140
      Height = 20
      DataField = 'AmountRate'
      DataSource = MasterDataSource
      TabOrder = 8
      OnExit = DBEdit4Exit
    end
    object AmountRateButton: TButton
      Left = 518
      Top = 143
      Width = 57
      Height = 17
      Caption = #31639#27719#29575
      Enabled = False
      TabOrder = 11
      OnClick = AmountRateButtonClick
    end
    object LocalAmountButton: TButton
      Left = 582
      Top = 143
      Width = 57
      Height = 17
      Caption = #31639#26412#24065
      TabOrder = 12
      OnClick = LocalAmountButtonClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 510
    Width = 800
    Height = 24
  end
  object RelationClientLkup: TQLDBLookupComboBox [5]
    Left = 416
    Top = 216
    Width = 145
    Height = 18
    Ctl3D = False
    DataField = 'ClientID'
    DataSource = DetailDataSource
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = RelationClientDs
    ParentCtl3D = False
    TabOrder = 4
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsMaster
    Left = 222
    Top = 32
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsDetail
    Left = 18
    Top = 290
  end
  inherited ActionList: TActionList
    Left = 468
    Top = 3
    object GetLocalAmountAct: TAction
      Caption = #21462#26412#24065#37329#39069
      Hint = #21462#26412#24065#37329#39069
      ImageIndex = 12
      ShortCut = 16466
      OnExecute = GetLocalAmountActExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 415
    Top = 3
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 521
    Top = 3
    object N41: TMenuItem
      Action = GetLocalAmountAct
    end
  end
  object ClientName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select  a.ID, a.Name, b.IsLocation,b.name Currency '#13#10'from dbo.FN' +
      'Accounts a'#13#10'left outer join dbo.MSCurrency b on b.ID=a.CurrencyI' +
      'D'#13#10'where ( b.IsLocation<>1 or '#13#10'a.name like '#39'%'#20817#25442'%'#39')'#13#10'and  a.Reco' +
      'rdstate<>'#39#21024#38500#39#13#10'and a.name not Like '#39'%'#19994#20027#36164#37329'%'#39#13#10
    Parameters = <>
    Left = 332
    Top = 3
  end
  object EmployeeName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 288
    Top = 3
  end
  object adsAccounts: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select  a.ID, a.Name, b.IsLocation,b.name Currency '#13#10'from dbo.FN' +
      'Accounts a'#13#10'left outer join dbo.MSCurrency b on b.ID=a.CurrencyI' +
      'D'#13#10'where ( b.IsLocation<>1 or '#13#10'a.name like '#39'%'#20817#25442'%'#39')'#13#10'and  a.Reco' +
      'rdstate<>'#39#21024#38500#39#13#10'and a.name not Like '#39'%'#19994#20027#36164#37329'%'#39
    Parameters = <>
    Left = 251
    Top = 3
  end
  object dsAccounts: TDataSource
    DataSet = adsAccounts
    Left = 251
    Top = 32
  end
  object DSClientName: TDataSource
    DataSet = ClientName
    Left = 332
    Top = 32
  end
  object DSEmployeeName: TDataSource
    DataSet = EmployeeName
    Left = 288
    Top = 32
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select *'#13#10'from   FNCashExchangeMaster'#13#10'where RecordState<>'#39#21024#38500#39' a' +
      'nd ID=:ID'
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
    Left = 222
    Top = 3
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
      EditFormat = '#.#'
      Precision = 19
    end
    object adsMasterAmountC: TBCDField
      DisplayLabel = #20184#27454#37329#39069
      FieldName = 'AmountC'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      Precision = 19
    end
    object adsMasterAmountOrigin: TBCDField
      DisplayLabel = #21407#24065#37329#39069
      FieldName = 'AmountOrigin'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      Precision = 19
    end
    object adsMasterAmountRate: TFloatField
      DisplayLabel = #20817#25442#27719#29575
      FieldName = 'AmountRate'
      DisplayFormat = '#,#.#####'
      EditFormat = '#.######'
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
    CommandText = 'select *'#13#10'from  FNCashExchangeDetail '#13#10'where MasterID = :ID'
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
    Top = 247
    object adsDetailID: TAutoIncField
      FieldName = 'ID'
      Visible = False
    end
    object adsDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsDetailPoClearID: TIntegerField
      FieldName = 'PoClearID'
      Visible = False
      OnChange = adsDetailPoClearIDChange
    end
    object adsDetailBillTypeID: TIntegerField
      FieldName = 'BillTypeID'
      Visible = False
    end
    object adsDetailOriginID: TIntegerField
      FieldName = 'OriginID'
      Visible = False
    end
    object adsDetailOriginTable: TStringField
      FieldName = 'OriginTable'
      Visible = False
      Size = 30
    end
    object adsDetailProjectID: TIntegerField
      FieldName = 'ProjectID'
      Visible = False
    end
    object adsDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #26412#24065#37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
    end
    object adsDetailCheckNo: TStringField
      DisplayLabel = #25903#31080#21495#30721
      FieldName = 'CheckNo'
      Visible = False
    end
    object adsDetailBillCode: TStringField
      DisplayLabel = #31080#25454#21495#30721
      FieldName = 'BillCode'
      Visible = False
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
    object adsDetailClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object adsDetailExpenseID: TIntegerField
      FieldName = 'ExpenseID'
    end
    object adsDetailReLationClient: TStringField
      DisplayLabel = #23458#25143#21378#21830
      FieldKind = fkLookup
      FieldName = 'ReLationClient'
      LookupDataSet = RelationClientAds
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ClientID'
      Lookup = True
    end
  end
  object adsBrief: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select  distinct Brief  from FNClearSLMaster'
    Parameters = <>
    Left = 376
    Top = 3
  end
  object TempADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name  from   DAProjectClass'#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 410
    Top = 271
  end
  object RelationClientAds: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID,Name'#13#10'from DAClient'#13#10'where Recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 224
    Top = 256
  end
  object RelationClientDs: TDataSource
    DataSet = RelationClientAds
    Left = 224
    Top = 296
  end
end
