unit SLOrderTail;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, StdCtrls, GEdit, ExtCtrls, DB, ADODB, Grids, DBGrids,
  QLDBGrid;

type
  TSLOrderTailForm = class(TWSCustomForm)
    Panel1: TPanel;
    dsSlOrderTail: TDataSource;
    adsSlOrderTail: TADODataSet;
    DBGrid: TQLDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SLOrderTailForm: TSLOrderTailForm;

implementation
uses CommonDM;

{$R *.dfm}


end.
