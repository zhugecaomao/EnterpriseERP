inherited DAEdWarehouseForm: TDAEdWarehouseForm
  Left = 143
  Top = 168
  Width = 640
  Height = 343
  Caption = #20179#24211#36164#26009#32534#36753
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 23
    Top = 35
    Width = 48
    Height = 12
    Caption = #20179#24211#21517#31216
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 318
    Top = 35
    Width = 48
    Height = 12
    Caption = #20179#24211#32534#21495
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 23
    Top = 65
    Width = 48
    Height = 12
    Caption = #19978#32423#20179#24211
  end
  object Label4: TLabel [3]
    Left = 23
    Top = 216
    Width = 42
    Height = 12
    Caption = #22791'   '#27880
    FocusControl = DBEdit4
  end
  object Label6: TLabel [4]
    Left = 318
    Top = 65
    Width = 48
    Height = 12
    Caption = #20179#24211#39046#23548
  end
  object Label7: TLabel [5]
    Left = 23
    Top = 125
    Width = 48
    Height = 12
    Caption = #20179#24211#22320#22336
    FocusControl = DBEdit7
  end
  object Label8: TLabel [6]
    Left = 23
    Top = 155
    Width = 48
    Height = 12
    Caption = #30005#35805#20256#30495
    FocusControl = DBEdit8
  end
  object Label9: TLabel [7]
    Left = 318
    Top = 155
    Width = 48
    Height = 12
    Caption = #30005#23376#37038#31665
    FocusControl = DBEdit9
  end
  object Label10: TLabel [8]
    Left = 23
    Top = 185
    Width = 42
    Height = 12
    Caption = #32593'   '#22336
    FocusControl = DBEdit10
  end
  object Label5: TLabel [9]
    Left = 78
    Top = 88
    Width = 108
    Height = 12
    Caption = '(Ctrl+A'#20026#36873#26681#33410#28857')'
  end
  object Label11: TLabel [10]
    Left = 318
    Top = 95
    Width = 48
    Height = 12
    Caption = #20179#24211#31867#21035
  end
  inherited CancelButton: TButton
    Left = 534
    Top = 283
    TabOrder = 10
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 454
    Top = 283
    TabOrder = 9
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 75
    Top = 31
    Width = 230
    Height = 20
    DataField = 'Name'
    DataSource = dsSTEdWarehouse
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 373
    Top = 31
    Width = 236
    Height = 20
    DataField = 'Code'
    DataSource = dsSTEdWarehouse
    TabOrder = 1
  end
  object DBEdit4: TDBEdit
    Left = 75
    Top = 213
    Width = 534
    Height = 20
    DataField = 'Memo'
    DataSource = dsSTEdWarehouse
    TabOrder = 8
  end
  object DBEdit7: TDBEdit
    Left = 75
    Top = 121
    Width = 534
    Height = 20
    DataField = 'Address'
    DataSource = dsSTEdWarehouse
    TabOrder = 4
  end
  object DBEdit8: TDBEdit
    Left = 75
    Top = 151
    Width = 230
    Height = 20
    DataField = 'PhoneFax'
    DataSource = dsSTEdWarehouse
    TabOrder = 5
  end
  object DBEdit9: TDBEdit
    Left = 373
    Top = 151
    Width = 236
    Height = 20
    DataField = 'Email'
    DataSource = dsSTEdWarehouse
    TabOrder = 6
  end
  object DBEdit10: TDBEdit
    Left = 75
    Top = 181
    Width = 534
    Height = 20
    DataField = 'Web'
    DataSource = dsSTEdWarehouse
    TabOrder = 7
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 75
    Top = 61
    Width = 230
    Height = 20
    DataField = 'Upid'
    DataSource = dsSTEdWarehouse
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource1
    NullValueKey = 16449
    TabOrder = 2
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 373
    Top = 61
    Width = 236
    Height = 20
    DataField = 'LeaderID'
    DataSource = dsSTEdWarehouse
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource2
    NullValueKey = 16449
    TabOrder = 3
  end
  object DBComboBox1: TDBComboBox
    Left = 373
    Top = 91
    Width = 236
    Height = 20
    Style = csDropDownList
    DataField = 'HouseType'
    DataSource = dsSTEdWarehouse
    ItemHeight = 12
    Items.Strings = (
      #33258#26377#20179#24211
      #23492#23384#20179#24211
      #23492#38144#20179#24211)
    TabOrder = 11
  end
  object tblSTEdWarehouse: TADOTable
    Connection = CommonData.acnConnection
    AfterInsert = tblSTEdWarehouseAfterInsert
    BeforePost = tblSTEdWarehouseBeforePost
    TableName = 'STWarehouse'
    Left = 212
    Top = 247
    object tblSTEdWarehouseID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblSTEdWarehouseCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblSTEdWarehouseCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblSTEdWarehouseRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblSTEdWarehouseName: TStringField
      DisplayLabel = #21517#31216
      DisplayWidth = 25
      FieldName = 'Name'
      Size = 30
    end
    object tblSTEdWarehouseCode: TStringField
      DisplayLabel = #20179#24211#32534#21495
      FieldName = 'Code'
    end
    object tblSTEdWarehouseUpid: TIntegerField
      FieldName = 'Upid'
    end
    object tblSTEdWarehouseMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object tblSTEdWarehouseLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
    object tblSTEdWarehouseLeaderID: TIntegerField
      DisplayLabel = #20179#24211#39046#23548'ID'
      FieldName = 'LeaderID'
    end
    object tblSTEdWarehouseAddress: TStringField
      DisplayLabel = #37096#38376#22320#22336
      DisplayWidth = 25
      FieldName = 'Address'
      Size = 60
    end
    object tblSTEdWarehousePhoneFax: TStringField
      DisplayLabel = #30005#35805#20256#30495
      DisplayWidth = 25
      FieldName = 'PhoneFax'
      Size = 60
    end
    object tblSTEdWarehouseEmail: TStringField
      DisplayLabel = #30005#23376#37038#31665
      DisplayWidth = 25
      FieldName = 'Email'
      Size = 60
    end
    object tblSTEdWarehouseWeb: TStringField
      DisplayLabel = #32593#22336
      FieldName = 'Web'
      Size = 60
    end
    object tblSTEdWarehouseHouseType: TStringField
      DisplayLabel = #20179#24211#31867#21035
      FieldName = 'HouseType'
      Size = 30
    end
  end
  object dsSTEdWarehouse: TDataSource
    DataSet = tblSTEdWarehouse
    Left = 173
    Top = 214
  end
  object ADOQuery1: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <
      item
        Name = 'Code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from STWarehouse'
      'where LevelCode not like :Code and RecordState<>'#39#21024#38500#39)
    Left = 44
    Top = 247
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 88
    Top = 247
  end
  object ADOQuery2: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from MSEmployee'
      'where RecordState<>'#39#21024#38500#39)
    Left = 130
    Top = 235
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 167
    Top = 235
  end
end
