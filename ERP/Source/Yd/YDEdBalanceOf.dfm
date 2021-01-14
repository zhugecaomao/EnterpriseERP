inherited YDEdBalanceOfForm: TYDEdBalanceOfForm
  Left = 118
  Top = 99
  Width = 599
  Height = 381
  Caption = #29983#20135#26041#26696#32534#36753
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited DBGrid: TQLDBGrid
    Top = 122
    Width = 591
    Height = 191
    Columns = <
      item
        Expanded = False
        FieldName = 'FormulaName'
        Title.Alignment = taCenter
        Title.Caption = #29289#26009#28165#21333#32534#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PowerName'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PowerIndex'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FormulaScale'
        Title.Alignment = taCenter
        Title.Caption = #28165#21333#20493#25968
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 591
  end
  inherited TopPanel: TPanel
    Width = 591
    Height = 93
    inherited RemarkLabel: TLabel
      Left = 16
      Top = 67
      Width = 42
      Caption = #22791'   '#27880
    end
    inherited VoucherNoLabel: TLabel
      Left = 16
      Width = 42
      Caption = #21333'   '#21495
    end
    inherited VoucherDateLabel: TLabel
      Left = 224
      Width = 42
      Caption = #26085'   '#26399
    end
    object Label1: TLabel [3]
      Left = 16
      Top = 39
      Width = 42
      Height = 12
      Caption = #25688'   '#35201
      FocusControl = DBEdit1
    end
    object Label3: TLabel [4]
      Left = 224
      Top = 40
      Width = 48
      Height = 12
      Caption = #35745#21010#21517#31216
      FocusControl = DBLookupComboBox1
    end
    inherited RemarkDBEdit: TDBEdit
      Left = 68
      Top = 64
      Width = 350
      DataField = 'Memo'
      TabOrder = 3
    end
    inherited VocherNoDBEdit: TDBEdit
      Left = 68
      Width = 135
      DataField = 'Code'
      TabOrder = 0
    end
    inherited DateDBEdit: TDBEdit
      Left = 280
      Width = 135
      DataField = 'Date'
      TabOrder = 1
    end
    object DBEdit1: TDBEdit
      Left = 68
      Top = 36
      Width = 135
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      TabOrder = 2
    end
    object DBLookupComboBox1: TDBLookupComboBox
      Left = 280
      Top = 36
      Width = 137
      Height = 20
      DataField = 'PlanName'
      DataSource = MasterDataSource
      TabOrder = 4
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 313
    Width = 591
  end
  inherited MasterDataSource: TDataSource
    DataSet = BalanceOfMaster
    Left = 48
    Top = 200
  end
  inherited DetailDataSource: TDataSource
    DataSet = BalanceOfDetial
    Left = 112
    Top = 192
  end
  inherited ActionList: TActionList
    Top = 184
  end
  inherited MainMenu: TMainMenu
    Left = 232
    Top = 176
  end
  object BalanceOfMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select * from YDBalanceOfMaterialMaster'#13#10'where RecordState<>'#39#21024#38500#39 +
      ' and ID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 48
    Top = 136
    object BalanceOfMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object BalanceOfMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object BalanceOfMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object BalanceOfMasterRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object BalanceOfMasterCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object BalanceOfMasterDate: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
      Size = 30
    end
    object BalanceOfMasterBrief: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'Brief'
      Size = 30
    end
    object BalanceOfMasterPlanID: TIntegerField
      DisplayLabel = #24212#35745#21010'ID'
      FieldName = 'PlanID'
    end
    object BalanceOfMasterMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object BalanceOfMasterPlanName: TStringField
      FieldKind = fkLookup
      FieldName = 'PlanName'
      LookupDataSet = PlanName
      LookupKeyFields = 'ID'
      LookupResultField = 'Code'
      KeyFields = 'PlanID'
      Lookup = True
    end
  end
  object BalanceOfDetial: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from YDBalanceOfMaterialDetial'#13#10'where MasterID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 112
    Top = 144
    object BalanceOfDetialID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object BalanceOfDetialMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object BalanceOfDetialFormulaID: TIntegerField
      DisplayLabel = #29983#20135#24403#37327'ID'
      FieldName = 'FormulaID'
    end
    object BalanceOfDetialPowerID: TIntegerField
      DisplayLabel = #29983#20135#33021#21147'ID'
      FieldName = 'PowerID'
    end
    object BalanceOfDetialPowerIndex: TBCDField
      DisplayLabel = #33021#32791#25351#25968
      FieldName = 'PowerIndex'
      Precision = 18
      Size = 0
    end
    object BalanceOfDetialFormulaScale: TBCDField
      DisplayLabel = #24403#37327#20493#25968
      FieldName = 'FormulaScale'
      Precision = 18
      Size = 0
    end
    object BalanceOfDetialMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
    object BalanceOfDetialFormulaName: TStringField
      DisplayLabel = #24403#37327#32534#21495
      FieldKind = fkLookup
      FieldName = 'FormulaName'
      LookupDataSet = ADODataSet1
      LookupKeyFields = 'ID'
      LookupResultField = 'Code'
      KeyFields = 'FormulaID'
      Lookup = True
    end
    object BalanceOfDetialPowerName: TStringField
      DisplayLabel = #29983#20135#33021#21147#21517#31216
      FieldKind = fkLookup
      FieldName = 'PowerName'
      LookupDataSet = ADODataSet2
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'PowerID'
      Lookup = True
    end
  end
  object PlanName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Code from YDProductPlanMaster'#13#10'where RecordState<>'#39#21024#38500 +
      #39
    Parameters = <>
    Left = 448
    Top = 48
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select ID, Code from YDProductFormula'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 304
    Top = 232
  end
  object ADODataSet2: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select ID, Name from YDProductPower'#13#10'where RecordState<>'#39#21024#38500#39' '
    Parameters = <>
    Left = 376
    Top = 232
  end
end
