program CReportEdit;

uses
  Forms,
  Border in 'Border.pas' {BorderForm},
  Color in 'Color.pas' {ColorForm},
  diagonal in 'diagonal.pas' {DiagonalForm},
  creport in 'creport.pas' {CreportForm},
  margink in 'margink.pas' {MarginkForm},
  NewDialog in 'NewDialog.pas' {frmNewTable},
  vsplit in 'vsplit.pas' {VSplitForm},
  about in 'about.pas' {AboutBox};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCreportForm, CreportForm);
  Application.CreateForm(TBorderForm, BorderForm);
  Application.CreateForm(TColorForm, ColorForm);
  Application.CreateForm(TDiagonalForm, DiagonalForm);
  Application.CreateForm(TMarginkForm, MarginkForm);
  Application.CreateForm(TfrmNewTable, frmNewTable);
  Application.CreateForm(TVSplitForm, VSplitForm);
  Application.CreateForm(Tfrm_About, frm_About);
  Application.Run;
end.

