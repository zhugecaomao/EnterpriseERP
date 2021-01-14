inherited FNReceiptPayLegerForm: TFNReceiptPayLegerForm
  Left = 70
  Top = 180
  Width = 725
  Height = 533
  Caption = #24212#25910#24212#20184#26126#32454#24080
  Position = poMainFormCenter
  Visible = False
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
        Caption = #24212#25910#24212#20184#26126#32454#24080
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 717
      Height = 438
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32534#21495
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
          FieldName = #23458#25143'/'#21378#21830#21517#31216
          Title.Alignment = taCenter
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24080#25143#21517#31216
          Title.Alignment = taCenter
          Width = 180
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25910#27454#37329#39069
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #38144#21806'/'#25240#25187'/'#36820#21033
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24212#25910#24080#27454#39069
          Title.Alignment = taCenter
          Width = 110
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
          FieldName = #19994#21153#25688#35201
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
        end
        item
          Expanded = False
          FieldName = #20973#21333#29366#24577
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 67
    Top = 189
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 30
    Top = 186
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      ' select Date as ['#26085#26399'], a.Code as ['#32534#21495'], '#13#10'         BillMode as ['#19994#21153 +
      #31867#21035'], c.name as ['#23458#25143'/'#21378#21830#21517#31216'] ,            '#13#10'         Fa.name  AS ['#24080#25143 +
      #21517#31216'],AmountD  as ['#25910#27454#37329#39069'],                 '#13#10'         AmountC as  [' +
      #38144#21806'/'#25240#25187'/'#36820#21033'], AmountC-AmountD as ['#24212#25910#24080#27454#39069'] , '#13#10'         e.name  as ['#32463 +
      #25163#20154'] ,Brief  as ['#19994#21153#25688#35201'],                     '#13#10'         a.Memo  as' +
      ' ['#22791#27880'] ,a.RecordState as ['#20973#21333#29366#24577']                       '#13#10'         ' +
      'from     FNClearSLMaster  a '#13#10'         LEFT Outer join  MSEmploy' +
      'ee E on E.ID=a.EmployeeID              '#13#10'         LEFT Outer joi' +
      'n  DAClient C on C.ID=a.ClientID                  '#13#10'         LEF' +
      'T Outer join   FNAccounts  FA  on FA.ID=a.AccountsID      '#13#10#13#10'wh' +
      'ere 1=2'
    Parameters = <>
    Left = 196
    Top = 188
    object adsMasterDSDesigner: TDateTimeField
      FieldName = #26085#26399
    end
    object adsMasterDSDesigner2: TStringField
      FieldName = #32534#21495
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #19994#21153#31867#21035
      Size = 16
    end
    object adsMasterDSDesigner4: TStringField
      FieldName = #23458#25143'/'#21378#21830#21517#31216
      Size = 50
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #24080#25143#21517#31216
      Size = 40
    end
    object adsMasterDSDesigner6: TBCDField
      FieldName = #25910#27454#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner7: TBCDField
      FieldName = #38144#21806'/'#25240#25187'/'#36820#21033
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner8: TBCDField
      FieldName = #24212#25910#24080#27454#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner9: TStringField
      FieldName = #32463#25163#20154
      Size = 30
    end
    object adsMasterDSDesigner10: TStringField
      FieldName = #19994#21153#25688#35201
      Size = 30
    end
    object adsMasterDSDesigner11: TStringField
      FieldName = #22791#27880
      Size = 60
    end
    object adsMasterDSDesigner12: TStringField
      FieldName = #20973#21333#29366#24577
      Size = 12
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 112
    Top = 184
  end
end
