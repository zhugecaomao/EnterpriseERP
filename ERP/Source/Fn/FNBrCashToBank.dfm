inherited FNCashToBankBrowseForm: TFNCashToBankBrowseForm
  Left = 158
  Top = 181
  Caption = #36164#26009#35843#21160
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = DeleteAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = EditAction
    end
    object ToolButton4: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Hint = #22686#21152
      Caption = #22686#21152
      ImageIndex = 0
      Style = tbsSeparator
      OnClick = AddNewActionExecute
    end
    object ToolButton5: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton9: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton11: TToolButton
      Left = 409
      Top = 2
      Action = RefreshAction
    end
    object ToolButton12: TToolButton
      Left = 464
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #36164#37329#35843#21160
      end
    end
  end
  object adsFNCashToBank: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT FC.*,MP.Name PeriodName,ME.Name EmployeeName FROM FNCashT' +
      'oBank FC LEFT JOIN MSPeriod MP ON FC.PeriodID=MP.ID LEFT JOIN MS' +
      'Employee ME ON FC.EmployeID=ME.id WHERE FC.RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 80
    Top = 112
    object adsFNCashToBankID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsFNCashToBankCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsFNCashToBankCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsFNCashToBankRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsFNCashToBankCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object adsFNCashToBankDate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
    end
    object adsFNCashToBankBrief: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'Brief'
      Size = 40
    end
    object adsFNCashToBankEmployeID: TIntegerField
      FieldName = 'EmployeID'
      Visible = False
    end
    object adsFNCashToBankEmployeeName: TStringField
      DisplayLabel = #21592#24037
      FieldName = 'EmployeeName'
      Size = 30
    end
    object adsFNCashToBankOriginBillID: TIntegerField
      FieldName = 'OriginBillID'
      Visible = False
    end
    object adsFNCashToBankOriginBillTypeID2: TIntegerField
      FieldName = 'OriginBillTypeID'
      Visible = False
    end
    object adsFNCashToBankPeriodID2: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object adsFNCashToBankPeriodName: TStringField
      DisplayLabel = #31649#29702#26399#38388
      FieldName = 'PeriodName'
      FixedChar = True
      Size = 7
    end
    object adsFNCashToBankMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
  end
end
