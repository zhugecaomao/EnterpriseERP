{ 本 DataModule 只用于放置本项目公用的组件，如用于 Lookup 目的 DataSet 或 ImageList,
其它用于局部模块的组件不要放在这里 }

unit CommonDM;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider, Dialogs, QLDBFlt,
  ImgList, Controls, Forms;
                                      
type
  TCommonData = class(TDataModule)
    acnConnection: TADOConnection;
    ilVoucherSmall: TImageList;
    ilToolBtn: TImageList;
    adsDAGoods: TADODataSet;
    adsDASalesClient: TADODataSet;
    adsDAArea: TADODataSet;
    adsDAPurchaseClient: TADODataSet;
    adsMSEmployee: TADODataSet;
    adsMSDepartment: TADODataSet;
    adsMSCurrency: TADODataSet;
    adsMSPosition: TADODataSet;
    adsSTWarehouse: TADODataSet;
    adsDABillType: TADODataSet;
    adsDAClient: TADODataSet;
    adsBaseUnits: TADODataSet;
    adsMSUnit: TADODataSet;
    ADOQuery: TADOQuery;
    adsDASubject: TADODataSet;
    adsDASubjectID: TIntegerField;
    adsDASubjectSubCode: TStringField;
    adsDASubjectSubTypeID: TIntegerField;
    adsDASubjectName: TStringField;
    adsDASubjectDebitCredit: TStringField;
    procedure acnConnectionBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CommonData: TCommonData;

implementation

{$R *.dfm}  

procedure TCommonData.acnConnectionBeforeConnect(Sender: TObject);
var
  FileName: string;
begin
  // 取连接配置文件
  FileName := ChangeFileExt(ExtractFileName(Application.ExeName), '.UDL');
  if FileExists(FileName) then
    acnConnection.ConnectionString := 'FILE NAME=' + FileName
    else
      acnConnection.ConnectionString := 'FILE NAME=Soft.UDL';
//  showmessage( acnConnection.ConnectionString);
end;

procedure TCommonData.DataModuleCreate(Sender: TObject);
var StrDir :string;
begin
  if 1=2 then
  begin
    StrDir := GetCurrentDir;
//    Memo1.Text :=  '正在安装数据库，请等候！......';
//    Memo1.Repaint;
    if not DirectoryExists(StrDir+'\data') then
      if not CreateDir(StrDir+'\data') then
      raise Exception.Create('不能创建数据库文件目录');
    ADOQuery.Close;
    ADOQuery.SQL.Text :=' RESTORE DATABASE  Soft '
      +'FROM DISK ='+Quotedstr(StrDir+'\Soft.bak')+' WITH  replace , '
      +' MOVE '+Quotedstr('Soft_Data')+' TO '
      + Quotedstr(StrDir+'\data\Soft.mdf ')
      +' , MOVE '+Quotedstr('Soft_Log')+' TO '
      + Quotedstr(StrDir+'\data\Soft_log.ldf');
    ADOQuery.ExecSQL;
  end; 
//  showmessage( '数据库安装完成!');//
end;

initialization
  CurrencyString := '';

end.

