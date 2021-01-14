inherited OAEdCompanyNewsForm: TOAEdCompanyNewsForm
  Left = 102
  Top = 56
  Width = 628
  Height = 507
  Caption = #20844#21496#26032#38395
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 336
    Top = 25
    Width = 48
    Height = 12
    Caption = #26085'    '#26399
  end
  object Label2: TLabel [1]
    Left = 38
    Top = 25
    Width = 48
    Height = 12
    Caption = #32534'    '#21495
  end
  object Label3: TLabel [2]
    Left = 38
    Top = 52
    Width = 48
    Height = 12
    Caption = #20844#25991#31867#22411
  end
  object Label4: TLabel [3]
    Left = 336
    Top = 52
    Width = 48
    Height = 12
    Caption = #19994#21153#31867#22411
  end
  object Label5: TLabel [4]
    Left = 38
    Top = 79
    Width = 24
    Height = 12
    Caption = #20027#39064
  end
  object SpeedButton1: TSpeedButton [5]
    Left = 495
    Top = 74
    Width = 41
    Height = 22
    Caption = #38468#20214
    Enabled = False
  end
  inherited CancelButton: TButton
    Left = 534
    Top = 447
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 454
    Top = 447
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 393
    Top = 21
    Width = 180
    Height = 20
    DataField = 'Date'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 92
    Top = 21
    Width = 180
    Height = 20
    DataField = 'Code'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 92
    Top = 48
    Width = 180
    Height = 20
    DataField = 'DocTypeID'
    DataSource = DataSource1
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource2
    TabOrder = 4
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 393
    Top = 48
    Width = 180
    Height = 20
    DataField = 'BusTypeID'
    DataSource = DataSource1
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource3
    TabOrder = 5
  end
  object DBEdit3: TDBEdit
    Left = 92
    Top = 75
    Width = 395
    Height = 20
    DataField = 'DocHead'
    DataSource = DataSource1
    TabOrder = 6
  end
  object GroupBox1: TGroupBox
    Left = 38
    Top = 100
    Width = 550
    Height = 203
    Caption = #20869#23481
    TabOrder = 7
    object DBMemo1: TDBMemo
      Left = 2
      Top = 14
      Width = 546
      Height = 187
      Align = alClient
      DataField = 'DocText'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 38
    Top = 312
    Width = 550
    Height = 121
    Caption = #22791#27880
    TabOrder = 8
    object DBMemo2: TDBMemo
      Left = 2
      Top = 14
      Width = 546
      Height = 105
      Align = alClient
      DataField = 'Memo'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object adsOACompanyNews: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'SELECT * FROM OACompanyNews'#13#10'where recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 298
    Top = 136
  end
  object DataSource1: TDataSource
    DataSet = adsOACompanyNews
    Left = 388
    Top = 152
  end
  object DataSource2: TDataSource
    DataSet = adsDAAttribute
    Left = 180
    Top = 160
  end
  object DataSource3: TDataSource
    DataSet = adsDAAttribute1
    Left = 116
    Top = 152
  end
  object adsDAAttribute: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select *  from DAAttribute'#13#10'where recordstate<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 316
    Top = 200
  end
  object adsDAAttribute1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select *  from DAAttribute'#13#10'where recordstate<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 228
    Top = 136
  end
end
