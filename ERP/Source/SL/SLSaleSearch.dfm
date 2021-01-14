inherited SLSaleSearchForm: TSLSaleSearchForm
  Left = 345
  Top = 171
  Width = 393
  Height = 255
  Caption = #23458#25143#20215#26684#26597#35810
  Font.Charset = DEFAULT_CHARSET
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  FormStyle = fsStayOnTop
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid: TQLDBGrid
    Left = 0
    Top = 41
    Width = 385
    Height = 187
    Align = alClient
    DataSource = dsPricequery
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 0
    OptionsEx = [dgAllowDelete, dgAllowInsert, dgCurrencyView]
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 385
    Height = 41
    Align = alTop
    Caption = #26368#26032#38144#21806#20215#26684#26597#35810
    TabOrder = 1
  end
  object dsPricequery: TDataSource
    DataSet = Pricequery
    Left = 122
    Top = 70
  end
  object Pricequery: TADOQuery
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'select top 100 M.code,m.date, D.PriceBase,d.Amount,d.GoalQuantit' +
        'y ,'
      'f.name as goodsname  from SLSaleDetail D '
      'inner join DAGoods  f on d.goodsID=f.id '
      'inner join SLSaleMaster M on D.MasterID=M.ID')
    Left = 56
    Top = 80
  end
end
