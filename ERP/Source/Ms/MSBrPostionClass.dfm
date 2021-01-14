inherited MSPostionClassBrowseForm: TMSPostionClassBrowseForm
  Left = 209
  Top = 198
  Caption = #32844#20301#31649#29702
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    ButtonHeight = 35
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
      Caption = #22686#21152'(&N)'
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = EditAction
      Caption = #20462#25913'(&E)'
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = DeleteAction
      Caption = #21024#38500'(&D)'
    end
    object ToolButton5: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = RefreshAction
    end
    object ToolButton6: TToolButton
      Left = 228
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 236
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
    DataSet = tblMSPostioClass
    Left = 143
    Top = 52
  end
  object tblMSPostioClass: TADOTable
    Connection = CommonData.acnConnection
    Filter = 'RecordState<>'#39#21024#38500#39
    Filtered = True
    TableName = 'MSPostionClass'
    Left = 80
    Top = 50
  end
end
