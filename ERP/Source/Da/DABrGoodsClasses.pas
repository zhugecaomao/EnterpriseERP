unit DABrGoodsClasses;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSTreeView, DB, ActnList, ToolWin, ComCtrls,WSEdit, ADODB, Menus;

type
  TDAGoodsClassesBrowseForm = class(TWSTreeViewForm)
    tblDAGoodBr: TADOTable;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
      protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  DAGoodsClassesBrowseForm: TDAGoodsClassesBrowseForm;

implementation

uses CommonDM, DAEdGoodsClass;

{$R *.dfm}
function TDAGoodsClassesBrowseForm.CreateEditForm: TWSEditForm;
begin
    Result := TDAGoodsClassEditForm.Create(Application);
end;

procedure TDAGoodsClassesBrowseForm.FormCreate(Sender: TObject);
var
  aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    Close;
    sql.Text := ' select top 1 * from DAGoodsClass where '
      +' RecordState<>' +QuotedStr('删除');
    open;
    if aqrTemp.IsEmpty then
    begin
      aqrTemp.Close;
      aqrTemp.sql.Text := ' Insert Into DAGoodsClass (CreateUserID,'
      +' Upid , Name) '
        +' Values ( 1,-1,'+QuotedStr('商品分类')+' )';
      aqrTemp.ExecSQL;
    end;
  end;
  inherited;

end;

end.
