object AboutForm: TAboutForm
  Left = 373
  Top = 317
  BorderStyle = bsDialog
  Caption = #20851#20110
  ClientHeight = 120
  ClientWidth = 273
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 114
    Height = 12
    Caption = 'QL Library 1.2 '#28436#31034
  end
  object Label2: TLabel
    Left = 16
    Top = 40
    Width = 113
    Height = 13
    Cursor = crHandPoint
    Caption = 'http://www.nicesoft.net'
    Color = clBtnFace
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    OnClick = Label2Click
  end
  object Label3: TLabel
    Left = 16
    Top = 64
    Width = 126
    Height = 13
    Cursor = crHandPoint
    Caption = 'mailto:qiuliang@china.com'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label2Click
  end
  object OKButton: TButton
    Left = 192
    Top = 88
    Width = 75
    Height = 25
    Cancel = True
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
end
