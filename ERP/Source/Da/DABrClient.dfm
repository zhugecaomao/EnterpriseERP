inherited DAClientBrowseForm: TDAClientBrowseForm
  Left = 107
  Top = 34
  Width = 608
  Height = 407
  Hint = '----'
  Caption = #23458#25143#36164#26009
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter [0]
    Left = 166
    Top = 41
    Width = 5
    Height = 339
    Cursor = crHSplit
  end
  inherited ToolBar: TToolBar
    Width = 600
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
    object ToolButton11: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton10: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
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
    Left = 171
    Width = 429
    Height = 339
    inherited PageControl: TPageControl
      Top = 310
      Width = 429
      Height = 29
      inherited TabSheet1: TTabSheet
        Caption = #23458#25143#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 429
      Height = 310
      Hint = '--'
      Columns = <
        item
          Expanded = False
          FieldName = #23458#25143#21517#31216
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36127#36131#20154
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #30005#35805
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25163#26426
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20256#30495
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#21592
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22320#22336
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37038#25919#32534#30721
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22320#21306#21517#31216
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#33829#24615#36136
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#33829#35268#27169
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22269#31246#35777#21495
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#33829#33539#22260
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27861#20154#20195#34920
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25191#29031#21495#30721
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27880#20876#36164#26412
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27880#20876#26085#26399
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22320#31246#35777#21495
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20195#30721#35777#21495
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35777#20070#21495#30721
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24320#25143#38134#34892
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#31867#22411
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #38134#34892#24080#21495
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #30005#23376#37038#31665
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32593#22336
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
    Height = 339
    Align = alLeft
    Indent = 19
    ReadOnly = True
    TabOrder = 2
    OnClick = TreeViewClick
  end
  inherited ActionList: TActionList
    Left = 261
    Top = 72
  end
  inherited DataSource: TDataSource
    DataSet = tblClientBr
    Left = 396
    Top = 139
  end
  object tblAreaTree: TADOTable
    Tag = 222
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = tblAreaTreeFilterRecord
    TableName = 'DAArea'
    Left = 30
    Top = 82
  end
  object dsAreaTree: TDataSource
    DataSet = tblAreaTree
    Left = 135
    Top = 55
  end
  object pmTreeEdit: TPopupMenu
    AutoHotkeys = maManual
    Left = 75
    Top = 144
    object N1: TMenuItem
      AutoHotkeys = maManual
      Caption = '     '#28155'   '#21152'          '
      OnClick = N1Click
    end
    object N2: TMenuItem
      AutoHotkeys = maManual
      Caption = '     '#20462'   '#25913'       '
      OnClick = N2Click
    end
    object N3: TMenuItem
      AutoHotkeys = maManual
      Caption = '     '#21024'   '#38500
      OnClick = N3Click
    end
    object TMenuItem
      Caption = '-'
    end
    object N4: TMenuItem
      Caption = '     '#21047'   '#26032
      OnClick = N4Click
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
    Left = 288
    Top = 177
  end
  object tblClientBr: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select'#13#10'a.ID,a.CreateDate,a.CreateUserID,a.RecordState,'#13#10'a.AreaI' +
      'D,a.EmlpoyeeID,'#13#10'a.Name ['#23458#25143#21517#31216'],a.FullName ['#36127#36131#20154'], '#13#10'a.Address ['#22320#22336 +
      '], a.ToAddress ['#32463#33829#24615#36136'],'#13#10'a.RunScope ['#32463#33829#35268#27169'],'#13#10'a.Telephone ['#30005#35805'], a.' +
      'Mobile ['#25163#26426'],'#13#10'a.Fax ['#20256#30495'], a.RegisterDate ['#27880#20876#26085#26399'],'#13#10'a.RegisterCapi' +
      'tal  ['#27880#20876#36164#26412'], a.Charter ['#25191#29031#21495#30721'],'#13#10'a.BossName ['#27861#20154#20195#34920'], a.RunRange ['#32463 +
      #33829#33539#22260'],'#13#10'a.CentralTax ['#22269#31246#35777#21495'],a.LandTax ['#22320#31246#35777#21495'],'#13#10'a.Corporation ['#20195#30721#35777 +
      #21495'], a.Certificates ['#35777#20070#21495#30721'],'#13#10'a.BankOpened ['#24320#25143#38134#34892'],a.ClientType ['#23458#25143 +
      #31867#22411'],'#13#10'a.BankAccount ['#38134#34892#24080#21495'], a.Memo ['#22791#27880'],'#13#10'a.EMail  ['#30005#23376#37038#31665'], a.Web' +
      ' ['#32593#22336'],'#13#10'a.PostalCode ['#37038#25919#32534#30721'],'#13#10'b.name ['#19994#21153#21592'],c.name ['#22320#21306#21517#31216']  '#13#10'from' +
      ' DAClient a '#13#10'left outer join MSEmployee b on a.EmlpoyeeID=b.ID'#13 +
      #10'left outer join DAArea c on   a.AreaID=c.ID'#13#10'where a.RecordStat' +
      'e<>'#39#21024#38500#39' and a.ClientType<>'#39#21378#21830#39' and '#13#10'a.AreaID in (select ID From' +
      ' DAArea where LevelCode like :LevelCode1 )'
    Parameters = <
      item
        Name = 'LevelCode1'
        DataType = ftString
        Size = -1
        Value = ''
      end>
    Left = 264
    Top = 120
    object tblClientBrID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblClientBrCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblClientBrCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblClientBrRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblClientBrAreaID: TIntegerField
      FieldName = 'AreaID'
      Visible = False
    end
    object tblClientBrEmlpoyeeID: TIntegerField
      FieldName = 'EmlpoyeeID'
      Visible = False
    end
    object tblClientBrDSDesigner: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 50
    end
    object tblClientBrDSDesigner2: TStringField
      FieldName = #36127#36131#20154
      Size = 50
    end
    object tblClientBrDSDesigner5: TStringField
      FieldName = #30005#35805
      Size = 50
    end
    object tblClientBrDSDesigner6: TStringField
      FieldName = #25163#26426
      Size = 50
    end
    object tblClientBrDSDesigner7: TStringField
      FieldName = #20256#30495
      Size = 50
    end
    object tblClientBrDSDesigner24: TStringField
      FieldName = #19994#21153#21592
      Size = 30
    end
    object tblClientBrDSDesigner3: TStringField
      FieldName = #22320#22336
      Size = 60
    end
    object tblClientBrDSDesigner23: TStringField
      FieldName = #37038#25919#32534#30721
      Size = 10
    end
    object tblClientBrDSDesigner25: TStringField
      FieldName = #22320#21306#21517#31216
      Size = 30
    end
    object tblClientBrDSDesigner13: TStringField
      FieldName = #22269#31246#35777#21495
      Size = 50
    end
    object tblClientBrDSDesigner12: TStringField
      FieldName = #32463#33829#33539#22260
      Size = 300
    end
    object tblClientBrDSDesigner11: TStringField
      FieldName = #27861#20154#20195#34920
      Size = 50
    end
    object tblClientBrDSDesigner10: TStringField
      FieldName = #25191#29031#21495#30721
      Size = 50
    end
    object tblClientBrDSDesigner9: TBCDField
      FieldName = #27880#20876#36164#26412
      Precision = 19
    end
    object tblClientBrDSDesigner8: TDateTimeField
      FieldName = #27880#20876#26085#26399
    end
    object tblClientBrDSDesigner14: TStringField
      FieldName = #22320#31246#35777#21495
      Size = 50
    end
    object tblClientBrDSDesigner15: TStringField
      FieldName = #20195#30721#35777#21495
      Size = 50
    end
    object tblClientBrDSDesigner16: TStringField
      FieldName = #35777#20070#21495#30721
      Size = 300
    end
    object tblClientBrDSDesigner17: TStringField
      FieldName = #24320#25143#38134#34892
      Size = 50
    end
    object tblClientBrDSDesigner18: TStringField
      FieldName = #23458#25143#31867#22411
      Size = 16
    end
    object tblClientBrDSDesigner19: TStringField
      FieldName = #38134#34892#24080#21495
      Size = 50
    end
    object tblClientBrDSDesigner20: TStringField
      FieldName = #22791#27880
      Size = 60
    end
    object tblClientBrDSDesigner21: TStringField
      FieldName = #30005#23376#37038#31665
      Size = 30
    end
    object tblClientBrDSDesigner22: TStringField
      FieldName = #32593#22336
      Size = 30
    end
    object tblClientBrDSDesigner4: TStringField
      FieldName = #32463#33829#24615#36136
      Size = 60
    end
    object tblClientBrDSDesigner26: TStringField
      FieldName = #32463#33829#35268#27169
      Size = 50
    end
  end
end
