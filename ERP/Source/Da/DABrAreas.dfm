inherited DAAreasBrowseForm: TDAAreasBrowseForm
  Left = 226
  Top = 117
  Caption = #22320#21306#36164#26009
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
      Action = DeleteAction
    end
    object ToolButton3: TToolButton
      Left = 146
      Top = 2
      Action = EditAction
    end
    object ToolButton5: TToolButton
      Left = 219
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 227
      Top = 2
      Action = RefreshAction
    end
    object ToolButton6: TToolButton
      Left = 300
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 308
      Top = 2
      Action = ExitAction
      ImageIndex = 8
    end
  end
  inherited ActionList: TActionList
    Left = 171
    Top = 67
  end
  inherited DataSource: TDataSource
    DataSet = tblDAAreasBrowse
    Left = 228
    Top = 67
  end
  object tblDAAreasBrowse: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    TableName = 'DAArea'
    Left = 90
    Top = 65
    object tblDAAreasBrowseID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblDAAreasBrowseCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblDAAreasBrowseCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblDAAreasBrowseRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblDAAreasBrowseName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object tblDAAreasBrowseUpID: TIntegerField
      FieldName = 'UpID'
    end
    object tblDAAreasBrowseMemo: TStringField
      FieldName = 'Memo'
      Size = 50
    end
    object tblDAAreasBrowseLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
  end
end
