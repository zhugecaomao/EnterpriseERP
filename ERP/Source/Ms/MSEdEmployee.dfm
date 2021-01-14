inherited MSEdEmployeeForm: TMSEdEmployeeForm
  Left = 204
  Top = 99
  Width = 409
  Height = 241
  Caption = #21592#24037#36164#26009#32534#36753
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 16
    Top = 21
    Width = 42
    Height = 12
    Caption = #22995'   '#21517
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 209
    Top = 21
    Width = 48
    Height = 12
    Caption = #21592#24037#32534#30721
    FocusControl = DBEdit2
  end
  object Label3: TLabel [2]
    Left = 16
    Top = 57
    Width = 42
    Height = 12
    Caption = #24615'   '#21035
  end
  object Label4: TLabel [3]
    Left = 16
    Top = 93
    Width = 42
    Height = 12
    Caption = #37096'   '#38376
  end
  object Label5: TLabel [4]
    Left = 209
    Top = 130
    Width = 48
    Height = 12
    Caption = #20837#32844#26085#26399
  end
  object Label6: TLabel [5]
    Left = 16
    Top = 130
    Width = 42
    Height = 12
    Caption = #32844'   '#20301
  end
  object Label7: TLabel [6]
    Left = 209
    Top = 57
    Width = 48
    Height = 12
    Caption = #32771#21220#21345#21495
    FocusControl = DBEdit4
  end
  inherited CancelButton: TButton
    Left = 315
    Top = 169
    TabOrder = 9
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 235
    Top = 169
    TabOrder = 8
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 69
    Top = 17
    Width = 120
    Height = 20
    DataField = 'Name'
    DataSource = dsEmployee
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 264
    Top = 18
    Width = 120
    Height = 20
    DataField = 'Code'
    DataSource = dsEmployee
    TabOrder = 1
    OnExit = DBEdit2Exit
  end
  object DBComboBox1: TDBComboBox
    Left = 69
    Top = 53
    Width = 120
    Height = 20
    Style = csDropDownList
    DataField = 'Gender'
    DataSource = dsEmployee
    ItemHeight = 12
    Items.Strings = (
      #30007
      #22899)
    TabOrder = 2
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 69
    Top = 89
    Width = 286
    Height = 20
    DataField = 'DepartmentID'
    DataSource = dsEmployee
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsDepartment
    NullValueKey = 16449
    TabOrder = 4
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 69
    Top = 126
    Width = 116
    Height = 20
    DataField = 'PostionID'
    DataSource = dsEmployee
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsPosition
    NullValueKey = 16449
    TabOrder = 5
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 21
    Top = 194
    Width = 84
    Height = 20
    DataField = 'PositionClassID'
    DataSource = dsEmployee
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsPositionClass
    NullValueKey = 16449
    TabOrder = 6
    Visible = False
  end
  object DBEdit3: TDBEdit
    Left = 264
    Top = 126
    Width = 120
    Height = 20
    DataField = 'PostDate'
    DataSource = dsEmployee
    MaxLength = 10
    TabOrder = 7
  end
  object DBEdit4: TDBEdit
    Left = 264
    Top = 53
    Width = 120
    Height = 20
    DataField = 'BarCode'
    DataSource = dsEmployee
    TabOrder = 3
  end
  object tblEmployee: TADOTable
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    BeforePost = tblEmployeeBeforePost
    OnFilterRecord = tblEmployeeFilterRecord
    TableName = 'MSEmployee'
    Left = 102
    Top = 163
    object tblEmployeeID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblEmployeeCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblEmployeeCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblEmployeeRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblEmployeeName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object tblEmployeeCode: TStringField
      FieldName = 'Code'
    end
    object tblEmployeeGender: TStringField
      FieldName = 'Gender'
      Size = 6
    end
    object tblEmployeeDepartmentID: TIntegerField
      FieldName = 'DepartmentID'
    end
    object tblEmployeePositionClassID: TIntegerField
      FieldName = 'PositionClassID'
    end
    object tblEmployeePostionID: TIntegerField
      FieldName = 'PostionID'
    end
    object tblEmployeePostDate: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'PostDate'
      DisplayFormat = 'yyyy-mm-dd'
      EditMask = '9999-99-99;1;_'
    end
    object tblEmployeeBarCode: TStringField
      FieldName = 'BarCode'
    end
  end
  object dsEmployee: TDataSource
    DataSet = tblEmployee
    Left = 44
    Top = 112
  end
  object tblDepartment: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = tblDepartmentFilterRecord
    TableName = 'MSDepartment'
    Left = 202
    Top = 165
  end
  object dsDepartment: TDataSource
    DataSet = tblDepartment
    Left = 223
    Top = 162
  end
  object tblPosition: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = tblEmployeeFilterRecord
    TableName = 'MSPostion'
    Left = 25
    Top = 160
  end
  object dsPosition: TDataSource
    DataSet = tblPosition
    Left = 70
    Top = 160
  end
  object dsPositionClass: TDataSource
    DataSet = tblPositionClass
    Left = 167
    Top = 162
  end
  object tblPositionClass: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = tblEmployeeFilterRecord
    IndexFieldNames = 'ID'
    MasterFields = 'PostionClassID'
    MasterSource = dsPosition
    TableName = 'MSPostionClass'
    Left = 135
    Top = 162
  end
end
