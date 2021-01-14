QL Library
==========

欢迎使用 QL Library，如在使用中有任何疑问或问题请与我联系:

Author: Qiuliang
EMail: qiuliang@china.com
QQ: 43645896
Web: http://developer.nicesoft.net

本文档包含如下内容:

安装说明
QLDBGrid 说明
QLDBLookupComboBox 说明
QLDBReportBuilder 说明
QLDBFilterDialog 说明


安装说明
========

使用“File\Open...' 菜单项打开 Lib 目录下的组件包 QLL60.dpk (Delphi 6) 或 QLL70.dpk (Delphi 7)。在包管理器窗口点击“Compile”按钮来编译包，然后点击“Install”按钮来注册组件包。


QLDBGrid
========

介绍
----

QLDBGrid 是一款增强型的 DBGrid 组件，继承自标准 DBGrid，并增加了许多强大实用的功能，如财务金额栏，嵌入外部组件等等。

特性
----

* 中国财务凭证式的金额显示。各显示位之间的分隔线颜色可自行定义，并可在标题行上显示“...万千百十个角分”！！！ 
* 支持多种方式的合计行。支持合计、平均、计数、文本等方式的合计行。中国财务凭证式的金额显示在合计行上同样适用。合计行的颜色可自行定义！！！ 
* 可在 Grid 的各列上嵌入任意控件来代替默认编辑器，例如可在布尔型字段的列上嵌入 DBCheckBox，在一只读或计算字段的列上嵌入 DBEdit！！！ 
* 支持交替式的行颜色显示。奇数行和偶数行可定义不同的颜色 
* 自适应宽度。Grid 中的各列的宽度随 Grid 宽度的改变可自行调整宽度，使其始终填充整个 Grid 客户区域 
* 回车键转换为制表键。可将回车键当作制表键来处理，使用户敲回车键时自动转入下一列或行，输入数据更快速方便 
* 结合 TQLQRDBGridBuilder 自动生成 QuickReport 报表，省去手工制作报表的麻烦！！！ 
* 结合 TQLDBLookupComboBox 实现输入内容按拼音码查找（如同速达 E2 中的品名输入方式），而不必在大量的产品目录中来回查找或强迫用户记忆大量的产品代码！！！ 
* 继承自标准的 TDBGrid，使用 TDBGrid 或其子类开发的现有程序可实现平滑升级

简要帮助
--------

property AlternateColor: TColor;

    设置 AlternateColor 来指定 Grid 偶数行的背景颜色。
    配合 Color 属性可达到奇数行和偶数行使用不同背景颜色显示的效果。

property CurrencyView: TCurrencyView;

    设置 CurrencyView 来指定当使用财务显示方式时金额型的字段在 Grid 中的显示方式。CurrencyView 值是一个 TCurrencyView 对象。设置 CurrencyView 的属性来指定如整数位、千分位的分隔线颜色、每位的宽度、是否显示金额标题行等外观。
    先在 OptionsEx 中设置 dgCurrencyView ，再设置字段的 currency 属性为 Ture，该字段就会按财务方式显示了。

property FooterColor: TColor;

    使用 FooterColor 来读取霍更改合计行的背景颜色。

property FooterFont: TFont;

    FooterFont 属性指向一个 TFont 对象，决定合计行的显示字体

property FooterRowCount: Integer;

    设置 FooterRowCount 来指定合计行的行数，可以设置多个合计行，设置为 0 表示无合计行。(当前版本只支持最大 1 个合计行)


property OptionsEx: TQLDBGridOptionsEx;

    设置 OptionsEx 来包含所需的属性。OptionsEx 可设置如下值： 
	值 			含义 
	dgCurrencyView 		使用财务方式显示金额型的字段 
	dgAutoWidth 		自动调整各列的宽度，使之总是刚好填满整个客户区，并隐藏水平滚动条
	dgEnterToTab 		在编辑时自动将 Enter 键转换成 Tab 键，以便使用户回车时转到下一个可编辑区 
	dgAllowDelete 		允许删除用户使用 Ctrl+Del 删除当前行 
	dgAllowInsert 		允许在用户插入新的行 
	dgControlArrowKeys 	对于嵌入的控件，其方向键交由 Grid 来处理，以便在按下方向键时能够移动当前行或列

property OnDrawFooterCell: TDrawFooterCellEvent;

    编写 OnDrawFooterCell 事件处理过程来自定义合计行的绘画。使用 Canvas 属性的方法进行绘画。


使用 QLDBGrid
-------------

由于 QLDBGrid 继承自 DBGrid，因此如果不涉及到其新增功能，你完全可以用像往常使用 DBGrid 一样使用它，也完全可以将旧工程中的 DBGrid 用 QLDBGrid 替换。

按财务凭证方式显示金额栏
------------------------
首先，在双击所连接显示的 DataSet, 在字段编辑器选中金额型字段的字段并在属性编辑器中将其 currency 属性设置为 True；
然后，将 QLDBGrid 的 OptionsEx.dgCurrencyView 设置为 True 即可。此时将 DataSet.Active 属性置为 True，即可看到效果。

显示合计行
----------
首先设置 FooterRowCount 属性为 1。接着，双击 QLDBGrid，在列编辑器中加入需要显示的列，然后选择需要显示合计数的列，在属性编辑器中找到属性 Footer，将子属性 ValueType 设置为需要的合计数类型即可。

嵌入外部组件
------------
1. 在 Form 上放置将要嵌入的组件，该组件需继承自 TWinControl
2. 在字段编辑器中加入将要显示出来的所有字段
3. 双击 QLDBGrid 弹出列编辑器，并加入所有需要显示的字段
4. 在列编辑器中选择将要嵌入外部组件的列，将其 ControlType 从 ctDefault 改为 ctCustomControl，并设置 CustomControl 属性，使之指向 Form 放置的需要嵌入的组件。
5. 完成。


