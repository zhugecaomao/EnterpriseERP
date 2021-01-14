inherited WSChartForm: TWSChartForm
  Caption = #22270#34920
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 12
  object DBChart: TDBChart
    Left = 0
    Top = 41
    Width = 688
    Height = 412
    Title.Text.Strings = (
      'TDBChart')
    Align = alClient
    TabOrder = 0
    object Series: TBarSeries
      Marks.ArrowLength = 20
      Marks.Callout.Brush.Color = clBlack
      Marks.Callout.Length = 20
      Marks.Visible = True
      SeriesColor = clRed
      Gradient.Direction = gdTopBottom
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
    end
  end
  object Panel: TPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 41
    Align = alTop
    Caption = 'Panel'
    TabOrder = 1
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 12
      Height = 12
      Caption = 'X:'
    end
    object Label2: TLabel
      Left = 216
      Top = 8
      Width = 12
      Height = 12
      Caption = 'Y:'
    end
    object cbXValue: TComboBox
      Left = 40
      Top = 8
      Width = 145
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 0
      OnChange = cbXValueChange
    end
    object cbYValue: TComboBox
      Left = 240
      Top = 8
      Width = 145
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 1
      OnChange = cbXValueChange
    end
  end
end
