inherited DAMaterialBrowseForm: TDAMaterialBrowseForm
  Left = 41
  Top = 166
  Width = 767
  Height = 364
  Caption = #26448#26009#36164#26009
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
    Left = 172
    Width = 587
    Height = 296
    inherited PageControl: TPageControl
      Top = 271
      Width = 587
      Height = 25
      inherited TabSheet1: TTabSheet
        Caption = #26448#26009#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 587
      Height = 271
      Columns = <
        item
          Expanded = False
          FieldName = #26448#26009#21517#31216
          Title.Alignment = taCenter
          Title.Caption = #26448#26009#21517#31216'/'#22411#21495
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26448#26009#32534#30721
          Title.Alignment = taCenter
          Width = 101
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35268#26684#22411#21495
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26448#26009#26465#30721
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26448#26009#20998#31867
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21442#32771#25104#26412#20215
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21442#32771#20986#24211#20215
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26368#20302#24211#23384
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26368#22823#24211#23384
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36741#21161#21333#20301
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36741#21161#25442#31639#29575
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26631#20934#21333#20301
          Title.Alignment = taCenter
          Width = 120
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
    CursorType = ctStatic
    Filtered = True
    OnFilterRecord = tblDAGoodsFilterRecord
    TableName = 'DAGoodsClass'
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
      'from DAClient'
      'where RecordState<>'#39#21024#38500#39' and ClientType<>'#39#23458#25143#39' and '
      
        'AreaID in (select ID From DAArea where LevelCode like :LevelCode' +
        '1 )')
    Left = 248
    Top = 105
  end
  object tblDAGoods: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select '#13#10'a.ID,a.CreateDate,a.CreateUserID, a.RecordState,'#13#10'Goods' +
      'Pictrue,a.GoodsClassID, a.UnitID,a.AddUnitID ,'#13#10'a.Name ['#26448#26009#21517#31216'], C' +
      'ode ['#26448#26009#32534#30721'],'#13#10'a.Spec ['#35268#26684#22411#21495'],a.BarCode ['#26448#26009#26465#30721'],'#13#10'b.name as ['#26448#26009#20998#31867'] ,' +
      #13#10'a.PricePurchase ['#21442#32771#25104#26412#20215'],a.PriceSales ['#21442#32771#20986#24211#20215'],   '#13#10'a.StockMin [' +
      #26368#20302#24211#23384'], a.StockMax ['#26368#22823#24211#23384'], '#13#10'd.name ['#36741#21161#21333#20301'], a.AddUnitRate ['#36741#21161#25442#31639#29575']' +
      ', '#13#10'c.name ['#26631#20934#21333#20301']'#13#10'from DAGoods a'#13#10'left outer  join  DAGoodsClas' +
      's b on b.ID=a.GoodsClassID'#13#10'left outer  join  MSUnit c on c.ID=a' +
      '.UnitID'#13#10'left outer  join  MSUnit d on d.ID=a.AddUnitID'#13#10'where a' +
      '. RecordState<>'#39#21024#38500#39' '#13#10'and '#13#10'a. GoodsClassID in (select Id from  ' +
      'DAGoodsClass where LevelCode  like :LevelCode1)'
    Parameters = <
      item
        Name = 'LevelCode1'
        Size = -1
        Value = Null
      end>
    Left = 328
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
    object tblDAGoodsGoodsPictrue: TBlobField
      FieldName = 'GoodsPictrue'
      Visible = False
    end
    object tblDAGoodsGoodsClassID: TIntegerField
      FieldName = 'GoodsClassID'
      Visible = False
    end
    object tblDAGoodsUnitID: TIntegerField
      FieldName = 'UnitID'
      Visible = False
    end
    object tblDAGoodsAddUnitID: TIntegerField
      FieldName = 'AddUnitID'
      Visible = False
    end
    object tblDAGoodsDSDesigner: TStringField
      FieldName = #26448#26009#21517#31216
      Size = 60
    end
    object tblDAGoodsDSDesigner2: TStringField
      FieldName = #26448#26009#32534#30721
    end
    object tblDAGoodsDSDesigner3: TStringField
      FieldName = #35268#26684#22411#21495
    end
    object tblDAGoodsDSDesigner4: TStringField
      FieldName = #26448#26009#26465#30721
    end
    object tblDAGoodsDSDesigner5: TStringField
      FieldName = #26448#26009#20998#31867
      Size = 30
    end
    object tblDAGoodsDSDesigner6: TBCDField
      FieldName = #21442#32771#25104#26412#20215
      Precision = 19
    end
    object tblDAGoodsDSDesigner7: TBCDField
      FieldName = #21442#32771#20986#24211#20215
      Precision = 19
    end
    object tblDAGoodsDSDesigner8: TFloatField
      FieldName = #26368#20302#24211#23384
    end
    object tblDAGoodsDSDesigner9: TFloatField
      FieldName = #26368#22823#24211#23384
    end
    object tblDAGoodsDSDesigner10: TStringField
      FieldName = #36741#21161#21333#20301
    end
    object tblDAGoodsDSDesigner11: TFloatField
      FieldName = #36741#21161#25442#31639#29575
    end
    object tblDAGoodsDSDesigner12: TStringField
      FieldName = #26631#20934#21333#20301
    end
  end
end
