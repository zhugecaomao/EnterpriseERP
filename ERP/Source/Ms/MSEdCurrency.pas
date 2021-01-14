unit MSEdCurrency;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, ExtCtrls, DB, ADODB;

type
  TMSEdCurrencyForm = class(TWSStandardEditForm)
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    edName: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    aqrCurrency: TADOQuery;
    aqrTemp: TADOQuery;
    procedure CancelButtonClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    OpType: integer; //0:编辑 1:增加
    vID: string;
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

var
  MSEdCurrencyForm: TMSEdCurrencyForm;

implementation

uses CommonDM;

{$R *.dfm}

function TMSEdCurrencyForm.Edit(const Params: Variant): Boolean;
begin
  vID := Format('%s', [VarToStr(Params)]);
  with aqrCurrency do
  begin
    close;
    sql.Text := 'select * from MSCurrency where ID=' + vID;
    open;
    edName.Text := FieldByName('Name').AsString;
    RadioButton1.Checked := FieldByName('IsLocation').AsBoolean;
    if FieldByName('IsLocation').AsBoolean then
    begin
      RadioButton1.Enabled := false;
      RadioButton2.Enabled := false;
    end;
    OpType := 0;
  end;
  Result := ShowModal = mrOK;
end;

function TMSEdCurrencyForm.Enter: Boolean;
begin
  edName.Text := '';
  OpType := 1;
  Result := ShowModal = mrOK;
end;

procedure TMSEdCurrencyForm.CancelButtonClick(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TMSEdCurrencyForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  with aqrCurrency do
  begin
    if OpType = 0 then//0:编辑
    begin
      with aqrTemp do
      begin
        close;
        sql.Text := 'select * from MSCurrency where ID<>' + vID + ' and Name=''' + trim(edName.Text) + '''';
        open;
        if not IsEmpty then
        begin
          showmessage('币种“' + edName.Text + '”已经存在！');
          edName.SetFocus;
          exit;
        end;
        if RadioButton1.Checked and RadioButton1.Enabled  then//处理本位币
        begin
          close;
          sql.Text := 'update MSCurrency set IsLocation=0 where IsLocation=1 and ID<>' + vID;
          execsql;
        end;
      end;
      Edit;
    end
    else //1:增加
    begin
      with aqrTemp do
      begin
        close;
        sql.Text := 'select * from MSCurrency where Name=''' + trim(edName.Text) + '''';
        open;
        if not IsEmpty then
        begin
          showmessage('币种“' + edName.Text + '”已经存在！不能重复添加！');
          edName.SetFocus;
          exit;
        end;
        if RadioButton1.Checked then
        begin
          close;
          sql.Text := 'update MSCurrency set IsLocation=0 where IsLocation=1';
          execsql;
        end;
      end;
      close;
      sql.Text := 'select * from MSCurrency where 1<>1';
      open;
      Append;
    end;
    FieldByName('IsLocation').AsBoolean := RadioButton1.Checked;
    FieldByName('Name').AsString := edName.Text;
    post;
  end;
  ModalResult := mrOK;
end;

procedure TMSEdCurrencyForm.FormShow(Sender: TObject);
begin
  inherited;
  edName.SetFocus;
end;

end.

