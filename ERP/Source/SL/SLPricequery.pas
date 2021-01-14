unit SLPricequery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, QLDBGrid, ExtCtrls, WSCstFrm;

type
  TSLPricequeryForm = class(TWSCustomForm)
    dsQuerry: TDataSource;
    DBGrid: TQLDBGrid;
    AdsPricequery: TADODataSet;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SLPricequeryForm: TSLPricequeryForm;

implementation

uses CommonDM;

{$R *.dfm}

procedure TSLPricequeryForm.FormShow(Sender: TObject);
var   I: Integer;
begin
//  inherited;
  with DBGrid do
  begin
    FooterRowCount := 1;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := 'ºÏ¼Æ:';
    Columns[0].Footer.Alignment := taCenter;
    for I := 0 to Columns.Count -  1 do
    begin
      Columns[I].Width :=120;
      if Columns[I].Field is TNumericField
             then  Columns[I].Footer.ValueType := fvtSum;
//      AdsPricequery..FindField()
    end;
  end;
end;

end.
