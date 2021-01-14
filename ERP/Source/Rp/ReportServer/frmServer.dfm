object ServerForm: TServerForm
  Left = 252
  Top = 71
  Width = 327
  Height = 222
  Caption = 'SQL Server Report Server via ADO'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 235
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Power'
    TabOrder = 0
    OnClick = Button1Click
  end
  object rsServer1: TrsServer
    LogSettings.Format = 'XMLFile'
    LogSettings.Location = '($Application)\LogFiles'
    Port = 1333
    TimeOut = 120
    ThreadCacheSize = 20
    Left = 8
    Top = 16
  end
end
