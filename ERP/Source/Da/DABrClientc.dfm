inherited DAClientcBrowseForm: TDAClientcBrowseForm
  Left = 65
  Top = 222
  VertScrollBar.Range = 0
  AutoScroll = False
  Caption = #21378#21830#20851#31995#31649#29702
  ClientHeight = 465
  ClientWidth = 711
  Position = poScreenCenter
  Visible = False
  WindowState = wsNormal
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 711
    ButtonWidth = 55
    object ToolButton3: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 8
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 63
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 118
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 126
      Top = 2
      Action = ExportAction
    end
    object ToolButton10: TToolButton
      Left = 181
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 189
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton1: TToolButton
      Left = 244
      Top = 2
      Action = CustomizeViewAction
      Caption = #26174#31034#21015
    end
    object ToolButton11: TToolButton
      Left = 299
      Top = 2
      Action = RefreshAction
    end
    object ToolButton14: TToolButton
      Left = 354
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 362
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 711
    Height = 424
    inherited PageControl: TPageControl
      Top = 401
      Width = 711
      Height = 23
      ActivePage = tsDAClient
      OnChanging = PageControlChanging
      object tsDAClient: TTabSheet [0]
        Tag = 8
        Caption = #21378#21830#36164#26009
        ImageIndex = 7
      end
      inherited TabSheet1: TTabSheet
        Tag = 1
        Caption = #21378#21830#32852#31995#35760#24405
      end
      object TabSheet2: TTabSheet
        Tag = 2
        Caption = #37319#36141#35760#24405
        ImageIndex = 1
      end
      object TabSheet3: TTabSheet
        Tag = 3
        Caption = #32467#31639#35760#24405
        ImageIndex = 2
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 711
      Height = 401
      ReadOnly = False
    end
    object pnlDAClient: TPanel
      Left = 0
      Top = 0
      Width = 711
      Height = 401
      Align = alClient
      TabOrder = 2
      object Panel2: TPanel
        Left = 1
        Top = 1
        Width = 709
        Height = 399
        Align = alClient
        BevelInner = bvLowered
        BevelOuter = bvLowered
        Caption = 'Panel2'
        TabOrder = 0
        object PageControl1: TPageControl
          Left = 2
          Top = 2
          Width = 705
          Height = 395
          ActivePage = TabSheet9
          Align = alClient
          TabIndex = 0
          TabOrder = 0
          object TabSheet9: TTabSheet
            Caption = #21378#21830#22522#26412#36164#26009
            object Label1: TLabel
              Left = 10
              Top = 15
              Width = 42
              Height = 12
              Caption = #21517'   '#31216
              FocusControl = DBEdit1
            end
            object Label2: TLabel
              Left = 10
              Top = 41
              Width = 42
              Height = 12
              Caption = #20840'   '#31216
              FocusControl = DBEdit2
            end
            object Label3: TLabel
              Left = 238
              Top = 15
              Width = 42
              Height = 12
              Caption = #31867'   '#22411
            end
            object Label4: TLabel
              Left = 10
              Top = 67
              Width = 48
              Height = 12
              Caption = #32463#33829#33539#22260
            end
            object Label5: TLabel
              Left = 10
              Top = 94
              Width = 42
              Height = 12
              Caption = #30005'   '#35805
              FocusControl = DBEdit5
            end
            object Label6: TLabel
              Left = 10
              Top = 120
              Width = 42
              Height = 12
              Caption = #20256'   '#30495
              FocusControl = DBEdit6
            end
            object Label7: TLabel
              Left = 308
              Top = 94
              Width = 42
              Height = 12
              Caption = #22320'   '#21306
            end
            object Label9: TLabel
              Left = 10
              Top = 226
              Width = 42
              Height = 12
              Caption = #22791'   '#27880
              FocusControl = DBEdit9
            end
            object Label10: TLabel
              Left = 308
              Top = 120
              Width = 42
              Height = 12
              Caption = #37038'   '#32534
              FocusControl = DBEdit3
            end
            object Label11: TLabel
              Left = 10
              Top = 199
              Width = 42
              Height = 12
              Caption = #32593'   '#22336
              FocusControl = DBEdit10
            end
            object Label12: TLabel
              Left = 10
              Top = 173
              Width = 48
              Height = 12
              Caption = #30005#23376#37038#20214
              FocusControl = DBEdit11
            end
            object Label23: TLabel
              Left = 308
              Top = 146
              Width = 42
              Height = 12
              Caption = #22320'   '#22336
            end
            object Label25: TLabel
              Left = 308
              Top = 173
              Width = 36
              Height = 12
              Caption = #21040'  '#31449
            end
            object Label24: TLabel
              Left = 308
              Top = 199
              Width = 36
              Height = 12
              Caption = #19994#21153#21592
              FocusControl = DBEdit9
            end
            object Label8: TLabel
              Left = 10
              Top = 146
              Width = 42
              Height = 12
              Caption = #25163'   '#26426
              FocusControl = DBEdit6
            end
            object DBEdit1: TDBEdit
              Left = 66
              Top = 13
              Width = 151
              Height = 20
              DataField = 'Name'
              DataSource = dsDAClient
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 66
              Top = 37
              Width = 375
              Height = 20
              DataField = 'FullName'
              DataSource = dsDAClient
              TabOrder = 1
            end
            object DBEdit4: TDBEdit
              Left = 66
              Top = 63
              Width = 375
              Height = 20
              DataField = 'RunRange'
              DataSource = dsDAClient
              TabOrder = 2
            end
            object DBEdit5: TDBEdit
              Left = 66
              Top = 90
              Width = 232
              Height = 20
              DataField = 'Telephone'
              DataSource = dsDAClient
              TabOrder = 3
            end
            object DBEdit6: TDBEdit
              Left = 66
              Top = 116
              Width = 232
              Height = 20
              DataField = 'Fax'
              DataSource = dsDAClient
              TabOrder = 4
            end
            object DBEdit9: TDBEdit
              Left = 66
              Top = 223
              Width = 514
              Height = 20
              DataField = 'Memo'
              DataSource = dsDAClient
              TabOrder = 5
            end
            object DBComboBox1: TDBComboBox
              Left = 290
              Top = 13
              Width = 151
              Height = 20
              DataField = 'ClientType'
              DataSource = dsDAClient
              ItemHeight = 12
              Items.Strings = (
                #21378#21830
                #23458#25143#21644#21378#21830)
              TabOrder = 6
            end
            object DBEdit3: TDBEdit
              Left = 356
              Top = 116
              Width = 151
              Height = 20
              DataField = 'PostalCode'
              DataSource = dsDAClient
              TabOrder = 7
            end
            object DBEdit10: TDBEdit
              Left = 66
              Top = 195
              Width = 232
              Height = 20
              DataField = 'Web'
              DataSource = dsDAClient
              TabOrder = 8
            end
            object DBEdit11: TDBEdit
              Left = 66
              Top = 169
              Width = 232
              Height = 20
              DataField = 'EMail'
              DataSource = dsDAClient
              TabOrder = 9
            end
            object DBLookupComboBox1: TDBLookupComboBox
              Left = 356
              Top = 90
              Width = 150
              Height = 20
              DataField = 'AreaID'
              DataSource = dsDAClient
              KeyField = 'ID'
              ListField = 'Name'
              ListSource = DsDAArea
              NullValueKey = 16449
              TabOrder = 10
            end
            object DBEdit7: TDBEdit
              Left = 356
              Top = 142
              Width = 223
              Height = 20
              DataField = 'Address'
              DataSource = dsDAClient
              TabOrder = 11
            end
            object DBEdit22: TDBEdit
              Left = 356
              Top = 169
              Width = 223
              Height = 20
              DataField = 'ToAddress'
              DataSource = dsDAClient
              TabOrder = 12
            end
            object DBEdit8: TDBEdit
              Left = 66
              Top = 142
              Width = 232
              Height = 20
              DataField = 'Mobile'
              DataSource = dsDAClient
              TabOrder = 13
            end
            object EmployeeLKUP: TQLDBLookupComboBox
              Left = 356
              Top = 195
              Width = 145
              Height = 20
              DataField = 'EmlpoyeeID'
              DataSource = dsDAClient
              KeyField = 'ID'
              ListField = 'Name'
              ListSource = DSEmployeeName
              TabOrder = 14
              ButtonHeight = 22
              SearchMode = smLocate
              SearchType = stAuto
            end
          end
          object TabSheet10: TTabSheet
            Caption = #21378#21830#25191#29031#36164#26009
            ImageIndex = 1
            object Label13: TLabel
              Left = 10
              Top = 15
              Width = 48
              Height = 12
              Caption = #27861#23450#20195#34920
              FocusControl = DBEdit12
            end
            object Label14: TLabel
              Left = 235
              Top = 17
              Width = 48
              Height = 12
              Caption = #22269#31246#35777#21495
              FocusControl = DBEdit13
            end
            object Label15: TLabel
              Left = 235
              Top = 50
              Width = 48
              Height = 12
              Caption = #22320#31246#35777#21495
              FocusControl = DBEdit14
            end
            object Label16: TLabel
              Left = 10
              Top = 48
              Width = 48
              Height = 12
              Caption = #27880#20876#26085#26399
              FocusControl = DBEdit15
            end
            object Label17: TLabel
              Left = 10
              Top = 81
              Width = 48
              Height = 12
              Caption = #27880#20876#36164#26412
              FocusControl = DBEdit16
            end
            object Label18: TLabel
              Left = 10
              Top = 115
              Width = 48
              Height = 12
              Caption = #25191#29031#21495#30721
              FocusControl = DBEdit17
            end
            object Label19: TLabel
              Left = 235
              Top = 81
              Width = 48
              Height = 12
              Caption = #20854#23427#35777#20070
            end
            object Label20: TLabel
              Left = 10
              Top = 148
              Width = 48
              Height = 12
              Caption = #20195#30721#35777#21495
              FocusControl = DBEdit19
            end
            object Label21: TLabel
              Left = 10
              Top = 181
              Width = 48
              Height = 12
              Caption = #24320#25143#38134#34892
              FocusControl = DBEdit20
            end
            object Label22: TLabel
              Left = 10
              Top = 215
              Width = 48
              Height = 12
              Caption = #38134#34892#24080#21495
              FocusControl = DBEdit21
            end
            object DBEdit12: TDBEdit
              Left = 67
              Top = 12
              Width = 151
              Height = 20
              DataField = 'BossName'
              DataSource = dsDAClient
              TabOrder = 0
            end
            object DBEdit13: TDBEdit
              Left = 293
              Top = 12
              Width = 151
              Height = 20
              DataField = 'CentralTax'
              DataSource = dsDAClient
              TabOrder = 1
            end
            object DBEdit14: TDBEdit
              Left = 293
              Top = 45
              Width = 151
              Height = 20
              DataField = 'LandTax'
              DataSource = dsDAClient
              TabOrder = 2
            end
            object DBEdit15: TDBEdit
              Left = 67
              Top = 45
              Width = 151
              Height = 20
              DataField = 'RegisterDate'
              DataSource = dsDAClient
              TabOrder = 3
            end
            object DBEdit16: TDBEdit
              Left = 67
              Top = 78
              Width = 151
              Height = 20
              DataField = 'RegisterCapital'
              DataSource = dsDAClient
              TabOrder = 4
            end
            object DBEdit17: TDBEdit
              Left = 67
              Top = 112
              Width = 151
              Height = 20
              DataField = 'Charter'
              DataSource = dsDAClient
              TabOrder = 5
            end
            object DBEdit19: TDBEdit
              Left = 67
              Top = 145
              Width = 151
              Height = 20
              DataField = 'Corporation'
              DataSource = dsDAClient
              TabOrder = 6
            end
            object DBEdit20: TDBEdit
              Left = 67
              Top = 178
              Width = 376
              Height = 20
              DataField = 'BankOpened'
              DataSource = dsDAClient
              TabOrder = 7
            end
            object DBEdit21: TDBEdit
              Left = 67
              Top = 212
              Width = 377
              Height = 20
              DataField = 'BankAccount'
              DataSource = dsDAClient
              TabOrder = 8
            end
            object DBMemo1: TDBMemo
              Left = 293
              Top = 77
              Width = 151
              Height = 89
              DataField = 'Certificates'
              DataSource = dsDAClient
              TabOrder = 9
            end
          end
        end
      end
    end
  end
  inherited ActionList: TActionList
    Left = 496
    Top = 96
    object RolePermissionsAction: TAction
      Caption = #25480#26435
      Hint = #25480#26435
      ImageIndex = 9
    end
  end
  inherited DataSource: TDataSource
    Left = 568
    Top = 144
  end
  object adsOAJobRecords: TADODataSet
    Tag = 1
    Connection = CommonData.acnConnection
    BeforeOpen = adsOAJobRecordsBeforeOpen
    BeforePost = adsOAJobRecordsBeforePost
    AfterPost = adsOAJobRecordsAfterPost
    CommandText = 
      'SELECT OJR.*,MP.Name PeriodName FROM OAJobRecords OJR LEFT JOIN ' +
      'MSPeriod MP ON OJR.PeriodID=MP.ID WHERE OJR.RecordState<>'#39#21024#38500#39' An' +
      'd  OJR.ClientID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 80
    Top = 240
    object adsOAJobRecordsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsOAJobRecordsCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsOAJobRecordsCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsOAJobRecordsRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsOAJobRecordsDate: TDateTimeField
      DisplayLabel = #24037#20316#26085#26399
      FieldName = 'Date'
    end
    object adsOAJobRecordsCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object adsOAJobRecordsClient: TStringField
      FieldName = 'Client'
      Visible = False
      Size = 60
    end
    object adsOAJobRecordsRecordAffair: TMemoField
      DisplayLabel = #24773#20917#35760#24405
      FieldName = 'RecordAffair'
      BlobType = ftMemo
    end
    object adsOAJobRecordsMainDemand: TMemoField
      DisplayLabel = #20027#35201#20219#21153
      FieldName = 'MainDemand'
      BlobType = ftMemo
    end
    object adsOAJobRecordsProjectAmount: TBCDField
      DisplayLabel = #39033#30446#37329#39069
      FieldName = 'ProjectAmount'
      Precision = 19
    end
    object adsOAJobRecordsPlanDate: TDateTimeField
      DisplayLabel = #35745#21010#26085#26399
      FieldName = 'PlanDate'
    end
    object adsOAJobRecordsDoneDate: TDateTimeField
      DisplayLabel = #23436#25104#26085#26399
      FieldName = 'DoneDate'
    end
    object adsOAJobRecordsClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsOAJobRecordsMemo: TMemoField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      BlobType = ftMemo
    end
    object adsOAJobRecordsPeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
    object adsOAJobRecordsPeriodName: TStringField
      DisplayLabel = #31649#29702#26399#38388
      FieldName = 'PeriodName'
      FixedChar = True
      Size = 7
    end
  end
  object adsSaleRecord: TADODataSet
    Tag = 2
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT id,Code,Date,Memo,sum(tot) tot FROM (SELECT SSM.*,(IsNull' +
      '(SSD.Amount,0)+IsNull(SSD.TaxAmount,0)+IsNull(SSD.SundryFee,0)) ' +
      'tot FROM PCPurchaseMaster SSM LEFT JOIN PCPurchaseDetail SSD ON ' +
      'SSM.ID=SSD.MasterID WHERE SSM.RecordState<>'#39#21024#38500#39' AND SSM.ClientID' +
      '=:ID ) T group by id,code,date,memo'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 216
    Top = 240
    object adsSaleRecordid: TIntegerField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object adsSaleRecordCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object adsSaleRecordDate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
    end
    object adsSaleRecordtot: TBCDField
      DisplayLabel = #21512#35745#37329#39069
      FieldName = 'tot'
      ReadOnly = True
      Precision = 32
      Size = 5
    end
    object adsSaleRecordMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 50
    end
  end
  object adsClearBillRecord: TADODataSet
    Tag = 3
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT b.Name  as accounts ,a.* FROM FNClearPCMaster  a'#13#10'left ou' +
      'ter join FNAccounts b on b.Id=A.AccountsID'#13#10'WHERE a.RecordState<' +
      '>'#39#21024#38500#39' AND a.ClientID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 264
    Top = 240
    object adsClearBillRecordID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsClearBillRecordCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsClearBillRecordCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsClearBillRecordRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsClearBillRecordModeDC: TIntegerField
      FieldName = 'ModeDC'
      Visible = False
    end
    object adsClearBillRecordModeC: TIntegerField
      FieldName = 'ModeC'
      Visible = False
    end
    object adsClearBillRecordOriginID: TIntegerField
      FieldName = 'OriginID'
      Visible = False
    end
    object adsClearBillRecordOriginTable: TStringField
      FieldName = 'OriginTable'
      Visible = False
      Size = 30
    end
    object adsClearBillRecordPeriodID: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object adsClearBillRecordClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsClearBillRecordEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Visible = False
    end
    object adsClearBillRecordAccountsID: TIntegerField
      FieldName = 'AccountsID'
      Visible = False
    end
    object adsClearBillRecordAmountBL: TBCDField
      FieldName = 'AmountBL'
      Visible = False
      Precision = 19
    end
    object adsClearBillRecordBillAffix: TBytesField
      FieldName = 'BillAffix'
      Visible = False
      Size = 1
    end
    object adsClearBillRecordDate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
    end
    object adsClearBillRecordCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object adsClearBillRecordBillMode: TStringField
      DisplayLabel = #19994#21153#31867#21035
      FieldName = 'BillMode'
      Size = 16
    end
    object adsClearBillRecordaccounts: TStringField
      DisplayLabel = #24080#25143#21517#31216
      FieldName = 'accounts'
      Size = 40
    end
    object adsClearBillRecordAmountC: TBCDField
      DisplayLabel = #20184#27454#37329#39069
      FieldName = 'AmountC'
      Precision = 19
    end
    object adsClearBillRecordAmountD: TBCDField
      DisplayLabel = #25910#27454#37329#39069
      FieldName = 'AmountD'
      Precision = 19
    end
    object adsClearBillRecordAmountRed: TBCDField
      DisplayLabel = #20914#24080#37329#39069
      FieldName = 'AmountRed'
      Precision = 19
    end
    object adsClearBillRecordMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object adsClearBillRecordClearDate: TDateTimeField
      DisplayLabel = #32467#31639#26085#26399
      FieldName = 'ClearDate'
    end
    object adsClearBillRecordBrief: TStringField
      DisplayLabel = #19994#21153#25688#35201
      FieldName = 'Brief'
      Size = 30
    end
  end
  object adsDAClient: TADODataSet
    Tag = 8
    Connection = CommonData.acnConnection
    BeforePost = adsDAClientBeforePost
    CommandText = 'SELECT * FROM DAClient WHERE ID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 128
    Top = 240
    object adsDAClientID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsDAClientCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      ReadOnly = True
    end
    object adsDAClientCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      ReadOnly = True
    end
    object adsDAClientRecordState: TStringField
      FieldName = 'RecordState'
      ReadOnly = True
      Size = 12
    end
    object adsDAClientName: TStringField
      FieldName = 'Name'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientFullName: TStringField
      FieldName = 'FullName'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientAreaID: TIntegerField
      FieldName = 'AreaID'
      ReadOnly = True
    end
    object adsDAClientAddress: TStringField
      FieldName = 'Address'
      ReadOnly = True
      Size = 60
    end
    object adsDAClientTelephone: TStringField
      FieldName = 'Telephone'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientFax: TStringField
      FieldName = 'Fax'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientRegisterDate: TDateTimeField
      FieldName = 'RegisterDate'
      ReadOnly = True
    end
    object adsDAClientRegisterCapital: TBCDField
      FieldName = 'RegisterCapital'
      ReadOnly = True
      Precision = 19
    end
    object adsDAClientCharter: TStringField
      FieldName = 'Charter'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientBossName: TStringField
      FieldName = 'BossName'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientRunRange: TStringField
      FieldName = 'RunRange'
      ReadOnly = True
      Size = 300
    end
    object adsDAClientCentralTax: TStringField
      FieldName = 'CentralTax'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientLandTax: TStringField
      FieldName = 'LandTax'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientCorporation: TStringField
      FieldName = 'Corporation'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientCertificates: TStringField
      FieldName = 'Certificates'
      ReadOnly = True
      Size = 300
    end
    object adsDAClientBankOpened: TStringField
      FieldName = 'BankOpened'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientClientType: TStringField
      FieldName = 'ClientType'
      ReadOnly = True
      Size = 8
    end
    object adsDAClientBankAccount: TStringField
      FieldName = 'BankAccount'
      ReadOnly = True
      Size = 50
    end
    object adsDAClientMemo: TStringField
      FieldName = 'Memo'
      ReadOnly = True
      Size = 60
    end
    object adsDAClientEMail: TStringField
      FieldName = 'EMail'
      ReadOnly = True
      Size = 30
    end
    object adsDAClientWeb: TStringField
      FieldName = 'Web'
      ReadOnly = True
      Size = 30
    end
    object adsDAClientPostalCode: TStringField
      FieldName = 'PostalCode'
      ReadOnly = True
      Size = 10
    end
    object adsDAClientToAddress: TStringField
      FieldName = 'ToAddress'
      Size = 60
    end
    object adsDAClientMobile: TStringField
      FieldName = 'Mobile'
      Size = 50
    end
    object adsDAClientEmlpoyeeID: TIntegerField
      FieldName = 'EmlpoyeeID'
    end
  end
  object dsDAClient: TDataSource
    Tag = 8
    DataSet = adsDAClient
    Left = 576
    Top = 208
  end
  object tbDAArea: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    TableName = 'DAArea'
    Left = 371
    Top = 136
  end
  object DsDAArea: TDataSource
    DataSet = tbDAArea
    Left = 437
    Top = 133
  end
  object EmployeeName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 429
    Top = 248
  end
  object DSEmployeeName: TDataSource
    DataSet = EmployeeName
    Left = 477
    Top = 249
  end
end
