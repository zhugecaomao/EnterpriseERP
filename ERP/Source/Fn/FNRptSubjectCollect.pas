unit FNRptSubjectCollect;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSRptFrm, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, ActnList, ToolWin, ComCtrls,
  cxGridBandedTableView, cxGridDBBandedTableView, ADODB, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSCore, dxPScxGridLnk,
  WSDateRangeFm, ExtCtrls, QLDBFlt, cxDataStorage;

type
  TFNSubjectCollectReportForm = class(TWSReportForm)
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridDBBandedTableView1: TcxGridDBBandedTableView;
    ADODataSet: TADODataSet;
    ADODataSetSubCode: TStringField;
    ADODataSetSubName: TStringField;
    ADODataSetDebitCredit: TStringField;
    ADODataSetBDebit: TBCDField;
    ADODataSetBCredit: TBCDField;
    ADODataSetCDebit: TBCDField;
    ADODataSetCCredit: TBCDField;
    ADODataSetYDebit: TBCDField;
    ADODataSetYCredit: TBCDField;
    ADODataSetEDebit: TBCDField;
    ADODataSetECredit: TBCDField;
    cxGridDBBandedTableView1SubCode: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1SubName: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1BDebit: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1BCredit: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1CDebit: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1CCredit: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1YDebit: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1YCredit: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1EDebit: TcxGridDBBandedColumn;
    cxGridDBBandedTableView1ECredit: TcxGridDBBandedColumn;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    dxComponentPrinter: TdxComponentPrinter;
    GridPrinterLink: TdxGridReportLink;
    Panel1: TPanel;
    DateRangeFrame: TWSDateRangeFrame;
    ToolButton3: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    procedure ADODataSetBDebitGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure PrintActionExecute(Sender: TObject);
    procedure PrintPreviewActionExecute(Sender: TObject);
    procedure ExportActionExecute(Sender: TObject);
    procedure dxComponentPrinterCustomDrawReportTitle(Sender: TObject;
      AReportLink: TBasedxReportLink; ACanvas: TCanvas; ARect: TRect; ANom,
      ADenom: Integer; var TextAlignX: TdxTextAlignX;
      var TextAlignY: TdxTextAlignY; var AColor: TColor; AFont: TFont;
      var ADone: Boolean);
    procedure dxComponentPrinterMeasureReportTitle(Sender: TObject;
      AReportLink: TBasedxReportLink; var AHeight: Integer);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure FiltrateActionExecute(Sender: TObject);
  private
    { Private declarations }
    FFilterDialog: TQLDBFilterDialog;
    function FilterDialog: TQLDBFilterDialog;
  public
    { Public declarations }
  end;

implementation

uses CommonDM, ShellAPI, cxExportGrid4Link, WSUtils;

{$R *.dfm}

procedure TFNSubjectCollectReportForm.ADODataSetBDebitGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
  inherited;
  if Sender.AsCurrency = 0 then Text := ''
  else Text := CurrToStrF(Sender.AsCurrency, ffCurrency, 2);
end;

procedure TFNSubjectCollectReportForm.PrintActionExecute(Sender: TObject);
begin
  inherited;
  GridPrinterLink.Print(False, nil);
end;

procedure TFNSubjectCollectReportForm.PrintPreviewActionExecute(
  Sender: TObject);
begin
  inherited;
  GridPrinterLink.Preview();
end;

procedure TFNSubjectCollectReportForm.ExportActionExecute(Sender: TObject);
var
  Path: array[0..MAX_PATH] of Char;
  FileName: array[0..255] of Char;
  AFileName: string;
begin
  inherited;
  GetTempPath(SizeOf(Path), @Path);
  Windows.GetTempFileName(@Path, 'xof', 0, @FileName);
  AFileName := FileName;
  AFileName := ChangeFileExt(AFileName, '.xls');
  ExportGrid4ToExcel(AFileName, cxGrid);
  ShellExecute(HWND_DESKTOP, 'OPEN', PChar(AFileName), nil, nil, SW_SHOW);
end;

procedure TFNSubjectCollectReportForm.dxComponentPrinterCustomDrawReportTitle(
  Sender: TObject; AReportLink: TBasedxReportLink; ACanvas: TCanvas;
  ARect: TRect; ANom, ADenom: Integer; var TextAlignX: TdxTextAlignX;
  var TextAlignY: TdxTextAlignY; var AColor: TColor; AFont: TFont;
  var ADone: Boolean);
begin
  inherited;
  AReportLink.DrawText(ACanvas, ARect, 2, AReportLink.ReportTitle.Text, AFont,
    AColor, TextAlignX, TextAlignY, False, False, False);
//  AFont.Style := [];
  AFont.Size := MulDiv(10, ANom, ADenom);
  InflateRect(ARect, 0, MulDiv(-20, ANom, ADenom));
//  OffsetRect(ARect, 0, 200);
  AReportLink.DrawText(ACanvas, ARect, 2, Format('ÆðÖ¹ÈÕÆÚ: %s %s',
    [DateToStr(DateRangeFrame.deBeginDate.Date),
    DateToStr(DateRangeFrame.deEndDate.Date)]), AFont,
    AColor, TextAlignX, taBottom, False, False, False);
  ADone := True;
end;

procedure TFNSubjectCollectReportForm.dxComponentPrinterMeasureReportTitle(
  Sender: TObject; AReportLink: TBasedxReportLink; var AHeight: Integer);
begin
  inherited;
  AReportLink.ReportTitle.Text := Caption;
  AHeight := AHeight + 100;
end;

procedure TFNSubjectCollectReportForm.FormCreate(Sender: TObject);
begin
  inherited;
  DateRangeFrame.DataSet := DataSource.DataSet;
end;

procedure TFNSubjectCollectReportForm.FormShow(Sender: TObject);
var
  Y, M, D: Word;
begin
  inherited;
  DecodeDate(Date, Y, M, D);
  DateRangeFrame.SetDateRange(EncodeDate(Y, M, 1), Date + 0.999);
end;

procedure TFNSubjectCollectReportForm.RefreshActionExecute(
  Sender: TObject);
begin
  inherited;
  WSUtils.RefreshDataSet(DataSource.DataSet);
end;

procedure TFNSubjectCollectReportForm.ExitActionExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFNSubjectCollectReportForm.FiltrateActionExecute(
  Sender: TObject);

begin
  inherited;
  FilterDialog.Execute;
end;

function TFNSubjectCollectReportForm.FilterDialog: TQLDBFilterDialog;

  function GetFilterFields: string;
  var
    I: Integer;
  begin
    with ADODataSet do
      for I := 0 to FieldCount - 1 do
          if Fields[I].Visible then Result := Result + Fields[I].FieldName + ';';
  end;

begin
  if FFilterDialog = nil then
  begin
    FFilterDialog := TQLDBFilterDialog.Create(Self);
    FFilterDialog.DataSet := ADODataSet;
    FFilterDialog.FilterFields := GetFilterFields;
  end;
  Result := FFilterDialog;
end;

end.
