unit WSCustomRpt;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls, StdCtrls,
  ExtCtrls, Forms, QuickRpt, QRCtrls, DB,WSSecurity, QRExport;

type
  TWSCustomReport = class(TQuickRep)
    PageHeaderBand: TQRBand;
    TitleBand: TQRBand;
    TitleSysData: TQRSysData;
    ColumnHeaderBand: TQRBand;
    DetailBand: TQRBand;
    PageFooterBand: TQRBand;
    qrsdPageNumber: TQRSysData;
    UserNameExpr: TQRExpr;
    PrintDateSysData: TQRSysData;
    SummaryBand: TQRBand;
    CorporationNameExpr: TQRExpr;
    ProductNameLable: TQRLabel;
    QRExcelFilter: TQRExcelFilter;
    QRHTMLFilter: TQRHTMLFilter;
    QRWMFFilter: TQRWMFFilter;
    QRRTFFilter: TQRRTFFilter;
    QRCSVFilter: TQRCSVFilter;
    QRTextFilter: TQRTextFilter;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.DFM}

{ TWSCustomReport }

constructor TWSCustomReport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  with Functions do
  begin
    Prepare;
    { TODO : 添加取得当前用户名和公司名称的代码 }
    SetStringConstant(GetConstant('CORPORATIONNAME'), Guarder.CompanyUserName)
//    SetStringConstant(GetConstant('USERNAME'), UserName);
  end;
end;

procedure TWSCustomReport.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
var
  I, J: Integer;
  DataSet: TDataSet;
begin
  for I := 0 to BandList.Count - 1 do
  begin
    if TQRCustomBand(BandList[I]) is TQRSubDetail then
      DataSet := TQRSubDetail(BandList[I]).DataSet
    else DataSet := Self.DataSet;
    with TQRCustomBand(BandList[I]) do
      for J := 0 to ControlCount - 1 do
        if (Controls[J] is TQRDBText) and (TQRDBText(Controls[J]).DataSet = nil) then
          TQRDBText(Controls[J]).DataSet := DataSet;
  end;
end;

end.

