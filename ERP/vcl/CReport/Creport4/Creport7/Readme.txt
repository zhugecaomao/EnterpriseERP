{*************************************************/
*  表格式报表处理系统 of  DELPHI
*  China Report system of DELPHI
*  简称：CReport V4.0
*  原创：郭家骏、王寒松

*　修改2: 李泽伦，内容：
     增加和修改了近3000行代码,20余个过程和函数.

        1.按国人习惯的表格设计,未满一页自动以空表格补齐
        2.在预览及打印准备时,显示正在处理的页数.
        3.按上次修改设置的参数自动装入打印纸张型号及纵横方向，再设置时自动在打印设置对话框中显示当前打印纸的的型号及纵横方向.
        4.对预览窗口进行了重新设计,在预览时可重设边距及纸张(增加了用户调用页面设置等内容),更加美观和实用.
        5.增加了可调用的修改模版文件中文本的SetCallText函数,由此可动态修改报表模板文件.
        6.完全重写了PreparePrint过程,不再出现打印空页或有时不能完全打印数据等问题
        7.新增部份函数和过程,可在预览时由最终用户通过拖动边框线立即调整修改某一单元格宽,下次预览或打印时将按此设置自动装入.
          (要此功能生效,在预览调用时,须设置enableedit=true)
        8.修改了报表模板编辑工具，去掉了发现的BUG,并增加了新的功能,使用更加方做.
          (1)是将模板修改程序打包到预览过程中,可在预览时调用模板编辑，退出存盘后,立即在预览中反映修改后的样式(与fastreport 相似).
          (2)是增加了数据表字段列表按健,可通过拖动字段自动填入模板单元格中.
          (3)是在ide中双击控件可立即调用模板编辑器.
          (4)是增加了在模板中控制数值显示格式的功能,不用在字段属性中显示设置,提升了用户控制度.
        9.增加了在IDE中的预览功能.
       10.增加了两个函数,可实现统计汇总功能.

                1:`SumPage(j1-j2+j3...) 实现每页每列小计

                2:`SumAll(j1+j3-j2...)  实现整个报表每列合计

       11.去掉了exe编辑模板程序,因为双击控件即可调用,减小了控件大小.
       12.增加了预览及打印图片功能（图片可根据单元格大小随意宿放，除可在模板编辑程序中编辑外，还能自动识别图片字段并预览或打印）.

***************************************************}
ver 4.0

一、安装D6-D7
1.运行DELPHI，打开Creport6.dpk或Creport7.dpk文件,点编译,再点INSTALL.
2.点工具中环境选项,再选路径设置:
  (1)将控件所在目录增加到路径中
  (2)将C:\Program Files\Borland\Delphi6(7)\Source\ToolsAPI(也有可能在其它目录,视自已DELPHI安装目录而定,找到ToolsAPI目录)路径加入.

二、使用

  1、使用样板见DEMO程序。　　　　
  2、数值字段的显示打印格式可在报表模板中设置，如模板中未设置，则以数据库中的设置为准。 
  3、`SumAll(j1－j2＋j3)的用法:
        (1).如用第2列的和减第3列的和再加第5列的和则应这样填写模板中的单元格：`SumAll(2－3＋5)；
        (2).`SumAll(4)则代表第4列的和。
        (3).模板中第1列的标号为1,依次类推。
        (4).`SumPAge(j1-j2+j3..)的用法与SumAll(...)相同,不同之处是前者统计整个表,后者仅统计每一页.

  4、在IDE中双击ReportRunTime控件可立即调用Creport模板编辑程序。
  5、在IDE中设置了相关属性后可点鼠标右健调用预览功能.
  6、editept属性为真时，预览中可调用编辑模板程序.
  7、enabledit属性为真时，预览中可编辑当前要打印的页和通过拖动调整整个表格单元格宽.
  8、reportfile与setdata两个属性均可在调用预览或打印前由程序语句动态设置，不一定非要在ide中设置，但要ide中预览则必须在中ide设置。
  9、.可打印预览bmp.jpg.ico等类型图片,字段中的BMP图片可自动打印及预览.

10、关于ide中编辑模板与预览问题。
　　(1)、如果ReportRunTime控件的reportfile属性已填列，则打开编辑过程的同时自动打开该文件（当然要保证此文件已存在）。
　　(2)、在ide中预览时，应设置好两个属性：一是reportfile，二是setdata(格式见例子程序)，否则不能正确预览。

三、关于demo例子工程

　　装入demo工程后，可能会有文件错误或其它错误提示，那是因为在我的机子上设置的报表路径与数据库路径与你机子上的不同。打开data.pas文件，重新设置两个表的databasename属性为t1.db,t2.db文件的路径；设置ReportRunTime1控件的Reportfile属性为CReport_demo.ept文件所在路径及名字即可。


四、问题

　　本版去掉了原AutoGroup等属性，原工程中用到本控件的单元文件，应在IDE中重新打开一次，出现提示时回答IGNORE，去掉autogroup或其它属性，重新编译即可。


有何建议或问题也请来电，定会答复。

　　

成都　李泽伦(lzl－self@sohu.com)
