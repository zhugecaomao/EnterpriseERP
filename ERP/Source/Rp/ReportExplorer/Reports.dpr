library Reports;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Forms,
  Dialogs,
  ppASField,
  ppTypes,
  myEURpt in 'myEURpt.pas' {myEndUserSolution};

{$R *.res}

var
  OldApp: TApplication;

procedure InitLibrary(App: TApplication); stdcall;
begin
  OldApp := Forms.Application;
  Forms.Application := Application;
end;

procedure LibraryProc(Reason: Integer);
begin
  case Reason of
    0: {DLL_PROCESS_DETACH}
      begin
        Application := OldApp;
      end;
    1: {DLL_PROCESS_ATTACH};
    2: {DLL_THREAD_ATTACH};
    3: {DLL_THREAD_DETACH};
  end;
end;

procedure RunReportExplorer; stdcall;
begin
  Application.CreateForm(TmyEndUserSolution, myEndUserSolution);
  myEndUserSolution.ShowExplorer;
end;

procedure PrintReport(const ReportName: string; const AParams: string;
  const ADeviceType: string); stdcall;
var
  Params: TStrings;
  I: Integer;
  Field: TppAutoSearchField;
begin
  Application.CreateForm(TmyEndUserSolution, myEndUserSolution);
  myEndUserSolution.SearchCriteria := AParams;
  with myEndUserSolution.ppReport1, Template do
  begin
    DatabaseSettings.DataPipeline := MyEndUserSolution.plItem;
    DatabaseSettings.NameField := 'item_name';
    MyEndUserSolution.tblItem.Open;
    DatabaseSettings.Name := ReportName;
    LoadFromDatabase;
    DeviceType := ADeviceType;
    Print;
  end;
//  Params := TStringList.Create;
//  try
//    Params.Delimiter := ';';
//    Params.DelimitedText := AParams;
//    with MyEndUserSolution.ppReport1 do
//    begin
//      ShowMessage(IntToStr(AutoSearchFieldCount));
//      for I := 0 to Params.Count - 1 do
//      begin
//        Field := AutoSearchFieldByName(Params.Names[I]);
//        Showmessage(Params.Names[I]);
//        if Field <> nil then
//        begin
//          Field.SearchOperator := soEqual;
//          Field.SearchExpression := Params.Values[Params.Names[I]];
//          ShowMessage(Field.FieldName);
//        end;
//      end;
//      DeviceType := ADeviceType;
//      Print;
//    end;
//  finally
//    Params.Free;
//  end;
end;

exports
  InitLibrary ,                    //≥ı ºªØ°£
  RunReportExplorer,
  PrintReport;

begin
  DllProc := @LibraryProc;
end.

