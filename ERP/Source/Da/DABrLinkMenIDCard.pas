unit DABrLinkMenIDCard;
{******************************************
项目：
模块：联系人管理—户籍资料
日期：2002年11月13日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, CommonDM, ADODB, WSBrowse,DABrLinkMen, WSEdit,
  Menus;

type
  TDALinkMenIDCardBrowseForm = class(TWSStandardBrowseForm)
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
    adsDALinkMenIDCard: TADODataSet;
    adsDALinkMenIDCardID: TAutoIncField;
    adsDALinkMenIDCardCreateDate: TDateTimeField;
    adsDALinkMenIDCardCreateUserID: TIntegerField;
    adsDALinkMenIDCardRecordState: TStringField;
    adsDALinkMenIDCardNationality: TStringField;
    adsDALinkMenIDCardNativePlace: TStringField;
    adsDALinkMenIDCardFolk: TStringField;
    adsDALinkMenIDCardIDCard: TStringField;
    adsDALinkMenIDCardBornPlace: TStringField;
    adsDALinkMenIDCardProvince: TStringField;
    adsDALinkMenIDCardCity: TStringField;
    adsDALinkMenIDCardCounty: TStringField;
    adsDALinkMenIDCardStreet: TStringField;
    adsDALinkMenIDCardPassport: TStringField;
    adsDALinkMenIDCardDrivingLicence: TStringField;
    adsDALinkMenIDCardResidencePlace: TStringField;
    adsDALinkMenIDCardPrivateFile: TStringField;
    adsDALinkMenIDCardName: TStringField;
    adsDALinkMenIDCardEmployeeID: TIntegerField;
    adsDALinkMenIDCardIsEmployee: TStringField;
    ToolButton5: TToolButton;
    procedure DBGridDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  protected
//    function CreateEditForm: TDALinkMenBrowseForm; override;
    function CreateEditForm: TWSEditForm; override;

  public
    { Public declarations }
  end;


var
  DALinkMenIDCardBrowseForm: TDALinkMenIDCardBrowseForm;

implementation

uses DAEdLinkMenIDCard;

{$R *.dfm}
function TDALinkMenIDCardBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TDALinkMenIDCardEditForm.Create(Application);
end;

procedure TDALinkMenIDCardBrowseForm.DBGridDblClick(Sender: TObject);
begin
//  inherited;
  DALinkMenBrowseForm := TDALinkMenBrowseForm.Create(self);
  with DALinkMenBrowseForm do
  try
    if Edit(GetEditParams) then RefreshDataSet;
  finally
    Free;
  end;

end;

procedure TDALinkMenIDCardBrowseForm.FormActivate(Sender: TObject);
begin
//  inherited;


end;

end.
