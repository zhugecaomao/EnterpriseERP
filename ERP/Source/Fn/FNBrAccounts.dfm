inherited FNBrAccountsForm: TFNBrAccountsForm
  Left = 96
  Top = 143
  Width = 663
  Height = 442
  Caption = #36164#37329#24080#25143#36164#26009
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 655
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = EditAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = DeleteAction
    end
    object ToolButton9: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = PrintAction
    end
    object ToolButton5: TToolButton
      Left = 228
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton10: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton11: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton14: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton8: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton13: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton13'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 655
    Height = 374
    inherited PageControl: TPageControl
      Top = 347
      Width = 655
      inherited TabSheet1: TTabSheet
        Caption = #36164#37329#24080#25143#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 655
      Height = 347
      Columns = <
        item
          Expanded = False
          FieldName = #24080#25143#21517#31216
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24080#25143#31867#22411
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23545#24212#31185#30446
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #23545#24212#20195#30721
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24065#31181#21517#31216
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24080#25143#31649#29702
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24320#25143#26085#26399
          Title.Alignment = taCenter
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = #24320#25143#38134#34892
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #38134#34892#22320#22336
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #38134#34892#30005#35805
          Title.Alignment = taCenter
          Width = 160
          Visible = True
        end
        item
          Expanded = False
          FieldName = #38134#34892#24080#25143
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #25903#31080#21360#31456
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #38134#34892#21360#37492
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = #38134#34892#25351#32441
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end>
    end
  end
  inherited ActionList: TActionList
    Left = 541
    Top = 17
  end
  inherited DataSource: TDataSource
    DataSet = tblFNAccountsBr
    Left = 553
    Top = 67
  end
  object tblFNAccountsBr: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'select a.ID, a.CreateDate, a.CreateUserID, '#13#10'a.RecordState, a.Cu' +
      'rrencyID,'#13#10'a.Name ['#24080#25143#21517#31216'], '#13#10'a.AccountType ['#24080#25143#31867#22411'], '#13#10'a.BankPhone ' +
      '['#38134#34892#30005#35805'],'#13#10'b.name ['#24065#31181#21517#31216'],'#13#10'c.name ['#23545#24212#31185#30446'],'#13#10'c.SubCode ['#23545#24212#20195#30721'],'#13#10'a.Ac' +
      'countManger ['#24080#25143#31649#29702'],'#13#10'a.BankOpenDate ['#24320#25143#26085#26399'], '#13#10'a.BankOpened ['#24320#25143#38134#34892 +
      '], '#13#10'a.BankAddress ['#38134#34892#22320#22336'], '#13#10'a.BankAccount ['#38134#34892#24080#25143'], '#13#10'a.CheckStam' +
      'p ['#25903#31080#21360#31456'], '#13#10'a.BankStamp ['#38134#34892#21360#37492'], '#13#10'a.FingerMark ['#38134#34892#25351#32441']'#13#10'from FNAc' +
      'counts a '#13#10'Left outer join MSCurrency b on b.id=a.CurrencyID'#13#10'Le' +
      'ft outer join DASubject c on c.id=a.GeneralACID'#13#10#13#10'where a.Recor' +
      'dState<>'#39#21024#38500#39
    Parameters = <>
    Left = 240
    Top = 152
    object tblFNAccountsBrID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblFNAccountsBrCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object tblFNAccountsBrCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object tblFNAccountsBrRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object tblFNAccountsBrCurrencyID: TIntegerField
      FieldName = 'CurrencyID'
      Visible = False
    end
    object tblFNAccountsBrDSDesigner: TStringField
      FieldName = #24080#25143#21517#31216
      Size = 40
    end
    object tblFNAccountsBrDSDesigner2: TStringField
      FieldName = #24080#25143#31867#22411
      Size = 12
    end
    object tblFNAccountsBrDSDesigner12: TStringField
      FieldName = #23545#24212#31185#30446
      Size = 50
    end
    object tblFNAccountsBrDSDesigner13: TStringField
      FieldName = #23545#24212#20195#30721
      Size = 50
    end
    object tblFNAccountsBrDSDesigner3: TStringField
      FieldName = #24065#31181#21517#31216
    end
    object tblFNAccountsBrDSDesigner4: TStringField
      FieldName = #24080#25143#31649#29702
    end
    object tblFNAccountsBrDSDesigner5: TDateTimeField
      FieldName = #24320#25143#26085#26399
    end
    object tblFNAccountsBrDSDesigner6: TStringField
      FieldName = #24320#25143#38134#34892
      Size = 60
    end
    object tblFNAccountsBrDSDesigner7: TStringField
      FieldName = #38134#34892#22320#22336
      Size = 60
    end
    object tblFNAccountsBrDSDesigner14: TStringField
      FieldName = #38134#34892#30005#35805
      Size = 60
    end
    object tblFNAccountsBrDSDesigner8: TStringField
      FieldName = #38134#34892#24080#25143
    end
    object tblFNAccountsBrDSDesigner9: TStringField
      FieldName = #25903#31080#21360#31456
      Size = 60
    end
    object tblFNAccountsBrDSDesigner10: TStringField
      FieldName = #38134#34892#21360#37492
      Size = 60
    end
    object tblFNAccountsBrDSDesigner11: TBlobField
      FieldName = #38134#34892#25351#32441
      Visible = False
    end
  end
end
