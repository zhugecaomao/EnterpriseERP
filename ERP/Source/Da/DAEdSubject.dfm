inherited DAEdSubjectForm: TDAEdSubjectForm
  Left = 255
  Top = 195
  Width = 357
  Height = 313
  Caption = #32534#36753#20250#35745#31185#30446
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 59
    Top = 77
    Width = 54
    Height = 12
    Caption = #31185#30446#31867#21035':'
  end
  object Label2: TLabel [1]
    Left = 59
    Top = 19
    Width = 54
    Height = 12
    Caption = #31185#30446#20195#30721':'
  end
  object Label3: TLabel [2]
    Left = 59
    Top = 49
    Width = 54
    Height = 12
    Caption = #31185#30446#21517#31216':'
  end
  object Label4: TLabel [3]
    Left = 59
    Top = 112
    Width = 54
    Height = 12
    Caption = #24065#31181#21517#31216':'
  end
  object Label5: TLabel [4]
    Left = 59
    Top = 142
    Width = 54
    Height = 12
    Caption = #20313#39069#26041#21521':'
  end
  inherited CancelButton: TButton
    Left = 267
    Top = 253
    TabOrder = 5
  end
  inherited OKButton: TButton
    Left = 187
    Top = 253
    TabOrder = 6
    OnClick = OKButtonClick
  end
  object DBComboBox1: TDBComboBox
    Left = 120
    Top = 73
    Width = 169
    Height = 20
    Style = csDropDownList
    DataSource = DataSource1
    ItemHeight = 12
    Items.Strings = (
      #36164#20135#31867
      #36127#20538#31867
      #26435#30410#31867
      #25439#30410#31867
      #36153#29992#25104#26412#31867
      #34920#22806#31185#30446#31867)
    TabOrder = 2
  end
  object DBEdit1: TDBEdit
    Left = 120
    Top = 15
    Width = 169
    Height = 20
    DataField = 'SubCode'
    DataSource = DataSource1
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 120
    Top = 45
    Width = 169
    Height = 20
    DataField = 'Name'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 120
    Top = 108
    Width = 169
    Height = 20
    DataField = 'CurrencyID'
    DataSource = DataSource1
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsMSCurrency
    TabOrder = 3
  end
  object DBComboBox2: TDBComboBox
    Left = 120
    Top = 138
    Width = 169
    Height = 20
    Style = csDropDownList
    DataField = 'DebitCredit'
    DataSource = DataSource1
    ItemHeight = 12
    Items.Strings = (
      #20511
      #36151)
    TabOrder = 4
  end
  object aqrDASubject: TADOQuery
    Connection = CommonData.acnConnection
    BeforePost = aqrDASubjectBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from DASubject')
    Left = 24
    Top = 24
    object aqrDASubjectID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object aqrDASubjectSubCode: TStringField
      FieldName = 'SubCode'
      Size = 50
    end
    object aqrDASubjectSubTypeID: TIntegerField
      FieldName = 'SubTypeID'
    end
    object aqrDASubjectName: TStringField
      FieldName = 'Name'
      Size = 50
    end
    object aqrDASubjectDebitCredit: TStringField
      FieldName = 'DebitCredit'
      Size = 4
    end
    object aqrDASubjectCurrencyID: TIntegerField
      FieldName = 'CurrencyID'
    end
    object aqrDASubjectRelativeTable: TStringField
      FieldName = 'RelativeTable'
      Size = 50
    end
    object aqrDASubjectRelativeID: TIntegerField
      FieldName = 'RelativeID'
    end
    object aqrDASubjectCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object aqrDASubjectCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object aqrDASubjectRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object aqrDASubjectDetailFlag: TStringField
      FieldName = 'DetailFlag'
      Size = 50
    end
    object aqrDASubjectLocked: TStringField
      FieldName = 'Locked'
      Size = 50
    end
    object aqrDASubjectHSWB: TStringField
      FieldName = 'HSWB'
      Size = 50
    end
    object aqrDASubjectMONEYID: TIntegerField
      FieldName = 'MONEYID'
    end
    object aqrDASubjectEXCHANGE: TStringField
      FieldName = 'EXCHANGE'
      Size = 5
    end
    object aqrDASubjectHSQTY: TStringField
      FieldName = 'HSQTY'
      Size = 5
    end
    object aqrDASubjectUNIT: TStringField
      FieldName = 'UNIT'
      Size = 5
    end
    object aqrDASubjectHSDEPT: TStringField
      FieldName = 'HSDEPT'
      Size = 5
    end
    object aqrDASubjectHSEMP: TStringField
      FieldName = 'HSEMP'
      Size = 5
    end
    object aqrDASubjectHSITEM: TStringField
      FieldName = 'HSITEM'
      Size = 5
    end
    object aqrDASubjectPAYTYPE: TSmallintField
      FieldName = 'PAYTYPE'
    end
    object aqrDASubjectATTRFLAG: TIntegerField
      FieldName = 'ATTRFLAG'
    end
    object aqrDASubjectSPECIALCODE: TIntegerField
      FieldName = 'SPECIALCODE'
    end
    object aqrDASubjectSYSUSE: TStringField
      FieldName = 'SYSUSE'
      Size = 10
    end
    object aqrDASubjectHELPCODE: TStringField
      FieldName = 'HELPCODE'
      Size = 8
    end
    object aqrDASubjectSIGNFLAG: TStringField
      FieldName = 'SIGNFLAG'
      Size = 5
    end
  end
  object DataSource1: TDataSource
    DataSet = aqrDASubject
    Left = 24
    Top = 72
  end
  object dsMSCurrency: TDataSource
    DataSet = CommonData.adsMSCurrency
    Left = 24
    Top = 120
  end
end
