inherited SREdJobsForm: TSREdJobsForm
  Left = 199
  Top = 119
  Width = 361
  Height = 269
  Caption = #35745#20214#39033#30446#36164#26009
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 30
    Top = 25
    Width = 48
    Height = 12
    Caption = #39033#30446#31867#21035
  end
  object Label2: TLabel [1]
    Left = 30
    Top = 109
    Width = 48
    Height = 12
    Caption = #22791'    '#27880
  end
  object Label3: TLabel [2]
    Left = 30
    Top = 53
    Width = 48
    Height = 12
    Caption = #35745#20214#21517#31216
  end
  object Label4: TLabel [3]
    Left = 30
    Top = 81
    Width = 48
    Height = 12
    Caption = #35745#20214#21333#20215
  end
  inherited CancelButton: TButton
    Left = 262
    Top = 203
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 182
    Top = 203
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object DBMemo1: TDBMemo
    Left = 94
    Top = 109
    Width = 200
    Height = 71
    DataField = 'Memo'
    DataSource = dsDAEdPOClear
    TabOrder = 3
  end
  object DBEdit2: TDBEdit
    Left = 94
    Top = 49
    Width = 200
    Height = 20
    DataField = 'Name'
    DataSource = dsDAEdPOClear
    TabOrder = 1
  end
  object DBComboBox1: TDBComboBox
    Left = 94
    Top = 21
    Width = 200
    Height = 20
    DataField = 'Brief'
    DataSource = dsDAEdPOClear
    ItemHeight = 12
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 94
    Top = 77
    Width = 200
    Height = 20
    DataField = 'PriceBase'
    DataSource = dsDAEdPOClear
    TabOrder = 2
  end
  object tblDAEdPOClear: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    BeforePost = tblDAEdPOClearBeforePost
    OnFilterRecord = tblDAEdPOClearFilterRecord
    TableName = 'SRJobs'
    Left = 26
    Top = 141
    object tblDAEdPOClearID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblDAEdPOClearCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblDAEdPOClearCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblDAEdPOClearRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblDAEdPOClearBrief: TStringField
      DisplayLabel = #39033#30446#31867#21035
      FieldName = 'Brief'
      Size = 30
    end
    object tblDAEdPOClearName: TStringField
      DisplayLabel = #39033#30446#21517#31216
      FieldName = 'Name'
    end
    object tblDAEdPOClearPriceBase: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PriceBase'
      DisplayFormat = ' #,#0.0000'
      EditFormat = '#.###'
      Precision = 19
      Size = 5
    end
    object tblDAEdPOClearMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 40
    end
  end
  object dsDAEdPOClear: TDataSource
    DataSet = tblDAEdPOClear
    Left = 58
    Top = 141
  end
  object AdsBrief: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select distinct  Brief from SRJobs'#13#10
    Parameters = <>
    Left = 88
    Top = 168
  end
end
