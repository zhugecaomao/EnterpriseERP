inherited SLCreditEditForm: TSLCreditEditForm
  Left = 220
  Top = 100
  Width = 548
  Height = 527
  Caption = #23458#25143#20449#29992
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 313
    Top = 87
    Width = 48
    Height = 12
    Caption = #29983#25928#26085#26399
  end
  object Label2: TLabel [1]
    Left = 313
    Top = 119
    Width = 48
    Height = 12
    Caption = #32456#27490#26085#26399
  end
  object Label3: TLabel [2]
    Left = 32
    Top = 182
    Width = 72
    Height = 12
    Caption = #20449#29992#25919#31574#25688#35201
  end
  object Label4: TLabel [3]
    Left = 31
    Top = 55
    Width = 48
    Height = 12
    Caption = #23458#25143#21517#31216
  end
  object Label5: TLabel [4]
    Left = 137
    Top = 175
    Width = 60
    Height = 12
    Caption = #31649#29702#26399#38388#65306
    Visible = False
  end
  object Label6: TLabel [5]
    Left = 31
    Top = 24
    Width = 48
    Height = 12
    Caption = #20449#29992#32534#21495
  end
  object Label7: TLabel [6]
    Left = 31
    Top = 87
    Width = 48
    Height = 12
    Caption = #20449#29992#31561#32423
  end
  object Label8: TLabel [7]
    Left = 31
    Top = 119
    Width = 48
    Height = 12
    Caption = #22522#26412#39069#24230
  end
  object Label9: TLabel [8]
    Left = 313
    Top = 151
    Width = 48
    Height = 12
    Caption = #26368#22823#39069#24230
  end
  object Label10: TLabel [9]
    Left = 31
    Top = 151
    Width = 48
    Height = 12
    Caption = #24080#26399#22825#25968
  end
  object Label11: TLabel [10]
    Left = 313
    Top = 24
    Width = 48
    Height = 12
    Caption = #21457#24067#26085#26399
  end
  inherited CancelButton: TButton
    Left = 458
    Top = 467
    TabOrder = 11
  end
  inherited OKButton: TButton
    Left = 378
    Top = 467
    TabOrder = 10
    OnClick = OKButtonClick
  end
  object dbcbClient: TDBLookupComboBox
    Left = 80
    Top = 51
    Width = 290
    Height = 20
    DataField = 'ClientID'
    DataSource = dsCredit
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsClient
    TabOrder = 2
  end
  object edtCode: TDBEdit
    Left = 80
    Top = 20
    Width = 120
    Height = 20
    DataField = 'Code'
    DataSource = dsCredit
    TabOrder = 0
  end
  object edtCreditClass: TDBEdit
    Left = 80
    Top = 83
    Width = 160
    Height = 20
    DataField = 'CreditClass'
    DataSource = dsCredit
    TabOrder = 3
  end
  object edtQuotaAmount: TDBEdit
    Left = 80
    Top = 115
    Width = 120
    Height = 20
    DataField = 'QuotaAmount'
    DataSource = dsCredit
    TabOrder = 5
  end
  object edtDiscountRateMax: TDBEdit
    Left = 369
    Top = 147
    Width = 120
    Height = 20
    DataField = 'QuotaAmountMax'
    DataSource = dsCredit
    TabOrder = 8
  end
  object edtDiscountRateMin: TDBEdit
    Left = 80
    Top = 147
    Width = 120
    Height = 20
    DataField = 'QuotaAmountMin'
    DataSource = dsCredit
    TabOrder = 7
  end
  object dtpStartDate: TDBEdit
    Left = 369
    Top = 83
    Width = 120
    Height = 20
    DataField = 'StartDate'
    DataSource = dsCredit
    TabOrder = 4
  end
  object dtpExpireDate: TDBEdit
    Left = 369
    Top = 115
    Width = 120
    Height = 20
    DataField = 'ExpireDate'
    DataSource = dsCredit
    TabOrder = 6
  end
  object memMeno: TDBMemo
    Left = 63
    Top = 200
    Width = 418
    Height = 225
    DataField = 'Memo'
    DataSource = dsCredit
    TabOrder = 9
  end
  object dbcbPeriod: TDBLookupComboBox
    Left = 192
    Top = 171
    Width = 130
    Height = 20
    DataField = 'PeriodID'
    DataSource = dsCredit
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsPeriod
    TabOrder = 12
    Visible = False
  end
  object DBEdit1: TDBEdit
    Left = 369
    Top = 20
    Width = 120
    Height = 20
    DataField = 'Date'
    DataSource = dsCredit
    TabOrder = 1
  end
  object adrDiscount: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 216
    Top = 232
  end
  object dsClient: TDataSource
    DataSet = CommonData.adsDAClient
    Left = 422
    Top = 209
  end
  object dsPeriod: TDataSource
    DataSet = adsPeriod
    Left = 478
    Top = 209
  end
  object adsPeriod: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select * from MSPeriod where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 357
    Top = 210
    object adsPeriodID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsPeriodCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsPeriodCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsPeriodRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsPeriodName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 7
    end
    object adsPeriodStartDate: TDateTimeField
      FieldName = 'StartDate'
    end
    object adsPeriodCloseDate: TDateTimeField
      FieldName = 'CloseDate'
    end
    object adsPeriodIsClosed: TStringField
      FieldName = 'IsClosed'
      Size = 12
    end
    object adsPeriodLastCloseDate: TDateTimeField
      FieldName = 'LastCloseDate'
    end
    object adsPeriodCheckFlag: TIntegerField
      FieldName = 'CheckFlag'
    end
    object adsPeriodEmployeID: TIntegerField
      FieldName = 'EmployeID'
    end
  end
  object adsCredit: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filter = 'RecordState<>'#39#21024#38500#39
    Filtered = True
    CommandText = 'SLCredit'
    CommandType = cmdTable
    Parameters = <>
    Left = 32
    Top = 232
    object adsCreditID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsCreditCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsCreditCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsCreditRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsCreditClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsCreditDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsCreditCode: TStringField
      FieldName = 'Code'
    end
    object adsCreditCreditClass: TStringField
      FieldName = 'CreditClass'
      Size = 12
    end
    object adsCreditQuotaAmount: TBCDField
      FieldName = 'QuotaAmount'
      DisplayFormat = '#,#.00'
      
      Precision = 19
    end
    object adsCreditQuotaAmountMin: TIntegerField
      FieldName = 'QuotaAmountMin'
    end
    object adsCreditQuotaAmountMax: TBCDField
      FieldName = 'QuotaAmountMax'
      DisplayFormat = '#,#.00'
      
      Precision = 19
    end
    object adsCreditStartDate: TDateTimeField
      FieldName = 'StartDate'
    end
    object adsCreditExpireDate: TDateTimeField
      FieldName = 'ExpireDate'
    end
    object adsCreditPeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
    object adsCreditMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
  end
  object dsCredit: TDataSource
    DataSet = adsCredit
    Left = 64
    Top = 232
  end
end
