inherited MSBrLoginForm: TMSBrLoginForm
  Left = 24
  Width = 720
  Caption = #29992#25143#30331#38470#31649#29702
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 712
    ButtonWidth = 55
    object ToolButton2: TToolButton
      Left = 0
      Top = 2
      Action = DeleteAction
    end
    object ToolButton11: TToolButton
      Left = 55
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 12
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 63
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton5: TToolButton
      Left = 118
      Top = 2
      Action = PrintAction
    end
    object ToolButton10: TToolButton
      Left = 173
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 11
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 181
      Top = 2
      Action = ExportAction
    end
    object ToolButton3: TToolButton
      Left = 236
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton7: TToolButton
      Left = 244
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton12: TToolButton
      Left = 299
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton8: TToolButton
      Left = 354
      Top = 2
      Action = RefreshAction
    end
    object ToolButton1: TToolButton
      Left = 409
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 417
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 712
    inherited PageControl: TPageControl
      Width = 712
      inherited TabSheet1: TTabSheet
        Caption = #29992#25143#30331#38470#31649#29702
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 712
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LoginTime'
          Title.Alignment = taCenter
          Width = 159
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LogoutTime'
          Title.Alignment = taCenter
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ComputerName'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LoginIP'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end>
    end
  end
  inherited DataSource: TDataSource
    DataSet = adsMaster
  end
  object adsMaster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    CommandText = 
      'Select a.ID,a.CreateDate,a.CreateUserID,a.RecordState,a.UserID,b' +
      '.Name,'#13#10'a.LoginTime,a.LogoutTime,a.ComputerName,a.LoginIP'#13#10'from ' +
      'MSLogin as a'#13#10'left outer join MSUser as b on a.UserID=b.ID'#13#10'wher' +
      'e a.UserID<>-1'#13#10
    Parameters = <>
    Left = 356
    Top = 120
    object adsMasterID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsMasterCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsMasterCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsMasterRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsMasterUserID: TIntegerField
      FieldName = 'UserID'
      Visible = False
    end
    object adsMasterName: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'Name'
    end
    object adsMasterLoginTime: TDateTimeField
      DisplayLabel = #30331#38470#26102#38388
      FieldName = 'LoginTime'
    end
    object adsMasterLogoutTime: TDateTimeField
      DisplayLabel = #36864#20986#26102#38388
      FieldName = 'LogoutTime'
    end
    object adsMasterComputerName: TStringField
      DisplayLabel = #30331#38470#26426#22120#21517#31216
      FieldName = 'ComputerName'
      Size = 50
    end
    object adsMasterLoginIP: TStringField
      DisplayLabel = #30331#38470#22320#22336
      FieldName = 'LoginIP'
      Size = 30
    end
  end
  object AqrClearLogin: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 232
    Top = 136
  end
end
