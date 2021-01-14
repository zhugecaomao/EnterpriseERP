inherited DALinkMenIDCardBrowseForm: TDALinkMenIDCardBrowseForm
  Left = 67
  Top = 128
  Width = 697
  Height = 462
  Caption = #32852#31995#20154#36164#26009
  FormStyle = fsMDIChild
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 689
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
    object ToolButton7: TToolButton
      Left = 173
      Top = 2
      Action = PrintPreviewAction
    end
    object ToolButton8: TToolButton
      Left = 228
      Top = 2
      Action = PrintAction
    end
    object ToolButton9: TToolButton
      Left = 283
      Top = 2
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 6
      Style = tbsSeparator
    end
    object ToolButton10: TToolButton
      Left = 291
      Top = 2
      Action = ExportAction
    end
    object ToolButton11: TToolButton
      Left = 346
      Top = 2
      Width = 8
      Caption = 'ToolButton11'
      ImageIndex = 7
      Style = tbsSeparator
    end
    object ToolButton12: TToolButton
      Left = 354
      Top = 2
      Action = FiltrateAction
    end
    object ToolButton5: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton13: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton14: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton14'
      ImageIndex = 9
      Style = tbsSeparator
    end
    object ToolButton15: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    Width = 689
    Height = 394
    inherited PageControl: TPageControl
      Top = 367
      Width = 689
      inherited TabSheet1: TTabSheet
        Caption = #32852#31995#20154
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 689
      Height = 367
      Columns = <
        item
          Expanded = False
          FieldName = 'Name'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Folk'
          Title.Alignment = taCenter
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDCard'
          Title.Alignment = taCenter
          Width = 70
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'BornPlace'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Province'
          Title.Alignment = taCenter
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'City'
          Title.Alignment = taCenter
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'County'
          Title.Alignment = taCenter
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Street'
          Title.Alignment = taCenter
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NativePlace'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Passport'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'DrivingLicence'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'ResidencePlace'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'PrivateFile'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'Nationality'
          Title.Alignment = taCenter
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'IsEmployee'
          Title.Alignment = taCenter
          Visible = True
        end>
    end
  end
  inherited DataSource: TDataSource
    DataSet = adsDALinkMenIDCard
  end
  object adsDALinkMenIDCard: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    CommandText = 'SELECT * FROM DALinkMenIDCard WHERE RecordState<>'#39#21024#38500#39
    Parameters = <>
    Left = 48
    Top = 152
    object adsDALinkMenIDCardID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object adsDALinkMenIDCardCreateDate: TDateTimeField
      FieldName = 'CreateDate'
      Visible = False
    end
    object adsDALinkMenIDCardCreateUserID: TIntegerField
      FieldName = 'CreateUserID'
      Visible = False
    end
    object adsDALinkMenIDCardRecordState: TStringField
      FieldName = 'RecordState'
      Visible = False
      Size = 12
    end
    object adsDALinkMenIDCardName: TStringField
      DisplayLabel = #22995#21517
      FieldName = 'Name'
    end
    object adsDALinkMenIDCardNationality: TStringField
      DisplayLabel = #22269#31821
      FieldName = 'Nationality'
    end
    object adsDALinkMenIDCardNativePlace: TStringField
      DisplayLabel = #31821#36143
      FieldName = 'NativePlace'
      Size = 40
    end
    object adsDALinkMenIDCardFolk: TStringField
      DisplayLabel = #27665#26063
      FieldName = 'Folk'
    end
    object adsDALinkMenIDCardIDCard: TStringField
      DisplayLabel = #36523#20221#35777
      FieldName = 'IDCard'
    end
    object adsDALinkMenIDCardBornPlace: TStringField
      DisplayLabel = #20986#29983#22320
      FieldName = 'BornPlace'
      Size = 60
    end
    object adsDALinkMenIDCardProvince: TStringField
      DisplayLabel = #30465'/'#24066'/'#33258#27835#21306
      FieldName = 'Province'
    end
    object adsDALinkMenIDCardCity: TStringField
      DisplayLabel = #22320'/'#24066
      FieldName = 'City'
    end
    object adsDALinkMenIDCardCounty: TStringField
      DisplayLabel = #21306'/'#21439
      FieldName = 'County'
    end
    object adsDALinkMenIDCardStreet: TStringField
      DisplayLabel = #34903'/'#20065
      FieldName = 'Street'
      Size = 40
    end
    object adsDALinkMenIDCardPassport: TStringField
      DisplayLabel = #25252#29031
      FieldName = 'Passport'
    end
    object adsDALinkMenIDCardDrivingLicence: TStringField
      DisplayLabel = #39550#39542#25191#29031
      FieldName = 'DrivingLicence'
    end
    object adsDALinkMenIDCardResidencePlace: TStringField
      DisplayLabel = #25143#21475#25152#22312#22320
      FieldName = 'ResidencePlace'
      Size = 60
    end
    object adsDALinkMenIDCardPrivateFile: TStringField
      DisplayLabel = #26723#26696#25152#22312#22320
      FieldName = 'PrivateFile'
      Size = 60
    end
    object adsDALinkMenIDCardEmployeeID: TIntegerField
      DisplayLabel = #21592#24037'ID'
      FieldName = 'EmployeeID'
      Visible = False
    end
    object adsDALinkMenIDCardIsEmployee: TStringField
      DisplayLabel = #21592#24037#26631#24535
      FieldName = 'IsEmployee'
      Size = 2
    end
  end
end
