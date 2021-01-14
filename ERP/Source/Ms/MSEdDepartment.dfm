inherited MSDepartmentEditForm: TMSDepartmentEditForm
  Left = 187
  Top = 160
  Width = 520
  Height = 257
  Caption = #37096#38376#36164#26009
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 14
    Top = 20
    Width = 48
    Height = 12
    Caption = #37096#38376#21517#31216
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 257
    Top = 20
    Width = 42
    Height = 12
    Caption = #22320'   '#28857
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 14
    Top = 52
    Width = 48
    Height = 12
    Caption = #37096#38376#20195#30721
    FocusControl = DBEdit3
  end
  object Label4: TLabel [3]
    Left = 257
    Top = 52
    Width = 42
    Height = 12
    Caption = #30005'   '#35805
    FocusControl = DBEdit4
  end
  object Label5: TLabel [4]
    Left = 14
    Top = 85
    Width = 48
    Height = 12
    Caption = #19978#32423#37096#38376
  end
  object Label6: TLabel [5]
    Left = 257
    Top = 85
    Width = 42
    Height = 12
    Caption = #20256'   '#30495
    FocusControl = DBEdit6
  end
  object Label7: TLabel [6]
    Left = 14
    Top = 117
    Width = 48
    Height = 12
    Caption = #37096#38376#39046#23548
  end
  object Label8: TLabel [7]
    Left = 257
    Top = 117
    Width = 48
    Height = 12
    Caption = #30005#23376#20449#31665
    FocusControl = DBEdit8
  end
  object Label9: TLabel [8]
    Left = 257
    Top = 150
    Width = 42
    Height = 12
    Caption = #32593'   '#31449
    FocusControl = DBEdit5
  end
  object Label10: TLabel [9]
    Left = 14
    Top = 150
    Width = 48
    Height = 12
    Caption = #23545#24212#31185#30446
  end
  inherited CancelButton: TButton
    Left = 430
    Top = 197
    TabOrder = 10
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 350
    Top = 197
    TabOrder = 9
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 65
    Top = 16
    Width = 180
    Height = 20
    DataField = 'Name'
    DataSource = dsMSEedtDp
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 310
    Top = 16
    Width = 180
    Height = 20
    DataField = 'Address'
    DataSource = dsMSEedtDp
    TabOrder = 1
  end
  object DBEdit3: TDBEdit
    Left = 65
    Top = 48
    Width = 180
    Height = 20
    DataField = 'Code'
    DataSource = dsMSEedtDp
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 310
    Top = 48
    Width = 180
    Height = 20
    DataField = 'Phone'
    DataSource = dsMSEedtDp
    TabOrder = 3
  end
  object DBEdit6: TDBEdit
    Left = 310
    Top = 81
    Width = 180
    Height = 20
    DataField = 'Fax'
    DataSource = dsMSEedtDp
    TabOrder = 5
  end
  object DBEdit8: TDBEdit
    Left = 310
    Top = 113
    Width = 180
    Height = 20
    DataField = 'Email'
    DataSource = dsMSEedtDp
    TabOrder = 7
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 65
    Top = 81
    Width = 180
    Height = 20
    DataField = 'Upid'
    DataSource = dsMSEedtDp
    KeyField = 'ID'
    ListField = 'Name'
    ListFieldIndex = 2
    ListSource = dsUpid
    NullValueKey = 16449
    TabOrder = 4
  end
  object DBEdit5: TDBEdit
    Left = 310
    Top = 146
    Width = 180
    Height = 20
    DataField = 'Web'
    DataSource = dsMSEedtDp
    TabOrder = 8
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 65
    Top = 113
    Width = 180
    Height = 20
    DataField = 'LeaderID'
    DataSource = dsMSEedtDp
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsLeaderId
    NullValueKey = 16449
    TabOrder = 6
  end
  object QLDBLookupComboBox1: TQLDBLookupComboBox
    Left = 65
    Top = 146
    Width = 180
    Height = 20
    Ctl3D = True
    DataField = 'GeneralACID'
    DataSource = dsMSEedtDp
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = GeneralAcIDds
    ParentCtl3D = False
    TabOrder = 11
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object tblMSEedtDp: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    BeforePost = tblMSEedtDpBeforePost
    OnFilterRecord = tblMSEedtDpFilterRecord
    TableName = 'MSDepartment'
    Left = 44
    Top = 194
    object tblMSEedtDpID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblMSEedtDpCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblMSEedtDpCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblMSEedtDpRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblMSEedtDpName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object tblMSEedtDpCode: TStringField
      FieldName = 'Code'
    end
    object tblMSEedtDpUpid: TIntegerField
      FieldName = 'Upid'
    end
    object tblMSEedtDpMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object tblMSEedtDpLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
    object tblMSEedtDpLeaderID: TIntegerField
      FieldName = 'LeaderID'
    end
    object tblMSEedtDpAddress: TStringField
      FieldName = 'Address'
      Size = 60
    end
    object tblMSEedtDpPhone: TStringField
      FieldName = 'Phone'
      Size = 30
    end
    object tblMSEedtDpFax: TStringField
      FieldName = 'Fax'
      Size = 30
    end
    object tblMSEedtDpEmail: TStringField
      FieldName = 'Email'
      Size = 60
    end
    object tblMSEedtDpWeb: TStringField
      FieldName = 'Web'
      Size = 60
    end
    object tblMSEedtDpGeneralACID: TIntegerField
      FieldName = 'GeneralACID'
    end
  end
  object dsMSEedtDp: TDataSource
    DataSet = tblMSEedtDp
    Left = 10
    Top = 194
  end
  object dsUpid: TDataSource
    DataSet = ADOQuery1
    Left = 113
    Top = 194
  end
  object dsLeaderId: TDataSource
    DataSet = tblLeaderID
    Left = 182
    Top = 194
  end
  object tblLeaderID: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = tblLeaderIDFilterRecord
    IndexFieldNames = 'DepartmentID'
    MasterFields = 'ID'
    MasterSource = dsMSEedtDp
    TableName = 'MSEmployee'
    Left = 147
    Top = 194
    object tblLeaderIDID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblLeaderIDCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblLeaderIDCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblLeaderIDRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblLeaderIDName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object tblLeaderIDCode: TStringField
      FieldName = 'Code'
    end
    object tblLeaderIDGender: TStringField
      FieldName = 'Gender'
      Size = 6
    end
    object tblLeaderIDDepartmentID: TIntegerField
      FieldName = 'DepartmentID'
    end
    object tblLeaderIDPositionClassID: TIntegerField
      FieldName = 'PositionClassID'
    end
    object tblLeaderIDPostionID: TIntegerField
      FieldName = 'PostionID'
    end
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
      'from MSDepartment'
      'where LevelCode not like :Code and RecordState<>'#39#21024#38500#39)
    Left = 78
    Top = 194
  end
  object GeneralAcIDds: TDataSource
    DataSet = GeneralAcIDAds
    Left = 214
    Top = 194
  end
  object GeneralAcIDAds: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ID, SubCode,  Name  from DASubject'#13#10'where LEN(SubCode) =4' +
      '   and'#13#10'name like '#39'%'#20854'%'#39#13#10'order by SubCode,name '#13#10#13#10#13#10
    Parameters = <>
    Left = 248
    Top = 194
  end
  object TempAds: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ID, SubCode,  Name  from DASubject'#13#10'where LEN(SubCode) =4' +
      '   and'#13#10'name like '#39'%'#20854'%'#39#13#10'order by SubCode,name '#13#10#13#10#13#10
    Parameters = <>
    Left = 288
    Top = 170
  end
end
