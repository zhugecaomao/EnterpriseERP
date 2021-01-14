inherited STBrCountOffForm: TSTBrCountOffForm
  Left = 157
  Top = 162
  Caption = #24211#23384#30424#28857
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
      Action = EditAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = DeleteAction
    end
    object ToolButton12: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
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
    object ToolButton13: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 12
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
      Caption = #26174#31034#21015
    end
    object ToolButton8: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton10: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
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
    inherited PageControl: TPageControl
      Top = 230
      Height = 28
      inherited TabSheet1: TTabSheet
        Caption = #24211#23384#30424#28857
      end
    end
    inherited DBGrid: TQLDBGrid
      Height = 230
      Columns = <
        item
          Expanded = False
          FieldName = 'Date'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Code'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CountManName'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CheckName'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EmployeeName'
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 421
    Top = 82
  end
  inherited DataSource: TDataSource
    DataSet = tblSTBrCountOff
    Left = 488
    Top = 132
  end
  object tblSTBrCountOff: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select *'#13#10'from STCountOffMaster'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 210
    Top = 95
    object tblSTBrCountOffID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblSTBrCountOffCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblSTBrCountOffCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblSTBrCountOffRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblSTBrCountOffDate: TDateTimeField
      DisplayLabel = #30424#28857#26085#26399
      FieldName = 'Date'
    end
    object tblSTBrCountOffCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object tblSTBrCountOffBrief: TStringField
      DisplayLabel = #30424#28857#35828#26126
      FieldName = 'Brief'
      Size = 40
    end
    object tblSTBrCountOffEmployeID: TIntegerField
      DisplayLabel = #20179#24211#31649#29702#21592'ID'
      FieldName = 'EmployeID'
      Visible = False
    end
    object tblSTBrCountOffCountManID: TIntegerField
      DisplayLabel = #30424#28857#20154'ID'
      FieldName = 'CountManID'
      Visible = False
    end
    object tblSTBrCountOffCheckID: TIntegerField
      DisplayLabel = #30417#30563#20154'ID'
      FieldName = 'CheckID'
      Visible = False
    end
    object tblSTBrCountOffMemo: TStringField
      FieldName = 'Memo'
      Size = 60
    end
    object tblSTBrCountOffCountManName: TStringField
      DisplayLabel = #30424#28857#20154
      FieldKind = fkLookup
      FieldName = 'CountManName'
      LookupDataSet = EmployeeName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'CountManID'
      Lookup = True
    end
    object tblSTBrCountOffCheckName: TStringField
      DisplayLabel = #30417#30563#20154
      FieldKind = fkLookup
      FieldName = 'CheckName'
      LookupDataSet = EmployeeName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'CheckID'
      Lookup = True
    end
    object tblSTBrCountOffEmployeeName: TStringField
      DisplayLabel = #20179#24211#31649#29702#21592
      FieldKind = fkLookup
      FieldName = 'EmployeeName'
      LookupDataSet = EmployeeName
      LookupKeyFields = 'ID'
      LookupResultField = 'Name'
      KeyFields = 'EmployeID'
      Lookup = True
    end
  end
  object EmployeeName: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'select *'#13#10'from MSEmployee'
    Parameters = <>
    Left = 320
    Top = 120
  end
end
