inherited FNCredenceEditForm: TFNCredenceEditForm
  Left = 14
  Top = 59
  Width = 786
  Height = 460
  Caption = #35760#24080#20973#35777
  WindowState = wsMaximized
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited DBGrid: TQLDBGrid
    Width = 778
    Height = 295
    OnEditButtonClick = DBGridEditButtonClick
    CurrencyView.CurrencyTitle = True
    Columns = <
      item
        Expanded = False
        FieldName = 'GoodsSpec'
        Title.Alignment = taCenter
        Title.Caption = #19994#21153#25688#35201
        Visible = True
      end
      item
        ButtonStyle = cbsEllipsis
        Expanded = False
        FieldName = 'Goods'
        Title.Alignment = taCenter
        Title.Caption = #20250#35745#31185#30446#21517#31216
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceBase'
        Title.Alignment = taCenter
        Title.Caption = #20511#26041#37329#39069
        Visible = True
        Footer.ValueType = fvtSum
      end
      item
        Expanded = False
        FieldName = 'PriceCost'
        Title.Alignment = taCenter
        Title.Caption = #36151#26041#37329#39069
        Visible = True
        Footer.ValueType = fvtSum
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Title.Alignment = taCenter
        Width = 123
        Visible = True
      end>
  end
  inherited ToolBar: TToolBar
    Width = 778
  end
  inherited TopPanel: TPanel
    Width = 778
    inherited VoucherNoLabel: TLabel
      Caption = #32534#21495':'
    end
    object Label1: TLabel [3]
      Left = 8
      Top = 11
      Width = 30
      Height = 12
      Caption = #31867#22411':'
    end
    inherited RemarkDBEdit: TDBEdit
      DataField = 'Memo'
    end
    inherited VocherNoDBEdit: TDBEdit
      DataField = 'Code'
    end
    inherited DateDBEdit: TDBEdit
      DataField = 'Date'
    end
    object DBComboBox1: TDBComboBox
      Left = 40
      Top = 8
      Width = 121
      Height = 20
      Style = csDropDownList
      DataField = 'BillMode'
      DataSource = MasterDataSource
      ItemHeight = 12
      Items.Strings = (
        #25910
        #20184
        #36716
        #33258#21160#36716#25442)
      TabOrder = 3
    end
  end
  inherited StatusBar1: TStatusBar
    Top = 392
    Width = 778
  end
  inherited MasterDataSource: TDataSource
    DataSet = adsCredMaster
  end
  inherited DetailDataSource: TDataSource
    DataSet = adsCredDetail
  end
  object adsCredMaster: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'SELECT * FROM FNCredMaster WHERE ID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 216
    Top = 184
    object adsCredMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsCredMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsCredMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsCredMasterRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsCredMasterDate: TDateTimeField
      FieldName = 'Date'
    end
    object adsCredMasterCode: TStringField
      FieldName = 'Code'
    end
    object adsCredMasterClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object adsCredMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
    end
    object adsCredMasterBillMode: TStringField
      FieldName = 'BillMode'
      Size = 16
    end
    object adsCredMasterModeDC: TIntegerField
      FieldName = 'ModeDC'
    end
    object adsCredMasterModeC: TIntegerField
      FieldName = 'ModeC'
    end
    object adsCredMasterBrief: TStringField
      FieldName = 'Brief'
      Size = 30
    end
    object adsCredMasterMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object adsCredMasterOriginID: TIntegerField
      FieldName = 'OriginID'
    end
    object adsCredMasterOriginTable: TStringField
      FieldName = 'OriginTable'
      Size = 30
    end
  end
  object adsCredDetail: TADODataSet
    Connection = CommonData.acnConnection
    OnCalcFields = adsCredDetailCalcFields
    CommandText = 'SELECT * FROM FNCredDetail WHERE MasterID = :ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 256
    Top = 184
    object adsCredDetailID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsCredDetailMasterID: TIntegerField
      FieldName = 'MasterID'
      Visible = False
    end
    object adsCredDetailGoodsID: TIntegerField
      FieldName = 'GoodsID'
      Visible = False
    end
    object adsCredDetailGoodsSpec: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'GoodsSpec'
      Size = 30
    end
    object adsCredDetailGoods: TStringField
      DisplayLabel = #31185#30446
      DisplayWidth = 30
      FieldKind = fkCalculated
      FieldName = 'Goods'
      Size = 50
      Calculated = True
    end
    object adsCredDetailQuantity: TBCDField
      FieldName = 'Quantity'
      Precision = 19
      Size = 5
    end
    object adsCredDetailPriceBase: TBCDField
      DisplayLabel = #20511#26041
      FieldName = 'PriceBase'
      OnChange = adsCredDetailPriceBaseChange
      currency = True
      Precision = 19
    end
    object adsCredDetailPriceCost: TBCDField
      DisplayLabel = #36151#26041
      FieldName = 'PriceCost'
      OnChange = adsCredDetailPriceCostChange
      currency = True
      Precision = 19
    end
    object adsCredDetailMemo: TStringField
      DisplayLabel = #38468#27880
      FieldName = 'Memo'
      Size = 30
    end
  end
end
