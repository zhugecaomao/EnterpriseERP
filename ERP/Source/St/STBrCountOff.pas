unit STBrCountOff;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls,WSEdit, ToolWin, ADODB, Menus;

type
  TSTBrCountOffForm = class(TWSVoucherBrowseForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    tblSTBrCountOff: TADODataSet;
    tblSTBrCountOffID: TAutoIncField;
    tblSTBrCountOffCreateDate: TDateTimeField;
    tblSTBrCountOffCreateUserID: TIntegerField;
    tblSTBrCountOffRecordState: TStringField;
    tblSTBrCountOffDate: TDateTimeField;
    tblSTBrCountOffCode: TStringField;
    tblSTBrCountOffBrief: TStringField;
    tblSTBrCountOffEmployeID: TIntegerField;
    tblSTBrCountOffCountManID: TIntegerField;
    tblSTBrCountOffCheckID: TIntegerField;
    tblSTBrCountOffMemo: TStringField;
    EmployeeName: TADODataSet;
    tblSTBrCountOffCountManName: TStringField;
    tblSTBrCountOffCheckName: TStringField;
    tblSTBrCountOffEmployeeName: TStringField;
    ToolButton14: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  STBrCountOffForm: TSTBrCountOffForm;

implementation

uses CommonDM, STEdCountOff;

{$R *.dfm}

function TSTBrCountOffForm.CreateEditForm: TWSEditForm;
begin
  Result := TSTEdCountOffForm.Create(Self);
end;
procedure TSTBrCountOffForm.FormCreate(Sender: TObject);
begin

EmployeeName.Open;

  inherited;

end;

procedure TSTBrCountOffForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
EmployeeName.Close;
end;

end.
