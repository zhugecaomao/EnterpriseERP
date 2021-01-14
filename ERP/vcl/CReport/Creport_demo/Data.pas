unit Data;

interface

uses
  SysUtils, Classes, DB,Forms, DBTables;

type
  TDataform = class(TDataModule)
    Table1: TTable;
    Table2: TTable;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Dataform: TDataform;

implementation

{$R *.dfm}

procedure TDataform.DataModuleCreate(Sender: TObject);
begin
table1.DatabaseName:=ExtractFilepath(application.ExeName);
table2.DatabaseName:=ExtractFilepath(application.ExeName);
end;

end.
