{ 本 DataModule 只用于放置本项目公用的组件，如用于 Lookup 目的 DataSet 或 ImageList,
其它用于局部模块的组件不要放在这里 }

unit CommonDM;

interface

uses
  SysUtils, Classes, DB, ADODB, DBClient, Provider, Dialogs, QLDBFlt,
  ImgList, Controls;

type
  TCommonData = class(TDataModule)
    acnConnection: TADOConnection;
    ilVoucherSmall: TImageList;
    ilToolBtn: TImageList;
    aqrTemp: TADOQuery;
    adsTemp: TADODataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CommonData: TCommonData;

implementation

{$R *.dfm}  

end.

