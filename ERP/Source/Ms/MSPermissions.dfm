inherited MSPermissionsForm: TMSPermissionsForm
  Left = 227
  Top = 233
  Width = 503
  Caption = #26435#38480#30331#35760
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited CancelButton: TButton
    Left = 413
    Caption = #20851#38381
    TabOrder = 7
  end
  inherited OKButton: TButton
    Left = 333
    ModalResult = 1
    TabOrder = 6
    Visible = False
    OnClick = OKButtonClick
  end
  object qdgPermissionClass: TQLDBGrid
    Left = 8
    Top = 8
    Width = 105
    Height = 201
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    OnExit = qdgPermissionClassExit
    AlternateColor = clWindow
    CurrencyView.CurrencyTitle = False
    CurrencyView.DigitAlignment = taCenter
    CurrencyView.DigitWidth = 9
    CurrencyView.IntegerSeparateColor = clRed
    CurrencyView.SeparateColor = clSilver
    CurrencyView.ThousandSeparateColor = clGray
    CurrencyView.TitleLines = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 0
    OptionsEx = [dgAllowDelete, dgAllowInsert]
  end
  object qdgPermission: TQLDBGrid
    Left = 121
    Top = 8
    Width = 366
    Height = 201
    DataSource = DataSource2
    TabOrder = 1
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    AlternateColor = clWindow
    CurrencyView.CurrencyTitle = False
    CurrencyView.DigitAlignment = taCenter
    CurrencyView.DigitWidth = 9
    CurrencyView.IntegerSeparateColor = clRed
    CurrencyView.SeparateColor = clSilver
    CurrencyView.ThousandSeparateColor = clGray
    CurrencyView.TitleLines = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 0
    OptionsEx = [dgAllowDelete, dgAllowInsert]
  end
  object btnAddClass: TButton
    Left = 8
    Top = 216
    Width = 33
    Height = 25
    Caption = #28155#21152
    TabOrder = 2
    OnClick = btnAddClassClick
  end
  object btnDeleteClass: TButton
    Left = 40
    Top = 216
    Width = 33
    Height = 25
    Caption = #21024#38500
    TabOrder = 3
    OnClick = btnDeleteClassClick
  end
  object btnAdd: TButton
    Left = 120
    Top = 216
    Width = 33
    Height = 25
    Caption = #28155#21152
    TabOrder = 4
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 152
    Top = 216
    Width = 33
    Height = 25
    Caption = #21024#38500
    TabOrder = 5
    OnClick = btnDeleteClick
  end
  object DataSource1: TDataSource
    DataSet = adsPermissionClass
    Left = 8
    Top = 128
  end
  object DataSource2: TDataSource
    DataSet = adsPermission
    Left = 144
    Top = 128
  end
  object adsPermissionClass: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'MSPermissionClass'
    CommandType = cmdTable
    IndexFieldNames = 'ID'
    MasterFields = 'PermissionClassID'
    Parameters = <>
    Left = 40
    Top = 128
    object adsPermissionClassID: TAutoIncField
      DisplayLabel = #20998#31867
      FieldName = 'ID'
      Visible = False
    end
    object adsPermissionClassCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsPermissionClassCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsPermissionClassRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsPermissionClassName: TStringField
      DisplayLabel = #20998#31867
      FieldName = 'Name'
    end
    object adsPermissionClassMemo: TStringField
      FieldName = 'Memo'
      Visible = False
      Size = 60
    end
  end
  object adsPermission: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    OnNewRecord = adsPermissionNewRecord
    CommandText = 'MSPermission'
    CommandType = cmdTable
    DataSource = DataSource1
    IndexFieldNames = 'PermissionClassID'
    MasterFields = 'ID'
    Parameters = <>
    Left = 176
    Top = 128
    object adsPermissionID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsPermissionCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsPermissionCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsPermissionRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsPermissionName: TStringField
      DisplayLabel = #26435#38480
      FieldName = 'Name'
    end
    object adsPermissionPermissionClassID: TIntegerField
      FieldName = 'PermissionClassID'
      Visible = False
    end
    object adsPermissionCode: TStringField
      DisplayLabel = #20195#30721
      DisplayWidth = 30
      FieldName = 'Code'
      Size = 50
    end
  end
end
