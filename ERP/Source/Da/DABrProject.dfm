inherited DABrProjectForm: TDABrProjectForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #39033#30446#39033#30446
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter [0]
    Left = 166
    Top = 41
    Width = 6
    Height = 512
    Cursor = crHSplit
  end
  inherited ToolBar: TToolBar
    Width = 800
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
    Width = 628
    Height = 512
    inherited PageControl: TPageControl
      Top = 487
      Width = 628
      Height = 25
      inherited TabSheet1: TTabSheet
        Caption = #39033#30446#39033#30446#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 628
      Height = 487
      Columns = <
        item
          Expanded = False
          FieldName = #39033#30446#32534#21495
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39033#30446#21517#31216
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39033#30446#31867#21035
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39033#30446#25551#36848
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39044#31639#37329#39069
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21512#21516#37329#39069
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#21517#31216
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21512#21516#32534#21495
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21512#21516#26465#27454
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39033#30446#22791#27880
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end>
    end
  end
  object TreeView: TTreeView [3]
    Left = 0
    Top = 41
    Width = 166
    Height = 512
    Align = alLeft
    Indent = 19
    PopupMenu = pmTreeEdit
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
    Top = 123
  end
  inherited WsBrowsePop: TPopupMenu
    Left = 80
  end
  object tblGoodClass: TADOTable
    Tag = 233
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = tblDAGoodsFilterRecord
    TableName = 'DAProjectClass'
    Left = 55
    Top = 50
  end
  object dsGoodClass: TDataSource
    DataSet = tblGoodClass
    Left = 140
    Top = 55
  end
  object pmTreeEdit: TPopupMenu
    Left = 115
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
      'from DAProject'
      'where RecordState<>'#39#21024#38500#39' and '
      
        'ProjectClassID in (select ID From DAProjectClass where LevelCode' +
        ' like :LevelCode1 )')
    Left = 248
    Top = 105
  end
  object tblDAGoods: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select a.ID, a.CreateDate, a.CreateUserID,'#13#10'a.RecordState,a.Proj' +
      'ectClassID, '#13#10'a.Code ['#39033#30446#32534#21495'],'#13#10'a.Name ['#39033#30446#21517#31216'],'#13#10'b.name ['#39033#30446#31867#21035'],'#13#10'c.' +
      'name  ['#23458#25143#21517#31216'], '#13#10'a.ProjectBrief ['#39033#30446#25551#36848'], '#13#10'a.StockMin ['#21512#21516#37329#39069'], '#13#10'a.' +
      'StockMax ['#39044#31639#37329#39069'],'#13#10'a.PrjContractNo ['#21512#21516#32534#21495'],'#13#10'a.ContractClause ['#21512#21516#26465 +
      #27454'] ,'#13#10'a.Memo ['#39033#30446#22791#27880']'#13#10'from DAProject a'#13#10'left outer  join  DAProje' +
      'ctClass b on b.ID=a.ProjectClassID'#13#10'left outer  join  DAClient  ' +
      'c on c.ID=a.ClientID'#13#10'where a. RecordState<>'#39#21024#38500#39'  and '#13#10'a. Proje' +
      'ctClassID in '#13#10'(select ID from DAProjectClass where LevelCode  l' +
      'ike :LevelCode1)'
    Parameters = <
      item
        Name = 'LevelCode1'
        Size = -1
        Value = Null
      end>
    Left = 328
    Top = 120
    object tblDAGoodsID: TIntegerField
      FieldName = 'ID'
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
    object tblDAGoodsProjectClassID: TIntegerField
      FieldName = 'ProjectClassID'
      Visible = False
    end
    object tblDAGoodsDSDesigner: TStringField
      FieldName = #39033#30446#21517#31216
      Size = 60
    end
    object tblDAGoodsDSDesigner2: TStringField
      FieldName = #39033#30446#32534#21495
    end
    object tblDAGoodsDSDesigner3: TStringField
      FieldName = #39033#30446#31867#21035
      Size = 30
    end
    object tblDAGoodsDSDesigner4: TStringField
      FieldName = #39033#30446#25551#36848
      Size = 60
    end
    object tblDAGoodsDSDesigner5: TFloatField
      FieldName = #39044#31639#37329#39069
      DisplayFormat = '#,#.00'
      EditFormat = '#.00'
    end
    object tblDAGoodsDSDesigner6: TFloatField
      FieldName = #21512#21516#37329#39069
      DisplayFormat = '#,#.00'
      EditFormat = '#.00'
    end
    object tblDAGoodsDSDesigner8: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 50
    end
    object tblDAGoodsDSDesigner9: TStringField
      FieldName = #21512#21516#32534#21495
      Size = 30
    end
    object tblDAGoodsDSDesigner10: TStringField
      FieldName = #21512#21516#26465#27454
      Size = 1000
    end
    object tblDAGoodsDSDesigner7: TStringField
      FieldName = #39033#30446#22791#27880
      Size = 60
    end
  end
end
