{ RRRRRR                  ReportBuilder Class Library                  BBBBB
  RR   RR                                                              BB   BB
  RRRRRR                 Digital Metaphors Corporation                 BB BB
  RR  RR                                                               BB   BB
  RR   RR                   Copyright (c) 1996-2002                    BBBBB   }

unit frmServer;

interface

uses
  Classes, Forms, Controls, StdCtrls, Graphics,
  rsServer, rsServerActiveX;

  {rsServerActiveX was added manually to the uses clause so that server
   application could be designated from the RB Services Adminstrator system tray.}

  {DataModule1 must be in AutoCreate list in order for volume to be registered.}

type
  TServerForm = class(TForm)
    rsServer1: TrsServer;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ServerForm: TServerForm;

implementation

{$R *.dfm}

procedure TServerForm.Button1Click(Sender: TObject);
begin

  rsServer1.Active := not(rsServer1.Active);

  if rsServer1.Active then
    Color := clMoneyGreen
  else
    Color := clBtnFace;

end;

end.

