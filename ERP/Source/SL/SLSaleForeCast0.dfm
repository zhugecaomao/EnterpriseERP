inherited SLSaleForeCastForm: TSLSaleForeCastForm
  Left = 28
  Top = 136
  Width = 763
  Height = 533
  Caption = #38144#21806#20998#26512#39044#27979
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 755
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
    Width = 755
    Height = 465
    inherited PageControl: TPageControl
      Top = 438
      Width = 755
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #38144#21806#20998#26512#39044#27979
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 71
      Width = 755
      Height = 367
      FooterRowCount = 1
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 755
      Height = 71
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object GroupBox1: TGroupBox
        Left = 339
        Top = 7
        Width = 414
        Height = 55
        Align = alClient
        Caption = #26102#38388#26465#20214#35774#32622
        TabOrder = 0
        object Label1: TLabel
          Left = 9
          Top = 25
          Width = 48
          Height = 12
          Caption = #24403#21069#26085#26399
        end
        object Label2: TLabel
          Left = 374
          Top = 24
          Width = 12
          Height = 12
          Caption = #22825
        end
        object DateTimePicker1: TDateTimePicker
          Left = 60
          Top = 21
          Width = 89
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
        object RadioGroup1: TRadioGroup
          Left = 158
          Top = 8
          Width = 163
          Height = 37
          TabOrder = 1
        end
        object RadioButton1: TRadioButton
          Left = 168
          Top = 21
          Width = 70
          Height = 17
          Caption = #25353#26376#20998#27573
          Checked = True
          TabOrder = 2
          TabStop = True
          OnClick = RadioButton2Click
        end
        object RadioButton2: TRadioButton
          Left = 246
          Top = 21
          Width = 70
          Height = 17
          Caption = #25353#22825#20998#27573
          TabOrder = 3
          OnClick = RadioButton2Click
        end
        object ComboBox1: TComboBox
          Left = 328
          Top = 19
          Width = 39
          Height = 20
          Enabled = False
          ItemHeight = 12
          TabOrder = 4
          Text = '7'
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
            '55'
            '60'
            '90'
            '')
        end
      end
      object Panel3: TPanel
        Left = 2
        Top = 2
        Width = 751
        Height = 5
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
      end
      object Panel5: TPanel
        Left = 2
        Top = 7
        Width = 87
        Height = 55
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 2
        object Button2: TButton
          Left = 6
          Top = 5
          Width = 75
          Height = 20
          Caption = #36807#28388#26465#20214
          TabOrder = 0
          OnClick = Button2Click
        end
        object Button1: TButton
          Left = 6
          Top = 31
          Width = 75
          Height = 20
          Caption = #36807#28388#26465#20214
          TabOrder = 1
          OnClick = Button2Click
        end
      end
      object GroupBox2: TGroupBox
        Left = 89
        Top = 7
        Width = 250
        Height = 55
        Align = alLeft
        Caption = #20998#26512#39033#30446
        TabOrder = 3
        object CheckBox1: TCheckBox
          Left = 13
          Top = 16
          Width = 55
          Height = 15
          Caption = #25353#23458#25143
          Checked = True
          State = cbChecked
          TabOrder = 0
          OnClick = CheckBox1Click
          OnExit = CheckBox1Click
        end
        object CheckBox2: TCheckBox
          Left = 79
          Top = 14
          Width = 55
          Height = 17
          Caption = #25353#21830#21697
          TabOrder = 1
          OnClick = CheckBox1Click
          OnExit = CheckBox1Click
        end
        object CheckBox4: TCheckBox
          Left = 13
          Top = 33
          Width = 55
          Height = 17
          Caption = #37329#39069
          Checked = True
          State = cbChecked
          TabOrder = 3
          OnClick = CheckBox4Click
          OnExit = CheckBox4Click
        end
        object CheckBox5: TCheckBox
          Left = 79
          Top = 33
          Width = 55
          Height = 17
          Caption = #25968#37327
          TabOrder = 4
          OnClick = CheckBox4Click
          OnExit = CheckBox4Click
        end
        object CheckBox6: TCheckBox
          Left = 145
          Top = 33
          Width = 55
          Height = 17
          Caption = #27611#21033
          TabOrder = 5
          OnClick = CheckBox4Click
          OnExit = CheckBox4Click
        end
        object CheckBox3: TCheckBox
          Left = 145
          Top = 14
          Width = 72
          Height = 17
          Caption = #25353#19994#21153#21592
          TabOrder = 2
          OnClick = CheckBox1Click
          OnExit = CheckBox1Click
        end
      end
      object Panel4: TPanel
        Left = 2
        Top = 62
        Width = 751
        Height = 7
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 4
      end
    end
  end
  inherited ActionList: TActionList
    Left = 27
    Top = 173
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 30
    Top = 218
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select Date,a.Code,ClientID,EmployeeID,BillMode,ModeDC,ModeC,'#13#10'B' +
      'rief,GoodsID,GoodsSpec, Quantity,QuantityPcs,'#13#10'PackUnitID,PriceB' +
      'ase,Amount,GoalUnitID,GoalQuantity,          '#13#10'c.name Client,d.n' +
      'ame Employee,'#13#10'e.name Goods, f.name GoodsClass,g.name DAArea'#13#10'fr' +
      'om '#13#10'(select  b.Date,b.Code,b.ClientID,b.EmployeeID,'#13#10'b.BillMode' +
      ',b.ModeDC,b.ModeC,b.Brief,'#13#10'a.GoodsID,a.GoodsSpec, a.Quantity,a.' +
      'QuantityPcs,a.PackUnitID,'#13#10'a.PriceBase,a.Amount,a.GoalUnitID,a.G' +
      'oalQuantity'#13#10'from SLSaleDetail  AS a  '#13#10'LEFT OUTER JOIN SLSalema' +
      'ster as b  on a.MasterID=b.id '#13#10'where 1=2)'#13#10'  AS a  '#13#10'LEFT OUTER' +
      ' JOIN DAClient     as c  on a.ClientID=c.id'#13#10'LEFT OUTER JOIN MSE' +
      'mployee   as d  on a.EmployeeID=d.id'#13#10'LEFT OUTER JOIN DAGoods   ' +
      '   as e  on a.GoodsID=e.id'#13#10'LEFT OUTER JOIN DAGoodsClass as f  o' +
      'n e.GoodsClassID=f.id'#13#10'LEFT OUTER JOIN DAarea       as g  on c.A' +
      'reaID=g.id'
    Parameters = <>
    Left = 100
    Top = 220
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 320
    Top = 216
  end
  object ADOQuery2: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 272
    Top = 224
  end
  object PopupMenu1: TPopupMenu
    Left = 272
    Top = 168
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
    Left = 152
    Top = 208
  end
end
