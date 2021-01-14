inherited SLDiscountModeForm: TSLDiscountModeForm
  Left = 287
  Top = 168
  BorderStyle = bsDialog
  Caption = #25240#25187#26041#24335
  ClientHeight = 131
  ClientWidth = 268
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 0
    Width = 268
    Height = 131
    Align = alClient
    Caption = #25240#25187#26041#24335#35774#32622
    TabOrder = 0
  end
  object RadioButton1: TRadioButton
    Left = 24
    Top = 32
    Width = 95
    Height = 17
    Caption = #37329#39069#27604#29575#25240#25187
    Checked = True
    TabOrder = 1
    TabStop = True
    OnClick = RadioButton1Click
  end
  object RadioButton2: TRadioButton
    Left = 24
    Top = 75
    Width = 95
    Height = 17
    Caption = #25968#37327#22266#23450#25240#25187
    TabOrder = 2
    OnClick = RadioButton1Click
  end
  object GEdit1: TGEdit
    Left = 128
    Top = 32
    Width = 69
    Height = 20
    AutoSelect = True
    TabOrder = 3
    Text = '0.00'
    Alignment = taRightJustify
    Currency = False
    Warning = #36755#20837#30340#25968#23383#38169#35823#65292#35831#37325#26032#36755#20837#25968#25454
    NeedWarning = True
    WarningFocus = True
  end
  object GEdit2: TGEdit
    Left = 128
    Top = 73
    Width = 69
    Height = 20
    AutoSelect = True
    Enabled = False
    TabOrder = 4
    Text = '0.00'
    Alignment = taRightJustify
    Currency = False
    Warning = #36755#20837#30340#25968#23383#38169#35823#65292#35831#37325#26032#36755#20837#25968#25454
    NeedWarning = True
    WarningFocus = True
  end
  object StaticText1: TStaticText
    Left = 202
    Top = 35
    Width = 10
    Height = 16
    Caption = '%'
    TabOrder = 5
  end
  object StaticText2: TStaticText
    Left = 202
    Top = 76
    Width = 16
    Height = 16
    Caption = #20803
    TabOrder = 6
  end
end
