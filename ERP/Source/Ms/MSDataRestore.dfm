object MSDataRestoreForm: TMSDataRestoreForm
  Left = 400
  Top = 205
  BorderStyle = bsDialog
  Caption = #24674#22797#25968#25454
  ClientHeight = 343
  ClientWidth = 381
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Label3: TLabel
    Left = 16
    Top = 129
    Width = 120
    Height = 12
    Caption = #30446#26631#25968#25454#24211#23384#25918#20301#32622#65306
  end
  object Label4: TLabel
    Left = 16
    Top = 24
    Width = 96
    Height = 12
    Caption = #22791#20221#25968#25454#24211#20301#32622#65306
  end
  object Label1: TLabel
    Left = 16
    Top = 76
    Width = 96
    Height = 12
    Caption = #22791#20221#25968#25454#24211#25991#20214#65306
  end
  object Label2: TLabel
    Left = 16
    Top = 188
    Width = 96
    Height = 12
    Caption = #30446#26631#25968#25454#24211#25991#20214#65306
  end
  object Button1: TButton
    Left = 216
    Top = 262
    Width = 75
    Height = 25
    Caption = #24674#22797
    Default = True
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 296
    Top = 262
    Width = 75
    Height = 25
    Caption = #21462#28040
    TabOrder = 7
    OnClick = Button2Click
  end
  object edtDestDir: TEdit
    Left = 40
    Top = 150
    Width = 313
    Height = 20
    TabOrder = 3
    Text = 'D:\Data'
  end
  object Button3: TButton
    Left = 353
    Top = 150
    Width = 17
    Height = 21
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Button3Click
  end
  object edtRestoreDir: TEdit
    Left = 40
    Top = 46
    Width = 313
    Height = 20
    TabOrder = 0
    Text = 'D:\BackUp'
  end
  object Button4: TButton
    Left = 353
    Top = 46
    Width = 16
    Height = 21
    Caption = '...'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Microsoft Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnClick = Button4Click
  end
  object edtDBName: TEdit
    Left = 40
    Top = 97
    Width = 313
    Height = 20
    TabOrder = 2
    Text = 'edtDBName'
    OnExit = edtDBNameExit
  end
  object edtNewDBName: TEdit
    Left = 40
    Top = 209
    Width = 313
    Height = 20
    TabOrder = 5
    Text = #25968#25454#24211#21517
  end
  object Panel_ShowTopic: TPanel
    Left = 12
    Top = 86
    Width = 360
    Height = 121
    TabOrder = 8
    Visible = False
    OnClick = Panel_ShowTopicClick
    object Label5: TLabel
      Left = 28
      Top = 16
      Width = 192
      Height = 12
      Caption = #27491#22312#24674#22797#25968#25454','#35831#31561#20505'.............'
    end
    object Label6: TLabel
      Left = 28
      Top = 48
      Width = 258
      Height = 12
      Caption = #22914#26524#24674#22797#26102#38388#22826#38271','#35831#26816#26597#24403#21069#25968#25454#24211#26159#21542#34987#20854#23427
    end
    object Label7: TLabel
      Left = 28
      Top = 80
      Width = 288
      Height = 12
      Caption = #31995#32479#20351#29992','#20225#19994#31649#29702#22120#26159#21542#20851#38381','#26381#21153#22120#26159#21542#27491#24120'......'
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 264
    Top = 32
  end
  object ListLogcalOfData: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 192
    Top = 16
  end
end
