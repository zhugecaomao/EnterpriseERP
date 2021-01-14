inherited FNSubjectDetailsCollectReportForm: TFNSubjectDetailsCollectReportForm
  Caption = #26126#32454#27719#24635#36134
  PixelsPerInch = 96
  TextHeight = 12
  inherited cxGrid: TcxGrid
    inherited cxGridDBBandedTableView1: TcxGridDBBandedTableView
      DataController.Filter.Criteria = {FFFFFFFF0000000000}
    end
  end
  inherited ADODataSet: TADODataSet
    Active = False
    Parameters = <
      item
        Name = 'BeginDate'
        DataType = ftDateTime
        Size = -1
        Value = 36161d
      end
      item
        Name = 'EndDate'
        DataType = ftDateTime
        Size = -1
        Value = 37622d
      end
      item
        Name = 'SubLevel'
        DataType = ftInteger
        Value = 99
      end>
  end
  inherited dxComponentPrinter: TdxComponentPrinter
    inherited GridPrinterLink: TdxGridReportLink
      DateTime = 37790.0684996296
      PrinterPage._dxMeasurementUnits_ = 0
      PrinterPage._dxLastMU_ = 2
      ReportTitle.Text = #31185#30446#26126#32454#36134
      BuiltInReportLink = True
    end
  end
end
