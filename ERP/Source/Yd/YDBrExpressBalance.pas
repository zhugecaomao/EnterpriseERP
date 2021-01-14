unit YDBrExpressBalance;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSStandardBrowse, DB, ActnList, Grids, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin, ADODB, Menus;

type
  TYDBrExpressBalanceForm = class(TWSStandardBrowseForm)
    ADODataSet1: TADODataSet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    ADODataSet2: TADODataSet;
    ADODataSet3: TADODataSet;
    ADODataSet4: TADODataSet;
    ADODataSet5: TADODataSet;
    ADODataSet2Name: TStringField;
    ADODataSet2PowerName: TBCDField;
    ADODataSet2PowerIndex: TBCDField;
    ADODataSet2Balance: TBCDField;
    ADODataSet4Name: TStringField;
    ADODataSet4Name_1: TStringField;
    ADODataSet4TotalGoalQuantity: TBCDField;
    ADODataSet4TotalCost: TBCDField;
    ADODataSet5Name: TStringField;
    ADODataSet5Name_1: TStringField;
    ADODataSet5TotalGoalQuantity: TBCDField;
    ADODataSet5TotalCost: TBCDField;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ADODataSet1ID: TAutoIncField;
    ADODataSet1CreateDate: TDateTimeField;
    ADODataSet1CreateUserID: TIntegerField;
    ADODataSet1RecordState: TStringField;
    ADODataSet1Code: TStringField;
    ADODataSet1Date: TStringField;
    ADODataSet1Brief: TStringField;
    ADODataSet1PlanID: TIntegerField;
    ADODataSet1Memo: TStringField;
    ADODataSet3Name: TStringField;
    ADODataSet3Unitl: TStringField;
    ADODataSet3TotalGoalQuantityIN: TBCDField;
    ADODataSet3TotalCostIN: TBCDField;
    ADODataSet3TotalGoalQuantityOut: TBCDField;
    ADODataSet3TotalCostOut: TBCDField;
    ADODataSet3TotalBalance: TBCDField;
    ADODataSet3CostBalance: TBCDField;
    procedure TabSheetShow(Sender: TObject);
    procedure DBGridDblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure UpdateGridFooter;
    procedure FormCreate(Sender: TObject);
    procedure PageControlChanging(Sender: TObject;
      var AllowChange: Boolean);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  YDBrExpressBalanceForm: TYDBrExpressBalanceForm;

implementation

uses CommonDM;

{$R *.dfm}

procedure TYDBrExpressBalanceForm.TabSheetShow(Sender: TObject);
begin
  inherited;
  case pagecontrol.ActivePageIndex of
    0: begin
         DataSource.DataSet:=ADODataSet1;

       end;
    1: begin
         DataSource.DataSet:=ADODataSet2;
                  UpdateGridFooter;
       end;
    2: begin
            DataSource.DataSet:=ADODataSet3;
                     UpdateGridFooter;
       end;
    3: begin
                 DataSource.DataSet:=ADODataSet4;
                  UpdateGridFooter;
       end;
    4: begin
         DataSource.DataSet:=ADODataSet5;
                  UpdateGridFooter;
        end;
    end;
end;

procedure TYDBrExpressBalanceForm.DBGridDblClick(Sender: TObject);
begin
 // inherited;

if not adodataset1.IsEmpty
then begin
        try

        //操作adodataset2
        adodataset2.close;
        adodataset2.Parameters.ParamByName('ID').Value:=
           adodataset1.fieldbyname('ID').Value;
         adodataset2.Open;
         //操作adodataset2




       //  操作adodataset3
        adodataset3.Close;
       adodataset3.Parameters.ParamByName('ID').Value:=
          adodataset1.fieldbyname('ID').Value;
           adodataset3.Parameters.ParamByName('ID1').Value:=
        adodataset1.fieldbyname('ID').Value;
       adodataset3.Open;
         //操作adodataset3


         //操作adodataset4
         adodataset4.Close;
         adodataset4.Parameters.ParamByName('ID').Value:=
           adodataset1.fieldbyname('ID').Value;
         adodataset4.Open;
        //操作adodataset4



         //操作adodataset5
         adodataset5.Close;
         adodataset5.Parameters.ParamByName('ID').Value:=
           adodataset1.fieldbyname('ID').Value;
         adodataset5.Open;
        //操作adodataset5

       except
         raise;
       end;
       messagebox(handle,'该 方 案 的 效 益 平 衡 完 成 !', ' 提 示',MB_OK+MB_ICONQUESTIOn);
     end;

end;

procedure TYDBrExpressBalanceForm.FormShow(Sender: TObject);
begin
  inherited;
pagecontrol.ActivePageIndex:=0;

end;


procedure TYDBrExpressBalanceForm.UpdateGridFooter;
var
  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    for I := 0 to Columns.Count -  1 do
      if Columns[I].Field is TNumericField then
      if Pos('Price',Columns[I].FieldName)<=0 then
        Columns[I].Footer.ValueType := fvtSum;

    FooterRowCount := 1;
  end;
end;

procedure TYDBrExpressBalanceForm.FormCreate(Sender: TObject);
begin
  inherited;
datasource.DataSet:=adodataset1;


end;

procedure TYDBrExpressBalanceForm.PageControlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
allowchange:=adodataset2.Active  ;
if not allowchange
then  messagebox(handle,'请 用 鼠 标 双 击 选 择 生 产 方 案!', ' 提 示',MB_OK+MB_ICONQUESTIOn);

end;

end.
