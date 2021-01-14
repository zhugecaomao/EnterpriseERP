unit FNRptCustomize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, dxPSGlbl, dxPSUtl, dxPSEngn, dxPrnPg, dxBkgnd, dxWrap,
  dxPrnDev, dxPSCompsProvider, dxPSFillPatterns, dxPSEdgePatterns,
  cxControls, cxSSheet, dxPSCore, DB, ADODB, ActnList, ComCtrls, ToolWin,
  ExtCtrls, dxPSBaseGridLnk, dxPScxSSLnk, WSDateRangeFm,
  cxLookAndFeelPainters, StdCtrls, cxButtons;

type
  TFNCustomizeReportForm = class(TWSCustomForm)
    Panel1: TPanel;
    ToolBar: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton6: TToolButton;
    ToolButton4: TToolButton;
    ToolButton8: TToolButton;
    ToolButton5: TToolButton;
    DataSource: TDataSource;
    ActionList: TActionList;
    ViewDetailsAction: TAction;
    PrintPreviewAction: TAction;
    PrintAction: TAction;
    ExportAction: TAction;
    FiltrateAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ADODataSet: TADODataSet;
    dxComponentPrinter: TdxComponentPrinter;
    SSBook: TcxSpreadSheetBook;
    SheetPrinterLink: TdxSpreadSheetBookReportLink;
    DateRangeFrame: TWSDateRangeFrame;
    cxButton1: TcxButton;
    ADODataSetSubCode: TStringField;
    ADODataSetSubName: TStringField;
    ADODataSetDebitCredit: TStringField;
    ADODataSetYBDebit: TBCDField;
    ADODataSetYBCredit: TBCDField;
    ADODataSetYBBalance: TBCDField;
    ADODataSetTBDebit: TBCDField;
    ADODataSetTBCredit: TBCDField;
    ADODataSetTBBalance: TBCDField;
    ADODataSetTCDebit: TBCDField;
    ADODataSetTCCredit: TBCDField;
    ADODataSetYEDebit: TBCDField;
    ADODataSetYECredit: TBCDField;
    ADODataSetYEBalance: TBCDField;
    ADODataSetTEDebit: TBCDField;
    ADODataSetTECredit: TBCDField;
    ADODataSetTEBalance: TBCDField;
    ADODataSetHYDebit: TBCDField;
    ADODataSetHYCredit: TBCDField;
    ADODataSetHYBalance: TBCDField;
    FileOpenAction: TAction;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    OpenDialog: TOpenDialog;
    ToolButton3: TToolButton;
    ToolButton10: TToolButton;
    procedure FormShow(Sender: TObject);
    procedure PrintActionExecute(Sender: TObject);
    procedure PrintPreviewActionExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ADODataSetAfterOpen(DataSet: TDataSet);
    procedure FormDestroy(Sender: TObject);
    procedure cxButton1Click(Sender: TObject);
    procedure ToolButton7Click(Sender: TObject);
    procedure FileOpenActionExecute(Sender: TObject);
    procedure ToolButton10Click(Sender: TObject);
    procedure ExitActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
  private
    { Private declarations }
    procedure ReplaceFunc;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses cxSSFormulas, cxExcelConst, WSSecurity, WSUtils;

var
  CollectDataSet: TDataSet;

procedure CFLookupAB(Sender: TcxSSFunctionHandler);
var
  FuncType, SubCode, Field, S: string;
  P: Integer;

  procedure CustomFuncCallBack(Sender: TcxSSFunctionHandler; const Value: string);
  begin
    Sender.StringValue := Value;
  end;

begin
  Sender.EnumParamValues(@CustomFuncCallBack, [vtString]);
  S := Sender.StringValue;
  if SameText(S, 'Company') then Sender.SetStringResult(Guarder.CompanyUserName)
  else begin
    P := Pos(',', S);
    FuncType := Copy(S, 1, P - 1);
    S := Copy(S, P + 1, MaxInt);
    P := Pos(',', S);
    SubCode := Copy(S, 1, P - 1);
    S := Copy(S, P + 1, MaxInt);
    Field := Copy(S, 1, MaxInt);
    with CollectDataSet do
    begin
      Open;
      if Locate('SubCode', SubCode, []) then
      begin
        if Field = 'NCJF' then // 年初借方
          Sender.SetFloatResult(FieldByName('YBDebit').AsCurrency)
        else if Field = 'NCDF' then // 年初贷方
          Sender.SetFloatResult(FieldByName('YBCredit').AsCurrency)
        else if Field = 'NCYE' then // 年初余额
          if FieldByName('DebitCredit').Value = '借' then
            Sender.SetFloatResult(FieldByName('YBBalance').AsCurrency)
          else
            Sender.SetFloatResult(-FieldByName('YBBalance').AsCurrency)
        else if Field = 'BQJF' then // 本期借方
          Sender.SetFloatResult(FieldByName('TCDebit').AsCurrency)
        else if Field = 'BQDF' then // 本期贷方
          Sender.SetFloatResult(FieldByName('TCCredit').AsCurrency)
        else if Field = 'QMJF' then // 期末借方
          Sender.SetFloatResult(FieldByName('TEDebit').AsCurrency)
        else if Field = 'QMDF' then // 期末贷方
          Sender.SetFloatResult(FieldByName('TECredit').AsCurrency)
        else if Field = 'QMYE' then // 期末余额
          if FieldByName('DebitCredit').Value = '借' then
            Sender.SetFloatResult(FieldByName('TEBalance').AsCurrency)
          else
            Sender.SetFloatResult(-FieldByName('TEBalance').AsCurrency)
        else if Field = 'BNJF' then // 本年借方
          Sender.SetFloatResult(FieldByName('YEDebit').AsCurrency)
        else if Field = 'BNDF' then // 本年贷方
          Sender.SetFloatResult(FieldByName('YECredit').AsCurrency)
        else if Field = 'BNYE' then // 本年余额
          if FieldByName('DebitCredit').Value = '借' then
            Sender.SetFloatResult(FieldByName('YEBalance').AsCurrency)
          else
            Sender.SetFloatResult(-FieldByName('YEBalance').AsCurrency)
        else if Field = 'LNJF' then // 历年借方
          Sender.SetFloatResult(FieldByName('YHCredit').AsCurrency)
        else if Field = 'LNDF' then // 历年贷方
          Sender.SetFloatResult(FieldByName('YHCredit').AsCurrency)
        else if Field = 'LNYE' then // 历年余额
          if FieldByName('DebitCredit').Value = '借' then
            Sender.SetFloatResult(FieldByName('YHBalance').AsCurrency)
          else
            Sender.SetFloatResult(-FieldByName('YHBalance').AsCurrency)
      end
      else Sender.SetFloatResult(0);
    end;
  end;
