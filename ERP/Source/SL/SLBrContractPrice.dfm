inherited SLBrContractPriceForm: TSLBrContractPriceForm
  Left = -4
  Top = -4
  Width = 808
  Height = 580
  Caption = #21512#21516#21806#20215#36164#26009
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
    object ToolButton12: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton11: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
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
      ImageIndex = 12
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
      Top = 486
      Width = 800
      Height = 26
      inherited TabSheet1: TTabSheet
        Caption = #21512#21516#21806#20215#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 800
      Height = 486
      Columns = <
        item
          Expanded = False
          FieldName = #26085#26399
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32534#21495
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21512#21516#31867#21035
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#21517#31216
          Title.Alignment = taCenter
          Width = 220
          Visible = True
        end
        item
          Expanded = False
          FieldName = #29983#25928#26085#26399
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22833#25928#26085#26399
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Width = 183
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20973#21333#29366#24577
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end>
    end
  end
  inherited DataSource: TDataSource
    DataSet = tblSLBrContractPrice
  end
  object tblSLBrContractPrice: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select  a.ID, a.CreateDate, a.CreateUserID, '#13#10'a.RecordState, a.C' +
      'lientID,'#13#10'a.Date ['#26085#26399'], a.Code ['#32534#21495'], '#13#10'a.ContractClass ['#21512#21516#31867#21035'],  '#13 +
      #10'b.Name ['#23458#25143#21517#31216'],'#13#10'a.StartDate ['#29983#25928#26085#26399'], '#13#10'a.ExpireDate ['#22833#25928#26085#26399'], '#13#10'a.' +
      'Memo ['#22791#27880'] ,'#13#10'a.RecordState ['#20973#21333#29366#24577']'#13#10'from SLContractPriceMaster a ' +
      #13#10'left outer join DAClient b  on b.ID=a.ClientID'#13#10'where b.Record' +
      'State<>'#39#21024#38500#39
    Parameters = <>
    Left = 140
    Top = 110
    object tblSLBrContractPriceID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblSLBrContractPriceCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblSLBrContractPriceCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblSLBrContractPriceRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblSLBrContractPriceClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object tblSLBrContractPriceDSDesigner: TDateTimeField
      FieldName = #26085#26399
    end
    object tblSLBrContractPriceDSDesigner2: TStringField
      FieldName = #32534#21495
      Size = 12
    end
    object tblSLBrContractPriceDSDesigner3: TStringField
      FieldName = #21512#21516#31867#21035
      Size = 12
    end
    object tblSLBrContractPriceDSDesigner4: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 50
    end
    object tblSLBrContractPriceDSDesigner5: TDateTimeField
      FieldName = #29983#25928#26085#26399
    end
    object tblSLBrContractPriceDSDesigner6: TDateTimeField
      FieldName = #22833#25928#26085#26399
    end
    object tblSLBrContractPriceDSDesigner7: TStringField
      FieldName = #22791#27880
      Size = 60
    end
    object tblSLBrContractPriceDSDesigner8: TStringField
      FieldName = #20973#21333#29366#24577
      Size = 12
    end
  end
end
