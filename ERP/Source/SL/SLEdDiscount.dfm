inherited SLEdDiscountForm: TSLEdDiscountForm
  Left = -12
  Top = 125
  Width = 808
  Height = 580
  Caption = #38144#21806#25240#25187
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
    Top = 151
    Width = 800
    Height = 359
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        Title.Alignment = taCenter
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Spec'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
        ControlType = ctCustomControl
      end
      item
        Expanded = False
        FieldName = 'goalunit'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 50
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceGoal'
        Title.Alignment = taCenter
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceMax'
        Title.Alignment = taCenter
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceMin'
        Title.Alignment = taCenter
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 230
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 800
  end
  inherited TopPanel: TPanel
    Width = 800
    Height = 122
    inherited RemarkLabel: TLabel
      Left = 10
      Top = 100
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
      Left = 355
      Top = 44
      Width = 48
      Height = 12
      Caption = #29983#25928#26085#26399
    end
    object Label3: TLabel [5]
      Left = 510
      Top = 45
      Width = 48
      Height = 12
      Caption = #22833#25928#26085#26399
    end
    object Label9: TLabel [6]
      Left = 14
      Top = 45
      Width = 48
      Height = 12
      Caption = #25240#25187#31867#21035
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 38
      Top = 96
      Width = 302
      DataField = 'Memo'
      TabOrder = 6
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
      Top = 21
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
      TabOrder = 0
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object BriefComboBox: TDBComboBox
      Left = 12
      Top = 61
      Width = 328
      Height = 20
      DataField = 'ContractClass'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 510
      Top = 64
      Width = 140
      Height = 20
      DataField = 'ExpireDate'
      DataSource = MasterDataSource
      TabOrder = 5
    end
    object DBEdit5: TDBEdit
      Left = 355
      Top = 64
      Width = 140
      Height = 20
      DataField = 'StartDate'
      DataSource = MasterDataSource
      TabOrder = 4
    end
    object GoodsIDSelectBtt: TButton
      Left = 355
      Top = 96
      Width = 82
      Height = 20
      Hint = #25353#27492#38190#21487#20197#35774#32622#26465#20214#65292#25209#37327#25552#21462#21830#21697#21517#31216
      Caption = #25552#21462#21830#21697#21517#31216
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = GoodsIDSelectBttClick
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 510
    Width = 800
    Height = 24
  end
  inherited GoodsLookup: TQLDBLookupComboBox
    Left = 15
    Top = 169
    Width = 229
    VisibleButtons = [lbEdit, lbSetNull]
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
    object SameDiscountAct: TAction
      Caption = #30456#21516#25240#25187#29575
      Hint = #27599#19968#21830#21697#36171#30456#21516#25240#25187#29575#12290
      ImageIndex = 2
      ShortCut = 16451
      OnExecute = SameDiscountActExecute
    end
    object ClearDiscountAct: TAction
      Caption = #28165#38500#25240#25187#29575
      Hint = #28165#38500#24050#36755#20837#30340#25240#25187#29575
      ImageIndex = 12
      ShortCut = 16466
      OnExecute = ClearDiscountActExecute
    end
    object HoldOnDiscountAct: TAction
      Caption = #36830#32493#25240#25187#29575
      Hint = #20197#19979#21830#21697#25240#25187#29575#30456#21516#12290
      ImageIndex = 7
      ShortCut = 16456
      OnExecute = HoldOnDiscountActExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 392
    Top = 1
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 456
    Top = 1
    object SameDiscountAct1: TMenuItem
      Action = SameDiscountAct
    end
    object ClearDiscountAct1: TMenuItem
      Action = ClearDiscountAct
    end
    object N33: TMenuItem
      Action = HoldOnDiscountAct
    end
  end
  object ClientName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from DAClient'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 153
    Top = 38
  end
  object GoodName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAGoods'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 80
    Top = 259
  end
  object PackUnit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 172
    Top = 259
  end
  object dsPackUnit: TDataSource
    DataSet = PackUnit
    Left = 172
    Top = 298
  end
  object DSClientName: TDataSource
    DataSet = ClientName
    Left = 153
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
      'select *'#13#10'from SLSaleDiscountMaster'#13#10'where RecordState<>'#39#21024#38500#39' and' +
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
    end
    object adsMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsMasterRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsMasterDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsMasterCode: TStringField
      FieldName = 'Code'
      Size = 12
    end
    object adsMasterContractClass: TStringField
      FieldName = 'ContractClass'
      Size = 12
    end
    object adsMasterClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object adsMasterStartDate: TDateTimeField
      FieldName = 'StartDate'
    end
    object adsMasterExpireDate: TDateTimeField
      FieldName = 'ExpireDate'
    end
    object adsMasterMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object adsMasterclient: TStringField
      FieldKind = fkLookup
      FieldName = 'client'
      LookupDataSet = ClientName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'ClientID'
      Lookup = True
    end
  end
  object adsDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 'select *'#13#10'from  SLSaleDiscountDetail'#13#10'where MasterID = :ID'
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
    end
    object adsDetailMasterID: TIntegerField
      FieldName = 'MasterID'
    end
    object adsDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      OnChange = adsDetailGoodsIDChange
    end
    object adsDetailPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      OnChange = adsDetailPriceClearChange
    end
    object adsDetailGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
    end
    object adsDetailGoodsName: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'GoodsName'
      LookupDataSet = GoodName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Size = 60
      Lookup = True
    end
    object adsDetailSpec: TStringField
      DisplayLabel = #35268#26684#22411#21495
      FieldName = 'Spec'
    end
    object adsDetailgoalunit: TStringField
      DisplayLabel = #26631#20934#21333#20301
      FieldKind = fkLookup
      FieldName = 'goalunit'
      LookupDataSet = GoalUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoalUnitID'
      Lookup = True
    end
    object adsDetailPriceGoal: TBCDField
      DisplayLabel = #26631#20934#25240#25187#29575
      FieldName = 'PriceGoal'
      DisplayFormat = '#.00%'
      EditFormat = '#.#'
      Precision = 19
    end
    object adsDetailPriceMin: TBCDField
      DisplayLabel = #26368#20302#25240#25187#29575
      FieldName = 'PriceMin'
      DisplayFormat = '#.00%'
      EditFormat = '#.#'
      Precision = 19
    end
    object adsDetailPriceMax: TBCDField
      DisplayLabel = #26368#39640#25240#25187#29575
      FieldName = 'PriceMax'
      DisplayFormat = '#.00%'
      EditFormat = '#.#'
      Precision = 19
    end
    object adsDetailpackunit: TStringField
      DisplayLabel = #21253#35013#21333#20301
      FieldKind = fkLookup
      FieldName = 'packunit'
      LookupDataSet = PackUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsDetailPriceClear: TBCDField
      DisplayLabel = #21253#35013#21806#20215
      FieldName = 'PriceClear'
      OnChange = adsDetailPriceClearChange
      currency = True
      Precision = 19
    end
    object adsDetailQuantity: TBCDField
      DisplayLabel = #26368#20302#25968#37327
      FieldName = 'Quantity'
      DisplayFormat = '#,#.00'
      Precision = 9
      Size = 5
    end
    object adsDetailQuantityE: TBCDField
      DisplayLabel = #26368#39640#25968#37327
      FieldName = 'QuantityE'
      DisplayFormat = '#,#.00'
      Precision = 9
      Size = 5
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
  object adsGoodsSpec: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name  from DAAttribute  '#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 126
    Top = 259
  end
  object dsGoodsSpec: TDataSource
    DataSet = adsGoodsSpec
    Left = 126
    Top = 298
  end
  object GoalUnit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 218
    Top = 259
  end
  object dsGoalUnit: TDataSource
    DataSet = GoalUnit
    Left = 218
    Top = 298
  end
  object PackUintFltAQ: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name, ExchangeRate, GoalUnitID, IsGoalUnit'#13#10'from    M' +
      'SUnit'#13#10'where RecordState<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 309
    Top = 263
  end
  object PackUintFltDS: TDataSource
    DataSet = PackUintFltAQ
    Left = 309
    Top = 298
  end
end
