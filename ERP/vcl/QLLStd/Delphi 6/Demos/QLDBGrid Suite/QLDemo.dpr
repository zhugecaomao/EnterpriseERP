program QLDemo;

{%ToDo 'QLDemo.todo'}

uses
  Forms,
  Order in 'Order.pas' {OrderForm},
  DataMod in 'DataMod.pas' {DemoDM: TDataModule},
  OrderRpr in 'OrderRpr.pas' {OrderReport: TQuickRep},
  About in 'About.pas' {AboutForm},
  QLDBLkp in '..\Source\QLDBLkp.pas',
  QLDBGrid in '..\Source\QLDBGrid.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDemoDM, DemoDM);
  Application.CreateForm(TOrderForm, OrderForm);
  Application.Run;
end.
