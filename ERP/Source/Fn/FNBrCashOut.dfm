inherited FNBrCashOutForm: TFNBrCashOutForm
  Left = -35
  Top = 96
  Width = 697
  Height = 522
  Caption = #20869#37096#20184#27454#30003#35831#31649#29702
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
    Width = 689
    Height = 454
    inherited PageControl: TPageControl
      Top = 427
      Width = 689
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #20184#27454#30003#35831#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 689
      Height = 427
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
          FieldName = #24080#25143#21517#31216
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20184#27454#37329#39069
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20914#24080#37329#39069
          Title.Alignment = taCenter
          Width = 110
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
          FieldName = #21463#27454#20154
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
    Left = 307
    Top = 133
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 190
    Top = 130
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select f.id,  f.ClientID, f.EmployeeID,f.RecordState,'#13#10'f.Date as' +
      ' ['#26085#26399'], f.Code as ['#32534#21495'], f.BillMode as ['#19994#21153#31867#21035'],'#13#10'C.name as ['#21463#27454#20154'] , ' +
      'FA.NAME AS ['#24080#25143#21517#31216'],'#13#10'Isnull(f.AmountC,0)*Isnull(f.ModeDC,1)*Isnul' +
      'l(f.ModeC,1)   as ['#20184#27454#37329#39069'],'#13#10'Isnull(f. AmountRed,0)*Isnull(f.ModeD' +
      'C,1)*Isnull(f.ModeC,1)   as ['#20914#24080#37329#39069'], '#13#10'E.name as ['#32463#25163#20154'] ,f.Brief  ' +
      'as ['#19994#21153#25688#35201'], F.Memo  as ['#22791#27880'] ,'#13#10'F.RecordState as ['#20973#21333#29366#24577']'#13#10'from FNCa' +
      'shOutMaster F '#13#10'LEFT Outer join  MSEmployee E on E.ID=F.Employee' +
      'ID'#13#10'LEFT Outer join  MSEmployee  C on C.ID=F.ClientID'#13#10'LEFT Oute' +
      'r join   FNAccounts  FA  on FA.ID=F.AccountsID '#13#10'where F.RecordS' +
      'tate<>'#39#21024#38500#39' '#13#10'Order by F.ID desc '#13#10#13#10
    Parameters = <>
    Left = 120
    Top = 132
    object adsMasterDSDesigner2: TStringField
      FieldName = #32534#21495
      ReadOnly = True
    end
    object adsMasterDSDesigner: TDateTimeField
      FieldName = #26085#26399
      ReadOnly = True
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #19994#21153#31867#21035
      ReadOnly = True
      Size = 16
    end
    object adsMasterDSDesigner9: TStringField
      FieldName = #19994#21153#25688#35201
      ReadOnly = True
      Size = 30
    end
    object adsMasterDSDesigner4: TStringField
      FieldName = #21463#27454#20154
      Size = 30
    end
    object adsMasterDSDesigner7: TStringField
      FieldName = #24080#25143#21517#31216
      Size = 30
    end
    object adsMasterDSDesigner5: TBCDField
      FieldName = #20184#27454#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner6: TBCDField
      FieldName = #20914#24080#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner8: TStringField
      FieldName = #32463#25163#20154
      ReadOnly = True
      Size = 30
    end
    object adsMasterDSDesigner10: TStringField
      FieldName = #22791#27880
      ReadOnly = True
      Size = 60
    end
    object adsMasterDSDesigner12: TStringField
      FieldName = #20973#21333#29366#24577
      Size = 12
    end
    object adsMasterid: TAutoIncField
      FieldName = 'id'
      ReadOnly = True
      Visible = False
    end
    object adsMasterClientID: TIntegerField
      FieldName = 'ClientID'
      ReadOnly = True
      Visible = False
    end
    object adsMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      ReadOnly = True
      Visible = False
    end
    object adsMasterRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
  end
end
