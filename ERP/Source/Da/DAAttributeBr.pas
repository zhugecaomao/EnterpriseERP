unit DAAttributeBr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSTreeView, DB, ActnList, ToolWin, ComCtrls,WSEdit, ADODB, Menus;

type
  TDAAttributeBrForm = class(TWSTreeViewForm)
    tblDAAttributeBr: TADOTable;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    tblDAAttributeBrID: TAutoIncField;
    tblDAAttributeBrCreateDate: TDateTimeField;
    tblDAAttributeBrCreateUserID: TIntegerField;
    tblDAAttributeBrRecordState: TStringField;
    tblDAAttributeBrUpid: TIntegerField;
    tblDAAttributeBrName: TStringField;
    tblDAAttributeBrMemo: TStringField;
    tblDAAttributeBrLevelCode: TStringField;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
  end;

var
  DAAttributeBrForm: TDAAttributeBrForm;

implementation

uses CommonDM, WSUtils, WSSecurity, DAAttributeEdit;

{$R *.dfm}

procedure TDAAttributeBrForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  tblDAAttributeBr.Close;
  action:=cafree;

end;
function TDAAttributeBrForm.CreateEditForm: TWSEditForm;
begin
    Result := TDAAttributeEditForm.Create(Application);
end;

procedure TDAAttributeBrForm.FormCreate(Sender: TObject);
var
  aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    Close;
    sql.Text := ' select top 1 * from DAAttribute where '
      +' RecordState<>' +QuotedStr('删除');
    open;
    if aqrTemp.IsEmpty then
    begin
      aqrTemp.Close;
      aqrTemp.sql.Text := ' Insert Into DAAttribute (Upid,CreateUserID,Name) '
        +' Values ( -1,0,'+QuotedStr('商品属性资料')+' )';
      aqrTemp.ExecSQL;
      {aqrTemp.Close;
      aqrTemp.sql.Text := ' Insert Into DAAttribute (Upid,CreateUserID,Name) '
        +' Values ( -1,0,'+QuotedStr('学历属性资料')+' )';
      aqrTemp.ExecSQL;  }
    end;
  end;
  inherited;

end;

end.
