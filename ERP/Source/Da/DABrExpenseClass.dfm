inherited DABrExpenseClassForm: TDABrExpenseClassForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #36153#29992#20998#31867#36164#26009
  PixelsPerInch = 96
  TextHeight = 12
  inherited TreeView: TTreeView
    Width = 800
    Height = 512
  end
  inherited ToolBar: TToolBar
    Width = 800
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
    Left = 186
    Top = 67
    inherited ExitAction: TAction
      ImageIndex = 8
    end
  end
  inherited DataSource: TDataSource
    DataSet = tblDABrExpenseClass
    Left = 253
    Top = 62
  end
  object tblDABrExpenseClass: TADOTable
    Connection = CommonData.acnConnection
    TableName = 'DAExpenseClass'
    Left = 300
    Top = 95
    object tblDABrExpenseClassID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblDABrExpenseClassCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblDABrExpenseClassCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblDABrExpenseClassRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblDABrExpenseClassUpid: TIntegerField
      DisplayLabel = #19978#32423#31867#21035
      FieldName = 'Upid'
    end
    object tblDABrExpenseClassName: TStringField
      DisplayLabel = #31867#21035#21517#31216
      FieldName = 'Name'
      Size = 60
    end
    object tblDABrExpenseClassMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object tblDABrExpenseClassLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
  end
end
