inherited STBrHouseMoveForm: TSTBrHouseMoveForm
  Left = 87
  Top = 162
  Width = 713
  Caption = #36135#21697#35843#25320
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 705
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
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
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
    Width = 705
    inherited PageControl: TPageControl
      Width = 705
      inherited TabSheet1: TTabSheet
        Caption = #36135#21697#35843#25320
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 705
    end
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT a.ID, a.CreateDate, a.CreateUserID, a.RecordState, a.Date' +
      ','#13#10' a.Code, a.EmployeeID, a.Memo,b.Name '#13#10'FROM STHouseMoveMaster' +
      ' as a left Join MSEmployee as b on a.EmployeeID=b.ID  where a.Re' +
      'cordState<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 88
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
      DisplayLabel = #35843#25320#26085#26399
      FieldName = 'Date'
    end
    object ADODataSet1Code: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object ADODataSet1EmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Visible = False
    end
    object ADODataSet1Name: TStringField
      DisplayLabel = #24320#21333#21592#24037
      FieldName = 'Name'
      Size = 30
    end
    object ADODataSet1Memo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
end
