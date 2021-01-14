unit WSStandardEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, WSEdit;

type
  TWSStandardEditForm = class(TWSEditForm)
    CancelButton: TButton;
    OKButton: TButton;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
    function Enter: Boolean; override;
    function Edit(const Params: Variant): Boolean; override;
  end;

implementation

{$R *.dfm}

{ TWSStandardEditForm }

function TWSStandardEditForm.Edit(const Params: Variant): Boolean;
begin
 Result := False;
end;

function TWSStandardEditForm.Enter: Boolean;
begin
 Result := False;
end;

procedure TWSStandardEditForm.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
if key=#13 then
 begin
   key:=#0;
   perform(WM_NEXTDLGCTL,0,0);
 end;
end;

end.
