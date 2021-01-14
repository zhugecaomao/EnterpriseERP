inherited PubQuerryForm: TPubQuerryForm
  Left = 118
  Top = 116
  Width = 525
  Height = 413
  Caption = #20844#20849#26597#35810#32467#26524
  FormStyle = fsMDIChild
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 517
    ButtonWidth = 31
    Visible = False
  end
  inherited Panel1: TPanel
    Width = 517
    Height = 345
    inherited PageControl: TPageControl
      Top = 318
      Width = 517
      Height = 27
      Visible = False
      inherited TabSheet1: TTabSheet
        Caption = #26597#35810#32467#26524
      end
    end
    inherited DBGrid: TQLDBGrid
      Width = 517
      Height = 318
      FooterRowCount = 1
    end
  end
  inherited ActionList: TActionList
    Left = 339
    Top = 5
  end
  inherited DataSource: TDataSource
    DataSet = adsQuerryMAster
    Left = 262
    Top = 106
  end
  object adsQuerryMAster: TADODataSet
    Connection = CommonData.acnConnection
    CursorType = ctStatic
    Filtered = True
    Parameters = <>
    Left = 172
    Top = 100
  end
end
