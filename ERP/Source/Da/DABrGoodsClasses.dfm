inherited DAGoodsClassesBrowseForm: TDAGoodsClassesBrowseForm
  Left = 216
  Caption = #21830#21697#20998#31867
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
    Left = 261
    Top = 47
  end
  inherited DataSource: TDataSource
    DataSet = tblDAGoodBr
    Left = 388
    Top = 47
  end
  object tblDAGoodBr: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    TableName = 'DAGoodsClass'
    Left = 320
    Top = 45
  end
end
