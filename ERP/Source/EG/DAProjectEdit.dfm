inherited DAProjectEditForm: TDAProjectEditForm
  Left = 249
  Top = 111
  Width = 355
  Height = 322
  Caption = #39033#30446#21517#31216
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 23
    Top = 25
    Width = 48
    Height = 12
    Caption = #39033#30446#21517#31216
    FocusControl = DBEdit1
  end
  object Label3: TLabel [1]
    Left = 23
    Top = 64
    Width = 48
    Height = 12
    Caption = #19978#32423#39033#30446
  end
  object Label4: TLabel [2]
    Left = 23
    Top = 142
    Width = 48
    Height = 12
    Caption = #39033#30446#25551#36848
  end
  object Label6: TLabel [3]
    Left = 23
    Top = 103
    Width = 48
    Height = 12
    Caption = #25152#22312#22320#21306
  end
  object Label5: TLabel [4]
    Left = 82
    Top = 83
    Width = 108
    Height = 12
    Caption = '(Ctrl+A'#20026#36873#26681#33410#28857')'
  end
  inherited CancelButton: TButton
    Left = 239
    Top = 255
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 159
    Top = 255
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 79
    Top = 21
    Width = 235
    Height = 20
    DataField = 'Name'
    DataSource = dsSTEdWarehouse
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 79
    Top = 60
    Width = 235
    Height = 20
    DataField = 'Upid'
    DataSource = dsSTEdWarehouse
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DsProjectClass
    NullValueKey = 16449
    TabOrder = 1
  end
  object DBMemo1: TDBMemo
    Left = 79
    Top = 142
    Width = 235
    Height = 89
    DataField = 'Memo'
    DataSource = dsSTEdWarehouse
    TabOrder = 4
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 79
    Top = 99
    Width = 235
    Height = 20
    DataField = 'AreaID'
    DataSource = dsSTEdWarehouse
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DsDAArea
    NullValueKey = 16449
    TabOrder = 5
  end
  object tblSTEdWarehouse: TADOTable
    Connection = CommonData.acnConnection
    AfterInsert = tblSTEdWarehouseAfterInsert
    BeforePost = tblSTEdWarehouseBeforePost
    TableName = 'DAProjectClass'
    Left = 196
    Top = 181
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
      FieldName = 'Name'
      Size = 30
    end
    object tblSTEdWarehouseUpID: TIntegerField
      FieldName = 'UpID'
    end
    object tblSTEdWarehouseLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
    object tblSTEdWarehouseMemo: TStringField
      FieldName = 'Memo'
      Size = 800
    end
    object tblSTEdWarehouseAreaID: TIntegerField
      FieldName = 'AreaID'
    end
  end
  object dsSTEdWarehouse: TDataSource
    DataSet = tblSTEdWarehouse
    Left = 261
    Top = 174
  end
  object QrProjectClass: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <
      item
        Name = 'Code'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from DAProjectClass'
      'where LevelCode not like :Code and RecordState<>'#39#21024#38500#39)
    Left = 28
    Top = 181
  end
  object DsProjectClass: TDataSource
    DataSet = QrProjectClass
    Left = 64
    Top = 181
  end
  object QrDAArea: TADOQuery
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select *'
      'from DAArea'
      'where RecordState<>'#39#21024#38500#39)
    Left = 110
    Top = 185
  end
  object DsDAArea: TDataSource
    DataSet = QrDAArea
    Left = 143
    Top = 185
  end
end
