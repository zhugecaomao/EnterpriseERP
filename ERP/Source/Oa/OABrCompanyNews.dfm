inherited OABrCompanyNewsForm: TOABrCompanyNewsForm
  Left = 59
  Top = 117
  Caption = #20844#21496#26032#38395
  FormStyle = fsMDIChild
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
    object ToolButton14: TToolButton
      Left = 409
      Top = 2
      Action = CustomizeViewAction
    end
    object ToolButton11: TToolButton
      Left = 464
      Top = 2
      Action = RefreshAction
    end
    object ToolButton12: TToolButton
      Left = 519
      Top = 2
      Width = 8
      Caption = 'ToolButton12'
      ImageIndex = 8
      Style = tbsSeparator
    end
    object ToolButton13: TToolButton
      Left = 527
      Top = 2
      Action = ExitAction
    end
  end
  inherited Panel1: TPanel
    inherited PageControl: TPageControl
      inherited TabSheet1: TTabSheet
        Caption = #20844#21496#26032#38395
      end
    end
  end
  object ADODataSet1: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 
      'SELECT a.ID, a.CreateDate, a.CreateUserID, a.RecordState, '#13#10'a.Da' +
      'te, a.Code, a.DocTypeID, a.BusTypeID, a.DocHead, a.DocText,'#13#10' a.' +
      'DocAdd, a.Memo,b.Name as DocType,c.Name  as BusType '#13#10'FROM OACom' +
      'panyNews as a left join DAAttribute  as b on  a.DocTypeID=b.ID'#13#10 +
      'left join DAAttribute  as c on  a.BusTypeID=c.ID where a.RecordS' +
      'tate<>'#39#21024#38500#39
    Parameters = <>
    Left = 88
    Top = 112
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
    object ADODataSet1Date: TDateTimeField
      DisplayLabel = #24037#20316#26085#26399
      DisplayWidth = 12
      FieldName = 'Date'
    end
    object ADODataSet1Code: TStringField
      DisplayLabel = #32534#21495
      DisplayWidth = 12
      FieldName = 'Code'
    end
    object ADODataSet1DocTypeID: TIntegerField
      FieldName = 'DocTypeID'
      Visible = False
    end
    object ADODataSet1BusTypeID: TIntegerField
      FieldName = 'BusTypeID'
      Visible = False
    end
    object ADODataSet1DocHead: TStringField
      DisplayLabel = #20027#39064
      FieldName = 'DocHead'
      Size = 50
    end
    object ADODataSet1DocText: TMemoField
      FieldName = 'DocText'
      Visible = False
      BlobType = ftMemo
    end
    object ADODataSet1DocAdd: TBytesField
      FieldName = 'DocAdd'
      Visible = False
      Size = 1
    end
    object ADODataSet1DocType: TStringField
      DisplayLabel = #20844#25991#31867#22411
      DisplayWidth = 18
      FieldName = 'DocType'
      Size = 60
    end
    object ADODataSet1BusType: TStringField
      DisplayLabel = #19994#21153#31867#22411
      DisplayWidth = 18
      FieldName = 'BusType'
      Size = 60
    end
    object ADODataSet1Memo: TStringField
      DisplayLabel = #22791#27880
      FieldName = 'Memo'
      Size = 12
    end
  end
end
