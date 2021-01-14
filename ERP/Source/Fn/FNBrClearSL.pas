unit FNBrClearSL;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TFNBrClearSLForm = class(TWSVoucherBrowseForm)
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
    adsSLBrClearBillDSDesigner5: TBCDField;
    adsSLBrClearBillClientID: TIntegerField;
    adsSLBrClearBillEmployeeID: TIntegerField;
    adsSLBrClearBillDSDesigner12: TStringField;
    adsSLBrClearBillDSDesigner6: TBCDField;
    adsSLBrClearBillRecordState: TStringField;
    WakeTimer: TTimer;
    AdsTimer: TADODataSet;
    StringField1: TStringField;
    DateTimeField1: TDateTimeField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    BCDField1: TBCDField;
    BCDField2: TBCDField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    AutoIncField1: TAutoIncField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField9: TStringField;
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
  FNBrClearSLForm: TFNBrClearSLForm;

implementation

uses CommonDM,FNEdClearSL,VoucherQuery,FNEdClearSLFRG,WSSecurity;

{$R *.dfm}

function TFNBrClearSLForm.CreateEditForm: TWSEditForm;
begin
  if Guarder.ForeignCurrencyFlag='是' then
     Result := TFNEdClearSLFRGForm.Create(Self)
    else Result := TFNEdClearSLForm.Create(Self);
//  Result := TFNEdClearSLForm.Create(Self);
end;

procedure TFNBrClearSLForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsSLBrClearBill.Close;
  adsSLBrClearBill.Open;
  WakeTimer.Enabled :=true;
end;

procedure TFNBrClearSLForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsSLBrClearBill.close;
end;

procedure TFNBrClearSLForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsSLBrClearBill.Requery();
end;

procedure TFNBrClearSLForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsSLBrClearBill.Requery();
end;



procedure TFNBrClearSLForm.WakeTimerTimer(Sender: TObject);
var datestr,datestr1 :string;
begin
  inherited;
  DateStr :=Datetostr(Date);
  DateStr1 :=Datetostr(Date+15);
  WakeTimer.Enabled :=false;
  ShowQueryForm('近半月到期应收款提醒......','近期应收款资料',
    ' select * from ( select '
    +' a.Code as [编号], a.Date [日期], a.BillMode [业务类别],  '
    +' isnull(a.ClearDate,a.Date) [结算日期], a.Apportion [分摊要求], '
    +' a.Deliver [送货要求], a.Memo [备注],b.name as [客户名称] '
    +' ,c.name as [经手人], A.SundryFee*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1)  as [附加费用] , '
    +' ttl.Amount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [金额] , '
    +' ttl.Discount*Isnull(a.ModeDC,1)*Isnull(a.ModeC,1) as [折扣金额], '
    +' a.Recordstate as [凭单状态]       '
    +' from SLSaleMaster a               '
    +' left outer join  DAClient b on b. ID=a.ClientID '
    +' left outer join  MSEmployee  c on c.id=a. EmployeeID '
    +' left outer join                                       '
    +' (select masterID, (sum(isnull(Amount,0))+Sum(Isnull(TaxAmount,0))+ '
    +' Sum(Isnull(SundryFee,0))) as Amount ,sum(isnull(Discount,0)) as '
    +' Discount from SLSaleDetail group by masterId  ) as ttl '
    +' on ttl.masterID=a.id '
    +' WHERE  A.RECORDSTATE<>'+Quotedstr('删除')
    +' and a.BillMode not like ' + Quotedstr('%现款%')
    +' ) as a '
    +'where a.[结算日期]>= '
    +Quotedstr(Datestr) +' and a.[结算日期]<='+ Quotedstr(Datestr1)
    +' order by a.[日期] DESC ' );
end;

end.
