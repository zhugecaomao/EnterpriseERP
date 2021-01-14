unit AboutRQ;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, About, StdCtrls, ExtCtrls;

type
  TAboutFormRQ = class(TAboutForm)
    Label1: TLabel;
    Label2: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AboutFormRQ: TAboutFormRQ;

implementation

{$R *.dfm}

end.
