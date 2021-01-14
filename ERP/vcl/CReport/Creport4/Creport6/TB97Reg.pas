unit TB97Reg;

{
  Toolbar97
  Copyright (C) 1998 by Jordan Russell
}

interface

procedure Register;

implementation

uses
  Classes, TB97, TB97Tlbr, TB97Tlwn, TB97Ctls;

procedure Register;
begin
  RegisterComponents ('Toolbar97', [TDock97, TToolbar97, TToolWindow97,
    TToolbarButton97, TToolbarSep97, TEdit97]);
end;

end.
