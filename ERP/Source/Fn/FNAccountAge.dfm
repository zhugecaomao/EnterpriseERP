inherited FNAccountAgeForm: TFNAccountAgeForm
  Left = 34
  Top = 97
  Width = 725
  Height = 533
  Caption = #24212#25910#24080#27454#24080#40836#20998#26512
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 717
    ButtonWidth = 55
    object ToolButton4: TToolButton
      Left = 0
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton5: TToolButton
      Left = 55
      Top = 2
      Action = PrintAction
    end
    object ToolButton11: TToolButton
      Left = 110
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 118
      Top = 2
      Action = ExportAction
    end
    object ToolButton12: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 181
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton8: TToolButton
      Left = 236
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 291
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 299
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 717
    Height = 465
    inherited PageControl: TPageControl
      Top = 438
      Width = 717
      Height = 27
      inherited TabSheet1: TTabSheet
        Caption = #24212#25910#24080#27454#24080#40836#20998#26512#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Top = 60
      Width = 717
      Height = 378
      PopupMenu = PopupMenu1
      FooterRowCount = 1
      Columns = <
        item
          Expanded = False
          FieldName = 'Client'
          Title.Alignment = taCenter
          Title.Caption = #23458#25143#21517#31216
          Width = 169
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PeriodA'
          Title.Alignment = taCenter
          Title.Caption = #19968#20010#26376
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PeriodB'
          Title.Alignment = taCenter
          Title.Caption = #20108#20010#26376
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PeriodC'
          Title.Alignment = taCenter
          Title.Caption = #19977#20010#26376
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PeriodD'
          Title.Alignment = taCenter
          Title.Caption = #22235#20010#26376
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PeriodE'
          Title.Alignment = taCenter
          Title.Caption = #20116#20010#26376
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PeriodF'
          Title.Alignment = taCenter
          Title.Caption = #20845#20010#26376
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PeriodG'
          Title.Alignment = taCenter
          Title.Caption = #38271#20110#20845#26376
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PeriodTTL'
          Title.Alignment = taCenter
          Title.Caption = #21512#35745
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Employee'
          Title.Alignment = taCenter
          Title.Caption = #19994#21153#32463#21150
          Width = 60
          Visible = True
        end>
    end
    object Panel2: TPanel
      Left = 0
      Top = 0
      Width = 717
      Height = 60
      Align = alTop
      BevelInner = bvSpace
      BevelOuter = bvLowered
      TabOrder = 2
      object Label1: TLabel
        Left = 19
        Top = 25
        Width = 48
        Height = 12
        Caption = #24403#21069#26085#26399
      end
      object Label2: TLabel
        Left = 461
        Top = 25
        Width = 90
        Height = 12
        Caption = ' '#22825'('#35831#35774#32622#22825#25968')'
        OnClick = Label2Click
      end
      object DateTimePicker1: TDateTimePicker
        Left = 76
        Top = 21
        Width = 93
        Height = 20
        CalAlignment = dtaLeft
        Date = 37596.1952293866
        Time = 37596.1952293866
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkDate
        ParseInput = False
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 208
        Top = 21
        Width = 75
        Height = 20
        Caption = #25353#26376#20998#27573
        TabOrder = 1
        OnClick = BitBtn1Click
      end
      object BitBtn2: TBitBtn
        Left = 320
        Top = 21
        Width = 75
        Height = 20
        Caption = #25353#22825#20998#27573
        TabOrder = 2
        OnClick = BitBtn2Click
      end
      object ComboBox1: TComboBox
        Left = 408
        Top = 21
        Width = 49
        Height = 20
        ItemHeight = 12
        TabOrder = 3
        Text = '7'
        Items.Strings = (
          '7'
          '10'
          '15'
          '20'
          '25'
          '30'
          '35'
          '40'
          '45'
          '50'
          '55'
          '60')
      end
    end
  end
  inherited ActionList: TActionList
    Left = 83
    Top = 221
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
    Left = 46
    Top = 218
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'select  ClientID,c.name  ,b.name Client,c.name Employee,'#13#10'   Sun' +
      'dryFee PeriodA, SundryFee PeriodB, '#13#10'   SundryFee PeriodC,  Sund' +
      'ryFee PeriodD,   '#13#10'   SundryFee PeriodE,  SundryFee PeriodF,    ' +
      #13#10'   SundryFee PeriodG,  SundryFee  PeriodTTL '#13#10'from SLSalemaste' +
      'r  AS A  '#13#10'LEFT OUTER JOIN DAClient as b  on a.ClientID=b.id '#13#10'L' +
      'EFT OUTER JOIN MSEmployee as c  on a.EmployeeID=c.id'#13#10'where 1=3'#13 +
      #10
    Parameters = <>
    Left = 188
    Top = 228
    object adsMasterClient: TStringField
      FieldName = 'Client'
      Size = 50
    end
    object adsMasterEmployee: TStringField
      FieldName = 'Employee'
      Size = 30
    end
    object adsMasterPeriodA: TBCDField
      FieldName = 'PeriodA'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsMasterPeriodB: TBCDField
      FieldName = 'PeriodB'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsMasterPeriodC: TBCDField
      FieldName = 'PeriodC'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsMasterPeriodD: TBCDField
      FieldName = 'PeriodD'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsMasterPeriodE: TBCDField
      FieldName = 'PeriodE'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsMasterPeriodF: TBCDField
      FieldName = 'PeriodF'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsMasterPeriodG: TBCDField
      FieldName = 'PeriodG'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsMasterPeriodTTL: TBCDField
      FieldName = 'PeriodTTL'
      currency = True
      Precision = 19
      Size = 5
    end
    object adsMasterClientID: TIntegerField
      FieldName = 'ClientID'
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 288
    Top = 168
  end
  object ADOQuery2: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 296
    Top = 264
  end
  object PopupMenu1: TPopupMenu
    Left = 360
    Top = 176
    object N1: TMenuItem
      Caption = #26597#30475#26126#32454#24080
      OnClick = N1Click
    end
  end
end
