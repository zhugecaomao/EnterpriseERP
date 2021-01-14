unit Order;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, DB, Grids, DBGrids, QLDBGrid, ExtCtrls,
  Buttons, ActnList, ToolWin, ComCtrls, Menus, DBActns, QLDBLkp;

type
  TOrderForm = class(TForm)
    Panel1: TPanel;
    OrderDDbg: TQLDBGrid;
    OrderDDsr: TDataSource;
    Panel3: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label6: TLabel;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    DBEdit5: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBEdit8: TDBEdit;
    ActionList1: TActionList;
    BitBtn1: TBitBtn;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    DataSetPrior1: TDataSetPrior;
    DataSetNext1: TDataSetNext;
    ToolButton5: TToolButton;
    PrintAtn: TAction;
    PrintPM: TPopupMenu;
    N1: TMenuItem;
    PrintPreviewAtn: TAction;
    N2: TMenuItem;
    ToolButton6: TToolButton;
    GoodsLCB: TQLDBLookupComboBox;
    VendorLCB: TQLDBLookupComboBox;
    P_OrderDSR: TDataSource;
    AboutButton: TBitBtn;
    ColorDialog: TColorDialog;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    SearchModeRG: TRadioGroup;
    SearchTypeRG: TRadioGroup;
    Label12: TLabel;
    AlternateColorPnl: TPanel;
    AlternateColorSB: TSpeedButton;
    Label13: TLabel;
    ColorDialog1: TColorDialog;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    FooterColorPnl: TPanel;
    FooterColorSB: TSpeedButton;
    Label14: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure P_OrderDSRDataChange(Sender: TObject; Field: TField);
    procedure GoodsLCBDropDown(Sender: TObject);
    procedure GoodsLCBCloseUp(Sender: TObject);
    procedure GoodsLCBButtonClick(Sender: TObject;
      Button: TLookupWindowBtn);
    procedure VendorLCBButtonClick(Sender: TObject;
      Button: TLookupWindowBtn);
    procedure PrintAtnExecute(Sender: TObject);
    procedure AboutButtonClick(Sender: TObject);
    procedure SearchTypeRGClick(Sender: TObject);
    procedure SearchModeRGClick(Sender: TObject);
    procedure AlternateColorSBClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FooterColorSBClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  OrderForm: TOrderForm;

implementation

uses DataMod, QLRptBld, OrderRpr, About, Math;

{$R *.dfm}

procedure TOrderForm.FormShow(Sender: TObject);
begin
  with DemoDM do
  begin
    P_OrderADS.Open;
    P_OrderDADS.Open;
  end;
end;

procedure TOrderForm.FormCreate(Sender: TObject);
begin
  AlternateColorPnl.Height := AlternateColorSB.Height;
  FooterColorPnl.Height := FooterColorSB.Height;
  with OrderDDbg do OptionsEx := OptionsEx + [dgAutoWidth];
  OrderDDbg.AlternateColor := $00FFE8FF;
  GoodsLCB.AutoDropDown := True;
end;

procedure TOrderForm.P_OrderDSRDataChange(Sender: TObject; Field: TField);
begin
  OrderDDbg.RecalcFooter;
end;

procedure TOrderForm.GoodsLCBDropDown(Sender: TObject);
begin
  with OrderDDbg do OptionsEx := OptionsEx - [dgControlArrowKeys];
end;

procedure TOrderForm.GoodsLCBCloseUp(Sender: TObject);
begin
  with OrderDDbg do OptionsEx := OptionsEx + [dgControlArrowKeys];
end;

procedure TOrderForm.GoodsLCBButtonClick(Sender: TObject;
  Button: TLookupWindowBtn);
begin
  case Button of
    lbNew: ShowMessage('在此写入新建代码');
    lbEdit: ShowMessage(Format('在此写入编辑%s代码',
      [DemoDM.P_OrderDADS.FieldByName('Goods').DisplayText]));
