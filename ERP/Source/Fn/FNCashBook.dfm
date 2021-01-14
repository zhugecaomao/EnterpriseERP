inherited FNCashBookFrom: TFNCashBookFrom
  Left = 50
  Top = 112
  Width = 725
  Height = 533
  Caption = #36164#37329#24080#26412
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnClose = nil
  OnDestroy = nil
  OnDeactivate = FormDeactivate
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
    object ToolButton8: TToolButton
      Left = 236
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 291
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 299
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 717
    Height = 465
    object Splitter1: TSplitter [0]
      Left = 0
      Top = 142
      Width = 717
      Height = 2
      Cursor = crVSplit
      Align = alTop
      OnMoved = Splitter1Moved
    end
    inherited PageControl: TPageControl
      Top = 438
      Width = 717
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #24211#23384#21464#21160#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 144
      Width = 717
      Height = 294
      OnCellClick = DBGridCellClick
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#31867#22411
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#25688#35201
          Title.Alignment = taCenter
          Width = 100
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
          FieldName = #25910#27454#20154'/'#20184#27454#20154
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25910#20837#37329#39069
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25903#20986#37329#39069
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24046#39069'/'#20313#39069
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20973#35777#29366#24577
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 53
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object Label2: TLabel
        Left = 491
        Top = 13
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
        Visible = False
      end
      object Label3: TLabel
        Left = 19
        Top = 20
        Width = 84
        Height = 12
        Caption = #36164#37329#32467#23384#26085#26399#65306
      end
      object DateTimePicker1: TDateTimePicker
        Left = 126
        Top = 16
        Width = 98
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
        Left = 552
        Top = 9
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
        Left = 264
        Top = 14
        Width = 75
        Height = 25
        Caption = #25191#34892#32467#26524
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
    object QLDBGrid1: TQLDBGrid
      Left = 0
      Top = 53
      Width = 717
      Height = 89
      Align = alTop
      DataSource = dsCashBook
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      OnDblClick = QLDBGrid1DblClick
      AlternateColor = 15399421
      CurrencyView.CurrencyTitle = False
      CurrencyView.DigitAlignment = taCenter
      CurrencyView.DigitWidth = 9
      CurrencyView.IntegerSeparateColor = clRed
      CurrencyView.SeparateColor = clSilver
      CurrencyView.ThousandSeparateColor = clGray
      CurrencyView.TitleLines = False
      FooterColor = clWindow
      FooterFont.Charset = GB2312_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -12
      FooterFont.Name = #23435#20307
      FooterFont.Style = []
      FooterRowCount = 1
      OptionsEx = [dgAllowDelete, dgAllowInsert]
      Columns = <
        item
          Expanded = False
          FieldName = #24080#25143#21517#31216
          Title.Alignment = taCenter
          Width = 218
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25910#20837#37329#39069
          Title.Alignment = taCenter
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25903#20986#37329#39069
          Title.Alignment = taCenter
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20313#39069
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24080#25143#31649#29702#21592
          Title.Alignment = taCenter
          Width = 140
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 139
    Top = 245
  end
  inherited DataSource: TDataSource
    DataSet = AdsMsater
    Left = 94
    Top = 242
  end
  object AdsMsater: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select Date ['#26085#26399'],a.code ['#32534#21495'],billmode ['#19994#21153#31867#22411'],'#13#10'brief ['#19994#21153#25688#35201'], b.n' +
      'ame ['#24080#25143#21517#31216'] ,'#13#10'Client ['#25910#27454#20154'/'#20184#27454#20154'],a.RecordState ['#20973#35777#29366#24577'],'#13#10'AmountD ['#25910 +
      #20837#37329#39069'], AmountC ['#25903#20986#37329#39069'],'#13#10'AmountD-AmountC ['#24046#39069'/'#20313#39069']'#13#10'from '#13#10'(select D' +
      'ate,a.code,billmode,brief,b.name as Client,a.RecordState,Account' +
      'sID,  AmountD, AmountC   '#13#10'from FNclearslMaster a left outer joi' +
      'n  daclient b on b.id=a.clientid'#13#10'UNION ALL'#13#10'select Date,a.code,bill' +
      'mode,brief,b.name as Client,a.RecordState,AccountsID,  AmountD, ' +
      'AmountC   '#13#10'from FNclearPCMaster a left outer join  daclient b o' +
      'n b.id=a.clientid'#13#10'UNION ALL'#13#10'select Date,a.code,billmode,brief,b.na' +
      'me as Client,a.RecordState,AccountsID,  AmountD, AmountC   '#13#10'fro' +
      'm FNcashinMaster a left outer join  MSEmployee b on b.id=a.clien' +
      'tid'#13#10'UNION ALL'#13#10'select Date,a.code,billmode,brief,b.name as Client,a' +
      '.RecordState,AccountsID,  AmountD, AmountC   '#13#10'from FNcashoutMas' +
      'ter a left outer join  MSEmployee b on b.id=a.clientid'#13#10'UNION ALL'#13#10's' +
      'elect Date,a.code,billmode,brief,b.name as Client,a.RecordState,' +
      'AccountsID,  0.00, AmountC   '#13#10'from FNExpenseMaster a left outer' +
      ' join  MSEmployee b on b.id=a.clientid'#13#10'UNION ALL'#13#10'select Date,a.cod' +
      'e,billmode,brief,b.name as Client,a.RecordState,AccountsID,  Amo' +
      'untD, AmountC   '#13#10'from FNCashoutInMaster a left outer join  FNAc' +
      'counts b on b.id=a.clientid'#13#10'UNION ALL'#13#10'select Date,a.code,billmode,' +
      'brief,b.name as Client,a.RecordState,AccountsID,  AmountC, Amoun' +
      'tD   '#13#10'from FNCashoutInMaster a left outer join  MSEmployee b on' +
      ' b.id=a.clientid ) '#13#10'as a left outer join FNAccounts b on b.ID=a' +
      '.AccountsID'#13#10'where a.RecordState<>'#39#21024#38500#39'  and 1=2'
    Parameters = <>
    Left = 180
    Top = 244
    object AdsMsaterDSDesigner: TDateTimeField
      FieldName = #26085#26399
    end
    object AdsMsaterDSDesigner2: TStringField
      FieldName = #32534#21495
    end
    object AdsMsaterDSDesigner3: TStringField
      FieldName = #19994#21153#31867#22411
      Size = 16
    end
    object AdsMsaterDSDesigner4: TStringField
      FieldName = #19994#21153#25688#35201
      Size = 30
    end
    object AdsMsaterDSDesigner5: TStringField
      FieldName = #24080#25143#21517#31216
      Size = 40
    end
    object AdsMsaterDSDesigner6: TStringField
      FieldName = #25910#27454#20154'/'#20184#27454#20154
      Size = 50
    end
    object AdsMsaterDSDesigner8: TBCDField
      FieldName = #25910#20837#37329#39069
      currency = True
      Precision = 19
    end
    object AdsMsaterDSDesigner9: TBCDField
      FieldName = #25903#20986#37329#39069
      currency = True
      Precision = 19
    end
    object AdsMsaterDSDesigner10: TBCDField
      FieldName = #24046#39069'/'#20313#39069
      ReadOnly = True
      currency = True
      Precision = 20
    end
    object AdsMsaterDSDesigner7: TStringField
      FieldName = #20973#35777#29366#24577
      Size = 12
    end
  end
  object AdsCashBook: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select a.AccountsID as AccountsID,'#13#10'b.name as ['#24080#25143#21517#31216'], '#13#10'sum(isnu' +
      'll(a.AmountD,0)) as ['#25910#20837#37329#39069'],'#13#10'sum(isnull(a.Amountc,0)) as ['#25903#20986#37329#39069'],' +
      #13#10'sum(isnull(a.AmountD,0))-sum(isnull(a.AmountC,0)) as ['#20313#39069'] ,'#13#10'b' +
      '.AccountManger as ['#24080#25143#31649#29702#21592']'#13#10'from '#13#10'(select Date,RecordState,Accou' +
      'ntsID,  AmountD, AmountC   '#13#10'from FNclearslMaster'#13#10'UNION ALL'#13#10'select' +
      ' Date,RecordState,AccountsID,  AmountD, AmountC   '#13#10'from FNclear' +
      'PCMaster'#13#10'UNION ALL'#13#10'select Date,RecordState,AccountsID,  AmountD, A' +
      'mountC   '#13#10'from FNcashinMaster'#13#10'UNION ALL'#13#10'select Date,RecordState,A' +
      'ccountsID,  AmountD, AmountC   '#13#10'from FNcashoutMaster'#13#10'UNION ALL'#13#10'se' +
      'lect Date,RecordState,AccountsID,  0.00, AmountC   '#13#10'from FNExpe' +
      'nseMaster'#13#10'UNION ALL'#13#10'select Date,RecordState,ClientID as AccountsID' +
      ',  AmountD, AmountC   '#13#10'from FNCashoutInMaster'#13#10'UNION ALL'#13#10'select Da' +
      'te,RecordState,AccountsID,  AmountC, AmountD   '#13#10'from FNCashoutI' +
      'nMaster )  a'#13#10'left outer join FNAccounts b on b.ID=a.AccountsID'#13 +
      #10'where a.RecordState<>'#39#21024#38500#39' AND 1=2'#13#10'Group by b.name,a.AccountsID' +
      ',b.AccountManger'#13#10' '
    Parameters = <>
    Left = 224
    Top = 116
    object AdsCashBookDSDesigner: TStringField
      FieldName = #24080#25143#21517#31216
      Size = 40
    end
    object AdsCashBookDSDesigner2: TBCDField
      FieldName = #25910#20837#37329#39069
      ReadOnly = True
      currency = True
      Precision = 32
    end
    object AdsCashBookDSDesigner3: TBCDField
      FieldName = #25903#20986#37329#39069
      ReadOnly = True
      currency = True
      Precision = 19
    end
    object AdsCashBookDSDesigner4: TBCDField
      FieldName = #20313#39069
      ReadOnly = True
      currency = True
      Precision = 32
    end
    object AdsCashBookDSDesigner5: TStringField
      FieldName = #24080#25143#31649#29702#21592
    end
    object AdsCashBookAccountsID: TIntegerField
      FieldName = 'AccountsID'
      Visible = False
    end
  end
  object dsCashBook: TDataSource
    DataSet = AdsCashBook
    Left = 134
    Top = 114
  end
end
