unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, ADODB, QLDBFlt;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOTable1: TADOTable;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    ADOTable1CustNo: TFloatField;
    ADOTable1Company: TWideStringField;
    ADOTable1Addr1: TWideStringField;
    ADOTable1Addr2: TWideStringField;
    ADOTable1City: TWideStringField;
    ADOTable1State: TWideStringField;
    ADOTable1Zip: TWideStringField;
    ADOTable1Country: TWideStringField;
    ADOTable1Phone: TWideStringField;
    ADOTable1FAX: TWideStringField;
    ADOTable1TaxRate: TFloatField;
    ADOTable1Contact: TWideStringField;
    ADOTable1LastInvoiceDate: TDateTimeField;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FFilterDialog: TQLDBFilterDialog;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  if FFilterDialog = nil then
  begin
    FFilterDialog := TQLDBFilterDialog.Create(Self);
    FFilterDialog.DataSet := ADOTable1;
    FFilterDialog.FilterFields := 'CustNo; Company; Addr1; City; State; Zip; Country; Phone; FAX; TaxRate; Contact; LastInvoiceDate';
  end;
  FFilterDialog.Execute;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  ADOTable1.Open;
end;

end.
