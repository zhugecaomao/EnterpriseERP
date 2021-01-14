unit SLSaleSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, QLDBGrid, ExtCtrls, WSCstFrm;

type
  TSLSaleSearchForm = class(TWSCustomForm)
    dsPricequery: TDataSource;
    DBGrid: TQLDBGrid;
    Panel1: TPanel;
    Pricequery: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SLSaleSearchForm: TSLSaleSearchForm;

implementation

uses CommonDM;

{$R *.dfm}

end.
