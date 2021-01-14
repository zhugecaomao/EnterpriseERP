inherited MSEdTermAddUserForm: TMSEdTermAddUserForm
  Left = 256
  Top = 167
  BorderStyle = bsDialog
  Caption = #28155#21152#25104#21592
  ClientHeight = 274
  ClientWidth = 327
  OldCreateOrder = True
  Position = poMainFormCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 8
    Top = 24
    Width = 48
    Height = 12
    Caption = #26410#36873#32452#65306
  end
  object Label2: TLabel
    Left = 192
    Top = 24
    Width = 48
    Height = 12
    Caption = #24050#36873#32452#65306
  end
  object btnAdd: TButton
    Left = 136
    Top = 56
    Width = 49
    Height = 25
    Caption = '>'
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnAddAll: TButton
    Left = 136
    Top = 88
    Width = 49
    Height = 25
    Caption = '>>'
    TabOrder = 2
    OnClick = btnAddAllClick
  end
  object btnDelete: TButton
    Left = 136
    Top = 120
    Width = 49
    Height = 25
    Caption = '<'
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  object btnDeleteAll: TButton
    Left = 136
    Top = 152
    Width = 49
    Height = 25
    Caption = '<<'
    TabOrder = 4
    OnClick = btnDeleteAllClick
  end
  object lbLeft: TListBox
    Left = 8
    Top = 40
    Width = 121
    Height = 177
    ItemHeight = 12
    TabOrder = 0
  end
  object lbRight: TListBox
    Left = 192
    Top = 40
    Width = 121
    Height = 177
    ItemHeight = 12
    TabOrder = 5
  end
  object btnOK: TButton
    Left = 160
    Top = 232
    Width = 75
    Height = 25
    Caption = #30830#23450
    ModalResult = 1
    TabOrder = 6
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 240
    Top = 232
    Width = 75
    Height = 25
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 7
  end
  object adsEdUserAddTerm: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 8
    Top = 232
  end
end
