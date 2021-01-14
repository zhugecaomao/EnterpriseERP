inherited MSBrUserNewForm: TMSBrUserNewForm
  Left = 108
  Top = 187
  Height = 403
  Caption = #29992#25143#23450#20041
  FormStyle = fsMDIChild
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    ButtonWidth = 55
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Action = AddNewAction
    end
    object ToolButton2: TToolButton
      Left = 55
      Top = 2
      Action = DeleteAction
    end
    object ToolButton3: TToolButton
      Left = 110
      Top = 2
      Action = EditAction
    end
    object ToolButton4: TToolButton
      Left = 165
      Top = 2
      Width = 8
      Caption = 'ToolButton4'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton6: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton7: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton9: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton11: TToolButton
      Left = 409
      Top = 2
      Action = RefreshAction
    end
    object ToolButton12: TToolButton
      Left = 464
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 472
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Height = 335
    inherited PageControl: TPageControl
      Top = 308
      inherited TabSheet1: TTabSheet
        Caption = #29992#25143#23450#20041#36164#26009
      end
    end
    inherited DBGrid: TQLDBGrid
      Height = 308
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = #21592#24037#22995#21517
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BeginDate'
          Title.Alignment = taCenter
          Width = 130
          Visible = True
        end>
    end
  end
  inherited DataSource: TDataSource
    DataSet = adsSlContract
  end
  object adsSlContract: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 
      'select a.* ,b.name ['#21592#24037#22995#21517']'#13#10'from MSUser  a'#13#10'LEFT outer join   MSE' +
      'mployee b on a.EmployeeID = b.ID'#13#10'where a.Recordstate<>'#39#21024#38500#39
    Parameters = <>
    Left = 168
    Top = 120
    object adsSlContractID: TAutoIncField
      FieldName = 'ID'
      Visible = False
    end
    object adsSlContractCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsSlContractCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsSlContractRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsSlContractRoleID: TIntegerField
      FieldName = 'RoleID'
      Visible = False
    end
    object adsSlContractEmployeeID: TIntegerField
      FieldName = 'EmployeeID'
      Visible = False
    end
    object adsSlContractEndDate: TDateTimeField
      FieldName = 'EndDate'
      Visible = False
    end
    object adsSlContractPassWord: TIntegerField
      FieldName = 'PassWord'
      Visible = False
    end
    object adsSlContractCode: TStringField
      DisplayLabel = #32534#21495
      FieldName = 'Code'
      Visible = False
    end
    object adsSlContractName: TStringField
      DisplayLabel = #29992#25143#21517#31216
      FieldName = 'Name'
    end
    object adsSlContractDSDesigner: TStringField
      FieldName = #21592#24037#22995#21517
      Size = 30
    end
    object adsSlContractBeginDate: TDateTimeField
      DisplayLabel = #27880#20876#26085#26399
      FieldName = 'BeginDate'
    end
    object adsSlContractIsUsed: TIntegerField
      FieldName = 'IsUsed'
    end
  end
  object ADOQuery: TADOQuery
    Connection = CommonData.acnConnection
    Parameters = <>
    Left = 224
    Top = 176
  end
end
