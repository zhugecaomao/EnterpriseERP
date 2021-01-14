unit DABrClientcRelation;
{******************************************
项目：
模块：厂商资料管理
日期：2002年11月16日
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
  TDAClientcRelationBrowseForm = class(TWSStandardBrowseForm)
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
    adsDALinkMenIDCardAreaID: TIntegerField;
    adsDALinkMenIDCardEmlpoyeeID: TIntegerField;
    adsDALinkMenIDCardDSDesigner: TStringField;
    adsDALinkMenIDCardDSDesigner5: TStringField;
    adsDALinkMenIDCardDSDesigner6: TStringField;
    adsDALinkMenIDCardDSDesigner7: TStringField;
    adsDALinkMenIDCardDSDesigner24: TStringField;
    adsDALinkMenIDCardDSDesigner2: TStringField;
    adsDALinkMenIDCardDSDesigner3: TStringField;
    adsDALinkMenIDCardDSDesigner23: TStringField;
    adsDALinkMenIDCardDSDesigner25: TStringField;
    adsDALinkMenIDCardDSDesigner4: TStringField;
    adsDALinkMenIDCardDSDesigner13: TStringField;
    adsDALinkMenIDCardDSDesigner12: TStringField;
    adsDALinkMenIDCardDSDesigner11: TStringField;
    adsDALinkMenIDCardDSDesigner10: TStringField;
    adsDALinkMenIDCardDSDesigner9: TBCDField;
    adsDALinkMenIDCardDSDesigner8: TDateTimeField;
    adsDALinkMenIDCardDSDesigner14: TStringField;
    adsDALinkMenIDCardDSDesigner15: TStringField;
    adsDALinkMenIDCardDSDesigner16: TStringField;
    adsDALinkMenIDCardDSDesigner17: TStringField;
    adsDALinkMenIDCardDSDesigner18: TStringField;
    adsDALinkMenIDCardDSDesigner19: TStringField;
    adsDALinkMenIDCardDSDesigner20: TStringField;
    adsDALinkMenIDCardDSDesigner21: TStringField;
    adsDALinkMenIDCardDSDesigner22: TStringField;
    ToolButton5: TToolButton;
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  DAClientcRelationBrowseForm: TDAClientcRelationBrowseForm;

implementation

uses DAEdClient, DAEdmanufacturer, DABrClientc;

{$R *.dfm}
function TDAClientcRelationBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TDAEdmanufacturerForm.Create(Application);
end;

procedure TDAClientcRelationBrowseForm.DBGridDblClick(Sender: TObject);
begin
//  inherited;
  DAClientcBrowseForm := TDAClientcBrowseForm.Create(self);
  with DAClientcBrowseForm do
  try
    if Edit(GetEditParams) then RefreshDataSet;
  finally
    Free;
  end;
end;

end.
