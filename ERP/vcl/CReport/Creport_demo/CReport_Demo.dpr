program creport_demo;

uses
  Forms,
  REportDemo in 'REportDemo.pas' {CReportDemoForm},
  Data in 'Data.pas' {Dataform: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TDataform, Dataform);
  Application.CreateForm(TCReportDemoForm, CReportDemoForm);
  Application.Run;
end.
