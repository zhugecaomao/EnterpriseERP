inherited MSEdCurrencyForm: TMSEdCurrencyForm
  Left = 340
  Top = 254
  Width = 276
  Height = 179
  Caption = #24065#31181#36164#26009#32534#36753
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 40
    Top = 40
    Width = 60
    Height = 12
    Caption = #24065#31181#21517#31216#65306
  end
  object Label2: TLabel [1]
    Left = 41
    Top = 78
    Width = 72
    Height = 12
    Caption = #26159#21542#26412#20301#24065#65306
  end
  inherited CancelButton: TButton
    Left = 186
    Top = 119
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 106
    Top = 119
    OnClick = OKButtonClick
  end
  object RadioButton1: TRadioButton
    Left = 119
    Top = 76
    Width = 33
    Height = 17
    Caption = #26159
    TabOrder = 2
  end
  object RadioButton2: TRadioButton
    Left = 173
    Top = 76
    Width = 41
    Height = 17
    Caption = #21542
    Checked = True
    TabOrder = 3
    TabStop = True
  end
  object edName: TEdit
    Left = 102
    Top = 36
    Width = 121
    Height = 20
    TabOrder = 4
    Text = 'edName'
  end
  object aqrCurrency: TADOQuery
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from MSCurrency'
      'where recordState<>'#39#21024#38500#39)
    Left = 24
    Top = 104
  end
  object aqrTemp: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 58
    Top = 104
  end
end
