program RExplore;

uses
  Forms,
  myEURpt in 'myEURpt.pas' {myEndUserSolution};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TmyEndUserSolution, myEndUserSolution);
  Application.MainForm.Visible := False;
  Application.ShowMainForm := False;
  Application.Run;
end.
