inherited FNCashLegerForm: TFNCashLegerForm
  Left = 31
  Top = 134
  Width = 725
  Height = 533
  Caption = #20986#32435#36164#37329#26126#32454#24080
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
        Caption = #20986#32435#36164#37329#26126#32454#24080
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
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#31867#21035
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#25688#35201
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25910#27454#20154'/'#20132#27454#20154
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24080#25143#21517#31216
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25910#20837#37329#39069
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25903#20986#37329#39069
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24046#39069'/'#20313#39069
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#25163#20154
          Title.Alignment = taCenter
          Width = 110
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
      ' select Date ['#26085#26399'], a.Code ['#32534#21495'] ,BillMode ['#19994#21153#31867#21035'] ,'#13#10' Brief ['#19994#21153#25688#35201']' +
      ', ReceiptPayee ['#25910#27454#20154'/'#20132#27454#20154'] ,'#13#10' b.name as ['#24080#25143#21517#31216'],AmountD ['#25910#20837#37329#39069'], Am' +
      'ountC ['#25903#20986#37329#39069'],'#13#10' AmountD-AmountC as ['#24046#39069'/'#20313#39069'],c.name as ['#32463#25163#20154'] '#13#10'fro' +
      'm ( '#13#10' select date,a.code,a.RecordState,BillMode,Brief,b.name as' +
      ' ReceiptPayee,'#13#10' AccountsID,AmountD,AmountC,EmployeeID from FNCl' +
      'earPCMaster a '#13#10' left outer join  DaClient b on b.id=a.ClientID ' +
      '   '#13#10' UNION ALL                                                 ' +
      '                   '#13#10' select date,a.code,a.RecordState,BillMode,' +
      'Brief,b.name as ReceiptPayee,'#13#10' AccountsID,AmountD,AmountC,Emplo' +
      'yeeID from FNClearSLMaster a   '#13#10' left outer join  DaClient b on' +
      ' b.id=a.ClientID    '#13#10' UNION ALL                                ' +
      '                                    '#13#10' select date,a.code,a.Reco' +
      'rdState,BillMode,Brief,b.name as ReceiptPayee,'#13#10' AccountsID,Amou' +
      'ntD,AmountC,EmployeeID   from FNCashInMaster a  '#13#10' left outer jo' +
      'in  MsEmployee b on b.id=a.ClientID  '#13#10' UNION ALL               ' +
      '                                                     '#13#10' select d' +
      'ate,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptPayee,'#13 +
      #10' AccountsID,AmountD,AmountC,EmployeeID  from FNCashoutMaster a ' +
      '      '#13#10' left outer join  MsEmployee b on b.id=a.ClientID   '#13#10' U' +
      'NION ALL                                                        ' +
      '            '#13#10' select date,a.code,a.RecordState,BillMode,Brief,b' +
      '.name as ReceiptPayee,'#13#10' ClientID,0.00 as AmountD, AmountD as Am' +
      'ountc ,EmployeeID   from FNCashOutInMaster a      '#13#10' left outer ' +
      'join  FNAccounts b on b.id=a.AccountsID '#13#10' UNION ALL            ' +
      '                                                           '#13#10' se' +
      'lect date,a.code,a.RecordState,BillMode,Brief,b.name as ReceiptP' +
      'ayee,   '#13#10' AccountsID,AmountD,0.00 as Amountc ,EmployeeID  from ' +
      'FNCashOutInMaster a    '#13#10' left outer join  FNAccounts b on b.id=' +
      'a.ClientID    '#13#10' union                                          ' +
      '                             '#13#10' select date,a.code,a.RecordState' +
      ',BillMode,Brief,b.name as ReceiptPayee,   '#13#10' AccountsID,0.00 as ' +
      'Amountd ,AmountC , EmployeeID from FNExpenseMaster a   '#13#10' left o' +
      'uter join  MsEmployee b on b.id=a.ClientID    '#13#10' ) AS a '#13#10'left O' +
      'uter Join FNaccounts b on  B.id=a.AccountsID '#13#10'left Outer Join M' +
      'SEmployee c on  c.id=a.EmployeeID'#13#10'where 1=3'
    Parameters = <>
    Left = 236
    Top = 172
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
      FieldName = #19994#21153#25688#35201
      Size = 30
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #25910#27454#20154'/'#20132#27454#20154
      Size = 50
    end
    object adsMasterDSDesigner6: TStringField
      FieldName = #24080#25143#21517#31216
      Size = 40
    end
    object adsMasterDSDesigner7: TBCDField
      FieldName = #25910#20837#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner8: TBCDField
      FieldName = #25903#20986#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner9: TBCDField
      FieldName = #24046#39069'/'#20313#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 20
    end
    object adsMasterDSDesigner10: TStringField
      FieldName = #32463#25163#20154
      Size = 30
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 112
    Top = 184
  end
end
