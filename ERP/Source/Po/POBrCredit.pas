unit POBrCredit;
{******************************************
项目：
模块：采购信用管理
日期：2002年11月12日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, CommonDM, ADODB, WSEdit;

type
  TPOCreditBrowseForm = class(TWSStandardBrowseForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton15: TToolButton;
    adsCredit: TADODataSet;
    adsCreditID: TAutoIncField;
    adsCreditCreateDate: TDateTimeField;
    adsCreditCreateUserID: TIntegerField;
    adsCreditRecordState: TStringField;
    adsCreditDate: TDateTimeField;
    adsCreditCode: TStringField;
    adsCreditClientID: TStringField;
    adsCreditCreditClass: TStringField;
    adsCreditQuotaAmount: TBCDField;
    adsCreditQuotaAmountMax: TBCDField;
    adsCreditQuotaAmountMin: TBCDField;
    adsCreditStartDate: TDateTimeField;
    adsCreditExpireDate: TDateTimeField;
    adsCreditMeno: TStringField;
    adsCreditPeriodID: TIntegerField;
    adsCreditClientName: TStringField;
    adsCreditPeriodName: TStringField;
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  POCreditBrowseForm: TPOCreditBrowseForm;

implementation

uses POEdCredit;

{$R *.dfm}
function TPOCreditBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TPOCreditEditForm.Create(Application);
end;

end.
