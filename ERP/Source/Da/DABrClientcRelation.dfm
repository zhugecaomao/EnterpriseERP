inherited DAClientcRelationBrowseForm: TDAClientcRelationBrowseForm
  Left = 60
  Top = 82
  Width = 718
  Height = 442
  Caption = #21378#21830#20851#31995#36164#26009
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 710
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
      Enabled = False
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = DeleteAction
      Enabled = False
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
    object ToolButton5: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
      Caption = #26174#31034#21015
    end
    object ToolButton13: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton14: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton15: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 710
    Height = 374
    inherited PageControl: TPageControl
      Top = 347
      Width = 710
      inherited TabSheet1: TTabSheet
        Caption = #21378#21830#20851#31995
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 710
      Height = 347
      Columns = <
        item
          Expanded = False
          FieldName = #23458#25143#21517#31216
          Title.Alignment = taCenter
          Title.Caption = #21378#21830#21517#31216
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #30005#35805
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25163#26426
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20256#30495
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#21592
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#20840#31216
          Title.Alignment = taCenter
          Title.Caption = #21378#21830#20840#31216
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22320#22336
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37038#25919#32534#30721
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22320#21306#21517#31216
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21040#31449#22320#22336
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22269#31246#35777#21495
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#33829#33539#22260
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27861#20154#20195#34920
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25191#29031#21495#30721
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27880#20876#36164#26412
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #27880#20876#26085#26399
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22320#31246#35777#21495
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20195#30721#35777#21495
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35777#20070#21495#30721
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24320#25143#38134#34892
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23458#25143#31867#22411
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #38134#34892#24080#21495
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #30005#23376#37038#31665
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32593#22336
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end>
    end
  end
  inherited DataSource: TDataSource
    DataSet = adsDALinkMenIDCard
  end
  object adsDALinkMenIDCard: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select'#13#10'a.ID,a.CreateDate,a.CreateUserID,a.RecordState,'#13#10'a.AreaI' +
      'D,a.EmlpoyeeID,'#13#10'a.Name ['#23458#25143#21517#31216'],a.FullName ['#23458#25143#20840#31216'], '#13#10'a.Address ['#22320 +
      #22336'], a.ToAddress ['#21040#31449#22320#22336'],'#13#10'a.Telephone ['#30005#35805'], a.Mobile ['#25163#26426'],'#13#10'a.Fax' +
      ' ['#20256#30495'], a.RegisterDate ['#27880#20876#26085#26399'],'#13#10'a.RegisterCapital  ['#27880#20876#36164#26412'], a.Char' +
      'ter ['#25191#29031#21495#30721'],'#13#10'a.BossName ['#27861#20154#20195#34920'], a.RunRange ['#32463#33829#33539#22260'],'#13#10'a.CentralTax' +
      ' ['#22269#31246#35777#21495'],a.LandTax ['#22320#31246#35777#21495'],'#13#10'a.Corporation ['#20195#30721#35777#21495'], a.Certificates ' +
      '['#35777#20070#21495#30721'],'#13#10'a.BankOpened ['#24320#25143#38134#34892'],a.ClientType ['#23458#25143#31867#22411'],'#13#10'a.BankAccount' +
      ' ['#38134#34892#24080#21495'], a.Memo ['#22791#27880'],'#13#10'a.EMail  ['#30005#23376#37038#31665'], a.Web ['#32593#22336'],'#13#10'a.PostalCod' +
      'e ['#37038#25919#32534#30721'],'#13#10'b.name ['#19994#21153#21592'],c.name ['#22320#21306#21517#31216']  '#13#10'from DAClient a '#13#10'left ' +
      'outer join MSEmployee b on a.EmlpoyeeID=b.ID'#13#10'left outer join DA' +
      'Area c on   a.AreaID=c.ID'#13#10'where a.RecordState<>'#39#21024#38500#39' and a.Clien' +
      'tType<>'#39#23458#25143#39
    Parameters = <>
    Left = 264
    Top = 120
    object adsDALinkMenIDCardID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDALinkMenIDCardCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsDALinkMenIDCardCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsDALinkMenIDCardRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsDALinkMenIDCardAreaID: TIntegerField
      FieldName = 'AreaID'
      Visible = False
    end
    object adsDALinkMenIDCardEmlpoyeeID: TIntegerField
      FieldName = 'EmlpoyeeID'
      Visible = False
    end
    object adsDALinkMenIDCardDSDesigner: TStringField
      FieldName = #23458#25143#21517#31216
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner5: TStringField
      FieldName = #30005#35805
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner6: TStringField
      FieldName = #25163#26426
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner7: TStringField
      FieldName = #20256#30495
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner24: TStringField
      FieldName = #19994#21153#21592
      Size = 30
    end
    object adsDALinkMenIDCardDSDesigner2: TStringField
      FieldName = #23458#25143#20840#31216
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner3: TStringField
      FieldName = #22320#22336
      Size = 60
    end
    object adsDALinkMenIDCardDSDesigner23: TStringField
      FieldName = #37038#25919#32534#30721
      Size = 10
    end
    object adsDALinkMenIDCardDSDesigner25: TStringField
      FieldName = #22320#21306#21517#31216
      Size = 30
    end
    object adsDALinkMenIDCardDSDesigner4: TStringField
      FieldName = #21040#31449#22320#22336
      Size = 60
    end
    object adsDALinkMenIDCardDSDesigner13: TStringField
      FieldName = #22269#31246#35777#21495
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner12: TStringField
      FieldName = #32463#33829#33539#22260
      Size = 300
    end
    object adsDALinkMenIDCardDSDesigner11: TStringField
      FieldName = #27861#20154#20195#34920
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner10: TStringField
      FieldName = #25191#29031#21495#30721
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner9: TBCDField
      FieldName = #27880#20876#36164#26412
      Precision = 19
    end
    object adsDALinkMenIDCardDSDesigner8: TDateTimeField
      FieldName = #27880#20876#26085#26399
    end
    object adsDALinkMenIDCardDSDesigner14: TStringField
      FieldName = #22320#31246#35777#21495
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner15: TStringField
      FieldName = #20195#30721#35777#21495
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner16: TStringField
      FieldName = #35777#20070#21495#30721
      Size = 300
    end
    object adsDALinkMenIDCardDSDesigner17: TStringField
      FieldName = #24320#25143#38134#34892
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner18: TStringField
      FieldName = #23458#25143#31867#22411
      Size = 16
    end
    object adsDALinkMenIDCardDSDesigner19: TStringField
      FieldName = #38134#34892#24080#21495
      Size = 50
    end
    object adsDALinkMenIDCardDSDesigner20: TStringField
      FieldName = #22791#27880
      Size = 60
    end
    object adsDALinkMenIDCardDSDesigner21: TStringField
      FieldName = #30005#23376#37038#31665
      Size = 30
    end
    object adsDALinkMenIDCardDSDesigner22: TStringField
      FieldName = #32593#22336
      Size = 30
    end
  end
end
