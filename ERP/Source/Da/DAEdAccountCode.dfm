inherited DAEdAccountCodeForm: TDAEdAccountCodeForm
  Left = 249
  Top = 170
  Width = 357
  Height = 313
  Caption = #32534#36753#20250#35745#31185#30446
  OnClose = FormClose
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
  object Label6: TLabel [5]
    Left = 83
    Top = 167
    Width = 30
    Height = 12
    Caption = #22791#27880':'
  end
  inherited CancelButton: TButton
    Left = 267
    Top = 253
  end
  inherited OKButton: TButton
    Left = 187
    Top = 253
    OnClick = OKButtonClick
  end
  object DBComboBox1: TDBComboBox
    Left = 120
    Top = 73
    Width = 169
    Height = 20
    Style = csDropDownList
    DataField = 'BusinessType'
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
    DataField = 'AccountCode'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 120
    Top = 45
    Width = 169
    Height = 20
    DataField = 'AccountName'
    DataSource = DataSource1
    TabOrder = 4
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
    TabOrder = 5
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
    TabOrder = 6
  end
  object DBMemo1: TDBMemo
    Left = 120
    Top = 167
    Width = 169
    Height = 57
    DataField = 'Memo'
    DataSource = DataSource1
    TabOrder = 7
  end
  object aqrDAAccountCode: TADOQuery
    Connection = CommonData.acnConnection
    BeforePost = aqrDAAccountCodeBeforePost
    Parameters = <>
    SQL.Strings = (
      'select * from DAAccountCode')
    Left = 24
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = aqrDAAccountCode
    Left = 24
    Top = 72
  end
  object dsMSCurrency: TDataSource
    DataSet = CommonData.adsMSCurrency
    Left = 24
    Top = 120
  end
end
