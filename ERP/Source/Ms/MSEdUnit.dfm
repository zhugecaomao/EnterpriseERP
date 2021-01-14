inherited MSEdUnitForm: TMSEdUnitForm
  Left = 192
  Top = 183
  Width = 401
  Height = 132
  Caption = #21333#20301#32534#36753
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 28
    Top = 17
    Width = 24
    Height = 12
    Caption = #21517#31216
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 133
    Top = 17
    Width = 36
    Height = 12
    Caption = #25442#31639#29575
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 248
    Top = 17
    Width = 48
    Height = 12
    Caption = #30446#26631#21333#20301
  end
  object Label4: TLabel [3]
    Left = 115
    Top = 39
    Width = 8
    Height = 16
    Caption = '='
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    ParentFont = False
  end
  inherited CancelButton: TButton
    Left = 311
    Top = 72
    TabOrder = 5
  end
  inherited OKButton: TButton
    Left = 231
    Top = 72
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 28
    Top = 35
    Width = 76
    Height = 20
    DataField = 'Name'
    DataSource = dsMSEdUnt
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 133
    Top = 35
    Width = 93
    Height = 20
    DataField = 'ExchangeRate'
    DataSource = dsMSEdUnt
    TabOrder = 1
  end
  object DBCheckBox1: TDBCheckBox
    Left = 31
    Top = 66
    Width = 75
    Height = 16
    Caption = #26631#20934#21333#20301
    DataField = 'IsGoalUnit'
    DataSource = dsMSEdUnt
    TabOrder = 3
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 240
    Top = 35
    Width = 145
    Height = 20
    Hint = #22914#26524#35774#23450#21333#20301#20026'"'#26631#20934#21333#20301'", '#31995#32479#21017#40664#35748#30446#26631#21333#20301#20026#26412#36523','#25442#31639#29575#20026'"1"'
    DataField = 'GoalUnitID'
    DataSource = dsMSEdUnt
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource1
    NullValueKey = 16449
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object tblMSEdUnt: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    AfterInsert = tblMSEdUntAfterInsert
    BeforePost = tblMSEdUntBeforePost
    AfterPost = tblMSEdUntAfterPost
    TableName = 'MSUnit'
    Left = 95
    Top = 1
    object tblMSEdUntID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblMSEdUntName: TStringField
      FieldName = 'Name'
    end
    object tblMSEdUntGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
    end
    object tblMSEdUntIsGoalUnit: TBooleanField
      FieldName = 'IsGoalUnit'
    end
    object tblMSEdUntExchangeRate: TBCDField
      FieldName = 'ExchangeRate'
      DisplayFormat = '#,#.0000'
      
      Precision = 9
    end
    object tblMSEdUntCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblMSEdUntCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblMSEdUntRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
  end
  object dsMSEdUnt: TDataSource
    DataSet = tblMSEdUnt
    Left = 105
    Top = 75
  end
  object DataSource1: TDataSource
    DataSet = adotable1
    Left = 195
    Top = 75
  end
  object adotable1: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from MSUnit'
      'where RecordState<>'#39#21024#38500#39
      'and IsGoalUnit=1')
    Left = 210
    Top = 5
  end
end
