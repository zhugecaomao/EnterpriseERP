inherited PCCheckReckoningReport: TPCCheckReckoningReport
  Functions.DATA = (
    '0'
    '0'
    #39#39
    ''
    '')
  Page.Values = (
    100
    2970
    100
    2100
    100
    100
    0)
  ReportTitle = #23458#25143#23545#24080#21333
  inherited PageHeaderBand: TQRBand
    Size.Values = (
      71.4375
      1899.70833333333)
    inherited CorporationNameExpr: TQRExpr
      Left = 291
      Size.Values = (
        44.9791666666667
        769.9375
        21.1666666666667
        359.833333333333)
      Alignment = taCenter
      FontSize = 12
    end
  end
  inherited TitleBand: TQRBand
    Height = 80
    Size.Values = (
      211.666666666667
      1899.70833333333)
    inherited TitleSysData: TQRSysData
      Size.Values = (
        52.9166666666667
        780.520833333333
        55.5625
        336.020833333333)
      FontSize = 12
    end
    object QRLabel1: TQRLabel
      Left = 8
      Top = 56
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        148.166666666667
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #21378#21830#21517#31216':'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrlCheckCourse: TQRLabel
      Left = 232
      Top = 56
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        613.833333333333
        148.166666666667
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #23545#36134#26399#38388':'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object qrdbtClientName: TQRDBText
      Left = 64
      Top = 56
      Width = 49
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        169.333333333333
        148.166666666667
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataField = #21378#21830#21517#31216
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  inherited ColumnHeaderBand: TQRBand
    Top = 145
    Size.Values = (
      63.5
      1899.70833333333)
  end
  inherited DetailBand: TQRBand
    Top = 169
    Size.Values = (
      63.5
      1899.70833333333)
  end
  inherited PageFooterBand: TQRBand
    Top = 355
    Size.Values = (
      84.6666666666667
      1899.70833333333)
    inherited qrsdPageNumber: TQRSysData
      Size.Values = (
        44.9791666666667
        1730.375
        15.875
        169.333333333333)
      FontSize = 9
    end
    inherited UserNameExpr: TQRExpr
      Size.Values = (
        44.9791666666667
        918.104166666667
        15.875
        351.895833333333)
      FontSize = 9
    end
    inherited PrintDateSysData: TQRSysData
      Size.Values = (
        44.9791666666667
        550.333333333333
        15.875
        251.354166666667)
      FontSize = 9
    end
    inherited ProductNameLable: TQRLabel
      Size.Values = (
        34.3958333333333
        13.2291666666667
        21.1666666666667
        351.895833333333)
      FontSize = 9
    end
  end
  inherited SummaryBand: TQRBand
    Top = 193
    Height = 24
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Size.Values = (
      63.5
      1899.70833333333)
    object QRLabel6: TQRLabel
      Left = 8
      Top = 8
      Width = 31
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        21.1666666666667
        82.0208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #21512#35745':'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
  object ChildBand1: TQRChildBand
    Left = 38
    Top = 217
    Width = 718
    Height = 138
    Frame.Color = clBlack
    Frame.DrawTop = False
    Frame.DrawBottom = False
    Frame.DrawLeft = False
    Frame.DrawRight = False
    AlignToBottom = False
    Color = clWhite
    ForceNewColumn = False
    ForceNewPage = False
    Size.Values = (
      365.125
      1899.70833333333)
    ParentBand = SummaryBand
    object QRLabel2: TQRLabel
      Left = 8
      Top = 8
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        21.1666666666667
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #23545#36134#32467#26524':'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel3: TQRLabel
      Left = 8
      Top = 40
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        105.833333333333
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #23458#25143#31614#21517':'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel4: TQRLabel
      Left = 16
      Top = 56
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        42.3333333333333
        148.166666666667
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '('#30422#31456')'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel5: TQRLabel
      Left = 336
      Top = 40
      Width = 55
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        889
        105.833333333333
        145.520833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #31614#21517#26085#26399':'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel7: TQRLabel
      Left = 8
      Top = 94
      Width = 361
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        21.1666666666667
        248.708333333333
        955.145833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #27880#65306#26412#23545#24080#21333#19968#24335#20004#20221#65292#21378#21830#26680#23545#31614#35748#30422#31456#21518#65292#35831#20132#22238#26412#20844#21496#19968#20221#12290
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
  end
end
