inherited SREdWorkRestForm: TSREdWorkRestForm
  Left = 66
  Top = 79
  Width = 668
  Height = 461
  Caption = #29983#20135#25490#29677#34920
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
    Top = 147
    Width = 660
    Height = 244
    Columns = <
      item
        Expanded = False
        FieldName = 'Employee'
        Title.Alignment = taCenter
        Width = 159
        Visible = True
        ControlType = ctCustomControl
        CustomControl = GoodsLookup
      end
      item
        Expanded = False
        FieldName = 'WTschedule'
        Title.Alignment = taCenter
        Width = 200
        Visible = True
        ControlType = ctCustomControl
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 249
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 660
  end
  inherited TopPanel: TPanel
    Width = 660
    Height = 118
    inherited RemarkLabel: TLabel
      Left = 357
      Top = 93
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
    object Label2: TLabel [3]
      Left = 355
      Top = 44
      Width = 36
      Height = 12
      Caption = #32463#25163#20154
    end
    object Label3: TLabel [4]
      Left = 510
      Top = 45
      Width = 72
      Height = 12
      Caption = #20316#24687#26102#38388#31867#21035
    end
    object Label5: TLabel [5]
      Left = 12
      Top = 44
      Width = 36
      Height = 12
      Caption = #25209#20934#20154
    end
    object Label7: TLabel [6]
      Left = 12
      Top = 93
      Width = 48
      Height = 12
      Caption = #24320#22987#26085#26399
    end
    object Label9: TLabel [7]
      Left = 14
      Top = 5
      Width = 60
      Height = 12
      Caption = #29983#20135#25490#29677#34920
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 388
      Top = 89
      Width = 262
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
    object DBEdit5: TDBEdit
      Left = 65
      Top = 89
      Width = 140
      Height = 20
      DataField = 'ClearDate'
      DataSource = MasterDataSource
      TabOrder = 6
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
    object BitBtn2: TBitBtn
      Left = 216
      Top = 88
      Width = 75
      Height = 25
      Caption = #21462#21592#24037#21517#21333
      TabOrder = 8
      OnClick = BitBtn2Click
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 391
    Width = 660
    Height = 24
  end
  inherited GoodsLookup: TQLDBLookupComboBox
    Left = 17
    Top = 164
    Width = 144
    DataField = 'GoodsID'
    DataSource = DetailDataSource
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DsGoodsName
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
    inherited A3: TMenuItem
      Visible = False
    end
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 256
    Top = 193
    object SRWKRSClear: TMenuItem
      Caption = #28165#38500#25490#29677
      OnClick = SRWKRSClearClick
    end
    object N41: TMenuItem
      Caption = #36830#32493#35774#23450
      OnClick = N41Click
    end
    object N51: TMenuItem
      Caption = #36830#32493'2'#27425
      OnClick = N51Click
    end
    object N101: TMenuItem
      Caption = #36830#32493'3'#27425
      OnClick = N101Click
    end
    object N102: TMenuItem
      Caption = #36830#32493'5'#27425
      OnClick = N102Click
    end
    object N42: TMenuItem
      Caption = #36830#32493'10'#27425
      OnClick = N42Click
    end
  end
  object ClientName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 153
    Top = 38
  end
  object EmployeeName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 192
    Top = 38
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
    Left = 248
    Top = 259
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select *'#13#10'from SRWorkRestMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ID=' +
      ':ID'
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
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from  SRWorkRestDetail'#13#10'where MasterID = :ID'
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
    Top = 259
    object adsDetailID: TAutoIncField
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
    object adsDetailGoodsSpec: TStringField
      FieldName = 'GoodsSpec'
      Visible = False
      Size = 30
    end
    object adsDetailQuantity: TBCDField
      FieldName = 'Quantity'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailQuantityPcs: TBCDField
      FieldName = 'QuantityPcs'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      Visible = False
    end
    object adsDetailPriceBase: TBCDField
      FieldName = 'PriceBase'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailAmount: TBCDField
      FieldName = 'Amount'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailDiscount: TBCDField
      FieldName = 'Discount'
      Visible = False
      Precision = 19
    end
    object adsDetailTaxAmount: TBCDField
      FieldName = 'TaxAmount'
      Visible = False
      Precision = 19
    end
    object adsDetailSundryFee: TBCDField
      FieldName = 'SundryFee'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object adsDetailGoalQuantity: TBCDField
      FieldName = 'GoalQuantity'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailStartTime: TDateTimeField
      FieldName = 'StartTime'
      Visible = False
    end
    object adsDetailEndTime: TDateTimeField
      FieldName = 'EndTime'
      Visible = False
    end
    object adsDetailEmployee: TStringField
      DisplayLabel = #21592#24037#21517#21333
      FieldKind = fkLookup
      FieldName = 'Employee'
      LookupDataSet = GoodsName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Lookup = True
    end
    object adsDetailWTschedule: TStringField
      DisplayLabel = #20316#24687#26102#38388#34920#21517#31216
      FieldKind = fkLookup
      FieldName = 'WTschedule'
      LookupDataSet = Worktime1
      LookupKeyFields = 'ID'
      LookupResultField = 'Brief'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #25490#29677#22791#27880
      FieldName = 'Memo'
      Size = 30
    end
  end
  object GoodsName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name from MSEmployee'#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 120
    Top = 259
  end
  object DsGoodsName: TDataSource
    DataSet = GoodsName
    Left = 120
    Top = 298
  end
  object Worktime1: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Brief  from SRWorkScheduleMaster'#13#10'where   RecordState' +
      '<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 168
    Top = 259
  end
  object DsWorktime1: TDataSource
    DataSet = Worktime1
    Left = 168
    Top = 298
  end
end
