inherited STHouseOutBrowsePCForm: TSTHouseOutBrowsePCForm
  Left = 146
  Top = 172
  Caption = #36864#36135#20986#24211
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
      ImageIndex = 12
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #36864#36135#20986#24211
      end
    end
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select a.ID,a.CreateDate,a.CreateUserID,a.RecordState,a.Date,a.C' +
      'ode,a.HouseOut,a.OriginBillID,b.Name as ConsigneeName,c.Name as ' +
      'MngName,a.PeriodID,e.Name as WarehouseName,f.Name as BillTypeNam' +
      'e,a.memo'#13#10' from STHouseOutMaster as a '#13#10' left join MSEmployee as' +
      ' b on a.ConsigneeID=b.ID'#13#10' left join MSEmployee as c on a.Employ' +
      'eeID=c.ID'#13#10' left join STWarehouse as e on a.WarehouseID=e.ID'#13#10' l' +
      'eft join DABillType as f on a.OriginBillTypeID= f.ID'#13#10' where a.R' +
      'ecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 88
    Top = 112
    object ADODataSet1ID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object ADODataSet1CreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object ADODataSet1CreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object ADODataSet1RecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object ADODataSet1OriginBillID: TIntegerField
      DisplayLabel = #26469#28304'ID'
      FieldName = 'OriginBillID'
      Visible = False
    end
    object ADODataSet1Date: TDateTimeField
      DisplayLabel = #20986#24211#26085#26399
      DisplayWidth = 10
      FieldName = 'Date'
    end
    object ADODataSet1Code: TStringField
      DisplayLabel = #32534#21495
      DisplayWidth = 12
      FieldName = 'Code'
    end
    object ADODataSet1HouseOut: TStringField
      DisplayLabel = #20986#24211#20998#31867
      DisplayWidth = 10
      FieldName = 'HouseOut'
      Size = 12
    end
    object ADODataSet1ConsigneeName: TStringField
      DisplayLabel = #39046#26009#20154
      DisplayWidth = 10
      FieldName = 'ConsigneeName'
      Size = 30
    end
    object ADODataSet1MngName: TStringField
      DisplayLabel = #20179#24211#31649#29702#21592
      DisplayWidth = 10
      FieldName = 'MngName'
      Size = 30
    end
    object ADODataSet1WarehouseName: TStringField
      DisplayLabel = #20179#24211
      DisplayWidth = 15
      FieldName = 'WarehouseName'
      Size = 30
    end
    object ADODataSet1BillTypeName: TStringField
      DisplayLabel = #26469#28304#21333#25454
      DisplayWidth = 15
      FieldName = 'BillTypeName'
      Size = 30
    end
    object ADODataSet1PeriodID: TIntegerField
      FieldName = 'PeriodID'
      Visible = False
    end
    object ADODataSet1memo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'memo'
      Size = 50
    end
  end
end
