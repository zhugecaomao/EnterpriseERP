object previewdbgridform: Tpreviewdbgridform
  Left = 202
  Top = 111
  BorderStyle = bsDialog
  Caption = #25171#21360'DbGrid'
  ClientHeight = 218
  ClientWidth = 479
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object edit1: TLabel
    Left = 195
    Top = 5
    Width = 58
    Height = 21
    Caption = #23383#20307'1'
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -21
    Font.Name = #26999#20307'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object edit2: TLabel
    Left = 272
    Top = 8
    Width = 38
    Height = 14
    Caption = #23383#20307'2'
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = #20223#23435'_GB2312'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object edit3: TLabel
    Left = 328
    Top = 8
    Width = 35
    Height = 14
    Caption = #23383#20307'3'
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlack
    Font.Height = -14
    Font.Name = #20223#23435'_GB2312'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object GroupBox1: TGroupBox
    Left = 32
    Top = 24
    Width = 336
    Height = 98
    Caption = #26631#39064':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      336
      98)
    object FN1: TSpeedButton
      Left = 279
      Top = 29
      Width = 35
      Height = 24
      Caption = #23383#20307
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentFont = False
      OnClick = FN1Click
    end
    object Label1: TLabel
      Left = 156
      Top = 67
      Width = 77
      Height = 14
      Caption = #23383#27573#21517#39640#24230':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentFont = False
    end
    object SpeedButton2: TSpeedButton
      Left = 280
      Top = 62
      Width = 35
      Height = 22
      Caption = #23383#20307
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object Label2: TLabel
      Left = 30
      Top = 67
      Width = 63
      Height = 14
      Caption = #26631#39064#39640#24230':'
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentFont = False
    end
    object bt: TEdit
      Left = 28
      Top = 29
      Width = 251
      Height = 24
      Anchors = [akLeft, akTop, akRight, akBottom]
      AutoSize = False
      BevelInner = bvLowered
      BevelOuter = bvSpace
      BiDiMode = bdRightToLeftReadingOnly
      CharCase = ecLowerCase
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      TabOrder = 0
    end
    object H1: TSpinEdit
      Left = 86
      Top = 63
      Width = 50
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      MaxValue = 100
      MinValue = 50
      ParentFont = False
      TabOrder = 1
      Value = 50
    end
    object H2: TSpinEdit
      Left = 229
      Top = 62
      Width = 51
      Height = 22
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'MS Serif'
      Font.Style = []
      MaxValue = 100
      MinValue = 35
      ParentFont = False
      TabOrder = 2
      Value = 35
    end
  end
  object ReportControl2: TReportControl
    Left = -208
    Top = -456
    Width = 11
    Height = 11
    CreportEdit = False
  end
  object ReportControl1: TReportControl
    Left = 8
    Top = 0
    Width = 17
    Height = 25
    Visible = False
    CreportEdit = False
  end
  object CheckBox1: TCheckBox
    Left = 31
    Top = 193
    Width = 138
    Height = 17
    Caption = #26410#28385#39029#31354#34920#26684#34917#40784
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -14
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object CheckBox2: TCheckBox
    Left = 167
    Top = 193
    Width = 129
    Height = 17
    Caption = #20351#29992#24050#23384#22312#30340#27169#26495
    Checked = True
    Font.Charset = GB2312_CHARSET
    Font.Color = clNavy
    Font.Height = -14
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    State = cbChecked
    TabOrder = 4
    OnClick = CheckBox2Click
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 128
    Width = 337
    Height = 58
    Caption = #34920#26684':'
    Font.Charset = GB2312_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    object SpeedButton4: TSpeedButton
      Left = 195
      Top = 19
      Width = 58
      Height = 28
      Caption = #23383#20307
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlack
      Font.Height = -14
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object SpeedButton1: TSpeedButton
      Left = 88
      Top = 18
      Width = 81
      Height = 28
      Caption = #32440#24352
      Flat = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888800000000000088880FFFFFFFFFF088880F00F00000F088880FFFFFFFFFF0
        88880F00F00000F088880FFFFFFFFFF088880FFFFFFF0FF088880F00FFF080F0
        88880F080F08080008440FF08080808880440000080808888844888880808888
        8844888888088888804488888880000008448888888888888888}
      ParentFont = False
      OnClick = SpeedButton1Click
    end
  end
  object BitBtn1: TBitBtn
    Left = 384
    Top = 32
    Width = 75
    Height = 25
    Caption = #39044#35272
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 385
    Top = 72
    Width = 75
    Height = 25
    Caption = #25171#21360
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = BitBtn2Click
  end
  object BitBtn3: TBitBtn
    Left = 385
    Top = 112
    Width = 75
    Height = 25
    Caption = #21462#38144
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = BitBtn3Click
    Kind = bkClose
  end
  object FontDialog1: TFontDialog
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = #23435#20307
    Font.Style = []
    MinFontSize = 0
    MaxFontSize = 0
    Options = [fdTrueTypeOnly, fdEffects]
    Left = 75
  end
  object PrinterSetupDialog1: TPrinterSetupDialog
    Left = 112
  end
end
