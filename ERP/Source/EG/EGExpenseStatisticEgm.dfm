inherited EGExpenseStatisticEgmForm: TEGExpenseStatisticEgmForm
  Left = -3
  Top = 230
  Width = 808
  Height = 580
  Caption = #39033#30446#36153#29992#21488#24080
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
        Caption = #39033#30446#36153#29992#32479#35745
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 103
      Width = 800
      Height = 382
      TabOrder = 2
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
        Left = 406
        Top = 2
        Width = 392
        Height = 99
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 392
          Height = 9
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
        end
        object GroupBox3: TGroupBox
          Left = 0
          Top = 9
          Width = 392
          Height = 90
          Align = alClient
          Caption = #24403#21069#26465#20214
          TabOrder = 1
          object Memo1: TMemo
            Left = 2
            Top = 14
            Width = 388
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
          Left = 245
          Top = 17
          Width = 75
          Height = 25
          Caption = #26465#20214#35774#32622
          TabOrder = 2
          OnClick = Button3Click
        end
        object Button1: TButton
          Tag = 1
          Left = 37
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
            Left = 18
            Top = 19
            Width = 80
            Height = 15
            Caption = #25353#39033#30446#21517#31216
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = CheckBox1Click
            OnExit = CheckBox1Click
          end
          object CheckBox2: TCheckBox
            Left = 105
            Top = 17
            Width = 80
            Height = 17
            Caption = #25353#39033#30446#36153#29992
            TabOrder = 1
            OnClick = CheckBox1Click
            OnExit = CheckBox1Click
          end
          object CheckBox3: TCheckBox
            Left = 193
            Top = 17
            Width = 80
            Height = 17
            Caption = #25353#19994#21153#21592
            TabOrder = 2
            OnClick = CheckBox1Click
            OnExit = CheckBox1Click
          end
          object CheckBox4: TCheckBox
            Left = 271
            Top = 17
            Width = 66
            Height = 17
            Caption = #25353#26085#26399
            TabOrder = 3
            OnClick = CheckBox1Click
            OnExit = CheckBox1Click
          end
        end
        object Button2: TButton
          Left = 141
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
      #36153#29992#31867#21035'=GoodsClass'
      #36153#29992#21517#31216'=Goods'
      #37329#39069'=Amount'
      #19994#21153#32463#21150'=Employee')
    DateSeperate = #39
    Left = 144
    Top = 168
  end
end
