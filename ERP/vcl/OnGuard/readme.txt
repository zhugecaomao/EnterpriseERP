              Last Minute News about OnGuard 1.10


-- General Information --

LICENSE.TXT, located in the product directory, is the license agreement that applies to this product.

Refer to the DEPLOY.HLP file in the \REDIST directory for information
concerning the deployment of packages.


-- Additional DLL's --

Since OnGuard uses some OLE routines, you must insure that your users
machines have the COMPOBJ.DLL installed. This DLL is part of a normal Windows
9x and NT/2000 installation, but it may be missing from some Windows 3.1x
installations.


-- Package naming --

To avoid version conflicts with applications using different versions of the OnGuard packages, each new version of OnGuard will come with packages using slightly different names.  TurboPower's current package naming convention is as follows:

1) The first letter represents one of the TurboPower products (G for OnGuard)
2) The next three digits are the product version number (110 for 1.10)
3) Two product-specific digits (_R for run-time, or _D for design)
4) The last two digits represent the VCL version (30, 35, 40, 41, 50, 51)

The OnGuard run-time packages and design packages for Delphi 3/4/5 and
C++Builder 3/4/5 are:

  G110_R30.DPL, G110_D30.DPL          Delphi 3
  G110_R40.BPL, G110_D40.BPL          Delphi 4
  G110_R50.BPL, G110_D80.BPL          Delphi 5
  G110_R35.BPL, G110_D35.BPL          C++Builder 3
  G110_R41.BPL, G110_D41.BPL          C++Builder 4
  G110_R51.BPL, G110_D51.BPL          C++Builder 5


-- Installation --

OnGuard help and the design-time package are automatically installed into Delphi 3.0, Delphi 4.0, Delphi 5.0, C++Builder 3.0, C++Builder 4.0, and C++Builder 5.0 if OnGuard is installed using the setup program.  If you are upgrading by using a patch, you will need to use the "Install Packages" menu option to install the OnGuard design-time package (G110_DXX.DPL/BPL). In order for the run-time package (G110_RXX.DPL/BPL) to be "seen" by the IDE (and the design-time package) you need to copy it to the Windows system directory (\System for Win9x or \System32 for NT and 2000) or add the OnGuard directory to your path.

Be sure to alter the IDE's library path so that it includes the path to the OnGuard source files so that it can find the OnGuard source files. Or, add the OnGuard path to your system Path environment.


-- Help Installation --

To manually install the OnGuard help into Delphi 4 or 5, select Help|Customize on the IDE's main menu, pick Edit|Add Files, and add the ONGUARD.CNT file found in OnGuard's Help subdirectory.

To manually install the OnGuard help into C++Builder 3, 4, or 5, select Help|Customize on the IDE's main menu, pick Edit|Add Files, and add the ONGRDBCB.CNT file found in OnGuard's Help subdirectory.

To manually install the OnGuard help into Delphi 3, edit the Delphi3.cnt file (in the Delphi Help directory) and add the following line to the "index" section:

 :Index OnGuard Reference =C:\OnGuard\Help\Delphi\OnGuard.hlp

and then delete the Delphi3.cfg (in the Delphi Help directory).


-- UnInstall --

To completely uninstall OnGuard, perform the following steps:

1. Uninstall the packages from the IDE.
2. Uninstall the product using the Windows control panel "Add/Remove Programs".


-- C++ Builder header files --

The header files for C++Builder (.hpp) are not compatible between compiler versions 1.0, 3.0, 4.0, and 5.0, yet the names are the same. So OnGuard installs the header files for each selected compiler into the \OnGuard\Headers directory in a subdirectory for the appropriate compiler version.  Be sure to specify the header file directory in the compiler's include path.

You can regenerate the header files at any time using the DCC32 command line compiler with -jphn as the command line options:

\CBuilder\bin\dcc32 -M -jphn -$D- -$L- -$S- -$Y- OGREG.PAS


-- Using the OGFIRST unit in C++Builder --

The OGFIRST unit of OnGuard contains routines to check for a second instance of your application. In order to use these routines you need to manually include the OGFIRST header:

#include "OgFirst.hpp"

In addition you will need to add the OGFIRST.OBJ file to your project. Use the Add to Project option to add this file to your project. The EXINST example program demonstrates use of the OGFIRST routines.


-- Changes/Additions --

OgSrMgr unit

The string resource manager has been incorporated into OnGuard eliminating the need for an external SRMGR library.

TOgNetwork component

  Added OnGetFileName event

  TGetFileNameEvent =
    procedure(Sender : TObject; var Value : string)
    of object;

  property OnGetFileName :  TGetFileNameEvent

The OnGetFileName event is fired to obtain the name of the network access file if no file name is assigned to the FileName property. If a file name is assigned to the FileName property, OnGetFileName   is not fired. If no file name is specified in the FileName property and no method is assigned to this event, an exception is raised.


Revised help file containing help for the low-level routines used within OnGuard.

OgFirst unit

Under Delphi 1.0, minimized windows were not being found and subsequent instances were allowed to run. The fix allowed the removal of the two parameters to the call to ActivateFirstInstance so that now the 16 and 32-bit versions have the same calling syntax. See Source for changes.

TOgProtectExe component

Added a new status value to the TExeStatus enumerated data type used by several methods and internal routines to indicate the status of the test performed on the EXE file. exeAccessDenied is now returned if the file can not be opened due to a sharing error. Prior to this change exeIntegrityError was returned if the EXE file could not be opened.


Added CreateMachineID routine
  function CreateMachineID(MachineInfo : TEsMachineInfoSet) : LongInt;
  TEsMachineInfoSet = set of (midUser, midSystem, midNetwork, midDrives);

This function allows you to choose which factors to use when creating the machine identifier. midUser includes the use of the user and company name (if available -- not available under Win16). midSystem includes use of system specific information obtained by using the GetSystemInfo API. midNetwork includes the network card ID (if available). midNetwork should only be used while attached to a network since some versions of Windows NT 4 produce different network ID's after each boot.  midDrives includes the capacities and serial numbers of each of the local drives.

***NOTE***
A correction to the routine that generates machine identifiers will cause the routine to return different values than were returned in prior versions. Applications using machine identifiers may require new release codes because of this change.


-- Corrections to the Manual --

p.3 - Delete the last sentence in the third paragraph. Delete the second to the last paragraph (Starts with "The EXSMREG...").

p.7 - Change all occurrences OGHLP32 to ONGUARD p.40 The default value for the AutoCheck property is "True" p.48,52,56,58,60,63 Remove the "book" icon to the left of IsCodeValid 
p.70 - Add to StampExe description: As an alternative to using a TOgProtectComponent to provide this method, the ProtectExe function is also provided in the OgProExe unit. Its parameters are the same as those of the StampExe method.

p.70 - Add to UnStampExe description: As an alternative to using a TOgProtectComponent to provide this method, the UnprotectExe function is also provided in the OgProExe unit. Its parameters are the same as those of the UnStampExe method.


-- Corrections to the Manual Supplement --

p.20 - The section of code shown in step 19. fails to create the IniFile object prior to using it. Add code similar to that of step 18 to create and destroy the TIniFile object.
