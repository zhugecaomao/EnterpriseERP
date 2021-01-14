inherited YDBrBalanceForm: TYDBrBalanceForm
  Left = 140
  Top = 120
  Caption = #29983#20135#26041#26696
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
      Action = EditAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = DeleteAction
    end
    object ToolButton12: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton5: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton11: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton10: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton14: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton8: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #29983#20135#26041#26696
      end
    end
    inherited DBGrid: TQLDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'Code'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date'
          Title.Alignment = taCenter
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Brief'
          Title.Alignment = taCenter
          Width = 131
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PlanID'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Memo'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
  inherited DataSource: TDataSource
    DataSet = tblYDBrBalance
  end
  object tblYDBrBalance: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from YDBalanceOfMaterialMaster'
    Parameters = <>
    Left = 88
    Top = 104
    object tblYDBrBalanceID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblYDBrBalanceCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblYDBrBalanceCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblYDBrBalanceRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblYDBrBalanceCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object tblYDBrBalanceDate: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
      Size = 30
    end
    object tblYDBrBalanceBrief: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'Brief'
      Size = 30
    end
    object tblYDBrBalancePlanID: TIntegerField
      DisplayLabel = #24212#35745#21010'ID'
      FieldName = 'PlanID'
    end
    object tblYDBrBalanceMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
end
