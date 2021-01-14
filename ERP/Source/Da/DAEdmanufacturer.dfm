inherited DAEdmanufacturerForm: TDAEdmanufacturerForm
  Left = 104
  Top = 157
  Width = 628
  Height = 401
  Caption = #21378#21830#36164#26009#32534#36753
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited CancelButton: TButton
    Left = 538
    Top = 341
    TabOrder = 1
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 458
    Top = 341
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 620
    Height = 312
    Align = alTop
    BevelInner = bvLowered
    BevelOuter = bvLowered
    Caption = 'Panel1'
    TabOrder = 2
    object PageControl1: TPageControl
      Left = 2
      Top = 2
      Width = 616
      Height = 308
      ActivePage = TabSheet1
      Align = alClient
      TabIndex = 0
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = #22522#26412#36164#26009
        object Label1: TLabel
          Left = 10
          Top = 15
          Width = 42
          Height = 12
          Caption = #21517'   '#31216
          FocusControl = DBEdit1
        end
        object Label3: TLabel
          Left = 315
          Top = 15
          Width = 24
          Height = 12
          Caption = #31867#22411
        end
        object Label4: TLabel
          Left = 10
          Top = 95
          Width = 48
          Height = 12
          Caption = #32463#33829#33539#22260
        end
        object Label5: TLabel
          Left = 10
          Top = 121
          Width = 42
          Height = 12
          Caption = #30005'   '#35805
          FocusControl = DBEdit5
        end
        object Label6: TLabel
          Left = 10
          Top = 148
          Width = 42
          Height = 12
          Caption = #20256'   '#30495
          FocusControl = DBEdit6
        end
        object Label7: TLabel
          Left = 308
          Top = 148
          Width = 42
          Height = 12
          Caption = #22320'   '#21306
        end
        object Label9: TLabel
          Left = 10
          Top = 255
          Width = 42
          Height = 12
          Caption = #22791'   '#27880
          FocusControl = DBEdit9
        end
        object Label10: TLabel
          Left = 308
          Top = 175
          Width = 42
          Height = 12
          Caption = #37038'   '#32534
          FocusControl = DBEdit3
        end
        object Label11: TLabel
          Left = 10
          Top = 228
          Width = 42
          Height = 12
          Caption = #32593'   '#22336
          FocusControl = DBEdit10
        end
        object Label12: TLabel
          Left = 10
          Top = 201
          Width = 48
          Height = 12
          Caption = #30005#23376#37038#20214
          FocusControl = DBEdit11
        end
        object Label23: TLabel
          Left = 308
          Top = 201
          Width = 42
          Height = 12
          Caption = #22320'   '#22336
        end
        object Label25: TLabel
          Left = 308
          Top = 121
          Width = 48
          Height = 12
          Caption = #32463#33829#24615#36136
        end
        object Label24: TLabel
          Left = 308
          Top = 228
          Width = 36
          Height = 12
          Caption = #19994#21153#21592
          FocusControl = DBEdit9
        end
        object Label8: TLabel
          Left = 10
          Top = 175
          Width = 42
          Height = 12
          Caption = #25163'   '#26426
          FocusControl = DBEdit6
        end
        object Label2: TLabel
          Left = 10
          Top = 41
          Width = 48
          Height = 12
          Caption = #36127' '#36131' '#20154
          FocusControl = DBEdit2
        end
        object Label26: TLabel
          Left = 10
          Top = 68
          Width = 48
          Height = 12
          Caption = #32463#33829#35268#27169
          FocusControl = DBEdit2
        end
        object DBEdit1: TDBEdit
          Left = 66
          Top = 13
          Width = 240
          Height = 20
          DataField = 'Name'
          DataSource = dsClientEdit
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 66
          Top = 37
          Width = 375
          Height = 20
          DataField = 'FullName'
          DataSource = dsClientEdit
          TabOrder = 2
        end
        object DBEdit4: TDBEdit
          Left = 66
          Top = 92
          Width = 375
          Height = 20
          DataField = 'RunRange'
          DataSource = dsClientEdit
          TabOrder = 4
        end
        object DBEdit5: TDBEdit
          Left = 66
          Top = 117
          Width = 232
          Height = 20
          DataField = 'Telephone'
          DataSource = dsClientEdit
          TabOrder = 5
        end
        object DBEdit6: TDBEdit
          Left = 66
          Top = 144
          Width = 232
          Height = 20
          DataField = 'Fax'
          DataSource = dsClientEdit
          TabOrder = 7
        end
        object DBEdit9: TDBEdit
          Left = 66
          Top = 252
          Width = 514
          Height = 20
          DataField = 'Memo'
          DataSource = dsClientEdit
          TabOrder = 14
        end
        object DBComboBox1: TDBComboBox
          Left = 344
          Top = 11
          Width = 97
          Height = 20
          DataField = 'ClientType'
          DataSource = dsClientEdit
          ItemHeight = 12
          Items.Strings = (
            #21378#21830
            #23458#25143#21644#21378#21830)
          TabOrder = 1
        end
        object DBEdit3: TDBEdit
          Left = 356
          Top = 171
          Width = 223
          Height = 20
          DataField = 'PostalCode'
          DataSource = dsClientEdit
          TabOrder = 10
        end
        object DBEdit10: TDBEdit
          Left = 66
          Top = 224
          Width = 232
          Height = 20
          DataField = 'Web'
          DataSource = dsClientEdit
          TabOrder = 13
        end
        object DBEdit11: TDBEdit
          Left = 66
          Top = 197
          Width = 232
          Height = 20
          DataField = 'EMail'
          DataSource = dsClientEdit
          TabOrder = 11
        end
        object DBLookupComboBox1: TDBLookupComboBox
          Left = 356
          Top = 144
          Width = 223
          Height = 20
          DataField = 'AreaID'
          DataSource = dsClientEdit
          KeyField = 'ID'
          ListField = 'Name'
          ListSource = DataSource1
          NullValueKey = 16449
          TabOrder = 8
        end
        object DBEdit7: TDBEdit
          Left = 356
          Top = 197
          Width = 223
          Height = 20
          DataField = 'Address'
          DataSource = dsClientEdit
          TabOrder = 12
        end
        object DBEdit22: TDBEdit
          Left = 356
          Top = 117
          Width = 223
          Height = 20
          DataField = 'ToAddress'
          DataSource = dsClientEdit
          TabOrder = 6
        end
        object DBEdit8: TDBEdit
          Left = 66
          Top = 171
          Width = 232
          Height = 20
          DataField = 'Mobile'
          DataSource = dsClientEdit
          TabOrder = 9
        end
        object DBEdit18: TDBEdit
          Left = 66
          Top = 64
          Width = 375
          Height = 20
          DataField = 'RunScope'
          DataSource = dsClientEdit
          TabOrder = 3
        end
        object EmployeeLKUP: TQLDBLookupComboBox
          Left = 356
          Top = 224
          Width = 223
          Height = 20
          DataField = 'EmlpoyeeID'
          DataSource = dsClientEdit
          KeyField = 'ID'
          ListField = 'Name'
          ListSource = DSEmployeeName
          TabOrder = 15
          ButtonHeight = 22
          SearchMode = smLocate
          SearchType = stAuto
          VisibleButtons = [lbSetNull]
        end
      end
      object TabSheet2: TTabSheet
        Caption = #25191#29031#36164#26009
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
        object Label27: TLabel
          Left = 242
          Top = 148
          Width = 48
          Height = 12
          Caption = #23545#24212#31185#30446
        end
        object SpeedButton1: TSpeedButton
          Left = 526
          Top = 146
          Width = 16
          Height = 18
          Hint = #25353#27492#38190#21487#20197#23558#25152#23458#25143#36164#26009#30340#23545#24212#31185#30446#20840#37096#26356#26032#20026#24403#21069#31185#30446
          Caption = '..'
          OnClick = SpeedButton1Click
        end
        object DBEdit12: TDBEdit
          Left = 67
          Top = 12
          Width = 163
          Height = 20
          DataField = 'BossName'
          DataSource = dsClientEdit
          TabOrder = 0
        end
        object DBEdit13: TDBEdit
          Left = 293
          Top = 12
          Width = 223
          Height = 20
          DataField = 'CentralTax'
          DataSource = dsClientEdit
          TabOrder = 1
        end
        object DBEdit14: TDBEdit
          Left = 293
          Top = 45
          Width = 223
          Height = 20
          DataField = 'LandTax'
          DataSource = dsClientEdit
          TabOrder = 3
        end
        object DBEdit15: TDBEdit
          Left = 67
          Top = 45
          Width = 163
          Height = 20
          DataField = 'RegisterDate'
          DataSource = dsClientEdit
          TabOrder = 2
        end
        object DBEdit16: TDBEdit
          Left = 67
          Top = 78
          Width = 163
          Height = 20
          DataField = 'RegisterCapital'
          DataSource = dsClientEdit
          TabOrder = 4
        end
        object DBEdit17: TDBEdit
          Left = 67
          Top = 112
          Width = 163
          Height = 20
          DataField = 'Charter'
          DataSource = dsClientEdit
          TabOrder = 6
        end
        object DBEdit19: TDBEdit
          Left = 67
          Top = 145
          Width = 163
          Height = 20
          DataField = 'Corporation'
          DataSource = dsClientEdit
          TabOrder = 7
        end
        object DBEdit20: TDBEdit
          Left = 67
          Top = 178
          Width = 376
          Height = 20
          DataField = 'BankOpened'
          DataSource = dsClientEdit
          TabOrder = 8
        end
        object DBEdit21: TDBEdit
          Left = 67
          Top = 212
          Width = 377
          Height = 20
          DataField = 'BankAccount'
          DataSource = dsClientEdit
          TabOrder = 9
        end
        object DBMemo1: TDBMemo
          Left = 293
          Top = 77
          Width = 223
          Height = 42
          DataField = 'Certificates'
          DataSource = dsClientEdit
          TabOrder = 5
        end
        object GeneralACIDLkup: TQLDBLookupComboBox
          Left = 300
          Top = 145
          Width = 223
          Height = 20
          DataField = 'GeneralACID'
          DataSource = dsClientEdit
          KeyField = 'ID'
          ListField = 'Name'
          ListSource = GeneralACIDds
          TabOrder = 10
          ButtonHeight = 22
          SearchMode = smLocate
          SearchType = stAuto
          VisibleButtons = [lbSetNull]
        end
      end
    end
  end
  object tblClientEdit: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    BeforePost = tblClientEditBeforePost
    OnFilterRecord = tblClientEditFilterRecord
    TableName = 'DAClient'
    Left = 138
    Top = 3
    object tblClientEditID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblClientEditCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblClientEditCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblClientEditRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblClientEditName: TStringField
      DisplayLabel = #22995'   '#21517
      FieldName = 'Name'
      Size = 50
    end
    object tblClientEditFullName: TStringField
      DisplayLabel = #20840'   '#31216
      FieldName = 'FullName'
      Size = 50
    end
    object tblClientEditAreaID: TIntegerField
      DisplayLabel = #22320'   '#21306
      FieldName = 'AreaID'
    end
    object tblClientEditAddress: TStringField
      DisplayLabel = #22320'   '#22336
      FieldName = 'Address'
      Size = 60
    end
    object tblClientEditTelephone: TStringField
      DisplayLabel = #30005'   '#35805
      FieldName = 'Telephone'
      Size = 50
    end
    object tblClientEditFax: TStringField
      DisplayLabel = #20256'   '#30495
      FieldName = 'Fax'
      Size = 50
    end
    object tblClientEditRegisterDate: TDateTimeField
      DisplayLabel = #27880#20876#26085#26399
      FieldName = 'RegisterDate'
    end
    object tblClientEditRegisterCapital: TBCDField
      DisplayLabel = #27880#20876#36164#26412
      FieldName = 'RegisterCapital'
      Precision = 19
    end
    object tblClientEditCharter: TStringField
      DisplayLabel = #25191#29031#21495#30721
      FieldName = 'Charter'
      Size = 50
    end
    object tblClientEditBossName: TStringField
      DisplayLabel = #27861#23450#20195#34920
      FieldName = 'BossName'
      Size = 50
    end
    object tblClientEditRunRange: TStringField
      DisplayLabel = #32463#33829#33539#22260
      FieldName = 'RunRange'
      Size = 300
    end
    object tblClientEditCentralTax: TStringField
      DisplayLabel = #22269#31246#35777#21495
      FieldName = 'CentralTax'
      Size = 50
    end
    object tblClientEditLandTax: TStringField
      DisplayLabel = #22320#31246#35777#21495
      FieldName = 'LandTax'
      Size = 50
    end
    object tblClientEditCorporation: TStringField
      DisplayLabel = #20195#30721#35777#21495
      FieldName = 'Corporation'
      Size = 50
    end
    object tblClientEditCertificates: TStringField
      DisplayLabel = #20854#23427#35777#20070
      FieldName = 'Certificates'
      Size = 300
    end
    object tblClientEditBankOpened: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'BankOpened'
      Size = 50
    end
    object tblClientEditBankAccount: TStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'BankAccount'
      Size = 50
    end
    object tblClientEditMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object tblClientEditEMail: TStringField
      DisplayLabel = #30005#23376#37038#20214
      FieldName = 'EMail'
      Size = 30
    end
    object tblClientEditWeb: TStringField
      DisplayLabel = #32593'   '#22336
      FieldName = 'Web'
      Size = 30
    end
    object tblClientEditPostalCode: TStringField
      DisplayLabel = #37038'   '#32534
      FieldName = 'PostalCode'
      Size = 10
    end
    object tblClientEditClientType: TStringField
      DisplayLabel = #23458#25143#31867#22411
      FieldName = 'ClientType'
      Size = 16
    end
    object tblClientEditToAddress: TStringField
      FieldName = 'ToAddress'
      Size = 60
    end
    object tblClientEditMobile: TStringField
      FieldName = 'Mobile'
      Size = 50
    end
    object tblClientEditEmlpoyeeID: TIntegerField
      FieldName = 'EmlpoyeeID'
    end
    object tblClientEditGeneralACID: TIntegerField
      FieldName = 'GeneralACID'
    end
    object tblClientEditRunScope: TStringField
      DisplayLabel = #32463#33829#35268#27169
      FieldName = 'RunScope'
      Size = 50
    end
  end
  object dsClientEdit: TDataSource
    DataSet = tblClientEdit
    Left = 205
    Top = 3
  end
  object ADOTable1: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = ADOTable1FilterRecord
    TableName = 'DAArea'
    Left = 299
    Top = 8
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 365
    Top = 13
  end
  object EmployeeName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name'#13#10'from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 485
    Top = 40
  end
  object DSEmployeeName: TDataSource
    DataSet = EmployeeName
    Left = 485
    Top = 73
  end
  object GeneralACIDAds: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ID, SubCode,  Name  from DASubject'#13#10'where LEN(SubCode) =4' +
      '   and'#13#10'name like '#39'%'#24212'%'#39' or'#13#10'name like '#39'%'#20184'%'#39' or '#13#10'name like '#39'%'#24080'%'#39 +
      '  '#13#10'order by SubCode,name '
    Parameters = <>
    Left = 488
    Top = 216
  end
  object GeneralACIDds: TDataSource
    DataSet = GeneralACIDAds
    Left = 528
    Top = 216
  end
end