QLDBLookupComboBox 
==================

介绍
----

QLDBLookupComboBox 是一款增强型的 DBLookupComboBox 组件，它在标准的 DBLookupComboBox 增加了一些更方便用户快速输入数据的特性。它的大部分属性和方法跟标准 DBLookupComboBox 组件相同，因此这些属性和方法这里不再加以说明，需要的话请参考 Delphi 帮助文档。

特性 
----

弹出的列表框中的内容可按拼音码或原文（包含方式）查找！！！ 
弹出的列表框的下面可显示相应的操作按钮，如显示新建、修改、置空按钮来针对当前记录提供操作！！！ 
属性完全兼容 TDBLookupComboBox  

简要帮助
--------

property SearchMode: TSearchMode read FSearchMode write SetSearchMode;

    指定查找模式，可取如下值：
    
    smLocate    使用定位方式查找
    smFilter    使用过滤方式查找

property SearchType: TSearchType read FSearchType write FSearchType;

    值时查找类型，可取如下值：
    
    stAuto    自动决定查找类型
    smNormal  使用由 ListFieldIndex 属性指定的字段查找
    smPYM     使用由 ListFieldIndex 属性指定的字段的值的拼音码查找
    smWBM     使用由 ListFieldIndex 属性指定的字段的值的五笔码查找

property VisibleButtons: TLookupWindowBtns read FVisibleButtons write 
            SetVisibleButtons default [lbNew, lbEdit, lbSetNull];

    决定哪些按纽出现在下拉框中


property OnButtonClick: TLookupWindowBtnClick read FOnButtonClick write 
            FOnButtonClick;

在用户单击下拉列表框中的按纽时会触发该事件。参数 Index 指定当前用户点击的按钮类型，有如下值：

lbNew      用户点击了新建按钮
lbEdit     单击的是编辑按钮
lbSetNull  单击的是置空按钮


QLDBGridReportBuilder
=====================

介绍
----

QLDBGridReportBuilder 能根据 DBGrid 自动生成 QuickReport 报表。它在克服了用户手动创建报表的繁琐的同时又保留了对手动创建报表的灵活性的支持。


使用 QLDBGridReportBuilder
--------------------------

1、打开 Delphi，新建一个工程
2、在 Form1 上放置一个 ADOTable，按如下设置属性：
	ConnectionString = "FILE NAME=C:\Program Files\Common 
		Files\System\OLE DB\Data Links\DBDEMOS.udl"
	TableName = "Customer"
	Active = True
3、放置一个 DataSource 组件到 Form1 上，设置其 DataSet 属性指向 ADOTable1
4、放置一个 DBGrid 组件到 Form1 上，并设置其 DataSource 指向 DataSource1。这是，DBGrid 中将显示 ADOTable1 的数据
5、从 Nicesoft.Net 组件板上添加一个 QLDBGridReportBuilder 组件到 Form1，设置其 DBGrid 属性指向 DBGrid1
6、将 QLDBGridReportBuilder1 的 Active 属性设为 True

这时，一张打印 DBGrid 的报表就被创建了，你可以进行预览或打印。但这张自动生成的报表上没有标题或页眉页脚等我们需要手动设置的内容，别急，下面就教你如何手动设定页眉页脚等内容。

7、将 QLDBGridReportBuilder1 的 Active 属性设为 False，这时刚才生成的报表将被 Free
8、放置一个 QuickRep 组件到 Form1 上，并在上面添加页眉、页脚、标题等内容
9、将 QLDBGridReportBuilder1 的 Report 属性指向刚才放置的报表组件 QuickRep1
10、将 QLDBGridReportBuilder1 的 Active 属性设为 True

至此，一张包含了用户手动设置和 QLDBGridReportBuilder 自动生成的报表就被创建了。如要保留生成的报表，必须在将 QLDBGridReportBuilder1 的 Active 属性设为 False 之前将其 Report 属性设为 nil。否则当将 QLDBGridReportBuilder1 的 Active 属性设为 False，生成的报表也将被 Free。

属性说明
--------

AutoWidth: Boolean		自动根据报表的宽度调整每列宽度，使之能容下
				所有列
HasColLines: Boolean		生成的报表中各列是否用竖线分隔
HasRowLines: Boolean		生成的报表中各行之间是否永横线分隔
PrintFields: string		需打印的字段，各字段之间用分号(;)分隔
SummaryFields: TStrings		定义合计字段。如 		
				SummaryFields.Add('Cost=SUM(Cost)') 表
				示在字段 Cost 的合计位置上显示 
				SUM(Cost) 的值
AutoOrientation			自动调整报表值纸张方向，以尽可能容纳更多的
				列。如果已将 AutoWidth 设为 True，该属性将
				不起作用


Tips
----

在运行时生成报表更灵活，可用如下代码：

  with TQLDBGridReportBuilder.Create(Self) do
  try
    DBGrid := DBGrid1;
    Report := TMyReportClass.Create(Self); 
    HasColLines := True;
    HasRowLines := True;
    AutoWidth := True;
    Active := True;
    Report.Preview;
    Active := False;
  finally
    Free;
  end;



QLDBFilterDialog
================

QLDBFilterDialog 是一个数据集筛选对话框，它能根据用户定义的筛选条件对任意 DataSet 进行筛选，也能根据筛选条件生成 SQL 的 WHERE 子句。 

说明：
---------

property DataSet: TDataSet		待筛选的 DataSet;
property FilterFields: string		允许进行筛选的字段，只段之间用分号(;)分隔
property Title: string			筛选对话框的标题
function Execute: Boolean;		运行筛选对话框，如果返回值为 True，则表示用户执行筛选