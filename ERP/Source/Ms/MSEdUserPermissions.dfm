inherited MSUserPermissionsEditForm: TMSUserPermissionsEditForm
  Left = 229
  Top = 165
  BorderStyle = bsDialog
  Caption = #29992#25143#26435#38480
  ClientHeight = 285
  ClientWidth = 425
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 8
    Top = 8
    Width = 54
    Height = 12
    Caption = #29992#25143'/'#32452#65306
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 32
    Width = 36
    Height = 12
    Caption = #20998#31867#65306
  end
  object Label3: TLabel [2]
    Left = 136
    Top = 32
    Width = 36
    Height = 12
    Caption = #26435#38480#65306
  end
  object lbName: TLabel [3]
    Left = 64
    Top = 8
    Width = 78
    Height = 12
    Caption = '<'#29992#25143'/'#32452#21517#31216'>'
  end
  inherited CancelButton: TButton
    Left = 327
    Top = 252
    TabOrder = 5
  end
  inherited OKButton: TButton
    Left = 247
    Top = 252
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object lvPermissions: TListView
    Left = 138
    Top = 48
    Width = 273
    Height = 191
    Checkboxes = True
    Columns = <>
    TabOrder = 1
    ViewStyle = vsList
    OnChange = lvPermissionsChange
  end
  object lbClass: TListBox
    Left = 8
    Top = 48
    Width = 121
    Height = 191
    Anchors = [akLeft, akTop, akBottom]
    ItemHeight = 12
    TabOrder = 0
    OnClick = lbClassClick
  end
  object btnSelectAll: TButton
    Left = 50
    Top = 252
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #20840#36873
    TabOrder = 2
    OnClick = btnSelectAllClick
  end
  object btnSelectNone: TButton
    Left = 130
    Top = 251
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = #20840#19981#36873
    TabOrder = 3
    OnClick = btnSelectNoneClick
  end
  object adsUserPermissionsClass: TADODataSet
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 16
    Top = 200
  end
  object adrUserPermissions: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 160
    Top = 200
  end
end
