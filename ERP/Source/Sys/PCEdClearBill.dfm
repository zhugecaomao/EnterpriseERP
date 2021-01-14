inherited PCEdClearBillForm: TPCEdClearBillForm
  Left = 75
  Top = 141
  Width = 718
  Height = 461
  Caption = #38144#21806#32467#31639#32534#36753
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited DBGrid: TQLDBGrid
    Top = 151
    Width = 710
    Height = 240
    OnColEnter = DBLookupComboBox1Enter
    Columns = <
      item
        Expanded = False
        FieldName = 'AccountName'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
        ControlType = ctCustomControl
        CustomControl = QLDBLookupAccounts
      end
      item
        Expanded = False
        FieldName = 'AcceptAmount'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AcceptName'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
        ControlType = ctCustomControl
        CustomControl = QLDBLookupPoclear
      end
      item
        Expanded = False
        FieldName = 'CheckNo'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InvoiceCode'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InvoiceType'
        Title.Alignment = taCenter
        Width = 80
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'InvoiceAmount'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoodName'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 710
  end
  inherited TopPanel: TPanel
    Width = 710
    Height = 122
    inherited RemarkLabel: TLabel
      Left = 12
      Top = 83
    end
    inherited VoucherNoLabel: TLabel
      Left = 351
      Top = 5
      Width = 24
      Caption = #32534#21495
    end
    inherited VoucherDateLabel: TLabel
      Left = 509
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
      Left = 12
      Top = 44
      Width = 36
      Height = 12
      Caption = #32463#25163#20154
    end
    object Label3: TLabel [5]
      Left = 351
      Top = 45
      Width = 48
      Height = 12
      Caption = #32467#31639#31867#22411
    end
    object Label4: TLabel [6]
      Left = 509
      Top = 45
      Width = 48
      Height = 12
      Caption = #32467#31639#37329#39069
      FocusControl = DBEdit1
    end
    object Label5: TLabel [7]
      Left = 431
      Top = 101
      Width = 72
      Height = 12
      Caption = #24212#25910#24080#27454#20313#39069
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 12
      Top = 97
      Width = 413
      DataField = 'Memo'
      TabOrder = 6
    end
    inherited VocherNoDBEdit: TDBEdit
      Left = 351
      Top = 20
      Width = 140
      DataField = 'Code'
    end
    inherited DateDBEdit: TDBEdit
      Left = 509
      Top = 20
      Width = 140
      DataField = 'Date'
    end
    object DBEdit1: TDBEdit
      Left = 509
      Top = 59
      Width = 140
      Height = 20
      DataField = 'AcceptAmount'
      DataSource = MasterDataSource
      TabOrder = 5
    end
    object ClientQLDBLookup: TQLDBLookupComboBox
      Left = 12
      Top = 21
      Width = 317
      Height = 18
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
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
      OnButtonClick = GoodsLookupButtonClick
      VisibleButtons = [lbSetNull]
    end
    object QLDBLookupComboBox1: TQLDBLookupComboBox
      Left = 12
      Top = 61
      Width = 317
      Height = 18
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = False
      DataField = 'EmployeID'
      DataSource = MasterDataSource
      DropDownRows = 10
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = DSEmployeeName
      OnEnter = ClientQLDBLookupEnter
      OnExit = ClientQLDBLookupExit
      ParentCtl3D = False
      TabOrder = 3
      ButtonHeight = 22
      OnButtonClick = GoodsLookupButtonClick
      VisibleButtons = [lbSetNull]
    end
    object DBEdit2: TDBEdit
      Left = 351
      Top = 59
      Width = 140
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      TabOrder = 4
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 391
    Width = 710
    Height = 24
  end
  inherited GoodsLookup: TQLDBLookupComboBox
    Left = 584
    Top = 168
    Width = 89
  end
  object GEdit1: TGEdit [5]
    Left = 510
    Top = 124
    Width = 140
    Height = 20
    AutoSelect = True
    Enabled = False
    TabOrder = 5
    Text = '0.00'
    Alignment = taRightJustify
    Currency = False
    Warning = #36755#20837#30340#25968#23383#38169#35823#65292#35831#37325#26032#36755#20837#25968#25454
    NeedWarning = True
    WarningFocus = True
  end
  object QLDBLookupPoclear: TQLDBLookupComboBox [6]
    Left = 256
    Top = 168
    Width = 89
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
    ListSource = DSPoClear
    ParentCtl3D = False
    TabOrder = 6
    Visible = False
    ButtonHeight = 22
    OnButtonClick = GoodsLookupButtonClick
    VisibleButtons = [lbSetNull]
  end
  object QLDBLookupAccounts: TQLDBLookupComboBox [7]
    Left = 16
    Top = 168
    Width = 89
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'AccountID'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DSFNAccountsName
    ParentCtl3D = False
    TabOrder = 7
    Visible = False
    ButtonHeight = 22
    OnButtonClick = GoodsLookupButtonClick
    VisibleButtons = [lbSetNull]
  end
  inherited MasterDataSource: TDataSource
    DataSet = tblSLClearBillMaster
    Left = 77
    Top = 214
  end
  inherited DetailDataSource: TDataSource
    DataSet = tblSLClearBillDetail
    Left = 77
    Top = 314
  end
  inherited ActionList: TActionList
    Left = 291
    Top = 207
  end
  inherited MainMenu: TMainMenu
    Left = 248
    Top = 242
  end
  object tblSLClearBillDetail: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select *'#13#10'from PCClearBillDetail'#13#10'where MasterID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 77
    Top = 283
    object tblSLClearBillDetailID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblSLClearBillDetailGoodName: TStringField
      DisplayLabel = #36135#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'GoodName'
      LookupDataSet = GoodName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Lookup = True
    end
    object tblSLClearBillDetailGoodsID: TIntegerField
      DisplayLabel = #36135#21697'ID'
      FieldName = 'GoodsID'
      Visible = False
    end
    object tblSLClearBillDetailAccountID: TIntegerField
      DisplayLabel = #25910#27454#24080#25143
      FieldName = 'AccountID'
      Visible = False
    end
    object tblSLClearBillDetailAcceptAmount: TBCDField
      DisplayLabel = #25910#27454#37329#39069
      FieldName = 'AcceptAmount'
      currency = True
      Precision = 19
    end
    object tblSLClearBillDetailCheckNo: TStringField
      DisplayLabel = #25903#31080#21495#30721
      FieldName = 'CheckNo'
    end
    object tblSLClearBillDetailInvoiceCode: TStringField
      DisplayLabel = #21457#31080#21495#30721
      FieldName = 'InvoiceCode'
    end
    object tblSLClearBillDetailInvoiceType: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldName = 'InvoiceType'
      Size = 12
    end
    object tblSLClearBillDetailInvoiceAmount: TBCDField
      DisplayLabel = #21457#31080#37329#39069
      FieldName = 'InvoiceAmount'
      currency = True
      Precision = 19
    end
    object tblSLClearBillDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object tblSLClearBillDetailProjectID: TIntegerField
      DisplayLabel = #39033#30446'ID'
      FieldName = 'ProjectID'
      Visible = False
    end
    object tblSLClearBillDetailAccountName: TStringField
      DisplayLabel = #25910#27454#24080#25143
      FieldKind = fkLookup
      FieldName = 'AccountName'
      LookupDataSet = FNAccountsName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'AccountID'
      Lookup = True
    end
    object tblSLClearBillDetailPoClearID: TIntegerField
      FieldName = 'PoClearID'
    end
    object tblSLClearBillDetailAcceptName: TStringField
      DisplayLabel = #32467#31639#26041#24335
      FieldKind = fkLookup
      FieldName = 'AcceptName'
      LookupDataSet = PoClear
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PoClearID'
      Lookup = True
    end
  end
  object tblSLClearBillMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select *'#13#10'from PCClearBillMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ID' +
      '=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 77
    Top = 180
    object tblSLClearBillMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblSLClearBillMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblSLClearBillMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblSLClearBillMasterRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblSLClearBillMasterDate: TDateTimeField
      FieldName = 'Date'
    end
    object tblSLClearBillMasterCode: TStringField
      FieldName = 'Code'
    end
    object tblSLClearBillMasterBillMode: TStringField
      FieldName = 'BillMode'
      Size = 16
    end
    object tblSLClearBillMasterBillModeDC: TIntegerField
      FieldName = 'BillModeDC'
    end
    object tblSLClearBillMasterClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object tblSLClearBillMasterEmployeID: TIntegerField
      FieldName = 'EmployeID'
    end
    object tblSLClearBillMasterOriginBillID: TIntegerField
      FieldName = 'OriginBillID'
    end
    object tblSLClearBillMasterPeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
    object tblSLClearBillMasterAcceptAmount: TBCDField
      FieldName = 'AcceptAmount'
      DisplayFormat = '#,#.00'
      
      Precision = 19
    end
    object tblSLClearBillMasterMemo: TStringField
      FieldName = 'Memo'
      Size = 30
    end
  end
  object ClientName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from DAClient'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 125
    Top = 180
  end
  object EmployeeName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 173
    Top = 180
  end
  object GoodName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 173
    Top = 283
  end
  object BillTypeName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select *'#13#10'from DABillType'#13#10'where RecordState<>'#39#21024#38500#39#13#10'and BillFlag' +
      'FN='#39'1'#39' and Name like '#39'%'#38144#21806'%'#39
    Parameters = <>
    Left = 221
    Top = 180
  end
  object FNAccountsName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from FNAccounts'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 125
    Top = 283
  end
  object PoClear: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from  POClear '#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 221
    Top = 283
  end
  object DSFNAccountsName: TDataSource
    DataSet = FNAccountsName
    Left = 125
    Top = 314
  end
  object DSPoClear: TDataSource
    DataSet = PoClear
    Left = 221
    Top = 314
  end
  object DSClientName: TDataSource
    DataSet = ClientName
    Left = 125
    Top = 214
  end
  object DSEmployeeName: TDataSource
    DataSet = EmployeeName
    Left = 173
    Top = 214
  end
end
