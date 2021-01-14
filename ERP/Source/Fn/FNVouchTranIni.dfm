inherited FNVouchTranIniForm: TFNVouchTranIniForm
  Left = 71
  Top = 137
  BorderStyle = bsDialog
  Caption = #20973#35777#36716#25442#21442#25968#35774#32622
  ClientHeight = 371
  ClientWidth = 677
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  inherited CancelButton: TButton
    Left = 579
    Top = 338
    TabOrder = 1
  end
  inherited OKButton: TButton
    Left = 499
    Top = 338
    TabOrder = 0
    OnClick = OKButtonClick
  end
  object QLDBGrid1: TQLDBGrid
    Left = 0
    Top = 48
    Width = 677
    Height = 280
    Align = alTop
    DataSource = VouchTranIniDS
    PopupMenu = TransAllPopupMenu
    TabOrder = 2
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
    Columns = <
      item
        Expanded = False
        FieldName = 'BillName'
        ReadOnly = True
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'ACCFname'
        Title.Alignment = taCenter
        Visible = True
        ControlType = ctCustomControl
        CustomControl = AccFLookup
      end
      item
        Expanded = False
        FieldName = 'AccGname'
        Title.Alignment = taCenter
        Visible = True
        ControlType = ctCustomControl
        CustomControl = AccGLookup
      end
      item
        Expanded = False
        FieldName = 'AccOName'
        Title.Alignment = taCenter
        Visible = True
        ControlType = ctCustomControl
        CustomControl = AccOLookup
      end
      item
        Expanded = False
        FieldName = 'Code'
        Title.Alignment = taCenter
        Width = 58
        Visible = True
        ControlType = ctCustomControl
        CustomControl = CodeCMBX
      end>
  end
  object AccFLookup: TQLDBLookupComboBox
    Left = 199
    Top = 66
    Width = 101
    Height = 18
    Ctl3D = False
    DataField = 'AccountFID'
    DataSource = VouchTranIniDS
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = AccFDS
    OnEnter = AccFLookupEnter
    ParentCtl3D = False
    TabOrder = 3
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object AccGLookup: TQLDBLookupComboBox
    Left = 323
    Top = 66
    Width = 101
    Height = 18
    Ctl3D = False
    DataField = 'AccountGID'
    DataSource = VouchTranIniDS
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = AccGDS
    ParentCtl3D = False
    TabOrder = 4
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object AccOLookup: TQLDBLookupComboBox
    Left = 455
    Top = 66
    Width = 101
    Height = 18
    Ctl3D = False
    DataField = 'AccountOID'
    DataSource = VouchTranIniDS
    KeyField = 'ID'
    ListField = 'Name'
    ListSource = AccODS
    ParentCtl3D = False
    TabOrder = 5
    Visible = False
    ButtonHeight = 22
    SearchMode = smLocate
    SearchType = stAuto
    VisibleButtons = [lbSetNull]
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 677
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    Caption = #20973#35777#36716#25442#21442#25968#35774#32622
    TabOrder = 6
  end
  object CodeCMBX: TDBComboBox
    Left = 575
    Top = 65
    Width = 76
    Height = 20
    Style = csDropDownList
    DataField = 'Code'
    DataSource = VouchTranIniDS
    ItemHeight = 12
    Items.Strings = (
      #26159
      #21542)
    TabOrder = 7
    Visible = False
  end
  object VouchTranIniQry: TADOQuery
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from FNVourchTranIni')
    Left = 16
    Top = 160
    object VouchTranIniQryID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object VouchTranIniQryCreateDate: TDateTimeField
      FieldName = 'CreateDate'
    end
    object VouchTranIniQryCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
    end
    object VouchTranIniQryRecordState: TStringField
      FieldName = 'RecordState'
      Size = 12
    end
    object VouchTranIniQryDate: TDateTimeField
      FieldName = 'Date'
    end
    object VouchTranIniQryBillName: TStringField
      DisplayLabel = #36716#25442#21333#25454#21517#31216
      FieldName = 'BillName'
      Size = 30
    end
    object VouchTranIniQryCode: TStringField
      DisplayLabel = #26159#21542#36716#25442
      FieldName = 'Code'
    end
    object VouchTranIniQryBillMode: TStringField
      FieldName = 'BillMode'
      Size = 16
    end
    object VouchTranIniQryModeDC: TIntegerField
      FieldName = 'ModeDC'
    end
    object VouchTranIniQryModeC: TIntegerField
      FieldName = 'ModeC'
    end
    object VouchTranIniQryAccountFID: TIntegerField
      DisplayLabel = #23545#36716#31185#30446#19968
      FieldName = 'AccountFID'
    end
    object VouchTranIniQryAccountGID: TIntegerField
      DisplayLabel = #23545#36716#31185#30446#20108
      FieldName = 'AccountGID'
    end
    object VouchTranIniQryAccountOID: TIntegerField
      DisplayLabel = #23545#36716#31185#30446#19977
      FieldName = 'AccountOID'
    end
    object VouchTranIniQryOriginTable: TStringField
      FieldName = 'OriginTable'
      Size = 30
    end
    object VouchTranIniQryMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object VouchTranIniQryPeriodID: TIntegerField
      FieldName = 'PeriodID'
    end
    object VouchTranIniQryACCFname: TStringField
      DisplayLabel = #23545#36716#31185#30446#19968
      FieldKind = fkLookup
      FieldName = 'ACCFname'
      LookupDataSet = AccFADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'AccountFID'
      Lookup = True
    end
    object VouchTranIniQryAccGname: TStringField
      DisplayLabel = #23545#36716#31185#30446#20108
      FieldKind = fkLookup
      FieldName = 'AccGname'
      LookupDataSet = AccGADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'AccountGID'
      Lookup = True
    end
    object VouchTranIniQryAccOName: TStringField
      DisplayLabel = #23545#36716#31185#30446#19977
      FieldKind = fkLookup
      FieldName = 'AccOName'
      LookupDataSet = AccOADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'AccountOID'
      Lookup = True
    end
  end
  object VouchTranIniDS: TDataSource
    DataSet = VouchTranIniQry
    Left = 16
    Top = 192
  end
  object AccFADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name from DASubject'#13#10'WHERE'#13#10'  RecordState<>'#39#21024#38500#39' '#13#10'and' +
      '  RecordState<>'#39#20572#29992#39' '
    Parameters = <>
    Left = 79
    Top = 160
  end
  object AccGADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name from DASubject'#13#10'WHERE RecordState<>'#39#21024#38500#39' '#13#10'and  R' +
      'ecordState<>'#39#20572#29992#39' '
    Parameters = <>
    Left = 144
    Top = 160
  end
  object AccOADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, Name from DASubject'#13#10'WHERE RecordState<>'#39#21024#38500#39' '#13#10'and Re' +
      'cordState<>'#39#20572#29992#39' '
    Parameters = <>
    Left = 207
    Top = 160
  end
  object AccFDS: TDataSource
    DataSet = AccFADS
    Left = 79
    Top = 192
  end
  object AccGDS: TDataSource
    DataSet = AccGADS
    Left = 143
    Top = 192
  end
  object AccODS: TDataSource
    DataSet = AccOADS
    Left = 207
    Top = 192
  end
  object TransAllPopupMenu: TPopupMenu
    Left = 312
    Top = 168
    object TranAllAct: TMenuItem
      Caption = #20840#37096#36716#25442
      OnClick = TranAllActClick
    end
    object TransAllNotAct: TMenuItem
      Caption = #37117#19981#36716#25442
      OnClick = TransAllNotActClick
    end
  end
  object TempADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'select * from FNVourchTranIni')
    Left = 400
    Top = 160
    object AutoIncField1: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
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
    object DateTimeField2: TDateTimeField
      FieldName = 'Date'
    end
    object StringField2: TStringField
      DisplayLabel = #36716#25442#21333#25454#21517#31216
      FieldName = 'BillName'
      Size = 30
    end
    object StringField3: TStringField
      DisplayLabel = #26159#21542#36716#25442
      FieldName = 'Code'
    end
    object StringField4: TStringField
      FieldName = 'BillMode'
      Size = 16
    end
    object IntegerField2: TIntegerField
      FieldName = 'ModeDC'
    end
    object IntegerField3: TIntegerField
      FieldName = 'ModeC'
    end
    object IntegerField4: TIntegerField
      DisplayLabel = #23545#36716#31185#30446#19968
      FieldName = 'AccountFID'
    end
    object IntegerField5: TIntegerField
      DisplayLabel = #23545#36716#31185#30446#20108
      FieldName = 'AccountGID'
    end
    object IntegerField6: TIntegerField
      DisplayLabel = #23545#36716#31185#30446#19977
      FieldName = 'AccountOID'
    end
    object StringField5: TStringField
      FieldName = 'OriginTable'
      Size = 30
    end
    object StringField6: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object IntegerField7: TIntegerField
      FieldName = 'PeriodID'
    end
    object StringField7: TStringField
      DisplayLabel = #23545#36716#31185#30446#19968
      FieldKind = fkLookup
      FieldName = 'ACCFname'
      LookupDataSet = AccFADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'AccountFID'
      Lookup = True
    end
    object StringField8: TStringField
      DisplayLabel = #23545#36716#31185#30446#20108
      FieldKind = fkLookup
      FieldName = 'AccGname'
      LookupDataSet = AccGADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'AccountGID'
      Lookup = True
    end
    object StringField9: TStringField
      DisplayLabel = #23545#36716#31185#30446#19977
      FieldKind = fkLookup
      FieldName = 'AccOName'
      LookupDataSet = AccOADS
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'AccountOID'
      Lookup = True
    end
  end
end
