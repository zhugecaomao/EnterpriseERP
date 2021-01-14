inherited SREdWorkQuantityForm: TSREdWorkQuantityForm
  Left = 27
  Top = 166
  Width = 738
  Height = 460
  Caption = #35745#20214#32479#35745
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
    Top = 193
    Width = 730
    Height = 197
    Columns = <
      item
        Expanded = False
        FieldName = 'Employee'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Jobs'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceBase'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
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
    Width = 730
  end
  inherited TopPanel: TPanel
    Width = 730
    Height = 164
    inherited RemarkLabel: TLabel
      Left = 355
      Top = 86
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
      Width = 48
      Height = 12
      Caption = #19994#21153#31867#22411
    end
    object Label5: TLabel [5]
      Left = 12
      Top = 44
      Width = 36
      Height = 12
      Caption = #23457#26680#20154
    end
    object Label7: TLabel [6]
      Left = 12
      Top = 86
      Width = 48
      Height = 12
      Caption = #32479#35745#26085#26399
    end
    object Label9: TLabel [7]
      Left = 14
      Top = 5
      Width = 84
      Height = 12
      Caption = #32479#35745#26376#20221'('#26399#38388')'
    end
    object Label1: TLabel [8]
      Left = 174
      Top = 86
      Width = 48
      Height = 12
      Caption = #32479#19968#20135#37327
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 355
      Top = 102
      Width = 293
      DataField = 'Memo'
      TabOrder = 8
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
      Left = 12
      Top = 102
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
    object BitBtn1: TBitBtn
      Left = 11
      Top = 130
      Width = 79
      Height = 22
      Hint = #28857#20987#27492#25353#38062#21487#20197#35774#32622#26465#20214#65292#25209#37327#25552#21462#21592#24037#21517#21333#12290
      Caption = #21462#21592#24037#21517#21333
      ParentShowHint = False
      ShowHint = True
      TabOrder = 11
      OnClick = BitBtn1Click
    end
    object DBEdit2: TDBEdit
      Left = 174
      Top = 102
      Width = 140
      Height = 20
      DataField = 'SundryFee'
      DataSource = MasterDataSource
      TabOrder = 7
    end
    object BitBtn2: TBitBtn
      Left = 104
      Top = 130
      Width = 79
      Height = 22
      Hint = #28857#20987#27492#25353#38062#21487#20174#35745#20214#39033#30446#34920#20013#25552#21462#20840#37096#25110#37096#20998#35745#20214#39033#30446#36164#26009#65292#20197#24555#36895#24405#20837#35745#20214#21333#20215#36164#26009#12290
      Caption = #21462#32479#19968#24037#20215
      TabOrder = 12
      OnClick = BitBtn2Click
    end
    object BitBtn3: TBitBtn
      Left = 362
      Top = 130
      Width = 79
      Height = 22
      Hint = #28857#20987#27492#25353#38062#21487#23558#32479#19968#20135#37327#22635#20889#21040#20135#37327#20026#38646#30340#35760#24405#20013#12290
      Caption = #21462#32479#19968#20135#37327
      TabOrder = 9
      OnClick = BitBtn3Click
    end
    object BitBtn4: TBitBtn
      Left = 450
      Top = 130
      Width = 79
      Height = 22
      Hint = #28857#20987#27492#25353#38062#21487#23558#32479#19968#20135#37327#22635#20889#21040#20135#37327#20026#38646#30340#35760#24405#20013#12290
      Caption = #28165#38500#32479#19968#20135#37327
      TabOrder = 10
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 187
      Top = 130
      Width = 79
      Height = 22
      Hint = #28857#20987#27492#25353#38062#21487#23558#32479#19968#20135#37327#22635#20889#21040#20135#37327#20026#38646#30340#35760#24405#20013#12290
      Caption = #28165#38500#32479#19968#24037#20215
      TabOrder = 13
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 271
      Top = 130
      Width = 79
      Height = 22
      Hint = #28857#20987#27492#25353#38062#21487#23558#32479#19968#20135#37327#22635#20889#21040#20135#37327#20026#38646#30340#35760#24405#20013#12290
      Caption = #28165#38500#35745#20214#39033#30446
      TabOrder = 14
      OnClick = BitBtn6Click
    end
    object BitBtn7: TBitBtn
      Left = 546
      Top = 130
      Width = 79
      Height = 22
      Hint = #28857#20987#27492#25353#38062#21487#23558#32479#19968#20135#37327#22635#20889#21040#20135#37327#20026#38646#30340#35760#24405#20013#12290
      Caption = #32479#19968#35745#20214
      TabOrder = 15
      OnClick = BitBtn7Click
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 390
    Width = 730
    Height = 24
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
    Left = 456
    Top = 1
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
  object AdsSRJobs: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, ID as JobsID,  Name, PriceBase  from SRJobs'#13#10'where Re' +
      'cordState<>'#39#21024#38500#39' '#13#10
    Parameters = <>
    Left = 148
    Top = 267
  end
  object dsSRJobs: TDataSource
    DataSet = AdsSRJobs
    Left = 148
    Top = 306
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
    Left = 200
    Top = 267
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select *'#13#10'from SRWorkQuantityMaster'#13#10'where RecordState<>'#39#21024#38500#39' and' +
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
    CommandText = 'select *'#13#10'from SRWorkQuantityDetail'#13#10'where MasterID = :ID'
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
      ReadOnly = True
      Visible = False
    end
    object adsDetailQuantityPcs: TBCDField
      FieldName = 'QuantityPcs'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailSundryFee: TBCDField
      FieldName = 'SundryFee'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsDetailDiscount: TBCDField
      FieldName = 'Discount'
      Visible = False
      Precision = 19
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
    end
    object adsDetailGoodsSpec: TStringField
      FieldName = 'GoodsSpec'
      Visible = False
      Size = 30
    end
    object adsDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
    end
    object adsDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsDetailGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object adsDetailPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      Visible = False
      OnChange = adsDetailPackUnitIDChange
    end
    object adsDetailEmployee: TStringField
      DisplayLabel = #21592#24037#22995#21517
      FieldKind = fkLookup
      FieldName = 'Employee'
      LookupDataSet = AdsEmployeeD
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoalUnitID'
      Lookup = True
    end
    object adsDetailJobs: TStringField
      DisplayLabel = #35745#20214#39033#30446
      FieldKind = fkLookup
      FieldName = 'Jobs'
      LookupDataSet = AdsSRJobs
      LookupKeyFields = 'JobsID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsDetailPriceBase: TBCDField
      DisplayLabel = #35745#20214#24037#20215
      FieldName = 'PriceBase'
      OnChange = adsDetailPriceBaseChange
      DisplayFormat = '#,#0.000'
      EditFormat = '#.####'
      Precision = 19
    end
    object adsDetailQuantity: TBCDField
      DisplayLabel = #24037#20316#37327'/'#20135#37327
      FieldName = 'Quantity'
      OnChange = adsDetailPriceBaseChange
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #35745#20214#24037#36164
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
  end
  object AdsEmployeeD: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 96
    Top = 262
  end
  object dsEmployeeD: TDataSource
    DataSet = AdsEmployeeD
    Left = 96
    Top = 302
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 296
    Top = 272
  end
  object ADOQuery1: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 240
    Top = 272
  end
end