end;

procedure TFNCustomizeReportForm.FormShow(Sender: TObject);
var
  Y, M, D: Word;
begin
  inherited;
  DecodeDate(Date, Y, M, D);
  DateRangeFrame.SetDateRange(EncodeDate(Y, M, 1), Date + 0.999);
end;

procedure TFNCustomizeReportForm.PrintActionExecute(Sender: TObject);
begin
  inherited;
  SheetPrinterLink.Print(False, nil)
end;

procedure TFNCustomizeReportForm.PrintPreviewActionExecute(
  Sender: TObject);
begin
  inherited;
  SheetPrinterLink.Preview();
end;

procedure TFNCustomizeReportForm.FormCreate(Sender: TObject);
begin
  inherited;
  DateRangeFrame.DataSet := ADODataSet;
  CollectDataSet := ADODataSet;
//  SSBook.AutoRecalc := False;
//  SSBook.LoadFromFile(ExtractFilePath(Application.ExeName) + '资产负债表.xls');
  ReplaceFunc;
//  SSBook.AutoRecalc := True;
end;

procedure TFNCustomizeReportForm.ADODataSetAfterOpen(DataSet: TDataSet);
begin
  inherited;
  SSBook.Recalc;
end;

procedure TFNCustomizeReportForm.FormDestroy(Sender: TObject);
begin
  inherited;
  CollectDataSet := nil;
end;

procedure TFNCustomizeReportForm.cxButton1Click(Sender: TObject);
begin
  inherited;
  CollectDataSet.Close;
  CollectDataSet.Open;
end;

procedure RegisterCustomFunction;
const
  CustomFuncDef: TcxFuncDefinition = (Token: $FFFF; Name: 'LOOKUPAB';
    Definition: CFLookupAB; Params: fpFixed; ParamsCount: 1);
begin
  TcxSSFunctionHandler.RegisterFunctions([CustomFuncDef]);
end;


procedure TFNCustomizeReportForm.ToolButton7Click(Sender: TObject);
begin
  inherited;
  SSBook.SaveToFile(ExtractFilePath(Application.ExeName) + '资产负债表.xls')
end;

procedure TFNCustomizeReportForm.FileOpenActionExecute(Sender: TObject);
begin
  inherited;
  OpenDialog.InitialDir := ExtractFileDir(Application.ExeName);
  if OpenDialog.Execute then
  begin
    SSBook.LoadFromFile(OpenDialog.FileName);
    ReplaceFunc;
  end;
end;

procedure TFNCustomizeReportForm.ReplaceFunc;
var
  C, R: Integer;
  ACell: TcxSSCellObject;
begin
   with SSBook.ActiveSheet do
     for C := 0 to ContentColCount - 1 do
       for R := 0 to ContentRowCount - 1 do
       begin
         ACell := GetCellObject(C, R) ;
         try
           if Pos('UPPER', UpperCase(ACell.Text)) > 0 then
             ACell.Text := StringReplace(ACell.Text, 'UPPER', 'LOOKUPAB', [rfReplaceAll, rfIgnoreCase]);
         finally
           ACell.Free;
         end;
       end;
end;

procedure TFNCustomizeReportForm.ToolButton10Click(Sender: TObject);
var
  R, C: Integer;
  Cell1, Cell2: TcxSSCellObject;
begin
  inherited;
  SSBook.AddSheetPage('New Page');
  SSBook.Pages[SSBook.PageCount - 1].Assign(SSBook.Pages[0]);
//  SSBook.AddSheetPage('New Page');
//  for C := 0 to SSBook.Pages[0].ContentColCount - 1 do
//    for R := 0 to SSBook.Pages[0].ContentRowCount - 1 do
//    begin
//      Cell1 := SSBook.Pages[0].GetCellObject(C, R);
//      try
//        Cell2 := SSBook.Pages[SSBook.PageCount - 1].GetCellObject(C, R);
//        try
//          Cell2.Text := Cell1.Text;
//        finally
//          Cell2.Free;
//        end;
//      finally
//        Cell1.Free;
//      end;
//    end;
end;

procedure TFNCustomizeReportForm.ExitActionExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFNCustomizeReportForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  WSUtils.RefreshDataSet(ADODataSet);
end;

initialization
 RegisterCustomFunction;

end.
