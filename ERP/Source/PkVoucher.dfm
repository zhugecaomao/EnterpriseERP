inherited VoucherPickForm: TVoucherPickForm
  Left = 101
  Top = 107
  BorderStyle = bsDialog
  Caption = #36873#25321#21333#25454
  ClientHeight = 404
  ClientWidth = 579
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object DBGrid: TQLDBGrid
    Left = 0
    Top = 113
    Width = 579
    Height = 291
    Align = alClient
    DataSource = dsTemp
    Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
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
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 0
    OptionsEx = [dgAllowDelete, dgAllowInsert]
  end
  object Button1: TButton
    Left = 408
    Top = 360
    Width = 75
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 488
    Top = 360
    Width = 75
    Height = 25
    Cancel = True
    Caption = #21462#28040
    TabOrder = 2
    Visible = False
    OnClick = Button2Click
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 0
    Width = 579
    Height = 113
    Align = alTop
    Caption = #36807#28388#26465#20214
    TabOrder = 3
    object Label1: TLabel
      Left = 14
      Top = 25
      Width = 48
      Height = 12
      Caption = #21333#25454#31867#22411
    end
    object Label2: TLabel
      Left = 288
      Top = 25
      Width = 30
      Height = 12
      Caption = #32534#21495':'
    end
    object Label3: TLabel
      Left = 14
      Top = 84
      Width = 48
      Height = 12
      Caption = #24341#29992#26399#38388
    end
    object Label4: TLabel
      Left = 189
      Top = 84
      Width = 12
      Height = 12
      Caption = #33267
    end
    object Label5: TLabel
      Left = 14
      Top = 54
      Width = 48
      Height = 12
      Caption = #23458#25143#21378#21830
    end
    object CmbxTableName: TComboBox
      Left = 70
      Top = 21
      Width = 169
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 0
      OnChange = CmbxTableNameClick
      OnClick = CmbxTableNameClick
    end
    object dtpBegin: TDateTimePicker
      Left = 70
      Top = 80
      Width = 110
      Height = 20
      CalAlignment = dtaLeft
      Date = 37564.641926412
      Time = 37564.641926412
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 1
    end
    object dtpEnd: TDateTimePicker
      Left = 211
      Top = 80
      Width = 110
      Height = 20
      CalAlignment = dtaLeft
      Date = 37564.641926412
      Time = 37564.641926412
      DateFormat = dfShort
      DateMode = dmComboBox
      Kind = dtkDate
      ParseInput = False
      TabOrder = 2
    end
    object btnRefresh: TButton
      Left = 344
      Top = 80
      Width = 72
      Height = 21
      Caption = #21047#26032'(&R)'
      TabOrder = 3
      OnClick = btnRefreshClick
    end
    object CmbxClient: TComboBox
      Left = 70
      Top = 50
      Width = 251
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 4
    end
    object CmbCode: TComboBox
      Left = 326
      Top = 21
      Width = 169
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 5
    end
    object Button3: TButton
      Left = 440
      Top = 80
      Width = 81
      Height = 21
      Caption = #36873#25321#24403#21069#35760#24405
      Enabled = False
      TabOrder = 6
    end
  end
  object aqrTemp: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 208
    Top = 192
  end
  object adsTemp: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 88
    Top = 176
  end
  object dsTemp: TDataSource
    DataSet = adsTemp
    Left = 128
    Top = 176
  end
end
