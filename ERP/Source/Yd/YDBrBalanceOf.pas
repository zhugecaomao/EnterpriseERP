unit YDBrBalanceOf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,WSEdit, ADODB, Menus;

type
  TYDBrBalanceForm = class(TWSVoucherBrowseForm)
    tblYDBrBalance: TADODataSet;
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
    tblYDBrBalanceID: TAutoIncField;
    tblYDBrBalanceCreateDate: TDateTimeField;
    tblYDBrBalanceCreateUserID: TIntegerField;
    tblYDBrBalanceRecordState: TStringField;
    tblYDBrBalanceCode: TStringField;
    tblYDBrBalanceDate: TStringField;
    tblYDBrBalanceBrief: TStringField;
    tblYDBrBalancePlanID: TIntegerField;
    tblYDBrBalanceMemo: TStringField;
    ToolButton14: TToolButton;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  YDBrBalanceForm: TYDBrBalanceForm;

implementation

uses CommonDM, YDEdBalanceOf;

{$R *.dfm}

function TYDBrBalanceForm.CreateEditForm: TWSEditForm;
begin
  Result := TYDEdBalanceOfForm.Create(Self);
end;

end.
