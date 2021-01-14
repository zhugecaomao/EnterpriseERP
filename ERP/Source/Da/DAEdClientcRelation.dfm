inherited DAClientcRelationEditForm: TDAClientcRelationEditForm
  Left = 284
  Top = 187
  Height = 293
  Caption = #23458#25143#20851#31995#32534#36753
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label4: TLabel [0]
    Left = 8
    Top = 108
    Width = 60
    Height = 12
    Caption = #30465'/'#24066'/'#21306#65306
  end
  object Label5: TLabel [1]
    Left = 8
    Top = 140
    Width = 60
    Height = 12
    Caption = ' '#12288#22320'/'#24066#65306
  end
  object Label6: TLabel [2]
    Left = 8
    Top = 11
    Width = 60
    Height = 12
    Caption = #12288#12288#22995#21517#65306
  end
  object Label7: TLabel [3]
    Left = 216
    Top = 11
    Width = 60
    Height = 12
    Caption = #12288#12288#22269#31821#65306
  end
  object Label8: TLabel [4]
    Left = 8
    Top = 43
    Width = 60
    Height = 12
    Caption = #12288#12288#27665#26063#65306
  end
  object Label9: TLabel [5]
    Left = 8
    Top = 75
    Width = 60
    Height = 12
    Caption = #36523' '#20221' '#35777#65306
  end
  object Label10: TLabel [6]
    Left = 216
    Top = 139
    Width = 60
    Height = 12
    Caption = #20986' '#29983' '#22320#65306
  end
  object Label1: TLabel [7]
    Left = 8
    Top = 172
    Width = 60
    Height = 12
    Caption = ' '#12288#21306'/'#21439#65306
  end
  object Label2: TLabel [8]
    Left = 8
    Top = 204
    Width = 60
    Height = 12
    Caption = ' '#12288#34903'/'#20065#65306
  end
  object Label3: TLabel [9]
    Left = 216
    Top = 75
    Width = 60
    Height = 12
    Caption = #12288#12288#25252#29031#65306
  end
  object Label11: TLabel [10]
    Left = 216
    Top = 107
    Width = 60
    Height = 12
    Caption = #39550#39542#25191#29031#65306
  end
  object Label12: TLabel [11]
    Left = 203
    Top = 171
    Width = 72
    Height = 12
    Caption = #25143#21475#25152#22312#22320#65306
  end
  object Label13: TLabel [12]
    Left = 202
    Top = 203
    Width = 72
    Height = 12
    Caption = #26723#26696#25152#22312#22320#65306
  end
  object Label14: TLabel [13]
    Left = 216
    Top = 43
    Width = 60
    Height = 12
    Caption = #12288#12288#31821#36143#65306
  end
  inherited CancelButton: TButton
    Top = 233
    TabOrder = 13
  end
  inherited OKButton: TButton
    Top = 233
    TabOrder = 12
    OnClick = OKButtonClick
  end
  object dbeName: TDBEdit
    Left = 64
    Top = 8
    Width = 129
    Height = 20
    DataField = 'Name'
    DataSource = dsDALinkMenIDCard
    TabOrder = 0
  end
  object dbeIDCard: TDBEdit
    Left = 64
    Top = 72
    Width = 129
    Height = 20
    DataField = 'IDCard'
    DataSource = dsDALinkMenIDCard
    TabOrder = 2
  end
  object dbeBornPlace: TDBEdit
    Left = 272
    Top = 136
    Width = 129
    Height = 20
    DataField = 'BornPlace'
    DataSource = dsDALinkMenIDCard
    TabOrder = 7
  end
  object dbeProvince: TDBEdit
    Left = 64
    Top = 104
    Width = 129
    Height = 20
    DataField = 'Province'
    DataSource = dsDALinkMenIDCard
    TabOrder = 4
  end
  object dbeCity: TDBEdit
    Left = 64
    Top = 136
    Width = 129
    Height = 20
    DataField = 'City'
    DataSource = dsDALinkMenIDCard
    TabOrder = 6
  end
  object dbeCounty: TDBEdit
    Left = 64
    Top = 168
    Width = 129
    Height = 20
    DataField = 'County'
    DataSource = dsDALinkMenIDCard
    TabOrder = 8
  end
  object dbeStreet: TDBEdit
    Left = 64
    Top = 200
    Width = 129
    Height = 20
    DataField = 'Street'
    DataSource = dsDALinkMenIDCard
    TabOrder = 10
  end
  object dbePassport: TDBEdit
    Left = 272
    Top = 72
    Width = 129
    Height = 20
    DataField = 'Passport'
    DataSource = dsDALinkMenIDCard
    TabOrder = 3
  end
  object dbeDrivingLicence: TDBEdit
    Left = 272
    Top = 104
    Width = 129
    Height = 20
    DataField = 'DrivingLicence'
    DataSource = dsDALinkMenIDCard
    TabOrder = 5
  end
  object dbeResidencePlace: TDBEdit
    Left = 272
    Top = 168
    Width = 129
    Height = 20
    DataField = 'ResidencePlace'
    DataSource = dsDALinkMenIDCard
    TabOrder = 9
  end
  object dbePrivateFile: TDBEdit
    Left = 272
    Top = 200
    Width = 129
    Height = 20
    DataField = 'PrivateFile'
    DataSource = dsDALinkMenIDCard
    TabOrder = 11
  end
  object dbeNativePlace: TDBEdit
    Left = 272
    Top = 40
    Width = 129
    Height = 20
    DataField = 'NativePlace'
    DataSource = dsDALinkMenIDCard
    TabOrder = 1
  end
  object dbcbNationality: TDBComboBox
    Left = 272
    Top = 8
    Width = 129
    Height = 20
    DataField = 'Nationality'
    DataSource = dsDALinkMenIDCard
    ItemHeight = 12
    TabOrder = 14
  end
  object dbcbFolk: TDBComboBox
    Left = 64
    Top = 40
    Width = 129
    Height = 20
    DataField = 'Folk'
    DataSource = dsDALinkMenIDCard
    ItemHeight = 12
    TabOrder = 15
  end
  object adrDALinkMemIDCard: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 88
    Top = 232
  end
  object adsDALinkMenIDCard: TADODataSet
    Connection = CommonData.acnConnection
    Filter = 'RecordState<>'#39#21024#38500#39
    Filtered = True
    CommandText = 'DALinkMenIDCard'
    CommandType = cmdTable
    Parameters = <>
    Left = 8
    Top = 232
    object adsDALinkMenIDCardID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsDALinkMenIDCardCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsDALinkMenIDCardCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsDALinkMenIDCardRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsDALinkMenIDCardName: TStringField
      FieldName = 'Name'
    end
    object adsDALinkMenIDCardNationality: TStringField
      FieldName = 'Nationality'
    end
    object adsDALinkMenIDCardNativePlace: TStringField
      FieldName = 'NativePlace'
      Size = 40
    end
    object adsDALinkMenIDCardFolk: TStringField
      FieldName = 'Folk'
    end
    object adsDALinkMenIDCardIDCard: TStringField
      FieldName = 'IDCard'
    end
    object adsDALinkMenIDCardBornPlace: TStringField
      FieldName = 'BornPlace'
      Size = 60
    end
    object adsDALinkMenIDCardProvince: TStringField
      FieldName = 'Province'
    end
    object adsDALinkMenIDCardCity: TStringField
      FieldName = 'City'
    end
    object adsDALinkMenIDCardCounty: TStringField
      FieldName = 'County'
    end
    object adsDALinkMenIDCardStreet: TStringField
      FieldName = 'Street'
      Size = 40
    end
    object adsDALinkMenIDCardPassport: TStringField
      FieldName = 'Passport'
    end
    object adsDALinkMenIDCardDrivingLicence: TStringField
      FieldName = 'DrivingLicence'
    end
    object adsDALinkMenIDCardResidencePlace: TStringField
      FieldName = 'ResidencePlace'
      Size = 60
    end
    object adsDALinkMenIDCardPrivateFile: TStringField
      FieldName = 'PrivateFile'
      Size = 60
    end
  end
  object dsDALinkMenIDCard: TDataSource
    DataSet = adsDALinkMenIDCard
    Left = 40
    Top = 232
  end
  object adsPeriod: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'SELECT * FROM DALinkMenIDCard'
    Parameters = <>
    Left = 156
    Top = 221
    object adsPeriodID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object adsPeriodCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object adsPeriodCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object adsPeriodRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object adsPeriodName: TStringField
      FieldName = 'Name'
    end
    object adsPeriodNationality: TStringField
      FieldName = 'Nationality'
    end
    object adsPeriodNativePlace: TStringField
      FieldName = 'NativePlace'
      Size = 40
    end
    object adsPeriodFolk: TStringField
      FieldName = 'Folk'
    end
    object adsPeriodIDCard: TStringField
      FieldName = 'IDCard'
    end
    object adsPeriodBornPlace: TStringField
      FieldName = 'BornPlace'
      Size = 60
    end
    object adsPeriodProvince: TStringField
      FieldName = 'Province'
    end
    object adsPeriodCity: TStringField
      FieldName = 'City'
    end
    object adsPeriodCounty: TStringField
      FieldName = 'County'
    end
    object adsPeriodStreet: TStringField
      FieldName = 'Street'
      Size = 40
    end
    object adsPeriodPassport: TStringField
      FieldName = 'Passport'
    end
    object adsPeriodDrivingLicence: TStringField
      FieldName = 'DrivingLicence'
    end
    object adsPeriodResidencePlace: TStringField
      FieldName = 'ResidencePlace'
      Size = 60
    end
    object adsPeriodPrivateFile: TStringField
      FieldName = 'PrivateFile'
      Size = 60
    end
  end
  object dsPeriod: TDataSource
    DataSet = adsPeriod
    Left = 189
    Top = 220
  end
  object dsClient: TDataSource
    DataSet = CommonData.adsDAClient
    Left = 221
    Top = 220
  end
end
