inherited MSOptionForm: TMSOptionForm
  Left = 177
  Top = 8
  Width = 542
  Height = 465
  Caption = #31995#32479#36873#39033
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited CancelButton: TButton
    Left = 452
    Top = 405
    TabOrder = 2
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 372
    Top = 405
    Enabled = False
    OnClick = OKButtonClick
  end
  object PageControl1: TPageControl
    Left = 9
    Top = 8
    Width = 513
    Height = 387
    ActivePage = TabSheet2
    TabIndex = 1
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #20225#19994#36164#26009
      object Label1: TLabel
        Left = 11
        Top = 18
        Width = 42
        Height = 12
        Caption = #21517'   '#31216
        FocusControl = dbedit1
      end
      object Label2: TLabel
        Left = 271
        Top = 20
        Width = 48
        Height = 12
        Caption = #27861#23450#20195#34920
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 11
        Top = 51
        Width = 42
        Height = 12
        Caption = #20840'   '#31216
        FocusControl = DBEdit3
      end
      object Label4: TLabel
        Left = 261
        Top = 83
        Width = 48
        Height = 12
        Caption = #27880#20876#26085#26399
        FocusControl = DBEdit4
      end
      object Label5: TLabel
        Left = 11
        Top = 87
        Width = 42
        Height = 12
        Caption = #22320'   '#22336
      end
      object Label6: TLabel
        Left = 261
        Top = 115
        Width = 48
        Height = 12
        Caption = #27880#20876#36164#26412
        FocusControl = DBEdit6
      end
      object Label7: TLabel
        Left = 261
        Top = 147
        Width = 48
        Height = 12
        Caption = #32463#33829#33539#22260
      end
      object Label8: TLabel
        Left = 11
        Top = 178
        Width = 42
        Height = 12
        Caption = #30005'   '#35805
        FocusControl = DBEdit8
      end
      object Label9: TLabel
        Left = 261
        Top = 178
        Width = 48
        Height = 12
        Caption = #22269#31246#35777#21495
        FocusControl = DBEdit9
      end
      object Label10: TLabel
        Left = 11
        Top = 210
        Width = 42
        Height = 12
        Caption = #20256'   '#30495
        FocusControl = DBEdit10
      end
      object Label11: TLabel
        Left = 261
        Top = 210
        Width = 48
        Height = 12
        Caption = #22320#31246#35777#21495
        FocusControl = DBEdit11
      end
      object Label12: TLabel
        Left = 11
        Top = 242
        Width = 48
        Height = 12
        Caption = #24320#25143#38134#34892
        FocusControl = DBEdit12
      end
      object Label13: TLabel
        Left = 261
        Top = 242
        Width = 48
        Height = 12
        Caption = #20195#30721#35777#21495
        FocusControl = DBEdit13
      end
      object Label14: TLabel
        Left = 11
        Top = 274
        Width = 48
        Height = 12
        Caption = #38134#34892#24080#21495
        FocusControl = DBEdit14
      end
      object Label15: TLabel
        Left = 261
        Top = 274
        Width = 48
        Height = 12
        Caption = #20854#23427#35777#20070
      end
      object dbedit1: TDBEdit
        Left = 67
        Top = 15
        Width = 191
        Height = 20
        DataField = 'Name'
        DataSource = dsMSOption
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 325
        Top = 15
        Width = 153
        Height = 20
        DataField = 'BossName'
        DataSource = dsMSOption
        TabOrder = 1
      end
      object DBEdit3: TDBEdit
        Left = 67
        Top = 46
        Width = 383
        Height = 20
        DataField = 'FullName'
        DataSource = dsMSOption
        TabOrder = 2
      end
      object DBEdit4: TDBEdit
        Left = 321
        Top = 78
        Width = 153
        Height = 20
        DataField = 'RegisterDate'
        DataSource = dsMSOption
        TabOrder = 4
      end
      object DBEdit6: TDBEdit
        Left = 321
        Top = 110
        Width = 153
        Height = 20
        DataField = 'RegisterCapital'
        DataSource = dsMSOption
        TabOrder = 5
      end
      object DBEdit7: TDBEdit
        Left = 321
        Top = 142
        Width = 153
        Height = 20
        DataField = 'RunRange'
        DataSource = dsMSOption
        TabOrder = 6
      end
      object DBEdit8: TDBEdit
        Left = 67
        Top = 173
        Width = 153
        Height = 20
        DataField = 'Telephone'
        DataSource = dsMSOption
        TabOrder = 7
      end
      object DBEdit9: TDBEdit
        Left = 321
        Top = 173
        Width = 153
        Height = 20
        DataField = 'CentralTax'
        DataSource = dsMSOption
        TabOrder = 8
      end
      object DBEdit10: TDBEdit
        Left = 67
        Top = 205
        Width = 153
        Height = 20
        DataField = 'Fax'
        DataSource = dsMSOption
        TabOrder = 9
      end
      object DBEdit11: TDBEdit
        Left = 321
        Top = 205
        Width = 153
        Height = 20
        DataField = 'LandTax'
        DataSource = dsMSOption
        TabOrder = 10
      end
      object DBEdit12: TDBEdit
        Left = 67
        Top = 237
        Width = 153
        Height = 20
        DataField = 'BankOpened'
        DataSource = dsMSOption
        TabOrder = 11
      end
      object DBEdit13: TDBEdit
        Left = 321
        Top = 237
        Width = 153
        Height = 20
        DataField = 'KeyCode'
        DataSource = dsMSOption
        TabOrder = 12
      end
      object DBEdit14: TDBEdit
        Left = 67
        Top = 269
        Width = 153
        Height = 20
        DataField = 'BankAccount'
        DataSource = dsMSOption
        TabOrder = 13
      end
      object DBEdit15: TDBEdit
        Left = 321
        Top = 269
        Width = 153
        Height = 20
        DataField = 'Certificates'
        DataSource = dsMSOption
        TabOrder = 14
      end
      object DBMemo1: TDBMemo
        Left = 68
        Top = 81
        Width = 150
        Height = 81
        DataField = 'Address'
        DataSource = dsMSOption
        TabOrder = 3
      end
    end
    object TabSheet2: TTabSheet
      Caption = #36719#20214#27880#20876
      ImageIndex = 1
      object Label16: TLabel
        Left = 17
        Top = 24
        Width = 36
        Height = 12
        Caption = #27880#20876#30721
        FocusControl = DBEdit16
      end
      object Label17: TLabel
        Left = 15
        Top = 65
        Width = 48
        Height = 12
        Caption = #20844#21496#22270#26631
        FocusControl = DBImage1
      end
      object Label18: TLabel
        Left = 86
        Top = 174
        Width = 84
        Height = 12
        Caption = '('#21452#20987#20462#25913#22270#29255')'
      end
      object DBEdit16: TDBEdit
        Left = 64
        Top = 20
        Width = 433
        Height = 20
        DataField = 'SoftRegCode'
        DataSource = dsMSOption
        Enabled = False
        MaxLength = 40
        TabOrder = 0
      end
      object DBImage1: TDBImage
        Left = 75
        Top = 65
        Width = 105
        Height = 105
        DataField = 'Log'
        DataSource = dsMSOption
        Stretch = True
        TabOrder = 1
        OnDblClick = DBImage1DblClick
      end
      object BitBtn1: TBitBtn
        Left = 48
        Top = 256
        Width = 97
        Height = 25
        Caption = #20135#21697#27880#20876
        TabOrder = 2
        Visible = False
        OnClick = BitBtn1Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #31995#32479#21442#25968
      ImageIndex = 2
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 505
        Height = 360
        Align = alClient
        DataSource = dssysprarmetar
        TabOrder = 0
        TitleFont.Charset = GB2312_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = #23435#20307
        TitleFont.Style = []
        OnDblClick = DBGrid1DblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'ParaName'
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ParaValues'
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Memo'
            ReadOnly = True
            Title.Alignment = taCenter
            Visible = True
          end>
      end
    end
  end
  object tblMSOption: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    TableName = 'MSCompanyUser'
    Left = 34
    Top = 181
    object tblMSOptionID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblMSOptionCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object tblMSOptionCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object tblMSOptionRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object tblMSOptionName: TStringField
      FieldName = 'Name'
      Size = 30
    end
    object tblMSOptionFullName: TStringField
      FieldName = 'FullName'
      Size = 100
    end
    object tblMSOptionAddress: TStringField
      DisplayLabel = #22320#22336
      FieldName = 'Address'
      Size = 60
    end
    object tblMSOptionTelephone: TStringField
      DisplayLabel = #30005#35805
      FieldName = 'Telephone'
      Size = 60
    end
    object tblMSOptionFax: TStringField
      DisplayLabel = #20256#30495
      FieldName = 'Fax'
      Size = 60
    end
    object tblMSOptionRegisterDate: TDateTimeField
      DisplayLabel = #27880#20876#26085#26399
      FieldName = 'RegisterDate'
    end
    object tblMSOptionRegisterCapital: TBCDField
      DisplayLabel = #27880#20876#36164#26412
      FieldName = 'RegisterCapital'
      Precision = 19
    end
    object tblMSOptionCharter: TStringField
      FieldName = 'Charter'
    end
    object tblMSOptionBossName: TStringField
      DisplayLabel = #27861#23450#20195#34920
      FieldName = 'BossName'
      Size = 30
    end
    object tblMSOptionRunRange: TStringField
      DisplayLabel = #32463#33829#33539#22260
      FieldName = 'RunRange'
      Size = 300
    end
    object tblMSOptionCentralTax: TStringField
      DisplayLabel = #22269#31246#35777#21495
      FieldName = 'CentralTax'
    end
    object tblMSOptionLandTax: TStringField
      DisplayLabel = #22320#31246#35777#21495
      FieldName = 'LandTax'
    end
    object tblMSOptionKeyCode: TStringField
      DisplayLabel = #20195#30721#35777#21495
      FieldName = 'KeyCode'
    end
    object tblMSOptionCertificates: TStringField
      DisplayLabel = #20854#23427#35777#20070
      FieldName = 'Certificates'
      Size = 300
    end
    object tblMSOptionBankOpened: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'BankOpened'
      Size = 50
    end
    object tblMSOptionBankAccount: TStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'BankAccount'
    end
    object tblMSOptionSoftRegCode: TStringField
      DisplayLabel = #27880#20876#30721
      FieldName = 'SoftRegCode'
      Size = 50
    end
    object tblMSOptionMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object tblMSOptionLog: TBlobField
      FieldName = 'Log'
    end
  end
  object dsMSOption: TDataSource
    DataSet = tblMSOption
    OnDataChange = dsMSOptionDataChange
    Left = 150
    Top = 65336
  end
  object openpic: TOpenPictureDialog
    Left = 50
    Top = 130
  end
  object dssysprarmetar: TDataSource
    DataSet = Adssysprarmetar
    Left = 144
    Top = 88
  end
  object Adssysprarmetar: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from MSSysParameter'#13#10'where RecordState<>'#39#22791#29992#39
    Parameters = <>
    Left = 200
    Top = 88
    object AdssysprarmetarID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object AdssysprarmetarCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object AdssysprarmetarCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object AdssysprarmetarRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object AdssysprarmetarParaNameA: TStringField
      FieldName = 'ParaNameA'
      Visible = False
      Size = 60
    end
    object AdssysprarmetarParaName: TStringField
      DisplayLabel = #36816#34892#21442#25968#25551#36848
      FieldName = 'ParaName'
      Size = 60
    end
    object AdssysprarmetarParaValues: TStringField
      DisplayLabel = #36816#34892#20540
      FieldName = 'ParaValues'
      Size = 2
    end
    object AdssysprarmetarMemo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from MSSysParameter'#13#10'where RecordState<>'#39#22791#29992#39
    Parameters = <>
    Left = 288
    Top = 128
    object AutoIncField1: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object DateTimeField1: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object IntegerField1: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object StringField1: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object StringField2: TStringField
      FieldName = 'ParaNameA'
      Visible = False
      Size = 60
    end
    object StringField3: TStringField
      DisplayLabel = #36816#34892#21442#25968#25551#36848
      FieldName = 'ParaName'
      Size = 60
    end
    object StringField4: TStringField
      DisplayLabel = #36816#34892#20540
      FieldName = 'ParaValues'
      Size = 2
    end
    object StringField5: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
end
