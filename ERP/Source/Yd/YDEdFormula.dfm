inherited YDEdFormulaForm: TYDEdFormulaForm
  Left = 0
  Top = -4
  Width = 812
  Height = 612
  Caption = #29289#26009#28165#21333
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
    Width = 804
    Height = 358
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        Title.Alignment = taCenter
        Width = 131
        Visible = True
        ControlType = ctCustomControl
        CustomControl = GoodsLookup
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Title.Alignment = taCenter
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
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 60
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoodsOut'
        Title.Alignment = taCenter
        Width = 130
        Visible = True
        ControlType = ctCustomControl
        CustomControl = LookGoodsOut
      end
      item
        Expanded = False
        FieldName = 'GoalQuantity'
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
        FieldName = 'TaxAmount'
        Title.Alignment = taCenter
        Title.Caption = #25104#26412#31995#25968
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SundryFee'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 60
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
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 804
  end
  inherited TopPanel: TPanel
    Width = 804
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
      Left = 355
      Top = 45
      Width = 36
      Height = 12
      Caption = #35774#35745#20154
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
      Caption = #28165#21333#31867#21035
    end
    object Label6: TLabel [6]
      Left = 12
      Top = 88
      Width = 48
      Height = 12
      Caption = #35268#26684#22411#21495
    end
    object Label7: TLabel [7]
      Left = 510
      Top = 88
      Width = 48
      Height = 12
      Caption = #21551#29992#26085#26399
    end
    object Label9: TLabel [8]
      Left = 14
      Top = 5
      Width = 72
      Height = 12
      Caption = #37197#26009#28165#21333#21517#31216
    end
    object Label4: TLabel [9]
      Left = 260
      Top = 88
      Width = 48
      Height = 12
      Caption = #25216#26415#35828#26126
    end
    object SpeedButton1: TSpeedButton [10]
      Left = 722
      Top = 128
      Width = 75
      Height = 22
      Caption = #35745#31639#25104#26412
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton [11]
      Left = 420
      Top = 128
      Width = 75
      Height = 22
      Hint = #21462#24403#21069#24211#23384#21333#20215#27979#31639#20135#20986#21333#20301#25104#26412#12290
      Caption = #24403#21069#24211#23384#20215
      OnClick = SpeedButton2Click
    end
    object SpeedButton3: TSpeedButton [12]
      Left = 495
      Top = 128
      Width = 75
      Height = 22
      Hint = #21462#26368#26032#36827#36135#20215#27979#31639#20135#20986#21333#20301#25104#26412
      Caption = #26368#26032#36827#36135#20215
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton [13]
      Left = 646
      Top = 128
      Width = 75
      Height = 22
      Hint = #24403#21069#21830#21697#25104#26412#21333#20215#20026#38646#30340#29992#21442#32771#36827#20215#22635#20805#12290
      Caption = #22635#20805#21442#32771#36827#20215
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton [14]
      Left = 571
      Top = 128
      Width = 75
      Height = 22
      Hint = #24403#21069#21830#21697#25104#26412#21333#20215#20026#38646#30340#29992#21442#32771#36827#20215#22635#20805#12290
      Caption = #21442#32771#36827#20215
      ParentShowHint = False
      ShowHint = True
      OnClick = SpeedButton5Click
    end
    inherited RemarkDBEdit: TDBEdit
      Top = 130
      Width = 377
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
      Top = 103
      Width = 235
      Height = 20
      DataField = 'Deliver'
      DataSource = MasterDataSource
      TabOrder = 6
    end
    object DBEdit4: TDBEdit
      Left = 260
      Top = 103
      Width = 235
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
  end
  inherited StatusBar1: TStatusBar
    Top = 542
    Width = 804
    Height = 24
  end
  object GoodsLookup: TQLDBLookupComboBox [5]
    Left = 16
    Top = 201
    Width = 129
    Height = 18
    Ctl3D = False
    DataField = 'GoodsID'
    DataSource = DetailDataSource
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsGoodName
    ParentCtl3D = False
    TabOrder = 4
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object LookGoodsOut: TQLDBLookupComboBox [6]
    Left = 484
    Top = 202
    Width = 109
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'GoodsOutID'
    DataSource = DetailDataSource
    DropDownRows = 10
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsGoodsOut
    ParentCtl3D = False
    TabOrder = 5
    Visible = False
    ButtonHeight = 22
    OnButtonClick = LookGoodsOutButtonClick
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object CALCosttipPanel: TPanel [7]
    Left = 280
    Top = 304
    Width = 225
    Height = 41
    Caption = #27491#22312#35745#31639#25104#26412'............'
    TabOrder = 6
    Visible = False
  end
  object FormulaAssemblePanel: TPanel [8]
    Left = 174
    Top = 112
    Width = 478
    Height = 294
    TabOrder = 7
    Visible = False
    object OKORCancelPanel: TPanel
      Left = 1
      Top = 252
      Width = 476
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object OKBitBtn: TBitBtn
        Left = 192
        Top = 8
        Width = 75
        Height = 25
        Caption = #30830#23450
        TabOrder = 0
        OnClick = OKBitBtnClick
      end
      object CanelBitBtn: TBitBtn
        Left = 304
        Top = 8
        Width = 75
        Height = 25
        Caption = #21462#28040
        TabOrder = 1
        OnClick = CanelBitBtnClick
      end
    end
    object FormulaAssembleGrd: TQLDBGrid
      Left = 1
      Top = 1
      Width = 476
      Height = 251
      Align = alClient
      DataSource = FormulaAssembleDS
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnTitleClick = FormulaAssembleGrdTitleClick
      AlternateColor = 15399421
      CurrencyView.CurrencyTitle = False
      CurrencyView.DigitAlignment = taCenter
      CurrencyView.DigitWidth = 9
      CurrencyView.IntegerSeparateColor = clRed
      CurrencyView.SeparateColor = clSilver
      CurrencyView.ThousandSeparateColor = clGray
      CurrencyView.TitleLines = False
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      OptionsEx = [dgAllowDelete, dgAllowInsert]
      Columns = <
        item
          Expanded = False
          FieldName = #28165#21333#31867#21035
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #28165#21333#21517#31216
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25237#20837#26448#26009
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25237#20837#25968#37327
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#20301
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = #28165#21333#29366#24577
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end>
    end
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
    Left = 299
    Top = 7
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
    object FormulaAssembleAct: TAction
      Caption = #32452#21512'(&A)'
      OnExecute = FormulaAssembleActExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 336
    Top = 10
    inherited EditMenuItem: TMenuItem
      object N41: TMenuItem [8]
        Action = FormulaAssembleAct
      end
    end
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 376
    Top = 16
  end
  object ClientName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 146
    Top = 32
  end
  object EmployeeName: TADODataSet
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
      'select *'#13#10'from YDFormulaMaster'#13#10'where RecordState<>'#39#21024#38500#39' and ID=:' +
      'ID'
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
      Size = 40
    end
    object adsMasterDeliver: TStringField
      DisplayLabel = #36865#36135
      FieldName = 'Deliver'
      Size = 40
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
    CommandText = 'select  *  '#13#10'from YDFormulaDetail'#13#10'where MasterID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 50
    Top = 239
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
      DisplayLabel = #25237#20837#26448#26009'ID'
      FieldName = 'GoodsID'
      OnChange = adsDetailGoodsIDChange
    end
    object adsDetailGoodsName: TStringField
      DisplayLabel = #25237#20837#26448#26009#21517#31216
      FieldKind = fkLookup
      FieldName = 'GoodsName'
      LookupDataSet = GoodName
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
      OnChange = adsDetailQuantityChange
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsDetailPackUnitID: TIntegerField
      DisplayLabel = #25237#20837#21333#20301'ID'
      FieldName = 'PackUnitID'
      Visible = False
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
      OnChange = adsDetailQuantityChange
      DisplayFormat = '#,#.000'
      EditFormat = '#.#'
      Precision = 19
    end
    object adsDetailPriceCost: TBCDField
      FieldName = 'PriceCost'
      Precision = 19
      Size = 5
    end
    object adsDetailAmount: TBCDField
      DisplayLabel = #25237#20837#37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailGoodsOutID: TIntegerField
      DisplayLabel = #20135#20986#20135#21697'ID'
      FieldName = 'GoodsOutID'
      OnChange = adsDetailGoodsOutIDChange
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
      Visible = False
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
    object adsDetailSundryFee: TBCDField
      DisplayLabel = #24635#25104#26412
      FieldName = 'SundryFee'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsDetailQuantityPcs: TBCDField
      DisplayLabel = #21333#20301#25104#26412
      FieldName = 'QuantityPcs'
      DisplayFormat = '#,#.00'
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
  object dsGoodName: TDataSource
    DataSet = GoodName
    Left = 132
    Top = 274
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
  object DataSource1: TDataSource
    DataSet = GoodsOut
    Left = 93
    Top = 274
  end
  object FormulaAssembleADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select   b.ID,  a.GoodsID, '#13#10'b.BillMode ['#28165#21333#31867#21035'],b.brief as ['#28165#21333#21517#31216']' +
      ', '#13#10'b.Code as ['#32534#21495'],b.Date ['#26085#26399'],c.name ['#25237#20837#26448#26009'], '#13#10'a.Quantity ['#25237#20837#25968#37327 +
      '],d.name ['#21333#20301'],b.RecordState  ['#28165#21333#29366#24577'] '#13#10'from YDFormulaDetail  a '#13#10 +
      'left outer join  YDFormulaMaster b on b.ID=a.MasterID  '#13#10'left ou' +
      'ter join  DAGoods c  on             c.ID=a.GoodsID '#13#10'left outer ' +
      'join  MSUnit    d   on             d.ID=c.UnitID '#13#10'WHERE b.RECOR' +
      'DSTATE<>'#39#21024#38500#39#13#10'order by a.ID DESC '
    Parameters = <>
    Left = 232
    Top = 428
    object FormulaAssembleADSID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object FormulaAssembleADSGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
    end
    object FormulaAssembleADSDSDesigner: TStringField
      FieldName = #28165#21333#31867#21035
      Size = 16
    end
    object FormulaAssembleADSDSDesigner2: TStringField
      FieldName = #28165#21333#21517#31216
      Size = 30
    end
    object FormulaAssembleADSDSDesigner3: TStringField
      FieldName = #32534#21495
    end
    object FormulaAssembleADSDSDesigner4: TDateTimeField
      FieldName = #26085#26399
    end
    object FormulaAssembleADSDSDesigner5: TStringField
      FieldName = #25237#20837#26448#26009
      Size = 60
    end
    object FormulaAssembleADSDSDesigner6: TBCDField
      FieldName = #25237#20837#25968#37327
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object FormulaAssembleADSDSDesigner7: TStringField
      FieldName = #21333#20301
    end
    object FormulaAssembleADSDSDesigner8: TStringField
      FieldName = #28165#21333#29366#24577
      Size = 12
    end
  end
  object FormulaAssembleDS: TDataSource
    DataSet = FormulaAssembleADS
    Left = 278
    Top = 426
  end
end
