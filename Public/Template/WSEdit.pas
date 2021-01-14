unit WSEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm;

type
  {1 TWSEditForm 是所有编辑窗体的基础类 }
  TWSEditForm = class (TWSCustomForm)
  public
    function Edit(const Params: Variant): Boolean; virtual; abstract;
    function Enter: Boolean; overload; virtual;
    function Enter(const Params: Variant): Boolean; overload; virtual; abstract;
  end;

implementation


{$R *.dfm}

{1  }
{
********************************* TWSEditForm **********************************
}
function TWSEditForm.Enter: Boolean;
begin
  Result := Enter(Null);
end;

end.

