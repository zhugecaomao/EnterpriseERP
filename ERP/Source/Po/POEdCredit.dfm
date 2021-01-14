inherited POCreditEditForm: TPOCreditEditForm
  Left = 258
  Top = 173
  Height = 295
  Caption = #37319#36141#20449#29992#32534#36753
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 200
    Top = 11
    Width = 60
    Height = 12
    Caption = #26377#25928#26085#26399#65306
  end
  object Label2: TLabel [1]
    Left = 200
    Top = 43
    Width = 60
    Height = 12
    Caption = #29983#25928#26085#26399#65306
  end
  object Label3: TLabel [2]
    Left = 200
    Top = 72
    Width = 36
    Height = 12
    Caption = #25688#35201#65306
  end
  object Label4: TLabel [3]
    Left = 31
    Top = 172
    Width = 36
    Height = 12
    Caption = #23458#25143#65306
  end
  object Label5: TLabel [4]
    Left = 8
    Top = 204
    Width = 60
    Height = 12
    Caption = #31649#29702#26399#38388#65306
  end
  object Label6: TLabel [5]
    Left = 8
    Top = 11
    Width = 60
    Height = 12
    Caption = #12288#12288#32534#21495#65306
  end
  object Label7: TLabel [6]
    Left = 8
    Top = 43
    Width = 60
    Height = 12
    Caption = #20449#29992#31561#32423#65306
  end
  object Label8: TLabel [7]
    Left = 8
    Top = 75
    Width = 60
    Height = 12
    Caption = #20449#29992#39069#24230#65306
  end
  object Label9: TLabel [8]
    Left = 8
    Top = 107
    Width = 60
    Height = 12
    Caption = #26368#22823#39069#24230#65306
  end
  object Label10: TLabel [9]
    Left = 8
    Top = 139
    Width = 60
    Height = 12
    Caption = #26368#23567#39069#24230#65306
  end
  inherited CancelButton: TButton
    Top = 235
    TabOrder = 10
  end
  inherited OKButton: TButton
    Top = 235
    TabOrder = 9
    OnClick = OKButtonClick
  end
  object dbcbClient: TDBLookupComboBox
    Left = 63
    Top = 168
    Width = 130
    Height = 20
    DataField = 'ClientID'
    DataSource = dsPOCredit
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsClient
    TabOrder = 5
  end
  object edtCode: TDBEdit
    Left = 64
    Top = 8
    Width = 129
    Height = 20
    DataField = 'Code'
    DataSource = dsPOCredit
    TabOrder = 0
  end
  object edtCreditClass: TDBEdit
    Left = 64
    Top = 40
    Width = 129
    Height = 20
    DataField = 'CreditClass'
    DataSource = dsPOCredit
    TabOrder = 1
  end
  object edtQuotaAmount: TDBEdit
    Left = 64
    Top = 72
    Width = 129
    Height = 20
    DataField = 'QuotaAmount'
    DataSource = dsPOCredit
    TabOrder = 2
  end
  object edtDiscountRateMax: TDBEdit
    Left = 64
    Top = 104
    Width = 129
    Height = 20
    DataField = 'QuotaAmountMax'
    DataSource = dsPOCredit
    TabOrder = 3
  end
  object edtDiscountRateMin: TDBEdit
    Left = 64
    Top = 136
    Width = 129
    Height = 20
    DataField = 'QuotaAmountMin'
    DataSource = dsPOCredit
    TabOrder = 4
  end
  object dtpStartDate: TDBEdit
    Left = 263
    Top = 8
    Width = 153
    Height = 20
    DataField = 'StartDate'
    DataSource = dsPOCredit
    TabOrder = 6
  end
  object dtpExpireDate: TDBEdit
    Left = 263
    Top = 40
    Width = 153
    Height = 20
    DataField = 'ExpireDate'
    DataSource = dsPOCredit
    TabOrder = 7
  end
  object memMeno: TDBMemo
    Left = 240
    Top = 72
    Width = 177
    Height = 145
    DataField = 'Meno'
    DataSource = dsPOCredit
    TabOrder = 8
  end
  object dbcbPeriod: TDBLookupComboBox
    Left = 63
    Top = 200
    Width = 130
    Height = 20
    DataField = 'PeriodID'
    DataSource = dsPOCredit
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsPeriod
    TabOrder = 11
  end
  object adrDiscount: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 216
    Top = 232
  end
  object dsClient: TDataSource
    DataSet = CommonData.adsDAClient
    Left = 357
    Top = 4
  end
  object dsPeriod: TDataSource
    DataSet = adsPeriod
    Left = 357
    Top = 36
  end
  object adsPeriod: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select * from MSPeriod where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 324
    Top = 37
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
    Filter = 'RecordState<>'#39#21024#38500#39
    Filtered = True
    CommandText = 'POCredit'
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
    object adsPOCreditDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsPOCreditCode: TStringField
      FieldName = 'Code'
    end
    object adsPOCreditClientID: TStringField
      FieldName = 'ClientID'
      Size = 12
    end
    object adsPOCreditCreditClass: TStringField
      FieldName = 'CreditClass'
      Size = 12
    end
    object adsPOCreditQuotaAmount: TBCDField
      FieldName = 'QuotaAmount'
      Precision = 19
    end
    object adsPOCreditQuotaAmountMax: TBCDField
      FieldName = 'QuotaAmountMax'
      Precision = 19
    end
    object adsPOCreditQuotaAmountMin: TBCDField
      FieldName = 'QuotaAmountMin'
      Precision = 19
    end
    object adsPOCreditStartDate: TDateTimeField
      FieldName = 'StartDate'
    end
    object adsPOCreditExpireDate: TDateTimeField
      FieldName = 'ExpireDate'
    end
    object adsPOCreditMeno: TStringField
      FieldName = 'Meno'
      Size = 60
    end
    object adsPOCreditPeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
  end
  object dsPOCredit: TDataSource
    DataSet = adsPOCredit
    Left = 64
    Top = 232
  end
end
