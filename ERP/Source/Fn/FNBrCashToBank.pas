unit FNBrCashToBank;
{******************************************
项目：
模块：资金调动管理
日期：2002年10月14日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, WSEdit;

type
  TFNCashToBankBrowseForm = class(TWSVoucherBrowseForm)
    adsFNCashToBank: TADODataSet;
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
    adsFNCashToBankID: TAutoIncField;
    adsFNCashToBankCreateDate: TDateTimeField;
    adsFNCashToBankCreateUserID: TIntegerField;
    adsFNCashToBankRecordState: TStringField;
    adsFNCashToBankDate: TDateTimeField;
    adsFNCashToBankCode: TStringField;
    adsFNCashToBankBrief: TStringField;
    adsFNCashToBankOriginBillID: TIntegerField;
    adsFNCashToBankOriginBillTypeID2: TIntegerField;
    adsFNCashToBankMemo: TStringField;
    adsFNCashToBankPeriodID2: TIntegerField;
    adsFNCashToBankEmployeID: TIntegerField;
    adsFNCashToBankPeriodName: TStringField;
    adsFNCashToBankEmployeeName: TStringField;
    procedure AddNewActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  FNCashToBankBrowseForm: TFNCashToBankBrowseForm;

implementation

uses CommonDM, FNEdCashToBank;

{$R *.dfm}

function TFNCashToBankBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TFNCashToBankEditForm.Create(Application);
end;

procedure TFNCashToBankBrowseForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsFNCashToBank.Requery();
end;

procedure TFNCashToBankBrowseForm.DeleteActionExecute(Sender: TObject);
begin
  inherited;
  adsFNCashToBank.Requery();
end;

procedure TFNCashToBankBrowseForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsFNCashToBank.Requery();
end;

end.
