inherited FNEdCashOutInForm: TFNEdCashOutInForm
  Left = 52
  Top = 77
  Width = 712
  Height = 461
  Caption = #36164#37329#35843#21160#21333
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
    Top = 195
    Width = 704
    Height = 196
    Columns = <
      item
        Expanded = False
        FieldName = 'Poclear'
        Title.Alignment = taCenter
        Width = 140
        Visible = True
        ControlType = ctCustomControl
        CustomControl = PoclearLookup
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Alignment = taCenter
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CheckNo'
        Title.Alignment = taCenter
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BillCode'
        Title.Alignment = taCenter
        Width = 140
        Visible = True
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
    Width = 704
  end
  inherited TopPanel: TPanel
    Width = 704
    Height = 166
    inherited RemarkLabel: TLabel
      Left = 17
      Top = 120
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
      Top = 45
      Width = 48
      Height = 12
      Caption = #35843#20986#24080#25143
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
    object Label6: TLabel [6]
      Left = 18
      Top = 5
      Width = 48
      Height = 12
      Caption = #19994#21153#25688#35201
    end
    object Label7: TLabel [7]
      Left = 361
      Top = 82
      Width = 48
      Height = 12
      Caption = #35843#21160#37329#39069
      FocusControl = DBEdit2
    end
    object Label9: TLabel [8]
      Left = 17
      Top = 82
      Width = 48
      Height = 12
      Caption = #35843#20837#24080#25143
      FocusControl = DBEdit2
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 17
      Top = 134
      Width = 328
      DataField = 'Memo'
      TabOrder = 8
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
      Top = 96
      Width = 140
      Height = 20
      DataField = 'AmountD'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object ClientQLDBLookup: TQLDBLookupComboBox
      Left = 18
      Top = 58
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
      ParentCtl3D = False
      TabOrder = 3
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object EmployeeLookup: TQLDBLookupComboBox
      Left = 361
      Top = 58
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
      Top = 58
      Width = 140
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      ReadOnly = True
      TabOrder = 5
    end
    object LookUpAccount: TQLDBLookupComboBox
      Left = 17
      Top = 96
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
  end
  inherited StatusBar1: TStatusBar
    Top = 391
    Width = 704
    Height = 24
  end
  object PoclearLookup: TQLDBLookupComboBox [5]
    Left = 21
    Top = 208
    Width = 132
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
    TabOrder = 4
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsMaster
    Left = 197
    Top = 31
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsDetail
    Left = 18
    Top = 290
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
    CommandText = 
      'select  a.ID, a.Name  from dbo.FNAccounts a'#13#10'left outer join dbo' +
      '.MSCurrency b on b.ID=a.CurrencyID'#13#10'where b.IsLocation=1'#13#10'and  a' +
      '.Recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 307
    Top = 65535
  end
  object EmployeeName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 263
    Top = 65535
  end
  object GoodName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 221
    Top = 247
  end
  object adsAccounts: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select  a.ID, a.Name  from dbo.FNAccounts a'#13#10'left outer join dbo' +
      '.MSCurrency b on b.ID=a.CurrencyID'#13#10'where b.IsLocation=1'#13#10'and  a' +
      '.Recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 226
    Top = 65535
  end
  object dsAccounts: TDataSource
    DataSet = adsAccounts
    Left = 226
    Top = 31
  end
  object DSClientName: TDataSource
    DataSet = ClientName
    Left = 307
    Top = 31
  end
  object DSEmployeeName: TDataSource
    DataSet = EmployeeName
    Left = 263
    Top = 31
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select *'#13#10'from   FNCashOutInMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ' +
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
    Left = 197
    Top = 65535
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
      EditFormat = '#.#'
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
    CommandText = 'select *'#13#10'from  FNCashOutInDetail '#13#10'where MasterID = :ID'
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
    object adsDetailGoods: TStringField
      DisplayLabel = #30456#20851#21830#21697
      FieldKind = fkLookup
      FieldName = 'Goods'
      LookupDataSet = GoodName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Visible = False
      Lookup = True
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
    object adsDetailAmount: TBCDField
      DisplayLabel = #37329#39069
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
  end
  object adsPoclear: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name from POClear'#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 68
    Top = 247
  end
  object dsPoclear: TDataSource
    DataSet = adsPoclear
    Left = 68
    Top = 290
  end
  object AdsProject: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name  from   DAProjectClass'#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 170
    Top = 247
  end
  object dsADOProject: TDataSource
    DataSet = AdsProject
    Left = 170
    Top = 290
  end
  object adsBrief: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select  distinct Brief  from FNClearSLMaster'
    Parameters = <>
    Left = 351
    Top = 65535
  end
end
