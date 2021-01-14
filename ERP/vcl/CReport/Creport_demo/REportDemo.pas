//欢迎使用，成都　李泽伦
unit REportDemo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ReportControl, StdCtrls, Db, DBTables, Grids, DBGrids,printers, Buttons,
  ExtCtrls, ExtDlgs;

type
  TCReportDemoForm = class(TForm)
    DBGrid1: TDBGrid;
    ReportRunTime1: TReportRunTime;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    opbm1: TOpenPictureDialog;
    DBGrid2: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    CheckBox1: TCheckBox;
    SpeedButton3: TSpeedButton;
    ReportControl1: TReportControl;
    DatasetToExcel1: TDatasetToExcel;
    Button6: TButton;
    procedure Button4Click(Sender: TObject);
    //procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CReportDemoForm: TCReportDemoForm;


  implementation

uses Data;

{$R *.DFM}


procedure TCReportDemoForm.Button4Click(Sender: TObject);
begin
close;
end;


procedure TCReportDemoForm.Button5Click(Sender: TObject);
begin
  //ReportRunTime1.SetDataSet('t1',dataform.table1);
  //ReportRunTime1.SetDataSet('t2',dataform.table2);

  dataform.Table1.DisableControls;
  ReportRunTime1.ReportFile:=ExtractFilepath(application.ExeName)+'creport_demo.ept';//动态填写模版内容选creport_demo1.ept
  ReportRunTime1.Setvarvalue('jgtw','金额单位:元');
  ReportRunTime1.Setvarvalue('head','********************统计表');
  ReportRunTime1.Setvarvalue('name','单位：*********');
  ReportRunTime1.PrintPreview(true); //true参数表示预览不显示非打印表格线
  dataform.Table1.EnableControls;
end;

procedure TCReportDemoForm.Button3Click(Sender: TObject);
begin

  dataform.Table1.DisableControls;
  ReportRunTime1.ReportFile:=ExtractFilepath(application.ExeName)+'creport_demo.ept';//动态填写模版内容选creport_demo1.ept
  ReportRunTime1.Setvarvalue('jgtw','金额单位:元');
  ReportRunTime1.Setvarvalue('head','********************统计表');
  ReportRunTime1.Setvarvalue('name','单位：*********');
  ReportRunTime1.Print(false); //false 代表选择打印页,true则直接打印
  dataform.Table1.EnableControls;
end;

procedure TCReportDemoForm.FormCreate(Sender: TObject);
begin
dataform.table1.open;
dataform.table2.open;
end;

procedure TCReportDemoForm.Button1Click(Sender: TObject);
var Fpicture:Tpicture;
    FBmp:TBitmap;
begin
  if opbm1.Execute then
  begin
    Fpicture:=Tpicture.Create;
    Fpicture.LoadFromFile(opbm1.filename);
    fbmp:=TBitmap.Create;
    if not (Fpicture.Graphic is Ticon) then
      fbmp.Assign(Fpicture.Graphic)
    else
    begin
      fbmp.Width := Fpicture.Icon.Width;
      fbmp.Height := Fpicture.Icon.Height;
      fbmp.Canvas.Draw(0, 0, Fpicture.Icon );
    end;
    dataform.Table1.Edit;
    dataform.Table1.FieldByName('bm').Assign(fbmp);
    dataform.Table1.post;
    Fpicture.Free;
    fbmp.Free;
  end;
end;

procedure TCReportDemoForm.Button2Click(Sender: TObject);
var Fpicture:Tpicture;
    FBmp:TBitmap;
begin
  if opbm1.Execute then
  begin
    Fpicture:=Tpicture.Create;
    Fpicture.LoadFromFile(opbm1.filename);
    fbmp:=TBitmap.Create;
    if not (Fpicture.Graphic is Ticon) then
      fbmp.Assign(Fpicture.Graphic)
    else
    begin
      fbmp.Width := Fpicture.Icon.Width;
      fbmp.Height := Fpicture.Icon.Height;
      fbmp.Canvas.Draw(0, 0, Fpicture.Icon );
    end;
    dataform.Table2.Edit;
    dataform.Table2.FieldByName('loel').Assign(fbmp);
    dataform.Table2.post;
    Fpicture.Free;
    fbmp.Free;
  end;
end;

procedure TCReportDemoForm.SpeedButton1Click(Sender: TObject);
//var i:integer;
//    l1,l2:Tstringlist;
begin
{
l1:=Tstringlist.Create;
l2:=Tstringlist.Create;
for i:=0 to dbgrid1.Columns.Count -1 do
begin
  l1.Add(dbgrid1.Columns[i].Title.caption);
  l2.Add(dbgrid1.Columns[i].fieldname);
end;
}
  ReportRunTime1.prdbgrid:=dbgrid1;  //只支持从TDbGrid派生的 dbgrid
  ReportRunTime1.previewDbGrid(self.Name);
end;

procedure TCReportDemoForm.SpeedButton2Click(Sender: TObject);
begin
ReportRunTime1.prdbgrid:=dbgrid2;
ReportRunTime1.previewDbGrid(self.name);

