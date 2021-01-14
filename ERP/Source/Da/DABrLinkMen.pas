unit DABrLinkMen;
{******************************************
项目：
模块：联系人详细资料管理
日期：2002年11月13日
作者：贺才伟
更新：
******************************************}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSBrowse, DB, ActnList, ToolWin, ComCtrls, Grids, DBGrids,
  QLDBGrid, ADODB,CommonDM,MSEdUser,WSEdit,MSEdUserTerm, ExtCtrls, StdCtrls,
  Menus;

type
  TDALinkMenBrowseForm = class(TWSBrowseForm)
    TabSheet2: TTabSheet;
    tbtAdd: TToolButton;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    RolePermissionsAction: TAction;
    ToolButton6: TToolButton;
    ToolButton8: TToolButton;
    ToolButton7: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    adsDALinkMode: TADODataSet;
    adsDASocialRelations: TADODataSet;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    adsDALivePlace: TADODataSet;
    adsDAEducation: TADODataSet;
    adsDALoveHabits: TADODataSet;
    adsDABiologyIndex: TADODataSet;
    adsDAHealthBill: TADODataSet;
    adsDAJobRecord: TADODataSet;
    adsDALinkModeID: TAutoIncField;
    adsDALinkModeCreateDate: TDateTimeField;
    adsDALinkModeCreateUserID: TIntegerField;
    adsDALinkModeRecordState: TStringField;
    adsDALinkModeLinkMenID: TIntegerField;
    adsDALinkModeLikeMode: TStringField;
    adsDALinkModePhoneZip: TStringField;
    adsDALinkModeLinkPlace: TStringField;
    adsDALinkModeMemo: TStringField;
    adsDASocialRelationsID: TAutoIncField;
    adsDASocialRelationsLinkMenID: TIntegerField;
    adsDASocialRelationsName: TStringField;
    adsDASocialRelationsPost: TStringField;
    adsDASocialRelationsDeportment: TStringField;
    adsDASocialRelationsPoliteTitle: TStringField;
    adsDASocialRelationsBirthDate: TDateTimeField;
    adsDASocialRelationsSpecialDate: TDateTimeField;
    adsDASocialRelationsNickName: TStringField;
    adsDASocialRelationsHabitLove: TStringField;
    adsDASocialRelationsPostDate: TDateTimeField;
    adsDASocialRelationsLeaveDate: TDateTimeField;
    adsDASocialRelationsMemo: TStringField;
    adsDALivePlaceID: TAutoIncField;
    adsDALivePlaceLinkMenID: TIntegerField;
    adsDALivePlaceliveMode: TStringField;
    adsDALivePlaceAddress: TStringField;
    adsDALivePlacePostZip: TStringField;
    adsDALivePlaceLocationMan: TStringField;
    adsDALivePlacePoliteTitle: TStringField;
    adsDALivePlaceStartDate: TDateTimeField;
    adsDALivePlaceLeaveDate: TDateTimeField;
    adsDALivePlacePhone: TStringField;
    adsDALivePlaceMemo: TStringField;
    adsDAEducationID: TAutoIncField;
    adsDAEducationLinkMenID: TIntegerField;
    adsDAEducationEducationClass: TStringField;
    adsDAEducationEducationMode: TStringField;
    adsDAEducationProfessional: TStringField;
    adsDAEducationInstitute: TStringField;
    adsDAEducationProfessor: TStringField;
    adsDAEducationStartDate: TDateTimeField;
    adsDAEducationLeaveDate: TDateTimeField;
    adsDAEducationPayMode: TStringField;
    adsDAEducationPaySelf: TFloatField;
    adsDAEducationMemo: TStringField;
    adsDALoveHabitsID: TAutoIncField;
    adsDALoveHabitsLinkMenID: TIntegerField;
    adsDALoveHabitsName: TStringField;
    adsDALoveHabitsBrief: TStringField;
    adsDALoveHabitsDegree: TStringField;
    adsDALoveHabitsMemo: TStringField;
    adsDABiologyIndexID: TAutoIncField;
    adsDABiologyIndexLinkMenID: TIntegerField;
    adsDABiologyIndexName: TStringField;
    adsDABiologyIndexIndex: TStringField;
    adsDABiologyIndexUnits: TStringField;
    adsDABiologyIndexCheckDate: TStringField;
    adsDABiologyIndexTrustDegree: TStringField;
    adsDABiologyIndexMemo: TStringField;
    adsDAHealthBillID: TAutoIncField;
    adsDAHealthBillLinkMenID: TIntegerField;
    adsDAHealthBillDate: TDateTimeField;
    adsDAHealthBillCode: TStringField;
    adsDAHealthBillCheckClass: TStringField;
    adsDAHealthBillHospital: TStringField;
    adsDAHealthBilldoctor: TStringField;
    adsDAHealthBillMemo: TStringField;
    adsDAJobRecordID: TAutoIncField;
    adsDAJobRecordLinkMenID: TIntegerField;
    adsDAJobRecordJobClass: TStringField;
    adsDAJobRecordClientID: TIntegerField;
    adsDAJobRecordCompany: TStringField;
    adsDAJobRecordPostRank: TStringField;
    adsDAJobRecordDuty: TStringField;
    adsDAJobRecordPostDate: TDateTimeField;
    adsDAJobRecordLeaveDate: TDateTimeField;
    adsDAJobRecordManager: TStringField;
    adsDAJobRecordLinkMode: TStringField;
    adsDAJobRecordMemo: TStringField;
    ToolButton4: TToolButton;
    procedure AddNewActionExecute(Sender: TObject);
    procedure DeleteActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure adsDALinkModeBeforePost(DataSet: TDataSet);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure adsDASocialRelationsBeforePost(DataSet: TDataSet);
    procedure adsDALivePlaceBeforePost(DataSet: TDataSet);
    procedure adsDAEducationBeforePost(DataSet: TDataSet);
    procedure adsDALoveHabitsBeforePost(DataSet: TDataSet);
    procedure adsDABiologyIndexBeforePost(DataSet: TDataSet);
    procedure adsDAHealthBillBeforePost(DataSet: TDataSet);
    procedure adsDAJobRecordBeforePost(DataSet: TDataSet);
    procedure FormShow(Sender: TObject);
    procedure adsDALinkModeAfterPost(DataSet: TDataSet);
  private
    vID: String;
    { Private declarations }
  protected
  public
    function Edit(const Params: Variant): Boolean; //override;
    { Public declarations }
  end;
