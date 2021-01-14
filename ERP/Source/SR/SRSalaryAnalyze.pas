unit SRSalaryAnalyze;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, WSVoucherBrowse, DB, ActnList, Grids,WSEdit, DBGrids, QLDBGrid,
  ComCtrls, ExtCtrls, ToolWin,DateUtils, ADODB, StdCtrls, Buttons, Menus;

type
  TSRSalaryAnalyzeForm = class(TWSVoucherBrowseForm)
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    adsMaster: TADODataSet;
    adsMasterDSDesigner: TStringField;
    adsMasterDSDesigner2: TDateTimeField;
    adsMasterDSDesigner3: TStringField;
    adsMasterDSDesigner4: TStringField;
    adsMasterDSDesigner5: TBCDField;
    adsMasterDSDesigner6: TBCDField;
    adsMasterDSDesigner7: TBCDField;
    adsMasterDSDesigner8: TBCDField;
    adsMasterDSDesigner9: TBCDField;
    adsMasterDSDesigner10: TBCDField;
    adsMasterDSDesigner11: TBCDField;
    adsMasterDSDesigner12: TBCDField;
    adsMasterDSDesigner13: TBCDField;
    ADOQuery: TADOQuery;
    Panel2: TPanel;
    ToolButton1: TToolButton;
    procedure FormCreate(Sender: TObject);
    procedure DBGridCellClick(Column: TColumn);
    procedure DBGridDblClick(Sender: TObject);
    procedure UpdateDBGrid;

  private
    { Private declarations }
  public
    { Public declarations }
  protected
    function CreateEditForm: TWSEditForm; override;
  end;

var
  SRSalaryAnalyzeForm: TSRSalaryAnalyzeForm;

implementation

uses CommonDM ;

{$R *.dfm}

function TSRSalaryAnalyzeForm.CreateEditForm: TWSEditForm;
begin
//  Result :=;
end;



procedure TSRSalaryAnalyzeForm.FormCreate(Sender: TObject);
begin
  inherited;
  ADOQuery.Close;
  ADOQuery.SQL.Text :=' IF EXISTS(  SELECT * FROM tempdb..sysobjects '
        +' WHERE ID = OBJECT_ID('+Quotedstr('tempdb..#TempSalary')
        +' )) DROP TABLE #TempSalary ' ;
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :='CREATE TABLE #TempSalary ( '
    +' [ID] [int] IDENTITY (1, 1) NOT NULL ,[工资期间] [varchar] (30) , '
    +' [计薪日期] [datetime] NULL ,[部门名称] [varchar] (30)  ,         '
    +' [员工姓名] [varchar] (30) , [实发基本工资] [float] NULL ,     '
    +' [工龄工资] [float] NULL ,[补贴加班] [float] NULL ,         '
    +' [计件工资] [float] NULL ,[计时工资] [float] NULL ,         '
    +' [应付工资合计] [float] NULL ,[扣除项目] [float] NULL ,        '
    +' [个人所得税] [float] NULL , [实发工资] [float] NULL  )    ';
  ADOQuery.ExecSQL;
  ADOQuery.Close;
  ADOQuery.SQL.Text :='insert into #TempSalary ( [工资期间],'
    +' [计薪日期] ,[部门名称] ,  [员工姓名] , [实发基本工资],  '
    +' [工龄工资]  ,[补贴加班] ,[计件工资] ,[计时工资] ,       '
    +' [应付工资合计],[扣除项目],  [个人所得税]  , [实发工资] )'
    +' select b.brief as [工资期间],b.clearDate as [计薪日期] , '
    +' d.name as [部门名称], c.name  as [员工姓名],             '
    +' sum(isnull(a.SundryFee,0)) as [实发基本工资], '
    +' sum(isnull(a.PriceBase,0)) as [工龄工资],'
    +' sum(isnull(a.GoalQuantity,0)) as [补贴加班], '
    +' sum(isnull(a.QuantityPcs,0))  as [计件工资] ,'
    +' sum(isnull(a.TimeAmount,0))   as [计时工资], '
    +' sum(isnull(a.SalaryAmount,0)) as [应付工资合计],'
    +' sum(isnull(a.Discount,0))     as [扣除项目], '
    +' sum(isnull(a.TaxAmount,0))    as [个人所得税],  '
    +' sum(isnull(a.Payable,0))  as [实发工资]   '
    +' from  SRBaseSalaryDetail a                                  '
    +' left outer join SRBaseSalaryMaster b on b.ID=a.MasterID     '
    +' left outer join MSEmployee c on c.ID=a.GoalUnitID           '
    +' left outer join MSDepartment d on d.ID=c.DepartmentID     '
    +' where b.recordstate<>'+Quotedstr('删除')
    +' group by b.brief,b.clearDate,d.name,c.name';
  ADOQuery.ExecSQL;
  adsMaster.Close;
  adsMaster.CommandText :=' select'
        +'[工资期间], [计薪日期] ,[部门名称] ,  [员工姓名] , '
        +' [实发基本工资],[工龄工资],[补贴加班],[计件工资], '
        +' [计时工资],[应付工资合计],[扣除项目],'
        +'  [个人所得税]  ,[实发工资] '
        +' from #TempSalary '
        +' order by [计薪日期],[工资期间],[部门名称],[员工姓名] DESC';
  adsMaster.Open;
  UpdateDBGrid;
end;

procedure TSRSalaryAnalyzeForm.DBGridCellClick(Column: TColumn);
begin
  UpdateDBGrid;
end;

procedure TSRSalaryAnalyzeForm.DBGridDblClick(Sender: TObject);
begin
  UpdateDBGrid;
end;

procedure TSRSalaryAnalyzeForm.UpdateDBGrid;
var  I: Integer;
begin
  with DBGrid do
  begin
    FooterRowCount := 0;
    Columns[0].Footer.ValueType := fvtStaticText;
    Columns[0].Footer.Value := '合计:';
    Columns[0].Footer.Alignment := taCenter;
    Columns[0].Title.Alignment:= taCenter;
    for I := 1 to Columns.Count - 1 do
    begin
      Columns[i].Width :=90;
      if Pos('日',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      if Pos('编',Columns[I].FieldName)>0 then Columns[i].Width :=70;
      Columns[i].Title.Alignment:= taCenter;
      if Columns[I].Field is TNumericField then
      if Pos('Price',Columns[I].FieldName)<=0 then
        Columns[I].Footer.ValueType := fvtSum;
    end;
    FooterRowCount := 1;
  end;
end;


end.
