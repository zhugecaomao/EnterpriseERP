inherited OABrJobRecordsMngForm: TOABrJobRecordsMngForm
  Caption = #30693#35782#31649#29702
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    ButtonWidth = 55
    object ToolButton5: TToolButton
      Left = 0
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 55
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 110
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 118
      Top = 2
      Action = ExportAction
    end
    object ToolButton9: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 181
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton1: TToolButton
      Left = 236
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton11: TToolButton
      Left = 291
      Top = 2
      Action = RefreshAction
    end
    object ToolButton12: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 354
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #30693#35782#31649#29702
      end
    end
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select * from OAJobRecords where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 96
    Top = 112
    object ADODataSet1ID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object ADODataSet1CreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object ADODataSet1CreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object ADODataSet1RecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object ADODataSet1Date: TDateTimeField
      DisplayLabel = #24037#20316#26085#26399
      FieldName = 'Date'
    end
    object ADODataSet1Code: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object ADODataSet1Client: TStringField
      DisplayLabel = #35775#38382#23458#25143
      FieldName = 'Client'
      Size = 60
    end
    object ADODataSet1ProjectAmount: TBCDField
      DisplayLabel = #39033#30446#37329#39069
      FieldName = 'ProjectAmount'
      Precision = 19
    end
    object ADODataSet1PeriodID: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object ADODataSet1RecordAffair: TMemoField
      FieldName = 'RecordAffair'
      Visible = False
      BlobType = ftMemo
    end
    object ADODataSet1MainDemand: TMemoField
      FieldName = 'MainDemand'
      Visible = False
      BlobType = ftMemo
    end
    object ADODataSet1Memo: TMemoField
      FieldName = 'Memo'
      Visible = False
      BlobType = ftMemo
    end
    object ADODataSet1DoneDate: TDateTimeField
      DisplayLabel = #23436#25104#26085#26399
      FieldName = 'DoneDate'
    end
    object ADODataSet1PlanDate: TDateTimeField
      DisplayLabel = #35745#21010#26085#26399
      FieldName = 'PlanDate'
    end
    object ADODataSet1ClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
  end
end
