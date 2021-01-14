{*********************************************************}
{*                  OGCONST.PAS 1.13                     *}
{*     Copyright (c) 1996-02 TurboPower Software Co      *}
{*                 All rights reserved.                  *}
{*********************************************************}

{$I ONGUARD.INC}

{$B-} {Complete Boolean Evaluation}
{$I+} {Input/Output-Checking}
{$P+} {Open Parameters}
{$T-} {Typed @ Operator}
{$W-} {Windows Stack Frame}
{$X+} {Extended Syntax}

{$IFNDEF Win32}
{$G+} {286 Instructions}
{$N+} {Numeric Coprocessor}

{$C MOVEABLE,DEMANDLOAD,DISCARDABLE}
{$ENDIF}

unit OgConst;
  {-Resource constants}

{$IFDEF Win32}
  {$R OGCONST.R32}
{$ELSE}
  {$R OGCONST.R16}
{$ENDIF}

interface

{$I OGKEYINI.INC} {get ini file name used to store application keys}

{$I OGCONST.INC}  {constant declarations}

implementation

end.