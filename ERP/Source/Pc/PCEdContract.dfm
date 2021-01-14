inherited PCEdContractForm: TPCEdContractForm
  Left = 80
  Top = 97
  Width = 648
  Height = 517
  Caption = #37319#36141#21512#21516
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 472
    Top = 22
    Width = 24
    Height = 12
    Caption = #26085#26399
  end
  object Label2: TLabel [1]
    Left = 332
    Top = 22
    Width = 24
    Height = 12
    Caption = #32534#21495
  end
  object Label3: TLabel [2]
    Left = 38
    Top = 52
    Width = 48
    Height = 12
    Caption = #30002#26041#21517#31216
  end
  object Label4: TLabel [3]
    Left = 321
    Top = 52
    Width = 48
    Height = 12
    Caption = #20057#26041#21517#31216
  end
  object Label5: TLabel [4]
    Left = 38
    Top = 82
    Width = 48
    Height = 12
    Caption = #30002#26041#20195#34920
  end
  object Label6: TLabel [5]
    Left = 321
    Top = 82
    Width = 48
    Height = 12
    Caption = #20057#26041#20195#34920
  end
  object Label9: TLabel [6]
    Left = 232
    Top = 113
    Width = 48
    Height = 12
    Caption = #26377#25928#26085#26399
  end
  object Label10: TLabel [7]
    Left = 417
    Top = 113
    Width = 48
    Height = 12
    Caption = #32456#27490#26085#26399
  end
  object Label12: TLabel [8]
    Left = 38
    Top = 113
    Width = 48
    Height = 12
    Caption = #21512#21516#37329#39069
  end
  object Label7: TLabel [9]
    Left = 38
    Top = 22
    Width = 48
    Height = 12
    Caption = #21512#21516#20027#39064
  end
  inherited CancelButton: TButton
    Left = 558
    Top = 457
    TabOrder = 13
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 478
    Top = 457
    TabOrder = 12
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 370
    Top = 18
    Width = 100
    Height = 20
    DataField = 'Code'
    DataSource = DataSource1
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 87
    Top = 109
    Width = 130
    Height = 20
    DataField = 'BargainAmount'
    DataSource = DataSource1
    TabOrder = 7
  end
  object DBEdit3: TDBEdit
    Left = 500
    Top = 18
    Width = 100
    Height = 20
    DataField = 'Date'
    DataSource = DataSource1
    TabOrder = 2
  end
  object DBEdit4: TDBEdit
    Left = 87
    Top = 48
    Width = 230
    Height = 20
    DataField = 'Provider'
    DataSource = DataSource1
    TabOrder = 3
  end
  object DBEdit6: TDBEdit
    Left = 87
    Top = 78
    Width = 230
    Height = 20
    DataField = 'ProviderDeputy'
    DataSource = DataSource1
    TabOrder = 5
  end
  object GroupBox1: TGroupBox
    Left = 38
    Top = 133
    Width = 565
    Height = 184
    Caption = #20027#35201#26465#27454
    TabOrder = 10
    object DBMemo1: TDBMemo
      Left = 2
      Top = 14
      Width = 561
      Height = 168
      Align = alClient
      DataField = 'MainClause'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object GroupBox2: TGroupBox
    Left = 38
    Top = 320
    Width = 565
    Height = 116
    Caption = #38468#21152#26465#27454
    TabOrder = 11
    object DBMemo2: TDBMemo
      Left = 2
      Top = 14
      Width = 561
      Height = 100
      Align = alClient
      DataField = 'AddClause'
      DataSource = DataSource1
      ScrollBars = ssVertical
      TabOrder = 0
    end
  end
  object DBEdit7: TDBEdit
    Left = 370
    Top = 78
    Width = 230
    Height = 20
    DataField = 'ClientDeputy'
    DataSource = DataSource1
    TabOrder = 6
  end
  object DBEdit8: TDBEdit
    Left = 285
    Top = 109
    Width = 130
    Height = 20
    DataField = 'StarDate'
    DataSource = DataSource1
    TabOrder = 8
  end
  object DBEdit9: TDBEdit
    Left = 470
    Top = 109
    Width = 130
    Height = 20
    DataField = 'ExpireDate'
    DataSource = DataSource1
    TabOrder = 9
  end
  object DBComboBox1: TDBComboBox
    Left = 370
    Top = 48
    Width = 230
    Height = 20
    DataField = 'Client'
    DataSource = DataSource1
    ItemHeight = 12
    TabOrder = 4
    OnChange = DBComboBox1Change
  end
  object DBComboBox2: TDBComboBox
    Left = 87
    Top = 18
    Width = 230
    Height = 20
    DataField = 'caption'
    DataSource = DataSource1
    ItemHeight = 12
    TabOrder = 0
    OnChange = DBComboBox1Change
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select * from PcContract where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 287
    Top = 161
    object ADODataSet1ID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object ADODataSet1CreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object ADODataSet1CreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object ADODataSet1RecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object ADODataSet1Date: TDateTimeField
      DisplayLabel = #21512#21516#26085#26399
      FieldName = 'Date'
    end
    object ADODataSet1Code: TStringField
      DisplayLabel = #21512#21516#32534#21495
      FieldName = 'Code'
    end
    object ADODataSet1BargainAmount: TBCDField
      DisplayLabel = #21512#21516#37329#39069
      FieldName = 'BargainAmount'
      Precision = 19
    end
    object ADODataSet1Provider: TStringField
      DisplayLabel = #30002#26041#21517#31216
      FieldName = 'Provider'
      Size = 60
    end
    object ADODataSet1Client: TStringField
      DisplayLabel = #20057#26041#21517#31216
      FieldName = 'Client'
      Size = 60
    end
    object ADODataSet1ProviderDeputy: TStringField
      DisplayLabel = #30002#26041#20195#34920
      FieldName = 'ProviderDeputy'
    end
    object ADODataSet1ClientDeputy: TStringField
      DisplayLabel = #20057#26041#20195#34920
      FieldName = 'ClientDeputy'
    end
    object ADODataSet1ClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object ADODataSet1MainClause: TMemoField
      DisplayLabel = #20027#35201#26465#27454
      FieldName = 'MainClause'
      BlobType = ftMemo
    end
    object ADODataSet1AddClause: TMemoField
      DisplayLabel = #38468#21152#26465#27454
      FieldName = 'AddClause'
      BlobType = ftMemo
    end
    object ADODataSet1StarDate: TDateTimeField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'StarDate'
    end
    object ADODataSet1ExpireDate: TDateTimeField
      DisplayLabel = #32456#27490#26085#26399
      FieldName = 'ExpireDate'
    end
    object ADODataSet1caption: TStringField
      FieldName = 'caption'
      Size = 60
    end
  end
  object DataSource1: TDataSource
    DataSet = ADODataSet1
    Left = 337
    Top = 136
  end
end