var
  DALinkMenBrowseForm: TDALinkMenBrowseForm;

implementation

var
  vID: string;
{$R *.dfm}
function TDALinkMenBrowseForm.Edit(const Params: Variant): Boolean;
begin
  vID := Format('%s', [VarToStr(Params)]);
  adsDALinkMode.Parameters[0].Value := vID;
  adsDASocialRelations.Parameters[0].Value := vID;
  adsDALivePlace.Parameters[0].Value := vID;
  adsDAEducation.Parameters[0].Value := vID;
  adsDALoveHabits.Parameters[0].Value := vID;
  adsDABiologyIndex.Parameters[0].Value := vID;
  adsDAHealthBill.Parameters[0].Value := vID;
  adsDAJobRecord.Parameters[0].Value := vID;
  Result := ShowModal = mrOK;
end;

procedure TDALinkMenBrowseForm.AddNewActionExecute(Sender: TObject);
begin
//  inherited;
  DataSet.Append;
  with DBGrid do
  begin
    if dgRowSelect in Options then
    begin
      Options := Options - [dgRowSelect];
      Options := Options + [dgEditing];
    end;
  end;
end;

procedure TDALinkMenBrowseForm.DeleteActionExecute(Sender: TObject);
begin
//  inherited;

end;

procedure TDALinkMenBrowseForm.EditActionExecute(Sender: TObject);
begin
//  inherited;

end;

procedure TDALinkMenBrowseForm.adsDALinkModeBeforePost(DataSet: TDataSet);
begin
  inherited;
  adsDALinkMode.FieldByName('LinkMenID').AsString := vID;
  adsDALinkMode.FieldByName('RecordState').AsString := '临时';
end;

procedure TDALinkMenBrowseForm.PageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
//  DALinkMenBrowseForm.Caption := Copy(DALinkMenBrowseForm.Caption,1,10) + ' - ' + PageControl.ActivePage.Caption;
//  DALinkMenBrowseForm.Caption := '联系人管理 - ' + PageControl.ActivePage.Caption;
  with DBGrid do
    Options := Options + [dgRowSelect] ;
end;

procedure TDALinkMenBrowseForm.adsDASocialRelationsBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  adsDASocialRelations.FieldByName('LinkMenID').AsString := vID;
end;

procedure TDALinkMenBrowseForm.adsDALivePlaceBeforePost(DataSet: TDataSet);
begin
  inherited;
  adsDALivePlace.FieldByName('LinkMenID').AsString := vID;
end;

procedure TDALinkMenBrowseForm.adsDAEducationBeforePost(DataSet: TDataSet);
begin
  inherited;
  adsDAEducation.FieldByName('LinkMenID').AsString := vID;
end;

procedure TDALinkMenBrowseForm.adsDALoveHabitsBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  adsDALoveHabits.FieldByName('LinkMenID').AsString := vID;
end;

procedure TDALinkMenBrowseForm.adsDABiologyIndexBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  adsDABiologyIndex.FieldByName('LinkMenID').AsString := vID;
end;

procedure TDALinkMenBrowseForm.adsDAHealthBillBeforePost(
  DataSet: TDataSet);
begin
  inherited;
  adsDAHealthBill.FieldByName('LinkMenID').AsString := vID;
end;

procedure TDALinkMenBrowseForm.adsDAJobRecordBeforePost(DataSet: TDataSet);
begin
  inherited;
  adsDAJobRecord.FieldByName('LinkMenID').AsString := vID;
end;

procedure TDALinkMenBrowseForm.FormShow(Sender: TObject);
begin
  inherited;
//  DALinkMenBrowseForm.Caption := '联系人管理 - ' + PageControl.ActivePage.Caption;
end;

procedure TDALinkMenBrowseForm.adsDALinkModeAfterPost(DataSet: TDataSet);
begin
  inherited;
  with DBGrid do
    Options := Options + [dgRowSelect] ;
end;

end.
