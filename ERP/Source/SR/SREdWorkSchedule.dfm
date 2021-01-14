inherited SREdWorkScheduleForm: TSREdWorkScheduleForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #20316#24687#26102#38388#34920
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
    Width = 800
    Height = 363
    Columns = <
      item
        Expanded = False
        FieldName = 'StartTime'
        Title.Alignment = taCenter
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WtMemo0'
        Title.Alignment = taCenter
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WtMemo1'
        Title.Alignment = taCenter
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'WtMemo2'
        Title.Alignment = taCenter
        Width = 140
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 160
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 800
  end
  inherited TopPanel: TPanel
    Width = 800
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
      Width = 84
      Height = 12
      Caption = #20316#24687#26102#38388#34920#21517#31216
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
      Caption = #21462#24403#26376#22825#25968
      TabOrder = 8
      OnClick = BitBtn2Click
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 510
    Width = 800
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
    Left = 256
    Top = 193
    object SRWKSHClear: TMenuItem
      Caption = #28165#38500#25490#29677
      OnClick = SRWKSHClearClick
    end
    object N110: TMenuItem
      Caption = #36830#32493'1'#22825
      OnClick = N110Click
    end
    object N210: TMenuItem
      Caption = #36830#32493'2'#22825
      OnClick = N210Click
    end
    object N212: TMenuItem
      Caption = #36830#32493'4'#22825
      OnClick = N212Click
    end
    object N211: TMenuItem
      Caption = #36830#32493'3'#22825
      OnClick = N211Click
    end
    object N213: TMenuItem
      Caption = #36830#32493'5'#22825
      OnClick = N213Click
    end
    object N214: TMenuItem
      Caption = #36830#32493'6'#22825
      OnClick = N214Click
    end
    object N215: TMenuItem
      Caption = #36830#32493'7'#22825
      OnClick = N215Click
    end
    object N216: TMenuItem
      Caption = #36830#32493'8'#22825
      OnClick = N216Click
    end
    object N81: TMenuItem
      Caption = #36830#32493'9'#22825
      OnClick = N81Click
    end
    object N82: TMenuItem
      Caption = #36830#32493'10'#22825
      OnClick = N82Click
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
    Left = 280
    Top = 259
  end
  object adsMaster: TADODataSet
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select *'#13#10'from SRWorkScheduleMaster'#13#10'where RecordState<>'#39#21024#38500#39' and' +
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
    CommandText = 'select *'#13#10'from  SRWorkScheduleDetail'#13#10'where MasterID = :ID'
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
    object adsDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
    end
    object adsDetailPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      Visible = False
    end
    object adsDetailGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object adsDetailEndTime: TDateTimeField
      DisplayLabel = #32467#26463#26102#38388
      FieldName = 'EndTime'
      Visible = False
      DisplayFormat = 'hh:mm'
      EditMask = '!90:00;1;_'
    end
    object adsDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
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
    object adsDetailTaxAmount: TBCDField
      FieldName = 'TaxAmount'
      Visible = False
      Precision = 19
    end
    object adsDetailDiscount: TBCDField
      FieldName = 'Discount'
      Visible = False
      Precision = 19
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
    object adsDetailWtMemo2: TStringField
      DisplayLabel = #24037#20316#26102#27573'[C]'
      FieldKind = fkLookup
      FieldName = 'WtMemo2'
      LookupDataSet = Worktime2
      LookupKeyFields = 'ID'
      LookupResultField = 'Memo'
      KeyFields = 'GoalUnitID'
      Lookup = True
    end
    object adsDetailWtMemo1: TStringField
      DisplayLabel = #24037#20316#26102#27573'[B]'
      FieldKind = fkLookup
      FieldName = 'WtMemo1'
      LookupDataSet = Worktime1
      LookupKeyFields = 'ID'
      LookupResultField = 'Memo'
      KeyFields = 'PackUnitID'
      Lookup = True
    end
    object adsDetailWtMemo0: TStringField
      DisplayLabel = #24037#20316#26102#27573'[A]'
      FieldKind = fkLookup
      FieldName = 'WtMemo0'
      LookupDataSet = Worktime0
      LookupKeyFields = 'ID'
      LookupResultField = 'Memo'
      KeyFields = 'GoodsID'
      Lookup = True
    end
    object adsDetailStartTime: TDateTimeField
      DisplayLabel = #20316#24687#26085#26399
      FieldName = 'StartTime'
      DisplayFormat = 'yyyy-mm-dd  dddd'
    end
    object adsDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
  end
  object Worktime1: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select a.ID, b.Memo from SRWorkTimeDetail a'#13#10'left  outer join SR' +
      'WorkTimeMaster b on b.id=A.masterID'#13#10'where b.recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 168
    Top = 259
  end
  object DsWorktime1: TDataSource
    DataSet = Worktime1
    Left = 168
    Top = 290
  end
  object Worktime2: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select a.ID, b.Memo from SRWorkTimeDetail a'#13#10'left  outer join SR' +
      'WorkTimeMaster b on b.id=A.masterID'#13#10'where b.recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 208
    Top = 259
  end
  object DsWorktime2: TDataSource
    DataSet = Worktime2
    Left = 208
    Top = 290
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 344
    Top = 264
  end
  object Worktime0: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select a.ID, b.Memo from SRWorkTimeDetail a'#13#10'left  outer join SR' +
      'WorkTimeMaster b on b.id=A.masterID'#13#10'where b.recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 88
    Top = 259
  end
  object DsWorktime0: TDataSource
    DataSet = Worktime0
    Left = 88
    Top = 298
  end
end
