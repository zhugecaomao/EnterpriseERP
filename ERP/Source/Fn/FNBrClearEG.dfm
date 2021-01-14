inherited FNBrClearEGForm: TFNBrClearEGForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #39033#30446#32467#31639#31649#29702
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 800
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
    object ToolButton10: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
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
    object ToolButton12: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton14: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton8: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 800
    Height = 512
    inherited PageControl: TPageControl
      Top = 485
      Width = 800
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #39033#30446#25910#27454#32467#31639#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 800
      Height = 485
      ReadOnly = False
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#31867#21035
          Title.Alignment = taCenter
          Width = 94
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#21517#31216
          Title.Alignment = taCenter
          Width = 145
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24080#25143#21517#31216
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25910#27454#37329#39069
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25240#25187#36820#21033#37329#39069
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#25688#35201
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#25163#20154
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20973#21333#29366#24577
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 371
    Top = 77
  end
  inherited DataSource: TDataSource
    DataSet = adsSLBrClearBill
    Left = 222
    Top = 122
  end
  object adsSLBrClearBill: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select f.id,  f.ClientID, f.EmployeeID,f.RecordState,'#13#10'f.Date as' +
      ' ['#26085#26399'], f.Code as ['#32534#21495'], f.BillMode as ['#19994#21153#31867#21035'],'#13#10'C.name as ['#23458#25143#21517#31216'] ,' +
      ' FA.NAME AS ['#24080#25143#21517#31216'],'#13#10'Isnull(f.AmountD,0)*Isnull(f.ModeDC,1)*Isnu' +
      'll(f.ModeC,1)  as ['#25910#27454#37329#39069'],'#13#10'Isnull(f. AmountRed,0)*Isnull(f.ModeD' +
      'C,1)*Isnull(f.ModeC,1)  as ['#25240#25187#36820#21033#37329#39069'], '#13#10'E.name as ['#32463#25163#20154'] ,f.Brief ' +
      ' as ['#19994#21153#25688#35201'], F.Memo  as ['#22791#27880'] ,'#13#10'F.RecordState as ['#20973#21333#29366#24577']'#13#10'from FNC' +
      'learEGMaster F '#13#10'LEFT Outer join  MSEmployee E on E.ID=F.Employe' +
      'eID'#13#10'LEFT Outer join  DAClient C on C.ID=F.ClientID'#13#10'LEFT Outer ' +
      'join   FNAccounts  FA  on FA.ID=F.AccountsID '#13#10'where F.RecordSta' +
      'te<>'#39#21024#38500#39' '#13#10'Order by F.ID desc '
    Parameters = <>
    Left = 148
    Top = 110
    object adsSLBrClearBillDSDesigner2: TStringField
      FieldName = #32534#21495
      ReadOnly = True
    end
    object adsSLBrClearBillDSDesigner: TDateTimeField
      FieldName = #26085#26399
      ReadOnly = True
    end
    object adsSLBrClearBillDSDesigner3: TStringField
      FieldName = #19994#21153#31867#21035
      ReadOnly = True
      Size = 16
    end
    object adsSLBrClearBillDSDesigner4: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 50
    end
    object adsSLBrClearBillDSDesigner7: TStringField
      FieldName = #24080#25143#21517#31216
      Size = 30
    end
    object adsSLBrClearBillDSDesigner5: TBCDField
      FieldName = #25910#27454#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsSLBrClearBillDSDesigner6: TBCDField
      FieldName = #25240#25187#36820#21033#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsSLBrClearBillDSDesigner9: TStringField
      FieldName = #19994#21153#25688#35201
      ReadOnly = True
      Size = 30
    end
    object adsSLBrClearBillDSDesigner8: TStringField
      FieldName = #32463#25163#20154
      ReadOnly = True
      Size = 30
    end
    object adsSLBrClearBillDSDesigner10: TStringField
      FieldName = #22791#27880
      ReadOnly = True
      Size = 60
    end
    object adsSLBrClearBillDSDesigner12: TStringField
      FieldName = #20973#21333#29366#24577
      Size = 12
    end
    object adsSLBrClearBillid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object adsSLBrClearBillClientID: TIntegerField
      FieldName = 'ClientID'
      ReadOnly = True
      Visible = False
    end
    object adsSLBrClearBillEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      ReadOnly = True
      Visible = False
    end
    object adsSLBrClearBillRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
  end
  object WakeTimer: TTimer
    Enabled = False
    OnTimer = WakeTimerTimer
    Left = 312
    Top = 120
  end
  object AdsTimer: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 'select  *'#13#10'from FNClearSLMaster'#13#10'where 1=2'
    Parameters = <>
    Left = 220
    Top = 188
    object StringField1: TStringField
      FieldName = #32534#21495
      ReadOnly = True
    end
    object DateTimeField1: TDateTimeField
      FieldName = #26085#26399
      ReadOnly = True
    end
    object StringField2: TStringField
      FieldName = #19994#21153#31867#21035
      ReadOnly = True
      Size = 16
    end
    object StringField3: TStringField
      FieldName = #23458#25143'/'#21378#21830#21517#31216
      Size = 50
    end
    object StringField4: TStringField
      FieldName = #24080#25143#21517#31216
      Size = 30
    end
    object BCDField1: TBCDField
      FieldName = #25910#27454#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object BCDField2: TBCDField
      FieldName = #25240#25187#36820#21033#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object StringField5: TStringField
      FieldName = #19994#21153#25688#35201
      ReadOnly = True
      Size = 30
    end
    object StringField6: TStringField
      FieldName = #32463#25163#20154
      ReadOnly = True
      Size = 30
    end
    object StringField7: TStringField
      FieldName = #22791#27880
      ReadOnly = True
      Size = 60
    end
    object StringField8: TStringField
      FieldName = #20973#21333#29366#24577
      Size = 12
    end
    object AutoIncField1: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object IntegerField1: TIntegerField
      FieldName = 'ClientID'
      ReadOnly = True
      Visible = False
    end
    object IntegerField2: TIntegerField
      FieldName = 'EmployeeID'
      ReadOnly = True
      Visible = False
    end
    object StringField9: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
  end
end
