inherited YDEdPurchasePlanForm: TYDEdPurchasePlanForm
  Left = 26
  Top = 109
  Width = 679
  Height = 469
  Caption = #29983#20135#37319#36141#35745#21010
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
    Top = 179
    Width = 671
    Height = 220
    Columns = <
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 139
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoodsName'
        Title.Alignment = taCenter
        Width = 177
        Visible = True
        ControlType = ctCustomControl
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Goalunit'
        Title.Alignment = taCenter
        Width = 58
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceBase'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 671
  end
  inherited TopPanel: TPanel
    Width = 671
    Height = 150
    inherited RemarkLabel: TLabel
      Left = 12
      Top = 85
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
      Width = 72
      Height = 12
      Caption = #37319#36141#35745#21010#31867#21035
    end
    object Label7: TLabel [6]
      Left = 355
      Top = 85
      Width = 48
      Height = 12
      Caption = #37319#36141#26085#26399
    end
    object Label9: TLabel [7]
      Left = 14
      Top = 5
      Width = 72
      Height = 12
      Caption = #37319#36141#35745#21010#26399#38388
    end
    object Label5: TLabel [8]
      Left = 12
      Top = 130
      Width = 72
      Height = 12
      Caption = #36873#25321#29983#20135#35745#21010
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 12
      Top = 101
      Width = 328
      DataField = 'Memo'
      TabOrder = 7
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
    object DBEdit5: TDBEdit
      Left = 355
      Top = 101
      Width = 140
      Height = 20
      DataField = 'ClearDate'
      DataSource = MasterDataSource
      TabOrder = 6
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
    object CBxFormula: TComboBox
      Left = 96
      Top = 126
      Width = 245
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 8
    end
    object BitBtn1: TBitBtn
      Left = 398
      Top = 128
      Width = 99
      Height = 17
      Hint = #30830#23450#21518#65292#23558#25226#37197#26009#28165#21333#30340#25968#25454#21644#35745#21010#25968#37327#25554#20837#21040#35745#21010#34920#20013#12290
      Caption = #29983#25104#37319#36141#35745#21010
      TabOrder = 9
      Visible = False
      OnClick = BitBtn1Click
    end
    object BitBtn2: TBitBtn
      Left = 350
      Top = 128
      Width = 41
      Height = 17
      Hint = #30830#23450#21518#65292#23558#25226#37197#26009#28165#21333#30340#25968#25454#21644#35745#21010#25968#37327#25554#20837#21040#35745#21010#34920#20013#12290
      Caption = #36873#25321
      TabOrder = 10
      OnClick = BitBtn2Click
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 399
    Width = 671
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
    Left = 99
    Top = 240
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
      'select *'#13#10'from YDPurchasePlanMaster'#13#10'where RecordState<>'#39#21024#38500#39' and' +
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
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from YDPurchasePlanDetail'#13#10'where MasterID = :ID'
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
    object adsDetailID: TIntegerField
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
    end
    object adsDetailPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      Visible = False
    end
    object adsDetailGoodsSpec: TStringField
      FieldName = 'GoodsSpec'
      Visible = False
      Size = 30
    end
    object adsDetailQuantityPcs: TBCDField
      FieldName = 'QuantityPcs'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailGoodsOutID: TIntegerField
      FieldName = 'GoodsOutID'
      Visible = False
    end
    object adsDetailDiscount: TBCDField
      FieldName = 'Discount'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object adsDetailSundryFee: TBCDField
      FieldName = 'SundryFee'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailGoalQuantity: TBCDField
      FieldName = 'GoalQuantity'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailTaxAmount: TBCDField
      FieldName = 'TaxAmount'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #29983#20135#35745#21010#32534#21495
      FieldName = 'Memo'
      Size = 30
    end
    object adsDetailGoodsName: TStringField
      DisplayLabel = #37319#36141#21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'GoodsName'
      LookupDataSet = GoodName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Lookup = True
    end
    object adsDetailQuantity: TBCDField
      DisplayLabel = #37319#36141#25968#37327
      FieldName = 'Quantity'
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailGoalunit: TStringField
      DisplayLabel = #21333#20301
      FieldKind = fkLookup
      FieldName = 'Goalunit'
      LookupDataSet = GoalUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoalUnitID'
      Lookup = True
    end
    object adsDetailPriceBase: TBCDField
      DisplayLabel = #35745#21010#25104#26412
      FieldName = 'PriceBase'
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
      Size = 5
    end
  end
  object GoalUnit: TADODataSet
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
  object DsGoodName: TDataSource
    DataSet = GoodName
    Left = 94
    Top = 274
  end
end
