inherited MSBrCurrencyForm: TMSBrCurrencyForm
  Left = 56
  Top = 133
  Width = 707
  Caption = #24065#31181#36164#26009
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 699
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
    object ToolButton10: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
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
    object ToolButton12: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton11: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
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
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 699
    inherited PageControl: TPageControl
      Width = 699
      inherited TabSheet1: TTabSheet
        Caption = #24065#31181#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 699
    end
  end
  inherited DataSource: TDataSource
    DataSet = adsCurrency
  end
  inherited WsBrowsePop: TPopupMenu
    Left = 96
  end
  object adsCurrency: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select * from MSCurrency where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 152
    Top = 112
    object adsCurrencyID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsCurrencyCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsCurrencyCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsCurrencyRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsCurrencyName: TStringField
      DisplayLabel = #24065#31181#21517#31216
      FieldName = 'Name'
    end
    object adsCurrencyIsLocation: TBooleanField
      DisplayLabel = #26159#21542#26412#20301#24065
      FieldName = 'IsLocation'
      DisplayValues = #26159';'#21542
    end
  end
end
