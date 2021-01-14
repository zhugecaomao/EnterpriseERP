inherited MSPostionClassEditForm: TMSPostionClassEditForm
  Left = 211
  Top = 198
  Width = 499
  Height = 185
  Caption = #32844#20301#31867#21035#32534#36753
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 8
    Top = 12
    Width = 54
    Height = 12
    Caption = #21517'    '#31216':'
    FocusControl = dbeName
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 49
    Width = 48
    Height = 12
    Caption = #20195'    '#30721
    FocusControl = dbeCode
  end
  object Label4: TLabel [2]
    Left = 257
    Top = 9
    Width = 54
    Height = 12
    Caption = #22791'    '#27880':'
  end
  object Label5: TLabel [3]
    Left = 8
    Top = 94
    Width = 54
    Height = 12
    Caption = #19978#32423#32844#21035':'
  end
  inherited CancelButton: TButton
    Left = 409
    Top = 125
    TabOrder = 5
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 329
    Top = 125
    TabOrder = 4
    OnClick = OKButtonClick
  end
  object dbeName: TDBEdit
    Left = 65
    Top = 8
    Width = 172
    Height = 20
    DataField = 'Name'
    DataSource = dsMSPostionClass
    TabOrder = 0
  end
  object dbeCode: TDBEdit
    Left = 65
    Top = 49
    Width = 172
    Height = 20
    DataField = 'Code'
    DataSource = dsMSPostionClass
    TabOrder = 1
  end
  object dblcUpID: TDBLookupComboBox
    Left = 65
    Top = 90
    Width = 172
    Height = 20
    DataField = 'Upid'
    DataSource = dsMSPostionClass
    KeyField = 'ID'
    ListField = 'Name'
    ListFieldIndex = 2
    ListSource = dsUpid
    NullValueKey = 16449
    TabOrder = 2
  end
  object dbmMemo: TDBMemo
    Left = 309
    Top = 9
    Width = 169
    Height = 96
    DataField = 'Memo'
    DataSource = dsMSPostionClass
    TabOrder = 3
  end
  object atbMSPostionClass: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    BeforePost = atbMSPostionClassBeforePost
    OnFilterRecord = atbMSPostionClassFilterRecord
    TableName = 'MSPostionClass'
    Left = 46
    Top = 124
    object atbMSPostionClassID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object atbMSPostionClassCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object atbMSPostionClassCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object atbMSPostionClassRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object atbMSPostionClassName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object atbMSPostionClassCode: TStringField
      FieldName = 'Code'
    end
    object atbMSPostionClassUpid: TIntegerField
      FieldName = 'Upid'
    end
    object atbMSPostionClassMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object atbMSPostionClassLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
  end
  object dsMSPostionClass: TDataSource
    DataSet = atbMSPostionClass
    Left = 12
    Top = 124
  end
  object dsUpid: TDataSource
    DataSet = adrQuery
    Left = 130
    Top = 124
  end
  object dsLeaderId: TDataSource
    DataSet = atbLeaderID
    Left = 206
    Top = 124
  end
  object atbLeaderID: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = atbLeaderIDFilterRecord
    IndexFieldNames = 'PostionClassID'
    MasterFields = 'ID'
    MasterSource = dsMSPostionClass
    TableName = 'MSPostion'
    Left = 169
    Top = 124
    object atbLeaderIDID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object atbLeaderIDCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object atbLeaderIDCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object atbLeaderIDRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object atbLeaderIDName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object atbLeaderIDCode: TStringField
      FieldName = 'Code'
    end
    object atbLeaderIDMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object atbLeaderIDPostionClassID: TIntegerField
      FieldName = 'PostionClassID'
    end
  end
  object adrQuery: TADOQuery
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
      'from MSPostionClass'
      'where LevelCode not like :Code and RecordState<>'#39#21024#38500#39)
    Left = 99
    Top = 124
  end
end
