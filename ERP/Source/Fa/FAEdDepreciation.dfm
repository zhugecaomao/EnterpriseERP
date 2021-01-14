inherited FAEdDepreciationForm: TFAEdDepreciationForm
  Left = -3
  Top = 26
  Width = 808
  Height = 580
  Caption = #36164#20135#25240#26087
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
    Width = 800
    Height = 326
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        Title.Alignment = taCenter
        Width = 207
        Visible = True
        ControlType = ctCustomControl
        CustomControl = GoodsLookup
      end
      item
        Expanded = False
        FieldName = 'GoodsSpec'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PackUnit'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
        ControlType = ctCustomControl
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoalQuantity'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SundryFee'
        Title.Alignment = taCenter
        Width = 90
        Visible = True
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
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 110
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
      Caption = #25240#26087#26399#38388
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
    object Label6: TLabel [6]
      Left = 12
      Top = 88
      Width = 48
      Height = 12
      Caption = #36164#20135#35828#26126
    end
    object Label7: TLabel [7]
      Left = 510
      Top = 88
      Width = 72
      Height = 12
      Caption = #26377#25928#25240#26087#26085#26399
    end
    object Label9: TLabel [8]
      Left = 14
      Top = 45
      Width = 36
      Height = 12
      Caption = #23457#26680#20154
    end
    object Label4: TLabel [9]
      Left = 355
      Top = 88
      Width = 48
      Height = 12
      Caption = #36164#20135#31867#21035
    end
    inherited RemarkDBEdit: TDBEdit
      Top = 130
      Width = 300
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
      Top = 61
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
      TabOrder = 3
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
      Top = 20
      Width = 328
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 0
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
      Width = 328
      Height = 20
      DataField = 'Deliver'
      DataSource = MasterDataSource
      TabOrder = 6
    end
    object DBEdit4: TDBEdit
      Left = 355
      Top = 103
      Width = 140
      Height = 20
      DataField = 'Apportion'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object DBEdit5: TDBEdit
      Left = 510
      Top = 104
      Width = 140
      Height = 20
      DataField = 'ClearDate'
      DataSource = MasterDataSource
      TabOrder = 8
    end
    object BitBtn1: TBitBtn
      Left = 360
      Top = 129
      Width = 97
      Height = 23
      Caption = #25552#21462#25240#26087#36164#26009
      TabOrder = 10
      OnClick = BitBtn1Click
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 510
    Width = 800
    Height = 24
  end
  object GoodsLookup: TQLDBLookupComboBox [5]
    Left = 17
    Top = 204
    Width = 200
    Height = 20
    DataField = 'GoodsID'
    DataSource = DetailDataSource
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DsGoodName
    TabOrder = 4
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsMaster
    Left = 115
    Top = 78
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsDetail
    Left = 34
    Top = 298
  end
  inherited ActionList: TActionList
    Left = 339
    Top = 1
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
    object StockQuerry: TAction [16]
      Caption = #24211#23384#26597#35810'(&S)'
      Hint = #24211#23384#21830#21697#26597#35810#65292#24182#19988#21487#36827#34892#22810#27425#26597#35810
      ImageIndex = 3
    end
    inherited FindAction: TAction [17]
    end
    inherited CloseAction: TAction [18]
    end
  end
  inherited MainMenu: TMainMenu
    Left = 392
    Top = 1
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 456
    Top = 1
    object N51: TMenuItem
      Caption = #39044#35745#27531#20540'5%'
    end
    object N81: TMenuItem
      Caption = #39044#35745#27531#20540'8%'
    end
    object N101: TMenuItem
      Caption = #39044#35745#27531#20540'10%'
    end
    object N121: TMenuItem
      Caption = #39044#35745#27531#20540'12%'
    end
    object N151: TMenuItem
      Caption = #39044#35745#27531#20540'15%'
    end
    object N201: TMenuItem
      Caption = #39044#35745#27531#20540'20%'
    end
  end
  object ClientName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 153
    Top = 38
  end
  object EmployeeName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 192
    Top = 38
  end
  object GoodName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 80
    Top = 267
  end
  object PackUnit: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Code, Brief'#13#10' from FAAssetAddMaster'#13#10'where RecordStat' +
      'e<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 140
    Top = 275
  end
  object DSClientName: TDataSource
    DataSet = ClientName
    Left = 153
    Top = 78
  end
  object DSEmployeeName: TDataSource
    DataSet = EmployeeName
    Left = 192
    Top = 78
  end
  object TempAds: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 264
    Top = 259
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select *'#13#10'from FADepreciationMaster'#13#10'where RecordState<>'#39#21024#38500#39' and' +
      ' ID=:ID'
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
    Top = 38
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
    object adsMasterWarehouseID: TIntegerField
      FieldName = 'WarehouseID'
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
      DisplayFormat = '#,#.00%'
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
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from FADepreciationDetail'#13#10'where MasterID = :ID'
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
    Left = 34
    Top = 267
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
    object adsDetailGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object adsDetailPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      Visible = False
    end
    object adsDetailTaxAmount: TBCDField
      DisplayLabel = #31246#37329
      FieldName = 'TaxAmount'
      Visible = False
      currency = True
      Precision = 19
    end
    object adsDetailQuantityPcs: TBCDField
      FieldName = 'QuantityPcs'
      Visible = False
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
    object adsDetailPriceBase: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PriceBase'
      Visible = False
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsDetailGoodsName: TStringField
      DisplayLabel = #36164#20135#21517#31216
      FieldKind = fkLookup
      FieldName = 'GoodsName'
      LookupDataSet = GoodName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      ReadOnly = True
      Lookup = True
    end
    object adsDetailGoodsSpec: TStringField
      DisplayLabel = #35268#26684#22411#21495
      FieldName = 'GoodsSpec'
      ReadOnly = True
      Size = 30
    end
    object adsDetailPackUnit: TStringField
      DisplayLabel = #36164#20135#32534#21495
      FieldKind = fkLookup
      FieldName = 'PackUnit'
      LookupDataSet = PackUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Code'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsDetailQuantity: TBCDField
      DisplayLabel = #36164#20135#21407#20540
      FieldName = 'Quantity'
      ReadOnly = True
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailGoalQuantity: TBCDField
      DisplayLabel = #39044#35745#27531#20540
      FieldName = 'GoalQuantity'
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailSundryFee: TBCDField
      DisplayLabel = #25240#26087#29575
      FieldName = 'SundryFee'
      ReadOnly = True
      DisplayFormat = '#,#.00%'
      Precision = 19
      Size = 5
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #26412#26399#25240#26087
      FieldName = 'Amount'
      Visible = False
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
  object adsWarehouse: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from STWarehouse'#13#10'where RecordState<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 233
    Top = 38
  end
  object dsWarehouse: TDataSource
    DataSet = adsWarehouse
    Left = 233
    Top = 78
  end
  object DsGoodName: TDataSource
    DataSet = GoodName
    Left = 82
    Top = 298
  end
end
