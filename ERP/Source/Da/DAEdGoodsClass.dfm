inherited DAGoodsClassEditForm: TDAGoodsClassEditForm
  Left = 253
  Top = 163
  Width = 358
  Height = 279
  Caption = #21830#21697#20998#31867#32534#36753
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 25
    Top = 32
    Width = 48
    Height = 12
    Caption = #21830#21697#20998#31867
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 25
    Top = 66
    Width = 48
    Height = 12
    Caption = #19978#32423#20998#31867
  end
  object Label13: TLabel [2]
    Left = 107
    Top = 82
    Width = 108
    Height = 12
    Caption = '(Ctrl+A'#24314#31435#26681#33410#28857')'
  end
  object Label3: TLabel [3]
    Left = 25
    Top = 100
    Width = 48
    Height = 12
    Hint = #25351#23450#24211#23384#26680#31639#30340#24635#24080#31185#30446
    Caption = #23545#24212#31185#30446
  end
  object Label4: TLabel [4]
    Left = 25
    Top = 134
    Width = 48
    Height = 12
    Hint = #25351#23450#38144#21806#25910#20837#26680#31639#30340#24635#24080#31185#30446
    Caption = #25910#20837#31185#30446
    ParentShowHint = False
    ShowHint = True
  end
  object Label5: TLabel [5]
    Left = 25
    Top = 169
    Width = 48
    Height = 12
    Hint = #25351#23450#38144#21806#25104#26412#26680#31639#30340#24635#24080#31185#30446
    Caption = #25104#26412#31185#30446
    ParentShowHint = False
    ShowHint = True
  end
  inherited CancelButton: TButton
    Left = 255
    Top = 213
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 175
    Top = 213
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 85
    Top = 27
    Width = 200
    Height = 20
    DataField = 'Name'
    DataSource = dsGoodEdit
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 85
    Top = 61
    Width = 200
    Height = 20
    DataField = 'UpID'
    DataSource = dsGoodEdit
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource2
    NullValueKey = 16449
    TabOrder = 1
    OnCloseUp = DBLookupComboBox1CloseUp
  end
  object QLDBLookupComboBox1: TQLDBLookupComboBox
    Left = 85
    Top = 96
    Width = 200
    Height = 20
    Hint = #25351#23450#24211#23384#26680#31639#30340#24635#24080#31185#30446
    DataField = 'GeneralACID'
    DataSource = dsGoodEdit
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = GeneralACIDds
    TabOrder = 4
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object GeneralPACIDLKUP: TQLDBLookupComboBox
    Left = 85
    Top = 130
    Width = 200
    Height = 20
    Hint = #25351#23450#38144#21806#25910#20837#26680#31639#30340#24635#24080#31185#30446
    DataField = 'GeneralPACID'
    DataSource = dsGoodEdit
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = GeneralPACIDDs
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object GeneralCACIDLKUP: TQLDBLookupComboBox
    Left = 85
    Top = 165
    Width = 200
    Height = 20
    Hint = #25351#23450#38144#21806#25104#26412#26680#31639#30340#24635#24080#31185#30446
    DataField = 'GeneralCACID'
    DataSource = dsGoodEdit
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = GeneralCACIDDs
    TabOrder = 6
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object tblGoodEdit: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    BeforePost = tblGoodEditBeforePost
    OnFilterRecord = tblGoodEditFilterRecord
    TableName = 'DAGoodsClass'
    Left = 55
    Top = 102
    object tblGoodEditID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblGoodEditCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblGoodEditCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblGoodEditRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblGoodEditName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object tblGoodEditUpID: TIntegerField
      FieldName = 'UpID'
    end
    object tblGoodEditLevelCode: TStringField
      FieldName = 'LevelCode'
      Size = 30
    end
    object tblGoodEditGeneralACID: TIntegerField
      FieldName = 'GeneralACID'
    end
    object tblGoodEditGeneralPACID: TIntegerField
      FieldName = 'GeneralPACID'
    end
    object tblGoodEditGeneralCACID: TIntegerField
      FieldName = 'GeneralCACID'
    end
  end
  object dsGoodEdit: TDataSource
    DataSet = tblGoodEdit
    Left = 91
    Top = 102
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 164
    Top = 102
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
      'from DAGoodsClass'
      'where LevelCode not like :Code and RecordState<>'#39#21024#38500#39)
    Left = 127
    Top = 102
  end
  object GeneralACIDAds: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ID, SubCode,  Name  from DASubject'#13#10'where LEN(SubCode) =4' +
      '   and'#13#10'name like '#39'%'#26448'%'#39' or'#13#10'name like '#39'%'#26009'%'#39' or'#13#10'name like '#39'%'#36164'%'#39' ' +
      'or'#13#10'name like '#39'%'#20135'%'#39' or'#13#10'name like '#39'%'#29289'%'#39' or'#13#10'name like '#39'%'#24211'%'#39' or'#13#10 +
      'name like '#39'%'#35774'%'#39' or'#13#10'name like '#39'%'#21697'%'#39' or'#13#10'name like '#39'%'#36141'%'#39' or'#13#10'name' +
      ' like '#39'%'#36135'%'#39' '#13#10'order by SubCode,name '#13#10
    Parameters = <>
    Left = 24
    Top = 181
  end
  object GeneralACIDds: TDataSource
    DataSet = GeneralACIDAds
    Left = 56
    Top = 181
  end
  object TempAds: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ID, SubCode,  Name  from DASubject'#13#10'where LEN(SubCode) =4' +
      '   and'#13#10'name like '#39'%'#26448'%'#39' or'#13#10'name like '#39'%'#26009'%'#39' or'#13#10'name like '#39'%'#36164'%'#39' ' +
      'or'#13#10'name like '#39'%'#20135'%'#39' or'#13#10'name like '#39'%'#29289'%'#39' or'#13#10'name like '#39'%'#24211'%'#39' or'#13#10 +
      'name like '#39'%'#35774'%'#39' or'#13#10'name like '#39'%'#21697'%'#39' or'#13#10'name like '#39'%'#36141'%'#39' or'#13#10'name' +
      ' like '#39'%'#36135'%'#39' '#13#10'order by SubCode,name '#13#10
    Parameters = <>
    Left = 280
    Top = 101
  end
  object GeneralPACIDAds: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ID, SubCode,  Name  from DASubject'#13#10'where LEN(SubCode) =4' +
      '   and SubCode LIKE '#39'5%'#39#13#10'order by SubCode,name '#13#10
    Parameters = <>
    Left = 96
    Top = 181
  end
  object GeneralPACIDDs: TDataSource
    DataSet = GeneralPACIDAds
    Left = 128
    Top = 181
  end
  object GeneralCACIDAds: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ID, SubCode,  Name  from DASubject'#13#10'where LEN(SubCode) =4' +
      '   and SubCode LIKE '#39'5%'#39#13#10'order by SubCode,name '#13#10
    Parameters = <>
    Left = 184
    Top = 181
  end
  object GeneralCACIDDs: TDataSource
    DataSet = GeneralCACIDAds
    Left = 216
    Top = 181
  end
end
