inherited MSEdUserPassWordForm: TMSEdUserPassWordForm
  Left = 225
  Top = 167
  Width = 290
  Height = 193
  Caption = #20462#25913#23494#30721
  PixelsPerInch = 96
  TextHeight = 12
  inherited CancelButton: TButton
    Left = 186
    Top = 133
    Width = 60
    Height = 23
    TabOrder = 4
  end
  inherited OKButton: TButton
    Left = 106
    Top = 133
    Width = 60
    Height = 23
    TabOrder = 3
    OnClick = OKButtonClick
  end
  object PwEdit1: TLabeledEdit
    Left = 91
    Top = 28
    Width = 157
    Height = 20
    EditLabel.Width = 60
    EditLabel.Height = 12
    EditLabel.Caption = #36755#20837#26087#23494#30721
    LabelPosition = lpLeft
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 0
    OnExit = PwEdit1Exit
  end
  object PwEdit2: TLabeledEdit
    Left = 91
    Top = 60
    Width = 157
    Height = 20
    EditLabel.Width = 60
    EditLabel.Height = 12
    EditLabel.Caption = #36755#20837#26032#23494#30721
    Enabled = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 1
  end
  object PwEdit3: TLabeledEdit
    Left = 91
    Top = 92
    Width = 157
    Height = 20
    EditLabel.Width = 60
    EditLabel.Height = 12
    EditLabel.Caption = #25928#39564#26032#23494#30721
    Enabled = False
    LabelPosition = lpLeft
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 2
    OnExit = PwEdit3Exit
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 25
    Top = 112
  end
end
