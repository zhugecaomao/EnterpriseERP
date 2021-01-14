{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit dmVolume;

interface

uses
  Classes, DB, ADODB,
  ppComm, ppRelatv, ppDB, ppDBPipe,
  rsReportVolume, rsReportVolumeReportExplorer;

type
  TDatamodule1 = class(TDataModule)
    tblFolder: TADOTable;
    dsFolder: TDataSource;
    plFolder: TppDBPipeline;
    plItem: TppDBPipeline;
    dsItem: TDataSource;
    tblItem: TADOTable;
    rsReportExplorerVolume1: TrsReportExplorerVolume;
    euDatabase: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Datamodule1: TDatamodule1;

implementation

{$R *.dfm}

{Include DADE plug-in for ADO so that reports will load successfully.}
uses
  daADO;

end.
