{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit myEURpt;

interface


{ By removing the 'x' which begins each of these compiler directives,
  you can enable different functionality within the end-user reporting
  solution.

  DADE - the data tab where queries can be created by the end-user

  BDE  - BDE support for the Query Tools

  ADO  - ADO support for the Query Tools

  IBExpress - Interbase Express support for the Query Tools

  RAP -  the calc tab, where calculations can be coded at run-time
         (RAP is included with ReportBuilder Enterprise)

  CrossTab - adds the CrossTab component to the component palette in the
             report designer.

  CheckBox - adds a checkbox component to the component palette in the
         report designer.

  TeeChart - adds a teechart component to the report designer component
         palette. You must have TeeChart installed. More information
         is available in ..\RBuilder\TeeChart\ReadMe.doc

  UseDesignPath - determines whether the path used by the Database
         object on this form is replaced in the OnCreate event handler of
         this form with the current path.}

{$DEFINE DADE}            {remove the 'x' to enable DADE}
{x$DEFINE BDE}             {remove the 'x' to enable Borland Database Engine (BDE) }
{$DEFINE ADO}            {remove the 'x' to enable ADO}
{x$DEFINE IBExpress}      {remove the 'x' to enable Interbase Express}
{$DEFINE CrossTab}        {remove the 'x' to enable CrossTab}
{$DEFINE RAP}            {remove the 'x' to enable RAP}
{$DEFINE CheckBox}       {remove the 'x' to enable CheckBox}
{x$DEFINE TeeChart}       {remove the 'x' to enable standard TeeChart}
{x$DEFINE UseDesignPath}  {remove the 'x' to use the design-time settings of Database object on this form}

uses

{$IFDEF DADE}
  daIDE, 
{$ENDIF}

{$IFDEF BDE}
  daDBBDE,
{$ENDIF}

{$IFDEF ADO}
  daADO,
{$ENDIF}

{$IFDEF IBExpress}
  daIBExpress,
{$ENDIF}

{$IFDEF CrossTab}
  ppCTDsgn,
{$ENDIF}

{$IFDEF RAP}
  raIDE,
{$ENDIF}

{$IFDEF CheckBox}
  myChkBox,
{$ENDIF}

{$IFDEF TeeChart}
  ppChrtUI,
{$ENDIF}


  Windows, Classes, Controls, SysUtils, Forms, StdCtrls, ExtCtrls, Dialogs, Graphics,
  DB, DBTables,  ppComm, ppCache, ppClass, ppProd, ppReport, ppRptExp, ppBands,
  ppEndUsr, ppDBPipe, ppDB, ppPrnabl, ppStrtch, ppDsgnDB, ppViewr,
  ppRelatv, ppModule, Grids, DBGrids, ADODB, ppFormWrapper;

type

  TmyEndUserSolution = class(TForm)
    Shape11: TShape;
    Label6: TLabel;
    Shape12: TShape;
    Shape9: TShape;
    Label5: TLabel;
    Shape10: TShape;
    dsTable: TDataSource;
    dsField: TDataSource;
    ppDataDictionary1: TppDataDictionary;
    Shape6: TShape;
    Label7: TLabel;
    Shape5: TShape;
    ppDesigner1: TppDesigner;
    Shape4: TShape;
    Label8: TLabel;
    Shape3: TShape;
    dsItem: TDataSource;
    ppReport1: TppReport;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape15: TShape;
    Label2: TLabel;
    Shape16: TShape;
    dsFolder: TDataSource;
    btnLaunch: TButton;
    ppReportExplorer1: TppReportExplorer;
    Shape22: TShape;
    Label10: TLabel;
    Shape23: TShape;
    Shape24: TShape;
    Shape25: TShape;
    Shape26: TShape;
    Memo1: TMemo;
    pnlStatusBar: TPanel;
    Shape7: TShape;
    Shape20: TShape;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    euDatabase: TADOConnection;
    tblFolder: TADOTable;
    plFolder: TppDBPipeline;
    plItem: TppDBPipeline;
    tblItem: TADOTable;
    tblTable: TADOTable;
    tblField: TADOTable;
    plTable: TppDBPipeline;
    plField: TppDBPipeline;
    Shape29: TShape;
    Shape18: TShape;
    Shape17: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Label3: TLabel;
    Shape19: TShape;
    Label9: TLabel;
    Shape21: TShape;
    Shape27: TShape;
    Shape28: TShape;
    Label4: TLabel;
    Shape30: TShape;
    tblJoin: TADOTable;
    dsJoin: TDataSource;
    plJoin: TppDBPipeline;
    procedure FormCreate(Sender: TObject);
    procedure btnLaunchClick(Sender: TObject);
    procedure euDatabaseBeforeConnect(Sender: TObject);
    procedure ppReport1GetAutoSearchValues(Sender: TObject);
  private
    FTimer: TTimer;

    procedure TimerEvent(Sender: TObject);

    procedure LoadEndEvent(Sender: TObject);
    procedure PreviewFormCreateEvent(Sender: TObject);
  public
    SearchCriteria: string;
    procedure ShowExplorer;
  end;

var
  myEndUserSolution: TmyEndUserSolution;

implementation

uses
  ppTypes,
  ppASField;

{$R *.DFM}

{------------------------------------------------------------------------------}
{ TmyReportObjects.FormCreate }

procedure TmyEndUserSolution.FormCreate(Sender: TObject);
begin
  euDatabase.Connected := True;

  ClientHeight := btnLaunch.Top + btnLaunch.Height + pnlStatusBar.Height + 8;

  ppReport1.Template.OnLoadEnd := LoadEndEvent;
  if not IsLibrary then
  begin
    FTimer := TTimer.Create(Self);
    FTimer.Interval := 100;
    FTimer.OnTimer  := TimerEvent;
  end;
end; {procedure, FormCreate}

{------------------------------------------------------------------------------}
{ TmyReportObjects.btnLaunchClick }

procedure TmyEndUserSolution.btnLaunchClick(Sender: TObject);
begin

  if not(ppReportExplorer1.Execute) then
    begin
      pnlStatusBar.Caption := 'Error: ' + ppReportExplorer1.ErrorMessage;
      MessageBeep(0);
    end
  else
    pnlStatusBar.Caption := 'Explorer Launch Successful.'

end; {procedure, btnLaunchClick}

{------------------------------------------------------------------------------}
{ TmyEndUserSolution.TimerEvent }

procedure TmyEndUserSolution.TimerEvent(Sender: TObject);
var
  lsMessage: String;
begin
  if not IsLibrary then FTimer.Free;

 if not(ppReportExplorer1.Execute) then
    begin
      lsMessage := 'Error: ' + ppReportExplorer1.ErrorMessage;

      MessageDlg(lsMessage, mtError, [mbOK], 0);
    end;
  if IsLibrary then Release
  else Application.Terminate;
end;  {procedure, TimerEvent}

{------------------------------------------------------------------------------}
{ TmyEndUserSolution.LoadEndEvent }

procedure TmyEndUserSolution.LoadEndEvent(Sender: TObject);
begin
  ppReport1.OnPreviewFormCreate := PreviewFormCreateEvent;
end; {procedure, LoadEndEvent}

{------------------------------------------------------------------------------}
{ TmyEndUserSolution.PreviewFormCreateEvent }

procedure TmyEndUserSolution.PreviewFormCreateEvent(Sender: TObject);
begin
  ppReport1.PreviewForm.WindowState := wsMaximized;

  TppViewer(ppReport1.PreviewForm.Viewer).ZoomSetting := zs100Percent;
end; {procedure, PreviewFormCreateEvent}


procedure TmyEndUserSolution.ShowExplorer;
begin
  TimerEvent(nil);
end;

procedure TmyEndUserSolution.euDatabaseBeforeConnect(Sender: TObject);
var
  FileName: string;
begin
  // 取连接配置文件
  FileName := ChangeFileExt(ExtractFileName(Application.ExeName), '.UDL');
  if FileExists(FileName) then
    euDatabase.ConnectionString := 'FILE NAME=' + FileName;
end;

procedure TmyEndUserSolution.ppReport1GetAutoSearchValues(Sender: TObject);
var
  I: Integer;
  Params: TStringList;
  Field: TppAutoSearchField;
begin
  Params := TStringList.Create;
  try
    Params.Delimiter := ';';
    Params.DelimitedText := SearchCriteria;
    with ppReport1 do
    begin
      ShowMessage(IntToStr(AutoSearchFieldCount));
      for I := 0 to Params.Count - 1 do
      begin
        Field := AutoSearchFieldByName(Params.Names[I]);
        Showmessage(Params.Names[I]);
        if Field <> nil then
        begin
          Field.SearchOperator := soEqual;
          Field.SearchExpression := Params.Values[Params.Names[I]];
          ShowMessage(Field.FieldName);
        end;
      end;
    end;
  finally
    Params.Free;
  end;
end;

end.
