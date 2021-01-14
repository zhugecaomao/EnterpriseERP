inherited MSBrUnitForm: TMSBrUnitForm
  Left = 68
  Top = 7
  Width = 698
  Height = 580
  Caption = #35745#37327#21333#20301#31649#29702
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 690
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
    object ToolButton9: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = PrintAction
    end
    object ToolButton5: TToolButton
      Left = 228
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 283
      Top = 2
      Action = ExportAction
    end
    object ToolButton10: TToolButton
      Left = 338
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 346
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton13: TToolButton
      Left = 401
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton8: TToolButton
      Left = 456
      Top = 2
      Action = RefreshAction
    end
    object ToolButton11: TToolButton
      Left = 511
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 519
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 690
    Height = 512
    inherited PageControl: TPageControl
      Top = 484
      Width = 690
      Height = 28
      inherited TabSheet1: TTabSheet
        Caption = #35745#37327#21333#20301#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 690
      Height = 484
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Alignment = taCenter
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ExchangeRate'
          Title.Alignment = taCenter
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IsGoalUnit'
          Title.Alignment = taCenter
          Title.Caption = #26159#21542#26631#20934#21333#20301
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GoaLName'
          Title.Alignment = taCenter
          Width = 170
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 251
    Top = 96
  end
  inherited DataSource: TDataSource
    DataSet = tblMSBrUnt
    Left = 200
    Top = 127
  end
  object tblMSBrUnt: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select Un.* from MSUnit Un '#13#10'where Un.RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 157
    Top = 127
    object tblMSBrUntID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblMSBrUntName: TStringField
      DisplayLabel = #21333#20301#21517#31216
      FieldName = 'Name'
    end
    object tblMSBrUntExchangeRate: TBCDField
      DisplayLabel = #25442#31639#27604#29575
      FieldName = 'ExchangeRate'
      Precision = 9
    end
    object tblMSBrUntIsGoalUnit: TBooleanField
      DisplayLabel = #20351#29992#21333#20301
      FieldName = 'IsGoalUnit'
      OnGetText = tblMSBrUntIsGoalUnitGetText
    end
    object tblMSBrUntGoaLName: TStringField
      DisplayLabel = #30446#26631#21333#20301
      FieldKind = fkLookup
      FieldName = 'GoaLName'
      LookupDataSet = ADOTable1
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoalUnitID'
      Lookup = True
    end
    object tblMSBrUntGoalUnitID: TIntegerField
      FieldName = 'GoalUnitID'
      Visible = False
    end
    object tblMSBrUntRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblMSBrUntCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblMSBrUntCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
  end
  object ADOTable1: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    TableName = 'MSUnit'
    Left = 317
    Top = 121
  end
end
