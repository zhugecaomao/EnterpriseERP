inherited YDEdProductPlanForm: TYDEdProductPlanForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #29983#20135#35745#21010
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
    Top = 194
    Width = 800
    Height = 316
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsOut'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoalQuantity'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoalUnitName'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #21333#20301'B'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SundryFee'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QuantityPcs'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoodsIn'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 130
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoodsSpec'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #38656#27714#25968#37327
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PackUnitName'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #21333#20301'A'
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceBase'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #38656#27714#37329#39069
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 800
  end
  inherited TopPanel: TPanel
    Width = 800
    Height = 165
    inherited RemarkLabel: TLabel
      Left = 12
      Top = 123
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
      Left = 355
      Top = 45
      Width = 60
      Height = 12
      Caption = #35745#21010#32534#21046#20154
    end
    object Label2: TLabel [4]
      Left = 510
      Top = 45
      Width = 36
      Height = 12
      Caption = #32463#25163#20154
    end
    object Label3: TLabel [5]
      Left = 14
      Top = 45
      Width = 48
      Height = 12
      Caption = #35745#21010#31867#21035
    end
    object Label6: TLabel [6]
      Left = 12
      Top = 85
      Width = 48
      Height = 12
      Caption = #35745#21010#35828#26126
    end
    object Label7: TLabel [7]
      Left = 510
      Top = 85
      Width = 48
      Height = 12
      Caption = #25191#34892#26085#26399
    end
    object Label9: TLabel [8]
      Left = 14
      Top = 5
      Width = 48
      Height = 12
      Caption = #35745#21010#26399#38388
    end
    object Label4: TLabel [9]
      Left = 260
      Top = 85
      Width = 48
      Height = 12
      Caption = #25216#26415#35828#26126
    end
    object Label5: TLabel [10]
      Left = 260
      Top = 122
      Width = 72
      Height = 12
      Caption = #36873#25321#37197#26009#28165#21333
    end
    object Label10: TLabel [11]
      Left = 464
      Top = 124
      Width = 48
      Height = 12
      Caption = #35745#21010#25968#37327
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 12
      Top = 138
      Width = 235
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
      Left = 355
      Top = 61
      Width = 140
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
      TabOrder = 4
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object LookupEmployee: TQLDBLookupComboBox
      Left = 510
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
      TabOrder = 5
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object DbCBxBillMode: TDBComboBox
      Left = 12
      Top = 61
      Width = 328
      Height = 20
      DataField = 'BillMode'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 12
      Top = 100
      Width = 235
      Height = 20
      DataField = 'Deliver'
      DataSource = MasterDataSource
      TabOrder = 6
    end
    object DBEdit4: TDBEdit
      Left = 260
      Top = 100
      Width = 235
      Height = 20
      DataField = 'Apportion'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object DBEdit5: TDBEdit
      Left = 510
      Top = 101
      Width = 140
      Height = 20
      DataField = 'ClearDate'
      DataSource = MasterDataSource
      TabOrder = 8
    end
    object DBCBxBrief: TDBComboBox
      Left = 12
      Top = 20
      Width = 328
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 0
    end
    object BitBtn1: TBitBtn
      Left = 582
      Top = 139
      Width = 41
      Height = 17
      Hint = #30830#23450#21518#65292#23558#25226#37197#26009#28165#21333#30340#25968#25454#21644#35745#21010#25968#37327#25554#20837#21040#35745#21010#34920#20013#12290
      Caption = #30830#23450
      TabOrder = 11
      OnClick = BitBtn1Click
    end
    object DBEdit1: TDBEdit
      Left = 464
      Top = 138
      Width = 110
      Height = 20
      DataField = 'SundryFee'
      DataSource = MasterDataSource
      TabOrder = 10
    end
    object LookupYDFormalID: TQLDBLookupComboBox
      Left = 260
      Top = 138
      Width = 197
      Height = 20
      DataField = 'WarehouseID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Brief'
      ListSource = DsYDFormalID
      TabOrder = 12
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 510
    Width = 800
    Height = 24
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
  end
  inherited MainMenu: TMainMenu
    Left = 344
    Top = 2
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 384
    Top = 0
  end
  object ClientName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
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
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 91
    Top = 239
  end
  object GoodsOut: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 173
    Top = 239
  end
  object dsGoodsOut: TDataSource
    DataSet = GoodsOut
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
    Left = 272
    Top = 239
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select *'#13#10'from YDProductPlanMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ' +
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
    object adsMasterFormalIDName: TStringField
      FieldKind = fkLookup
      FieldName = 'FormalIDName'
      LookupDataSet = AdsYDFormalID
      LookupKeyFields = 'ID'
      LookupResultField = 'Brief'
      KeyFields = 'WarehouseID'
      Lookup = True
    end
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from YDProductPlanDetail'#13#10'where MasterID = :ID'
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
    Left = 50
    Top = 239
    object adsDetailID: TAutoIncField
      FieldName = 'ID'
      Visible = False
    end
    object adsDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsDetailGoodsOutID: TIntegerField
      DisplayLabel = #20135#20986#20135#21697'ID'
      FieldName = 'GoodsOutID'
      Visible = False
    end
    object adsDetailGoodsOut: TStringField
      DisplayLabel = #20135#20986#20135#21697
      FieldKind = fkLookup
      FieldName = 'GoodsOut'
      LookupDataSet = GoodsOut
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsOutID'
      Lookup = True
    end
    object adsDetailGoalQuantity: TBCDField
      DisplayLabel = #20135#20986#25968#37327
      FieldName = 'GoalQuantity'
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailGoalUnitID: TIntegerField
      DisplayLabel = #20135#20986#21333#20301'ID'
      FieldName = 'GoalUnitID'
    end
    object adsDetailGoalUnitName: TStringField
      DisplayLabel = #20135#20986#21333#20301
      FieldKind = fkLookup
      FieldName = 'GoalUnitName'
      LookupDataSet = GoalUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoalUnitID'
      Lookup = True
    end
    object adsDetailTaxAmount: TBCDField
      DisplayLabel = #31995#25968
      FieldName = 'TaxAmount'
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsDetailQuantityPcs: TBCDField
      DisplayLabel = #21333#20301#25104#26412
      FieldName = 'QuantityPcs'
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailSundryFee: TBCDField
      DisplayLabel = #24635#25104#26412
      FieldName = 'SundryFee'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailGoodsID: TIntegerField
      DisplayLabel = #25237#20837#26448#26009'ID'
      FieldName = 'GoodsID'
      Visible = False
    end
    object adsDetailGoodsIn: TStringField
      DisplayLabel = #38656#27714#26448#26009#21517#31216
      FieldKind = fkLookup
      FieldName = 'GoodsIn'
      LookupDataSet = AdsGoodsIn
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Lookup = True
    end
    object adsDetailGoodsSpec: TStringField
      DisplayLabel = #35268#26684#22411#21495
      FieldName = 'GoodsSpec'
      Size = 30
    end
    object adsDetailQuantity: TBCDField
      DisplayLabel = #25237#20837#25968#37327
      FieldName = 'Quantity'
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailPackUnitID: TIntegerField
      DisplayLabel = #25237#20837#21333#20301'ID'
      FieldName = 'PackUnitID'
    end
    object adsDetailPackUnitName: TStringField
      DisplayLabel = #25237#20837#21333#20301
      FieldKind = fkLookup
      FieldName = 'PackUnitName'
      LookupDataSet = AdsPackunit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsDetailPriceBase: TBCDField
      DisplayLabel = #25104#26412#21333#20215
      FieldName = 'PriceBase'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      Precision = 19
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #25237#20837#37329#39069
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
    object adsDetailDiscount: TBCDField
      DisplayLabel = #25240#25187#37329#39069
      FieldName = 'Discount'
      Visible = False
      currency = True
      Precision = 19
    end
  end
  object adsGoodsSpec: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 132
    Top = 239
    object adsGoodsSpecID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsGoodsSpecCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsGoodsSpecCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsGoodsSpecRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsGoodsSpecUpid: TIntegerField
      FieldName = 'Upid'
    end
    object adsGoodsSpecName: TStringField
      FieldName = 'Name'
      Size = 60
    end
    object adsGoodsSpecMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object adsGoodsSpecLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
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
    Left = 238
    Top = 239
  end
  object dsGoalUnit: TDataSource
    DataSet = GoalUnit
    Left = 238
    Top = 274
  end
  object AdsPackunit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 205
    Top = 239
  end
  object dsPackunit: TDataSource
    DataSet = AdsPackunit
    Left = 205
    Top = 274
  end
  object AdsGoodsIn: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 85
    Top = 319
  end
  object dsGoodsIn: TDataSource
    DataSet = AdsGoodsIn
    Left = 85
    Top = 354
  end
  object AdsYDFormalID: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select  ID, Code, Brief '#13#10'from YDFormulaMaster'#13#10'where RecordStat' +
      'e<>'#39#21024#38500#39
    Parameters = <>
    Left = 434
    Top = 96
    object AdsYDFormalIDID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object AdsYDFormalIDCode: TStringField
      FieldName = 'Code'
    end
    object AdsYDFormalIDBrief: TStringField
      FieldName = 'Brief'
      Size = 30
    end
  end
  object DsYDFormalID: TDataSource
    DataSet = AdsYDFormalID
    Left = 437
    Top = 129
  end
end
