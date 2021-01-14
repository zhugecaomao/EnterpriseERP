inherited DABrPOClearForm: TDABrPOClearForm
  Left = 83
  Top = 124
  Caption = #32467#31639#26041#24335#36164#26009
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
    object ToolButton6: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
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
    object ToolButton7: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton12: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton14: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton10: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton11: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #32467#31639#26041#24335#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Alignment = taCenter
          Width = 262
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Memo'
          Title.Alignment = taCenter
          Width = 379
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 226
    Top = 107
  end
  inherited DataSource: TDataSource
    DataSet = tblDABrPOClear
    Left = 258
    Top = 107
  end
  object tblDABrPOClear: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select * from poClear '#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 160
    Top = 152
    object tblDABrPOClearID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblDABrPOClearCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblDABrPOClearCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblDABrPOClearRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblDABrPOClearBrief: TStringField
      FieldName = 'Brief'
      Visible = False
      Size = 30
    end
    object tblDABrPOClearName: TStringField
      DisplayLabel = #32467#31639#26041#24335
      FieldName = 'Name'
    end
    object tblDABrPOClearMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
end
