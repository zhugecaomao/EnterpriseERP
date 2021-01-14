unit PCRpCheckReckoning;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCustomRpt, QRCtrls, QuickRpt, ExtCtrls;

type
  TPCCheckReckoningReport = class(TWSCustomReport)
    QRLabel1: TQRLabel;
    qrlCheckCourse: TQRLabel;
    qrdbtClientName: TQRDBText;
    ChildBand1: TQRChildBand;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
