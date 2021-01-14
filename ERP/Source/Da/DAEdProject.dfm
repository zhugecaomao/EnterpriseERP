inherited DAEdProjectForm: TDAEdProjectForm
  Left = 124
  Top = 76
  Width = 666
  Height = 559
  Caption = #39033#30446#39033#30446#36164#26009
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel [0]
    Left = 42
    Top = 17
    Width = 48
    Height = 12
    Caption = #39033#30446#21517#31216
    FocusControl = DBEdit1
  end
  object Label2: TLabel [1]
    Left = 349
    Top = 17
    Width = 48
    Height = 12
    Caption = #39033#30446#32534#21495
    FocusControl = DBEdit2
  end
  object Label4: TLabel [2]
    Left = 349
    Top = 58
    Width = 48
    Height = 12
    Caption = #39033#30446#31867#21035
  end
  object Label5: TLabel [3]
    Left = 349
    Top = 98
    Width = 48
    Height = 12
    Caption = #39033#30446#25551#36848
    FocusControl = DBEdit5
  end
  object Label6: TLabel [4]
    Left = 192
    Top = 137
    Width = 48
    Height = 12
    Caption = #39044#31639#37329#39069
    FocusControl = DBEdit6
  end
  object Label10: TLabel [5]
    Left = 392
    Top = 179
    Width = 198
    Height = 12
    Caption = #39033#30446#22270#29255#36164#26009' ('#21452#20987#22270#29255#35013#36733#26032#22270#29255')'
  end
  object Label3: TLabel [6]
    Left = 42
    Top = 137
    Width = 48
    Height = 12
    Caption = #21512#21516#37329#39069
    FocusControl = DBEdit3
  end
  object Label7: TLabel [7]
    Left = 349
    Top = 137
    Width = 24
    Height = 12
    Caption = #22791#27880
    FocusControl = DBEdit5
  end
  object Label8: TLabel [8]
    Left = 22
    Top = 179
    Width = 48
    Height = 12
    Caption = #21512#21516#26465#27454
    FocusControl = DBEdit5
  end
  object Label9: TLabel [9]
    Left = 42
    Top = 58
    Width = 48
    Height = 12
    Caption = #23458#25143#21517#31216
    FocusControl = DBEdit1
  end
  object Label11: TLabel [10]
    Left = 42
    Top = 98
    Width = 36
    Height = 12
    Caption = #32463#25163#20154
    FocusControl = DBEdit5
  end
  object Label12: TLabel [11]
    Left = 192
    Top = 98
    Width = 48
    Height = 12
    Caption = #21512#21516#32534#21495
    FocusControl = DBEdit5
  end
  object Label13: TLabel [12]
    Left = 491
    Top = 17
    Width = 24
    Height = 12
    Caption = #26085#26399
    FocusControl = DBEdit2
  end
  inherited CancelButton: TButton
    Left = 557
    Top = 500
    TabOrder = 13
    OnClick = CancelButtonClick
  end
  inherited OKButton: TButton
    Left = 477
    Top = 500
    TabOrder = 12
    OnClick = OKButtonClick
  end
  object DBEdit1: TDBEdit
    Left = 42
    Top = 31
    Width = 290
    Height = 20
    DataField = 'Name'
    DataSource = dsGoodsEdie
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 349
    Top = 31
    Width = 130
    Height = 20
    DataField = 'Code'
    DataSource = dsGoodsEdie
    TabOrder = 1
  end
  object DBEdit5: TDBEdit
    Left = 192
    Top = 150
    Width = 140
    Height = 20
    DataField = 'StockMax'
    DataSource = dsGoodsEdie
    TabOrder = 8
  end
  object DBEdit6: TDBEdit
    Left = 349
    Top = 111
    Width = 272
    Height = 20
    DataField = 'ProjectBrief'
    DataSource = dsGoodsEdie
    TabOrder = 6
  end
  object DBImage1: TDBImage
    Left = 390
    Top = 193
    Width = 256
    Height = 295
    DataField = 'ProjectPictrue'
    DataSource = dsGoodsEdie
    TabOrder = 11
    OnDblClick = DBImage1DblClick
  end
  object DBEdit3: TDBEdit
    Left = 42
    Top = 150
    Width = 140
    Height = 20
    DataField = 'StockMin'
    DataSource = dsGoodsEdie
    TabOrder = 7
  end
  object DBEdit4: TDBEdit
    Left = 349
    Top = 150
    Width = 272
    Height = 20
    DataField = 'Memo'
    DataSource = dsGoodsEdie
    TabOrder = 9
  end
  object DBMemo1: TDBMemo
    Left = 22
    Top = 193
    Width = 361
    Height = 295
    DataField = 'ContractClause'
    DataSource = dsGoodsEdie
    TabOrder = 10
  end
  object ClientLKUP: TQLDBLookupComboBox
    Left = 42
    Top = 71
    Width = 290
    Height = 20
    DataField = 'ClientID'
    DataSource = dsGoodsEdie
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = ClientIDDs
    TabOrder = 3
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object DBEdit7: TDBEdit
    Left = 192
    Top = 111
    Width = 140
    Height = 20
    DataField = 'PrjContractNo'
    DataSource = dsGoodsEdie
    TabOrder = 5
  end
  object EmployeeLKUP: TQLDBLookupComboBox
    Left = 42
    Top = 111
    Width = 140
    Height = 20
    DataField = 'EmployeeID'
    DataSource = dsGoodsEdie
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = EmployeeDS
    TabOrder = 4
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object DBEdit8: TDBEdit
    Left = 491
    Top = 31
    Width = 130
    Height = 20
    DataField = 'Date'
    DataSource = dsGoodsEdie
    TabOrder = 2
  end
  object ProjectIDLkup: TQLDBLookupComboBox
    Left = 349
    Top = 71
    Width = 272
    Height = 20
    DataField = 'ProjectClassID'
    DataSource = dsGoodsEdie
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = dsProjectClass
    TabOrder = 14
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object tblGoodsEdit: TADOTable
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    BeforePost = tblGoodsEditBeforePost
    OnFilterRecord = tblGoodsEditFilterRecord
    TableName = 'DAProject'
    Left = 157
    Top = 325
    object tblGoodsEditID: TIntegerField
      FieldName = 'ID'
      Visible = False
    end
    object tblGoodsEditCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblGoodsEditCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblGoodsEditClientID: TIntegerField
      FieldName = 'ClientID'
    end
    object tblGoodsEditRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblGoodsEditName: TStringField
      FieldName = 'Name'
      Size = 60
    end
    object tblGoodsEditCode: TStringField
      FieldName = 'Code'
    end
    object tblGoodsEditProjectBrief: TStringField
      FieldName = 'ProjectBrief'
      Size = 60
    end
    object tblGoodsEditProjectClassID: TIntegerField
      FieldName = 'ProjectClassID'
    end
    object tblGoodsEditStockMax: TFloatField
      FieldName = 'StockMax'
      DisplayFormat = '#,#.00'
    end
    object tblGoodsEditStockMin: TFloatField
      FieldName = 'StockMin'
      DisplayFormat = '#,#.00'
    end
    object tblGoodsEditClient: TStringField
      FieldKind = fkLookup
      FieldName = 'Client'
      LookupDataSet = ClientIDAds
      LookupKeyFields = 'Name'
      LookupResultField = 'ID'
      KeyFields = 'ClientID'
      Lookup = True
    end
    object tblGoodsEditPrjContractNo: TStringField
      FieldName = 'PrjContractNo'
      Size = 30
    end
    object tblGoodsEditProjectPictrue: TBlobField
      FieldName = 'ProjectPictrue'
    end
    object tblGoodsEditContractClause: TStringField
      FieldName = 'ContractClause'
      Size = 1000
    end
    object tblGoodsEditMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object tblGoodsEditEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
    end
    object tblGoodsEditEmployee: TStringField
      FieldKind = fkLookup
      FieldName = 'Employee'
      LookupDataSet = EmployeeADS
      LookupKeyFields = 'Name'
      LookupResultField = 'ID'
      KeyFields = 'EmployeeID'
      Lookup = True
    end
    object tblGoodsEditDate: TDateTimeField
      FieldName = 'Date'
    end
  end
  object dsGoodsEdie: TDataSource
    DataSet = tblGoodsEdit
    Left = 196
    Top = 325
  end
  object dsProjectClass: TDataSource
    DataSet = adotable1
    Left = 118
    Top = 325
  end
  object OpenPic: TOpenPictureDialog
    Left = 189
    Top = 257
  end
  object adotable1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select * from DAProjectClass'#13#10'where RecordState<>'#39#21024#38500#39#13#10'and name ' +
      'not like '#39'%'#25152#26377'%'#39#13#10'order by LevelCode'
    Parameters = <>
    Left = 80
    Top = 325
  end
  object ClientIDAds: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID,Name  from DAClient'#13#10'where RecordState<>'#39#21024#38500#39#13#10'Order by' +
      ' Name'#13#10
    Parameters = <>
    Left = 80
    Top = 365
  end
  object ClientIDDs: TDataSource
    DataSet = ClientIDAds
    Left = 118
    Top = 365
  end
  object EmployeeADS: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID,Name  from MSEmployee'#13#10'where RecordState<>'#39#21024#38500#39#13#10'Order ' +
      'by Name'#13#10
    Parameters = <>
    Left = 160
    Top = 365
  end
  object EmployeeDS: TDataSource
    DataSet = EmployeeADS
    Left = 198
    Top = 365
  end
end
