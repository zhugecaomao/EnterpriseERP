unit PCBrContract;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid, WSEdit,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TPCBrContractForm = class(TWSStandardBrowseForm)
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
    AdsPCContract: TADODataSet;
    AdsPCContractDSDesigner: TDateTimeField;
    AdsPCContractDSDesigner2: TStringField;
    AdsPCContractDSDesigner3: TStringField;
    AdsPCContractDSDesigner5: TStringField;
    AdsPCContractDSDesigner6: TStringField;
    AdsPCContractDSDesigner7: TDateTimeField;
    AdsPCContractDSDesigner8: TDateTimeField;
    AdsPCContractDSDesigner9: TBCDField;
    AdsPCContractDSDesigner10: TMemoField;
    AdsPCContractID: TAutoIncField;
    AdsPCContractDSDesigner11: TStringField;
    AdsPCContractDSDesigner4: TStringField;
    AdsPCContractRecordState: TStringField;
    ToolButton14: TToolButton;
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

var
  PCBrContractForm: TPCBrContractForm;

implementation

uses CommonDM, PCEdContract;

{$R *.dfm}

function TPCBrContractForm.CreateEditForm: TWSEditForm;
begin
  Result := TPCEdContractForm.Create(Application);
end;

end.

