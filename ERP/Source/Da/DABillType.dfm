inherited DABillTypeForm: TDABillTypeForm
  Left = 184
  Top = 177
  Width = 503
  Caption = #21333#25454#31867#22411
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  inherited CancelButton: TButton
    Left = 413
    Caption = #20851#38381
  end
  inherited OKButton: TButton
    Left = 333
    ModalResult = 1
    Visible = False
  end
  object qdgDABillType: TQLDBGrid
    Left = 8
    Top = 8
    Width = 481
    Height = 201
    DataSource = dsDABillType
    TabOrder = 2
    TitleFont.Charset = GB2312_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = #23435#20307
    TitleFont.Style = []
    AlternateColor = clWindow
    CurrencyView.CurrencyTitle = False
    CurrencyView.DigitAlignment = taCenter
    CurrencyView.DigitWidth = 9
    CurrencyView.IntegerSeparateColor = clRed
    CurrencyView.SeparateColor = clSilver
    CurrencyView.ThousandSeparateColor = clGray
    CurrencyView.TitleLines = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    FooterRowCount = 0
    OptionsEx = [dgAllowDelete, dgAllowInsert]
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CreateDate'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'CreateUserID'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'RecordState'
        Visible = False
      end
      item
        Expanded = False
        FieldName = 'Name'
        Title.Caption = #21517#31216
        Width = 88
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TableName'
        Title.Caption = #34920#21517
        Width = 108
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FormName'
        Title.Caption = #21333#20803#21517#31216
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BusinessType'
        Title.Caption = #19994#21153#31867#22411
        Width = 70
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'IsAccount'
        Title.Caption = #26159#21542#35760#36134
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Memo'
        Width = -1
        Visible = False
      end>
  end
  object btnAdd: TButton
    Left = 120
    Top = 216
    Width = 33
    Height = 25
    Caption = #28155#21152
    TabOrder = 3
    OnClick = btnAddClick
  end
  object btnDelete: TButton
    Left = 152
    Top = 216
    Width = 33
    Height = 25
    Caption = #21024#38500
    TabOrder = 4
    OnClick = btnDeleteClick
  end
  object dsDABillType: TDataSource
    DataSet = CommonData.adsDABillType
    Left = 72
    Top = 144
  end
end
