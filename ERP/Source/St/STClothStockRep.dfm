inherited STClothStockRepForm: TSTClothStockRepForm
  Left = 6
  Top = 53
  Width = 812
  Height = 580
  Caption = #26381#35013#24211#23384#21488#24080
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
    object ToolButton1: TToolButton
      Left = 118
      Top = 2
      Hint = #25353#24403#21069#26448#26009#21517#31216#20998#21035#25171#21360#26448#26009#26126#32454#27969#27700#23545#24080#21333#12290
      Caption = #23545#24080#21333
      ImageIndex = 9
      OnClick = ToolButton1Click
    end
    object ToolButton3: TToolButton
      Left = 173
      Top = 2
      Action = DeadStockAct
    end
    object ToolButton6: TToolButton
      Left = 228
      Top = 2
      Action = ExportAction
    end
    object ToolButton12: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 291
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton2: TToolButton
      Left = 346
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton8: TToolButton
      Left = 401
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 456
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 464
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 804
    Height = 512
    inherited PageControl: TPageControl
      Top = 485
      Width = 804
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #39044#35686#24211#23384#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 112
      Width = 804
      Height = 373
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
      Top = 113
      Width = 281
      Height = 145
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
        OnCloseUp = DateTimePicker1CloseUp
        OnExit = DateTimePicker1CloseUp
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
        OnCloseUp = DateTimePicker2CloseUp
        OnExit = DateTimePicker2CloseUp
      end
      object Button5: TButton
        Left = 44
        Top = 98
        Width = 73
        Height = 21
        Caption = #30830#23450
        TabOrder = 2
        OnClick = Button5Click
      end
      object Button6: TButton
        Left = 148
        Top = 98
        Width = 73
        Height = 21
        Caption = #21462#28040
        TabOrder = 3
        OnClick = Button6Click
      end
    end
    object DBGrid1: TDBGrid
      Left = 48
      Top = 328
      Width = 657
      Height = 137
      TabOrder = 5
      TitleFont.Charset = GB2312_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = #23435#20307
      TitleFont.Style = []
      Visible = False
    end
  end
  inherited ActionList: TActionList
    Left = 80
    Top = 218
    object ListGoodsDetailAct: TAction
      Caption = #26174#31034#24403#21069#21830#21697#30340#26126#32454#21464#21160#24773#20917#12290
      Hint = #26174#31034#24403#21069#21830#21697#30340#26126#32454#21464#21160#24773#20917#12290
      ImageIndex = 14
      ShortCut = 16455
      OnExecute = ListGoodsDetailActExecute
    end
    object GoodsFlowListAct: TAction
      Caption = 'GoodsFlowListAct'
      ImageIndex = 12
      OnExecute = GoodsFlowListActExecute
    end
    object DeadStockAct: TAction
      Caption = #21574#28382#21697
      ImageIndex = 16
      OnExecute = DeadStockActExecute
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
    object ListGoodsDetail: TMenuItem
      Action = ListGoodsDetailAct
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
  object AccountListQry: TADOQuery
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      'select b.Date ['#26085#26399'], '
      'b.Code ['#32534#21495'],                        '
      'b.BillMode ['#19994#21153#31867#21035'],                '
      'd.name  ['#32463#25163#20154'] ,                    '
      'c.name ['#20179#24211#21517#31216'],                    '
      'h.name ['#21830#21697#31867#21035'],                    '
      'e.name ['#21830#21697#21517#31216'],                    '
      'a.GoodsSpec ['#35268#26684#22411#21495'],               '
      'g.name ['#26631#20934#21333#20301'],                    '
      'a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) ['#20837#24211#26631#20934#25968#37327'],  '
      'a.PriceGoal ['#20837#24211#26631#20934#21333#20215'],                '
      'a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) ['#20837#24211#37329#39069'], '
      'f.name     ['#20837#24211#21253#35013#21333#20301'],                '
      'a.Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) ['#20837#24211#21253#35013#25968#37327'],     '
      'a.PriceBase ['#20837#24211#21253#35013#21333#20215']  ,             '
      'a.GoalQuantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) ['#20986#24211#26631#20934#25968#37327'],  '
      'a.PriceGoal ['#20986#24211#26631#20934#21333#20215'],                '
      'a.Amount*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) ['#20986#24211#37329#39069'], '
      'f.name     ['#20986#24211#21253#35013#21333#20301'],                '
      'a.Quantity*Isnull(b.ModeDC,1)*Isnull(b.ModeC,1) ['#20986#24211#21253#35013#25968#37327'],     '
      'a.PriceBase ['#20986#24211#21253#35013#21333#20215'] ,   '
      'a.PriceBase ['#32467#23384#25968#37327'] ,'
      'a.PriceBase ['#32467#23384#21333#20215'] ,'
      'a.PriceBase ['#32467#23384#37329#39069']        '
      'from SLGoodsOutDetail a                   '
      'left outer join SLGoodsOutMaster     b on b.ID=a.MasterID      '
      
        'left outer join STWarehouse         c on c.ID=b.WareHouseID     ' +
        ' '
      'left outer join MSEmployee       d on d.ID=b.EmployeeID    '
      'left outer join DAGoods          e on e.ID=a.GoodsID       '
      'left outer join MSUnit           f on f.ID=a.PackUnitID    '
      'left outer join MSUnit           g on g.ID=E.UnitID    '
      'left outer join DAGoodsClass     h on h.ID=e.GoodsClassID  '
      'where  1=2')
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
    object AccountListQryDSDesigner4: TStringField
      FieldName = #32463#25163#20154
      Size = 30
    end
    object AccountListQryDSDesigner5: TStringField
      FieldName = #20179#24211#21517#31216
      Size = 30
    end
    object AccountListQryDSDesigner6: TStringField
      FieldName = #21830#21697#31867#21035
      Size = 30
    end
    object AccountListQryDSDesigner7: TStringField
      FieldName = #21830#21697#21517#31216
      Size = 60
    end
    object AccountListQryDSDesigner8: TStringField
      FieldName = #35268#26684#22411#21495
      Size = 30
    end
    object AccountListQryDSDesigner9: TStringField
      FieldName = #26631#20934#21333#20301
    end
    object AccountListQryDSDesigner10: TBCDField
      FieldName = #20837#24211#26631#20934#25968#37327
      ReadOnly = True
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 32
      Size = 5
    end
    object AccountListQryDSDesigner11: TBCDField
      FieldName = #20837#24211#26631#20934#21333#20215
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
    end
    object AccountListQryDSDesigner12: TBCDField
      FieldName = #20837#24211#37329#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 32
      Size = 5
    end
    object AccountListQryDSDesigner13: TStringField
      FieldName = #20837#24211#21253#35013#21333#20301
    end
    object AccountListQryDSDesigner14: TBCDField
      FieldName = #20837#24211#21253#35013#25968#37327
      ReadOnly = True
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 32
      Size = 5
    end
    object AccountListQryDSDesigner15: TBCDField
      FieldName = #20837#24211#21253#35013#21333#20215
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
    end
    object AccountListQryDSDesigner16: TBCDField
      FieldName = #20986#24211#26631#20934#25968#37327
      ReadOnly = True
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 32
      Size = 5
    end
    object AccountListQryDSDesigner17: TBCDField
      FieldName = #20986#24211#26631#20934#21333#20215
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
    end
    object AccountListQryDSDesigner18: TBCDField
      FieldName = #20986#24211#37329#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 32
      Size = 5
    end
    object AccountListQryDSDesigner19: TStringField
      FieldName = #20986#24211#21253#35013#21333#20301
    end
    object AccountListQryDSDesigner20: TBCDField
      FieldName = #20986#24211#21253#35013#25968#37327
      ReadOnly = True
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 32
      Size = 5
    end
    object AccountListQryDSDesigner21: TBCDField
      FieldName = #20986#24211#21253#35013#21333#20215
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
    end
    object AccountListQryDSDesigner22: TBCDField
      FieldName = #32467#23384#25968#37327
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
    end
    object AccountListQryDSDesigner23: TBCDField
      FieldName = #32467#23384#21333#20215
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
    end
    object AccountListQryDSDesigner24: TBCDField
      FieldName = #32467#23384#37329#39069
      DisplayFormat = '#,#.00'
      currency = True
      Precision = 19
    end
  end
  object DataSource1: TDataSource
    DataSet = adsMaster
    Left = 590
    Top = 226
  end
end
