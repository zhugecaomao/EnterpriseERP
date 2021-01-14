inherited MSPostionEditForm: TMSPostionEditForm
  Left = 251
  Top = 205
  Width = 370
  Height = 193
  Caption = #32844#20301#36164#26009#32534#36753
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 8
    Top = 28
    Width = 30
    Height = 12
    Caption = #22995#21517':'
    FocusControl = dbeName
  end
  object Label2: TLabel [1]
    Left = 8
    Top = 61
    Width = 30
    Height = 12
    Caption = #32534#30721':'
    FocusControl = dbeCode
  end
  object Label5: TLabel [2]
    Left = 8
    Top = 93
    Width = 48
    Height = 12
    Caption = #32844#20301#31867#21035
  end
  object Label6: TLabel [3]
    Left = 208
    Top = 8
    Width = 30
    Height = 12
    Caption = #22791#27880':'
  end
  inherited CancelButton: TButton
    Left = 280
    Top = 133
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 200
    Top = 133
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object dbeName: TDBEdit
    Left = 58
    Top = 24
    Width = 140
    Height = 20
    DataField = 'Name'
    DataSource = dsPostion
    TabOrder = 0
  end
  object dbeCode: TDBEdit
    Left = 58
    Top = 58
    Width = 140
    Height = 20
    DataField = 'Code'
    DataSource = dsPostion
    TabOrder = 1
  end
  object dblcPostionClass: TDBLookupComboBox
    Left = 58
    Top = 90
    Width = 140
    Height = 20
    DataField = 'PostionClassID'
    DataSource = dsPostion
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsPositionClass
    NullValueKey = 16449
    TabOrder = 2
  end
  object dbmMemo: TDBMemo
    Left = 208
    Top = 24
    Width = 145
    Height = 89
    DataField = 'Memo'
    DataSource = dsPostion
    TabOrder = 3
  end
  object atbPostion: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    BeforePost = atbPostionBeforePost
    OnFilterRecord = atbPostionFilterRecord
    TableName = 'MSPostion'
    Left = 30
    Top = 131
    object atbPostionID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object atbPostionCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object atbPostionCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object atbPostionRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object atbPostionName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object atbPostionCode: TStringField
      FieldName = 'Code'
    end
    object atbPostionMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object atbPostionPostionClassID: TIntegerField
      FieldName = 'PostionClassID'
    end
  end
  object dsPostion: TDataSource
    DataSet = atbPostion
    Left = 60
    Top = 131
  end
  object dsPositionClass: TDataSource
    DataSet = atbPostionClass
    Left = 127
    Top = 131
  end
  object atbPostionClass: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = atbPostionFilterRecord
    TableName = 'MSPostionClass'
    Left = 95
    Top = 131
    object atbPostionClassID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object atbPostionClassCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object atbPostionClassCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object atbPostionClassRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object atbPostionClassName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object atbPostionClassCode: TStringField
      FieldName = 'Code'
    end
    object atbPostionClassUpid: TIntegerField
      FieldName = 'Upid'
    end
    object atbPostionClassMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object atbPostionClassLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
  end
end
