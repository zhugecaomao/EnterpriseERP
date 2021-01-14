unit WSChart;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, StdCtrls, ExtCtrls, TeEngine, Series, TeeProcs, Chart,
  DBChart, DB, ADODB;

type
  TWSChartForm = class(TWSCustomForm)
    DBChart: TDBChart;
    Series: TBarSeries;
    Panel: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbXValue: TComboBox;
    cbYValue: TComboBox;
    procedure cbXValueChange(Sender: TObject);
  private
    FDataSet: TDataSet;
    procedure SetDataSet(const Value: TDataSet);
    { Private declarations }
  public
    { Public declarations }
    property DataSet: TDataSet read FDataSet write SetDataSet;
  end;

procedure ShowChartForm(ADataSet: TDataSet; const Title: string);

implementation

{$R *.dfm}

procedure ShowChartForm(ADataSet: TDataSet; const Title: string);
begin
  with TWSChartForm.Create(Application) do
  try
    DBChart.Title.Text.Text := Title;
    DataSet := ADataSet;
    ShowModal;
  finally
    Free;
  end;
end;

{ TWSChartForm }

procedure TWSChartForm.SetDataSet(const Value: TDataSet);
var
  I: Integer;
begin
  FDataSet := Value;
  cbXValue.Clear;
  cbYValue.Clear;
  for I := 0 to FDataSet.FieldCount - 1 do
  begin
    if FDataSet.Fields[I].Visible then
    begin
      cbXValue.AddItem(FDataSet.Fields[I].FieldName, FDataSet.Fields[I]);
      cbYValue.AddItem(FDataSet.Fields[I].FieldName, FDataSet.Fields[I]);
    end;
  end;
  Series.DataSource := FDataSet;
end;

procedure TWSChartForm.cbXValueChange(Sender: TObject);
begin
  inherited;
  Series.XValues.ValueSource := cbXValue.Items[cbXValue.ItemIndex];
  Series.YValues.ValueSource := cbYValue.Items[cbYValue.ItemIndex];
end;

end.
