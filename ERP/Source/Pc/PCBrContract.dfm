inherited PCBrContractForm: TPCBrContractForm
  Left = 87
  Top = 195
  Caption = #37319#36141#21512#21516
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
    object ToolButton5: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton10: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton14: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton11: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton12: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #37319#36141#21512#21516
      end
    end
    inherited DBGrid: TQLDBGrid
      Columns = <
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21512#21516#20027#39064
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = #30002#26041#21333#20301
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20057#26041#21333#20301
          Title.Alignment = taCenter
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = #30002#26041#20195#34920
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20057#26041#20195#34920
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #29983#25928#26085#26399
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32456#27490#26085#26399
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21512#21516#37329#39069
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end>
    end
  end
  inherited DataSource: TDataSource
    DataSet = AdsPCContract
    Left = 136
    Top = 104
  end
  object AdsPCContract: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select ID, caption as ['#21512#21516#20027#39064'],RecordState,'#13#10'Date as ['#26085#26399']  , Code ' +
      'as ['#32534#21495'] , Provider as ['#30002#26041#21333#20301'],'#13#10'Client as ['#20057#26041#21333#20301'] ,  ProviderDeput' +
      'y as ['#30002#26041#20195#34920'] ,'#13#10'ClientDeputy as ['#20057#26041#20195#34920'],'#13#10'StarDate as ['#29983#25928#26085#26399'],'#13#10'Exp' +
      'ireDate as ['#32456#27490#26085#26399'],  '#13#10'BargainAmount as ['#21512#21516#37329#39069'] ,MainClause as  ['#21512 +
      #21516#26465#27454']'#13#10'from PCContract '#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 216
    Top = 112
    object AdsPCContractID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object AdsPCContractDSDesigner: TDateTimeField
      FieldName = #26085#26399
    end
    object AdsPCContractDSDesigner2: TStringField
      FieldName = #32534#21495
    end
    object AdsPCContractDSDesigner11: TStringField
      FieldName = #21512#21516#20027#39064
      Size = 60
    end
    object AdsPCContractDSDesigner3: TStringField
      FieldName = #30002#26041#21333#20301
      Size = 60
    end
    object AdsPCContractDSDesigner4: TStringField
      FieldName = #20057#26041#21333#20301
      Size = 60
    end
    object AdsPCContractDSDesigner5: TStringField
      FieldName = #30002#26041#20195#34920
    end
    object AdsPCContractDSDesigner6: TStringField
      FieldName = #20057#26041#20195#34920
    end
    object AdsPCContractDSDesigner7: TDateTimeField
      FieldName = #29983#25928#26085#26399
    end
    object AdsPCContractDSDesigner8: TDateTimeField
      FieldName = #32456#27490#26085#26399
    end
    object AdsPCContractDSDesigner9: TBCDField
      FieldName = #21512#21516#37329#39069
      currency = True
      Precision = 19
    end
    object AdsPCContractDSDesigner10: TMemoField
      FieldName = #21512#21516#26465#27454
      BlobType = ftMemo
    end
    object AdsPCContractRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
  end
end
