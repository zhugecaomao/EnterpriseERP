inherited EGBrExpenseForm: TEGBrExpenseForm
  Left = -21
  Top = 218
  Width = 808
  Height = 580
  Caption = #39033#30446#36153#29992
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
    Width = 800
    Height = 512
    inherited PageControl: TPageControl
      Top = 485
      Width = 800
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #39033#30446#36153#29992#36164#26009
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
          FieldName = #39033#30446#21517#31216
          Title.Alignment = taCenter
          Width = 95
          Visible = True
        end
        item
          Expanded = False
          FieldName = #37329#39069
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = #32463#25163#20154
          Title.Alignment = taCenter
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = #22791#27880
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = #20973#21333#29366#24577
          Title.Alignment = taCenter
          Width = 80
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
    Left = 246
    Top = 114
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select   a.ID,  a.RecordState ,  a.ClientID ,a. EmployeeID,a.Cod' +
      'e as ['#32534#21495'],a.Date ['#26085#26399'],  a.BillMode ['#19994#21153#31867#21035'],'#13#10'f.name ['#36827#26009#20179#24211'] ,'#13#10'a.C' +
      'learDate ['#32467#31639#26085#26399'], d.name  ['#39033#30446#21517#31216'], '#13#10'a.Deliver ['#36865#36135#35201#27714'], a.Memo ['#22791#27880']' +
      ',b.name as ['#23458#25143#21517#31216'] '#13#10',c.name as ['#32463#25163#20154'], A.SundryFee*a.ModeDC*a.Mod' +
      'eC  as ['#38468#21152#36153#29992'] ,'#13#10'ttl.Amount*a.ModeDC*a.ModeC as ['#37329#39069'] ,'#13#10'ttl.Disc' +
      'ount*a.ModeDC*a.ModeC as ['#25240#25187#37329#39069'],'#13#10'a.Recordstate as ['#20973#21333#29366#24577']'#13#10'from ' +
      'EGExpenseMaster  a '#13#10'left outer join  DAClient b on b. ID=a.Clie' +
      'ntID '#13#10'left outer join  MSEmployee  c on c.id=a. EmployeeID   '#13#10 +
      'left outer join  DAproject  d on d.id=a. ProjectClassID   '#13#10'left' +
      ' outer join '#13#10'(select masterID, (sum(isnull(Amount,0))+Sum(Isnul' +
      'l(TaxAmount,0))+'#13#10'Sum(Isnull(SundryFee,0))) as Amount ,sum(isnul' +
      'l(Discount,0)) as Discount'#13#10'from EGExpenseDetail group by master' +
      'ID) as ttl '#13#10'on ttl.masterID=a.id '#13#10#13#10'left outer join  STWareHou' +
      'se f on f. ID=a.WareHouseID'#13#10#13#10'WHERE  A.RECORDSTATE<>'#39#21024#38500#39' '#13#10'orde' +
      'r by a.ID DESC'
    Parameters = <>
    Left = 192
    Top = 108
    object adsMasterDSDesigner: TStringField
      FieldName = #32534#21495
      ReadOnly = True
    end
    object adsMasterDSDesigner2: TDateTimeField
      FieldName = #26085#26399
      ReadOnly = True
      DisplayFormat = 'yyyy-mm-dd'
    end
    object adsMasterDSDesigner3: TStringField
      FieldName = #19994#21153#31867#21035
      ReadOnly = True
      Size = 16
    end
    object adsMasterDSDesigner8: TStringField
      FieldName = #23458#25143#21517#31216
      ReadOnly = True
      Size = 50
    end
    object adsMasterDSDesigner5: TStringField
      FieldName = #39033#30446#21517#31216
      Size = 60
    end
    object adsMasterDSDesigner10: TBCDField
      FieldName = #37329#39069
      ReadOnly = True
      DisplayFormat = '#,#.00'
      
      Precision = 32
      Size = 5
    end
    object adsMasterDSDesigner14: TStringField
      FieldName = #36827#26009#20179#24211
      Size = 30
    end
    object adsMasterDSDesigner9: TStringField
      FieldName = #32463#25163#20154
      ReadOnly = True
      Size = 30
    end
    object adsMasterDSDesigner13: TStringField
      FieldName = #20973#21333#29366#24577
      Size = 12
    end
    object adsMasterDSDesigner7: TStringField
      FieldName = #22791#27880
      ReadOnly = True
      Size = 60
    end
    object adsMasterDSDesigner4: TDateTimeField
      FieldName = #32467#31639#26085#26399
      ReadOnly = True
      Visible = False
    end
    object adsMasterDSDesigner6: TStringField
      FieldName = #36865#36135#35201#27714
      ReadOnly = True
      Visible = False
      Size = 30
    end
    object adsMasterDSDesigner12: TBCDField
      FieldName = #38468#21152#36153#29992
      Visible = False
      DisplayFormat = '#,#.00'
      
      Precision = 19
      Size = 5
    end
    object adsMasterDSDesigner11: TBCDField
      FieldName = #25240#25187#37329#39069
      ReadOnly = True
      Visible = False
      DisplayFormat = '#,#.00'
      
      Precision = 19
    end
    object adsMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsMasterClientID: TIntegerField
      FieldName = 'ClientID'
      Visible = False
    end
    object adsMasterEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Visible = False
    end
    object adsMasterRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 320
    Top = 136
  end
end
