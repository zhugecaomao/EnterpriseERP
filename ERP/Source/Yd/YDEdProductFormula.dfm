inherited YDProductFormulaEditForm: TYDProductFormulaEditForm
  Left = 51
  Top = 94
  Width = 741
  Height = 465
  Caption = #29289#26009#28165#21333#32534#36753
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Splitter1: TSplitter [0]
    Left = 0
    Top = 249
    Width = 733
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  inherited DBGrid: TQLDBGrid
    Top = 113
    Width = 733
    Height = 136
    Align = alTop
    FooterRowCount = 1
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsName'
        Title.Alignment = taCenter
        Width = 160
        Visible = True
        Footer.Value = #21512#35745#65306
        Footer.ValueType = fvtStaticText
      end
      item
        Expanded = False
        FieldName = 'UnitName'
        Title.Alignment = taCenter
        Width = 73
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoalQuantity'
        Title.Alignment = taCenter
        Width = 75
        Visible = True
        Footer.ValueType = fvtSum
      end
      item
        Expanded = False
        FieldName = 'GoalUnitCost'
        Title.Alignment = taCenter
        Width = 100
        Visible = True
        Footer.ValueType = fvtSum
      end
      item
        Expanded = False
        FieldName = 'Cost'
        ReadOnly = True
        Title.Alignment = taCenter
        Width = 100
        Visible = True
        Footer.ValueType = fvtSum
      end>
  end
  inherited ToolBar: TToolBar
    Width = 733
  end
  inherited TopPanel: TPanel
    Width = 733
    Height = 84
    inherited RemarkLabel: TLabel
      Left = 235
      Visible = False
    end
    inherited VoucherNoLabel: TLabel
      Left = 8
      Caption = #32534#21495':'
    end
    inherited VoucherDateLabel: TLabel
      Left = 166
    end
    object Label1: TLabel [3]
      Left = 328
      Top = 11
      Width = 54
      Height = 12
      Caption = #24403#37327#31867#21035':'
    end
    object Label2: TLabel [4]
      Left = 8
      Top = 70
      Width = 72
      Height = 12
      Caption = #25237#20837#21407#26448#26009#65306
    end
    object Label5: TLabel [5]
      Left = 8
      Top = 43
      Width = 30
      Height = 12
      Caption = #21517#31216':'
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 267
      Width = 265
      DataField = 'Memo'
      Visible = False
    end
    inherited VocherNoDBEdit: TDBEdit
      Left = 40
      DataField = 'Code'
    end
    inherited DateDBEdit: TDBEdit
      Left = 198
      DataField = 'Date'
    end
    object dbcbFormulaClass: TDBComboBox
      Left = 384
      Top = 8
      Width = 145
      Height = 20
      DataField = 'FormulaClass'
      DataSource = MasterDataSource
      ItemHeight = 12
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 40
      Top = 40
      Width = 193
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      TabOrder = 4
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 397
    Width = 733
  end
  object Panel2: TPanel [5]
    Left = 0
    Top = 252
    Width = 733
    Height = 145
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 5
    object Label6: TLabel
      Left = 192
      Top = 88
      Width = 48
      Height = 12
      Caption = #20135#20986#21830#21697
    end
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 733
      Height = 23
      Align = alTop
      TabOrder = 0
      object Label3: TLabel
        Left = 8
        Top = 5
        Width = 102
        Height = 12
        Caption = #20135#20986#20135#21697'/'#21322#25104#21697#65306
      end
      object Label4: TLabel
        Left = 110
        Top = 7
        Width = 396
        Height = 12
        Caption = #25968#25454#36755#20837#23436#27605#21518#65292#35831#25353' F3 '#33719#21462#31995#32479#40664#35748#20998#37197#31995#25968#65292#25353' F4 '#35745#31639#20135#20986#25104#26412#65281
        Font.Charset = GB2312_CHARSET
        Font.Color = 16061
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentFont = False
      end
    end
    object QLDBGrid1: TQLDBGrid
      Left = 0
      Top = 23
      Width = 733
      Height = 122
      Align = alClient
      DataSource = dsYDProductFormulaOut
      Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      AlternateColor = 15399421
      CurrencyView.CurrencyTitle = False
      CurrencyView.DigitAlignment = taCenter
      CurrencyView.DigitWidth = 9
      CurrencyView.IntegerSeparateColor = clRed
      CurrencyView.SeparateColor = clSilver
      CurrencyView.ThousandSeparateColor = clGray
      CurrencyView.TitleLines = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      OptionsEx = [dgAllowDelete, dgAllowInsert, dgCurrencyView]
      Columns = <
        item
          Expanded = False
          FieldName = 'GoodsName'
          Width = 160
          Visible = True
          ControlType = ctCustomControl
          CustomControl = QLDBLookupComboBox1
          Footer.Value = #21512#35745#65306
          Footer.ValueType = fvtStaticText
        end
        item
          Expanded = False
          FieldName = 'UnitName'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GoalQuantity'
          Width = 75
          Visible = True
          Footer.ValueType = fvtSum
        end
        item
          Expanded = False
          FieldName = 'CostRate'
          Width = 69
          Visible = True
          Footer.ValueType = fvtSum
        end
        item
          Expanded = False
          FieldName = 'Cost'
          Width = 100
          Visible = True
          Footer.ValueType = fvtSum
        end
        item
          Expanded = False
          FieldName = 'GoalUnitCost'
          Width = 75
          Visible = True
          Footer.ValueType = fvtSum
        end>
    end
  end
  inherited GoodsLookup: TQLDBLookupComboBox
    Left = 24
    Top = 152
  end
  object QLDBLookupComboBox1: TQLDBLookupComboBox [7]
    Left = 48
    Top = 352
    Width = 145
    Height = 18
    BevelEdges = []
    BevelInner = bvNone
    BevelOuter = bvNone
    Ctl3D = False
    DataField = 'GoodsName'
    DataSource = dsYDProductFormulaOut
    DropDownRows = 10
    ListField = 'Name'
    ParentCtl3D = False
    TabOrder = 6
    Visible = False
    ButtonHeight = 22
    OnButtonClick = GoodsLookupButtonClick
    VisibleButtons = [lbSetNull]
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsYDProductFormula
    Left = 24
    Top = 184
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsYDProductFormulaIn
    Left = 56
    Top = 184
  end
  inherited ActionList: TActionList
    Left = 88
    Top = 184
    object GetDefaultAction: TAction
      Caption = #21462#40664#35748#20998#37197#31995#32479
      ShortCut = 114
      OnExecute = GetDefaultActionExecute
    end
    object CalcCostAction: TAction
      Caption = #35745#31639#25104#26412
      ShortCut = 115
      OnExecute = CalcCostActionExecute
    end
  end
  inherited MainMenu: TMainMenu
    Left = 120
    Top = 184
  end
  object adsYDProductFormula: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT * FROM YDProductFormulamaster'#13#10'WHERE ID = :ID and RecordS' +
      'tate <>'#39#21024#38500#39
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 24
    Top = 216
    object adsYDProductFormulaID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsYDProductFormulaCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsYDProductFormulaCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsYDProductFormulaRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsYDProductFormulaDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsYDProductFormulaCode: TStringField
      FieldName = 'Code'
    end
    object adsYDProductFormulaBrief: TStringField
      FieldName = 'Brief'
      Size = 30
    end
    object adsYDProductFormulaFormulaClass: TStringField
      FieldName = 'FormulaClass'
    end
    object adsYDProductFormulaMemo: TMemoField
      FieldName = 'Memo'
      BlobType = ftMemo
    end
  end
  object adsYDProductFormulaIn: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    OnNewRecord = adsYDProductFormulaInNewRecord
    CommandText = 'SELECT * FROM YDProductFormulaDetial'#13#10' WHERE MasterID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 56
    Top = 216
    object adsYDProductFormulaInID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsYDProductFormulaInMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsYDProductFormulaInGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
      OnChange = adsYDProductFormulaInGoodsIDChange
    end
    object adsYDProductFormulaInGoodsName: TStringField
      DisplayLabel = #25237#20837#26448#26009
      FieldKind = fkLookup
      FieldName = 'GoodsName'
      LookupDataSet = CommonData.adsDAGoods
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Size = 30
      Lookup = True
    end
    object adsYDProductFormulaInUnitId: TIntegerField
      FieldName = 'UnitId'
      Visible = False
    end
    object adsYDProductFormulaInUnitName: TStringField
      DisplayLabel = #25237#20837#21333#20301
      FieldKind = fkLookup
      FieldName = 'UnitName'
      LookupDataSet = adsMSUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'UnitId'
      OnChange = adsYDProductFormulaInUnitNameChange
      Lookup = True
    end
    object adsYDProductFormulaInQuantity: TBCDField
      DisplayLabel = #25237#20837#25968#37327
      FieldName = 'Quantity'
      Visible = False
      Precision = 18
      Size = 0
    end
    object adsYDProductFormulaInGoalQuantity: TBCDField
      DisplayLabel = #25237#20837#26631#20934#25968#37327
      FieldName = 'GoalQuantity'
      OnChange = adsYDProductFormulaInGoalQuantityChange
      Precision = 18
      Size = 0
    end
    object adsYDProductFormulaInGoalUnitCost: TBCDField
      DisplayLabel = #25104#26412#21333#20215
      FieldName = 'GoalUnitCost'
      OnChange = adsYDProductFormulaInGoalUnitCostChange
      currency = True
      Precision = 18
      Size = 0
    end
    object adsYDProductFormulaInCost: TBCDField
      DisplayLabel = #25104#26412
      FieldName = 'Cost'
      currency = True
      Precision = 18
      Size = 0
    end
  end
  object adsYDProductFormulaOut: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    OnNewRecord = adsYDProductFormulaOutNewRecord
    CommandText = 'SELECT * FROM YDProductFormulaOut WHERE MasterID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 72
    Top = 312
    object adsYDProductFormulaOututoIncField1: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object IntegerField1: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object IntegerField2: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
    end
    object StringField1: TStringField
      DisplayLabel = #20135#20986#21830#21697
      FieldKind = fkLookup
      FieldName = 'GoodsName'
      LookupDataSet = CommonData.adsDAGoods
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      Size = 30
      Lookup = True
    end
    object IntegerField3: TIntegerField
      FieldName = 'UnitId'
      Visible = False
    end
    object StringField2: TStringField
      DisplayLabel = #20135#20986#21333#20301
      FieldKind = fkLookup
      FieldName = 'UnitName'
      LookupDataSet = CommonData.adsMSUnit
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'UnitId'
      Lookup = True
    end
    object BCDField1: TBCDField
      DisplayLabel = #20135#20986#25968#37327
      FieldName = 'Quantity'
      Visible = False
      Precision = 18
      Size = 0
    end
    object adsYDProductFormulaOutCostRate: TBCDField
      DisplayLabel = #20998#37197#31995#25968
      FieldName = 'CostRate'
      Precision = 18
      Size = 0
    end
    object BCDField2: TBCDField
      DisplayLabel = #20135#20986#26631#20934#25968#37327
      FieldName = 'GoalQuantity'
      OnChange = BCDField2Change
      Precision = 18
      Size = 0
    end
    object BCDField3: TBCDField
      DisplayLabel = #26631#20934#21333#20301#25104#26412
      FieldName = 'GoalUnitCost'
      currency = True
      Precision = 18
      Size = 0
    end
    object BCDField4: TBCDField
      DisplayLabel = #20135#20986#25104#26412
      FieldName = 'Cost'
      currency = True
      Precision = 18
      Size = 0
    end
  end
  object dsYDProductFormulaOut: TDataSource
    DataSet = adsYDProductFormulaOut
    Left = 32
    Top = 312
  end
  object adsFormulaClass: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT distinct FormulaClass FROM YDProductFormula'#13#10'WHERE Record' +
      'State<>'#39#21024#38500#39
    Parameters = <>
    Left = 592
    Top = 56
  end
  object adsMSUnit: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'SELECT * FROM MSUnit WHERE RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 208
    Top = 176
  end
  object adrQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 536
    Top = 48
  end
  object ADSDAgoods: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'SELECT *  FROM DAGoods '#13#10'WHERE RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 152
    Top = 304
  end
  object DSDAgoods: TDataSource
    DataSet = ADSDAgoods
    Left = 256
    Top = 328
  end
end
