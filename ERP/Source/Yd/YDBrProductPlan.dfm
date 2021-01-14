inherited YDBrProductPlanForm: TYDBrProductPlanForm
  Left = 87
  Top = 134
  Width = 705
  Height = 398
  Caption = #29983#20135#35745#21010
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 697
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
    Width = 697
    Height = 330
    inherited PageControl: TPageControl
      Top = 303
      Width = 697
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #29983#20135#35745#21010#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 697
      Height = 303
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
          FieldName = #35745#21010#31867#21035
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21551#29992#26085#26399
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35745#21010#21517#31216
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #29289#26009#28165#21333#21517#31216
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #29289#26009#28165#21333#32534#21495
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #35268#26684#22411#21495
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25216#26415#35828#26126
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
          FieldName = #35774#35745#20154
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
          FieldName = #35745#21010#29366#24577
          Title.Alignment = taCenter
          Width = 100
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
    Left = 150
    Top = 114
  end
  inherited WsBrowsePop: TPopupMenu
    Left = 96
    Top = 120
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select   a.ID,  a.RecordState ,  '#13#10'a.ClientID ,a. EmployeeID,'#13#10'a' +
      '.CreateDate, a.CreateUserID,'#13#10'd.id  [YDFormalID] ,'#13#10'a.Code as ['#32534 +
      #21495'],a.Date ['#26085#26399'],  '#13#10'a.BillMode ['#35745#21010#31867#21035'],'#13#10'a.ClearDate ['#21551#29992#26085#26399'],  '#13#10'a.' +
      'brief as ['#35745#21010#21517#31216'],'#13#10'd.Brief ['#29289#26009#28165#21333#21517#31216'],'#13#10'd.CODE ['#29289#26009#28165#21333#32534#21495'],'#13#10'a.Apporti' +
      'on ['#35268#26684#22411#21495'],'#13#10'a.Deliver ['#25216#26415#35828#26126'], a.Memo ['#22791#27880'],b.name as ['#35774#35745#20154'] ,'#13#10'c.n' +
      'ame as ['#32463#25163#20154'], a.Recordstate as ['#35745#21010#29366#24577']'#13#10'from YDProductPlanMaster ' +
      'a '#13#10'left outer join  MSEmployee  b on b. ID=a.ClientID '#13#10'left ou' +
      'ter join  MSEmployee  c on c.id=a. EmployeeID   '#13#10'left outer joi' +
      'n  YDFormulaMaster d on d.id=a.WareHouseID'#13#10'WHERE  A.RECORDSTATE' +
      '<>'#39#21024#38500#39' '#13#10'order by a.ID DESC'
    Parameters = <>
    Left = 32
    Top = 116
    object adsMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsMasterRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsMasterClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Visible = False
    end
    object adsMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsMasterYDFormalID: TAutoIncField
      FieldName = 'YDFormalID'
      ReadOnly = True
      Visible = False
    end
    object adsMasterDSDesigner: TStringField
      FieldName = #32534#21495
    end
    object adsMasterDSDesigner2: TDateTimeField
      FieldName = #26085#26399
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #35745#21010#31867#21035
      Size = 16
    end
    object adsMasterDSDesigner4: TDateTimeField
      FieldName = #21551#29992#26085#26399
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #35745#21010#21517#31216
      Size = 30
    end
    object adsMasterDSDesigner6: TStringField
      FieldName = #29289#26009#28165#21333#21517#31216
      Size = 30
    end
    object adsMasterDSDesigner7: TStringField
      FieldName = #29289#26009#28165#21333#32534#21495
    end
    object adsMasterDSDesigner8: TStringField
      FieldName = #35268#26684#22411#21495
      Size = 12
    end
    object adsMasterDSDesigner9: TStringField
      FieldName = #25216#26415#35828#26126
      Size = 30
    end
    object adsMasterDSDesigner10: TStringField
      FieldName = #22791#27880
      Size = 60
    end
    object adsMasterDSDesigner11: TStringField
      FieldName = #35774#35745#20154
      Size = 30
    end
    object adsMasterDSDesigner12: TStringField
      FieldName = #32463#25163#20154
      Size = 30
    end
    object adsMasterDSDesigner13: TStringField
      FieldName = #35745#21010#29366#24577
      Size = 12
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 192
    Top = 120
  end
end
