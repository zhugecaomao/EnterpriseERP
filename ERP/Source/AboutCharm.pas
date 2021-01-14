unit AboutCharm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, About, StdCtrls, ExtCtrls;

type
  TAboutFormCharm = class(TAboutForm)
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutFormCharm: TAboutFormCharm;

implementation

{$R *.dfm}

end.
