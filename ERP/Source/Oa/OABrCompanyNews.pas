unit OABrCompanyNews;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid, WSEdit,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TOABrCompanyNewsForm = class(TWSStandardBrowseForm)
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
    ADODataSet1: TADODataSet;
    ADODataSet1ID: TAutoIncField;
    ADODataSet1CreateDate: TDateTimeField;
    ADODataSet1CreateUserID: TIntegerField;
    ADODataSet1RecordState: TStringField;
    ADODataSet1Date: TDateTimeField;
    ADODataSet1Code: TStringField;
    ADODataSet1DocTypeID: TIntegerField;
    ADODataSet1BusTypeID: TIntegerField;
    ADODataSet1DocHead: TStringField;
    ADODataSet1DocText: TMemoField;
    ADODataSet1DocAdd: TBytesField;
    ADODataSet1Memo: TStringField;
    ADODataSet1DocType: TStringField;
    ADODataSet1BusType: TStringField;
    ToolButton14: TToolButton;
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  OABrCompanyNewsForm: TOABrCompanyNewsForm;

implementation

uses CommonDM, OAEdCompanyNews;

{$R *.dfm}

function TOABrCompanyNewsForm.CreateEditForm: TWSEditForm;
begin
  Result := TOAEdCompanyNewsForm.Create(Application);
end;

end.

