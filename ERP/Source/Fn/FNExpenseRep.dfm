inherited FNExpenseRepForm: TFNExpenseRepForm
  Left = 49
  Top = 13
  Width = 725
  Height = 533
  Caption = #32463#33829#36153#29992#34920
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 717
    ButtonWidth = 55
    object ToolButton4: TToolButton
      Left = 0
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton5: TToolButton
      Left = 55
      Top = 2
      Action = PrintAction
    end
    object ToolButton11: TToolButton
      Left = 110
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 118
      Top = 2
      Action = ExportAction
    end
    object ToolButton12: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 181
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton1: TToolButton
      Left = 236
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton8: TToolButton
      Left = 291
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 354
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 717
    Height = 465
    inherited PageControl: TPageControl
      Top = 438
      Width = 717
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #26399#38388#32463#33829#36153#29992#34920
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 60
      Width = 717
      Height = 378
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
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #19994#21153#25688#35201
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36153#29992#21517#31216
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #36153#29992#37329#39069
          Title.Alignment = taCenter
          Width = 110
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25253#38144#20154
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37096#38376#21517#31216
          Title.Alignment = taCenter
          Width = 120
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
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21442#32771#37329#39069
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 60
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object Label1: TLabel
        Left = 19
        Top = 29
        Width = 48
        Height = 12
        Caption = #24320#22987#26085#26399
      end
      object Label2: TLabel
        Left = 211
        Top = 29
        Width = 48
        Height = 12
        Caption = #32467#26463#26085#26399
      end
      object Label3: TLabel
        Left = 19
        Top = 8
        Width = 72
        Height = 12
        Caption = #36153#29992#26102#38388#27573#65306
      end
      object DateTimePicker1: TDateTimePicker
        Left = 76
        Top = 25
        Width = 100
        Height = 20
        CalAlignment = dtaLeft
        Date = 37596.1952293866
        Time = 37596.1952293866
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
        OnChange = DateTimePicker1Change
      end
      object DateTimePicker2: TDateTimePicker
        Left = 272
        Top = 25
        Width = 100
        Height = 20
        CalAlignment = dtaLeft
        Date = 37596.1954960764
        Time = 37596.1954960764
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 1
        OnChange = DateTimePicker2Change
      end
      object BitBtn1: TBitBtn
        Left = 400
        Top = 23
        Width = 75
        Height = 25
        Caption = #25191#34892#32467#26524
        TabOrder = 2
        OnClick = BitBtn1Click
      end
    end
  end
  inherited ActionList: TActionList
    Left = 83
    Top = 221
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 46
    Top = 218
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select b.Date as ['#26085#26399'] ,b.Code as ['#32534#21495'], '#13#10'        b.BillMode ['#19994#21153#31867 +
      #21035'],b.Brief ['#19994#21153#25688#35201'],     '#13#10'        c.name as ['#36153#29992#21517#31216'], a.Amount ['#36153#29992#37329 +
      #39069'],        '#13#10'        f.name as ['#25253#38144#20154'], g.name as ['#37096#38376#21517#31216'],         ' +
      '             '#13#10'        a.AmountB ['#21442#32771#37329#39069'], d.name as ['#32463#25163#20154'],     '#13#10 +
      '        a.Memo as ['#22791#27880'],                             '#13#10'        a.' +
      'ExpenseID, b.ClientID,b.RecordState       '#13#10'        from FNExpen' +
      'seDetail a                         '#13#10'        left outer join FNE' +
      'xpensemaster b on b.ID=a.MasterID  '#13#10'        left outer join DAE' +
      'xpenseClass c on  c.ID=a.ExpenseID '#13#10'        left outer join MSE' +
      'mployee d on  d.ID=b.EmployeeID    '#13#10'        left outer join MSE' +
      'mployee f on  f.ID=b.ClientID '#13#10'        left outer join MSDepart' +
      'ment g on  g.ID=f.DepartmentID '#13#10'where 1=3'#13#10
    Parameters = <>
    Left = 212
    Top = 236
    object adsMasterDSDesigner: TDateTimeField
      FieldName = #26085#26399
    end
    object adsMasterDSDesigner2: TStringField
      FieldName = #32534#21495
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #19994#21153#31867#21035
      Size = 16
    end
    object adsMasterDSDesigner4: TStringField
      FieldName = #19994#21153#25688#35201
      Size = 30
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #36153#29992#21517#31216
      Size = 60
    end
    object adsMasterDSDesigner6: TBCDField
      FieldName = #36153#29992#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterDSDesigner11: TStringField
      FieldName = #25253#38144#20154
      Size = 30
    end
    object adsMasterDSDesigner7: TStringField
      FieldName = #37096#38376#21517#31216
      Size = 30
    end
    object adsMasterDSDesigner10: TStringField
      FieldName = #22791#27880
      Size = 30
    end
    object adsMasterDSDesigner9: TStringField
      FieldName = #32463#25163#20154
      Size = 30
    end
    object adsMasterDSDesigner8: TBCDField
      FieldName = #21442#32771#37329#39069
      DisplayFormat = '#,#.00'
      Precision = 19
    end
    object adsMasterExpenseID: TIntegerField
      FieldName = 'ExpenseID'
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
  end
end
