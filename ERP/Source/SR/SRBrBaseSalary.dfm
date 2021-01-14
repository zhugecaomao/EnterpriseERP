inherited SRBrBaseSalaryForm: TSRBrBaseSalaryForm
  Left = 44
  Top = 35
  Width = 677
  Height = 488
  Caption = #24037#36164#34920#26680#31639
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 669
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
    Width = 669
    Height = 420
    inherited PageControl: TPageControl
      Top = 393
      Width = 669
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #24037#36164#34920#26680#31639#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 669
      Height = 393
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#31867#21035
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32479#35745#26399#38388
          Title.Alignment = taCenter
          Title.Caption = #35745#34218#26399#38388
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32479#35745#26085#26399
          Title.Alignment = taCenter
          Title.Caption = #35745#34218#26085#26399
          Width = 90
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
          FieldName = #23457#26680#20154
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21333#25454#29366#24577
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 371
    Top = 77
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 198
    Top = 108
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select a.ID, ClientID ,EmployeeID ,Date ['#26085#26399'], a.code,'#13#10'a.Code ['#32534 +
      #21495'], c.name as  ['#23457#26680#20154'], b.name as  ['#32463#25163#20154'],  '#13#10'BillMode ['#19994#21153#31867#21035'],  Bri' +
      'ef ['#32479#35745#26399#38388'], '#13#10'ClearDate ['#32479#35745#26085#26399'], Memo ['#22791#27880'],a.RecordState ['#21333#25454#29366#24577'],a.' +
      'RecordState'#13#10'from SRBaseSalaryMaster a '#13#10'left outer join MSEmplo' +
      'yee b on b.ID=a.EmployeeID '#13#10'left outer join MSEmployee c on c.I' +
      'D=a.ClientID '#13#10#13#10'where a.RecordState<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 160
    Top = 108
    object adsMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsMasterClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsMastercode: TStringField
      FieldName = 'code'
      Visible = False
    end
    object adsMasterRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Visible = False
    end
    object adsMasterDSDesigner: TDateTimeField
      FieldName = #26085#26399
    end
    object adsMasterDSDesigner2: TStringField
      FieldName = #32534#21495
    end
    object adsMasterDSDesigner4: TStringField
      FieldName = #32463#25163#20154
      Size = 30
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #23457#26680#20154
      Size = 30
    end
    object adsMasterDSDesigner7: TDateTimeField
      FieldName = #32479#35745#26085#26399
    end
    object adsMasterDSDesigner6: TStringField
      FieldName = #32479#35745#26399#38388
      Size = 30
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #19994#21153#31867#21035
      Size = 16
    end
    object adsMasterDSDesigner8: TStringField
      FieldName = #22791#27880
      Size = 60
    end
    object adsMasterDSDesigner9: TStringField
      FieldName = #21333#25454#29366#24577
      Size = 12
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 320
    Top = 136
  end
end