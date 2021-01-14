inherited DAProjectBrowseForm: TDAProjectBrowseForm
  Left = 100
  Top = 157
  Caption = #39033#30446#21517#31216#36164#26009
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 41
    Width = 2
    Height = 261
    Cursor = crHSplit
    Align = alRight
  end
  inherited TreeView: TTreeView
    Width = 0
    Height = 261
    OnClick = TreeViewClick
  end
  inherited ToolBar: TToolBar
    Width = 506
    ButtonHeight = 35
    ButtonWidth = 73
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton3: TToolButton
      Left = 73
      Top = 2
      Action = DeleteAction
    end
    object ToolButton2: TToolButton
      Left = 146
      Top = 2
      Action = EditAction
    end
    object ToolButton5: TToolButton
      Left = 219
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 227
      Top = 2
      Hint = #23548#20986
      Caption = #23548#20986'(&E)'
      ImageIndex = 5
      OnClick = ToolButton8Click
    end
    object ToolButton4: TToolButton
      Left = 300
      Top = 2
      Action = RefreshAction
    end
    object ToolButton6: TToolButton
      Left = 373
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 381
      Top = 2
      Action = ExitAction
      ImageIndex = 8
    end
  end
  object DBGrid1: TDBGrid [3]
    Left = 2
    Top = 41
    Width = 504
    Height = 261
    Align = alRight
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
  end
  inherited ActionList: TActionList
    Left = 285
    Top = 84
  end
  inherited DataSource: TDataSource
    DataSet = tblDAAttributeBr
    Left = 212
    Top = 84
  end
  inherited PopupMenu1: TPopupMenu
    Left = 160
    Top = 84
  end
  object tblDAAttributeBr: TADOTable
    Connection = CommonData.acnConnection
    TableName = 'DAProjectClass'
    Left = 93
    Top = 82
    object tblDAAttributeBrID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblDAAttributeBrCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblDAAttributeBrCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblDAAttributeBrRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblDAAttributeBrUpid: TIntegerField
      FieldName = 'Upid'
    end
    object tblDAAttributeBrName: TStringField
      FieldName = 'Name'
      Size = 60
    end
    object tblDAAttributeBrMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object tblDAAttributeBrLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
  end
  object DataSource1: TDataSource
    DataSet = adsMaster
    Left = 136
    Top = 160
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select'#13#10'a.ID,'#13#10'a.name as Name,'#13#10'a.Name ['#39033#30446#21517#31216#21517#31216'],'#13#10'b.name ['#19978#32423#39033#30446'],' +
      #13#10'a.Memo  ['#39033#30446#21517#31216#25551#36848'] ,'#13#10'a.RecordState ['#39033#30446#29366#24577']'#13#10'from DAProjectClass ' +
      'a'#13#10'left outer join DAProjectClass  b on b.Id=a.Upid'#13#10'where '#13#10'a.R' +
      'ecordState<>'#39#21024#38500#39
    IndexFieldNames = 'ID'
    Parameters = <>
    Left = 256
    Top = 212
    object adsMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsMasterName: TStringField
      FieldName = 'Name'
      Visible = False
      Size = 30
    end
    object adsMasterDSDesigner: TStringField
      FieldName = #39033#30446#21517#31216#21517#31216
      Size = 30
    end
    object adsMasterDSDesigner2: TStringField
      FieldName = #19978#32423#39033#30446
      Size = 30
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #39033#30446#21517#31216#25551#36848
      Size = 800
    end
  end
end
