inherited FNCashToBankEditForm: TFNCashToBankEditForm
  Left = 75
  Top = 89
  VertScrollBar.Range = 0
  BorderStyle = bsSingle
  Caption = #36164#37329#35843#21160#32534#36753
  ClientHeight = 392
  ClientWidth = 634
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited DBGrid: TQLDBGrid
    Top = 153
    Width = 634
    Height = 217
    Columns = <
      item
        Expanded = False
        FieldName = 'AccountIDOutName'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ChechkCode'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AccountIDInName'
        Title.Alignment = taCenter
        Width = 120
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 634
  end
  inherited TopPanel: TPanel
    Width = 634
    Height = 124
    inherited RemarkLabel: TLabel
      Top = 83
    end
    inherited VoucherNoLabel: TLabel
      Left = 8
      Top = 19
    end
    inherited VoucherDateLabel: TLabel
      Left = 192
      Top = 19
    end
    object Label2: TLabel [3]
      Left = 192
      Top = 51
      Width = 30
      Height = 12
      Caption = #25688#35201':'
    end
    object Label3: TLabel [4]
      Left = 8
      Top = 51
      Width = 30
      Height = 12
      Caption = #21592#24037':'
    end
    inherited RemarkDBEdit: TDBEdit
      Top = 80
      DataField = 'Memo'
    end
    inherited VocherNoDBEdit: TDBEdit
      Left = 40
      Top = 16
      Width = 145
      DataField = 'Code'
    end
    inherited DateDBEdit: TDBEdit
      Left = 224
      Top = 16
      Width = 273
      DataField = 'Date'
    end
    object dbeBrief: TDBEdit
      Left = 224
      Top = 48
      Width = 273
      Height = 20
      DataField = 'Brief'
      DataSource = MasterDataSource
      TabOrder = 3
    end
    object dblcEmployeeID: TDBLookupComboBox
      Left = 40
      Top = 48
      Width = 145
      Height = 20
      DataField = 'EmployeID'
      DataSource = MasterDataSource
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = dsEmployee
      TabOrder = 4
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 370
    Width = 634
  end
  inherited GoodsLookup: TQLDBLookupComboBox
    Left = 24
    Top = 280
    Width = 57
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsFNCashToBank
    Left = 40
    Top = 184
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsFNCashToBankDetail
    Left = 152
    Top = 240
  end
  inherited ActionList: TActionList
    Left = 168
    Top = 184
  end
  inherited MainMenu: TMainMenu
    Left = 216
    Top = 184
  end
  inherited DetailsPopupMenu: TPopupMenu
    Left = 336
    Top = 160
  end
  object adsFNCashToBank: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'SELECT * FROM FNCashToBank WHERE ID = :ID and RecordState <>'#39#21024#38500#39
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 32
    Top = 152
    object adsFNCashToBankID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsFNCashToBankCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsFNCashToBankCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsFNCashToBankRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsFNCashToBankCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object adsFNCashToBankDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsFNCashToBankBrief: TStringField
      FieldName = 'Brief'
      Size = 40
    end
    object adsFNCashToBankEmployeID: TIntegerField
      FieldName = 'EmployeID'
      Visible = False
    end
    object adsFNCashToBankOriginBillID: TIntegerField
      FieldName = 'OriginBillID'
      Visible = False
    end
    object adsFNCashToBankOriginBillTypeID: TIntegerField
      FieldName = 'OriginBillTypeID'
      Visible = False
    end
    object adsFNCashToBankMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object adsFNCashToBankPeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
  end
  object adsFNCashToBankDetail: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    OnNewRecord = adsFNCashToBankDetailNewRecord
    CommandText = 'SELECT * FROM FNCashToBankDetail  WHERE MasterID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 240
    Top = 208
    object adsFNCashToBankDetailID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsFNCashToBankDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsFNCashToBankDetailAccountIDOut: TIntegerField
      DisplayLabel = #35843#20986#24080#25143
      FieldName = 'AccountIDOut'
      Visible = False
    end
    object adsFNCashToBankDetailAccountIDIn: TIntegerField
      DisplayLabel = #35843#20837#24080#25143
      FieldName = 'AccountIDIn'
      Visible = False
    end
    object adsFNCashToBankDetailChechkCode: TStringField
      DisplayLabel = #25903#31080#21495#30721
      FieldName = 'ChechkCode'
    end
    object adsFNCashToBankDetailAmount: TBCDField
      DisplayLabel = #35843#21160#37329#39069
      FieldName = 'Amount'
      currency = True
      Precision = 19
    end
    object adsFNCashToBankDetailAccountIDOutName: TStringField
      DisplayLabel = #35843#20986#36134#25143
      FieldKind = fkLookup
      FieldName = 'AccountIDOutName'
      LookupDataSet = adsAccounts
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'AccountIDOut'
      Size = 12
      Lookup = True
    end
    object adsFNCashToBankDetailAccountIDInName: TStringField
      DisplayLabel = #35843#20837#36134#25143
      FieldKind = fkLookup
      FieldName = 'AccountIDInName'
      LookupDataSet = adsAccounts
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'AccountIDIn'
      OnChange = adsFNCashToBankDetailAccountIDInNameChange
      Size = 12
      Lookup = True
    end
    object adsFNCashToBankDetailMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 30
    end
  end
  object dsPeriod: TDataSource
    DataSet = adsPeriod
    Left = 440
    Top = 32
  end
  object adsPeriod: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'SELECT * FROM MSPeriod WHERE RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 408
    Top = 32
    object adsPeriodID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsPeriodCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsPeriodCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsPeriodRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsPeriodName: TStringField
      FieldName = 'Name'
      FixedChar = True
      Size = 7
    end
    object adsPeriodStartDate: TDateTimeField
      FieldName = 'StartDate'
    end
    object adsPeriodCloseDate: TDateTimeField
      FieldName = 'CloseDate'
    end
    object adsPeriodIsClosed: TStringField
      FieldName = 'IsClosed'
      Size = 12
    end
    object adsPeriodLastCloseDate: TDateTimeField
      FieldName = 'LastCloseDate'
    end
    object adsPeriodCheckFlag: TIntegerField
      FieldName = 'CheckFlag'
    end
    object adsPeriodEmployeID: TIntegerField
      FieldName = 'EmployeID'
    end
  end
  object adsAccounts: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'FNAccounts'
    CommandType = cmdTable
    Parameters = <>
    Left = 288
    Top = 168
  end
  object dsEmployee: TDataSource
    DataSet = CommonData.adsMSEmployee
    Left = 120
    Top = 88
  end
end
