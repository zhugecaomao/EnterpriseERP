inherited PCPurchaseForeCastForm: TPCPurchaseForeCastForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #37319#36141#20998#26512#39044#27979
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
        Caption = #37319#36141#20998#26512#39044#27979
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 100
      Width = 800
      Height = 385
      TabOrder = 2
      FooterRowCount = 1
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 800
      Height = 100
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 796
        Height = 96
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 0
          Top = 43
          Width = 796
          Height = 53
          Align = alClient
          Caption = #24403#21069#26465#20214
          TabOrder = 1
          object Memo1: TMemo
            Left = 2
            Top = 14
            Width = 558
            Height = 37
            Align = alLeft
            TabOrder = 0
          end
          object RadioGroup3: TRadioGroup
            Left = 560
            Top = 14
            Width = 234
            Height = 37
            Align = alClient
            Caption = #26174#31034#39033#30446
            TabOrder = 1
          end
          object CheckBox4: TCheckBox
            Left = 629
            Top = 29
            Width = 50
            Height = 15
            Caption = #25968#37327
            TabOrder = 2
            OnClick = CheckBox4Click
          end
          object CheckBox5: TCheckBox
            Left = 577
            Top = 28
            Width = 50
            Height = 17
            Caption = #37329#39069
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = CheckBox4Click
          end
          object CheckBox6: TCheckBox
            Left = 679
            Top = 28
            Width = 50
            Height = 17
            Caption = #27611#21033
            Enabled = False
            TabOrder = 4
            OnClick = CheckBox4Click
          end
          object CheckBox7: TCheckBox
            Left = 730
            Top = 28
            Width = 50
            Height = 17
            Caption = #24211#23384
            Checked = True
            State = cbChecked
            TabOrder = 5
            OnClick = CheckBox4Click
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 796
          Height = 43
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 302
            Height = 43
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 0
            object Button2: TButton
              Left = 91
              Top = 9
              Width = 70
              Height = 25
              Caption = #20998#26512#39044#27979
              TabOrder = 1
              OnClick = Button2Click
            end
            object Button3: TButton
              Left = 7
              Top = 9
              Width = 69
              Height = 25
              Caption = #26465#20214#35774#32622
              TabOrder = 0
              OnClick = Button3Click
            end
            object GroupBox2: TGroupBox
              Left = 180
              Top = 0
              Width = 122
              Height = 43
              Align = alRight
              Caption = #24403#21069#26085#26399
              TabOrder = 2
              object DateTimePicker1: TDateTimePicker
                Left = 17
                Top = 15
                Width = 93
                Height = 20
                CalAlignment = dtaLeft
                Date = 37698.7710363426
                Time = 37698.7710363426
                DateFormat = dfShort
                DateMode = dmComboBox
                Kind = dtkDate
                ParseInput = False
                TabOrder = 0
              end
            end
          end
          object Panel6: TPanel
            Left = 302
            Top = 0
            Width = 219
            Height = 43
            Align = alLeft
            BevelOuter = bvNone
            Caption = 'Panel6'
            TabOrder = 1
            object RadioGroup1: TRadioGroup
              Left = 0
              Top = 0
              Width = 219
              Height = 43
              Align = alClient
              Caption = #20998#26512#23545#35937
              TabOrder = 0
            end
            object CheckBox1: TCheckBox
              Left = 13
              Top = 19
              Width = 55
              Height = 15
              Caption = #25353#23458#25143
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = CheckBox1Click
            end
            object CheckBox2: TCheckBox
              Left = 73
              Top = 17
              Width = 55
              Height = 17
              Caption = #25353#21830#21697
              TabOrder = 2
              OnClick = CheckBox1Click
            end
            object CheckBox3: TCheckBox
              Left = 138
              Top = 17
              Width = 68
              Height = 17
              Caption = #25353#19994#21153#21592
              TabOrder = 3
              OnClick = CheckBox1Click
            end
          end
          object Panel7: TPanel
            Left = 521
            Top = 0
            Width = 275
            Height = 43
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object Label1: TLabel
              Left = 215
              Top = 16
              Width = 12
              Height = 12
              Caption = #22825
            end
            object ComboBox1: TComboBox
              Left = 160
              Top = 12
              Width = 47
              Height = 20
              Enabled = False
              ItemHeight = 12
              TabOrder = 0
              Text = '10'
              Items.Strings = (
                '10'
                '15'
                '20'
                '25'
                '30'
                '35'
                '40'
                '45'
                '50'
                '55')
            end
            object RadioGroup2: TRadioGroup
              Left = 0
              Top = 0
              Width = 153
              Height = 43
              Align = alLeft
              Caption = #20998#27573#35774#23450
              TabOrder = 1
            end
            object RadioButton4: TRadioButton
              Left = 10
              Top = 16
              Width = 66
              Height = 17
              Caption = #25353#26376#20998#27573
              Checked = True
              TabOrder = 2
              TabStop = True
              OnClick = RadioButton5Click
            end
            object RadioButton5: TRadioButton
              Left = 80
              Top = 16
              Width = 66
              Height = 17
              Caption = #25353#22825#20998#27573
              TabOrder = 3
              OnClick = RadioButton5Click
            end
          end
        end
      end
    end
    object Panel8: TPanel
      Left = 248
      Top = 224
      Width = 281
      Height = 33
      Caption = #35831#31561#20505','#27491#22312#32479#35745#25968#25454'.....'
      TabOrder = 3
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
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    BeforeOpen = adsMasterBeforeOpen
    AfterOpen = adsMasterAfterOpen
    CommandText = 
      'select c.name ['#23458#25143#21517#31216'], e.name ['#21830#21697#21517#31216'],  '#13#10'Quantity ['#25968#37327'],  Amount [' +
      #37329#39069'], a.QuantityPcs ['#27611#21033'],          '#13#10'd.name ['#19994#21153#32463#21150']'#13#10'from '#13#10'(selec' +
      't  b.Date,b.Code,b.ClientID,b.EmployeeID,'#13#10'b.BillMode,b.ModeDC,b' +
      '.ModeC,b.Brief,'#13#10'a.GoodsID,a.GoodsSpec, a.Quantity, a.QuantityPc' +
      's, a.PackUnitID,'#13#10'a.PriceBase,a.Amount,a.GoalUnitID,a.GoalQuanti' +
      'ty'#13#10'from SLSaleDetail  AS a  '#13#10'LEFT OUTER JOIN SLSalemaster as b' +
      '  on a.MasterID=b.id '#13#10'where 1=1)'#13#10'  AS a  '#13#10'LEFT OUTER JOIN DAC' +
      'lient     as c  on a.ClientID=c.id'#13#10'LEFT OUTER JOIN MSEmployee  ' +
      ' as d  on a.EmployeeID=d.id'#13#10'LEFT OUTER JOIN DAGoods      as e  ' +
      'on a.GoodsID=e.id'#13#10'LEFT OUTER JOIN DAGoodsClass as f  on e.Goods' +
      'ClassID=f.id'#13#10'LEFT OUTER JOIN DAarea       as g  on c.AreaID=g.i' +
      'd'
    Parameters = <>
    Left = 148
    Top = 220
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 272
    Top = 160
  end
  object ADOQuery2: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 272
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 360
    Top = 176
    object N1: TMenuItem
      Caption = #26597#30475#26126#32454#24080
      OnClick = N1Click
    end
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
    Left = 364
    Top = 244
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
    Left = 160
    Top = 176
  end
end
