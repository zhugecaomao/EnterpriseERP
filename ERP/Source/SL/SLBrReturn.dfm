inherited SLReturnBrForm: TSLReturnBrForm
  Left = 172
  Top = -11
  Caption = #38144#21806#36864#36135
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
      Action = DeleteAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = EditAction
    end
    object ToolButton10: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
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
    object ToolButton12: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
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
    object ToolButton13: TToolButton
      Left = 464
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #38144#21806#20973#21333
      end
    end
    inherited DBGrid: TQLDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'Client'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Code'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ClearDate'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SaleMode'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Name'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 266
    Top = 67
  end
  inherited DataSource: TDataSource
    DataSet = adsSalesMaster
    Left = 223
    Top = 67
  end
  object adsSalesMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'SELECT SM.*, BC.Name AS Client, P.Name'#13#10'FROM SLSaleMaster SM LEF' +
      'T JOIN '#13#10#9'DAClient BC  ON SM.ClientID = BC.ID LEFT JOIN'#13#10#9'MSEmpl' +
      'oyee P ON SM.EmployeID = P.ID'#13#10'WHERE '#13#10' SM.RecordState<>'#39#21024#38500#39' and' +
      '  SM.SaleMode='#39#36864#36135#39#13#10
    Parameters = <>
    Left = 161
    Top = 65
    object adsSalesMasterID: TAutoIncField
      DisplayWidth = 10
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsSalesMasterClient: TStringField
      DisplayLabel = #23458#25143#21517#31216
      DisplayWidth = 22
      FieldName = 'Client'
      Size = 50
    end
    object adsSalesMasterCode: TStringField
      DisplayLabel = #21333#21495
      DisplayWidth = 20
      FieldName = 'Code'
    end
    object adsSalesMasterDate: TDateTimeField
      DisplayLabel = #24320#21333#26085#26399
      DisplayWidth = 18
      FieldName = 'Date'
    end
    object adsSalesMasterClearDate: TDateTimeField
      DisplayLabel = #32467#31639#26085#26399
      DisplayWidth = 18
      FieldName = 'ClearDate'
    end
    object adsSalesMasterIsDeliver: TStringField
      DisplayLabel = #36865#36135
      DisplayWidth = 10
      FieldName = 'IsDeliver'
      Visible = False
      OnGetText = adsSalesMasterIsDeliverGetText
      Size = 6
    end
    object adsSalesMasterIsTax: TStringField
      DisplayLabel = #21547#31246
      DisplayWidth = 10
      FieldName = 'IsTax'
      Visible = False
      OnGetText = adsSalesMasterIsDeliverGetText
      Size = 6
    end
    object adsSalesMasterTaxRate: TBCDField
      DisplayLabel = #31246#29575
      DisplayWidth = 20
      FieldName = 'TaxRate'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsSalesMasterIsDiscount: TStringField
      DisplayLabel = #25240#25187
      DisplayWidth = 20
      FieldName = 'IsDiscount'
      Visible = False
      OnGetText = adsSalesMasterIsDeliverGetText
    end
    object adsSalesMasterDiscountRate: TBCDField
      DisplayLabel = #25240#25187#29575
      DisplayWidth = 20
      FieldName = 'DiscountRate'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsSalesMasterSaleMode: TStringField
      DisplayLabel = #38144#21806#26041#24335
      DisplayWidth = 12
      FieldName = 'SaleMode'
      Size = 12
    end
    object adsSalesMasterName: TStringField
      DisplayLabel = #21592#24037
      DisplayWidth = 20
      FieldName = 'Name'
      Size = 30
    end
    object adsSalesMasterOriginBillID: TIntegerField
      DisplayWidth = 10
      FieldName = 'OriginBillID'
      Visible = False
    end
    object adsSalesMasterOriginBillTypeID: TIntegerField
      DisplayWidth = 14
      FieldName = 'OriginBillTypeID'
      Visible = False
    end
    object adsSalesMasterPeriodID: TIntegerField
      DisplayWidth = 10
      FieldName = 'PeriodID'
      Visible = False
    end
    object adsSalesMasterRecordState: TStringField
      DisplayWidth = 12
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsSalesMasterCreateUserID: TIntegerField
      DisplayWidth = 10
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsSalesMasterCreateDate: TDateTimeField
      DisplayWidth = 18
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsSalesMasterClientID: TIntegerField
      DisplayWidth = 10
      FieldName = 'ClientID'
      Visible = False
    end
    object adsSalesMasterEmployeID: TIntegerField
      DisplayWidth = 10
      FieldName = 'EmployeID'
      Visible = False
    end
    object adsSalesMasterMemo: TStringField
      FieldName = 'Memo'
      Visible = False
      Size = 50
    end
    object adsSalesMasterSundryFee: TBCDField
      FieldName = 'SundryFee'
      Visible = False
      Precision = 19
      Size = 5
    end
    object adsSalesMasterIsApportion: TStringField
      FieldName = 'IsApportion'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
end