end;

procedure TCReportDemoForm.CheckBox1Click(Sender: TObject);
begin
if CheckBox1.Checked then
  ReportRunTime1.AddSpace:=true
else
  ReportRunTime1.AddSpace:=false;

end;

procedure TCReportDemoForm.FormPaint(Sender: TObject);
begin
CheckBox1.Checked:= ReportRunTime1.AddSpace;

end;

procedure TCReportDemoForm.SpeedButton3Click(Sender: TObject);
var j:integer;
    strFileDir:string;
    CellFont: TLogFont;
    cf: TFont;
begin
   strFileDir := ExtractFileDir(Application.ExeName);
with  ReportControl1 do
begin
   SetWndSize(1058,748);// 设置纸张大小

   NewTable(dbgrid1.Columns.Count ,6);// 创建表格

   SetCellSFocus(0,0,0,dbgrid1.Columns.Count-1);//选取0行
   CombineCell;   //合并0行单元格
   setLineHegit(0,80); //设定0行的高度
   SetCellLines(false,false,false,false,1,1,1,1); //去掉表格线
   SetCallText(0,0,'二00三年财政收支统计表');  //填0行的内容
   SetCellAlign(1, 1);//将选中行的文字居中

   cf := Tfont.Create;
   cf.Name := '楷体_GB2312';
   cf.Size := 22;
   cf.style :=cf.style+ [fsBold];
   //cf.style:=cf.style+ [fsItalic];//斜体
   //cf.style:=cf.style+ [fsunderline];//下划线
   GetObject(cf.Handle, SizeOf(CellFont), @CellFont);
   SetCellFont(CellFont); //设定字体

   for j:=0 to dbgrid1.Columns.Count -1 do //填字段名及明细表字段
   begin
     SetCallText(1,j,dbgrid1.Columns[j].FieldName);
     SetCallText(2,j,'#T1.'+dbgrid1.Columns[j].FieldName);

     RemoveAllSelectedCell;
     SetCellFocus(2,j);//

     if dbgrid1.DataSource.DataSet.FieldByName(dbgrid1.Columns[j].FieldName) is tnumericField then
     begin
       SetCellAlign(2, 1);
       SetCellDispFormt('0,.00');
    end
     else
       SetCellAlign(3, 1);

   end;
   setLineHegit(1,40); //设定第2行的高度

   RemoveAllSelectedCell;//取销选中单元格
   SetCellSFocus(1,0,1,dbgrid1.Columns.Count-1);//选择第1行进行操作
   SetCellAlign(1, 1);//将选中行的文字居中

   cf.Name := '仿宋_GB2312';
   cf.Size := 16;
   cf.Style:=[];
   GetObject(cf.Handle, SizeOf(CellFont), @CellFont);

   SetCellFont(CellFont);
   SetCellColor(clRed, clWhite);  //白底红字

   SetCallText(3,0,'合计');
   SetCallText(3,3,'`SumAll(4)'); //确定要取合计数的单元格

   RemoveAllSelectedCell;
   SetCellFocus(3,3);//选择第1行进行操作
   SetCellAlign(2, 1);
   SetCellDispFormt('0,.00');


   RemoveAllSelectedCell;
   SetCellSFocus(4,0,4,dbgrid1.Columns.Count-1); //选择最后一行
   SetCellLines(false,false,false,false,1,1,1,1); //去掉表格线
   CombineCell;                                   //合并单元格
   SetCallText(4,0,'`PageNum/');                  //本行内容为"第?/?页"样式的页码
   SetCellAlign(1, 1);                            //居中

   RemoveAllSelectedCell;//取销选中单元格
   SetCellSFocus(1,0,3,dbgrid1.Columns.Count-1);//选择第1行进行操作
   SetCellFocus(4,0);//选择第1行进行操作
   cf.Name := 'MS Serif';
   cf.Size :=10;
   cf.Style:=[];
   GetObject(cf.Handle, SizeOf(CellFont), @CellFont);
   SetCellFont(CellFont);

   RemoveAllSelectedCell;//取销选中单元格
   SetCellSFocus(5,0,5,dbgrid1.Columns.Count-1);//选择第1行进行操作
   SetCellLines(false,false,false,false,1,1,1,1); //去掉表格线
   CombineCell;                                   //合并单元格
   SetCallText(5,0,'@T2.Loel');                  //本行内容为"第?/?页"样式的页码
   setLineHegit(5,250); //设定第5行的高度

   SaveToFile(strFileDir+'\'+'xxx.ept');
   ResetContent;
   cf.Free;
end;
   //预览
   dataform.Table1.DisableControls;
   ReportRunTime1.ReportFile:=strFileDir+'\'+'xxx.ept';
   ReportRunTime1.PrintPreview(true); //true参数表示预览不显示非打印表格线
   dataform.Table1.EnableControls;

end;
procedure TCReportDemoForm.Button6Click(Sender: TObject);
begin
//将Table1存为EXcl文件
DatasetToExcel1.SaveExclFile('e:\xxx.xls',true);//第二个参数决定是否将字段名作为表头.
end;

end.
