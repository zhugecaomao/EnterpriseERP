inherited AboutForm: TAboutForm
  Left = 226
  Top = 173
  BorderStyle = bsDialog
  Caption = #20851#20110#20225#19994#26234#33021#31649#29702#31995#32479
  ClientHeight = 291
  ClientWidth = 438
  OldCreateOrder = True
  Position = poScreenCenter
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 12
  object Image: TImage
    Left = 8
    Top = 16
    Width = 430
    Height = 121
    OnClick = ImageClick
  end
  object CopyrightLbl: TLabel
    Left = 24
    Top = 152
    Width = 210
    Height = 12
    Caption = #29256#26435#25152#26377' (C) 2002-2003 Nicesoft.NET'
  end
  object WebLbl: TLabel
    Left = 24
    Top = 168
    Width = 138
    Height = 12
    Cursor = crHandPoint
    Caption = 'http://www.nicesoft.net'
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = WebLblClick
  end
  object EmailLbl: TLabel
    Left = 24
    Top = 184
    Width = 150
    Height = 12
    Cursor = crHandPoint
    Caption = 'mailto:qiuliang@china.com'
    Font.Charset = GB2312_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = #23435#20307
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = WebLblClick
  end
  object Button1: TButton
    Left = 352
    Top = 256
    Width = 75
    Height = 25
    Cancel = True
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
end
