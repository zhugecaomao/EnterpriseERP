inherited DAAttributeEditForm: TDAAttributeEditForm
  Left = 271
  Top = 140
  Width = 303
  Height = 240
  Caption = ' '#23646' '#24615' '#32534' '#36753' '
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 20
    Top = 60
    Width = 48
    Height = 12
    Caption = #19978#32423#23646#24615
  end
  object Label2: TLabel [1]
    Left = 20
    Top = 24
    Width = 48
    Height = 12
    Caption = #23646#24615#21517#31216
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 20
    Top = 97
    Width = 42
    Height = 12
    Caption = #22791'   '#27880
  end
  object Label13: TLabel [3]
    Left = 84
    Top = 81
    Width = 108
    Height = 12
    Caption = '(Ctrl+A'#24314#31435#26681#33410#28857')'
  end
  inherited CancelButton: TButton
    Left = 213
    Top = 180
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 133
    Top = 180
    TabOrder = 3
    OnClick = OKButtonClick
  end
  object DBEdit2: TDBEdit
    Left = 80
    Top = 20
    Width = 176
    Height = 20
    DataField = 'Name'
    DataSource = dsDAAttributeEdit
    TabOrder = 0
  end
  object DBMemo1: TDBMemo
    Left = 83
    Top = 96
    Width = 177
    Height = 49
    DataField = 'Memo'
    DataSource = dsDAAttributeEdit
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 82
    Top = 57
    Width = 176
    Height = 20
    DataField = 'Upid'
    DataSource = dsDAAttributeEdit
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource1
    NullValueKey = 16449
    TabOrder = 1
  end
  object tblDAAttributeEdit: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    BeforePost = tblDAAttributeEditBeforePost
    OnFilterRecord = tblDAAttributeEditFilterRecord
    TableName = 'DAAttribute'
    Left = 20
    Top = 136
    object tblDAAttributeEditID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblDAAttributeEditCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblDAAttributeEditCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblDAAttributeEditRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblDAAttributeEditUpid: TIntegerField
      DisplayLabel = #19978#32423#23646#24615
      FieldName = 'Upid'
    end
    object tblDAAttributeEditName: TStringField
      DisplayLabel = #23646#24615#21517#31216
      FieldName = 'Name'
      Size = 60
    end
    object tblDAAttributeEditMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object tblDAAttributeEditLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
  end
  object dsDAAttributeEdit: TDataSource
    DataSet = tblDAAttributeEdit
    Left = 62
    Top = 141
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 105
    Top = 129
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
      'from DAAttribute'
      'where LevelCode not like :Code and RecordState<>'#39#21024#38500#39)
    Left = 200
    Top = 140
  end
end
