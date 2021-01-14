unit SLDiscountMode;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSCstFrm, StdCtrls, GEdit, ExtCtrls;

type
  TSLDiscountModeForm = class(TWSCustomForm)
    RadioGroup1: TRadioGroup;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    GEdit1: TGEdit;
    GEdit2: TGEdit;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    procedure RadioButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SLDiscountModeForm: TSLDiscountModeForm;

implementation

{$R *.dfm}

procedure TSLDiscountModeForm.RadioButton1Click(Sender: TObject);
begin
  inherited;
  GEdit1.Enabled :=RadioButton1.Checked;
  GEdit2.Enabled :=not RadioButton1.Checked;
  if not GEdit1.Enabled then
    begin
      GEdit1.Enabled :=true;
      GEdit1.text :='0.00';
      GEdit1.Enabled :=false;
    end;
    
  if not GEdit2.Enabled then
    begin
      GEdit2.Enabled :=true;
      GEdit2.text :='0.00';
      GEdit2.Enabled :=false;
    end;
end;

end.
