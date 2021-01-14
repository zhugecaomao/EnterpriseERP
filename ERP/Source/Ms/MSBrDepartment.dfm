inherited MSDepartmentBrowseForm: TMSDepartmentBrowseForm
  Left = 227
  Top = 104
  Caption = #37096' '#38376' '#36164' '#26009
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
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 308
      Top = 2
      Action = ExitAction
    end
  end
  inherited ActionList: TActionList
    Left = 196
    Top = 52
    inherited ExitAction: TAction
      ImageIndex = 8
    end
  end
  inherited DataSource: TDataSource
    DataSet = tblMSDBrowse
    Left = 143
    Top = 52
  end
  object tblMSDBrowse: TADOTable [4]
    Connection = CommonData.acnConnection
    TableName = 'MSDepartment'
    Left = 80
    Top = 50
  end
end
