unit FNBrClearPC;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TFNBrClearPCForm = class(TWSVoucherBrowseForm)
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
    adsSLBrClearBill: TADODataSet;
    adsSLBrClearBillid: TAutoIncField;
    adsSLBrClearBillDSDesigner: TDateTimeField;
    adsSLBrClearBillDSDesigner2: TStringField;
    adsSLBrClearBillDSDesigner3: TStringField;
    adsSLBrClearBillDSDesigner8: TStringField;
    adsSLBrClearBillDSDesigner9: TStringField;
    adsSLBrClearBillDSDesigner10: TStringField;
    adsSLBrClearBillDSDesigner4: TStringField;
    adsSLBrClearBillDSDesigner7: TStringField;
    adsSLBrClearBillClientID: TIntegerField;
    adsSLBrClearBillEmployeeID: TIntegerField;
    adsSLBrClearBillDSDesigner12: TStringField;
    adsSLBrClearBillDSDesigner6: TBCDField;
    adsSLBrClearBillDSDesigner5: TBCDField;
    adsSLBrClearBillRecordState: TStringField;
    WakeTimer: TTimer;
    ToolButton14: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddNewActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure WakeTimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FNBrClearPCForm: TFNBrClearPCForm;

implementation

uses CommonDM ,FNEdClearPC,FNEdClearPCFRG,VoucherQuery,WSSecurity;

{$R *.dfm}

function TFNBrClearPCForm.CreateEditForm: TWSEditForm;
begin
  if Guarder.ForeignCurrencyFlag='是' then
     Result := TFNEdClearPCFRGForm.Create(Self)
    else Result := TFNEdClearPCForm.Create(Self);
end;

procedure TFNBrClearPCForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsSLBrClearBill.Close;
  adsSLBrClearBill.Open;
  WakeTimer.Enabled :=true;
end;

procedure TFNBrClearPCForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsSLBrClearBill.close;
end;

procedure TFNBrClearPCForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsSLBrClearBill.Requery();
end;

procedure TFNBrClearPCForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsSLBrClearBill.Requery();
end;



procedure TFNBrClearPCForm.WakeTimerTimer(Sender: TObject);
var datestr,datestr1 :string;
begin
  inherited;
  DateStr :=Datetostr(Date);
  DateStr1 :=Datetostr(Date+15);
  WakeTimer.Enabled :=false;
  ShowQueryForm('近半月到期应付款提醒......','近期应付款资料',
    ' select * from ( select '
    +' a.Code as [编号], a.Date [日期], a.BillMode [业务类别],  '
    +' isnull(a.ClearDate,a.Date) [结算日期], a.Apportion [分摊要求], '
    +' a.Deliver [送货要求], a.Memo [备注],b.name as [厂商名称] '
    +' ,c.name as [经手人], A.SundryFee*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)  as [附加费用] , '
    +' ttl.Amount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [金额] , '
    +' ttl.Discount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [折扣金额], '
    +' a.Recordstate as [凭单状态]       '
    +' from PCPurchaseMaster a               '
    +' left outer join  DAClient b on b. ID=a.ClientID '
    +' left outer join  MSEmployee  c on c.id=a. EmployeeID '
    +' left outer join                                       '
    +' (select masterID, (sum(isnull(Amount,0))+Sum(Isnull(TaxAmount,0))+ '
    +' Sum(Isnull(SundryFee,0))) as Amount ,sum(isnull(Discount,0)) as '
    +' Discount from PCPurchaseDetail group by masterId  ) as ttl '
    +' on ttl.masterID=a.id '
    +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')
    +' and a.BillMode not like '+ Quotedstr('%现款%')
    +' ) as a '
    +' where a.[结算日期]>= '
    +Quotedstr(Datestr) +' and a.[结算日期]<='+ Quotedstr(Datestr1)
    +' order by a.[日期] DESC ' );
end;
end.
