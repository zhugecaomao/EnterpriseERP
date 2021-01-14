inherited SLEdSaleBillSForm: TSLEdSaleBillSForm
  Left = 87
  Top = 92
  Width = 679
  Height = 461
  Caption = #29305#33394#38144#21806#24320#21333#32534#36753
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
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
    Top = 166
    Width = 671
    Height = 225
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        Title.Alignment = taCenter
        Width = 184
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Title.Alignment = taCenter
        Width = 91
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PackUnit'
        Title.Alignment = taCenter
        Width = 85
        Visible = True
        ControlType = ctCustomControl
        CustomControl = QLDBLookuppACKUNIT
      end
      item
        Expanded = False
        FieldName = 'PriceBase'
        Title.Alignment = taCenter
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QuantityPcs'
        Title.Alignment = taCenter
        Width = 77
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
        FieldName = 'DiscountRate'
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Discount'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Taxrate'
        Title.Alignment = taCenter
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TaxAmount'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoalQuantity'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoallUnit'
        Title.Alignment = taCenter
        Width = 55
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NetAmount'
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'SundryFee'
        Title.Alignment = taCenter
        Width = 81
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SalesMode'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 671
  end
  inherited TopPanel: TPanel
    Width = 671
    Height = 137
    inherited RemarkLabel: TLabel
      Left = 12
      Top = 116
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
      Left = 12
      Top = 44
      Width = 36
      Height = 12
      Caption = #32463#25163#20154
    end
    object Label3: TLabel [5]
      Left = 355
      Top = 45
      Width = 48
      Height = 12
      Caption = #19994#21153#31867#22411
    end
    object Label4: TLabel [6]
      Left = 510
      Top = 45
      Width = 48
      Height = 12
      Caption = #38468#21152#36153#29992
      FocusControl = DBEdit2
    end
    object Label5: TLabel [7]
      Left = 431
      Top = 118
      Width = 72
      Height = 12
      Caption = #24212#25910#24080#27454#20313#39069
    end
    object Label6: TLabel [8]
      Left = 510
      Top = 89
      Width = 48
      Height = 12
      Caption = #20998#25674#26041#24335
      FocusControl = DBEdit2
    end
    object Label7: TLabel [9]
      Left = 12
      Top = 89
      Width = 48
      Height = 12
      Caption = #32467#31639#26085#26399
      FocusControl = DBEdit2
    end
    inherited RemarkDBEdit: TDBEdit
      Top = 114
      Width = 385
      DataField = 'Memo'
      TabOrder = 11
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
    object DBEdit2: TDBEdit
      Left = 510
      Top = 59
      Width = 140
      Height = 20
      DataField = 'SundryFee'
      DataSource = MasterDataSource
      TabOrder = 5
    end
    object ClientQLDBLookup: TQLDBLookupComboBox
      Left = 12
      Top = 21
      Width = 327
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
      VisibleButtons = [lbSetNull]
    end
    object QLDBLookupEmployee: TQLDBLookupComboBox
      Left = 12
      Top = 61
      Width = 327
      Height = 20
      BevelEdges = []
      BevelOuter = bvRaised
      Ctl3D = True
      DataField = 'EmployeID'
      DataSource = MasterDataSource
      DropDownRows = 10
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = DSEmployeeName
      ParentCtl3D = False
      TabOrder = 3
      ButtonHeight = 22
      VisibleButtons = [lbSetNull]
    end
    object DBEdit1: TDBEdit
      Left = 355
      Top = 59
      Width = 140
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      TabOrder = 4
    end
    object DBEdit4: TDBEdit
      Left = 249
      Top = 85
      Width = 90
      Height = 20
      DataField = 'TaxRate'
      DataSource = MasterDataSource
      Enabled = False
      TabOrder = 8
    end
    object DBComboBox1: TDBComboBox
      Left = 560
      Top = 85
      Width = 90
      Height = 20
      Style = csDropDownList
      DataField = 'IsApportion'
      DataSource = MasterDataSource
      ItemHeight = 12
      Items.Strings = (
        #19981#20998#25674
        #25353#37329#39069#20998#25674
        #25353#25968#37327#20998#25674)
      TabOrder = 10
    end
    object DBComboBox3: TDBComboBox
      Left = 157
      Top = 85
      Width = 90
      Height = 20
      Style = csDropDownList
      DataField = 'IsTax'
      DataSource = MasterDataSource
      ItemHeight = 12
      Items.Strings = (
        #24050#21547#31246
        #19981#21547#31246)
      TabOrder = 7
      OnChange = DBComboBox3Change
    end
    object DBComboBox4: TDBComboBox
      Left = 355
      Top = 85
      Width = 140
      Height = 20
      Style = csDropDownList
      DataField = 'IsDeliver'
      DataSource = MasterDataSource
      ItemHeight = 12
      Items.Strings = (
        #19981#36865#36135
        #38656#36865#36135)
      TabOrder = 9
      OnChange = DBComboBox3Change
    end
    object DBEdit5: TDBEdit
      Left = 62
      Top = 85
      Width = 90
      Height = 20
      DataField = 'ClearDate'
      DataSource = MasterDataSource
      TabOrder = 6
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 391
    Width = 671
    Height = 24
  end
  inherited GoodsLookup: TQLDBLookupComboBox
    Left = 24
    Top = 184
    Width = 89
  end
  object GEdit1: TGEdit [6]
    Left = 509
    Top = 141
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
  object QLDBLookuppACKUNIT: TQLDBLookupComboBox [7]
    Left = 296
    Top = 184
    Width = 57
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
    ListSource = DSMSUnit
    ParentCtl3D = False
    TabOrder = 6
    Visible = False
    ButtonHeight = 22
    VisibleButtons = [lbSetNull]
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsSalesMaster
    Left = 77
    Top = 214
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsSalesDetail
    Left = 53
    Top = 282
  end
  inherited ActionList: TActionList
    Left = 275
    Top = 31
    inherited DeleteDetailAction: TAction
      ImageIndex = -1
    end
    inherited SaveAsAction: TAction
      ImageIndex = 11
    end
    inherited SubmitAction: TAction
      ImageIndex = 8
    end
    inherited SendAsMailAction: TAction
      ImageIndex = 8
    end
    inherited ImportAction: TAction
      ImageIndex = 13
      OnExecute = ImportActionExecute
    end
    object LastPrice: TAction
      Caption = #26368#26032#21806#20215
      ImageIndex = 7
      OnExecute = LastPriceExecute
    end
    object DiscountMode: TAction
      Caption = #25240#25187#26041#24335
      OnExecute = DiscountModeExecute
    end
  end
  inherited MainMenu: TMainMenu
    Top = 10
    inherited A3: TMenuItem
      object N7: TMenuItem
        Action = LastPrice
        Caption = #38144#21806#21333#20215#26597#35810
      end
      object N13: TMenuItem
        Action = DiscountMode
      end
    end
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 200
    Top = 144
  end
  object ClientName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name'#13#10'from DAClient'#13#10'where RecordState<>'#39#21024#38500#39#13#10'and Cli' +
      'entType <>'#39#21378#21830#39
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
    Left = 157
    Top = 283
  end
  object MSUnit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 221
    Top = 283
  end
  object DSMSUnit: TDataSource
    DataSet = MSUnit
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
  object MSGoalUnit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 277
    Top = 283
  end
  object dsMSGoalUnit: TDataSource
    DataSet = MSGoalUnit
    Left = 277
    Top = 314
  end
  object TempAds: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 344
    Top = 280
  end
  object adsSalesMaster: TADODataSet
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
    Left = 16
    Top = 216
    object adsSalesMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsSalesMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsSalesMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsSalesMasterRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsSalesMasterClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsSalesMasterEmployeID: TIntegerField
      FieldName = 'EmployeID'
      Visible = False
    end
    object adsSalesMasterOriginBillID: TIntegerField
      FieldName = 'OriginBillID'
      Visible = False
    end
    object adsSalesMasterOriginBillTypeID: TIntegerField
      FieldName = 'OriginBillTypeID'
      Visible = False
    end
    object adsSalesMasterPeriodID: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object adsSalesMasterBillModeDC: TIntegerField
      FieldName = 'BillModeDC'
      Visible = False
    end
    object adsSalesMasterCode: TStringField
      FieldName = 'Code'
    end
    object adsSalesMasterDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsSalesMasterDiscountRate: TBCDField
      FieldName = 'DiscountRate'
      DisplayFormat = '#,#.00%'
      
      Precision = 19
      Size = 5
    end
    object adsSalesMasterTaxRate: TBCDField
      FieldName = 'TaxRate'
      DisplayFormat = '#,#.00%'
      
      Precision = 19
      Size = 5
    end
    object adsSalesMasterBillMode: TStringField
      FieldName = 'BillMode'
      Size = 16
    end
    object adsSalesMasterClearDate: TDateTimeField
      FieldName = 'ClearDate'
    end
    object adsSalesMasterMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object adsSalesMasterSundryFee: TBCDField
      FieldName = 'SundryFee'
      DisplayFormat = '#,#.00'
      
      Precision = 19
      Size = 5
    end
    object adsSalesMasterIsApportion: TStringField
      FieldName = 'IsApportion'
      Size = 12
    end
    object adsSalesMasterClientName: TStringField
      FieldKind = fkLookup
      FieldName = 'ClientName'
      LookupDataSet = ClientName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ClientID'
      Lookup = True
    end
    object adsSalesMasterEmployeeName: TStringField
      FieldKind = fkLookup
      FieldName = 'EmployeeName'
      LookupDataSet = EmployeeName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'EmployeID'
      Lookup = True
    end
    object adsSalesMasterIsDeliver: TStringField
      FieldName = 'IsDeliver'
      Size = 10
    end
    object adsSalesMasterIsTax: TStringField
      FieldName = 'IsTax'
      Size = 10
    end
  end
  object adsSalesDetail: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from SLSaleDetail'#13#10'where MasterID = :ID'
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
    Top = 271
    object adsSalesDetailID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsSalesDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsSalesDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
      OnChange = adsSalesDetailGoodsIDChange
    end
    object adsSalesDetailPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      Visible = False
      OnChange = adsSalesDetailPackUnitIDChange
    end
    object adsSalesDetailGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object adsSalesDetailGoodsName: TStringField
      DisplayLabel = #36135#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'GoodsName'
      LookupDataSet = GoodName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Lookup = True
    end
    object adsSalesDetailQuantity: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'Quantity'
      OnChange = adsSalesDetailQuantityChange
      currency = True
      Precision = 19
      Size = 5
    end
    object adsSalesDetailPackUnit: TStringField
      DisplayLabel = #21253#35013#21333#20301
      FieldKind = fkLookup
      FieldName = 'PackUnit'
      LookupDataSet = MSUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsSalesDetailPriceBase: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PriceBase'
      OnChange = adsSalesDetailQuantityChange
      DisplayFormat = '#,#.00'
      
      Precision = 19
    end
    object adsSalesDetailQuantityPcs: TBCDField
      DisplayLabel = #38646#25968
      FieldName = 'QuantityPcs'
      OnChange = adsSalesDetailQuantityChange
      DisplayFormat = '#,#.00'
      
      Precision = 19
      Size = 5
    end
    object adsSalesDetailAmount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsSalesDetailGoalQuantity: TBCDField
      DisplayLabel = #26631#20934#25968#37327
      FieldName = 'GoalQuantity'
      ReadOnly = True
      DisplayFormat = '#,#.00'
      
      Precision = 19
      Size = 5
    end
    object adsSalesDetailGoallUnit: TStringField
      DisplayLabel = #26631#20934#21333#20301
      FieldKind = fkLookup
      FieldName = 'GoallUnit'
      LookupDataSet = MSGoalUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoalUnitID'
      ReadOnly = True
      Lookup = True
    end
    object adsSalesDetailDiscountRate: TBCDField
      DisplayLabel = #25240#25187#29575
      FieldName = 'DiscountRate'
      DisplayFormat = '#,#.0'
      
      Precision = 19
      Size = 5
    end
    object adsSalesDetailDiscount: TBCDField
      DisplayLabel = #25240#25187
      FieldName = 'Discount'
      currency = True
      Precision = 19
    end
    object adsSalesDetailNetAmount: TBCDField
      DisplayLabel = #20928#37329#39069
      FieldName = 'NetAmount'
      currency = True
      Precision = 19
    end
    object adsSalesDetailTaxAmount: TBCDField
      DisplayLabel = #31246#37329
      FieldName = 'TaxAmount'
      currency = True
      Precision = 19
    end
    object adsSalesDetailSundryFee: TBCDField
      DisplayLabel = #38468#21152#36153#29992
      FieldName = 'SundryFee'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsSalesDetailSalesMode: TStringField
      DisplayLabel = #38144#21806#26041#24335
      FieldName = 'SalesMode'
      Size = 16
    end
    object adsSalesDetailTaxrate: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'Taxrate'
      Precision = 19
      Size = 5
    end
  end
end
