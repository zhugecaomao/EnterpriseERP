inherited DABrAccountCodeForm: TDABrAccountCodeForm
  Left = 59
  Top = 121
  Caption = #20250#35745#31185#30446#36164#26009
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = DeleteAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = EditAction
    end
    object ToolButton12: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton5: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton11: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton10: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton8: TToolButton
      Left = 409
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 464
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #36164#20135#31867
      end
      object TabSheet2: TTabSheet
        Tag = 1
        Caption = #36127#20538#31867
        ImageIndex = 1
      end
      object TabSheet3: TTabSheet
        Tag = 2
        Caption = #26435#30410#31867
        ImageIndex = 2
      end
      object TabSheet4: TTabSheet
        Tag = 3
        Caption = #25439#30410#31867
        ImageIndex = 3
      end
      object TabSheet5: TTabSheet
        Tag = 4
        Caption = #36153#29992#25104#26412#31867
        ImageIndex = 4
      end
      object TabSheet6: TTabSheet
        Tag = 5
        Caption = #34920#22806#31185#30446#31867
        ImageIndex = 5
      end
    end
  end
  inherited WsBrowsePop: TPopupMenu
    Left = 24
    Top = 152
    inherited wsbrowsepopnRename: TMenuItem
      Visible = False
    end
  end
  object adsDAAccountCode1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT a.ID,a.CreateDate,a.currencyID,a.CreateUserID,a.RecordSta' +
      'te,a.BusinessType,a.AccountCode,a.AccountName,b.Name,a.DebitCred' +
      'it,a.Memo FROM DAAccountCode as a LEFT JOIN MSCurrency as b on a' +
      '.CurrencyID=b.ID where  a.RecordState<>'#39#21024#38500#39' and  BusinessType='#39#36164 +
      #20135#31867#39
    Parameters = <>
    Left = 88
    Top = 112
    object adsDAAccountCode1ID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDAAccountCode1CreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsDAAccountCode1CreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsDAAccountCode1RecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsDAAccountCode1BusinessType: TStringField
      FieldName = 'BusinessType'
      Visible = False
      Size = 12
    end
    object adsDAAccountCode1AccountCode: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'AccountCode'
      Size = 6
    end
    object adsDAAccountCode1AccountName: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'AccountName'
    end
    object adsDAAccountCode1Name: TStringField
      DisplayLabel = #24065#31181#21517#31216
      FieldName = 'Name'
    end
    object adsDAAccountCode1DebitCredit: TStringField
      DisplayLabel = #20313#39069#26041#21521
      FieldName = 'DebitCredit'
      Size = 4
    end
    object adsDAAccountCode1Memo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object adsDAAccountCode1currencyID: TIntegerField
      FieldName = 'currencyID'
      Visible = False
    end
  end
  object adsDAAccountCode2: TADODataSet
    Tag = 1
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT a.ID,a.CreateDate,a.currencyID,a.CreateUserID,a.RecordSta' +
      'te,a.BusinessType,a.AccountCode,a.AccountName,b.Name,a.DebitCred' +
      'it,a.Memo FROM DAAccountCode as a LEFT JOIN MSCurrency as b on a' +
      '.CurrencyID=b.ID where  a.RecordState<>'#39#21024#38500#39' and  BusinessType='#39#36127 +
      #20538#31867#39
    Parameters = <>
    Left = 128
    Top = 112
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
      FieldName = 'BusinessType'
      Visible = False
      Size = 12
    end
    object StringField3: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'AccountCode'
      Size = 6
    end
    object StringField4: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'AccountName'
    end
    object StringField5: TStringField
      DisplayLabel = #24065#31181#21517#31216
      FieldName = 'Name'
    end
    object StringField6: TStringField
      DisplayLabel = #20313#39069#26041#21521
      FieldName = 'DebitCredit'
      Size = 4
    end
    object StringField7: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object IntegerField2: TIntegerField
      FieldName = 'currencyID'
      Visible = False
    end
  end
  object adsDAAccountCode3: TADODataSet
    Tag = 2
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT a.ID,a.CreateDate,a.currencyID,a.CreateUserID,a.RecordSta' +
      'te,a.BusinessType,a.AccountCode,a.AccountName,b.Name,a.DebitCred' +
      'it,a.Memo FROM DAAccountCode as a LEFT JOIN MSCurrency as b on a' +
      '.CurrencyID=b.ID where  a.RecordState<>'#39#21024#38500#39' and  BusinessType='#39#26435 +
      #30410#31867#39
    Parameters = <>
    Left = 160
    Top = 112
    object AutoIncField2: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object DateTimeField2: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object IntegerField3: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object StringField8: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object StringField9: TStringField
      FieldName = 'BusinessType'
      Visible = False
      Size = 12
    end
    object StringField10: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'AccountCode'
      Size = 6
    end
    object StringField11: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'AccountName'
    end
    object StringField12: TStringField
      DisplayLabel = #24065#31181#21517#31216
      FieldName = 'Name'
    end
    object StringField13: TStringField
      DisplayLabel = #20313#39069#26041#21521
      FieldName = 'DebitCredit'
      Size = 4
    end
    object StringField14: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object IntegerField4: TIntegerField
      FieldName = 'currencyID'
      Visible = False
    end
  end
  object adsDAAccountCode4: TADODataSet
    Tag = 3
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT a.ID,a.CreateDate,a.currencyID,a.CreateUserID,a.RecordSta' +
      'te,a.BusinessType,a.AccountCode,a.AccountName,b.Name,a.DebitCred' +
      'it,a.Memo FROM DAAccountCode as a LEFT JOIN MSCurrency as b on a' +
      '.CurrencyID=b.ID where  a.RecordState<>'#39#21024#38500#39' and  BusinessType='#39#25439 +
      #30410#31867#39
    Parameters = <>
    Left = 216
    Top = 112
    object AutoIncField3: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object DateTimeField3: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object IntegerField5: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object StringField15: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object StringField16: TStringField
      FieldName = 'BusinessType'
      Visible = False
      Size = 12
    end
    object StringField17: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'AccountCode'
      Size = 6
    end
    object StringField18: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'AccountName'
    end
    object StringField19: TStringField
      DisplayLabel = #24065#31181#21517#31216
      FieldName = 'Name'
    end
    object StringField20: TStringField
      DisplayLabel = #20313#39069#26041#21521
      FieldName = 'DebitCredit'
      Size = 4
    end
    object StringField21: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object IntegerField6: TIntegerField
      FieldName = 'currencyID'
      Visible = False
    end
  end
  object adsDAAccountCode5: TADODataSet
    Tag = 4
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT a.ID,a.CreateDate,a.currencyID,a.CreateUserID,a.RecordSta' +
      'te,a.BusinessType,a.AccountCode,a.AccountName,b.Name,a.DebitCred' +
      'it,a.Memo FROM DAAccountCode as a LEFT JOIN MSCurrency as b on a' +
      '.CurrencyID=b.ID where  a.RecordState<>'#39#21024#38500#39' and  BusinessType='#39#36153 +
      #29992#25104#26412#31867#39
    Parameters = <>
    Left = 248
    Top = 112
    object AutoIncField4: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object DateTimeField4: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object IntegerField7: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object StringField22: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object StringField23: TStringField
      FieldName = 'BusinessType'
      Visible = False
      Size = 12
    end
    object StringField24: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'AccountCode'
      Size = 6
    end
    object StringField25: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'AccountName'
    end
    object StringField26: TStringField
      DisplayLabel = #24065#31181#21517#31216
      FieldName = 'Name'
    end
    object StringField27: TStringField
      DisplayLabel = #20313#39069#26041#21521
      FieldName = 'DebitCredit'
      Size = 4
    end
    object StringField28: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object IntegerField8: TIntegerField
      FieldName = 'currencyID'
      Visible = False
    end
  end
  object adsDAAccountCode6: TADODataSet
    Tag = 5
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT a.ID,a.CreateDate,a.currencyID,a.CreateUserID,a.RecordSta' +
      'te,a.BusinessType,a.AccountCode,a.AccountName,b.Name,a.DebitCred' +
      'it,a.Memo FROM DAAccountCode as a LEFT JOIN MSCurrency as b on a' +
      '.CurrencyID=b.ID where  a.RecordState<>'#39#21024#38500#39' and  BusinessType='#39#34920 +
      #22806#31185#30446#31867#39
    Parameters = <>
    Left = 288
    Top = 112
    object AutoIncField5: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object DateTimeField5: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object IntegerField9: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object StringField29: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object StringField30: TStringField
      FieldName = 'BusinessType'
      Visible = False
      Size = 12
    end
    object StringField31: TStringField
      DisplayLabel = #31185#30446#20195#30721
      FieldName = 'AccountCode'
      Size = 6
    end
    object StringField32: TStringField
      DisplayLabel = #31185#30446#21517#31216
      FieldName = 'AccountName'
    end
    object StringField33: TStringField
      DisplayLabel = #24065#31181#21517#31216
      FieldName = 'Name'
    end
    object StringField34: TStringField
      DisplayLabel = #20313#39069#26041#21521
      FieldName = 'DebitCredit'
      Size = 4
    end
    object StringField35: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
    object IntegerField10: TIntegerField
      FieldName = 'currencyID'
      Visible = False
    end
  end
end
