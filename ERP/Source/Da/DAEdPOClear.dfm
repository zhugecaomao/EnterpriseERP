inherited DAEdPOClearForm: TDAEdPOClearForm
  Left = 244
  Top = 157
  Width = 302
  Height = 201
  Caption = ' '#32467#31639#26041#24335#20462#25913
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 20
    Top = 25
    Width = 48
    Height = 12
    Caption = #32467#31639#26041#24335
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 20
    Top = 55
    Width = 42
    Height = 12
    Caption = #22791'   '#27880
  end
  inherited CancelButton: TButton
    Left = 212
    Top = 141
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 132
    Top = 141
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 75
    Top = 25
    Width = 200
    Height = 20
    DataField = 'Name'
    DataSource = dsDAEdPOClear
    TabOrder = 0
  end
  object DBMemo1: TDBMemo
    Left = 75
    Top = 55
    Width = 200
    Height = 71
    DataField = 'Memo'
    DataSource = dsDAEdPOClear
    TabOrder = 1
  end
  object tblDAEdPOClear: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    BeforePost = tblDAEdPOClearBeforePost
    OnFilterRecord = tblDAEdPOClearFilterRecord
    TableName = 'POClear'
    Left = 10
    Top = 101
    object tblDAEdPOClearID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblDAEdPOClearCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblDAEdPOClearCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblDAEdPOClearRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblDAEdPOClearName: TStringField
      DisplayLabel = #32467#31639#26041#24335
      FieldName = 'Name'
    end
    object tblDAEdPOClearMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 40
    end
    object tblDAEdPOClearBrief: TStringField
      FieldName = 'Brief'
      Visible = False
      Size = 30
    end
  end
  object dsDAEdPOClear: TDataSource
    DataSet = tblDAEdPOClear
    Left = 50
    Top = 95
  end
end
