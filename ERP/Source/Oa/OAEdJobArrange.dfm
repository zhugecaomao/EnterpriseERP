inherited OAEdJobArrangeForm: TOAEdJobArrangeForm
  Left = 96
  Top = 112
  Width = 628
  Height = 507
  Caption = #24037#20316#23433#25490
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 343
    Top = 15
    Width = 48
    Height = 12
    Caption = #26085'    '#26399
  end
  object Label2: TLabel [1]
    Left = 29
    Top = 15
    Width = 48
    Height = 12
    Caption = #32534'    '#21495
  end
  object Label3: TLabel [2]
    Left = 29
    Top = 41
    Width = 48
    Height = 12
    Caption = #24037#20316#31867#21035
  end
  object Label4: TLabel [3]
    Left = 29
    Top = 68
    Width = 48
    Height = 12
    Caption = #24037#20316#20027#39064
  end
  object Label5: TLabel [4]
    Left = 343
    Top = 41
    Width = 48
    Height = 12
    Caption = #35745#21010#26085#26399
  end
  object Label6: TLabel [5]
    Left = 29
    Top = 121
    Width = 48
    Height = 12
    Caption = #25552#37266#26085#26399
  end
  object Label8: TLabel [6]
    Left = 29
    Top = 94
    Width = 48
    Height = 12
    Caption = #30456#20851#23458#25143
  end
  object Label7: TLabel [7]
    Left = 432
    Top = 121
    Width = 48
    Height = 12
    Caption = #25552#37266#21608#26399
  end
  object Label9: TLabel [8]
    Left = 568
    Top = 121
    Width = 12
    Height = 12
    Caption = #22825
  end
  inherited CancelButton: TButton
    Left = 532
    Top = 447
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 452
    Top = 447
    OnClick = OKButtonClick
  end
  object DBComboBox1: TDBComboBox
    Left = 82
    Top = 90
    Width = 395
    Height = 20
    DataField = 'Client'
    DataSource = DataSource1
    ItemHeight = 12
    TabOrder = 2
    OnChange = DBComboBox1Change
  end
  object GroupBox1: TGroupBox
    Left = 29
    Top = 143
    Width = 550
    Height = 176
    Caption = #24037#20316#20869#23481
    TabOrder = 3
    object DBMemo2: TDBMemo
      Left = 2
      Top = 14
      Width = 546
      Height = 160
      Align = alClient
      DataField = 'About'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 29
    Top = 319
    Width = 550
    Height = 117
    Caption = #22791#27880
    TabOrder = 4
    object DBMemo1: TDBMemo
      Left = 2
      Top = 14
      Width = 546
      Height = 101
      Align = alClient
      DataField = 'Memo'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object DBEdit1: TDBEdit
    Left = 396
    Top = 11
    Width = 180
    Height = 20
    DataField = 'Date'
    DataSource = DataSource1
    TabOrder = 5
  end
  object DBEdit2: TDBEdit
    Left = 82
    Top = 11
    Width = 180
    Height = 20
    DataField = 'Code'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit3: TDBEdit
    Left = 82
    Top = 37
    Width = 180
    Height = 20
    DataField = 'JobClass'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit4: TDBEdit
    Left = 83
    Top = 64
    Width = 395
    Height = 20
    DataField = 'Caption'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit5: TDBEdit
    Left = 396
    Top = 37
    Width = 180
    Height = 20
    DataField = 'PlanDate'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBEdit6: TDBEdit
    Left = 82
    Top = 117
    Width = 180
    Height = 20
    DataField = 'WakeDate'
    DataSource = DataSource1
    TabOrder = 10
  end
  object DBEdit7: TDBEdit
    Left = 485
    Top = 117
    Width = 71
    Height = 20
    DataField = 'WakeHZ'
    DataSource = DataSource1
    TabOrder = 11
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from OAJobArrange'
    Parameters = <>
    Left = 128
    Top = 216
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 64
    Top = 216
  end
end
