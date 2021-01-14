inherited POCreditBrowseForm: TPOCreditBrowseForm
  Left = 194
  Top = 253
  Caption = #37319#36141#20449#29992
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
    object ToolButton4: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton8: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton9: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton11: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton13: TToolButton
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
    object ToolButton15: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #38144#21806#25240#25187
      end
    end
    inherited DBGrid: TQLDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = 'Code'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CreditClass'
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QuotaAmount'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QuotaAmountMax'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'QuotaAmountMin'
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StartDate'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ExpireDate'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ClientName'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PeriodName'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Meno'
          Width = 100
          Visible = True
        end>
    end
  end
  object adsCredit: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT PC.*,DC.Name ClientName,MP.Name PeriodName'#13#10'FROM POCredit' +
      ' PC LEFT JOIN DAClient DC ON PC.ClientID=DC.ID LEFT JOIN MSPerio' +
      'd MP ON PC.PeriodID=MP.ID WHERE PC.RecordState<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 48
    Top = 152
    object adsCreditID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsCreditCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsCreditCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsCreditRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsCreditDate: TDateTimeField
      FieldName = 'Date'
      Visible = False
    end
    object adsCreditCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object adsCreditClientID: TStringField
      FieldName = 'ClientID'
      Visible = False
      Size = 12
    end
    object adsCreditCreditClass: TStringField
      DisplayLabel = #20449#29992#31561#32423
      FieldName = 'CreditClass'
      Size = 12
    end
    object adsCreditQuotaAmount: TBCDField
      DisplayLabel = #20449#29992#39069#24230
      FieldName = 'QuotaAmount'
      Precision = 19
    end
    object adsCreditQuotaAmountMax: TBCDField
      DisplayLabel = #26368#22823#39069#24230
      FieldName = 'QuotaAmountMax'
      Precision = 19
    end
    object adsCreditQuotaAmountMin: TBCDField
      DisplayLabel = #26368#23567#39069#24230
      FieldName = 'QuotaAmountMin'
      Precision = 19
    end
    object adsCreditStartDate: TDateTimeField
      DisplayLabel = #26377#25928#26085#26399
      FieldName = 'StartDate'
    end
    object adsCreditExpireDate: TDateTimeField
      DisplayLabel = #29983#25928#26085#26399
      FieldName = 'ExpireDate'
    end
    object adsCreditMeno: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'Meno'
      Size = 60
    end
    object adsCreditPeriodID: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object adsCreditClientName: TStringField
      DisplayLabel = #23458#25143
      FieldName = 'ClientName'
      Size = 50
    end
    object adsCreditPeriodName: TStringField
      DisplayLabel = #31649#29702#26399#38388
      FieldName = 'PeriodName'
      FixedChar = True
      Size = 7
    end
  end
end
