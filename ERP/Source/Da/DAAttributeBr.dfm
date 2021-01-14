inherited DAAttributeBrForm: TDAAttributeBrForm
  Left = 223
  Top = 132
  Caption = ' '#23646' '#24615' '#23383' '#20856
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
    object ToolButton3: TToolButton
      Left = 73
      Top = 2
      Action = DeleteAction
    end
    object ToolButton2: TToolButton
      Left = 146
      Top = 2
      Action = EditAction
    end
    object ToolButton5: TToolButton
      Left = 219
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
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
    Left = 301
    Top = 52
  end
  inherited DataSource: TDataSource
    DataSet = tblDAAttributeBr
    Left = 348
    Top = 52
  end
  object tblDAAttributeBr: TADOTable
    Connection = CommonData.acnConnection
    TableName = 'DAAttribute'
    Left = 245
    Top = 50
    object tblDAAttributeBrID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblDAAttributeBrCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblDAAttributeBrCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblDAAttributeBrRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblDAAttributeBrUpid: TIntegerField
      FieldName = 'Upid'
    end
    object tblDAAttributeBrName: TStringField
      FieldName = 'Name'
      Size = 60
    end
    object tblDAAttributeBrMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object tblDAAttributeBrLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
  end
end
