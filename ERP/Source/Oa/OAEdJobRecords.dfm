inherited OAEdJobRecordsForm: TOAEdJobRecordsForm
  Left = 136
  Top = 62
  Width = 628
  Height = 507
  Caption = #24037#20316#26085#24535
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 317
    Top = 24
    Width = 48
    Height = 12
    Caption = #26085'    '#26399
  end
  object Label2: TLabel [1]
    Left = 37
    Top = 24
    Width = 48
    Height = 12
    Caption = #32534'    '#21495
  end
  object Label3: TLabel [2]
    Left = 37
    Top = 46
    Width = 48
    Height = 12
    Caption = #35775#38382#23458#25143
  end
  object Label6: TLabel [3]
    Left = 317
    Top = 46
    Width = 48
    Height = 12
    Caption = #39033#30446#37329#39069
  end
  object Label7: TLabel [4]
    Left = 37
    Top = 69
    Width = 48
    Height = 12
    Caption = #35745#21010#26085#26399
  end
  object Label8: TLabel [5]
    Left = 317
    Top = 69
    Width = 48
    Height = 12
    Caption = #23436#25104#26085#26399
  end
  inherited CancelButton: TButton
    Left = 538
    Top = 447
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 458
    Top = 447
    OnClick = OKButtonClick
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 97
    Width = 550
    Height = 120
    Caption = #24773#20917#35760#24405
    TabOrder = 2
    object DBMemo1: TDBMemo
      Left = 2
      Top = 14
      Width = 546
      Height = 104
      Align = alClient
      DataField = 'RecordAffair'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 224
    Width = 550
    Height = 120
    Caption = #20027#35201#38656#27714'/'#20219#21153
    TabOrder = 3
    object DBMemo2: TDBMemo
      Left = 2
      Top = 14
      Width = 546
      Height = 104
      Align = alClient
      DataField = 'MainDemand'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox3: TGroupBox
    Left = 32
    Top = 347
    Width = 550
    Height = 85
    Caption = #22791#27880
    TabOrder = 4
    object DBMemo3: TDBMemo
      Left = 2
      Top = 14
      Width = 546
      Height = 69
      Align = alClient
      DataField = 'Memo'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object DBEdit1: TDBEdit
    Left = 93
    Top = 20
    Width = 180
    Height = 20
    DataField = 'Code'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 373
    Top = 20
    Width = 180
    Height = 20
    DataField = 'Date'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBComboBox1: TDBComboBox
    Left = 93
    Top = 42
    Width = 180
    Height = 20
    DataField = 'Client'
    DataSource = DataSource1
    ItemHeight = 12
    TabOrder = 7
    OnChange = DBComboBox1Change
  end
  object DBEdit3: TDBEdit
    Left = 93
    Top = 65
    Width = 180
    Height = 20
    DataField = 'PlanDate'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit4: TDBEdit
    Left = 373
    Top = 42
    Width = 180
    Height = 20
    DataField = 'ProjectAmount'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBEdit5: TDBEdit
    Left = 373
    Top = 65
    Width = 180
    Height = 20
    DataField = 'DoneDate'
    DataSource = DataSource1
    TabOrder = 10
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select * from OAJobRecords where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 144
    Top = 128
    object ADODataSet1ID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object ADODataSet1CreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object ADODataSet1CreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object ADODataSet1RecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object ADODataSet1Date: TDateTimeField
      FieldName = 'Date'
    end
    object ADODataSet1Code: TStringField
      FieldName = 'Code'
    end
    object ADODataSet1Client: TStringField
      FieldName = 'Client'
      Size = 60
    end
    object ADODataSet1RecordAffair: TMemoField
      FieldName = 'RecordAffair'
      BlobType = ftMemo
    end
    object ADODataSet1MainDemand: TMemoField
      FieldName = 'MainDemand'
      BlobType = ftMemo
    end
    object ADODataSet1ProjectAmount: TBCDField
      FieldName = 'ProjectAmount'
      DisplayFormat = '#,#.00'
      EditFormat = '#.#'
      Precision = 19
    end
    object ADODataSet1PlanDate: TDateTimeField
      FieldName = 'PlanDate'
    end
    object ADODataSet1DoneDate: TDateTimeField
      FieldName = 'DoneDate'
    end
    object ADODataSet1ClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object ADODataSet1Memo: TMemoField
      FieldName = 'Memo'
      BlobType = ftMemo
    end
    object ADODataSet1PeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 304
    Top = 136
  end
end
