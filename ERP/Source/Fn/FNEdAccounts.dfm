inherited FNEditAccountsForm: TFNEditAccountsForm
  Left = 151
  Top = 152
  Width = 507
  Height = 382
  Caption = #36164#37329#24080#25143#32534#36753
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited CancelButton: TButton
    Left = 401
    Top = 322
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 321
    Top = 322
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object Panel2: TPanel
    Left = 0
    Top = 99
    Width = 499
    Height = 206
    Align = alTop
    BevelOuter = bvLowered
    Color = clScrollBar
    Enabled = False
    TabOrder = 1
    object Label5: TLabel
      Left = 22
      Top = 16
      Width = 48
      Height = 12
      Caption = #24320#25143#26085#26399
      FocusControl = DBEdit5
    end
    object Label6: TLabel
      Left = 251
      Top = 16
      Width = 48
      Height = 12
      Caption = #24320#25143#38134#34892
      FocusControl = DBEdit6
    end
    object Label7: TLabel
      Left = 22
      Top = 47
      Width = 48
      Height = 12
      Caption = #38134#34892#22320#22336
      FocusControl = DBEdit7
    end
    object Label8: TLabel
      Left = 22
      Top = 77
      Width = 48
      Height = 12
      Caption = #38134#34892#24080#21495
      FocusControl = DBEdit8
    end
    object Label9: TLabel
      Left = 22
      Top = 108
      Width = 48
      Height = 12
      Caption = #25903#31080#21360#31456
      FocusControl = DBEdit9
    end
    object Label10: TLabel
      Left = 22
      Top = 138
      Width = 48
      Height = 12
      Caption = #38134#34892#21360#37492
      FocusControl = DBEdit10
    end
    object Label11: TLabel
      Left = 251
      Top = 77
      Width = 48
      Height = 12
      Caption = #38134#34892#25351#32441
      FocusControl = DBImage1
    end
    object Label12: TLabel
      Left = 339
      Top = 177
      Width = 84
      Height = 12
      Caption = '('#21452#20987#20462#25913#22270#29255')'
    end
    object Label14: TLabel
      Left = 22
      Top = 168
      Width = 48
      Height = 12
      Caption = #38134#34892#30005#35805
      FocusControl = DBEdit2
    end
    object DBEdit5: TDBEdit
      Tag = 1
      Left = 82
      Top = 12
      Width = 150
      Height = 20
      DataField = 'BankOpenDate'
      DataSource = dsFNAccountEdit
      ParentColor = True
      TabOrder = 0
    end
    object DBEdit6: TDBEdit
      Tag = 1
      Left = 308
      Top = 12
      Width = 150
      Height = 20
      DataField = 'BankOpened'
      DataSource = dsFNAccountEdit
      ParentColor = True
      TabOrder = 1
    end
    object DBEdit7: TDBEdit
      Tag = 1
      Left = 82
      Top = 43
      Width = 375
      Height = 20
      DataField = 'BankAddress'
      DataSource = dsFNAccountEdit
      ParentColor = True
      TabOrder = 2
    end
    object DBEdit8: TDBEdit
      Tag = 1
      Left = 82
      Top = 73
      Width = 150
      Height = 20
      DataField = 'BankAccount'
      DataSource = dsFNAccountEdit
      ParentColor = True
      TabOrder = 3
    end
    object DBEdit9: TDBEdit
      Tag = 1
      Left = 82
      Top = 104
      Width = 210
      Height = 20
      DataField = 'CheckStamp'
      DataSource = dsFNAccountEdit
      ParentColor = True
      TabOrder = 4
    end
    object DBEdit10: TDBEdit
      Tag = 1
      Left = 82
      Top = 134
      Width = 210
      Height = 20
      DataField = 'BankStamp'
      DataSource = dsFNAccountEdit
      ParentColor = True
      TabOrder = 5
    end
    object DBImage1: TDBImage
      Left = 307
      Top = 78
      Width = 150
      Height = 94
      DataField = 'FingerMark'
      DataSource = dsFNAccountEdit
      ParentColor = True
      Stretch = True
      TabOrder = 6
      OnDblClick = DBImage1DblClick
    end
    object DBEdit2: TDBEdit
      Tag = 1
      Left = 82
      Top = 164
      Width = 210
      Height = 20
      DataField = 'BankPhone'
      DataSource = dsFNAccountEdit
      ParentColor = True
      TabOrder = 7
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 499
    Height = 99
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 22
      Top = 19
      Width = 48
      Height = 12
      Caption = #24080#25143#21517#31216
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 251
      Top = 19
      Width = 48
      Height = 12
      Caption = #24065#31181#21517#31216
    end
    object Label3: TLabel
      Left = 22
      Top = 47
      Width = 48
      Height = 12
      Caption = #24080#25143#31649#29702
    end
    object Label4: TLabel
      Left = 251
      Top = 47
      Width = 48
      Height = 12
      Caption = #24080#25143#31867#22411
    end
    object Label13: TLabel
      Left = 22
      Top = 76
      Width = 48
      Height = 12
      Caption = #23545#24212#31185#30446
    end
    object DBEdit1: TDBEdit
      Left = 82
      Top = 15
      Width = 150
      Height = 20
      DataField = 'Name'
      DataSource = dsFNAccountEdit
      TabOrder = 0
    end
    object DBCAccountType: TDBComboBox
      Left = 308
      Top = 43
      Width = 150
      Height = 20
      Style = csDropDownList
      DataField = 'AccountType'
      DataSource = dsFNAccountEdit
      ItemHeight = 12
      Items.Strings = (
        #29616#37329
        #38134#34892
        #20854#20182#36135#24065
        #19994#20027#36164#37329)
      TabOrder = 1
      OnChange = DBCAccountTypeChange
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 308
      Top = 15
      Width = 151
      Height = 20
      DataField = 'CurrencyID'
      DataSource = dsFNAccountEdit
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = DataSource1
      TabOrder = 2
    end
    object GeneralAccountIDLkup: TQLDBLookupComboBox
      Left = 82
      Top = 72
      Width = 228
      Height = 20
      DataField = 'GeneralACID'
      DataSource = dsFNAccountEdit
      KeyField = 'ID'
      ListField = 'Name;SubCode'
      ListSource = GeneralAcIDds
      TabOrder = 3
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object DBCmbEmployee: TDBComboBox
      Left = 82
      Top = 43
      Width = 150
      Height = 20
      DataField = 'AccountManger'
      DataSource = dsFNAccountEdit
      ItemHeight = 12
      Items.Strings = (
        #29616#37329
        #38134#34892
        #20854#20182#36135#24065
        #19994#20027#36164#37329)
      TabOrder = 4
      OnChange = DBCAccountTypeChange
    end
  end
  object dsFNAccountEdit: TDataSource
    DataSet = tblFNAccountEdit
    Left = 61
    Top = 302
  end
  object tblFNAccountEdit: TADOTable
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    BeforePost = tblFNAccountEditBeforePost
    OnFilterRecord = tblFNAccountEditFilterRecord
    TableName = 'FNAccounts'
    Left = 28
    Top = 302
    object tblFNAccountEditName: TStringField
      DisplayLabel = #24080#25143#21517#31216
      FieldName = 'Name'
      Size = 40
    end
    object tblFNAccountEditCurrencyID: TIntegerField
      DisplayLabel = #24065#31181'ID'
      FieldName = 'CurrencyID'
    end
    object tblFNAccountEditAccountManger: TStringField
      DisplayLabel = #24080#25143#31649#29702#21592
      FieldName = 'AccountManger'
    end
    object tblFNAccountEditAccountType: TStringField
      DisplayLabel = #24080#25143#31867#22411
      FieldName = 'AccountType'
      Size = 12
    end
    object tblFNAccountEditBankOpenDate: TDateTimeField
      DisplayLabel = #24320#25143#26085#26399
      FieldName = 'BankOpenDate'
    end
    object tblFNAccountEditBankOpened: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'BankOpened'
      Size = 60
    end
    object tblFNAccountEditBankAddress: TStringField
      DisplayLabel = #38134#34892#22320#22336
      FieldName = 'BankAddress'
      Size = 60
    end
    object tblFNAccountEditBankAccount: TStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'BankAccount'
    end
    object tblFNAccountEditCheckStamp: TStringField
      DisplayLabel = #25903#31080#21360#31456
      FieldName = 'CheckStamp'
      Size = 60
    end
    object tblFNAccountEditBankPhone: TStringField
      FieldName = 'BankPhone'
      Size = 60
    end
    object tblFNAccountEditBankStamp: TStringField
      DisplayLabel = #38134#34892#21360#37492
      FieldName = 'BankStamp'
      Size = 60
    end
    object tblFNAccountEditFingerMark: TBlobField
      DisplayLabel = #38134#34892#25351#32441
      FieldName = 'FingerMark'
    end
    object tblFNAccountEditRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblFNAccountEditCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblFNAccountEditCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblFNAccountEditID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblFNAccountEditGeneralACID: TIntegerField
      FieldName = 'GeneralACID'
    end
  end
  object OpenPic: TOpenPictureDialog
    Left = 162
    Top = 302
  end
  object TblMsCurrency: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    OnFilterRecord = tblFNAccountEditFilterRecord
    TableName = 'MSCurrency'
    Left = 195
    Top = 302
  end
  object DataSource1: TDataSource
    DataSet = TblMsCurrency
    Left = 229
    Top = 302
  end
  object GeneralAcIDAds: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ID, SubCode,  Name  from DASubject'#13#10'where LEN(SubCode) =4' +
      '  '#13#10'order by SubCode,name '
    Parameters = <>
    Left = 95
    Top = 302
  end
  object GeneralAcIDds: TDataSource
    DataSet = GeneralAcIDAds
    Left = 128
    Top = 303
  end
  object AdsEmployee: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select distinct Name from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39' '#13#10
    Parameters = <>
    Left = 262
    Top = 302
  end
  object DsEmployee: TDataSource
    DataSet = GeneralAcIDAds
    Left = 296
    Top = 302
  end
end
