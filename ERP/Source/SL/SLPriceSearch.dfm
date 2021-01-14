inherited SLPriceSearchForm: TSLPriceSearchForm
  Left = 128
  Top = 117
  BorderStyle = bsDialog
  Caption = #20215#26684#26597#35810#32467#26524
  ClientHeight = 363
  ClientWidth = 581
  OldCreateOrder = True
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object DBGrid: TQLDBGrid
    Left = 0
    Top = 0
    Width = 581
    Height = 363
    Align = alClient
    DataSource = dsSaleSearcher
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
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
    FooterRowCount = 0
    OptionsEx = [dgAllowDelete, dgAllowInsert, dgCurrencyView]
    Columns = <
      item
        Expanded = False
        FieldName = 'CreateDate'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'GoodName'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantity'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PriceBase'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Amount'
        Title.Alignment = taCenter
        Width = 110
        Visible = True
      end>
  end
  object dsSaleSearcher: TDataSource
    DataSet = tblSaleSearcher
    Left = 178
    Top = 110
  end
  object GoodName: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select *'#13#10'from DAGoods'
    Parameters = <>
    Left = 135
    Top = 94
  end
  object tblSaleSearcher: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select M.CreateDate,D.*'#13#10'from SLSaleDetail D ,SLSaleMaster M'#13#10'wh' +
      'ere D.MasterID=M.ID'
    IndexFieldNames = 'MasterID'
    Parameters = <>
    Left = 72
    Top = 94
    object tblSaleSearcherCreateDate: TDateTimeField
      DisplayLabel = #26085#26399'/'#26102#38388
      FieldName = 'CreateDate'
      ReadOnly = True
    end
    object tblSaleSearcherGoodName: TStringField
      DisplayLabel = #21830#21697#21517#31216
      FieldKind = fkLookup
      FieldName = 'GoodName'
      LookupDataSet = GoodName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'GoodsID'
      ReadOnly = True
      Lookup = True
    end
    object tblSaleSearcherQuantity: TBCDField
      DisplayLabel = #25968#37327
      FieldName = 'Quantity'
      ReadOnly = True
      Precision = 19
      Size = 5
    end
    object tblSaleSearcherPriceBase: TBCDField
      DisplayLabel = #21333#20215
      FieldName = 'PriceBase'
      ReadOnly = True
      currency = True
      Precision = 19
    end
    object tblSaleSearcherAmount: TBCDField
      DisplayLabel = #37329#39069
      FieldName = 'Amount'
      ReadOnly = True
      Precision = 19
      Size = 5
    end
    object tblSaleSearcherDiscountRate: TBCDField
      DisplayLabel = #25240#25187#29575
      FieldName = 'DiscountRate'
      ReadOnly = True
      Visible = False
      Precision = 19
      Size = 5
    end
    object tblSaleSearcherDiscount: TBCDField
      DisplayLabel = #25240#25187#37329#39069
      FieldName = 'Discount'
      ReadOnly = True
      Visible = False
      currency = True
      Precision = 19
    end
    object tblSaleSearcherNetAmount: TBCDField
      DisplayLabel = #38144#21806#20928#20215
      FieldName = 'NetAmount'
      ReadOnly = True
      Visible = False
      currency = True
      Precision = 19
    end
    object tblSaleSearcherTexrate: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'Texrate'
      ReadOnly = True
      Visible = False
      Precision = 19
      Size = 5
    end
    object tblSaleSearcherTaxAmount: TBCDField
      DisplayLabel = #31246#37329
      FieldName = 'TaxAmount'
      ReadOnly = True
      Visible = False
      currency = True
      Precision = 19
    end
    object tblSaleSearcherGoalQuantity: TBCDField
      FieldName = 'GoalQuantity'
      ReadOnly = True
      Visible = False
      Precision = 19
      Size = 5
    end
    object tblSaleSearcherGoodsID: TIntegerField
      FieldName = 'GoodsID'
      ReadOnly = True
      Visible = False
    end
    object tblSaleSearcherPackUnitID: TIntegerField
      FieldName = 'PackUnitID'
      ReadOnly = True
      Visible = False
    end
    object tblSaleSearcherMasterID: TIntegerField
      FieldName = 'MasterID'
      ReadOnly = True
      Visible = False
    end
    object tblSaleSearcherSalesMode: TStringField
      FieldName = 'SalesMode'
      ReadOnly = True
      Visible = False
      Size = 12
    end
    object tblSaleSearcherID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
  end
end
