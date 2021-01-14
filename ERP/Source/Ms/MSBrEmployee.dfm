inherited MSBrEmployeeForm: TMSBrEmployeeForm
  Left = 45
  Top = 138
  Width = 767
  Height = 364
  Caption = #21592#24037#36164#26009
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter [0]
    Left = 166
    Top = 41
    Width = 6
    Height = 296
    Cursor = crHSplit
  end
  inherited ToolBar: TToolBar
    Width = 759
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
    object ToolButton9: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 8
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
    object ToolButton8: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton8'
      ImageIndex = 7
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
      Width = 8
      Caption = 'ToolButton7'
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
    Left = 172
    Width = 587
    Height = 296
    inherited PageControl: TPageControl
      Top = 271
      Width = 587
      Height = 25
      inherited TabSheet1: TTabSheet
        Caption = #21592#24037#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 587
      Height = 271
      Columns = <
        item
          Expanded = False
          FieldName = 'Code'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Name'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37096#38376#21517#31216
          Title.Alignment = taCenter
          Width = 139
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PostDate'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Gender'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BarCode'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32844#20301
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end>
    end
  end
  object TreeView: TTreeView [3]
    Left = 0
    Top = 41
    Width = 166
    Height = 296
    Align = alLeft
    Indent = 19
    ReadOnly = True
    TabOrder = 2
    OnChange = TreeViewChange
    OnClick = TreeViewClick
  end
  inherited ActionList: TActionList
    Left = 481
    Top = 47
  end
  inherited DataSource: TDataSource
    DataSet = tblDAGoods
    Left = 410
    Top = 99
  end
  object tblGoodClass: TADOTable
    Tag = 233
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = tblDAGoodsFilterRecord
    TableName = 'MSDepartment'
    Left = 55
    Top = 50
  end
  object dsGoodClass: TDataSource
    DataSet = tblGoodClass
    Left = 140
    Top = 103
  end
  object pmTreeEdit: TPopupMenu
    Left = 75
    Top = 105
    object N1: TMenuItem
      AutoHotkeys = maManual
      Caption = #28155'   '#21152
      OnClick = N1Click
    end
    object N2: TMenuItem
      AutoHotkeys = maManual
      Caption = #20462'   '#25913
      OnClick = N2Click
    end
    object N3: TMenuItem
      AutoHotkeys = maManual
      Caption = #21024'   '#38500
      Hint = #22686#21152
      ImageIndex = 0
      OnClick = N3Click
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object N5: TMenuItem
      AutoHotkeys = maManual
      Caption = #21047'   '#26032
      OnClick = N5Click
    end
  end
  object QryLevelCode: TADOQuery
    Tag = 11
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'LevelCode1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from DAClient'
      'where RecordState<>'#39#21024#38500#39' and ClientType<>'#39#23458#25143#39' and '
      
        'AreaID in (select ID From DAArea where LevelCode like :LevelCode' +
        '1 )')
    Left = 272
    Top = 217
  end
  object tblDAGoods: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select a.*,b.name ['#37096#38376#21517#31216'],d.name ['#32844#21035'],c.name ['#32844#20301']'#13#10'from MSEmploye' +
      'e  a'#13#10'left outer  join   MSDepartment b on b.ID=a.DepartmentID'#13#10 +
      'left outer  join   MSPostion  c on c.ID=a.PostionID'#13#10'left outer ' +
      ' join  MSPostionClass d on d.ID=c.PostionClassID '#13#10'where a. Reco' +
      'rdState<>'#39#21024#38500#39' and '#13#10'a.DepartmentID in (select Id from  MSDepartm' +
      'ent  where LevelCode  like '#13#10' :LevelCode1  )'
    Parameters = <
      item
        Name = 'LevelCode1'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    Left = 320
    Top = 120
    object tblDAGoodsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblDAGoodsCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblDAGoodsCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblDAGoodsRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblDAGoodsDepartmentID: TIntegerField
      FieldName = 'DepartmentID'
      Visible = False
    end
    object tblDAGoodsPositionClassID: TIntegerField
      FieldName = 'PositionClassID'
      Visible = False
    end
    object tblDAGoodsPostionID: TIntegerField
      FieldName = 'PostionID'
      Visible = False
    end
    object tblDAGoodsName: TStringField
      DisplayLabel = #21592#24037#22995#21517
      FieldName = 'Name'
      Size = 30
    end
    object tblDAGoodsCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object tblDAGoodsGender: TStringField
      DisplayLabel = #24615#21035
      FieldName = 'Gender'
      Size = 6
    end
    object tblDAGoodsPostDate: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'PostDate'
      DisplayFormat = 'yyyy-mm-dd'
    end
    object tblDAGoodsBarCode: TStringField
      DisplayLabel = #32771#21220#21345#21495
      FieldName = 'BarCode'
    end
    object tblDAGoodsDSDesigner: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object tblDAGoodsDSDesigner2: TStringField
      FieldName = #32844#21035
      Size = 30
    end
    object tblDAGoodsDSDesigner3: TStringField
      FieldName = #32844#20301
      Size = 30
    end
  end
end
