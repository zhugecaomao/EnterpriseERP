unit About1111;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, ExtCtrls;

type
  TAboutFormMg = class(TWSCustomForm)
    Image: TImage;
    procedure FormDeactivate(Sender: TObject);
    procedure ImageClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowAbout;

implementation

{$R *.dfm}

procedure ShowAbout;
begin
  with TAboutForm.Create(Application) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TAboutFormMg.FormDeactivate(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TAboutFormMg.ImageClick(Sender: TObject);
begin
  inherited;
  Close;
end;

end.
