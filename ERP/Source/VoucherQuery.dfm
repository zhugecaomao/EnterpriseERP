inherited VoucherQueryForm: TVoucherQueryForm
  Left = 26
  Top = 97
  Width = 766
  Height = 449
  Caption = 'VoucherQueryForm'
  Position = poDesigned
  Visible = False
  WindowState = wsNormal
  OnClick = FormClick
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 758
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = PrintAction
    end
    object ToolButton3: TToolButton
      Left = 55
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton2: TToolButton
      Left = 110
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 118
      Top = 2
      Action = ExportAction
    end
    object ToolButton9: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 181
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton10: TToolButton
      Left = 236
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton7: TToolButton
      Left = 291
      Top = 2
      Action = RefreshAction
    end
    object ToolButton5: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 354
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 758
    Height = 381
    inherited PageControl: TPageControl
      Top = 357
      Width = 758
      Height = 24
      inherited TabSheet1: TTabSheet
        Caption = #26597#35810#20449#24687#32467#26524
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 758
      Height = 357
      FooterColor = clMoneyGreen
      FooterRowCount = 1
    end
    object Panel2: TPanel
      Left = 88
      Top = 64
      Width = 393
      Height = 41
      Caption = 'Panel2'
      Font.Charset = GB2312_CHARSET
      Font.Color = clRed
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
  object Timer: TTimer
    OnTimer = TimerTimer
    Left = 200
    Top = 112
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select c.name ['#23458#25143#21517#31216'], e.name ['#21830#21697#21517#31216'],  '#13#10'Quantity ['#25968#37327'],  Amount [' +
      #37329#39069'], a.QuantityPcs ['#27611#21033'],          '#13#10'd.name ['#19994#21153#32463#21150']'#13#10'from '#13#10'(selec' +
      't  b.Date,b.Code,b.ClientID,b.EmployeeID,'#13#10'b.BillMode,b.ModeDC,b' +
      '.ModeC,b.Brief,'#13#10'a.GoodsID,a.GoodsSpec, a.Quantity, a.QuantityPc' +
      's, a.PackUnitID,'#13#10'a.PriceBase,a.Amount,a.GoalUnitID,a.GoalQuanti' +
      'ty'#13#10'from SLSaleDetail  AS a  '#13#10'LEFT OUTER JOIN SLSalemaster as b' +
      '  on a.MasterID=b.id '#13#10'where 1=1)'#13#10'  AS a  '#13#10'LEFT OUTER JOIN DAC' +
      'lient     as c  on a.ClientID=c.id'#13#10'LEFT OUTER JOIN MSEmployee  ' +
      ' as d  on a.EmployeeID=d.id'#13#10'LEFT OUTER JOIN DAGoods      as e  ' +
      'on a.GoodsID=e.id'#13#10'LEFT OUTER JOIN DAGoodsClass as f  on e.Goods' +
      'ClassID=f.id'#13#10'LEFT OUTER JOIN DAarea       as g  on c.AreaID=g.i' +
      'd'
    Parameters = <>
    Left = 148
    Top = 220
  end
end
