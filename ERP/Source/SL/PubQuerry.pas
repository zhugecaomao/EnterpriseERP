unit PubQuerry;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TPubQuerryForm = class(TWSVoucherBrowseForm)
  adsQuerryMAster: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  PubQuerryForm: TPubQuerryForm;

implementation

uses CommonDM;

{$R *.dfm}

function TPubQuerryForm.CreateEditForm: TWSEditForm;
begin
//  Result := TSLEdSaleBillForm.Create(Self);
end;

end.
