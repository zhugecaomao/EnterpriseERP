object CReportDemoForm: TCReportDemoForm
  Left = 262
  Top = 197
  BorderStyle = bsDialog
  Caption = 'creport '#31034#20363' ( '#26446#27901#20262'  lzl-self@sohu.com)'
  ClientHeight = 414
  ClientWidth = 662
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object SpeedButton1: TSpeedButton
    Left = 296
    Top = 216
    Width = 89
    Height = 24
    Caption = #25171#21360'DbGrid1'
    OnClick = SpeedButton1Click
  end
  object SpeedButton3: TSpeedButton
    Left = 416
    Top = 216
    Width = 105
    Height = 24
    Caption = #21160#24577#25253#34920#31034#20363
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    OnClick = SpeedButton3Click
  end
  object DBGrid1: TDBGrid
    Left = 40
    Top = 56
    Width = 513
    Height = 153
    Color = clWhite
    DataSource = Dataform.DataSource1
    ImeName = #20116#31508#30011
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'No'
        Title.Caption = #24207#21495
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cassname'
        Title.Caption = #21697#21517
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Lb'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bz'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Hh'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Sx'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Bm'
        Title.Caption = #22270#29255
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 662
    Height = 56
    Align = alTop
    BevelOuter = bvNone
    Caption = 'CReport '#31034#20363
    Font.Charset = GB2312_CHARSET
    Font.Color = clRed
    Font.Height = -29
    Font.Name = #21326#25991#34892#26999
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    object CheckBox1: TCheckBox
      Left = 44
      Top = 38
      Width = 138
      Height = 17
      Caption = #26410#28385#39029#31354#34920#26684#40784
      Checked = True
      Font.Charset = GB2312_CHARSET
      Font.Color = clBlue
      Font.Height = -14
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentFont = False
      State = cbChecked
      TabOrder = 0
      OnClick = CheckBox1Click
    end
    object ReportControl1: TReportControl
      Left = 488
      Top = 8
      Width = 25
      Height = 33
      Visible = False
      CreportEdit = True
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 56
    Width = 33
    Height = 328
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 2
  end
  object Panel4: TPanel
    Left = 560
    Top = 56
    Width = 102
    Height = 328
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 3
    object Button3: TButton
      Left = 10
      Top = 45
      Width = 83
      Height = 32
      Hint = 
        'E:\lzl_delphi\vcl\CReport\CReport_D5_D7\demo_d6_7\CReport_demo.e' +
        'pt'
      Caption = #25171#21360
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 10
      Top = 138
      Width = 83
      Height = 32
      Caption = #20851#38381
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 11
      Top = 3
      Width = 82
      Height = 32
      Hint = 
        'E:\lzl_delphi\vcl\CReport\CReport_D5_D7\demo_d6_7\CReport_demo.e' +
        'pt'
      Caption = #39044#35272
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 1
      Top = 96
      Width = 91
      Height = 30
      Hint = #23558'Table1'#23384#20026'EXcl'#25991#20214
      Caption = #23384#20026'Excl'#25991#20214
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = Button6Click
    end
  end
  object Panel5: TPanel
    Left = 0
    Top = 384
    Width = 662
    Height = 30
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 4
    object SpeedButton2: TSpeedButton
      Left = 288
      Top = 0
      Width = 89
      Height = 22
      Caption = #25171#21360'DbGrid2'
      OnClick = SpeedButton2Click
    end
    object Button2: TButton
      Left = 42
      Top = 0
      Width = 231
      Height = 25
      Caption = #22635'('#20462#25913')'#24403#21069#35760#24405#22270#29255'(table2'#34920')'
      Font.Charset = GB2312_CHARSET
      Font.Color = clWindowText
      Font.Height = -14
      Font.Name = #26999#20307'_GB2312'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
  end
  object DBGrid2: TDBGrid
    Left = 40
    Top = 248
    Width = 513
    Height = 129
    DataSource = Dataform.DataSource2
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Nn'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Loel'
        Title.Caption = #22270#29255
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 50
    Top = 216
    Width = 223
    Height = 25
    Caption = #22635'('#20462#25913')'#24403#21069#35760#24405#22270#29255'(table1'#34920')'
    Font.Charset = GB2312_CHARSET
    Font.Color = clWindowText
    Font.Height = -14
    Font.Name = #26999#20307'_GB2312'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object ReportRunTime1: TReportRunTime
    EnableEdit = True
    EditEpt = True
    SetData.Strings = (
      'SetDataSet(t1,dataform.table1);'
      'SetDataSet(t2,dataform.table2);')
    AddSpace = True
    Left = 519
    Top = 8
  end
  object opbm1: TOpenPictureDialog
    Filter = 
      'All (*.jpg;*.jpeg;*.bmp;*.ico)|*.jpg;*.jpeg;*.bmp;*.ico|JPEG Ima' +
      'ge File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg|Bitmaps (*' +
      '.bmp)|*.bmp|Icons (*.ico)|*.ico'
    Left = 448
    Top = 8
  end
  object DatasetToExcel1: TDatasetToExcel
    Dataset = Dataform.Table1
    Left = 552
    Top = 8
  end
end
