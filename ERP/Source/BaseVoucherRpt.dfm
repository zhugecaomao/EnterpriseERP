inherited BaseVoucherReport: TBaseVoucherReport
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
      Width = 121
      Size.Values = (
        44.9791666666667
        0
        21.1666666666667
        320.145833333333)
      Font.Height = -13
      FontSize = 10
    end
  end
  inherited TitleBand: TQRBand
    Height = 80
    Size.Values = (
      211.666666666667
      1899.70833333333)
    inherited TitleSysData: TQRSysData
      Left = 281
      Top = 8
      Width = 155
      Size.Values = (
        52.9166666666667
        743.479166666667
        21.1666666666667
        410.104166666667)
      Font.Height = -19
      FontSize = 14
    end
    inherited QRLabel19: TQRLabel
      Left = 272
      Size.Values = (
        42.3333333333333
        719.666666666667
        127
        129.645833333333)
      FontSize = 11
    end
    inherited VouchNoDBText: TQRDBText
      Left = 304
      Size.Values = (
        44.9791666666667
        804.333333333333
        127
        97.8958333333333)
      FontSize = 11
    end
    inherited QRLabel2: TQRLabel
      Left = 400
      Size.Values = (
        44.9791666666667
        1058.33333333333
        127
        129.645833333333)
      FontSize = 11
    end
    inherited VoucherDateDBText: TQRDBText
      Left = 440
      Size.Values = (
        44.9791666666667
        1164.16666666667
        127
        97.8958333333333)
      FontSize = 11
    end
    object QRLabel3: TQRLabel
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
      Caption = #21333#20301#21517#31216':'
      Color = clWhite
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object ClientNameDBText: TQRDBText
      Left = 67
      Top = 56
      Width = 61
      Height = 13
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        34.3958333333333
        177.270833333333
        148.166666666667
        161.395833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataField = 'ClientName'
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
    Top = 257
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
      Size.Values = (
        44.9791666666667
        444.5
        21.1666666666667
        336.020833333333)
      FontSize = 9
    end
    inherited PrintDateSysData: TQRSysData
      Size.Values = (
        44.9791666666667
        21.1666666666667
        21.1666666666667
        256.645833333333)
      FontSize = 9
    end
    inherited ProductNameLable: TQRLabel
      Size.Values = (
        34.3958333333333
        1452.5625
        21.1666666666667
        431.270833333333)
      FontSize = 9
    end
  end
  inherited SummaryBand: TQRBand
    Top = 193
    Size.Values = (
      84.6666666666667
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
    Top = 225
    Size.Values = (
      84.6666666666667
      1899.70833333333)
    inherited QRLabel16: TQRLabel
      Size.Values = (
        44.9791666666667
        21.1666666666667
        21.1666666666667
        97.8958333333333)
      FontSize = 9
    end
    inherited QRDBText1: TQRDBText
      Size.Values = (
        44.9791666666667
        127
        21.1666666666667
        76.7291666666667)
      FontSize = 10
    end
  end
end
