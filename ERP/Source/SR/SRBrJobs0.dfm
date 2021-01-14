inherited SRBrJobsForm: TSRBrJobsForm
  Left = 118
  Top = 186
  Width = 663
  Height = 442
  Caption = #35745#20214#39033#30446
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 655
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
    object ToolButton10: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton7: TToolButton
      Left = 346
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton11: TToolButton
      Left = 401
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 409
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 464
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 655
    Height = 374
    inherited PageControl: TPageControl
      Top = 347
      Width = 655
      inherited TabSheet1: TTabSheet
        Caption = #35745#20214#39033#30446#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 655
      Height = 347
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Alignment = taCenter
          Width = 58
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Brief'
          Title.Alignment = taCenter
          Width = 156
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Name'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PriceBase'
          Title.Alignment = taCenter
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Memo'
          Title.Alignment = taCenter
          Width = 189
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 541
    Top = 17
  end
  inherited DataSource: TDataSource
    DataSet = tblFNAccountsBr
    Left = 553
    Top = 67
  end
  object tblFNAccountsBr: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    OnFilterRecord = tblFNAccountsBrFilterRecord
    TableName = 'SRJobs'
    Left = 244
    Top = 87
    object tblFNAccountsBrCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblFNAccountsBrCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblFNAccountsBrRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblFNAccountsBrID: TAutoIncField
      DisplayLabel = #24207#21495
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblFNAccountsBrBrief: TStringField
      DisplayLabel = #39033#30446#31867#21035
      FieldName = 'Brief'
      Size = 30
    end
    object tblFNAccountsBrName: TStringField
      DisplayLabel = #39033#30446#21517#31216
      FieldName = 'Name'
    end
    object tblFNAccountsBrPriceBase: TBCDField
      DisplayLabel = #35745#20214#21333#20215
      FieldName = 'PriceBase'
      DisplayFormat = '#,#.0000'
      
      Precision = 19
      Size = 5
    end
    object tblFNAccountsBrMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
end
