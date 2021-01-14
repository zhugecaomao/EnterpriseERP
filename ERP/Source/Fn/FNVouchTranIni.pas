unit FNVouchTranIni;
{******************************************
项目：
模块：用户授权管理
日期：2002年11月5日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardEdit, StdCtrls, DB, ADODB, ComCtrls, CommonDM, Grids,
  DBGrids, QLDBGrid, CheckLst, ExtCtrls, QLDBLkp, DBCtrls, Menus;

type
  TFNVouchTranIniForm = class(TWSStandardEditForm)
    VouchTranIniQry: TADOQuery;
    VouchTranIniDS: TDataSource;
    VouchTranIniQryID: TAutoIncField;
    VouchTranIniQryCreateDate: TDateTimeField;
    VouchTranIniQryCreateUserID: TIntegerField;
    VouchTranIniQryRecordState: TStringField;
    VouchTranIniQryDate: TDateTimeField;
    VouchTranIniQryBillName: TStringField;
    VouchTranIniQryCode: TStringField;
    VouchTranIniQryBillMode: TStringField;
    VouchTranIniQryModeDC: TIntegerField;
    VouchTranIniQryModeC: TIntegerField;
    VouchTranIniQryAccountFID: TIntegerField;
    VouchTranIniQryAccountGID: TIntegerField;
    VouchTranIniQryAccountOID: TIntegerField;
    VouchTranIniQryOriginTable: TStringField;
    VouchTranIniQryMemo: TStringField;
    VouchTranIniQryPeriodID: TIntegerField;
    AccFADS: TADODataSet;
    AccGADS: TADODataSet;
    AccOADS: TADODataSet;
    AccFDS: TDataSource;
    AccGDS: TDataSource;
    AccODS: TDataSource;
    VouchTranIniQryACCFname: TStringField;
    VouchTranIniQryAccGname: TStringField;
    VouchTranIniQryAccOName: TStringField;
    QLDBGrid1: TQLDBGrid;
    AccFLookup: TQLDBLookupComboBox;
    AccGLookup: TQLDBLookupComboBox;
    AccOLookup: TQLDBLookupComboBox;
    Panel1: TPanel;
    CodeCMBX: TDBComboBox;
    TransAllPopupMenu: TPopupMenu;
    TranAllAct: TMenuItem;
    TransAllNotAct: TMenuItem;
    TempADOQuery: TADOQuery;
    AutoIncField1: TAutoIncField;
    DateTimeField1: TDateTimeField;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    DateTimeField2: TDateTimeField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    IntegerField2: TIntegerField;
    IntegerField3: TIntegerField;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    IntegerField6: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField7: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    procedure FormShow(Sender: TObject);
    procedure AccFLookupEnter(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure TranAllActClick(Sender: TObject);
    procedure TransAllNotActClick(Sender: TObject);

  private

    { Private declarations }
  public
    { Public declarations }

  end;

var
  FNVouchTranIniForm: TFNVouchTranIniForm;

implementation

{$R *.dfm}

procedure TFNVouchTranIniForm.FormShow(Sender: TObject);
begin
  inherited;
  AccFADS.Open;
  AccGADS.Open;
  AccOADS.Open;
  VouchTranIniQry.Close;
  VouchTranIniQry.SQL.Text :=' select * from FNVourchTranIni order by VouchTranNo';
  VouchTranIniQry.Open;
end;

procedure TFNVouchTranIniForm.AccFLookupEnter(Sender: TObject);
begin
  if VouchTranIniQry.Eof then
    VouchTranIniQry.First;
end;

procedure TFNVouchTranIniForm.OKButtonClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFNVouchTranIniForm.TranAllActClick(Sender: TObject);
begin
  inherited;
  TempADOQuery.Close;
  TempADOQuery.SQL.Text :=' Update FNVourchTranIni set Code=' +Quotedstr('是');
  TempADOQuery.ExecSQL;
  VouchTranIniQry.Requery();
end;

procedure TFNVouchTranIniForm.TransAllNotActClick(Sender: TObject);
begin
  inherited;
  TempADOQuery.Close;
  TempADOQuery.SQL.Text :=' Update FNVourchTranIni set Code=' +Quotedstr('否');
  TempADOQuery.ExecSQL;
  VouchTranIniQry.Requery();
end;

end.
