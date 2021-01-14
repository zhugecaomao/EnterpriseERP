inherited SLBrOrderForm: TSLBrOrderForm
  Left = 29
  Top = 47
  Width = 808
  Height = 580
  Caption = #38144#21806#35746#21333
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 800
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
    object ToolButton15: TToolButton
      Left = 346
      Top = 2
      Action = ShowChartAction
    end
    object ToolButton12: TToolButton
      Left = 401
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 409
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton14: TToolButton
      Left = 464
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton8: TToolButton
      Left = 519
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 574
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 582
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 800
    Height = 512
    inherited PageControl: TPageControl
      Top = 485
      Width = 800
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #38144#21806#35746#21333#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 800
      Height = 485
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#31867#21035
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35746#36135#23458#25143
          Title.Alignment = taCenter
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35746#36135#37329#39069
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #38468#21152#36153#29992
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36153#29992#20998#25674
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25240#25187#37329#39069
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#25163#20154
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20132#36135#26085#26399
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20132#36135#26041#24335
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35746#21333#29366#24577
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Width = 90
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
    Top = 90
  end
  object adsSalesMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select a.ID,a.RecordState,a.ClientID,a. EmployeeID,a.Code as ['#32534#21495 +
      '],a.Date ['#26085#26399'],  a.BillMode ['#19994#21153#31867#21035'],'#13#10' a.ClearDate ['#20132#36135#26085#26399'], a.Appor' +
      'tion ['#36153#29992#20998#25674'], '#13#10'a.Deliver ['#20132#36135#26041#24335'], a.Memo ['#22791#27880'],b.name as ['#35746#36135#23458#25143'] '#13#10 +
      ',c.name as ['#32463#25163#20154'], A.SundryFee*a.ModeDC*a.ModeC as ['#38468#21152#36153#29992'] ,'#13#10'ttl.' +
      'Amount*a.ModeDC*a.ModeC as ['#35746#36135#37329#39069'] ,'#13#10'ttl.Discount*a.ModeDC*a.Mod' +
      'eC as ['#25240#25187#37329#39069'],'#13#10'a.RecordState as ['#35746#21333#29366#24577']'#13#10'from SLOrderMaster a '#13#10'l' +
      'eft outer join  DAClient b on b. ID=a.ClientID '#13#10'left outer join' +
      '  MSEmployee  c on c.id=a. EmployeeID   '#13#10'left outer join '#13#10'(sel' +
      'ect masterID, (sum(isnull(Amount,0))+Sum(Isnull(TaxAmount,0))+'#13#10 +
      'Sum(Isnull(SundryFee,0))) as Amount ,sum(isnull(Discount,0)) as ' +
      'Discount'#13#10'from SLOrderDetail group by masterId  ) as ttl '#13#10'on tt' +
      'l.masterID=a.id '#13#10'WHERE  A.RECORDSTATE<>'#39#21024#38500#39' '#13#10'order by a.ID DES' +
      'C'
    Parameters = <>
    Left = 176
    Top = 84
    object adsSalesMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsSalesMasterClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsSalesMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Visible = False
    end
    object adsSalesMasterRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsSalesMasterDSDesigner: TStringField
      FieldName = #32534#21495
    end
    object adsSalesMasterDSDesigner2: TDateTimeField
      FieldName = #26085#26399
    end
    object adsSalesMasterDSDesigner3: TStringField
      FieldName = #19994#21153#31867#21035
      Size = 16
    end
    object adsSalesMasterDSDesigner4: TDateTimeField
      FieldName = #20132#36135#26085#26399
    end
    object adsSalesMasterDSDesigner8: TStringField
      FieldName = #35746#36135#23458#25143
      Size = 50
    end
    object adsSalesMasterDSDesigner11: TBCDField
      FieldName = #35746#36135#37329#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 32
      Size = 5
    end
    object adsSalesMasterDSDesigner10: TBCDField
      FieldName = #38468#21152#36153#29992
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 32
      Size = 5
    end
    object adsSalesMasterDSDesigner5: TStringField
      FieldName = #36153#29992#20998#25674
      Size = 12
    end
    object adsSalesMasterDSDesigner12: TBCDField
      FieldName = #25240#25187#37329#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsSalesMasterDSDesigner9: TStringField
      FieldName = #32463#25163#20154
      Size = 30
    end
    object adsSalesMasterDSDesigner6: TStringField
      FieldName = #20132#36135#26041#24335
      Size = 30
    end
    object adsSalesMasterDSDesigner13: TStringField
      FieldName = #35746#21333#29366#24577
      Size = 12
    end
    object adsSalesMasterDSDesigner7: TStringField
      FieldName = #22791#27880
      Size = 60
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 320
    Top = 136
  end
end
