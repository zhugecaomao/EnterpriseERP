unit TB97Cnst;

{
  Toolbar97
  Copyright (C) 1998 by Jordan Russell

  String constants
}

interface

const
  { TDock97 exception messages }
  STB97DockParentNotAllowed = 'A TDock97 control cannot be placed inside a tool window or another TDock97';
  STB97DockCannotChangePosition = 'Cannot change Position of a TDock97 if it already contains controls';

  { TCustomToolWindow97 exception messages }
  STB97ToolwinNameNotSet = 'Cannot save tool window''s position because Name property is not set';
  STB97ToolwinDockedToNameNotSet = 'Cannot save tool window''s position because DockedTo''s Name property not set';
  STB97ToolwinParentNotAllowed = 'A tool window can only be placed on a TDock97 or directly on the form';

  { TCustomToolbar97 exception messages }
  STB97ToolbarControlNotChildOfToolbar = 'Control ''%s'' is not a child of the toolbar';

  { TToolbarSep97 exception messages }
  STB97SepParentNotAllowed = 'TToolbarSep97 can only be placed on a TToolbar97';

implementation

end.
 
