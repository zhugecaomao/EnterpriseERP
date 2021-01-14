program Template;

uses
  Forms,
  WSBrowse in 'WSBrowse.pas' {WSBrowseForm},
  WSBrSales in 'WSBrSales.pas',
  WSConsts in 'WSConsts.pas',
  WSCstFrm in 'WSCstFrm.pas' {WSCustomForm},
  WSCustomRpt in 'WSCustomRpt.pas',
  WSDM in 'WSDM.pas' {WSDataModule: TDataModule},
  WSEdit in 'WSEdit.pas' {WSEditForm},
  WSEdSales in 'WSEdSales.pas',
  WSStandardBrowse in 'WSStandardBrowse.pas',
  WSStandardEdit in 'WSStandardEdit.pas' {WSStandardEditForm},
  WSUtils in 'WSUtils.pas',
  WSVoucherBrowse in 'WSVoucherBrowse.pas' {WSVoucherBrowseForm},
  WSVoucherEdit in 'WSVoucherEdit.pas',
  WSVoucherRpt in 'WSVoucherRpt.pas',
  CommonDM in 'CommonDM.pas' {CommonData: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TWSDataModule, WSDataModule);
  Application.CreateForm(TCommonData, CommonData);
  Application.Run;
end.
