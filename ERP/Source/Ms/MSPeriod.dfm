inherited MSPeriodForm: TMSPeriodForm
  Left = 256
  Top = 65
  VertScrollBar.Range = 0
  BorderStyle = bsDialog
  Caption = #31649#29702#26399#38388
  ClientHeight = 248
  ClientWidth = 423
  Position = poMainFormCenter
  Visible = False
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 423
    Height = 0
  end
  inherited Panel1: TPanel
    Top = 0
    Width = 423
    Height = 248
    object Label1: TLabel [0]
      Left = 8
      Top = 216
      Width = 36
      Height = 12
      Caption = 'Label1'
      Font.Charset = GB2312_CHARSET
      Font.Color = 213
      Font.Height = -12
      Font.Name = #23435#20307
      Font.Style = []
      ParentFont = False
    end
    inherited PageControl: TPageControl
      Top = 248
      Width = 423
      Height = 0
    end
    inherited DBGrid: TQLDBGrid
      Left = 8
      Top = 8
      Width = 409
      Height = 200
      Align = alNone
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = False
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'StartDate'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CloseDate'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LastCloseDate'
          ReadOnly = True
          Width = 85
          Visible = True
        end>
    end
    object OkButton: TButton
      Left = 261
      Top = 216
      Width = 75
      Height = 25
      Caption = #30830#23450
      TabOrder = 2
      OnClick = OkButtonClick
    end
    object CancelButton: TButton
      Left = 341
      Top = 216
      Width = 75
      Height = 25
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = #21462#28040
      ModalResult = 2
      TabOrder = 3
    end
    object btnMonth: TButton
      Left = 181
      Top = 216
      Width = 75
      Height = 25
      Caption = #25353#26376#29983#25104
      TabOrder = 4
      OnClick = btnMonthClick
    end
  end
  inherited DataSource: TDataSource
    DataSet = adsPeriod
  end
  inherited WsBrowsePop: TPopupMenu
    Left = 176
  end
  object adsPeriod: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    CommandText = 
      'select ID, CreateDate, CreateUserID, RecordState, Name, StartDat' +
      'e, CloseDate, IsClosed, LastCloseDate, CheckFlag, EmployeID, Use' +
      'Test '#13#10'from MSPeriod'#13#10'where RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 80
    Top = 112
    object adsPeriodID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsPeriodCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsPeriodCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsPeriodRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsPeriodName: TStringField
      DisplayLabel = #21517#31216
      DisplayWidth = 9
      FieldName = 'Name'
      OnValidate = adsPeriodNameValidate
      EditMask = '0000-00;1;_'
      FixedChar = True
      Size = 7
    end
    object adsPeriodStartDate: TDateTimeField
      DisplayLabel = #36215#22987#26085#26399
      DisplayWidth = 10
      FieldName = 'StartDate'
    end
    object adsPeriodCloseDate: TDateTimeField
      DisplayLabel = #32467#36134#26085#26399
      DisplayWidth = 18
      FieldName = 'CloseDate'
    end
    object adsPeriodIsClosed: TStringField
      FieldName = 'IsClosed'
      Visible = False
      Size = 12
    end
    object adsPeriodLastCloseDate: TDateTimeField
      DisplayLabel = #26368#21518#32467#36134#26085#26399
      DisplayWidth = 18
      FieldName = 'LastCloseDate'
    end
    object adsPeriodCheckFlag: TIntegerField
      FieldName = 'CheckFlag'
      Visible = False
    end
    object adsPeriodEmployeID: TIntegerField
      FieldName = 'EmployeID'
      Visible = False
    end
  end
  object adrPeriod: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 80
    Top = 152
  end
end
