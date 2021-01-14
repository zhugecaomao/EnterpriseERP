unit MSBrCurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, ImgList, DB, ActnList, ComCtrls, ToolWin,
  Grids, DBGrids, QLDBGrid, ADODB,MSEdCurrency,WSEdit, ExtCtrls, Menus;

type
  TMSBrCurrencyForm = class(TWSStandardBrowseForm)
    adsCurrency: TADODataSet;
    adsCurrencyID: TAutoIncField;
    adsCurrencyCreateDate: TDateTimeField;
    adsCurrencyCreateUserID: TIntegerField;
    adsCurrencyRecordState: TStringField;
    adsCurrencyName: TStringField;
    adsCurrencyIsLocation: TBooleanField;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton9: TToolButton;
    ToolButton14: TToolButton;
    procedure DeleteActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

implementation

uses CommonDM;

{$R *.dfm}

function TMSBrCurrencyForm.CreateEditForm: TWSEditForm;
begin
  if PageControl.ActivePageIndex = 0 then
    Result := TMSEdCurrencyForm.Create(Application);
end;

procedure TMSBrCurrencyForm.DeleteActionExecute(Sender: TObject);
begin
  if adsCurrency.FieldByName('IsLocation').AsBoolean=true then
  begin
    showmessage('对不起！本位币不能删除！')
  end
  else
    inherited;
end;

procedure TMSBrCurrencyForm.FormShow(Sender: TObject);
var aqrTemp: TADOQuery;
begin
  inherited;
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    Close;
    sql.Text := ' select top 1 * from MSCurrency where RecordState<>'+QuotedStr('删除');
    open;
    if aqrTemp.IsEmpty then
    begin
      Append;
      FieldByName('IsLocation').AsBoolean := true;
      FieldByName('Name').AsString := '人民币';
      post;
    end;
  end;
end;

procedure TMSBrCurrencyForm.FormCreate(Sender: TObject);
var
  aqrTemp: TADOQuery;
begin
  aqrTemp := TADOQuery.Create(nil);
  with aqrTemp do
  begin
    Connection := CommonData.acnConnection;
    Close;
    sql.Text := ' select top 1 * from MSCurrency where IsLocation=1 and '
      +' RecordState<>' +QuotedStr('删除');
    open;
    if aqrTemp.IsEmpty then
    begin
      aqrTemp.Close;
      aqrTemp.sql.Text := ' Insert Into MSCurrency (IsLocation,Name) '
        +' Values ( 1,'+QuotedStr('人民币')+' )';
      aqrTemp.ExecSQL;
    end;
  end;
  inherited;    
end;

end.

