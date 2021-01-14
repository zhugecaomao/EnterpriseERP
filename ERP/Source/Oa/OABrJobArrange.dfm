inherited OABrJobArrangeForm: TOABrJobArrangeForm
  Left = 74
  Top = 190
  Width = 712
  Caption = #24037#20316#23433#25490
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 704
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
    object ToolButton14: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton11: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton12: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 704
    inherited PageControl: TPageControl
      Width = 704
      inherited TabSheet1: TTabSheet
        Caption = #24037#20316#23433#25490
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 704
      Columns = <
        item
          Expanded = False
          FieldName = 'Code'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Caption'
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'JobClass'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PlanDate'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'WakeDate'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'WakeHZ'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Client'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end>
    end
  end
  inherited DataSource: TDataSource
    DataSet = ADODataSet1
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select *  from OAJobArrange where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 120
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
    object ADODataSet1About: TMemoField
      DisplayLabel = #24037#20316#20869#23481
      FieldName = 'About'
      Visible = False
      BlobType = ftMemo
    end
    object ADODataSet1Memo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Visible = False
      Size = 60
    end
    object ADODataSet1Code: TStringField
      DisplayLabel = #32534'    '#21495
      FieldName = 'Code'
    end
    object ADODataSet1Date: TDateTimeField
      DisplayLabel = #26085'    '#26399
      FieldName = 'Date'
    end
    object ADODataSet1Caption: TStringField
      DisplayLabel = #20027'    '#39064
      FieldName = 'Caption'
      Size = 60
    end
    object ADODataSet1JobClass: TStringField
      DisplayLabel = #24037#20316#31867#21035
      FieldName = 'JobClass'
      Size = 30
    end
    object ADODataSet1PlanDate: TDateTimeField
      DisplayLabel = #35745#21010#26085#26399
      FieldName = 'PlanDate'
    end
    object ADODataSet1WakeDate: TDateTimeField
      DisplayLabel = #25552#37266#26085#26399
      FieldName = 'WakeDate'
    end
    object ADODataSet1WakeHZ: TIntegerField
      DisplayLabel = #25552#37266#21608#26399
      FieldName = 'WakeHZ'
    end
    object ADODataSet1Client: TStringField
      DisplayLabel = #30456#20851#23458#25143
      FieldName = 'Client'
      Size = 50
    end
  end
end
