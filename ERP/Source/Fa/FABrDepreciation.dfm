inherited FABrDepreciationForm: TFABrDepreciationForm
  Left = 35
  Top = 152
  Width = 808
  Height = 580
  Caption = #25240#26087#31649#29702
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
        Caption = #25240#26087#31649#29702#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 800
      Height = 485
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#31867#21035
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25240#26087#26399#38388
          Title.Alignment = taCenter
          Width = 140
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25240#26087#26085#26399
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25240#26087#31867#21035
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25240#26087#35828#26126
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37329#39069
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23457#26680#20154
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#25163#20154
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Width = 140
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
    DataSet = adsSalesMaster
    Left = 246
    Top = 114
  end
  object adsSalesMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select a.ID,a.RecordState,a.ClientID,a. EmployeeID   ,a.Code as ' +
      '['#32534#21495'],a.Date ['#26085#26399'],  a.BillMode ['#19994#21153#31867#21035'],a.Brief  ['#25240#26087#26399#38388'],'#13#10'a.ClearDa' +
      'te ['#25240#26087#26085#26399'], a.Apportion ['#25240#26087#31867#21035'], '#13#10'a.Deliver ['#25240#26087#35828#26126'], a.Memo ['#22791#27880'], ' +
      'b.name  ['#23457#26680#20154'] ,'#13#10'c.name as ['#32463#25163#20154'],'#13#10'ttl.Amount*a.ModeDC*a.ModeC a' +
      's ['#37329#39069'] ,'#13#10'A.RECORDSTATE as ['#20973#21333#29366#24577']'#13#10'from FADepreciationMaster a '#13 +
      #10'left outer join   MSEmployee  b on b. ID=a.ClientID '#13#10'left oute' +
      'r join  MSEmployee  c on c.id=a. EmployeeID   '#13#10'left outer join ' +
      #13#10'(select masterID, sum(isnull(Amount,0)) as Amount '#13#10'from FADep' +
      'reciationDetail group by masterId  ) as ttl '#13#10'on ttl.masterID=a.' +
      'id '#13#10'WHERE  A.RECORDSTATE<>'#39#21024#38500#39' '#13#10'order by a.ID DESC'
    Parameters = <>
    Left = 192
    Top = 108
    object adsSalesMasterDSDesigner: TStringField
      FieldName = #32534#21495
    end
    object adsSalesMasterDSDesigner2: TDateTimeField
      FieldName = #26085#26399
    end
    object adsSalesMasterDSDesigner3: TStringField
      FieldName = #19994#21153#31867#21035
      Size = 16
    end
    object adsSalesMasterDSDesigner4: TStringField
      FieldName = #25240#26087#26399#38388
      Size = 30
    end
    object adsSalesMasterDSDesigner5: TDateTimeField
      FieldName = #25240#26087#26085#26399
    end
    object adsSalesMasterDSDesigner6: TStringField
      FieldName = #25240#26087#31867#21035
      Size = 12
    end
    object adsSalesMasterDSDesigner7: TStringField
      FieldName = #25240#26087#35828#26126
      Size = 30
    end
    object adsSalesMasterDSDesigner11: TBCDField
      FieldName = #37329#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      Precision = 32
      Size = 5
    end
    object adsSalesMasterDSDesigner9: TStringField
      FieldName = #23457#26680#20154
      Size = 30
    end
    object adsSalesMasterDSDesigner10: TStringField
      FieldName = #32463#25163#20154
      Size = 30
    end
    object adsSalesMasterDSDesigner8: TStringField
      FieldName = #22791#27880
      Size = 60
    end
    object adsSalesMasterDSDesigner12: TStringField
      FieldName = #20973#21333#29366#24577
      Size = 12
    end
    object adsSalesMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsSalesMasterRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsSalesMasterClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsSalesMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Visible = False
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 320
    Top = 136
  end
end
