inherited FNBrAccountsForm: TFNBrAccountsForm
  Left = 106
  Top = 123
  Caption = ' '#36164' '#37329' '#24080' '#25143' '
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited PageControl: TPageControl
    Top = 272
    Height = 27
  end
  inherited DBGrid: TQLDBGrid
    Height = 231
    Columns = <
      item
        Expanded = False
        FieldName = 'Name'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CurrencyID'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AccountManger'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'AccountType'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BankOpenDate'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BankOpened'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BankAddress'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BankAccount'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CheckStamp'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BankStamp'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FingerMark'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
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
      Action = EditAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = DeleteAction
    end
    object ToolButton9: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = PrintAction
    end
    object ToolButton5: TToolButton
      Left = 228
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton10: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton7: TToolButton
      Left = 346
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton11: TToolButton
      Left = 401
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 409
      Top = 2
      Action = RefreshAction
    end
  end
  inherited ActionList: TActionList
    Left = 541
    Top = 17
  end
  inherited DataSource: TDataSource
    DataSet = tblFNAccountsBr
    Left = 553
    Top = 67
  end
  object tblFNAccountsBr: TADOTable
    Connection = CommonData.acnConnection
    Filtered = True
    OnFilterRecord = tblFNAccountsBrFilterRecord
    TableName = 'FNAccounts'
    Left = 460
    Top = 55
    object tblFNAccountsBrID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblFNAccountsBrName: TStringField
      DisplayLabel = #24080#25143#21517#31216
      FieldName = 'Name'
      Size = 12
    end
    object tblFNAccountsBrCurrencyID: TIntegerField
      DisplayLabel = #24065#31181'ID'
      FieldName = 'CurrencyID'
    end
    object tblFNAccountsBrAccountManger: TStringField
      DisplayLabel = #24080#25143#31649#29702#21592
      FieldName = 'AccountManger'
    end
    object tblFNAccountsBrAccountType: TStringField
      DisplayLabel = #24080#25143#31867#22411
      FieldName = 'AccountType'
      Size = 12
    end
    object tblFNAccountsBrBankOpenDate: TDateTimeField
      DisplayLabel = #24320#25143#26085#26399
      FieldName = 'BankOpenDate'
    end
    object tblFNAccountsBrBankOpened: TStringField
      DisplayLabel = #24320#25143#38134#34892
      FieldName = 'BankOpened'
      Size = 60
    end
    object tblFNAccountsBrBankAddress: TStringField
      DisplayLabel = #38134#34892#22320#22336
      FieldName = 'BankAddress'
      Size = 60
    end
    object tblFNAccountsBrBankAccount: TStringField
      DisplayLabel = #38134#34892#24080#21495
      FieldName = 'BankAccount'
    end
    object tblFNAccountsBrCheckStamp: TStringField
      DisplayLabel = #25903#31080#21360#31456
      FieldName = 'CheckStamp'
      Size = 60
    end
    object tblFNAccountsBrBankStamp: TStringField
      DisplayLabel = #38134#34892#21360#37492
      FieldName = 'BankStamp'
      Size = 60
    end
    object tblFNAccountsBrFingerMark: TBlobField
      DisplayLabel = #38134#34892#25351#32441
      FieldName = 'FingerMark'
    end
    object tblFNAccountsBrRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblFNAccountsBrCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblFNAccountsBrCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
  end
end
