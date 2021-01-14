object Form1: TForm1
  Left = 92
  Top = 139
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 32
    Top = 64
    Width = 641
    Height = 353
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object Button1: TButton
    Left = 304
    Top = 16
    Width = 75
    Height = 25
    Caption = #31579#36873'(&F)...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ADOConnection1: TADOConnection
    Connected = True
    ConnectionString = 
      'FILE NAME=C:\Program Files\Common Files\System\OLE DB\Data Links' +
      '\DBDEMOS.udl'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 104
    Top = 16
  end
  object ADOTable1: TADOTable
    Active = True
    Connection = ADOConnection1
    CursorType = ctStatic
    TableName = 'customer'
    Left = 152
    Top = 16
    object ADOTable1CustNo: TFloatField
      FieldName = 'CustNo'
    end
    object ADOTable1Company: TWideStringField
      FieldName = 'Company'
      Size = 30
    end
    object ADOTable1Addr1: TWideStringField
      FieldName = 'Addr1'
      Size = 30
    end
    object ADOTable1Addr2: TWideStringField
      FieldName = 'Addr2'
      Size = 30
    end
    object ADOTable1City: TWideStringField
      FieldName = 'City'
      Size = 15
    end
    object ADOTable1State: TWideStringField
      FieldName = 'State'
    end
    object ADOTable1Zip: TWideStringField
      FieldName = 'Zip'
      Size = 10
    end
    object ADOTable1Country: TWideStringField
      FieldName = 'Country'
    end
    object ADOTable1Phone: TWideStringField
      FieldName = 'Phone'
      Size = 15
    end
    object ADOTable1FAX: TWideStringField
      FieldName = 'FAX'
      Size = 15
    end
    object ADOTable1TaxRate: TFloatField
      FieldName = 'TaxRate'
    end
    object ADOTable1Contact: TWideStringField
      FieldName = 'Contact'
    end
    object ADOTable1LastInvoiceDate: TDateTimeField
      FieldName = 'LastInvoiceDate'
    end
  end
  object DataSource1: TDataSource
    DataSet = ADOTable1
    Left = 224
    Top = 16
  end
end
