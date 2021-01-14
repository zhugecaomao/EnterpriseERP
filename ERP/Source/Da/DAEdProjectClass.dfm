inherited DAProjectClassEditForm: TDAProjectClassEditForm
  Left = 275
  Top = 162
  Width = 286
  Height = 186
  Caption = #39033#30446#20998#31867
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object lblName: TLabel [0]
    Left = 18
    Top = 33
    Width = 48
    Height = 12
    Caption = #39033#30446#20998#31867
  end
  object lbllocation: TLabel [1]
    Left = 17
    Top = 78
    Width = 48
    Height = 12
    Caption = #19978#32423#31867#21035
  end
  object Label13: TLabel [2]
    Left = 77
    Top = 98
    Width = 108
    Height = 12
    Caption = '(Ctrl+A'#24314#31435#26681#33410#28857')'
  end
  inherited CancelButton: TButton
    Left = 196
    Top = 126
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 116
    Top = 126
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
    Left = 57
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 230
  end
  object tblDAEDAreas: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    BeforePost = tblDAEDAreasBeforePost
    OnFilterRecord = tblDAEDAreasFilterRecord
    TableName = 'DAProjectClass'
    Left = 25
  end
  object ADOQuery1: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <
      item
        Name = 'Code'
        Attributes = [paNullable]
        DataType = ftString
        NumericScale = 255
        Precision = 255
        Size = 30
        Value = Null
      end>
    SQL.Strings = (
      'select *'
      'from DAProjectClass'
      'where LevelCode not like :Code and RecordState<>'#39#21024#38500#39)
    Left = 170
  end
end
