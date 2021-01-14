inherited MSEdUserForm: TMSEdUserForm
  Left = 243
  Top = 152
  Height = 300
  Caption = #29992#25143
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 8
    Top = 80
    Width = 48
    Height = 12
    Caption = #38582#23646#20110#65306
  end
  object Label2: TLabel [1]
    Left = 200
    Top = 11
    Width = 60
    Height = 12
    Caption = #36134#21495#20851#32852#65306
  end
  inherited CancelButton: TButton
    Top = 240
    TabOrder = 6
  end
  inherited OKButton: TButton
    Top = 240
    TabOrder = 7
    OnClick = OKButtonClick
  end
  object edtName: TLabeledEdit
    Left = 48
    Top = 8
    Width = 137
    Height = 20
    EditLabel.Width = 36
    EditLabel.Height = 12
    EditLabel.Caption = #21517#31216#65306
    LabelPosition = lpLeft
    LabelSpacing = 3
    TabOrder = 0
  end
  object edtPassword: TLabeledEdit
    Left = 48
    Top = 40
    Width = 137
    Height = 20
    EditLabel.Width = 36
    EditLabel.Height = 12
    EditLabel.Caption = #23494#30721#65306
    LabelPosition = lpLeft
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 1
  end
  object edtPasswordAgain: TLabeledEdit
    Left = 264
    Top = 40
    Width = 129
    Height = 20
    EditLabel.Width = 60
    EditLabel.Height = 12
    EditLabel.Caption = #37325#22797#23494#30721#65306
    LabelPosition = lpLeft
    LabelSpacing = 3
    PasswordChar = '*'
    TabOrder = 2
  end
  object btnAdd: TButton
    Left = 344
    Top = 104
    Width = 73
    Height = 25
    Caption = #28155#21152'(&A)...'
    TabOrder = 4
    OnClick = btnAddClick
  end
  object lbTerm: TListBox
    Left = 8
    Top = 104
    Width = 321
    Height = 121
    ItemHeight = 12
    TabOrder = 3
  end
  object btnDelete: TButton
    Left = 344
    Top = 136
    Width = 73
    Height = 25
    Caption = #21024#38500'(&D)...'
    TabOrder = 5
    OnClick = btnDeleteClick
  end
  object dblcEmployee: TDBLookupComboBox
    Left = 264
    Top = 8
    Width = 129
    Height = 20
    DataSource = dsUser
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsEmployee
    TabOrder = 8
  end
  object adsUser: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from MSRole '#13#10' WHERE RecordState<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 56
    Top = 184
  end
  object dsUser: TDataSource
    DataSet = adrUser
    Left = 24
    Top = 184
  end
  object adrUser: TADOQuery
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    SQL.Strings = (
      'select * from MSUser where RoleID=:ID')
    Left = 88
    Top = 184
  end
  object dsEmployee: TDataSource
    DataSet = adsEmployee
    Left = 232
    Top = 64
  end
  object adsEmployee: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    BeforeOpen = adsEmployeeBeforeOpen
    CommandText = 
      'SELECT *  FROM MSEmployee'#13#10' WHERE RecordState<>'#39#21024#38500#39#13#10' AND  NOT I' +
      'D IN '#13#10'(SELECT EmployeeID FROM MSUser WHERE RecordState<>'#39#21024#38500#39')'
    Parameters = <>
    Prepared = True
    Left = 272
    Top = 64
    object adsEmployeeID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsEmployeeCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsEmployeeCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsEmployeeRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsEmployeeName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object adsEmployeeCode: TStringField
      FieldName = 'Code'
    end
    object adsEmployeeGender: TStringField
      FieldName = 'Gender'
      Size = 6
    end
    object adsEmployeeDepartmentID: TIntegerField
      FieldName = 'DepartmentID'
    end
    object adsEmployeePositionClassID: TIntegerField
      FieldName = 'PositionClassID'
    end
    object adsEmployeePostionID: TIntegerField
      FieldName = 'PostionID'
    end
  end
end
