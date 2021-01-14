inherited EGProjectCostSTTForm: TEGProjectCostSTTForm
  Left = 5
  Top = 72
  Width = 812
  Height = 580
  Caption = #39033#30446#25104#26412#31649#29702
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
    Top = 137
    Width = 804
    Height = 416
    inherited PageControl: TPageControl
      Top = 389
      Width = 804
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #39033#30446#25104#26412#31649#29702
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 103
      Width = 804
      Height = 286
      TabOrder = 2
      FooterRowCount = 1
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 804
      Height = 103
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 1
      object Panel3: TPanel
        Left = 406
        Top = 2
        Width = 396
        Height = 99
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 396
          Height = 9
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 9
          Width = 396
          Height = 90
          Align = alClient
          Caption = #24403#21069#26465#20214
          TabOrder = 1
          object Memo1: TMemo
            Left = 2
            Top = 14
            Width = 392
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
        Width = 404
        Height = 99
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object Button3: TButton
          Left = 248
          Top = 17
          Width = 75
          Height = 25
          Caption = #26465#20214#35774#32622
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button1: TButton
          Tag = 1
          Left = 40
          Top = 17
          Width = 75
          Height = 25
          Caption = #26126#32454#21488#24080
          TabOrder = 0
          OnClick = Button1Click
        end
        object GroupBox1: TGroupBox
          Left = 0
          Top = 51
          Width = 404
          Height = 48
          Align = alBottom
          Caption = #27719#24635#39033#30446
          TabOrder = 3
          object CheckBox1: TCheckBox
            Left = 22
            Top = 20
            Width = 55
            Height = 15
            Hint = #25353#39033#30446#21517#31216#27719#24635
            Caption = #25353#39033#30446
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBox1Click
            OnExit = CheckBox1Click
          end
          object CheckBox2: TCheckBox
            Left = 88
            Top = 19
            Width = 55
            Height = 17
            Hint = #25353#39033#30446#28040#32791#26448#26009#21517#31216#27719#24635
            Caption = #25353#26448#26009
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = CheckBox1Click
            OnExit = CheckBox1Click
          end
          object CheckBox3: TCheckBox
            Left = 155
            Top = 19
            Width = 55
            Height = 17
            Hint = #25353#39033#30446#28040#32791#26448#26009#31867#21035#27719#24635
            Caption = #26448#26009#31867
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = CheckBox1Click
            OnExit = CheckBox1Click
          end
          object CheckBox4: TCheckBox
            Left = 222
            Top = 19
            Width = 55
            Height = 17
            Hint = #25353#39033#30446#36153#29992#21517#31216#27719#24635
            Caption = #25353#36153#29992
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            OnClick = CheckBox1Click
            OnExit = CheckBox1Click
          end
          object CheckBox5: TCheckBox
            Left = 289
            Top = 19
            Width = 55
            Height = 17
            Hint = #25353#39033#30446#19994#21153#21592#27719#24635
            Caption = #19994#21153#21592
            ParentShowHint = False
            ShowHint = True
            TabOrder = 4
            OnClick = CheckBox1Click
            OnExit = CheckBox1Click
          end
        end
        object Button2: TButton
          Left = 144
          Top = 17
          Width = 75
          Height = 25
          Caption = #27719#24635#21488#24080
          TabOrder = 1
          OnClick = Button2Click
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
  object ProCostPanel7: TPanel [2]
    Left = 0
    Top = 41
    Width = 804
    Height = 96
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object ProCostPanel8: TPanel
      Left = 0
      Top = 0
      Width = 89
      Height = 96
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 18
        Top = 19
        Width = 48
        Height = 12
        Caption = #39033#30446#24635#34920
      end
      object SpeedButton1: TSpeedButton
        Left = 9
        Top = 45
        Width = 68
        Height = 22
        Caption = #23548#20986
        OnClick = SpeedButton1Click
      end
    end
    object DBGrid1: TQLDBGrid
      Left = 89
      Top = 0
      Width = 715
      Height = 96
      Align = alClient
      Color = clHighlightText
      DataSource = dsProjectList
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 1
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      AlternateColor = clWindow
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
      FooterRowCount = 0
      OptionsEx = [dgEnterToTab, dgAllowDelete, dgAllowInsert, dgControlArrowKeys, dgAutoWidth]
      Columns = <
        item
          Expanded = False
          FieldName = #39033#30446#21517#31216
          Title.Alignment = taCenter
          Width = 214
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26448#26009#37329#39069
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#26448#26009#37329#39069
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36153#29992#37329#39069
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#36153#29992#37329#39069
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #39033#30446#21512#35745
          Title.Alignment = taCenter
          Title.Caption = #39033#30446#25104#26412#21512#35745
          Width = 162
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 223
    Top = 312
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 173
    Top = 312
  end
  inherited WsBrowsePop: TPopupMenu
    Left = 72
    Top = 312
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
    Left = 274
    Top = 312
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 375
    Top = 312
  end
  object ADOQuery2: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 324
    Top = 312
  end
  object PopupMenu1: TPopupMenu
    Left = 425
    Top = 312
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
    Left = 476
    Top = 312
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
      #39033#30446#21517#31216'=Client'
      #26448#26009#31867#21035'=GoodsClass'
      #26448#26009#21517#31216'=Goods'
      #36153#29992#21517#31216'=Expense'
      #36153#29992#37329#39069'=ExpenseAmount'
      #26448#26009#20179#24211'=WareHouse'
      #35268#26684#22411#21495'=GoodsSpec'
      #21333#20301'=Unit'
      #26448#26009#25968#37327'=GoalQuantity'
      #26448#26009#21333#20215'=PriceBase'
      #26448#26009#37329#39069'=Amount'
      #19994#21153#32463#21150'=Employee')
    DateSeperate = #39
    Left = 122
    Top = 312
  end
  object AdsProjectList: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select Name ['#39033#30446#21517#31216'],'#13#10#39'       -        '#39' as ['#26448#26009#37329#39069'],'#13#10#39'       -   ' +
      '     '#39' as ['#36153#29992#37329#39069'],'#13#10#39'       -        '#39' as ['#39033#30446#21512#35745']'#13#10'from DAProjectC' +
      'lass'#13#10'where RecordState<>'#39#21024#38500#39' and '#13#10'1=3'
    Parameters = <>
    Left = 156
    Top = 84
  end
  object dsProjectList: TDataSource
    DataSet = AdsProjectList
    Left = 118
    Top = 82
  end
end
