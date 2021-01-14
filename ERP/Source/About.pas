unit About;

{$I DEFINE.INC}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, ExtCtrls, StdCtrls;

type
  TAboutForm = class(TWSCustomForm)
    Image: TImage;
    Button1: TButton;
    CopyrightLbl: TLabel;
    WebLbl: TLabel;
    EmailLbl: TLabel;
    procedure FormDeactivate(Sender: TObject);
    procedure ImageClick(Sender: TObject);
    procedure WebLblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

procedure ShowAbout;

implementation

uses ShellAPI
{$IFDEF WENCN}
, AboutWencn
{$ELSE}
  {$IFDEF BOTAI}
, AboutBotai
  {$ELSE}
    {$IFDEF ESUNTEC}
, AboutESuntec
    {$ELSE}
      {$IFDEF NICE}
, AboutNice
      {$ELSE}
        {$IFDEF Charm}
, AboutCharm
        {$ELSE}
          {$IFDEF RQ}
, AboutRQ
          {$ELSE}
            {$IFDEF ZW}
,AboutZW
            {$ENDIF}
        {$ENDIF}
       {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ENDIF};

{$R *.dfm}

procedure ShowAbout;
begin
{$IFDEF WENCN}
with TAboutFormWencn.Create(Application) do
{$ELSE}
  {$IFDEF BOTAI}
with TAboutFormBotai.Create(Application) do
  {$ELSE}
    {$IFDEF ESUNTEC}
with TAboutFormEsuntec.Create(Application) do
    {$ELSE}
      {$IFDEF NICE}
with TAboutFormNice.Create(Application) do
      {$ELSE}
        {$IFDEF RQ}
with TAboutFormRQ.Create(Application) do
        {$ELSE}
          {$IFDEF Charm}
with TAboutFormCharm.Create(Application) do
          {$ELSE}
            {$IFDEF ZW}
with TAboutZWForm.Create(Application) do
            {$ELSE}
with TAboutForm.Create(Application) do
            {$ENDIF}
          {$ENDIF}
        {$ENDIF}
      {$ENDIF}
    {$ENDIF}
  {$ENDIF}
{$ENDIF}
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TAboutForm.FormDeactivate(Sender: TObject);
begin
  inherited;
//  Close;
end;

procedure TAboutForm.ImageClick(Sender: TObject);
begin
  inherited;
//  Close;
end;

procedure TAboutForm.WebLblClick(Sender: TObject);
begin
  inherited;
  ShellExecute(HWND_DESKTOP, 'OPEN', PChar(TLabel(Sender).Caption), nil, nil, SW_SHOW);
end;

end.
