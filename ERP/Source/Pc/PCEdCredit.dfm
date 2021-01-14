inherited PCCreditEditForm: TPCCreditEditForm
  Left = 144
  Top = 54
  Width = 548
  Height = 527
  Caption = #37319#36141#20449#29992
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 317
    Top = 87
    Width = 48
    Height = 12
    Caption = #29983#25928#26085#26399
  end
  object Label2: TLabel [1]
    Left = 317
    Top = 119
    Width = 48
    Height = 12
    Caption = #32456#27490#26085#26399
  end
  object Label4: TLabel [2]
    Left = 28
    Top = 55
    Width = 48
    Height = 12
    Caption = #21378#21830#21517#31216
  end
  object Label6: TLabel [3]
    Left = 28
    Top = 24
    Width = 48
    Height = 12
    Caption = #20449#29992#32534#21495
  end
  object Label7: TLabel [4]
    Left = 28
    Top = 87
    Width = 60
    Height = 12
    Caption = #20449#29992#31561#32423#65306
  end
  object Label8: TLabel [5]
    Left = 28
    Top = 119
    Width = 60
    Height = 12
    Caption = #20449#29992#39069#24230#65306
  end
  object Label9: TLabel [6]
    Left = 317
    Top = 151
    Width = 48
    Height = 12
    Caption = #26368#22823#39069#24230
  end
  object Label10: TLabel [7]
    Left = 28
    Top = 151
    Width = 48
    Height = 12
    Caption = #24080#26399#22825#25968
  end
  object Label11: TLabel [8]
    Left = 317
    Top = 24
    Width = 48
    Height = 12
    Caption = #21457#24067#26085#26399
  end
  object Label12: TLabel [9]
    Left = 32
    Top = 182
    Width = 72
    Height = 12
    Caption = #20449#29992#25919#31574#25688#35201
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
    DataSource = dsPOCredit
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
    DataSource = dsPOCredit
    TabOrder = 0
  end
  object edtCreditClass: TDBEdit
    Left = 80
    Top = 83
    Width = 180
    Height = 20
    DataField = 'CreditClass'
    DataSource = dsPOCredit
    TabOrder = 3
  end
  object edtQuotaAmount: TDBEdit
    Left = 80
    Top = 115
    Width = 120
    Height = 20
    DataField = 'QuotaAmount'
    DataSource = dsPOCredit
    TabOrder = 5
  end
  object edtDiscountRateMax: TDBEdit
    Left = 369
    Top = 147
    Width = 120
    Height = 20
    DataField = 'QuotaAmountMax'
    DataSource = dsPOCredit
    TabOrder = 8
  end
  object edtDiscountRateMin: TDBEdit
    Left = 80
    Top = 147
    Width = 120
    Height = 20
    DataField = 'QuotaAmountMin'
    DataSource = dsPOCredit
    TabOrder = 7
  end
  object dtpStartDate: TDBEdit
    Left = 369
    Top = 83
    Width = 120
    Height = 20
    DataField = 'StartDate'
    DataSource = dsPOCredit
    TabOrder = 4
  end
  object dtpExpireDate: TDBEdit
    Left = 369
    Top = 115
    Width = 120
    Height = 20
    DataField = 'ExpireDate'
    DataSource = dsPOCredit
    TabOrder = 6
  end
  object memMeno: TDBMemo
    Left = 63
    Top = 200
    Width = 418
    Height = 225
    DataField = 'Memo'
    DataSource = dsPOCredit
    TabOrder = 9
  end
  object dbcbPeriod: TDBLookupComboBox
    Left = 263
    Top = 168
    Width = 50
    Height = 20
    DataField = 'PeriodID'
    DataSource = dsPOCredit
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
    DataSource = dsPOCredit
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
    Left = 477
    Top = 44
  end
  object dsPeriod: TDataSource
    DataSet = adsPeriod
    Left = 373
    Top = 44
  end
  object adsPeriod: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select * from MSPeriod where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 436
    Top = 45
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
  object adsPOCredit: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filter = 'RecordState<>'#39#21024#38500#39
    Filtered = True
    CommandText = 'PCCredit'
    CommandType = cmdTable
    Parameters = <>
    Left = 32
    Top = 232
    object adsPOCreditID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsPOCreditCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsPOCreditCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsPOCreditRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsPOCreditClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object adsPOCreditDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsPOCreditCode: TStringField
      FieldName = 'Code'
    end
    object adsPOCreditCreditClass: TStringField
      FieldName = 'CreditClass'
      Size = 12
    end
    object adsPOCreditQuotaAmount: TBCDField
      FieldName = 'QuotaAmount'
      DisplayFormat = '#,#.00'
      
      Precision = 19
    end
    object adsPOCreditQuotaAmountMin: TIntegerField
      FieldName = 'QuotaAmountMin'
    end
    object adsPOCreditQuotaAmountMax: TBCDField
      FieldName = 'QuotaAmountMax'
      DisplayFormat = '#,#.00'
      
      Precision = 19
    end
    object adsPOCreditStartDate: TDateTimeField
      FieldName = 'StartDate'
    end
    object adsPOCreditExpireDate: TDateTimeField
      FieldName = 'ExpireDate'
    end
    object adsPOCreditPeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
    object adsPOCreditMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
  end
  object dsPOCredit: TDataSource
    DataSet = adsPOCredit
    Left = 80
    Top = 232
  end
end
