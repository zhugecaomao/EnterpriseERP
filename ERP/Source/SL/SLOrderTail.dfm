inherited SLOrderTailForm: TSLOrderTailForm
  Left = 103
  Top = 91
  BorderStyle = bsDialog
  Caption = #35746#21333#25191#34892#26597#35810
  ClientHeight = 325
  ClientWidth = 558
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 558
    Height = 34
    Align = alTop
    BevelOuter = bvNone
    Caption = #35746#21333#25191#34892#26597#35810
    TabOrder = 0
  end
  object DBGrid: TQLDBGrid
    Left = 0
    Top = 34
    Width = 558
    Height = 291
    Align = alClient
    DataSource = dsSlOrderTail
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
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 1
    OptionsEx = [dgAllowDelete, dgAllowInsert]
  end
  object dsSlOrderTail: TDataSource
    DataSet = adsSlOrderTail
    Left = 88
    Top = 72
  end
  object adsSlOrderTail: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select * from SLOrderDetail'
    Parameters = <>
    Left = 128
    Top = 72
  end
end
