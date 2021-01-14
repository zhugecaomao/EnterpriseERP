inherited FNCredenceBrowseForm: TFNCredenceBrowseForm
  Left = 91
  Top = 304
  Width = 812
  Height = 612
  Caption = #35760#24080#20973#35777
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 804
    ButtonWidth = 43
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton2: TToolButton
      Left = 43
      Top = 2
      Action = DeleteAction
    end
    object ToolButton3: TToolButton
      Left = 86
      Top = 2
      Action = EditAction
    end
    object ToolButton5: TToolButton
      Left = 129
      Top = 2
      Hint = #25353#27492#38190#21487#20197#23558#21407#22987#19994#21153#21333#25454#33258#21160#29983#25104#20973#35777
      Caption = #33258#21160
      ImageIndex = 9
      OnClick = ToolButton5Click
    end
    object ToolButton6: TToolButton
      Left = 172
      Top = 2
      Hint = #25353#27492#38190#35774#32622#21407#22987#21333#25454#30340#20973#35777#36716#25442#21442#25968#12290
      Caption = #21442#25968
      ImageIndex = 10
      OnClick = ToolButton6Click
    end
    object ToolButton14: TToolButton
      Left = 215
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 223
      Top = 2
      Action = PrintPreviewAction
      Caption = ' '#39044#35272' '
    end
    object ToolButton8: TToolButton
      Left = 266
      Top = 2
      Action = PrintAction
    end
    object ToolButton9: TToolButton
      Left = 309
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 317
      Top = 2
      Action = ExportAction
    end
    object ToolButton11: TToolButton
      Left = 360
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 368
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton16: TToolButton
      Left = 411
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton13: TToolButton
      Left = 454
      Top = 2
      Action = RefreshAction
    end
    object ToolButton4: TToolButton
      Left = 497
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton15: TToolButton
      Left = 505
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 804
    Height = 544
    inherited PageControl: TPageControl
      Top = 517
      Width = 804
      inherited TabSheet1: TTabSheet
        Caption = #35760#24080#20973#35777#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 804
      Height = 517
      Columns = <
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20973#35777#31867#21035
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20511#26041#37329#39069
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36151#26041#37329#39069
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Width = 264
          Visible = True
        end>
    end
    object TranVchPanel: TPanel
      Left = 216
      Top = 144
      Width = 281
      Height = 41
      Caption = #27491#22312#36716#25442#20973#35777#65292#35831#31245#21518'....'
      TabOrder = 2
      Visible = False
    end
  end
  inherited DataSource: TDataSource
    DataSet = adsCredence
  end
  object adsCredence: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'SELECT '#13#10'a.ID, a.CreateDate, '#13#10'a.CreateUserID,'#13#10'a.RecordState, '#13 +
      #10'a.Code ['#32534#21495'], '#13#10'a.Date ['#26085#26399'], '#13#10'a.BillMode ['#20973#35777#31867#21035'] ,'#13#10'b.DebitAmoun' +
      't ['#20511#26041#37329#39069'],'#13#10'b.CreditAmount ['#36151#26041#37329#39069'],'#13#10'a.memo ['#22791#27880']'#13#10'FROM FNCredMaste' +
      'r a'#13#10'left outer join '#13#10'( select Masterid,Sum(isnull(PriceBase,0)' +
      ') as DebitAmount,'#13#10'Sum(isnull(PriceCost,0)) as CreditAmount from' +
      ' FNCredDetail '#13#10'group by MasterID  ) as b on b.MasterID=A.ID'#13#10'WH' +
      'ERE a.RecordState <> '#39#21024#38500#39
    Parameters = <>
    Left = 152
    Top = 112
    object adsCredenceID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsCredenceCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsCredenceCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsCredenceRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsCredenceDSDesigner: TStringField
      FieldName = #32534#21495
    end
    object adsCredenceDSDesigner2: TDateTimeField
      FieldName = #26085#26399
    end
    object adsCredenceDSDesigner3: TStringField
      FieldName = #20973#35777#31867#21035
      Size = 16
    end
    object adsCredenceDSDesigner4: TBCDField
      FieldName = #20511#26041#37329#39069
      currency = True
      Precision = 19
    end
    object adsCredenceDSDesigner5: TBCDField
      FieldName = #36151#26041#37329#39069
      currency = True
      Precision = 19
    end
    object adsCredenceDSDesigner6: TStringField
      FieldName = #22791#27880
      Size = 60
    end
  end
  object VourchTranIniADS: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, CreateDate, CreateUserID, RecordState, Date, BillName' +
      ', Code, BillMode, ModeDC, ModeC, AccountFID, AccountGID, Account' +
      'OID, OriginTable, Memo, PeriodID'#13#10'from FNVourchTranIni'
    Parameters = <>
    Left = 208
    Top = 112
  end
  object VouchTranTemp: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 264
    Top = 112
  end
end
