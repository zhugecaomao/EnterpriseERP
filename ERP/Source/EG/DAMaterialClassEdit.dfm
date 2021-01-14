inherited DAMaterialClassEditForm: TDAMaterialClassEditForm
  Left = 253
  Top = 163
  Width = 259
  Height = 164
  Caption = #26448#26009#20998#31867#32534#36753
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 25
    Top = 36
    Width = 48
    Height = 12
    Caption = #36135#21697#21517#31216
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 25
    Top = 71
    Width = 48
    Height = 12
    Caption = #19978#32423#20998#31867
  end
  object Label13: TLabel [2]
    Left = 86
    Top = 89
    Width = 108
    Height = 12
    Caption = '(Ctrl+A'#24314#31435#26681#33410#28857')'
  end
  inherited CancelButton: TButton
    Left = 169
    Top = 104
    TabOrder = 3
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 89
    Top = 104
    TabOrder = 2
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 85
    Top = 31
    Width = 149
    Height = 20
    DataField = 'Name'
    DataSource = dsGoodEdit
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 85
    Top = 66
    Width = 151
    Height = 20
    DataField = 'UpID'
    DataSource = dsGoodEdit
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = DataSource2
    NullValueKey = 16449
    TabOrder = 1
  end
  object tblGoodEdit: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    BeforePost = tblGoodEditBeforePost
    OnFilterRecord = tblGoodEditFilterRecord
    TableName = 'DAGoodsClass'
    Left = 39
    Top = 17
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
  end
  object dsGoodEdit: TDataSource
    DataSet = tblGoodEdit
    Left = 89
    Top = 12
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 220
    Top = 65521
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
      'from DAGoodsClass'
      'where LevelCode not like :Code and RecordState<>'#39#21024#38500#39)
    Left = 135
    Top = 11
  end
end
