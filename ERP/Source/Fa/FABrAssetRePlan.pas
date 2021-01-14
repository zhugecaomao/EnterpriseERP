unit FABrAssetRePlan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TFABrAssetRePlanForm = class(TWSVoucherBrowseForm)
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
    adsSalesMaster: TADODataSet;
    PopupMenu1: TPopupMenu;
    adsSalesMasterID: TAutoIncField;
    adsSalesMasterRecordState: TStringField;
    adsSalesMasterClientID: TIntegerField;
    adsSalesMasterEmployeeID: TIntegerField;
    adsSalesMasterDSDesigner: TStringField;
    adsSalesMasterDSDesigner2: TDateTimeField;
    adsSalesMasterDSDesigner3: TStringField;
    adsSalesMasterDSDesigner4: TStringField;
    adsSalesMasterDSDesigner5: TDateTimeField;
    adsSalesMasterDSDesigner6: TStringField;
    adsSalesMasterDSDesigner7: TStringField;
    adsSalesMasterDSDesigner8: TStringField;
    adsSalesMasterDSDesigner9: TStringField;
    adsSalesMasterDSDesigner10: TStringField;
    adsSalesMasterDSDesigner11: TBCDField;
    adsSalesMasterDSDesigner12: TStringField;
    adsSalesMasterDSDesigner13: TBCDField;
    ToolButton14: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure AddNewActionExecute(Sender: TObject);
    procedure EditActionExecute(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure FiltrateActionExecute(Sender: TObject);
    procedure UpdateDBGrid;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  FABrAssetRePlanForm: TFABrAssetRePlanForm;

implementation

uses CommonDM,FAEdAssetRePlan;

{$R *.dfm}

function TFABrAssetRePlanForm.CreateEditForm: TWSEditForm;
begin
  Result := TFAEdAssetRePlanForm.Create(Self);
end;

procedure TFABrAssetRePlanForm.FormCreate(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Open;
end;

procedure TFABrAssetRePlanForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  adsSalesMaster.Close;
end;

procedure TFABrAssetRePlanForm.AddNewActionExecute(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Requery();
end;

procedure TFABrAssetRePlanForm.EditActionExecute(Sender: TObject);
begin
  inherited;
  adsSalesMaster.Requery();
end;

procedure TFABrAssetRePlanForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  UpdateDBGrid;
end;

procedure TFABrAssetRePlanForm.UpdateDBGrid;
var  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := 'ºÏ¼Æ:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    for I := 1 to Columns.Count - 1 do
    begin
      Columns[i].Width :=90;
      if Pos('ÈÕ',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Pos('±à',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      if Pos('Price',Columns[I].FieldName)<=0 then
        Columns[I].Footer.ValueType := fvtSum;
    end;
    FooterRowCount := 1;
  end;
end;

procedure TFABrAssetRePlanForm.FiltrateActionExecute(Sender: TObject);
begin
  inherited;
  UpdateDBGrid;
end;

end.
