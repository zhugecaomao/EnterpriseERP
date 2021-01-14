inherited FNExpenseSttcForm: TFNExpenseSttcForm
  Left = 3
  Top = 109
  Width = 808
  Height = 580
  Caption = #36153#29992#21488#24080
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 800
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
    Width = 800
    Height = 512
    inherited PageControl: TPageControl
      Top = 485
      Width = 800
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #36153#29992#25511#21046#21488#24080
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 118
      Width = 800
      Height = 367
      TabOrder = 2
      FooterRowCount = 1
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 800
      Height = 118
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel3: TPanel
        Left = 443
        Top = 2
        Width = 355
        Height = 114
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 355
          Height = 9
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 9
          Width = 355
          Height = 105
          Align = alClient
          Caption = #24403#21069#26465#20214
          TabOrder = 1
          object Memo1: TMemo
            Left = 2
            Top = 14
            Width = 351
            Height = 89
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 365
        Height = 114
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Button3: TButton
          Left = 222
          Top = 9
          Width = 60
          Height = 19
          Caption = #26465#20214#35774#32622
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button1: TButton
          Left = 18
          Top = 9
          Width = 60
          Height = 19
          Caption = #26126#32454#26597#35810
          TabOrder = 0
          OnClick = Button1Click
        end
        object Button2: TButton
          Left = 86
          Top = 9
          Width = 60
          Height = 19
          Caption = #32479#35745#27719#24635
          TabOrder = 1
          OnClick = Button2Click
        end
        object Button4: TButton
          Left = 290
          Top = 9
          Width = 60
          Height = 19
          Caption = #39640#32423'..'
          TabOrder = 3
          OnClick = Button4Click
        end
        object ExpSttcGroupBox: TGroupBox
          Left = 0
          Top = 32
          Width = 365
          Height = 82
          Align = alBottom
          Caption = #36873#23450#27719#24635#39033#30446
          TabOrder = 4
          object ExpSttcCheckListBox: TCheckListBox
            Left = 2
            Top = 14
            Width = 361
            Height = 66
            OnClickCheck = ExpSttcCheckListBoxClickCheck
            Align = alClient
            ItemHeight = 12
            PopupMenu = ExpSttcCkBxPopMenu
            TabOrder = 0
          end
        end
        object Button7: TButton
          Left = 154
          Top = 9
          Width = 60
          Height = 19
          Caption = #31227#21160#27719#24635
          TabOrder = 5
          OnClick = Button7Click
        end
      end
      object GroupBox1: TGroupBox
        Left = 367
        Top = 2
        Width = 75
        Height = 114
        Align = alLeft
        Caption = #26174#31034#39033#30446
        TabOrder = 2
        object CheckBox1: TCheckBox
          Left = 19
          Top = 20
          Width = 42
          Height = 17
          Caption = #25968#37327
          TabOrder = 0
        end
        object CheckBox2: TCheckBox
          Left = 19
          Top = 44
          Width = 42
          Height = 17
          Caption = #21333#20215
          TabOrder = 1
        end
        object CheckBox3: TCheckBox
          Left = 19
          Top = 68
          Width = 42
          Height = 17
          Caption = #37329#39069
          Checked = True
          State = cbChecked
          TabOrder = 2
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
      Top = 120
      Width = 265
      Height = 185
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
        Top = 40
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
        Top = 40
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
        Left = 36
        Top = 152
        Width = 73
        Height = 21
        Caption = #30830#23450
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 164
        Top = 152
        Width = 73
        Height = 21
        Caption = #21462#28040
        TabOrder = 3
        OnClick = Button6Click
      end
      object PeriodRadioGroup: TRadioGroup
        Left = 27
        Top = 72
        Width = 217
        Height = 69
        Caption = #31227#21160#21608#26399
        TabOrder = 4
      end
      object PeriodMonthRadioButton: TRadioButton
        Left = 34
        Top = 90
        Width = 57
        Height = 17
        Caption = #26376#24230
        Checked = True
        TabOrder = 5
        TabStop = True
        OnClick = PeriodMonthRadioButtonClick
      end
      object PeriodDaysRadioButton: TRadioButton
        Left = 34
        Top = 115
        Width = 57
        Height = 17
        Caption = #22825#25968
        TabOrder = 6
        OnClick = PeriodMonthRadioButtonClick
      end
      object PeriodMonthComboBox: TComboBox
        Left = 106
        Top = 88
        Width = 104
        Height = 20
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 7
        Text = '1'
        Items.Strings = (
          '1'
          '2'
          '3'
          '4'
          '5'
          '6'
          '7'
          '8'
          '9'
          '10'
          '11'
          '12')
      end
      object PeriodDaysComboBox: TComboBox
        Left = 106
        Top = 113
        Width = 104
        Height = 20
        Enabled = False
        ItemHeight = 12
        ItemIndex = 0
        TabOrder = 8
        Text = '7'
        Items.Strings = (
          '7'
          '10'
          '15'
          '20'
          '25'
          '30'
          '40'
          '45'
          '50'
          '55'
          '60')
      end
      object StaticText1: TStaticText
        Left = 214
        Top = 91
        Width = 16
        Height = 16
        Caption = #26376
        TabOrder = 9
      end
      object StaticText2: TStaticText
        Left = 214
        Top = 115
        Width = 16
        Height = 16
        Caption = #22825
        TabOrder = 10
      end
    end
  end
  inherited ActionList: TActionList
    Left = 80
    Top = 218
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 46
    Top = 218
  end
  inherited WsBrowsePop: TPopupMenu
    Left = 115
    Top = 218
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
    CommandText = 
      'select  ClientID,c.name  ,b.name Client,c.name Employee,'#13#10'   Sun' +
      'dryFee PeriodA, SundryFee PeriodB, '#13#10'   SundryFee PeriodC,  Sund' +
      'ryFee PeriodD,   '#13#10'   SundryFee PeriodE,  SundryFee PeriodF,    ' +
      #13#10'   SundryFee PeriodG,  SundryFee  PeriodTTL '#13#10'from SLSalemaste' +
      'r  AS A  '#13#10'LEFT OUTER JOIN DAClient as b  on a.ClientID=b.id '#13#10'L' +
      'EFT OUTER JOIN MSEmployee as c  on a.EmployeeID=c.id'#13#10'where 1=3'#13 +
      #10
    Parameters = <>
    Left = 46
    Top = 271
    object StringField1: TStringField
      FieldName = 'Client'
      Size = 50
    end
    object StringField2: TStringField
      FieldName = 'Employee'
      Size = 30
    end
    object BCDField1: TBCDField
      FieldName = 'PeriodA'
      currency = True
      Precision = 19
      Size = 5
    end
    object BCDField2: TBCDField
      FieldName = 'PeriodB'
      currency = True
      Precision = 19
      Size = 5
    end
    object BCDField3: TBCDField
      FieldName = 'PeriodC'
      currency = True
      Precision = 19
      Size = 5
    end
    object BCDField4: TBCDField
      FieldName = 'PeriodD'
      currency = True
      Precision = 19
      Size = 5
    end
    object BCDField5: TBCDField
      FieldName = 'PeriodE'
      currency = True
      Precision = 19
      Size = 5
    end
    object BCDField6: TBCDField
      FieldName = 'PeriodF'
      currency = True
      Precision = 19
      Size = 5
    end
    object BCDField7: TBCDField
      FieldName = 'PeriodG'
      currency = True
      Precision = 19
      Size = 5
    end
    object BCDField8: TBCDField
      FieldName = 'PeriodTTL'
      currency = True
      Precision = 19
      Size = 5
    end
    object IntegerField1: TIntegerField
      FieldName = 'ClientID'
    end
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
end
