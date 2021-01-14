inherited SLSaleVoucherReport: TSLSaleVoucherReport
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
  inherited PageHeaderBand: TQRBand
    Size.Values = (
      71.4375
      1899.70833333333)
    inherited CorporationNameExpr: TQRExpr
      Left = 291
      Top = 4
      Width = 136
      Size.Values = (
        44.9791666666667
        769.9375
        10.5833333333333
        359.833333333333)
      Alignment = taCenter
      Font.Height = -16
      FontSize = 12
    end
  end
  inherited TitleBand: TQRBand
    Height = 45
    Size.Values = (
      119.0625
      1899.70833333333)
    inherited TitleSysData: TQRSysData
      Left = 295
      Top = 3
      Width = 127
      Size.Values = (
        52.9166666666667
        780.520833333333
        7.9375
        336.020833333333)
      Font.Height = -16
      FontSize = 12
    end
    inherited QRLabel19: TQRLabel
      Left = 560
      Top = 11
      Width = 74
      Size.Values = (
        42.3333333333333
        1481.66666666667
        29.1041666666667
        195.791666666667)
      Caption = #38144#21806#21333#21495':'
      FontSize = 11
    end
    inherited VouchNoDBText: TQRDBText
      Left = 640
      Top = 8
      Size.Values = (
        44.9791666666667
        1693.33333333333
        21.1666666666667
        97.8958333333333)
      FontSize = 11
    end
    inherited QRLabel2: TQRLabel
      Left = 560
      Top = 27
      Width = 85
      Size.Values = (
        44.9791666666667
        1481.66666666667
        71.4375
        224.895833333333)
      Caption = #26085'    '#26399#65306
      FontSize = 11
    end
    inherited VoucherDateDBText: TQRDBText
      Left = 640
      Top = 24
      Size.Values = (
        44.9791666666667
        1693.33333333333
        63.5
        97.8958333333333)
      FontSize = 11
    end
    inherited QRLabel3: TQRLabel
      Top = 27
      Size.Values = (
        34.3958333333333
        21.1666666666667
        71.4375
        145.520833333333)
      FontSize = 9
    end
    inherited ClientNameDBText: TQRDBText
      Top = 27
      Size.Values = (
        34.3958333333333
        177.270833333333
        71.4375
        161.395833333333)
      FontSize = 9
    end
  end
  inherited ColumnHeaderBand: TQRBand
    Top = 110
    Size.Values = (
      63.5
      1899.70833333333)
  end
  inherited DetailBand: TQRBand
    Top = 134
    Size.Values = (
      63.5
      1899.70833333333)
  end
  inherited PageFooterBand: TQRBand
    Top = 246
    Size.Values = (
      84.6666666666667
      1899.70833333333)
    inherited qrsdPageNumber: TQRSysData
      Size.Values = (
        44.9791666666667
        1730.375
        21.1666666666667
        169.333333333333)
      FontSize = 9
    end
    inherited UserNameExpr: TQRExpr
      Left = 192
      Size.Values = (
        44.9791666666667
        508
        21.1666666666667
        336.020833333333)
      FontSize = 9
    end
    inherited PrintDateSysData: TQRSysData
      Left = 336
      Size.Values = (
        44.9791666666667
        889
        21.1666666666667
        256.645833333333)
      FontSize = 9
    end
    inherited ProductNameLable: TQRLabel
      Left = 5
      Width = 103
      Size.Values = (
        34.3958333333333
        13.2291666666667
        21.1666666666667
        272.520833333333)
      Caption = #20225#19994#31649#29702#31995#32479'(ERP)'
      FontSize = 9
    end
  end
  inherited SummaryBand: TQRBand
    Top = 158
    Height = 24
    Frame.DrawBottom = True
    Frame.DrawLeft = True
    Frame.DrawRight = True
    Size.Values = (
      63.5
      1899.70833333333)
    inherited QRLabel1: TQRLabel
      Size.Values = (
        44.9791666666667
        21.1666666666667
        15.875
        82.0208333333333)
      FontSize = 9
    end
  end
  inherited ChildBand1: TQRChildBand
    Top = 182
    Height = 64
    Size.Values = (
      169.333333333333
      1899.70833333333)
    inherited QRLabel16: TQRLabel
      Top = 48
      Size.Values = (
        44.9791666666667
        21.1666666666667
        127
        97.8958333333333)
      FontSize = 9
    end
    inherited QRDBText1: TQRDBText
      Top = 48
      Size.Values = (
        44.9791666666667
        127
        127
        76.7291666666667)
      FontSize = 10
    end
    object QRLabel15: TQRLabel
      Left = 392
      Top = 48
      Width = 283
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1037.16666666667
        127
        748.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #33829#38144#21592#65306'             '#21457#36135#20154#65306'          '#25910#36135#20154#65306
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel4: TQRLabel
      Left = 8
      Top = 8
      Width = 127
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
        336.020833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #36816#36755#26041#24335':('#33829#38144#21592#22635#20889')'
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel5: TQRLabel
      Left = 160
      Top = 8
      Width = 61
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        423.333333333333
        21.1666666666667
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #9633#38081#36335#38646#20294
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel6: TQRLabel
      Left = 256
      Top = 8
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        677.333333333333
        21.1666666666667
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #9633#36865#36135
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel7: TQRLabel
      Left = 336
      Top = 8
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        889
        21.1666666666667
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #9633#33258#25552
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel8: TQRLabel
      Left = 400
      Top = 8
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1058.33333333333
        21.1666666666667
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #9633#27773#36816
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel9: TQRLabel
      Left = 48
      Top = 24
      Width = 109
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        127
        63.5
        288.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = '('#22914#27773#36816#23458#25143#35831#22635#20889':'
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel10: TQRLabel
      Left = 168
      Top = 24
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        444.5
        63.5
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #9633#20002#22833
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel11: TQRLabel
      Left = 224
      Top = 24
      Width = 37
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        592.666666666667
        63.5
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #9633#38632#28107
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel12: TQRLabel
      Left = 296
      Top = 24
      Width = 91
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        783.166666666667
        63.5
        240.770833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #9633#33853#22320#36135'_______'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel13: TQRLabel
      Left = 400
      Top = 24
      Width = 61
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1058.33333333333
        63.5
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #9633#36865#36135#19978#38376
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRLabel14: TQRLabel
      Left = 464
      Top = 24
      Width = 7
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        1227.66666666667
        63.5
        18.5208333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = ')'
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRShape1: TQRShape
      Left = 0
      Top = 40
      Width = 713
      Height = 9
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        23.8125
        0
        105.833333333333
        1886.47916666667)
      Shape = qrsHorLine
      VertAdjust = 0
    end
  end
end
