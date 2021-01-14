unit SLBrContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,WSEdit,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TSLBrContractForm = class(TWSStandardBrowseForm)
    adsSlContract: TADODataSet;
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
    adsSlContractID: TAutoIncField;
    adsSlContractDSDesigner: TDateTimeField;
    adsSlContractDSDesigner2: TStringField;
    adsSlContractDSDesigner3: TStringField;
    adsSlContractDSDesigner5: TStringField;
    adsSlContractDSDesigner6: TStringField;
    adsSlContractDSDesigner7: TDateTimeField;
    adsSlContractDSDesigner8: TDateTimeField;
    adsSlContractDSDesigner9: TBCDField;
    adsSlContractDSDesigner10: TMemoField;
    adsSlContractDSDesigner11: TStringField;
    adsSlContractDSDesigner4: TStringField;
    adsSlContractRecordState: TStringField;
    ToolButton14: TToolButton;
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  SLBrContractForm: TSLBrContractForm;

implementation

uses CommonDM, SLEdContract;

{$R *.dfm}

function TSLBrContractForm.CreateEditForm: TWSEditForm;
begin
  Result := TSLEdContractForm.Create(Application);
end;

end.

