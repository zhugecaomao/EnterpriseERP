inherited SLBrSaleGiftForm: TSLBrSaleGiftForm
  Left = 103
  Top = 157
  Caption = #21830#21697#36192#36865#36164#26009
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
    object ToolButton5: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton11: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton12: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton14: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton9: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      Top = 232
      Height = 26
      inherited TabSheet1: TTabSheet
        Caption = #21830#21697#36192#36865#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Height = 232
      Columns = <
        item
          Expanded = False
          FieldName = 'Code'
          Title.Alignment = taCenter
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date'
          Title.Alignment = taCenter
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'goods'
          Title.Alignment = taCenter
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GiftGoods'
          Title.Alignment = taCenter
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DiscountClass'
          Title.Alignment = taCenter
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PriceGift'
          Title.Alignment = taCenter
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StartDate'
          Title.Alignment = taCenter
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ExpireDate'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 311
    Top = 67
  end
  inherited DataSource: TDataSource
    DataSet = tblSLBrSaleGift
    Left = 248
    Top = 62
  end
  object tblSLBrSaleGift: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select a.*,b.name as goods,c.name as GiftGoods'#13#10'from SLSaleGift ' +
      'a '#13#10'left outer join  DAGoods   b   on b.id=a.GoodsID    '#13#10'left o' +
      'uter join  DAGoods   c  on c.id=a.GiftGoodsID    '#13#10'where a.Recor' +
      'dState<>'#39#21024#38500#39
    Parameters = <>
    Left = 177
    Top = 94
    object tblSLBrSaleGiftID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblSLBrSaleGiftGoodsID: TIntegerField
      DisplayLabel = #20027#35201#36135#21697'ID'
      FieldName = 'GoodsID'
    end
    object tblSLBrSaleGiftCode: TStringField
      DisplayLabel = #36192#36865#25919#31574#32534#21495
      FieldName = 'Code'
      Size = 12
    end
    object tblSLBrSaleGiftDiscountClass: TStringField
      DisplayLabel = #36192#36865#31867#21035
      FieldName = 'DiscountClass'
      Size = 12
    end
    object tblSLBrSaleGiftDate: TDateTimeField
      DisplayLabel = #21457#24067#26085#26399
      FieldName = 'Date'
    end
    object tblSLBrSaleGiftGiftGoodsID: TIntegerField
      DisplayLabel = #36192#36865#36135#21697'ID'
      FieldName = 'GiftGoodsID'
    end
    object tblSLBrSaleGiftPriceGift: TBCDField
      DisplayLabel = #36192#36865#21333#20215
      FieldName = 'PriceGift'
      Precision = 19
    end
    object tblSLBrSaleGiftStartDate: TDateTimeField
      DisplayLabel = #29983#25928#26085#26399
      FieldName = 'StartDate'
    end
    object tblSLBrSaleGiftExpireDate: TDateTimeField
      DisplayLabel = #25130#27490#26085#26399
      FieldName = 'ExpireDate'
      Visible = False
    end
    object tblSLBrSaleGiftMemo: TStringField
      DisplayLabel = #36192#36865#25919#31574#25688#35201
      FieldName = 'Memo'
      Visible = False
      Size = 60
    end
    object tblSLBrSaleGiftMinAmount: TBCDField
      DisplayLabel = #36215#28857#37329#39069
      FieldName = 'MinAmount'
      Visible = False
      Precision = 19
    end
    object tblSLBrSaleGiftPeriodID: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object tblSLBrSaleGiftQuantity: TBCDField
      DisplayLabel = #36215#28857#25968#37327
      FieldName = 'Quantity'
      Visible = False
      Precision = 18
      Size = 0
    end
    object tblSLBrSaleGiftGiftUnitID: TIntegerField
      DisplayLabel = #36192#36865#21333#20301'ID'
      FieldName = 'GiftUnitID'
      Visible = False
    end
    object tblSLBrSaleGiftCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblSLBrSaleGiftCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblSLBrSaleGiftQuantityGift: TBCDField
      DisplayLabel = #36192#36865#25968#37327
      FieldName = 'QuantityGift'
      Visible = False
      Precision = 18
      Size = 0
    end
    object tblSLBrSaleGiftRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblSLBrSaleGiftgoods: TStringField
      DisplayLabel = #20027#36135#21697#21517#31216
      FieldName = 'goods'
      Size = 30
    end
    object tblSLBrSaleGiftGiftGoods: TStringField
      DisplayLabel = #36192#36865#21830#21697#21517#31216
      FieldName = 'GiftGoods'
      Size = 30
    end
  end
end
