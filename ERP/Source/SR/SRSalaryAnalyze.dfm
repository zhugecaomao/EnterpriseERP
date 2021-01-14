inherited SRSalaryAnalyzeForm: TSRSalaryAnalyzeForm
  Left = 53
  Top = 104
  Width = 725
  Height = 533
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = #24037#36164#20998#26512#31649#29702
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 717
    ButtonWidth = 55
    object ToolButton4: TToolButton
      Left = 0
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton5: TToolButton
      Left = 55
      Top = 2
      Action = PrintAction
    end
    object ToolButton11: TToolButton
      Left = 110
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 118
      Top = 2
      Action = ExportAction
    end
    object ToolButton12: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 181
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton1: TToolButton
      Left = 236
      Top = 2
      Action = CustomizeViewAction
      Caption = #26174#31034#21015
    end
    object ToolButton8: TToolButton
      Left = 291
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 354
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 717
    Height = 465
    inherited PageControl: TPageControl
      Top = 438
      Width = 717
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #24037#36164#20998#26512#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 46
      Width = 717
      Height = 392
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #24037#36164#26399#38388
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#34218#26085#26399
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37096#38376#21517#31216
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21592#24037#22995#21517
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23454#21457#22522#26412#24037#36164
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24037#40836#24037#36164
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #34917#36148#21152#29677
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#20214#24037#36164
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#26102#24037#36164
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24212#20184#24037#36164#21512#35745
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25187#38500#39033#30446
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20010#20154#25152#24471#31246
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23454#21457#24037#36164
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 46
      Align = alTop
      Caption = 'Panel2'
      TabOrder = 2
      Visible = False
    end
  end
  inherited ActionList: TActionList
    Left = 83
    Top = 221
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 46
    Top = 218
  end
  object adsMaster: TADODataSet
    AutoCalcFields = False
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select a.id,b.brief as ['#24037#36164#26399#38388'],b.clearDate as ['#35745#34218#26085#26399'] ,'#13#10'd.name as' +
      ' ['#37096#38376#21517#31216'], c.name  as ['#21592#24037#22995#21517'],'#13#10'a.SundryFee as ['#23454#21457#22522#26412#24037#36164'], a.PriceBas' +
      'e as ['#24037#40836#24037#36164'],'#13#10'a.GoalQuantity as ['#34917#36148#21152#29677'],a.QuantityPcs as ['#35745#20214#24037#36164'] ,' +
      #13#10'a.TimeAmount as ['#35745#26102#24037#36164'],a.SalaryAmount as ['#24212#20184#24037#36164#21512#35745'],'#13#10'a.Discount' +
      ' as ['#25187#38500#39033#30446'],a.TaxAmount as ['#20010#20154#25152#24471#31246'],'#13#10'a.Payable as '#23454#21457#24037#36164#13#10'from  SRB' +
      'aseSalaryDetail a '#13#10'left outer join SRBaseSalaryMaster b on b.ID' +
      '=a.MasterID'#13#10'left outer join MSEmployee c on c.ID=a.GoalUnitID'#13#10 +
      'left outer join MSDepartment d on d.ID=c.DepartmentID'#13#10'where 1=2'
    Parameters = <>
    Left = 140
    Top = 220
    object adsMasterDSDesigner: TStringField
      FieldName = #24037#36164#26399#38388
      Size = 30
    end
    object adsMasterDSDesigner2: TDateTimeField
      FieldName = #35745#34218#26085#26399
      DisplayFormat = 'yyyy-mm-dd dddd'
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object adsMasterDSDesigner4: TStringField
      FieldName = #21592#24037#22995#21517
      Size = 30
    end
    object adsMasterDSDesigner5: TBCDField
      FieldName = #23454#21457#22522#26412#24037#36164
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner6: TBCDField
      FieldName = #24037#40836#24037#36164
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner7: TBCDField
      FieldName = #34917#36148#21152#29677
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner8: TBCDField
      FieldName = #35745#20214#24037#36164
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner9: TBCDField
      FieldName = #35745#26102#24037#36164
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner10: TBCDField
      FieldName = #24212#20184#24037#36164#21512#35745
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner11: TBCDField
      FieldName = #25187#38500#39033#30446
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner12: TBCDField
      FieldName = #20010#20154#25152#24471#31246
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner13: TBCDField
      FieldName = #23454#21457#24037#36164
      DisplayFormat = '#,#.00'
      Precision = 19
      Size = 5
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 208
    Top = 232
  end
end
