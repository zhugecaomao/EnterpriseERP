unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TAboutForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OKButton: TButton;
    procedure Label2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses ShellAPI;

{$R *.dfm}

procedure TAboutForm.Label2Click(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar(TLabel(Sender).Caption), nil, nil, SW_SHOWNORMAL);
end;

end.
