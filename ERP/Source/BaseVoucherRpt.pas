unit BaseVoucherRpt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherRpt, QuickRpt, QRCtrls, ExtCtrls, DB;

type
  TBaseVoucherReport = class(TVoucherReport)
    QRLabel3: TQRLabel;
    ClientNameDBText: TQRDBText;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetMasterDataSet(ADataSet: TDataSet); override;
  end;

var
  BaseVoucherReport: TBaseVoucherReport;

implementation

{$R *.dfm}

{ TBaseVoucherReport }

procedure TBaseVoucherReport.SetMasterDataSet(ADataSet: TDataSet);
begin
  inherited SetMasterDataSet(ADataSet);
  ClientNameDBText.DataSet := ADataSet;
end;

end.
