inherited YDEdPWForm: TYDEdPWForm
  Left = 225
  Top = 163
  Width = 280
  Height = 218
  Caption = #29983#20135#33021#21147#32534#36753
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 23
    Top = 16
    Width = 48
    Height = 12
    Caption = #33021#21147#31867#21035
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 23
    Top = 45
    Width = 48
    Height = 12
    Caption = #33021#21147#21517#31216
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 23
    Top = 74
    Width = 48
    Height = 12
    Caption = #33021#21147#25351#25968
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 27
    Top = 114
    Width = 42
    Height = 12
    Caption = #22791'   '#27880
  end
  inherited CancelButton: TButton
    Left = 190
    Top = 158
    TabOrder = 5
  end
  inherited OKButton: TButton
    Left = 110
    Top = 158
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 86
    Top = 12
    Width = 140
    Height = 20
    DataField = 'Class'
    DataSource = dsYDEdPW
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 87
    Top = 42
    Width = 140
    Height = 20
    DataField = 'Name'
    DataSource = dsYDEdPW
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 87
    Top = 71
    Width = 140
    Height = 20
    DataField = 'PowerIndex'
    DataSource = dsYDEdPW
    TabOrder = 2
  end
  object DBMemo1: TDBMemo
    Left = 87
    Top = 103
    Width = 142
    Height = 41
    DataField = 'Memo'
    DataSource = dsYDEdPW
    TabOrder = 3
  end
  object tblYDEdPW: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    AfterInsert = tblYDEdPWAfterInsert
    CommandText = 'select *'#13#10'from YDProductPower'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 240
    object tblYDEdPWID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblYDEdPWCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblYDEdPWCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblYDEdPWRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblYDEdPWClass: TStringField
      DisplayLabel = #33021#21147#31867#21035
      FieldName = 'Class'
    end
    object tblYDEdPWName: TStringField
      DisplayLabel = #33021#21147#21517#31216
      FieldName = 'Name'
    end
    object tblYDEdPWPowerIndex: TBCDField
      DisplayLabel = #33021#21147#25351#25968
      FieldName = 'PowerIndex'
      Precision = 18
      Size = 0
    end
    object tblYDEdPWMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 40
    end
  end
  object dsYDEdPW: TDataSource
    DataSet = tblYDEdPW
    Left = 248
    Top = 32
  end
end