//    lbSetNull:
//      begin
//        DemoDM.P_OrderDADS.Edit;
//        DemoDM.P_OrderDADS.FieldByName('GoodsID').Clear;
//        GoodsLCB.CloseUp(False);
//      end;
  end;
end;

procedure TOrderForm.VendorLCBButtonClick(Sender: TObject;
  Button: TLookupWindowBtn);
begin
  case Button of
    lbNew: ShowMessage('在此写入新建代码');
    lbEdit: ShowMessage('在此写入编辑代码');
    lbSetNull:
      begin
        DemoDM.P_OrderADS.Edit;
        DemoDM.P_OrderADS.FieldByName('VendorID').Clear;
        VendorLCB.CloseUp(False);
      end;
  end;
end;

procedure TOrderForm.PrintAtnExecute(Sender: TObject);
begin
  with TQLDBGridReportBuilder.Create(Self) do
  try
    DBGrid := OrderDDbg;
    SummaryFields.Add('Cost=SUM(Cost)');
    Report := TOrderReport.Create(Self);
    Report.ReportTitle := Caption;
    AutoWidth := True;
    Active := True;
    if TAction(Sender).Tag = 1 then Report.PreviewModal
    else Report.Print;
    Active := False;
  finally
    Free;
  end;
end;

procedure TOrderForm.AboutButtonClick(Sender: TObject);
begin
  with TAboutForm.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure TOrderForm.SearchTypeRGClick(Sender: TObject);
begin
  case TRadioGroup(Sender).ItemIndex of
    0: GoodsLCB.SearchType := stAuto;
    1: GoodsLCB.SearchType := stNormal;
    2: GoodsLCB.SearchType := stPYM;
    3: GoodsLCB.SearchType := stWBM;
  end;
end;

procedure TOrderForm.SearchModeRGClick(Sender: TObject);
begin
  case TRadioGroup(Sender).ItemIndex of
    0:
      begin
        SearchTypeRG.ItemIndex := 0;
        GoodsLCB.SearchMode := smLocate;
      end;
    1:
      begin
        SearchTypeRG.ItemIndex := 2;
        GoodsLCB.SearchMode := smFilter;
      end;
  end;
end;

procedure TOrderForm.AlternateColorSBClick(Sender: TObject);
begin
  with ColorDialog do
  begin
    Color := OrderDDbg.AlternateColor;
    if Execute then
    begin
      OrderDDbg.AlternateColor := Color;
      AlternateColorPnl.Color := Color;
    end;
  end;
end;

procedure TOrderForm.CheckBox1Click(Sender: TObject);
begin
  OrderDDbg.FooterRowCount := IfThen(TCheckBox(Sender).Checked, 1, 0);
end;

procedure TOrderForm.FooterColorSBClick(Sender: TObject);
begin
  with ColorDialog do
  begin
    Color := OrderDDbg.FooterColor;
    if Execute then
    begin
      OrderDDbg.FooterColor := Color;
      FooterColorPnl.Color := Color;
    end;
  end;
end;

procedure TOrderForm.CheckBox2Click(Sender: TObject);
begin
  with OrderDDbg do
    if TCheckBox(Sender).Checked then OptionsEx := OptionsEx + [dgCurrencyView]
    else OptionsEx := OptionsEx - [dgCurrencyView]
end;

procedure TOrderForm.CheckBox3Click(Sender: TObject);
begin
  with OrderDDbg do
    CurrencyView.CurrencyTitle := TCheckBox(Sender).Checked;
end;

procedure TOrderForm.CheckBox4Click(Sender: TObject);
begin
  with OrderDDbg do
    if TCheckBox(Sender).Checked then OptionsEx := OptionsEx + [dgEnterToTab]
    else OptionsEx := OptionsEx - [dgEnterToTab]
end;

procedure TOrderForm.CheckBox5Click(Sender: TObject);
begin
  with OrderDDbg do
    if TCheckBox(Sender).Checked then OptionsEx := OptionsEx + [dgAutoWidth]
    else OptionsEx := OptionsEx - [dgAutoWidth]
end;

end.
