unit VoucherQuery;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSBrowse, ComCtrls, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ExtCtrls, ToolWin, ADODB, StdCtrls, Menus,TypInfo;

type
  TVoucherQueryForm = class(TWSBrowseForm)
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    Timer: TTimer;
    Panel2: TPanel;
    adsMaster: TADODataSet;
    ToolButton10: TToolButton;
    procedure DBGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TabSheetShow(Sender: TObject);
    procedure RefreshActionExecute(Sender: TObject);
    procedure FormClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure UpdateGrid;
  end;

procedure ShowQueryForm(const TabSheet1Caption,QuerryCaption,ACommandText: string);

implementation

uses CommonDM;

{$R *.dfm}

procedure ShowQueryForm(const TabSheet1Caption,QuerryCaption,ACommandText: string);
var I :integer;
begin
  with TVoucherQueryForm.Create(Application) do
  try
    Caption := QuerryCaption;
    TabSheet1.Caption :=TabSheet1Caption;
    adsMaster.Close;
    adsMaster.CommandType := cmdText;
    adsMaster.CommandText := ACommandText;
    adsMaster.Open;
    if adsMaster.IsEmpty then
    begin
      Showmessage('  动作：'+QuerryCaption+#13+#13+'      无业务数据显示！');
      exit;
    end;
//    VoucherQueryForm.
    height :=450;
    width := 760;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TVoucherQueryForm.DBGridDblClick(Sender: TObject);
begin
//  inherited;
   UpdateGrid;
end;

procedure TVoucherQueryForm.UpdateGrid;
var
  I: Integer;
  Field: TField;
  Balance:real;
begin
  inherited;

  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    for I := 1 to Columns.Count - 1 do
    begin
      Columns[i].Title.Alignment:= taCenter;
      Columns[i].Width :=90;
      if Pos('日',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Pos('编',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Columns[I].Field is TNumericField then
      begin
        SetStrProp(Fields[I], 'DisplayFormat','#,#.00') ;
        if Pos('Price',Columns[I].FieldName)<=0 then
          Columns[I].Footer.ValueType := fvtSum;
        Columns[I].Width :=90;
      end;
    end;
    FooterRowCount := 1;
  end;

end;

procedure TVoucherQueryForm.FormShow(Sender: TObject);
begin
  inherited;
  UpdateGrid;
end;

procedure TVoucherQueryForm.TabSheetShow(Sender: TObject);
begin
  inherited;
  UpdateGrid;
  if adsMaster.IsEmpty then
  begin
    Panel2.Left :=ROUND((DBGrid.Width-Panel2.Width)/2 );
    Panel2.top :=ToolBar.Height+Panel2.Height;
    Panel2.Visible :=true;
    Panel2.Caption :='当前窗体没有数据，系统将自动关闭此窗体！'  ;
    Panel2.Repaint;
  end;
end;



procedure TVoucherQueryForm.RefreshActionExecute(Sender: TObject);
begin
  inherited;
  UpdateGrid;
end;

procedure TVoucherQueryForm.FormClick(Sender: TObject);
begin
  inherited;
  UpdateGrid;
end;

procedure TVoucherQueryForm.TimerTimer(Sender: TObject);
begin
  inherited;
  Timer.Interval :=30000;
  Timer.Enabled :=False;
  if adsMaster.IsEmpty then    close;
end;


end.
