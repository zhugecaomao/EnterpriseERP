program rbMSSQLServerReportServer;

uses
  Forms,
  frmServer in 'frmServer.pas' {ServerForm},
  dmVolume in 'dmVolume.pas' {Datamodule1: TDataModule};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TServerForm, ServerForm);
  Application.CreateForm(TDatamodule1, Datamodule1);
  Application.Run;
end.
