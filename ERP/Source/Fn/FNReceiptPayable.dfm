inherited FNReceiptPayableFrom: TFNReceiptPayableFrom
  Left = 36
  Top = 173
  Width = 725
  Height = 558
  Caption = #24212#25910#24212#20184#31649#29702#26597#35810#12290
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
    Height = 490
    inherited PageControl: TPageControl
      Top = 463
      Width = 717
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #24212#25910#24212#20184#31649#29702
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 60
      Width = 717
      Height = 403
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'clientID'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143'/'#21378#21830
          Title.Alignment = taCenter
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24212#25910#24080#27454#20313#39069
          Title.Alignment = taCenter
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24212#20184#24080#27454#20313#39069
          Title.Alignment = taCenter
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24046#39069'/'#20313#39069
          Title.Alignment = taCenter
          Width = 150
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
      'select clientID,b.name as client, b.name as ['#23458#25143'/'#21378#21830'],'#13#10'AmountD as' +
      ' ['#24212#25910#24080#27454#20313#39069'], AmountC as ['#24212#20184#24080#27454#20313#39069'],'#13#10'AmountD-AmountC as ['#24046#39069'/'#20313#39069'], Amo' +
      'untD-AmountC as Balance'#13#10'from ('#13#10'select ClientID,Sum(Isnull(Amou' +
      'ntD,0)) as AmountD,0.00 as AmountC'#13#10'from ('#13#10'select b.clientID,a.' +
      'amount*ModeDc*ModeC as AmountD,b.Recordstate ,b.date'#13#10'from slsal' +
      'edetail a  left outer join SLSaleMaster b on b.ID=a.MasterID'#13#10'Un' +
      'ion'#13#10'select clientID,(AmountD+AmountRed)*ModeDc*ModeC*(-1) as Am' +
      'ountD,Recordstate,date'#13#10'from FNClearSLMaster '#13#10'UNION ALL'#13#10'select' +
      ' b.clientID,a.amount*ModeDc*ModeC*(-1) as AmountD,b.Recordstate ' +
      ',b.date'#13#10'from PcPurchasedetail a  left outer join PcPurchaseMast' +
      'er b on b.ID=a.MasterID'#13#10'UNION ALL'#13#10'select clientID,(AmountC+Amo' +
      'untRed)*ModeDc*ModeC as AmountD,Recordstate,date'#13#10'from FNClearPC' +
      'Master ) as a'#13#10'where 1=2'#13#10'group by ClientID   ) as a '#13#10'left oute' +
      'r join DAClient b on b.ID=a.ClientID'#13#10'where AmountD>0'#13#10'UNION ALL' +
      ' '#13#10'select clientID,b.name as client, b.name as ['#23458#25143'/'#21378#21830'],'#13#10'AmountC' +
      ' as ['#24212#25910#24080#27454#20313#39069'], AmountD*(-1) as ['#24212#20184#24080#27454#20313#39069'],'#13#10'AmountD-AmountC as ['#24046#39069'/' +
      #20313#39069'], AmountD-AmountC as Balance'#13#10'from ('#13#10'select ClientID,Sum(Isn' +
      'ull(AmountD,0)) as AmountD,0.00 as AmountC'#13#10'from ('#13#10'select b.cli' +
      'entID,a.amount*ModeDc*ModeC as AmountD,b.Recordstate ,b.date'#13#10'fr' +
      'om slsaledetail a  left outer join SLSaleMaster b on b.ID=a.Mast' +
      'erID'#13#10'UNION ALL'#13#10'select clientID,(AmountD+AmountRed)*ModeDc*Mode' +
      'C*(-1) as AmountD,Recordstate,date'#13#10'from FNClearSLMaster '#13#10'UNION' +
      ' ALL'#13#10'select b.clientID,a.amount*ModeDc*ModeC*(-1) as AmountD,b.' +
      'Recordstate ,b.date'#13#10'from PcPurchasedetail a  left outer join Pc' +
      'PurchaseMaster b on b.ID=a.MasterID'#13#10'UNION ALL'#13#10'select clientID,' +
      '(AmountC+AmountRed)*ModeDc*ModeC as AmountD,Recordstate,date'#13#10'fr' +
      'om FNClearPCMaster ) as a'#13#10'where 1=2'#13#10'group by ClientID   ) as a' +
      ' '#13#10'left outer join DAClient b on b.ID=a.ClientID'#13#10'where AmountD<' +
      '0'
    Parameters = <>
    Left = 268
    Top = 260
    object adsMasterclientID: TIntegerField
      DisplayLabel = #24207#21495
      FieldName = 'clientID'
      Visible = False
    end
    object adsMasterDSDesigner: TStringField
      FieldName = #23458#25143'/'#21378#21830
      Size = 50
    end
    object adsMasterDSDesigner2: TBCDField
      FieldName = #24212#25910#24080#27454#20313#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 32
      Size = 5
    end
    object adsMasterDSDesigner3: TBCDField
      FieldName = #24212#20184#24080#27454#20313#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 32
      Size = 5
    end
    object adsMasterDSDesigner4: TBCDField
      FieldName = #24046#39069'/'#20313#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 32
      Size = 5
    end
    object adsMasterBalance: TBCDField
      FieldName = 'Balance'
      ReadOnly = True
      Visible = False
      DisplayFormat = '#,#.00'
      Precision = 32
      Size = 5
    end
    object adsMasterclient: TStringField
      FieldName = 'client'
      Visible = False
      Size = 50
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 200
    Top = 264
  end
end
