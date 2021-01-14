inherited DAAreasEditForm: TDAAreasEditForm
  Left = 275
  Top = 162
  Width = 269
  Height = 181
  Caption = #22320#21306#36164#26009#32534#36753
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object lblName: TLabel [0]
    Left = 18
    Top = 33
    Width = 42
    Height = 12
    Caption = #21517'   '#31216
  end
  object lbllocation: TLabel [1]
    Left = 17
    Top = 78
    Width = 48
    Height = 12
    Caption = #25152#23646#22320#21306
  end
  object Label13: TLabel [2]
    Left = 77
    Top = 98
    Width = 108
    Height = 12
    Caption = '(Ctrl+A'#24314#31435#26681#33410#28857')'
  end
  inherited CancelButton: TButton
    Left = 179
    Top = 121
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 99
    Top = 121
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 78
    Top = 30
    Width = 171
    Height = 20
    DataField = 'Name'
    DataSource = dsDAEDAreas
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 78
    Top = 73
    Width = 171
    Height = 20
    DataField = 'UpID'
    DataSource = dsDAEDAreas
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource2
    NullValueKey = 16449
    TabOrder = 1
  end
  object dsDAEDAreas: TDataSource
    DataSet = tblDAEDAreas
    Left = 65
    Top = 65531
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 230
    Top = 65516
  end
  object tblDAEDAreas: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    BeforePost = tblDAEDAreasBeforePost
    OnFilterRecord = tblDAEDAreasFilterRecord
    TableName = 'DAArea'
    Left = 25
  end
  object ADOQuery1: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <
      item
        Name = 'Code'
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from DAArea'
      'where LevelCode not like :Code and RecordState<>'#39#21024#38500#39)
    Left = 170
    Top = 50
  end
end
