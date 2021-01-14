inherited EGMaterialChangeForm: TEGMaterialChangeForm
  Left = 55
  Top = 161
  Width = 808
  Height = 580
  Caption = #39033#30446#26448#26009#21464#21160
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
    Width = 800
    Height = 512
    inherited PageControl: TPageControl
      Top = 485
      Width = 800
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #26448#26009#24211#23384#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 103
      Width = 800
      Height = 382
      TabOrder = 2
      CurrencyView.CurrencyTitle = True
      CurrencyView.TitleLines = True
      FooterRowCount = 1
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 800
      Height = 103
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel3: TPanel
        Left = 441
        Top = 2
        Width = 357
        Height = 99
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 357
          Height = 9
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 9
          Width = 357
          Height = 90
          Align = alClient
          Caption = #24403#21069#26465#20214
          TabOrder = 1
          object Memo1: TMemo
            Left = 2
            Top = 14
            Width = 353
            Height = 74
            Align = alClient
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      object Panel5: TPanel
        Left = 2
        Top = 2
        Width = 439
        Height = 99
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 11
          Width = 48
          Height = 12
          Caption = #24320#22987#26085#26399
        end
        object Label2: TLabel
          Left = 16
          Top = 35
          Width = 48
          Height = 12
          Caption = #25130#27490#26085#26399
        end
        object Button3: TButton
          Left = 320
          Top = 20
          Width = 70
          Height = 25
          Caption = #26465#20214#35774#32622
          TabOrder = 1
          OnClick = Button3Click
        end
        object Button2: TButton
          Left = 219
          Top = 20
          Width = 70
          Height = 25
          Caption = #27719#24635#21464#21160
          TabOrder = 0
          OnClick = Button2Click
        end
        object Panel7: TPanel
          Left = 0
          Top = 58
          Width = 439
          Height = 41
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 2
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 267
            Height = 41
            Align = alLeft
            Caption = #27719#24635#39033#30446
            TabOrder = 0
            object CheckBox1: TCheckBox
              Left = 17
              Top = 18
              Width = 55
              Height = 15
              Hint = #25353#20179#24211#27719#24635
              Caption = #25353#20179#24211
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 0
              OnClick = CheckBox1Click
              OnExit = CheckBox1Click
            end
            object CheckBox2: TCheckBox
              Left = 77
              Top = 18
              Width = 55
              Height = 15
              Hint = #25353#26448#26009
              Caption = #25353#26448#26009
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 1
              OnClick = CheckBox1Click
              OnExit = CheckBox1Click
            end
            object CheckBox3: TCheckBox
              Left = 138
              Top = 18
              Width = 55
              Height = 15
              Hint = #25353#26448#26009#31867#21035#27719#24635
              Caption = #26448#26009#31867
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 2
              OnClick = CheckBox1Click
              OnExit = CheckBox1Click
            end
            object CheckBox4: TCheckBox
              Left = 199
              Top = 18
              Width = 55
              Height = 15
              Hint = #25353#19994#21153#31867#21035#27719#24635
              Caption = #19994#21153#31867
              Checked = True
              ParentShowHint = False
              ShowHint = True
              State = cbChecked
              TabOrder = 3
              OnClick = CheckBox1Click
              OnExit = CheckBox1Click
            end
          end
          object GroupBox2: TGroupBox
            Left = 265
            Top = 0
            Width = 174
            Height = 41
            Align = alRight
            Caption = #26174#31034#39033#30446
            TabOrder = 1
            object ShowCheckBox1: TCheckBox
              Left = 18
              Top = 17
              Width = 50
              Height = 15
              Caption = #37329#39069
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = CheckBox1Click
              OnExit = CheckBox1Click
            end
            object ShowCheckBox2: TCheckBox
              Left = 70
              Top = 16
              Width = 50
              Height = 17
              Caption = #25968#37327
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = CheckBox1Click
              OnExit = CheckBox1Click
            end
            object ShowCheckBox3: TCheckBox
              Left = 123
              Top = 16
              Width = 45
              Height = 17
              Caption = #21333#20215
              Checked = True
              State = cbChecked
              TabOrder = 2
              OnClick = CheckBox1Click
              OnExit = CheckBox1Click
            end
          end
        end
        object DateTimePicker1: TDateTimePicker
          Left = 71
          Top = 7
          Width = 109
          Height = 20
          CalAlignment = dtaLeft
          Date = 37758.0247378472
          Time = 37758.0247378472
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 3
          OnChange = DateTimePicker1Change
        end
        object DateTimePicker2: TDateTimePicker
          Left = 71
          Top = 31
          Width = 109
          Height = 20
          CalAlignment = dtaLeft
          Date = 37758.0249210995
          Time = 37758.0249210995
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 4
        end
      end
    end
    object Panel6: TPanel
      Left = 248
      Top = 224
      Width = 281
      Height = 33
      Caption = #35831#31561#20505','#27491#22312#32479#35745#21488#24080#25968#25454'.....'
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
  inherited WsBrowsePop: TPopupMenu
    Top = 168
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    BeforeOpen = adsMasterBeforeOpen
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
      'd'#13#10'where 1=3'#13#10
    Parameters = <>
    Left = 148
    Top = 220
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 256
    Top = 224
  end
  object ADOQuery2: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 192
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 304
    Top = 224
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
    Left = 356
    Top = 228
  end
  object WNADOCQuery1: TWNADOCQuery
    AutoLogin = True
    Field.Strings = (
      #32534#21495'=Code'
      #19994#21153#31867#21035'=BillMode'
      #19994#21153#25688#35201'=Brief'
      #26448#26009#31867#21035'=GoodsClass'
      #26448#26009#21517#31216'=Goods'
      #26448#26009#20179#24211'=WareHouse'
      #21333#20301'=Unit'
      #26469#26009#21333#20301'=Client'
      #29992#26009#39033#30446'=ProjectName'
      #19994#21153#32463#21150'=Employee')
    DateSeperate = #39
    Left = 144
    Top = 168
  end
end
