inherited SLPricequeryForm: TSLPricequeryForm
  Left = 118
  Top = 144
  Width = 733
  Height = 468
  Caption = #26597#35810#32467#26524
  Font.Charset = DEFAULT_CHARSET
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TQLDBGrid
    Left = 0
    Top = 0
    Width = 725
    Height = 441
    Align = alClient
    DataSource = dsQuerry
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    AlternateColor = 15399421
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
    FooterRowCount = 1
    OptionsEx = [dgAllowDelete, dgAllowInsert]
  end
  object dsQuerry: TDataSource
    DataSet = AdsPricequery
    Left = 218
    Top = 102
  end
  object AdsPricequery: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 'seelct * from SLSaleDetail'
    Parameters = <>
    Left = 164
    Top = 100
  end
end
