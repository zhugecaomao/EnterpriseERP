inherited FNReceiptPayLegerEForm: TFNReceiptPayLegerEForm
  Left = 29
  Top = 185
  Width = 725
  Height = 533
  Caption = #20854#23427#24212#25910#24212#20184#31649#29702
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
        Caption = #20854#23427#24212#25910#24212#20184
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
          FieldName = #20511#27454#20154'/'#36824#27454#20154
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#25163#20154
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24080#25143#21517#31216
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21463#27454#37329#39069
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20132#27454#37329#39069
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20914#24080#37329#39069
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
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Width = 160
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
      'select date as ['#26085#26399'],a.code as ['#32534#21495'],'#13#10'BillMode as ['#19994#21153#31867#21035'], Brief a' +
      's ['#19994#21153#25688#35201'],'#13#10'c.name as ['#20511#27454#20154'/'#36824#27454#20154'], d.name as ['#32463#25163#20154'],'#13#10'b.name as ['#24080#25143#21517 +
      #31216'], AmountD as ['#21463#27454#37329#39069'],'#13#10'AmountC as ['#20132#27454#37329#39069'] , AmountRed as ['#20914#24080#37329#39069'],' +
      ' '#13#10'AmountD-AmountC-AmountRed as ['#24046#39069'/'#20313#39069'] ,'#13#10'Memo ['#22791#27880']'#13#10'from ('#13#10'se' +
      'lect date,code,Recordstate,'#13#10'BillMode,Brief,ClientID, EmployeeID' +
      ' ,ClearDate ,'#13#10'AccountsID ,  0.00 as AmountD, AmountD*ModeDc*Mod' +
      'eC as AmountC ,'#13#10'AmountRed*ModeDc*ModeC*(-1) as AmountRed, Memo'#13 +
      #10'from FNCashInMaster '#13#10'UNION ALL '#13#10'select date,code,Recordstate,' +
      #13#10'BillMode,Brief,ClientID, EmployeeID ,ClearDate ,'#13#10'AccountsID ,' +
      'AmountC*ModeDc*ModeC as AmountD, 0.00 as AmountC ,'#13#10'AmountRed*Mo' +
      'deDc*ModeC as AmountRed  ,Memo'#13#10'from FNCashOutMaster '#13#10'UNION ALL' +
      #13#10'select date,code,Recordstate,'#13#10'BillMode,Brief,ClientID, Employ' +
      'eeID ,ClearDate ,'#13#10'AccountsID , 0.00   as AmountD, 0.00 as Amoun' +
      'tC ,'#13#10'AmountRed*ModeDc*ModeC as AmountRed  ,Memo'#13#10'from FNExpense' +
      'Master  ) as a'#13#10'left Outer join FNAccounts b on b.Id=a.AccountsI' +
      'D'#13#10'left Outer join MSEmployee c  on c.Id=a.ClientID'#13#10'left Outer ' +
      'join MSEmployee d  on d.Id=a.EmployeeID'#13#10'where 1=2'#13#10
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
      FieldName = #19994#21153#25688#35201
      Size = 30
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #20511#27454#20154'/'#36824#27454#20154
      Size = 30
    end
    object adsMasterDSDesigner6: TStringField
      FieldName = #32463#25163#20154
      Size = 30
    end
    object adsMasterDSDesigner7: TStringField
      FieldName = #24080#25143#21517#31216
      Size = 40
    end
    object adsMasterDSDesigner8: TBCDField
      FieldName = #21463#27454#37329#39069
      currency = True
      Precision = 19
    end
    object adsMasterDSDesigner9: TBCDField
      FieldName = #20132#27454#37329#39069
      currency = True
      Precision = 19
    end
    object adsMasterDSDesigner10: TBCDField
      FieldName = #20914#24080#37329#39069
      currency = True
      Precision = 19
    end
    object adsMasterDSDesigner11: TBCDField
      FieldName = #24046#39069'/'#20313#39069
      ReadOnly = True
      currency = True
      Precision = 21
    end
    object adsMasterDSDesigner12: TStringField
      FieldName = #22791#27880
      Size = 60
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 112
    Top = 184
  end
end
