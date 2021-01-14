unit WSStandardBrowse;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, DB, ActnList, ComCtrls, ToolWin, Grids,
  DBGrids, QLDBGrid, WSEdit, WSStandardEdit, WSBrowse, ExtCtrls, Menus;

type
  TWSStandardBrowseForm = class(TWSBrowseForm)
  private
    { Private declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

{ TWSStandardBrowseForm }

function TWSStandardBrowseForm.CreateEditForm: TWSEditForm;
begin
  Result := TWSStandardEditForm.Create(Self);
end;

end.
