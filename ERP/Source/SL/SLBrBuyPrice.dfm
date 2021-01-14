inherited PCPurchasePriceForm: TPCPurchasePriceForm
  Left = 102
  Top = 163
  Caption = #21830#21697#36827#20215
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = EditAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = DeleteAction
    end
    object ToolButton9: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton5: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton10: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton11: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton8: TToolButton
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
    inherited PageControl: TPageControl
      Top = 232
      Height = 26
      inherited TabSheet1: TTabSheet
        Caption = #21830#21697#36827#20215#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Height = 232
    end
  end
  inherited ActionList: TActionList
    Left = 322
    Top = 97
  end
  inherited DataSource: TDataSource
    DataSet = tblSLBrBuyPrice
    Left = 264
    Top = 101
  end
  object tblSLBrBuyPrice: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = tblSLBrBuyPriceFilterRecord
    TableName = 'SLBuyPrice'
    Left = 220
    Top = 105
    object tblSLBrBuyPriceID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblSLBrBuyPriceCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblSLBrBuyPriceCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblSLBrBuyPriceRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblSLBrBuyPriceGoodsID: TIntegerField
      DisplayLabel = #36135#21697'ID'
      FieldName = 'GoodsID'
    end
    object tblSLBrBuyPriceDate: TDateTimeField
      DisplayLabel = #21457#24067#26085#26399
      FieldName = 'Date'
    end
    object tblSLBrBuyPriceCode: TStringField
      DisplayLabel = #20215#26684#25919#31574#32534
      FieldName = 'Code'
    end
    object tblSLBrBuyPricePackUnit: TStringField
      DisplayLabel = #21253#35013#21333#20301
      FieldName = 'PackUnit'
      Size = 12
    end
    object tblSLBrBuyPricePriceBase: TBCDField
      DisplayLabel = #22522#26412#21333#20215
      FieldName = 'PriceBase'
      currency = True
      Precision = 19
    end
    object tblSLBrBuyPricePriceMin: TBCDField
      DisplayLabel = #26368#20302#38480#20215
      FieldName = 'PriceMin'
      currency = True
      Precision = 19
    end
    object tblSLBrBuyPricePriceMax: TBCDField
      DisplayLabel = #26368#39640#38480#20215
      FieldName = 'PriceMax'
      currency = True
      Precision = 19
    end
    object tblSLBrBuyPriceStartDate: TDateTimeField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'StartDate'
    end
    object tblSLBrBuyPriceExpireDate: TDateTimeField
      DisplayLabel = #29983#25928#26085#26399
      FieldName = 'ExpireDate'
    end
    object tblSLBrBuyPriceMeno: TStringField
      DisplayLabel = #35843#20215#25919#31574#25688#35201
      FieldName = 'Meno'
      Visible = False
      Size = 60
    end
    object tblSLBrBuyPricePeriodID: TIntegerField
      DisplayLabel = #31649#29702#26399#38388'ID'
      FieldName = 'PeriodID'
      Visible = False
    end
    object tblSLBrBuyPricePriceClass: TStringField
      DisplayLabel = #20215#26684#31867#21035
      FieldName = 'PriceClass'
      Visible = False
      Size = 12
    end
  end
end
