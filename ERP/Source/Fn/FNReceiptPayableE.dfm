inherited FNReceiptPayableEFrom: TFNReceiptPayableEFrom
  Left = 88
  Top = 197
  Width = 725
  Height = 545
  Caption = #20854#23427#24212#25910#24212#20184#31649#29702
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
    Height = 477
    inherited PageControl: TPageControl
      Top = 450
      Width = 717
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #20854#23427#24212#25910#24212#20184#31649#29702
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 60
      Width = 717
      Height = 390
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #24207#21495
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32844#21592#22995#21517
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20854#23427#24212#25910#20313#39069
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20854#23427#24212#20184#20313#39069
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24046#39069'/'#20313#39069
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 60
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object Label1: TLabel
        Left = 26
        Top = 29
        Width = 48
        Height = 12
        Caption = #26597#35810#26085#26399
      end
      object Label2: TLabel
        Left = 194
        Top = 29
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
        Visible = False
      end
      object DateTimePicker1: TDateTimePicker
        Left = 83
        Top = 25
        Width = 100
        Height = 20
        CalAlignment = dtaLeft
        Date = 37596.1952293866
        Time = 37596.1952293866
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object DateTimePicker2: TDateTimePicker
        Left = 255
        Top = 25
        Width = 100
        Height = 20
        CalAlignment = dtaLeft
        Date = 37596.1954960764
        Time = 37596.1954960764
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        Visible = False
      end
      object BitBtn1: TBitBtn
        Left = 383
        Top = 23
        Width = 75
        Height = 25
        Caption = #25191#34892#32467#26524
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
  end
  inherited ActionList: TActionList
    Left = 147
    Top = 261
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 46
    Top = 218
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select clientID, clientID as ['#24207#21495'], '#13#10'B.name as name , B.name as ' +
      '['#32844#21592#22995#21517'],AmountD as ['#20854#23427#24212#25910#20313#39069'], '#13#10' AmountC as ['#20854#23427#24212#20184#20313#39069'], AmountD-Amou' +
      'ntC as ['#24046#39069'/'#20313#39069'] ,'#13#10'AmountD-AmountC as balance    from ('#13#10'select c' +
      'lientID,AmountD,0.00 as amountC'#13#10'from ('#13#10'select clientID,sum(Isn' +
      'ull(AmountD,0))-sum(Isnull(AmountC,0))'#13#10'as AmountD from ('#13#10'selec' +
      't clientID, 0.00 as AmountD, (AmountD+AmountRed)* '#13#10'ModeDc*ModeC' +
      ' as AmountC, '#13#10'Recordstate ,date  from FNCashInMaster '#13#10'UNION AL' +
      'L '#13#10'select clientID,(AmountC+AmountRed)*ModeDc*ModeC  as AmountD' +
      ', '#13#10'0.00  as AmountC, Recordstate ,date from FNCashOutMaster '#13#10'U' +
      'NION ALL  '#13#10'select clientID, 0.00 as AmountD, (AmountRed)*ModeDc' +
      '*ModeC '#13#10'as AmountC, Recordstate ,date from FNExpenseMaster ) as' +
      ' a'#13#10'where 1=1'#13#10'Group by ClientID  ) as a'#13#10'where AmountD>0'#13#10'UNION' +
      ' ALL '#13#10'select clientID,0.00 as AmountD ,AmountD*(-1) as amountC'#13 +
      #10'from ('#13#10'select clientID,sum(Isnull(AmountD,0))-sum(Isnull(Amoun' +
      'tC,0))'#13#10'as AmountD from ('#13#10'select clientID, 0.00 as AmountD, (Am' +
      'ountD+AmountRed)* '#13#10'ModeDc*ModeC as AmountC, '#13#10'Recordstate ,date' +
      '  from FNCashInMaster '#13#10'UNION ALL '#13#10'select clientID,(AmountC+Amo' +
      'untRed)*ModeDc*ModeC  as AmountD, '#13#10'0.00  as AmountC, Recordstat' +
      'e ,date from FNCashOutMaster '#13#10'UNION ALL  '#13#10'select clientID, 0.0' +
      '0 as AmountD, (AmountRed)*ModeDc*ModeC '#13#10'as AmountC, Recordstate' +
      ' ,date from FNExpenseMaster ) as a'#13#10'where 1=1'#13#10'Group by ClientID' +
      '  ) as a'#13#10'where AmountD<0 ) as a'#13#10'left outer join MSEmployee b o' +
      'n b.ID=A.ClientID'#13#10'where 1=3'
    Parameters = <>
    Left = 268
    Top = 260
    object adsMasterclientID: TIntegerField
      FieldName = 'clientID'
      Visible = False
    end
    object adsMastername: TStringField
      FieldName = 'name'
      Visible = False
      Size = 30
    end
    object adsMasterDSDesigner: TIntegerField
      FieldName = #24207#21495
    end
    object adsMasterDSDesigner2: TStringField
      FieldName = #32844#21592#22995#21517
      Size = 30
    end
    object adsMasterDSDesigner3: TBCDField
      FieldName = #20854#23427#24212#25910#20313#39069
      currency = True
      Precision = 32
    end
    object adsMasterDSDesigner4: TBCDField
      FieldName = #20854#23427#24212#20184#20313#39069
      currency = True
      Precision = 32
    end
    object adsMasterDSDesigner5: TBCDField
      FieldName = #24046#39069'/'#20313#39069
      ReadOnly = True
      currency = True
      Precision = 32
    end
    object adsMasterbalance: TBCDField
      FieldName = 'balance'
      ReadOnly = True
      Precision = 32
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 200
    Top = 264
  end
end
