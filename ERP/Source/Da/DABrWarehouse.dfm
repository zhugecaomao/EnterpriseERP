inherited DABrWarehouseForm: TDABrWarehouseForm
  Left = 205
  Top = 123
  Caption = #20179#24211#36164#26009
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    ButtonHeight = 35
    ButtonWidth = 73
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton2: TToolButton
      Left = 73
      Top = 2
      Action = EditAction
    end
    object ToolButton3: TToolButton
      Left = 146
      Top = 2
      Action = DeleteAction
    end
    object ToolButton4: TToolButton
      Left = 219
      Top = 2
      Action = RefreshAction
    end
    object ToolButton5: TToolButton
      Left = 292
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 300
      Top = 2
      Action = ExitAction
    end
  end
  inherited ActionList: TActionList
    Left = 306
    Top = 62
    inherited ExitAction: TAction
      ImageIndex = 8
    end
  end
  inherited DataSource: TDataSource
    DataSet = tblSTBrWarehouse
    Left = 228
    Top = 67
  end
  inherited PopupMenu1: TPopupMenu
    Left = 265
    Top = 65
  end
  object tblSTBrWarehouse: TADOTable
    Connection = CommonData.acnConnection
    TableName = 'STWarehouse'
    Left = 150
    Top = 65
    object tblSTBrWarehouseID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblSTBrWarehouseCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblSTBrWarehouseCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblSTBrWarehouseRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblSTBrWarehouseName: TStringField
      DisplayLabel = #21517#31216
      DisplayWidth = 25
      FieldName = 'Name'
      Size = 30
    end
    object tblSTBrWarehouseCode: TStringField
      DisplayLabel = #20179#24211#32534#21495
      FieldName = 'Code'
    end
    object tblSTBrWarehouseUpid: TIntegerField
      FieldName = 'Upid'
    end
    object tblSTBrWarehouseMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object tblSTBrWarehouseLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
    object tblSTBrWarehouseLeaderID: TIntegerField
      DisplayLabel = #20179#24211#39046#23548'ID'
      FieldName = 'LeaderID'
    end
    object tblSTBrWarehouseAddress: TStringField
      DisplayLabel = #37096#38376#22320#22336
      DisplayWidth = 25
      FieldName = 'Address'
      Size = 60
    end
    object tblSTBrWarehousePhoneFax: TStringField
      DisplayLabel = #30005#35805#20256#30495
      DisplayWidth = 25
      FieldName = 'PhoneFax'
      Size = 60
    end
    object tblSTBrWarehouseEmail: TStringField
      DisplayLabel = #30005#23376#37038#31665
      DisplayWidth = 25
      FieldName = 'Email'
      Size = 60
    end
    object tblSTBrWarehouseWeb: TStringField
      DisplayLabel = #32593#22336
      FieldName = 'Web'
      Size = 60
    end
  end
end
