inherited FNActualCashFrom: TFNActualCashFrom
  Left = 91
  Top = 185
  Width = 812
  Height = 612
  Caption = #36164#37329#21488#24080
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 804
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
    object ClientAccountLiast: TToolButton
      Left = 110
      Top = 2
      Caption = #23545#24080#21333
      ImageIndex = 9
      OnClick = ClientAccountLiastClick
    end
    object ToolButton11: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 173
      Top = 2
      Action = ExportAction
    end
    object ToolButton12: TToolButton
      Left = 228
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 236
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton1: TToolButton
      Left = 291
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton8: TToolButton
      Left = 346
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 401
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 409
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 804
    Height = 544
    inherited PageControl: TPageControl
      Top = 517
      Width = 804
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #36164#37329#31649#29702#21488#24080
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 112
      Width = 804
      Height = 405
      TabOrder = 2
      FooterRowCount = 1
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 804
      Height = 112
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel3: TPanel
        Left = 321
        Top = 2
        Width = 481
        Height = 108
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 481
          Height = 9
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object GroupBox3: TGroupBox
          Left = 89
          Top = 9
          Width = 392
          Height = 99
          Align = alClient
          Caption = #24403#21069#26465#20214
          TabOrder = 1
          object Memo1: TMemo
            Left = 2
            Top = 14
            Width = 388
            Height = 83
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 9
          Width = 89
          Height = 99
          Align = alLeft
          Caption = #26174#31034#39033#30446
          TabOrder = 2
          object CheckBox1: TCheckBox
            Left = 19
            Top = 20
            Width = 60
            Height = 17
            Caption = #25968#37327
            Checked = True
            Enabled = False
            State = cbChecked
            TabOrder = 0
          end
          object CheckBox2: TCheckBox
            Left = 19
            Top = 44
            Width = 60
            Height = 17
            Caption = #21333#20215
            Checked = True
            Enabled = False
            State = cbChecked
            TabOrder = 1
          end
          object CheckBox3: TCheckBox
            Left = 19
            Top = 68
            Width = 60
            Height = 17
            Caption = #37329#39069
            Checked = True
            Enabled = False
            State = cbChecked
            TabOrder = 2
          end
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 319
        Height = 108
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Button3: TButton
          Left = 162
          Top = 9
          Width = 62
          Height = 19
          Caption = #26465#20214#35774#32622
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button1: TButton
          Left = 18
          Top = 9
          Width = 62
          Height = 19
          Caption = #26126#32454#26597#35810
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 90
          Top = 9
          Width = 62
          Height = 19
          Caption = #32479#35745#27719#24635
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button4: TButton
          Left = 234
          Top = 9
          Width = 62
          Height = 19
          Caption = #39640#32423'..'
          TabOrder = 3
          OnClick = Button4Click
        end
        object ExpSttcGroupBox: TGroupBox
          Left = 0
          Top = 35
          Width = 319
          Height = 73
          Align = alBottom
          Caption = #36873#23450#27719#24635#39033#30446
          TabOrder = 4
          object ExpSttcCheckListBox: TCheckListBox
            Left = 2
            Top = 14
            Width = 315
            Height = 57
            OnClickCheck = ExpSttcCheckListBoxClickCheck
            Align = alClient
            ItemHeight = 12
            PopupMenu = ExpSttcCkBxPopMenu
            TabOrder = 0
          end
        end
      end
    end
    object Panel6: TPanel
      Left = 248
      Top = 224
      Width = 281
      Height = 33
      Caption = #35831#31561#20505','#27491#22312#32479#35745#25968#25454'.....'
      TabOrder = 3
      Visible = False
    end
    object VipsetPanel: TPanel
      Left = 272
      Top = 114
      Width = 267
      Height = 177
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 4
      Visible = False
      object Label1: TLabel
        Left = 27
        Top = 22
        Width = 60
        Height = 12
        Caption = #23545#24080#26102#27573#65306
      end
      object DateTimePicker1: TDateTimePicker
        Left = 27
        Top = 47
        Width = 97
        Height = 20
        CalAlignment = dtaLeft
        Date = 37778.5991154051
        Time = 37778.5991154051
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
        OnCloseUp = DateTimePicker1Exit
        OnExit = DateTimePicker1Exit
      end
      object DateTimePicker2: TDateTimePicker
        Left = 147
        Top = 47
        Width = 97
        Height = 20
        CalAlignment = dtaLeft
        Date = 37778.5992550231
        Time = 37778.5992550231
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        OnCloseUp = DateTimePicker2Exit
        OnExit = DateTimePicker2Exit
      end
      object Button5: TButton
        Left = 44
        Top = 139
        Width = 73
        Height = 21
        Caption = #30830#23450
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 148
        Top = 139
        Width = 73
        Height = 21
        Caption = #21462#28040
        TabOrder = 3
        OnClick = Button6Click
      end
      object ShowExpenseCkBx: TCheckBox
        Left = 27
        Top = 79
        Width = 97
        Height = 17
        Caption = #21442#32771#21516#26399#36153#29992
        Enabled = False
        TabOrder = 4
      end
      object ShowClientCostCkBx: TCheckBox
        Left = 27
        Top = 108
        Width = 97
        Height = 13
        Caption = #21442#32771#23458#25143#25104#26412
        Enabled = False
        TabOrder = 5
      end
      object EmployeeCostCkBx: TCheckBox
        Left = 152
        Top = 79
        Width = 97
        Height = 17
        Caption = #21442#32771#21592#24037#25104#26412
        Enabled = False
        TabOrder = 6
      end
      object GoodsStockCkBx: TCheckBox
        Left = 152
        Top = 106
        Width = 97
        Height = 17
        Caption = #21442#32771#21830#21697#24211#23384
        Enabled = False
        TabOrder = 7
      end
    end
  end
  object DBGrid1: TDBGrid [2]
    Left = 80
    Top = 330
    Width = 699
    Height = 198
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    Visible = False
  end
  inherited ActionList: TActionList
    Left = 80
    Top = 218
    object ListClientSaleAct: TAction
      Caption = #24403#21069#24080#25143#26126#32454
      Hint = #26174#31034#24403#21069#24080#25143#25910#25903#26126#32454#24773#20917#12290
      ImageIndex = 14
      ShortCut = 16459
      OnExecute = ListClientSaleActExecute
    end
    object ListGoodsSaleAct: TAction
      Caption = #24403#21069#24065#31181#26126#32454
      Hint = #26174#31034#24403#21069#24065#31181#26126#32454#26126#32454#25910#25903#24773#20917#12290
      ImageIndex = 14
      ShortCut = 16455
      OnExecute = ListGoodsSaleActExecute
    end
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 46
    Top = 218
  end
  inherited WsBrowsePop: TPopupMenu
    Left = 115
    Top = 218
    object ListClientSale: TMenuItem
      Action = ListClientSaleAct
    end
    object ListGoodsSale: TMenuItem
      Action = ListGoodsSaleAct
    end
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    BeforeOpen = adsMasterBeforeOpen
    AfterOpen = adsMasterAfterOpen
    CommandText = 
      'select top 1 c.name ['#23458#25143#21517#31216'], e.name ['#21830#21697#21517#31216'],  '#13#10'Quantity ['#25968#37327'],  Am' +
      'ount ['#37329#39069'], a.QuantityPcs ['#27611#21033'],          '#13#10'd.name ['#19994#21153#32463#21150']'#13#10'from '#13#10 +
      '(select  b.Date,b.Code,b.ClientID,b.EmployeeID,'#13#10'b.BillMode,b.Mo' +
      'deDC,b.ModeC,b.Brief,'#13#10'a.GoodsID,a.GoodsSpec, a.Quantity, a.Quan' +
      'tityPcs, a.PackUnitID,'#13#10'a.PriceBase,a.Amount,a.GoalUnitID,a.Goal' +
      'Quantity'#13#10'from SLSaleDetail  AS a  '#13#10'LEFT OUTER JOIN SLSalemaste' +
      'r as b  on a.MasterID=b.id '#13#10'where 1=1)'#13#10'  AS a  '#13#10'LEFT OUTER JO' +
      'IN DAClient     as c  on a.ClientID=c.id'#13#10'LEFT OUTER JOIN MSEmpl' +
      'oyee   as d  on a.EmployeeID=d.id'#13#10'LEFT OUTER JOIN DAGoods      ' +
      'as e  on a.GoodsID=e.id'#13#10'LEFT OUTER JOIN DAGoodsClass as f  on e' +
      '.GoodsClassID=f.id'#13#10'LEFT OUTER JOIN DAarea       as g  on c.Area' +
      'ID=g.id'
    Parameters = <>
    Left = 149
    Top = 218
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 86
    Top = 271
  end
  object ADOQuery2: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 168
    Top = 271
  end
  object TempAds: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Left = 46
    Top = 271
  end
  object WNADOCQuery1: TWNADOCQuery
    AutoLogin = True
    Field.Strings = (
      #26085#26399'=Date'
      #32534#21495'=Code'
      #19994#21153#31867#21035'=BillMode'
      #19994#21153#25688#35201'=Brief'
      #23458#25143#21517#31216'=Client'
      #22320#21306'=DAArea'
      #21830#21697#31867#21035'=GoodsClass'
      #21830#21697#21517#31216'=Goods'
      #35268#26684#22411#21495'=GoodsSpec'
      #21333#20301'=Unit'
      #25968#37327'=GoalQuantity'
      #21333#20215'=PriceBase'
      #37329#39069'=Amount'
      #19994#21153#32463#21150'=Employee')
    DateSeperate = #39
    Left = 127
    Top = 271
  end
  object ExpSttcCkBxPopMenu: TPopupMenu
    Left = 184
    Top = 218
    object N1: TMenuItem
      Caption = #25490#24207
      OnClick = N1Click
    end
    object N4: TMenuItem
      Caption = #20840#28165
      OnClick = N4Click
    end
    object N2: TMenuItem
      Caption = #21453#36873
      OnClick = N2Click
    end
    object N3: TMenuItem
      Caption = #20840#36873
      OnClick = N3Click
    end
  end
  object DataSource1: TDataSource
    DataSet = adsMaster
    Left = 590
    Top = 226
  end
  object AccountListQry: TADOQuery
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select  '
      'Date  ['#26085#26399'],Code ['#32534#21495'],'
      'BillMode  ['#19994#21153#31867#21035'],'
      'AmountD ['#25910#20837#26412#24065#37329#39069'],'
      'AmountD ['#25910#20837#27719#29575'],'
      'AmountD ['#25910#20837#21407#24065#37329#39069'],'
      'AmountD ['#25903#20986#26412#24065#37329#39069'],'
      'AmountD ['#25903#20986#27719#29575'],'
      'AmountD ['#25903#20986#21407#24065#37329#39069'],'
      'AmountD ['#26412#24065#20313#39069'],'
      'AmountD ['#32467#23384#27719#29575'],'
      'AmountD ['#21407#24065#20313#39069'],'
      'Memo  ['#22791#27880']  '
      'from  dbo.FNCashExchangeMaster  '
      'where 1=2')
    Left = 536
    Top = 287
    object AccountListQryDSDesigner: TDateTimeField
      FieldName = #26085#26399
    end
    object AccountListQryDSDesigner2: TStringField
      FieldName = #32534#21495
    end
    object AccountListQryDSDesigner3: TStringField
      FieldName = #19994#21153#31867#21035
      Size = 16
    end
    object AccountListQryDSDesigner4: TBCDField
      FieldName = #25910#20837#26412#24065#37329#39069
      DisplayFormat = '#,#.00'
      EditFormat = '#.##'
      Precision = 19
    end
    object AccountListQryDSDesigner7: TBCDField
      FieldName = #25903#20986#26412#24065#37329#39069
      DisplayFormat = '#,#.00'
      EditFormat = '#.##'
      Precision = 19
    end
    object AccountListQryDSDesigner10: TBCDField
      FieldName = #26412#24065#20313#39069
      DisplayFormat = '#,#.00'
      EditFormat = '#.##'
      Precision = 19
    end
    object AccountListQryDSDesigner13: TStringField
      FieldName = #22791#27880
      Size = 60
    end
  end
end
