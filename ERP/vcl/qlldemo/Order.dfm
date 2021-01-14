object OrderForm: TOrderForm
  Left = 244
  Top = 106
  Width = 586
  Height = 561
  Caption = #37319#36141#35746#21333
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    578
    534)
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 24
    Width = 578
    Height = 161
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      578
      161)
    object Label1: TLabel
      Left = 8
      Top = 128
      Width = 565
      Height = 5
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Color = clBtnShadow
      ParentColor = False
    end
    object Label2: TLabel
      Left = 568
      Top = 32
      Width = 5
      Height = 97
      Anchors = [akTop, akRight, akBottom]
      AutoSize = False
      Color = clBtnShadow
      ParentColor = False
    end
    object Label10: TLabel
      Left = 8
      Top = 11
      Width = 42
      Height = 12
      Caption = #20379#24212#21830':'
    end
    object Label11: TLabel
      Left = 8
      Top = 141
      Width = 30
      Height = 12
      Caption = #22791#27880':'
      FocusControl = DBEdit8
    end
    object Panel3: TPanel
      Left = 8
      Top = 32
      Width = 561
      Height = 97
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clWindow
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      DesignSize = (
        559
        95)
      object Label3: TLabel
        Left = 368
        Top = 8
        Width = 73
        Height = 13
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #24320#21333#26085#26399
        Color = clNavy
        FocusControl = DBEdit1
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label4: TLabel
        Left = 448
        Top = 8
        Width = 105
        Height = 13
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #21333#25454#32534#21495
        Color = clNavy
        FocusControl = DBEdit2
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label5: TLabel
        Left = 472
        Top = 56
        Width = 81
        Height = 13
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #36865#36135#26085#26399
        Color = clNavy
        FocusControl = DBEdit3
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label6: TLabel
        Left = 376
        Top = 56
        Width = 89
        Height = 13
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #21512#21516#21495
        Color = clNavy
        FocusControl = DBEdit4
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label7: TLabel
        Left = 192
        Top = 56
        Width = 81
        Height = 13
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #20184#27454#26399#38480
        Color = clNavy
        FocusControl = DBEdit5
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label8: TLabel
        Left = 280
        Top = 56
        Width = 89
        Height = 13
        Alignment = taCenter
        Anchors = [akTop, akRight]
        AutoSize = False
        Caption = #21457#31080#31867#22411
        Color = clNavy
        FocusControl = DBEdit6
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = #23435#20307
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object Label9: TLabel
        Left = 16
        Top = 8
        Width = 84
        Height = 20
        Caption = #37319#36141#35746#21333
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = #23435#20307
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit1: TDBEdit
        Left = 368
        Top = 21
        Width = 73
        Height = 18
        Anchors = [akTop, akRight]
        DataField = 'BILLDATE'
        DataSource = DemoDM.P_OrderDSR
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 448
        Top = 21
        Width = 105
        Height = 18
        Anchors = [akTop, akRight]
        DataField = 'BILLCODE'
        DataSource = DemoDM.P_OrderDSR
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 472
        Top = 69
        Width = 81
        Height = 18
        Anchors = [akTop, akRight]
        DataField = 'RCVDATE'
        DataSource = DemoDM.P_OrderDSR
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 376
        Top = 69
        Width = 89
        Height = 18
        Anchors = [akTop, akRight]
        DataField = 'CNTCTNO'
        DataSource = DemoDM.P_OrderDSR
        TabOrder = 3
      end
      object DBEdit5: TDBEdit
        Left = 192
        Top = 69
        Width = 81
        Height = 18
        Anchors = [akTop, akRight]
        DataField = 'Term'
        DataSource = DemoDM.P_OrderDSR
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 280
        Top = 69
        Width = 89
        Height = 18
        Anchors = [akTop, akRight]
        DataField = 'InvoiceType'
        DataSource = DemoDM.P_OrderDSR
        TabOrder = 5
      end
    end
    object DBEdit8: TDBEdit
      Left = 40
      Top = 138
      Width = 329
      Height = 20
      DataField = 'REMARK'
      DataSource = DemoDM.P_OrderDSR
      TabOrder = 1
    end
    object VendorLCB: TQLDBLookupComboBox
      Left = 56
      Top = 8
      Width = 177
      Height = 20
      DataField = 'VendorName'
      DataSource = DemoDM.P_OrderDSR
      DropDownRows = 15
      TabOrder = 2
      ButtonHeight = 22
      OnButtonClick = VendorLCBButtonClick
      SearchMode = smLocate
      SearchType = stAuto
    end
  end
  object OrderDDbg: TQLDBGrid
    Left = 8
    Top = 192
    Width = 563
    Height = 201
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = OrderDDsr
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    AlternateColor = clWindow
    CurrencyView.CurrencyTitle = True
    CurrencyView.DigitAlignment = taCenter
    CurrencyView.DigitWidth = 9
    CurrencyView.IntegerSeparateColor = clRed
    CurrencyView.SeparateColor = clSilver
    CurrencyView.ThousandSeparateColor = clGray
    CurrencyView.TitleLines = False
    FooterColor = 13296074
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEx = [dgEnterToTab, dgAllowDelete, dgAllowInsert, dgControlArrowKeys, dgCurrencyView]
    Columns = <
      item
        Expanded = False
        FieldName = 'Goods'
        Width = 150
        Visible = True
        ControlType = ctCustomControl
        CustomControl = GoodsLCB
        Footer.Value = #21512#35745#65306
        Footer.ValueType = fvtStaticText
      end
      item
        ButtonStyle = cbsNone
        Expanded = False
        FieldName = 'Unit'
        Width = 53
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'QTY'
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRICE'
        Width = 93
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cost'
        Width = 162
        Visible = True
        Footer.ValueType = fvtSum
      end>
  end
  object BitBtn1: TBitBtn
    Left = 488
    Top = 504
    Width = 83
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #36864#20986'(X)'
    TabOrder = 2
    Kind = bkClose
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 578
    Height = 24
    AutoSize = True
    ButtonWidth = 51
    Caption = 'ToolBar1'
    EdgeBorders = [ebBottom]
    Flat = True
    Images = DemoDM.ToolBarIL
    List = True
    ShowCaptions = True
    TabOrder = 3
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 9
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 9
      Top = 0
      Action = DataSetPrior1
    end
    object ToolButton3: TToolButton
      Left = 60
      Top = 0
      Action = DataSetNext1
    end
    object ToolButton6: TToolButton
      Left = 111
      Top = 0
      Width = 18
      Caption = 'ToolButton6'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 129
      Top = 0
      Action = PrintAtn
      DropdownMenu = PrintPM
      Style = tbsDropDown
    end
  end
  object GoodsLCB: TQLDBLookupComboBox
    Left = 80
    Top = 280
    Width = 145
    Height = 18
    BevelInner = bvNone
    Ctl3D = False
    DataField = 'Goods'
    DataSource = OrderDDsr
    DropDownRows = 15
    DropDownWidth = 300
    ListField = 'NAME;UNIT;CODE'
    ListSource = DemoDM.GoodsDSR
    OnCloseUp = GoodsLCBCloseUp
    OnDropDown = GoodsLCBDropDown
    ParentCtl3D = False
    TabOrder = 4
    Visible = False
    ButtonHeight = 22
    OnButtonClick = GoodsLCBButtonClick
    SearchMode = smLocate
    SearchType = stAuto
  end
  object AboutButton: TBitBtn
    Left = 488
    Top = 472
    Width = 83
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #20851#20110'(&A)...'
    TabOrder = 5
    OnClick = AboutButtonClick
    Kind = bkHelp
  end
  object Panel2: TPanel
    Left = 0
    Top = 397
    Width = 473
    Height = 137
    Anchors = [akLeft, akBottom]
    BevelOuter = bvNone
    TabOrder = 6
    object Label12: TLabel
      Left = 8
      Top = 105
      Width = 276
      Height = 24
      Caption = #22312#23450#20301#26597#25214#26041#24335#19979#65292#21482#26377#33258#21160#36755#20837#31867#22411#21487#29992#13#10#22312#36807#28388#26597#25214#26041#24335#19979#65292#36755#20837#31867#22411#33258#21160#31561#20110#36755#20837#31867#22411#21697#21517
    end
    object Label13: TLabel
      Left = 248
      Top = 8
      Width = 60
      Height = 12
      Caption = #20598#25968#34892#39068#33394
    end
    object Label14: TLabel
      Left = 248
      Top = 56
      Width = 60
      Height = 12
      Caption = #21512#35745#34892#39068#33394
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 233
      Height = 97
      Caption = #21697#21517#35268#26684#36755#20837#35774#32622
      TabOrder = 0
      object SearchModeRG: TRadioGroup
        Left = 144
        Top = 16
        Width = 73
        Height = 73
        Caption = #26597#25214#26041#24335
        ItemIndex = 0
        Items.Strings = (
          #23450#20301
          #36807#28388)
        TabOrder = 0
        OnClick = SearchModeRGClick
      end
      object SearchTypeRG: TRadioGroup
        Left = 8
        Top = 16
        Width = 129
        Height = 73
        Caption = #36755#20837#31867#22411
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          #33258#21160
          #21697#21517
          #25340#38899#30721
          #20116#31508#30721)
        TabOrder = 1
        OnClick = SearchTypeRGClick
      end
    end
    object AlternateColorPnl: TPanel
      Left = 248
      Top = 24
      Width = 97
      Height = 33
      Color = 16771327
      TabOrder = 1
      object AlternateColorSB: TSpeedButton
        Left = 0
        Top = 0
        Width = 97
        Height = 22
        Flat = True
        OnClick = AlternateColorSBClick
      end
    end
    object CheckBox1: TCheckBox
      Left = 352
      Top = 112
      Width = 97
      Height = 17
      Caption = #21512#35745#34892
      Checked = True
      State = cbChecked
      TabOrder = 2
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 352
      Top = 16
      Width = 113
      Height = 17
      Caption = #20973#35777#26679#24335#37329#39069#26639
      Checked = True
      State = cbChecked
      TabOrder = 3
      OnClick = CheckBox2Click
    end
    object CheckBox3: TCheckBox
      Left = 352
      Top = 40
      Width = 113
      Height = 17
      Caption = #37329#39069#26639#26631#39064
      Checked = True
      State = cbChecked
      TabOrder = 4
      OnClick = CheckBox3Click
    end
    object CheckBox4: TCheckBox
      Left = 352
      Top = 64
      Width = 113
      Height = 17
      Caption = #22238#36710#38190#24403#21046#34920#38190
      Checked = True
      State = cbChecked
      TabOrder = 5
      OnClick = CheckBox4Click
    end
    object CheckBox5: TCheckBox
      Left = 352
      Top = 88
      Width = 97
      Height = 17
      Caption = #33258#21160#35843#25972#21015#23485
      Checked = True
      State = cbChecked
      TabOrder = 6
      OnClick = CheckBox5Click
    end
    object FooterColorPnl: TPanel
      Left = 248
      Top = 72
      Width = 97
      Height = 33
      Color = 13296074
      TabOrder = 7
      object FooterColorSB: TSpeedButton
        Left = 0
        Top = 0
        Width = 97
        Height = 22
        Flat = True
        OnClick = FooterColorSBClick
      end
    end
  end
  object OrderDDsr: TDataSource
    DataSet = DemoDM.P_OrderDADS
    Left = 40
    Top = 184
  end
  object ActionList1: TActionList
    Images = DemoDM.ToolBarIL
    Left = 120
    Top = 208
    object DataSetPrior1: TDataSetPrior
      Category = 'Dataset'
      Caption = #21069#21333
      Hint = 'Prior'
      ImageIndex = 0
      DataSource = DemoDM.P_OrderDSR
    end
    object DataSetNext1: TDataSetNext
      Category = 'Dataset'
      Caption = #21518#21333
      Hint = 'Next'
      ImageIndex = 1
      DataSource = DemoDM.P_OrderDSR
    end
    object PrintAtn: TAction
      Caption = #25171#21360
      ImageIndex = 2
      OnExecute = PrintAtnExecute
    end
    object PrintPreviewAtn: TAction
      Tag = 1
      Caption = #25171#21360#39044#35272
      OnExecute = PrintAtnExecute
    end
  end
  object PrintPM: TPopupMenu
    Left = 152
    Top = 56
    object N1: TMenuItem
      Action = PrintAtn
    end
    object N2: TMenuItem
      Action = PrintPreviewAtn
    end
  end
  object P_OrderDSR: TDataSource
    DataSet = DemoDM.P_OrderADS
    OnDataChange = P_OrderDSRDataChange
    Left = 120
    Top = 120
  end
  object ColorDialog: TColorDialog
    Ctl3D = True
    Left = 312
    Top = 416
  end
  object ColorDialog1: TColorDialog
    Ctl3D = True
    Left = 304
    Top = 144
  end
end
