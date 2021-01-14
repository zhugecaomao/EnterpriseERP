unit STBrWarehouse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSTreeView, Menus, DB, ActnList, ToolWin, WSEdit,ComCtrls, ADODB;

type
  TSTBrWarehouseForm = class(TWSTreeViewForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    tblSTBrWarehouse: TADOTable;
    tblSTBrWarehouseID: TAutoIncField;
    tblSTBrWarehouseCreateDate: TDateTimeField;
    tblSTBrWarehouseCreateUserID: TIntegerField;
    tblSTBrWarehouseRecordState: TStringField;
    tblSTBrWarehouseName: TStringField;
    tblSTBrWarehouseCode: TStringField;
    tblSTBrWarehouseUpid: TIntegerField;
    tblSTBrWarehouseMemo: TStringField;
    tblSTBrWarehouseLevelCode: TStringField;
    tblSTBrWarehouseLeaderID: TIntegerField;
    tblSTBrWarehouseAddress: TStringField;
    tblSTBrWarehousePhoneFax: TStringField;
    tblSTBrWarehouseEmail: TStringField;
    tblSTBrWarehouseWeb: TStringField;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function CreateEditForm: TWSEditForm; override;
  end;

var
  STBrWarehouseForm: TSTBrWarehouseForm;

implementation

uses STEdWarehouse, CommonDM;

{$R *.dfm}

function TSTBrWarehouseForm.CreateEditForm: TWSEditForm;
begin
    Result := TSTEdWarehouseForm.Create(Application);
end;

procedure TSTBrWarehouseForm.FormCreate(Sender: TObject);
var
  aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    Close;
    sql.Text := ' select top 1 * from STWarehouse where '
      +' RecordState<>' +QuotedStr('É¾³ý');
    open;
    if aqrTemp.IsEmpty then
    begin
      aqrTemp.Close;
      aqrTemp.sql.Text := ' Insert Into STWarehouse (CreateUserID,'
      +' Upid,LeaderID,code,Name) '
        +' Values ( 1,-1,1,1,'+QuotedStr('ËùÓÐ²Ö¿â')+' )';
      aqrTemp.ExecSQL;
    end;
  end;
  inherited;

end;

end.
