unit WSVoucherRpt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCustomRpt, QRCtrls, QuickRpt, ExtCtrls, DB, QRExport;

type
  TVoucherReport = class(TWSCustomReport)
    QRLabel19: TQRLabel;
    VouchNoDBText: TQRDBText;
    QRLabel2: TQRLabel;
    VoucherDateDBText: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel16: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel1: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetMasterDataSet(ADataSet: TDataSet); virtual;
  end;

implementation

{$R *.dfm}

{ TWSVoucherReport }

procedure TVoucherReport.SetMasterDataSet(ADataSet: TDataSet);
begin
  VouchNoDBText.DataSet := ADataSet;
  VoucherDateDBText.DataSet := ADataSet;
end;

end.
