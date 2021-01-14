unit WSRptFrm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, DB, ToolWin, ComCtrls, ActnList;

type
  TWSReportForm = class(TWSCustomForm)
    ActionList: TActionList;
    ViewDetailsAction: TAction;
    PrintPreviewAction: TAction;
    PrintAction: TAction;
    ExportAction: TAction;
    FiltrateAction: TAction;
    RefreshAction: TAction;
    ExitAction: TAction;
    ToolBar: TToolBar;
    DataSource: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  WSReportForm: TWSReportForm;

implementation

{$R *.dfm}

end.
