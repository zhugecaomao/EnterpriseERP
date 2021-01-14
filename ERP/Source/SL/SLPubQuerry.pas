unit SLPubQuerry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB;

type
  TSLPubQuerryFrom = class(TWSVoucherBrowseForm)
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
    adsPubQuerry: TADODataSet;
    procedure DBGridDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  SLPubQuerryFrom: TSLPubQuerryFrom;

implementation

uses CommonDM ;

{$R *.dfm}

function TSLPubQuerryFrom.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdClearBillAForm.Create(Self);
end;

procedure TSLPubQuerryFrom.DBGridDblClick(Sender: TObject);
var I:integer;
begin
//  inherited;
  with DBGrid do
  begin
    FooterRowCount := 1;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := 'ºÏ¼Æ:';
    Columns[0].Footer.Alignment := taCenter;
    for I := 0 to Columns.Count -  1 do
    begin
      Columns[I].Width :=120;
      if Columns[I].Field is TNumericField
             then  Columns[I].Footer.ValueType := fvtSum;
    end;
  end;
//  adsPubQuerry.Requery();
end;

end.
