inherited VoucherReport: TVoucherReport
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
      Size.Values = (
        44.9791666666667
        0
        21.1666666666667
        359.833333333333)
      FontSize = 12
    end
  end
  inherited TitleBand: TQRBand
    Height = 72
    Size.Values = (
      190.5
      1899.70833333333)
    inherited TitleSysData: TQRSysData
      Top = 24
      Size.Values = (
        52.9166666666667
        780.520833333333
        63.5
        336.020833333333)
      FontSize = 12
    end
    object QRLabel19: TQRLabel
      Left = 8
      Top = 48
      Width = 49
      Height = 16
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        42.3333333333333
        21.1666666666667
        127
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Caption = #32534#21495#65306
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object VouchNoDBText: TQRDBText
      Left = 64
      Top = 48
      Width = 37
      Height = 17
      Cursor = crDrag
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        169.333333333333
        127
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataField = 'Code'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object QRLabel2: TQRLabel
      Left = 576
      Top = 48
      Width = 49
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1524
        127
        129.645833333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #26085#26399#65306
      Color = clWhite
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
    object VoucherDateDBText: TQRDBText
      Left = 632
      Top = 48
      Width = 37
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        1672.16666666667
        127
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Color = clWhite
      DataField = 'Date'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #23435#20307
      Font.Style = [fsBold]
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 11
    end
  end
  inherited ColumnHeaderBand: TQRBand
    Top = 137
    Size.Values = (
      63.5
      1899.70833333333)
  end
  inherited DetailBand: TQRBand
    Top = 161
    Size.Values = (
      63.5
      1899.70833333333)
  end
  inherited PageFooterBand: TQRBand
    Top = 249
    Size.Values = (
      84.6666666666667
      1899.70833333333)
    inherited qrsdPageNumber: TQRSysData
      Top = 8
      Size.Values = (
        44.9791666666667
        1730.375
        21.1666666666667
        169.333333333333)
      FontSize = 9
    end
    inherited UserNameExpr: TQRExpr
      Left = 168
      Top = 8
      Width = 127
      Size.Values = (
        44.9791666666667
        444.5
        21.1666666666667
        336.020833333333)
      ParentFont = True
      FontSize = 9
    end
    inherited PrintDateSysData: TQRSysData
      Left = 8
      Top = 8
      Width = 97
      Size.Values = (
        44.9791666666667
        21.1666666666667
        21.1666666666667
        256.645833333333)
      ParentFont = True
      FontSize = 9
    end
    inherited ProductNameLable: TQRLabel
      Left = 549
      Width = 163
      Size.Values = (
        34.3958333333333
        1452.5625
        21.1666666666667
        431.270833333333)
      FontSize = 9
    end
  end
  inherited SummaryBand: TQRBand
    Top = 185
    Height = 32
    Size.Values = (
      84.6666666666667
      1899.70833333333)
    object QRLabel1: TQRLabel
      Left = 8
      Top = 6
      Width = 31
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        15.875
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
  object ChildBand1: TQRChildBand [6]
    Left = 38
    Top = 217
    Width = 718
    Height = 32
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
      84.6666666666667
      1899.70833333333)
    ParentBand = SummaryBand
    object QRLabel16: TQRLabel
      Left = 8
      Top = 8
      Width = 37
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        21.1666666666667
        21.1666666666667
        97.8958333333333)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = False
      Caption = #22791#27880#65306
      Color = clWhite
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 9
    end
    object QRDBText1: TQRDBText
      Left = 48
      Top = 8
      Width = 29
      Height = 17
      Frame.Color = clBlack
      Frame.DrawTop = False
      Frame.DrawBottom = False
      Frame.DrawLeft = False
      Frame.DrawRight = False
      Size.Values = (
        44.9791666666667
        127
        21.1666666666667
        76.7291666666667)
      Alignment = taLeftJustify
      AlignToBand = False
      AutoSize = True
      AutoStretch = True
      Color = clWhite
      DataField = 'Memo'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
      Transparent = False
      WordWrap = True
      FontSize = 10
    end
  end
end
