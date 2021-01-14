inherited WSStandardBrowseForm: TWSStandardBrowseForm
  Left = 43
  Top = 111
  Width = 673
  Caption = 'WSStandardBrowseForm'
  PixelsPerInch = 96
  TextHeight = 12
  inherited ToolBar: TToolBar
    Width = 665
  end
  inherited Panel1: TPanel
    Width = 665
    inherited PageControl: TPageControl
      Top = 231
      Width = 665
      Height = 27
    end
    inherited DBGrid: TQLDBGrid
      Width = 665
      Height = 231
    end
  end
end
