inherited PCBrClearBillAForm: TPCBrClearBillAForm
  Left = 39
  Top = 214
  Width = 697
  Height = 338
  Caption = #38144#21806#32467#31639
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 689
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
    Width = 689
    Height = 270
    inherited PageControl: TPageControl
      Top = 243
      Width = 689
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #32467#31639#20973#21333
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 689
      Height = 243
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'Code'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
          Footer.Alignment = taCenter
          Footer.ValueType = fvtStaticText
        end
        item
          Expanded = False
          FieldName = 'Date'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ClientName'
          Title.Alignment = taCenter
          Width = 200
          Visible = True
          Footer.Alignment = taCenter
          Footer.Value = #21512'    '#35745
          Footer.ValueType = fvtStaticText
        end
        item
          Expanded = False
          FieldName = 'AcceptAmount'
          Title.Alignment = taCenter
          Width = 110
          Visible = True
          Footer.ValueType = fvtSum
        end
        item
          Expanded = False
          FieldName = 'BillMode'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Employename'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Memo'
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 371
    Top = 77
  end
  inherited DataSource: TDataSource
    DataSet = tblSLBrClearBill
    Left = 318
    Top = 82
  end
  object tblSLBrClearBill: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select a.*,b.name as ClientName,c.name as Employename'#13#10'from PCCl' +
      'earBillMaster a inner join  DAClient b on '#13#10'b. ID=a.ClientID inn' +
      'er join  MSEmployee  c on'#13#10'c.id=a. EmployeID'#13#10'WHERE  A.RECORDSTA' +
      'TE<>'#39#21024#38500#39
    Parameters = <>
    Left = 80
    Top = 96
    object tblSLBrClearBillID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblSLBrClearBillCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblSLBrClearBillCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblSLBrClearBillRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblSLBrClearBillDate: TDateTimeField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
    end
    object tblSLBrClearBillCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object tblSLBrClearBillClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object tblSLBrClearBillEmployeID: TIntegerField
      FieldName = 'EmployeID'
      Visible = False
    end
    object tblSLBrClearBillOriginBillID: TIntegerField
      FieldName = 'OriginBillID'
      Visible = False
    end
    object tblSLBrClearBillPeriodID: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object tblSLBrClearBillAcceptAmount: TBCDField
      DisplayLabel = #25910#27454#37329#39069
      FieldName = 'AcceptAmount'
      currency = True
      Precision = 19
    end
    object tblSLBrClearBillMemo: TStringField
      DisplayLabel = #22791'    '#27880
      FieldName = 'Memo'
      Size = 30
    end
    object tblSLBrClearBillClientName: TStringField
      DisplayLabel = #23458#25143#21517#31216
      FieldName = 'ClientName'
      Size = 50
    end
    object tblSLBrClearBillEmployename: TStringField
      DisplayLabel = #32463#25163#20154
      FieldName = 'Employename'
      Size = 30
    end
    object tblSLBrClearBillBillMode: TStringField
      DisplayLabel = #19994#21153#31867#21035
      FieldName = 'BillMode'
      Size = 16
    end
    object tblSLBrClearBillBillModeDC: TIntegerField
      DisplayLabel = #37329#39069#32467#31639#26041#21521
      FieldName = 'BillModeDC'
      Visible = False
    end
  end
  object ClientName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from DAClient'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 425
    Top = 180
  end
  object EmployeeName: TADODataSet
    Active = True
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from MSEmployee'
    Parameters = <>
    Left = 505
    Top = 185
  end
end
