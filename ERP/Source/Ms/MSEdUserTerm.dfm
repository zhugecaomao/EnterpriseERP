inherited MSEdUserTermForm: TMSEdUserTermForm
  Left = 169
  Top = 159
  Width = 438
  Height = 297
  Caption = #29992#25143#32452
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 8
    Top = 40
    Width = 36
    Height = 12
    Caption = #25104#21592#65306
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 144
    Width = 36
    Height = 12
    Caption = #22791#27880#65306
  end
  inherited CancelButton: TButton
    Left = 348
    Top = 237
    TabOrder = 6
  end
  inherited OKButton: TButton
    Left = 268
    Top = 237
    TabOrder = 5
    OnClick = OKButtonClick
  end
  object edtName: TLabeledEdit
    Left = 44
    Top = 8
    Width = 373
    Height = 20
    EditLabel.Width = 36
    EditLabel.Height = 12
    EditLabel.Caption = #21517#31216#65306
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 0
  end
  object lbUser: TListBox
    Left = 8
    Top = 56
    Width = 329
    Height = 81
    ItemHeight = 12
    TabOrder = 1
  end
  object btnAddUser: TButton
    Left = 348
    Top = 56
    Width = 75
    Height = 25
    Caption = #28155#21152'(&A)...'
    TabOrder = 2
    OnClick = btnAddUserClick
  end
  object btnDeleteUser: TButton
    Left = 348
    Top = 88
    Width = 75
    Height = 25
    Caption = #21024#38500'(&D)...'
    TabOrder = 3
    OnClick = btnDeleteUserClick
  end
  object mem: TMemo
    Left = 8
    Top = 160
    Width = 401
    Height = 65
    TabOrder = 4
  end
  object adrUserTerm: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 88
    Top = 232
  end
  object adsUserTerm: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 56
    Top = 232
  end
  object DataSource1: TDataSource
    DataSet = adsUserTerm
    Left = 24
    Top = 232
  end
end
