inherited YDBrExpressBalanceForm: TYDBrExpressBalanceForm
  Left = 70
  Top = 128
  Caption = #25928#30410#24179#34913
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = PrintAction
    end
    object ToolButton6: TToolButton
      Left = 110
      Top = 2
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 118
      Top = 2
      Action = ExportAction
    end
    object ToolButton5: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 181
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      OnChanging = PageControlChanging
      inherited TabSheet1: TTabSheet
        Caption = #26041#26696#21015#34920
      end
      object TabSheet2: TTabSheet
        Caption = #33021#21147#24179#34913#32467#26524
        ImageIndex = 1
      end
      object TabSheet5: TTabSheet
        Caption = #20013#38388#20135#21697#24179#34913
        ImageIndex = 4
      end
      object TabSheet3: TTabSheet
        Caption = #25237#20837#27719#24635
        ImageIndex = 2
      end
      object TabSheet4: TTabSheet
        Caption = #20135#20986#27719#24635
        ImageIndex = 3
      end
    end
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select *'#13#10'from YDBalanceOfMaterialMaster'#13#10'where RecordState<>'#39#21024#38500 +
      #39
    Parameters = <>
    Left = 48
    Top = 72
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
    object ADODataSet1Code: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
    end
    object ADODataSet1Date: TStringField
      DisplayLabel = #26085#26399
      FieldName = 'Date'
      Size = 30
    end
    object ADODataSet1Brief: TStringField
      DisplayLabel = #25688#35201
      FieldName = 'Brief'
      Size = 30
    end
    object ADODataSet1PlanID: TIntegerField
      FieldName = 'PlanID'
      Visible = False
    end
    object ADODataSet1Memo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 60
    end
  end
  object ADODataSet2: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select PP.Name,Ba.PowerName,PP.PowerIndex,(PP.PowerIndex-Ba.Powe' +
      'rName) as Balance'#13#10'From (select Ba.PowerID, sum(Ba.PowerIndex * ' +
      'Ba.FormulaScale) as PowerName'#13#10'      from YDBalanceOfMaterialDet' +
      'ial Ba '#13#10'      where Ba.MasterID=:ID'#13#10'      group by Ba.PowerID)' +
      ' Ba left join YDProductPower PP on Ba.PowerID=PP.ID'
    Parameters = <
      item
        Name = 'ID'
        Size = -1
        Value = Null
      end>
    Left = 104
    Top = 72
    object ADODataSet2Name: TStringField
      DisplayLabel = #33021#21147#21517#31216
      DisplayWidth = 20
      FieldName = 'Name'
    end
    object ADODataSet2PowerName: TBCDField
      DisplayLabel = #33021#32791#25351#25968
      DisplayWidth = 20
      FieldName = 'PowerName'
      Precision = 32
      Size = 0
    end
    object ADODataSet2PowerIndex: TBCDField
      DisplayLabel = #33021#21147#25351#25968
      DisplayWidth = 20
      FieldName = 'PowerIndex'
      Precision = 18
      Size = 0
    end
    object ADODataSet2Balance: TBCDField
      DisplayLabel = #33410#20313#29983#20135#33021#21147#25351#25968
      DisplayWidth = 20
      FieldName = 'Balance'
      Precision = 32
      Size = 0
    end
  end
  object ADODataSet3: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select ss.Name,ss.Unitl,Sum(TotalGoalQuantityIN) as TotalGoalQua' +
      'ntityIN,sum(TotalCostIN) as TotalCostIN'#13#10'      ,sum(TotalGoalQua' +
      'ntityOut) as TotalGoalQuantityOut,'#13#10'       sum(TotalCostOut)  as' +
      ' TotalCostOut ,'#13#10'        sum(TotalGoalQuantityIN-TotalGoalQuanti' +
      'tyOut) as TotalBalance  ,'#13#10'        sum(TotalCostIN-TotalCostOut)' +
      ' as CostBalance  '#13#10'from (Select SFirst.Name as Name,SFirst.Unitl' +
      ' as Unitl,SFirst.TotalGoalQuantity as TotalGoalQuantityIN,'#13#10'    ' +
      '         SFirst.TotalCost as TotalCostIN ,SNext.TotalGoalQuantit' +
      'y as TotalGoalQuantityOut,'#13#10'             SNext.TotalCost as Tota' +
      'lCostOut'#13#10'             '#13#10'      from (select GD.ID,GD.Name,Un.Nam' +
      'e as Unitl ,Pin.TotalGoalQuantity ,Pin.TotalCost'#13#10'      from (se' +
      'lect Pin.GoodsID,Pin.UnitId,sum(De.FormulaScale*Pin.GoalQuantity' +
      ') as TotalGoalQuantity ,sum(De.FormulaScale*Pin.Cost)as TotalCos' +
      't'#13#10'      from YDBalanceOfMaterialDetial De,YDProductFormulaIn Pi' +
      'n '#13#10'       where De.FormulaID= Pin.MasterID and De.MasterID=:ID'#13 +
      #10'       group by Pin.GoodsID,Pin.UnitId ) Pin '#13#10'      left join ' +
      'DaGoods  Gd on Pin.GoodsID=GD.ID'#13#10'      left join MSUnit Un On P' +
      'in.UnitId=Un.ID ) SFirst,'#13#10#13#10'      (select GD.ID,GD.Name,Un.Name' +
      ' as Unitl,Pin.TotalGoalQuantity,Pin.TotalCost'#13#10'       from (sele' +
      'ct Pin.GoodsID,Pin.UnitId,sum(De.FormulaScale*Pin.GoalQuantity) ' +
      'as TotalGoalQuantity ,sum(De.FormulaScale*Pin.Cost)as TotalCost'#13 +
      #10'      from YDBalanceOfMaterialDetial De,YDProductFormulaout Pin' +
      ' '#13#10'       where De.FormulaID= Pin.MasterID and De.MasterID=:ID1'#13 +
      #10'       group by Pin.GoodsID,Pin.UnitId ) Pin '#13#10'      left join ' +
      'DaGoods  Gd on Pin.GoodsID=GD.ID'#13#10'      left join MSUnit Un On P' +
      'in.UnitId=Un.ID) SNext'#13#10'      Where SFirst.ID=SNext.ID ) ss'#13#10'gro' +
      'up by ss.Name,ss.Unitl'#13#10#13#10
    Parameters = <
      item
        Name = 'ID'
        Size = -1
        Value = Null
      end
      item
        Name = 'ID1'
        Size = -1
        Value = Null
      end>
    Left = 168
    Top = 72
    object ADODataSet3Name: TStringField
      DisplayLabel = #20013#38388#20135#21697#21517#31216
      DisplayWidth = 20
      FieldName = 'Name'
      Size = 30
    end
    object ADODataSet3Unitl: TStringField
      DisplayLabel = #26631#20934#21333#20301
      DisplayWidth = 20
      FieldName = 'Unitl'
    end
    object ADODataSet3TotalGoalQuantityIN: TBCDField
      DisplayLabel = #25237#20837#25968#37327
      DisplayWidth = 20
      FieldName = 'TotalGoalQuantityIN'
      Precision = 32
      Size = 0
    end
    object ADODataSet3TotalGoalQuantityOut: TBCDField
      DisplayLabel = #20135#20986#25968#37327
      DisplayWidth = 20
      FieldName = 'TotalGoalQuantityOut'
      Precision = 32
      Size = 0
    end
    object ADODataSet3TotalBalance: TBCDField
      DisplayLabel = #25968#37327#24179#34913#20540
      DisplayWidth = 20
      FieldName = 'TotalBalance'
      Precision = 32
      Size = 0
    end
    object ADODataSet3TotalCostIN: TBCDField
      DisplayLabel = #25237#20837#25104#26412
      DisplayWidth = 20
      FieldName = 'TotalCostIN'
      Precision = 32
      Size = 0
    end
    object ADODataSet3TotalCostOut: TBCDField
      DisplayLabel = #20135#20986#25104#26412
      DisplayWidth = 20
      FieldName = 'TotalCostOut'
      Precision = 32
      Size = 0
    end
    object ADODataSet3CostBalance: TBCDField
      DisplayLabel = #25104#26412#24179#34913#20540
      DisplayWidth = 20
      FieldName = 'CostBalance'
      Precision = 32
      Size = 0
    end
  end
  object ADODataSet4: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select GD.Name,Un.Name,Pin.TotalGoalQuantity,Pin.TotalCost'#13#10'from' +
      ' (select Pin.GoodsID,Pin.UnitId,sum(De.FormulaScale*Pin.GoalQuan' +
      'tity) as TotalGoalQuantity ,sum(De.FormulaScale*Pin.Cost)as Tota' +
      'lCost'#13#10'      from YDBalanceOfMaterialDetial De,YDProductFormulaI' +
      'n Pin '#13#10'       where De.FormulaID= Pin.MasterID and De.MasterID=' +
      ':ID'#13#10'       group by Pin.GoodsID,Pin.UnitId ) Pin '#13#10'left join Da' +
      'Goods  Gd on Pin.GoodsID=GD.ID'#13#10'left join MSUnit Un On Pin.UnitI' +
      'd=Un.ID'
    Parameters = <
      item
        Name = 'ID'
        Size = -1
        Value = Null
      end>
    Left = 256
    Top = 72
    object ADODataSet4Name: TStringField
      DisplayLabel = #26448#26009#21517#31216
      DisplayWidth = 20
      FieldName = 'Name'
      Size = 30
    end
    object ADODataSet4Name_1: TStringField
      DisplayLabel = #26631#20934#21333#20301
      DisplayWidth = 20
      FieldName = 'Name_1'
    end
    object ADODataSet4TotalGoalQuantity: TBCDField
      DisplayLabel = #25237#20837#25968#37327
      DisplayWidth = 20
      FieldName = 'TotalGoalQuantity'
      Precision = 32
      Size = 0
    end
    object ADODataSet4TotalCost: TBCDField
      DisplayLabel = #25237#20837#25104#26412
      DisplayWidth = 20
      FieldName = 'TotalCost'
      Precision = 32
      Size = 0
    end
  end
  object ADODataSet5: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select GD.Name,Un.Name,Pin.TotalGoalQuantity,Pin.TotalCost'#13#10'from' +
      ' (select Pin.GoodsID,Pin.UnitId,sum(De.FormulaScale*Pin.GoalQuan' +
      'tity) as TotalGoalQuantity ,sum(De.FormulaScale*Pin.Cost)as Tota' +
      'lCost'#13#10'      from YDBalanceOfMaterialDetial De,YDProductFormulao' +
      'ut Pin '#13#10'       where De.FormulaID= Pin.MasterID and De.MasterID' +
      '=:ID'#13#10'       group by Pin.GoodsID,Pin.UnitId ) Pin '#13#10'left join D' +
      'aGoods  Gd on Pin.GoodsID=GD.ID'#13#10'left join MSUnit Un On Pin.Unit' +
      'Id=Un.ID'#13#10
    Parameters = <
      item
        Name = 'ID'
        Size = -1
        Value = Null
      end>
    Left = 312
    Top = 80
    object ADODataSet5Name: TStringField
      DisplayLabel = #20135#21697#21517#31216
      DisplayWidth = 20
      FieldName = 'Name'
      Size = 30
    end
    object ADODataSet5Name_1: TStringField
      DisplayLabel = #21333#20301#21517#31216
      DisplayWidth = 20
      FieldName = 'Name_1'
    end
    object ADODataSet5TotalGoalQuantity: TBCDField
      DisplayLabel = #24635#25968#37327
      DisplayWidth = 20
      FieldName = 'TotalGoalQuantity'
      Precision = 32
      Size = 0
    end
    object ADODataSet5TotalCost: TBCDField
      DisplayLabel = #24635#25104#26412
      DisplayWidth = 20
      FieldName = 'TotalCost'
      Precision = 32
      Size = 0
    end
  end
end
