inherited SLBrSaleBillAForm: TSLBrSaleBillAForm
  Left = 50
  Top = 149
  Width = 697
  Height = 336
  Caption = #20195#38144#24320#21333
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 689
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
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 689
    Height = 268
    inherited PageControl: TPageControl
      Top = 241
      Width = 689
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #38144#21806#20973#21333
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 689
      Height = 241
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'Code'
          Title.Alignment = taCenter
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Date'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
          Footer.Value = #21512'    '#35745
          Footer.ValueType = fvtStaticText
        end
        item
          Expanded = False
          FieldName = 'ClientName'
          Title.Alignment = taCenter
          Width = 177
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SaleAmount'
          Title.Alignment = taCenter
          Width = 99
          Visible = True
          Footer.ValueType = fvtSum
        end
        item
          Expanded = False
          FieldName = 'BillMode'
          Title.Alignment = taCenter
          Width = 67
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ClearDate'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Memo'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 371
    Top = 77
  end
  inherited DataSource: TDataSource
    DataSet = adsSalesMaster
    Left = 246
    Top = 114
  end
  object adsSalesMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select a.*,b.name as ClientName,c.name as Employeename,ttl.SaleA' +
      'mount*a.BillModeDC as SaleAmount ,'#13#10'ttl.SaleDiscount as SaleDisc' +
      'ount'#13#10'from SLSaleMaster a inner join  DAClient b on '#13#10'b. ID=a.Cl' +
      'ientID inner join  MSEmployee  c on'#13#10'c.id=a. EmployeID   inner j' +
      'oin '#13#10'(select masterID,sum(isnull(NetAmount,0))+Sum(Isnull(TaxAm' +
      'ount,0)) as SaleAmount ,sum(isnull(Discount,0)) as SaleDiscount'#13 +
      #10'from SLSaleDetail group by masterId  ) as ttl '#13#10'on ttl.masterID' +
      '=a.id '#13#10'WHERE  A.RECORDSTATE<>'#39#21024#38500#39' '#13#10'order by a.date DESC'
    Parameters = <>
    Left = 188
    Top = 108
    object adsSalesMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsSalesMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsSalesMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsSalesMasterRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsSalesMasterClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsSalesMasterEmployeID: TIntegerField
      FieldName = 'EmployeID'
      Visible = False
    end
    object adsSalesMasterBillModeDC: TIntegerField
      FieldName = 'BillModeDC'
      Visible = False
    end
    object adsSalesMasterOriginBillID: TIntegerField
      FieldName = 'OriginBillID'
      Visible = False
    end
    object adsSalesMasterOriginBillTypeID: TIntegerField
      FieldName = 'OriginBillTypeID'
      Visible = False
    end
    object adsSalesMasterPeriodID: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object adsSalesMasterCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object adsSalesMasterDate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
    end
    object adsSalesMasterClientName: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'ClientName'
      Size = 50
    end
    object adsSalesMasterSaleAmount: TBCDField
      DisplayLabel = #38144#21806#37329#39069
      FieldName = 'SaleAmount'
      currency = True
      Precision = 19
    end
    object adsSalesMasterBillMode: TStringField
      DisplayLabel = #19994#21153#31867#21035
      FieldName = 'BillMode'
      Size = 16
    end
    object adsSalesMasterEmployeename: TStringField
      DisplayLabel = #32463#25163#20154
      FieldName = 'Employeename'
      Size = 30
    end
    object adsSalesMasterClearDate: TDateTimeField
      DisplayLabel = #32467#31639#26085#26399
      FieldName = 'ClearDate'
    end
    object adsSalesMasterSaleDiscount: TBCDField
      DisplayLabel = #38144#21806#25240#25187
      FieldName = 'SaleDiscount'
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
    end
    object adsSalesMasterSundryFee: TBCDField
      DisplayLabel = #38468#21152#36153#29992
      FieldName = 'SundryFee'
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsSalesMasterIsApportion: TStringField
      DisplayLabel = #20998#25674#26041#24335
      FieldName = 'IsApportion'
      Size = 12
    end
    object adsSalesMasterIsTax: TStringField
      DisplayLabel = #26159#21542#21547#31246
      FieldName = 'IsTax'
      FixedChar = True
      Size = 10
    end
    object adsSalesMasterTaxRate: TBCDField
      DisplayLabel = #31246#29575
      FieldName = 'TaxRate'
      Precision = 19
      Size = 5
    end
    object adsSalesMasterIsDeliver: TStringField
      DisplayLabel = #26159#21542#36865#36135
      FieldName = 'IsDeliver'
      FixedChar = True
      Size = 10
    end
    object adsSalesMasterDiscountRate: TBCDField
      DisplayLabel = #25240#25187#29575
      FieldName = 'DiscountRate'
      Precision = 19
      Size = 5
    end
    object adsSalesMasterMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
end
