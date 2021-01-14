inherited MSBrRolesForm: TMSBrRolesForm
  Left = 177
  Top = 159
  Width = 672
  Height = 393
  Caption = #29992#25143#31649#29702
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 664
    ButtonWidth = 55
    object tbtAdd: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton1: TToolButton
      Left = 55
      Top = 2
      Action = EditAction
    end
    object ToolButton2: TToolButton
      Left = 110
      Top = 2
      Action = DeleteAction
    end
    object ToolButton3: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 173
      Top = 2
      Action = RolePermissionsAction
    end
    object ToolButton5: TToolButton
      Left = 228
      Top = 2
      Width = 8
      Caption = 'ToolButton5'
      ImageIndex = 10
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 236
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 291
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton9: TToolButton
      Left = 354
      Top = 2
      Action = ExportAction
    end
    object ToolButton10: TToolButton
      Left = 409
      Top = 2
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 417
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton15: TToolButton
      Left = 472
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton11: TToolButton
      Left = 527
      Top = 2
      Action = RefreshAction
    end
    object ToolButton14: TToolButton
      Left = 582
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 590
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 664
    Height = 325
    inherited PageControl: TPageControl
      Top = 303
      Width = 664
      inherited TabSheet1: TTabSheet
        Caption = #29992#25143
      end
      object TabSheet2: TTabSheet
        Tag = 1
        Caption = #29992#25143#32452
        ImageIndex = 1
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 664
      Height = 303
    end
  end
  inherited ActionList: TActionList
    object RolePermissionsAction: TAction
      Caption = #25480#26435
      Hint = #25480#26435
      ImageIndex = 9
      OnExecute = RolePermissionsActionExecute
    end
  end
  object adsUser: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'select * from MSRole where isUserTerm=0 and RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 32
    Top = 144
    object adsUserID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsUserCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsUserCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsUserRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsUserName: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'Name'
    end
    object adsUserIsUserTerm: TBooleanField
      FieldName = 'IsUserTerm'
      Visible = False
    end
    object adsUserMemo: TStringField
      FieldName = 'Memo'
      Visible = False
      Size = 60
    end
  end
  object ADODataSet1: TADODataSet
    Tag = 1
    Connection = CommonData.acnConnection
    CommandText = 'select * from MSRole where isUserTerm=1 and RecordState<>'#39#21024#38500#39#13#10
    Parameters = <>
    Left = 64
    Top = 144
    object ADODataSet1ID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object ADODataSet1CreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object ADODataSet1CreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object ADODataSet1RecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object ADODataSet1Name: TStringField
      DisplayLabel = #21517#31216
      FieldName = 'Name'
    end
    object ADODataSet1IsUserTerm: TBooleanField
      FieldName = 'IsUserTerm'
      Visible = False
    end
    object ADODataSet1Memo: TStringField
      FieldName = 'Memo'
      Visible = False
      Size = 60
    end
  end
end
