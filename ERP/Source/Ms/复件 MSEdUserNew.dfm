inherited MSEdUserNewForm: TMSEdUserNewForm
  Left = 173
  Top = 209
  Width = 514
  Height = 383
  Caption = #29992#25143#23450#20041
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited CancelButton: TButton
    Left = 418
    Top = 323
    Width = 60
    Height = 23
    TabOrder = 6
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 338
    Top = 323
    Width = 60
    Height = 23
    TabOrder = 5
    OnClick = OKButtonClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 506
    Height = 82
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label2: TLabel
      Left = 287
      Top = 19
      Width = 48
      Height = 12
      Caption = #29992#25143#21517#31216
    end
    object Label7: TLabel
      Left = 31
      Top = 19
      Width = 48
      Height = 12
      Caption = #21592#24037#22995#21517
    end
    object DBEdit1: TDBEdit
      Left = 338
      Top = 15
      Width = 130
      Height = 20
      DataField = 'Name'
      DataSource = DataSource1
      TabOrder = 1
    end
    object LookupEmployee: TQLDBLookupComboBox
      Left = 82
      Top = 15
      Width = 130
      Height = 20
      BevelEdges = []
      BevelOuter = bvRaised
      Ctl3D = True
      DataField = 'EmployeeID'
      DataSource = DataSource1
      DropDownRows = 10
      KeyField = 'ID'
      ListField = 'Name'
      ListSource = DsEmployee
      OnClick = LookupEmployeeClick
      ParentCtl3D = False
      TabOrder = 0
      ButtonHeight = 22
      SearchMode = smLocate
      SearchType = stAuto
      VisibleButtons = [lbSetNull]
    end
    object Edit1: TLabeledEdit
      Left = 82
      Top = 47
      Width = 130
      Height = 20
      EditLabel.Width = 48
      EditLabel.Height = 12
      EditLabel.Caption = #29992#25143#23494#30721
      LabelPosition = lpLeft
      LabelSpacing = 3
      PasswordChar = '*'
      TabOrder = 2
    end
    object Edit2: TLabeledEdit
      Left = 339
      Top = 47
      Width = 130
      Height = 20
      EditLabel.Width = 48
      EditLabel.Height = 12
      EditLabel.Caption = #25928#39564#23494#30721
      LabelPosition = lpLeft
      LabelSpacing = 3
      PasswordChar = '*'
      TabOrder = 3
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 82
    Width = 506
    Height = 229
    Align = alTop
    BevelOuter = bvNone
    Caption = 'Panel2'
    TabOrder = 1
    object GroupBox1: TGroupBox
      Left = 0
      Top = 0
      Width = 185
      Height = 229
      Align = alLeft
      Caption = #26435#38480#31867#21035
      TabOrder = 0
      object ListBox: TListBox
        Left = 2
        Top = 14
        Width = 181
        Height = 213
        Align = alClient
        ItemHeight = 12
        TabOrder = 0
        OnClick = ListBoxClick
        OnExit = ListBoxExit
      end
    end
    object GroupBox2: TGroupBox
      Left = 185
      Top = 0
      Width = 321
      Height = 229
      Align = alClient
      Caption = #29992#25143#26435#38480
      TabOrder = 1
      object Listview: TListView
        Left = 2
        Top = 14
        Width = 317
        Height = 213
        Align = alClient
        Checkboxes = True
        Columns = <>
        TabOrder = 0
        ViewStyle = vsList
        OnChange = ListviewChange
      end
    end
  end
  object BitBtn1: TBitBtn
    Left = 11
    Top = 325
    Width = 50
    Height = 19
    Caption = #20840#36873
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 67
    Top = 325
    Width = 50
    Height = 19
    Caption = #20840#28165
    TabOrder = 3
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 123
    Top = 325
    Width = 50
    Height = 19
    Caption = #32487#25215
    TabOrder = 4
    OnClick = BitBtn3Click
  end
  object BitBtn5: TBitBtn
    Left = 284
    Top = 325
    Width = 35
    Height = 19
    Caption = #25191#34892
    TabOrder = 7
    Visible = False
    OnClick = BitBtn5Click
  end
  object DBComboBox1: TDBLookupComboBox
    Left = 184
    Top = 325
    Width = 97
    Height = 20
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource2
    TabOrder = 8
    Visible = False
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from  MSUser'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 248
    Top = 104
    object ADODataSet1ID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object ADODataSet1CreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object ADODataSet1CreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object ADODataSet1RecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object ADODataSet1RoleID: TIntegerField
      FieldName = 'RoleID'
    end
    object ADODataSet1EmployeeID: TIntegerField
      FieldName = 'EmployeeID'
    end
    object ADODataSet1Code: TStringField
      FieldName = 'Code'
      Visible = False
    end
    object ADODataSet1Name: TStringField
      FieldName = 'Name'
    end
    object ADODataSet1PassWord: TIntegerField
      FieldName = 'PassWord'
    end
    object ADODataSet1BeginDate: TDateTimeField
      FieldName = 'BeginDate'
    end
    object ADODataSet1EndDate: TDateTimeField
      FieldName = 'EndDate'
    end
    object ADODataSet1Employee: TStringField
      FieldKind = fkLookup
      FieldName = 'Employee'
      LookupDataSet = AdsEmployee
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'EmployeeID'
      Lookup = True
    end
    object ADODataSet1IsUsed: TIntegerField
      FieldName = 'IsUsed'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 288
    Top = 104
  end
  object AdsEmployee: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select  *  from   MSEmployee '#13#10'where RecordState<>'#39#21024#38500#39#13#10'and Depa' +
      'rtmentID  in '#13#10'( select ID from MSDepartment '#13#10'where RecordState' +
      '<>'#39#21024#38500#39')'#13#10
    Parameters = <>
    Left = 248
    Top = 152
    object AutoIncField1: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object AdsEmployeeCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object AdsEmployeeCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object AdsEmployeeRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object AdsEmployeeName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object AdsEmployeeCode: TStringField
      FieldName = 'Code'
    end
    object AdsEmployeeGender: TStringField
      FieldName = 'Gender'
      Size = 6
    end
    object AdsEmployeeDepartmentID: TIntegerField
      FieldName = 'DepartmentID'
    end
    object AdsEmployeePostDate: TDateTimeField
      FieldName = 'PostDate'
    end
    object AdsEmployeePositionClassID: TIntegerField
      FieldName = 'PositionClassID'
    end
    object AdsEmployeePostionID: TIntegerField
      FieldName = 'PostionID'
    end
    object AdsEmployeeBarCode: TStringField
      FieldName = 'BarCode'
    end
  end
  object DsEmployee: TDataSource
    DataSet = AdsEmployee
    Left = 288
    Top = 152
  end
  object TempAds: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select  *  from   MSEmployee '#13#10'where RecordState<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 56
    Top = 224
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 104
    Top = 224
  end
  object dsTempAds: TDataSource
    DataSet = TempAds
    Left = 328
    Top = 232
  end
  object ADODataSet2: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from  MSUserNew '#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 216
    Top = 224
    object AutoIncField2: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'CreateDate'
    end
    object IntegerField1: TIntegerField
      FieldName = 'CreateUserID'
    end
    object StringField1: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object IntegerField2: TIntegerField
      FieldName = 'RoleID'
    end
    object IntegerField3: TIntegerField
      FieldName = 'EmployeeID'
    end
    object StringField2: TStringField
      FieldName = 'Code'
    end
    object StringField3: TStringField
      FieldName = 'Name'
    end
    object IntegerField4: TIntegerField
      FieldName = 'PassWord'
    end
    object StringField4: TStringField
      FieldName = 'IsUsed'
      FixedChar = True
      Size = 1
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'BeginDate'
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'EndDate'
    end
    object StringField5: TStringField
      FieldKind = fkLookup
      FieldName = 'Employee'
      LookupDataSet = AdsEmployee
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'EmployeeID'
      Lookup = True
    end
  end
  object DataSource2: TDataSource
    DataSet = ADODataSet2
    Left = 256
    Top = 224
  end
end
