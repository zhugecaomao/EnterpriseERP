inherited DALinkMenBrowseForm: TDALinkMenBrowseForm
  Left = 39
  Top = 41
  VertScrollBar.Range = 0
  AutoScroll = False
  Caption = #32852#31995#20154#31649#29702
  ClientHeight = 482
  ClientWidth = 701
  Position = poScreenCenter
  Visible = False
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 701
    ButtonWidth = 55
    object tbtAdd: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton1: TToolButton
      Left = 55
      Top = 2
      Action = EditAction
    end
    object ToolButton2: TToolButton
      Left = 110
      Top = 2
      Action = DeleteAction
    end
    object ToolButton3: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton10: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton11: TToolButton
      Left = 409
      Top = 2
      Action = RefreshAction
    end
    object ToolButton14: TToolButton
      Left = 464
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
    object ToolButton4: TToolButton
      Left = 527
      Top = 2
      Action = CustomizeViewAction
      Caption = #26174#31034#21015
    end
  end
  inherited Panel1: TPanel
    Width = 701
    Height = 441
    inherited PageControl: TPageControl
      Top = 419
      Width = 701
      OnChanging = PageControlChanging
      inherited TabSheet1: TTabSheet
        Tag = 1
        Caption = #32852#31995#26041#24335
      end
      object TabSheet2: TTabSheet
        Tag = 2
        Caption = #31038#20250#20851#31995
        ImageIndex = 1
      end
      object TabSheet3: TTabSheet
        Tag = 3
        Caption = #23621#20303#22320#22336
        ImageIndex = 2
      end
      object TabSheet4: TTabSheet
        Tag = 4
        Caption = #25945#32946#22521#35757
        ImageIndex = 3
      end
      object TabSheet5: TTabSheet
        Tag = 5
        Caption = #20852#36259#29233#22909
        ImageIndex = 4
      end
      object TabSheet6: TTabSheet
        Tag = 6
        Caption = #29983#29702#25351#26631
        ImageIndex = 5
      end
      object TabSheet7: TTabSheet
        Tag = 7
        Caption = #20307#26816#25253#21578
        ImageIndex = 6
      end
      object TabSheet8: TTabSheet
        Tag = 8
        Caption = #24037#20316#23653#21382
        ImageIndex = 7
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 701
      Height = 419
      ReadOnly = False
    end
  end
  inherited ActionList: TActionList
    object RolePermissionsAction: TAction
      Caption = #25480#26435
      Hint = #25480#26435
      ImageIndex = 9
    end
  end
  object adsDALinkMode: TADODataSet
    Tag = 1
    Connection = CommonData.acnConnection
    BeforePost = adsDALinkModeBeforePost
    AfterPost = adsDALinkModeAfterPost
    CommandText = 
      'select * from DALinkMode where RecordState<>'#39#21024#38500#39' and LinkMenID=:' +
      'ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 16
    Top = 240
    object adsDALinkModeID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDALinkModeCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsDALinkModeCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsDALinkModeRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsDALinkModeLinkMenID: TIntegerField
      FieldName = 'LinkMenID'
      Visible = False
    end
    object adsDALinkModeLikeMode: TStringField
      DisplayLabel = #32852#31995#26041#24335
      FieldName = 'LikeMode'
    end
    object adsDALinkModePhoneZip: TStringField
      DisplayLabel = #32852#31995#21495#30721
      FieldName = 'PhoneZip'
    end
    object adsDALinkModeLinkPlace: TStringField
      DisplayLabel = #22320#22336#20301#32622
      FieldName = 'LinkPlace'
      Size = 60
    end
    object adsDALinkModeMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
  object adsDASocialRelations: TADODataSet
    Tag = 2
    Connection = CommonData.acnConnection
    BeforePost = adsDASocialRelationsBeforePost
    CommandText = 'select * from DASocialRelations WHERE LinkMenID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 80
    Top = 240
    object adsDASocialRelationsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDASocialRelationsLinkMenID: TIntegerField
      FieldName = 'LinkMenID'
      Visible = False
    end
    object adsDASocialRelationsName: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'Name'
    end
    object adsDASocialRelationsPost: TStringField
      DisplayLabel = #32844#20301
      FieldName = 'Post'
    end
    object adsDASocialRelationsDeportment: TStringField
      DisplayLabel = #24037#20316#21333#20301
      FieldName = 'Deportment'
      Size = 60
    end
    object adsDASocialRelationsPoliteTitle: TStringField
      DisplayLabel = #31216#35859#20851#31995
      FieldName = 'PoliteTitle'
    end
    object adsDASocialRelationsBirthDate: TDateTimeField
      DisplayLabel = #29983#26085
      FieldName = 'BirthDate'
    end
    object adsDASocialRelationsSpecialDate: TDateTimeField
      DisplayLabel = #32426#24565#26085
      FieldName = 'SpecialDate'
    end
    object adsDASocialRelationsNickName: TStringField
      DisplayLabel = #26165#31216
      FieldName = 'NickName'
    end
    object adsDASocialRelationsHabitLove: TStringField
      DisplayLabel = #29233#22909#20852#36259
      FieldName = 'HabitLove'
      Size = 50
    end
    object adsDASocialRelationsPostDate: TDateTimeField
      DisplayLabel = #22312#32844#26085#26399
      FieldName = 'PostDate'
    end
    object adsDASocialRelationsLeaveDate: TDateTimeField
      DisplayLabel = #31163#32844#26085#26399
      FieldName = 'LeaveDate'
    end
    object adsDASocialRelationsMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
  object adsDALivePlace: TADODataSet
    Tag = 3
    Connection = CommonData.acnConnection
    BeforePost = adsDALivePlaceBeforePost
    CommandText = 'select * from DALivePlace WHERE LinkMenID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 144
    Top = 240
    object adsDALivePlaceID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDALivePlaceLinkMenID: TIntegerField
      FieldName = 'LinkMenID'
      Visible = False
    end
    object adsDALivePlaceAddress: TStringField
      DisplayLabel = #35814#32454#22320#22336
      FieldName = 'Address'
      Size = 60
    end
    object adsDALivePlaceliveMode: TStringField
      DisplayLabel = #23621#20303#26041#24335
      FieldName = 'liveMode'
    end
    object adsDALivePlacePostZip: TStringField
      DisplayLabel = #37038#25919#32534#30721
      FieldName = 'PostZip'
      Size = 6
    end
    object adsDALivePlaceLocationMan: TStringField
      DisplayLabel = #20303#22320#32852#31995#20154
      FieldName = 'LocationMan'
    end
    object adsDALivePlacePoliteTitle: TStringField
      DisplayLabel = #20851#31995
      FieldName = 'PoliteTitle'
    end
    object adsDALivePlaceStartDate: TDateTimeField
      DisplayLabel = #23621#20303#36215#26085
      FieldName = 'StartDate'
    end
    object adsDALivePlaceLeaveDate: TDateTimeField
      DisplayLabel = #23621#20303#27490#26085
      FieldName = 'LeaveDate'
    end
    object adsDALivePlacePhone: TStringField
      DisplayLabel = #32852#31995#30005#35805
      FieldName = 'Phone'
    end
    object adsDALivePlaceMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
  object adsDAEducation: TADODataSet
    Tag = 4
    Connection = CommonData.acnConnection
    BeforePost = adsDAEducationBeforePost
    CommandText = 'select * from DAEducation WHERE LinkMenID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 208
    Top = 240
    object adsDAEducationID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDAEducationLinkMenID: TIntegerField
      FieldName = 'LinkMenID'
      Visible = False
    end
    object adsDAEducationEducationClass: TStringField
      DisplayLabel = #25945#22521#20998#31867
      FieldName = 'EducationClass'
    end
    object adsDAEducationEducationMode: TStringField
      DisplayLabel = #25945#22521#26041#24335
      FieldName = 'EducationMode'
      Size = 60
    end
    object adsDAEducationProfessional: TStringField
      DisplayLabel = #19987#19994'/'#20869#23481
      FieldName = 'Professional'
      Size = 60
    end
    object adsDAEducationInstitute: TStringField
      DisplayLabel = #23398#38498'/'#26426#26500
      FieldName = 'Institute'
      Size = 60
    end
    object adsDAEducationProfessor: TStringField
      DisplayLabel = #36131#20219#23548#24072
      FieldName = 'Professor'
    end
    object adsDAEducationStartDate: TDateTimeField
      DisplayLabel = #24320#22987#26085#26399
      FieldName = 'StartDate'
    end
    object adsDAEducationLeaveDate: TDateTimeField
      DisplayLabel = #32467#26463#26085#26399
      FieldName = 'LeaveDate'
    end
    object adsDAEducationPayMode: TStringField
      DisplayLabel = #22521#35757#36153#25903#20184#20154
      FieldName = 'PayMode'
      Size = 60
    end
    object adsDAEducationPaySelf: TFloatField
      DisplayLabel = #33258#20184#27604#29575
      FieldName = 'PaySelf'
    end
    object adsDAEducationMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 80
    end
  end
  object adsDALoveHabits: TADODataSet
    Tag = 5
    Connection = CommonData.acnConnection
    BeforePost = adsDALoveHabitsBeforePost
    CommandText = 'select * from DALoveHabits WHERE LinkMenID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 280
    Top = 240
    object adsDALoveHabitsID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDALoveHabitsLinkMenID: TIntegerField
      FieldName = 'LinkMenID'
      Visible = False
    end
    object adsDALoveHabitsName: TStringField
      DisplayLabel = #20852#36259#29233#22909
      FieldName = 'Name'
    end
    object adsDALoveHabitsBrief: TStringField
      DisplayLabel = #25551#36848
      FieldName = 'Brief'
      Size = 60
    end
    object adsDALoveHabitsDegree: TStringField
      DisplayLabel = #28909#29233#31243#24230
      FieldName = 'Degree'
    end
    object adsDALoveHabitsMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 80
    end
  end
  object adsDABiologyIndex: TADODataSet
    Tag = 6
    Connection = CommonData.acnConnection
    BeforePost = adsDABiologyIndexBeforePost
    CommandText = 'select * from DABiologyIndex WHERE LinkMenID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 352
    Top = 240
    object adsDABiologyIndexID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDABiologyIndexLinkMenID: TIntegerField
      FieldName = 'LinkMenID'
      Visible = False
    end
    object adsDABiologyIndexName: TStringField
      DisplayLabel = #25351#26631#21517#31216
      FieldName = 'Name'
    end
    object adsDABiologyIndexIndex: TStringField
      DisplayLabel = #25968#25454
      FieldName = 'Index'
      Size = 30
    end
    object adsDABiologyIndexUnits: TStringField
      DisplayLabel = #21333#20301
      FieldName = 'Units'
    end
    object adsDABiologyIndexCheckDate: TStringField
      DisplayLabel = #26816#39564#26085#26399
      FieldName = 'CheckDate'
    end
    object adsDABiologyIndexTrustDegree: TStringField
      DisplayLabel = #20449#20219#24230
      FieldName = 'TrustDegree'
    end
    object adsDABiologyIndexMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 80
    end
  end
  object adsDAHealthBill: TADODataSet
    Tag = 7
    Connection = CommonData.acnConnection
    BeforePost = adsDAHealthBillBeforePost
    CommandText = 'select * from DAHealthBill WHERE LinkMenID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 416
    Top = 240
    object adsDAHealthBillID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDAHealthBillLinkMenID: TIntegerField
      FieldName = 'LinkMenID'
      Visible = False
    end
    object adsDAHealthBillDate: TDateTimeField
      DisplayLabel = #26816#26597#26085#26399
      FieldName = 'Date'
    end
    object adsDAHealthBillCode: TStringField
      DisplayLabel = #26816#39564#25253#21578#32534#21495
      FieldName = 'Code'
    end
    object adsDAHealthBillCheckClass: TStringField
      DisplayLabel = #20307#26816#31867#21035
      FieldName = 'CheckClass'
    end
    object adsDAHealthBillHospital: TStringField
      DisplayLabel = #20307#26816#21307#38498
      FieldName = 'Hospital'
      Size = 50
    end
    object adsDAHealthBilldoctor: TStringField
      DisplayLabel = #36131#20219#21307#24072
      FieldName = 'doctor'
    end
    object adsDAHealthBillMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 80
    end
  end
  object adsDAJobRecord: TADODataSet
    Tag = 8
    Connection = CommonData.acnConnection
    BeforePost = adsDAJobRecordBeforePost
    CommandText = 'select * from DAJobRecord WHERE LinkMenID=:ID'
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paSigned, paNullable]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end>
    Left = 480
    Top = 240
    object adsDAJobRecordID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDAJobRecordLinkMenID: TIntegerField
      FieldName = 'LinkMenID'
      Visible = False
    end
    object adsDAJobRecordClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsDAJobRecordJobClass: TStringField
      DisplayLabel = #24037#20316#24615#36136
      FieldName = 'JobClass'
    end
    object adsDAJobRecordCompany: TStringField
      DisplayLabel = #24037#20316#21333#20301
      FieldName = 'Company'
      Size = 50
    end
    object adsDAJobRecordPostRank: TStringField
      DisplayLabel = #32844#20301
      FieldName = 'PostRank'
    end
    object adsDAJobRecordDuty: TStringField
      DisplayLabel = #24037#20316#32844#36131
      FieldName = 'Duty'
      Size = 60
    end
    object adsDAJobRecordPostDate: TDateTimeField
      DisplayLabel = #20837#32844#26085#26399
      FieldName = 'PostDate'
    end
    object adsDAJobRecordLeaveDate: TDateTimeField
      DisplayLabel = #31163#32844#26085#26399
      FieldName = 'LeaveDate'
    end
    object adsDAJobRecordManager: TStringField
      DisplayLabel = #19978#21496#22995#21517
      FieldName = 'Manager'
    end
    object adsDAJobRecordLinkMode: TStringField
      DisplayLabel = #32852#31995#26041#24335
      FieldName = 'LinkMode'
      Size = 50
    end
    object adsDAJobRecordMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 80
    end
  end
end
