unit FNRptSubjectDetailCollect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, FNRptSubjectCollect, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxEdit, DB, cxDBData, dxPSGlbl, dxPSUtl, dxPSEngn,
  dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider, dxPSFillPatterns,
  dxPSEdgePatterns, dxPSCore, dxPScxGridLnk, ADODB, ActnList,
  WSDateRangeFm, ExtCtrls, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, ComCtrls, ToolWin;

type
  TFNSubjectDetailsCollectReportForm = class(TFNSubjectCollectReportForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses CommonDM;

{$R *.dfm}

end.
