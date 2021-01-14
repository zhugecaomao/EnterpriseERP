inherited MSPostionBrowseForm: TMSPostionBrowseForm
  Left = 166
  Top = 59
  Height = 453
  Caption = #32844#20301#31649#29702
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter [0]
    Left = 166
    Top = 41
    Width = 5
    Height = 385
    Cursor = crHSplit
  end
  inherited ToolBar: TToolBar
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton3: TToolButton
      Left = 55
      Top = 2
      Action = DeleteAction
    end
    object ToolButton2: TToolButton
      Left = 110
      Top = 2
      Action = EditAction
    end
    object ToolButton6: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton4: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 4
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
    object ToolButton11: TToolButton
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
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Left = 171
    Width = 436
    Height = 385
    inherited PageControl: TPageControl
      Top = 385
      Width = 436
      Height = 0
      ActivePage = nil
      TabIndex = -1
      inherited TabSheet1: TTabSheet
        TabVisible = False
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 436
      Height = 385
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Code'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Memo'
          Visible = True
        end>
    end
  end
  object TreeView: TTreeView [3]
    Left = 0
    Top = 41
    Width = 166
    Height = 385
    Align = alLeft
    Indent = 19
    ReadOnly = True
    TabOrder = 2
    OnChange = TreeViewChange
    OnClick = TreeViewClick
  end
  inherited ActionList: TActionList
    Left = 521
    Top = 57
  end
  inherited DataSource: TDataSource
    DataSet = abtPostion
    Left = 384
    Top = 143
  end
  object atbPostionClass: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filter = 'RecordState<>'#39#21024#38500#39
    Filtered = True
    TableName = 'MSPostionClass'
    Left = 65
    Top = 183
  end
  object dsPostionClass: TDataSource
    DataSet = atbPostionClass
    Left = 100
    Top = 183
  end
  object abtPostion: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    LockType = ltBatchOptimistic
    CommandText = 
      'SELECT * FROM MSPostion WHERE RecordState<>'#39#21024#38500#39#13#10' and PostionCla' +
      'ssID in (select ID from MSPostionClass where LevelCode like '#13#10'(s' +
      'elect LevelCode from MSPostionClass where id =:ID)+'#39'%'#39')'
    DataSource = dsPostionClass
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 349
    Top = 143
    object abtPostionID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object abtPostionCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object abtPostionCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object abtPostionRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object abtPostionName: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'Name'
      Size = 30
    end
    object abtPostionCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object abtPostionMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object abtPostionPostionClassID: TIntegerField
      FieldName = 'PostionClassID'
      Visible = False
    end
  end
end
