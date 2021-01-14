inherited DAEdExpenseClassForm: TDAEdExpenseClassForm
  Left = 240
  Top = 177
  Width = 329
  Height = 303
  Caption = #36153#29992#20998#31867#32534#36753
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 19
    Top = 50
    Width = 48
    Height = 12
    Caption = #19978#32423#31867#21035
  end
  object Label2: TLabel [1]
    Left = 19
    Top = 22
    Width = 48
    Height = 12
    Caption = #36153#29992#21517#31216
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 19
    Top = 82
    Width = 42
    Height = 12
    Caption = #22791'   '#27880
  end
  object Label4: TLabel [3]
    Left = 80
    Top = 70
    Width = 96
    Height = 12
    Caption = '(Ctrl+A'#36873#26681#33410#28857')'
  end
  object Label10: TLabel [4]
    Left = 19
    Top = 150
    Width = 48
    Height = 12
    Caption = #23545#24212#31185#30446
  end
  inherited CancelButton: TButton
    Left = 239
    Top = 243
    TabOrder = 4
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 159
    Top = 243
    TabOrder = 3
    OnClick = OKButtonClick
  end
  object DBEdit2: TDBEdit
    Left = 78
    Top = 18
    Width = 200
    Height = 20
    DataField = 'Name'
    DataSource = dsDAEdExpenseClass
    TabOrder = 0
  end
  object DBMemo1: TDBMemo
    Left = 78
    Top = 83
    Width = 200
    Height = 49
    DataField = 'Memo'
    DataSource = dsDAEdExpenseClass
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 78
    Top = 46
    Width = 200
    Height = 20
    DataField = 'Upid'
    DataSource = dsDAEdExpenseClass
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource1
    NullValueKey = 16449
    TabOrder = 1
    OnCloseUp = DBLookupComboBox1CloseUp
  end
  object QLDBLookupComboBox1: TQLDBLookupComboBox
    Left = 78
    Top = 146
    Width = 200
    Height = 20
    Ctl3D = True
    DataField = 'GeneralACID'
    DataSource = dsDAEdExpenseClass
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = GeneralAcIDds
    ParentCtl3D = False
    TabOrder = 5
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object tblDAEdExpenseClass: TADOTable
    Connection = CommonData.acnConnection
    BeforePost = tblDAEdExpenseClassBeforePost
    TableName = 'DAExpenseClass'
    Left = 107
    Top = 209
    object tblDAEdExpenseClassID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblDAEdExpenseClassCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblDAEdExpenseClassCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblDAEdExpenseClassRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblDAEdExpenseClassUpid: TIntegerField
      DisplayLabel = #19978#32423#31867#21035
      FieldName = 'Upid'
    end
    object tblDAEdExpenseClassName: TStringField
      DisplayLabel = #31867#21035#21517#31216
      FieldName = 'Name'
      Size = 60
    end
    object tblDAEdExpenseClassMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object tblDAEdExpenseClassLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
    object tblDAEdExpenseClassGeneralACID: TIntegerField
      FieldName = 'GeneralACID'
    end
  end
  object dsDAEdExpenseClass: TDataSource
    DataSet = tblDAEdExpenseClass
    Left = 152
    Top = 209
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
      'from DAExpenseClass'
      'where LevelCode not like :Code and RecordState<>'#39#21024#38500#39)
    Left = 18
    Top = 209
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 62
    Top = 209
  end
  object GeneralAcIDAds: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ID, SubCode,  Name  from DASubject'#13#10'where LEN(SubCode) =4' +
      '   and'#13#10'name like '#39'%'#36153'%'#39#13#10'order by SubCode,name '#13#10#13#10#13#10
    Parameters = <>
    Left = 248
    Top = 192
  end
  object GeneralAcIDds: TDataSource
    DataSet = GeneralAcIDAds
    Left = 214
    Top = 194
  end
  object TempAds: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ID, SubCode,  Name  from DASubject'#13#10'where LEN(SubCode) =4' +
      '   and'#13#10'name like '#39'%'#20854'%'#39#13#10'order by SubCode,name '#13#10#13#10#13#10
    Parameters = <>
    Left = 128
    Top = 170
  end
end
