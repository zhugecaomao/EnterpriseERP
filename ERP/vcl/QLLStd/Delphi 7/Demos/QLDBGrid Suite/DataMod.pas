unit DataMod;

interface

uses
  SysUtils, Classes, DB, ADODB, ImgList, Controls;

type
  TDemoDM = class(TDataModule)
    DemoCnn: TADOConnection;
    P_OrderADS: TADODataSet;
    P_OrderADSBILLID: TIntegerField;
    P_OrderADSBILLCODE: TWideStringField;
    P_OrderADSBILLDATE: TDateTimeField;
    P_OrderADSWDATE: TDateTimeField;
    P_OrderADSADATE: TDateTimeField;
    P_OrderADSBILLAMT: TFloatField;
    P_OrderADSCANCELED: TSmallintField;
    P_OrderADSVENDORID: TIntegerField;
    P_OrderADSREPID: TSmallintField;
    P_OrderADSINVOICETYPEID: TSmallintField;
    P_OrderADSTERMID: TSmallintField;
    P_OrderADSDEPID: TIntegerField;
    P_OrderADSTEMPLATEID: TIntegerField;
    P_OrderADSSTOREID: TSmallintField;
    P_OrderADSWUSERNO: TSmallintField;
    P_OrderADSAUSERNO: TSmallintField;
    P_OrderADSOTYPEID: TSmallintField;
    P_OrderADSRCVDATE: TDateTimeField;
    P_OrderADSSHIPTO: TWideStringField;
    P_OrderADSCNTCTNO: TWideStringField;
    P_OrderADSSHIPVIAID: TSmallintField;
    P_OrderDADS: TADODataSet;
    P_OrderDSR: TDataSource;
    VendorADS: TADODataSet;
    P_OrderADSVendorName: TStringField;
    P_OrderDADSBILLID: TIntegerField;
    P_OrderDADSITEMNO: TSmallintField;
    P_OrderDADSGOODSID: TIntegerField;
    P_OrderDADSQTY: TFloatField;
    P_OrderDADSPRICE: TFloatField;
    P_OrderDADSTAXRATE: TFloatField;
    P_OrderDADSDISC: TFloatField;
    P_OrderDADSEXEQTY: TFloatField;
    P_OrderDADSSTOPED: TSmallintField;
    P_OrderDADSCANCELED: TSmallintField;
    GoodsADS: TADODataSet;
    P_OrderDADSGoods: TStringField;
    P_OrderDADSUnit: TStringField;
    P_OrderDADSCost: TCurrencyField;
    InvoiceTypeADS: TADODataSet;
    P_OrderADSInvoiceType: TStringField;
    TermADS: TADODataSet;
    P_OrderADSTerm: TStringField;
    P_OrderADSREMARK: TWideStringField;
    ToolBarIL: TImageList;
    GoodsDSR: TDataSource;
    GoodsADSGOODSID: TIntegerField;
    GoodsADSGDTYPEID: TSmallintField;
    GoodsADSCSUBID: TIntegerField;
    GoodsADSESUBID: TIntegerField;
    GoodsADSISUBID: TIntegerField;
    GoodsADSSSUBID: TIntegerField;
    GoodsADSCODE: TWideStringField;
    GoodsADSNAME: TWideStringField;
    GoodsADSBARCODE: TWideStringField;
    GoodsADSMEMCODE: TWideStringField;
    GoodsADSKIND: TSmallintField;
    GoodsADSUNIT: TWideStringField;
    GoodsADSCANCMB: TSmallintField;
    GoodsADSTOPQTY: TFloatField;
    GoodsADSDOWNQTY: TFloatField;
    GoodsADSPPRICE: TFloatField;
    GoodsADSSPRICE1: TFloatField;
    GoodsADSSPRICE2: TFloatField;
    GoodsADSSPRICE3: TFloatField;
    GoodsADSSPRICE4: TFloatField;
    GoodsADSSPRICE5: TFloatField;
    GoodsADSAPRICE: TFloatField;
    GoodsADSLPPRICE: TFloatField;
    GoodsADSLSPRICE: TFloatField;
    GoodsADSCLOSED: TSmallintField;
    GoodsADSCBCAL: TSmallintField;
    GoodsADSRECBCAL: TSmallintField;
    GoodsADSPSUBID: TIntegerField;
    procedure P_OrderDADSCalcFields(DataSet: TDataSet);
    procedure DemoCnnBeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DemoDM: TDemoDM;

implementation

{$R *.dfm}

procedure TDemoDM.P_OrderDADSCalcFields(DataSet: TDataSet);
begin
  with DataSet do
    FieldByName('Cost').AsCurrency := FieldByName('Price').AsCurrency *
      FieldByName('Qty').AsFloat;
end;

procedure TDemoDM.DemoCnnBeforeConnect(Sender: TObject);
begin
  DemoCnn.ConnectionString := 'FILE NAME=QLDemo.udl';
end;

end.
