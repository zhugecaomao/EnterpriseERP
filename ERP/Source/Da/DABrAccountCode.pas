unit DABrAccountCode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, ToolWin, ComCtrls, Grids,
  DBGrids, QLDBGrid, WSEdit, ADODB, ExtCtrls, Menus;

type
  TDABrAccountCodeForm = class(TWSStandardBrowseForm)
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    adsDAAccountCode1: TADODataSet;
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
    adsDAAccountCode1ID: TAutoIncField;
    adsDAAccountCode1CreateDate: TDateTimeField;
    adsDAAccountCode1CreateUserID: TIntegerField;
    adsDAAccountCode1RecordState: TStringField;
    adsDAAccountCode1BusinessType: TStringField;
    adsDAAccountCode1AccountCode: TStringField;
    adsDAAccountCode1AccountName: TStringField;
    adsDAAccountCode1Name: TStringField;
    adsDAAccountCode1DebitCredit: TStringField;
    adsDAAccountCode1Memo: TStringField;
    adsDAAccountCode1currencyID: TIntegerField;
    adsDAAccountCode2: TADODataSet;
    AutoIncField1: TAutoIncField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    IntegerField2: TIntegerField;
    adsDAAccountCode3: TADODataSet;
    AutoIncField2: TAutoIncField;
    DateTimeField2: TDateTimeField;
    IntegerField3: TIntegerField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    StringField13: TStringField;
    StringField14: TStringField;
    IntegerField4: TIntegerField;
    adsDAAccountCode4: TADODataSet;
    AutoIncField3: TAutoIncField;
    DateTimeField3: TDateTimeField;
    IntegerField5: TIntegerField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    IntegerField6: TIntegerField;
    adsDAAccountCode5: TADODataSet;
    AutoIncField4: TAutoIncField;
    DateTimeField4: TDateTimeField;
    IntegerField7: TIntegerField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    IntegerField8: TIntegerField;
    adsDAAccountCode6: TADODataSet;
    AutoIncField5: TAutoIncField;
    DateTimeField5: TDateTimeField;
    IntegerField9: TIntegerField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    IntegerField10: TIntegerField;
    procedure EditActionExecute(Sender: TObject);
    procedure AddNewActionExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  DABrAccountCodeForm: TDABrAccountCodeForm;

implementation

uses CommonDM, DAEdAccountCode;

{$R *.dfm}

function TDABrAccountCodeForm.CreateEditForm: TWSEditForm;
begin
  // 根据不同页创建编辑不同的窗体
  case PageControl.ActivePageIndex of
    0..5: Result := TDAEdAccountCodeForm.Create(Application);
  end;
end;

procedure TDABrAccountCodeForm.EditActionExecute(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[i] is TADODataSet) then
    begin
      TADODataSet(Self.Components[i]).Close;
      TADODataSet(Self.Components[i]).Open;
    end;
  end;
end;

procedure TDABrAccountCodeForm.AddNewActionExecute(Sender: TObject);
var
  i: integer;
begin
  inherited;
  for i := 0 to Self.ComponentCount - 1 do
  begin
    if (Self.Components[i] is TADODataSet) then
    begin
      TADODataSet(Self.Components[i]).Close;
      TADODataSet(Self.Components[i]).Open;
    end;
  end;
end;

procedure TDABrAccountCodeForm.FormShow(Sender: TObject);
begin
  inherited;
  PageControl.ActivePageIndex :=0;
end;

end.

