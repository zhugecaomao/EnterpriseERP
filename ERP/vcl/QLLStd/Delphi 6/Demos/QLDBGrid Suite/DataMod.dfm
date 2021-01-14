object DemoDM: TDemoDM
  OldCreateOrder = False
  Left = 549
  Top = 125
  Height = 288
  Width = 242
  object DemoCnn: TADOConnection
    Connected = True
    ConnectionString = 'FILE NAME=QLDemo.udl'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    BeforeConnect = DemoCnnBeforeConnect
    Left = 24
    Top = 8
  end
  object P_OrderADS: TADODataSet
    Connection = DemoCnn
    CursorType = ctStatic
    CommandText = 'SELECT * FROM P_Order'
    Parameters = <>
    Left = 96
    Top = 8
    object P_OrderADSBILLID: TIntegerField
      FieldName = 'BILLID'
    end
    object P_OrderADSBILLCODE: TWideStringField
      DisplayLabel = #21333#25454#32534#21495
      FieldName = 'BILLCODE'
    end
    object P_OrderADSBILLDATE: TDateTimeField
      DisplayLabel = #24320#21333#26085#26399
      FieldName = 'BILLDATE'
    end
    object P_OrderADSWDATE: TDateTimeField
      FieldName = 'WDATE'
    end
    object P_OrderADSADATE: TDateTimeField
      FieldName = 'ADATE'
    end
    object P_OrderADSBILLAMT: TFloatField
      FieldName = 'BILLAMT'
    end
    object P_OrderADSCANCELED: TSmallintField
      FieldName = 'CANCELED'
    end
    object P_OrderADSVENDORID: TIntegerField
      FieldName = 'VENDORID'
    end
    object P_OrderADSREPID: TSmallintField
      FieldName = 'REPID'
    end
    object P_OrderADSINVOICETYPEID: TSmallintField
      FieldName = 'INVOICETYPEID'
    end
    object P_OrderADSTERMID: TSmallintField
      FieldName = 'TERMID'
    end
    object P_OrderADSDEPID: TIntegerField
      FieldName = 'DEPID'
    end
    object P_OrderADSTEMPLATEID: TIntegerField
      FieldName = 'TEMPLATEID'
    end
    object P_OrderADSSTOREID: TSmallintField
      FieldName = 'STOREID'
    end
    object P_OrderADSWUSERNO: TSmallintField
      FieldName = 'WUSERNO'
    end
    object P_OrderADSAUSERNO: TSmallintField
      FieldName = 'AUSERNO'
    end
    object P_OrderADSOTYPEID: TSmallintField
      FieldName = 'OTYPEID'
    end
    object P_OrderADSRCVDATE: TDateTimeField
      DisplayLabel = #36865#36135#26085#26399
      FieldName = 'RCVDATE'
    end
    object P_OrderADSSHIPTO: TWideStringField
      FieldName = 'SHIPTO'
      Size = 64
    end
    object P_OrderADSCNTCTNO: TWideStringField
      DisplayLabel = #21512#21516#21495
      FieldName = 'CNTCTNO'
      Size = 32
    end
    object P_OrderADSSHIPVIAID: TSmallintField
      FieldName = 'SHIPVIAID'
    end
    object P_OrderADSVendorName: TStringField
      DisplayLabel = #20379#24212#21830
      FieldKind = fkLookup
      FieldName = 'VendorName'
      LookupDataSet = VendorADS
      LookupKeyFields = 'VENDORID'
      LookupResultField = 'SHORTNAME'
      KeyFields = 'VENDORID'
      Size = 40
      Lookup = True
    end
    object P_OrderADSInvoiceType: TStringField
      DisplayLabel = #21457#31080#31867#22411
      FieldKind = fkLookup
      FieldName = 'InvoiceType'
      LookupDataSet = InvoiceTypeADS
      LookupKeyFields = 'INVOICETYPEID'
      LookupResultField = 'NAME'
      KeyFields = 'INVOICETYPEID'
      Lookup = True
    end
    object P_OrderADSTerm: TStringField
      DisplayLabel = #20184#27454#26399#38480
      FieldKind = fkLookup
      FieldName = 'Term'
      LookupDataSet = TermADS
      LookupKeyFields = 'TERMID'
      LookupResultField = 'NAME'
      KeyFields = 'TERMID'
      Lookup = True
    end
    object P_OrderADSREMARK: TWideStringField
      DisplayLabel = #22791#27880
      FieldName = 'REMARK'
      Size = 64
    end
  end
  object P_OrderDADS: TADODataSet
    Connection = DemoCnn
    CursorType = ctStatic
    OnCalcFields = P_OrderDADSCalcFields
    CommandText = 'SELECT * FROM P_OrderD WHERE BillID= :BillID'
    DataSource = P_OrderDSR
    IndexFieldNames = 'BILLID'
    MasterFields = 'BillID'
    Parameters = <
      item
        Name = 'BillID'
        Attributes = [paNullable]
        DataType = ftInteger
        NumericScale = 255
        Precision = 255
        Value = 1
      end>
    Left = 96
    Top = 64
    object P_OrderDADSBILLID: TIntegerField
      FieldName = 'BILLID'
      Visible = False
    end
    object P_OrderDADSITEMNO: TSmallintField
      FieldName = 'ITEMNO'
      Visible = False
    end
    object P_OrderDADSGOODSID: TIntegerField
      FieldName = 'GOODSID'
      Visible = False
    end
    object P_OrderDADSGoods: TStringField
      DisplayLabel = #21697#21517#35268#26684
      FieldKind = fkLookup
      FieldName = 'Goods'
      LookupDataSet = GoodsADS
      LookupKeyFields = 'GOODSID'
      LookupResultField = 'NAME'
      KeyFields = 'GOODSID'
      Size = 40
      Lookup = True
    end
    object P_OrderDADSUnit: TStringField
      DisplayLabel = #21333#20301
      FieldKind = fkLookup
      FieldName = 'Unit'
      LookupDataSet = GoodsADS
      LookupKeyFields = 'GOODSID'
      LookupResultField = 'UNIT'
      KeyFields = 'GOODSID'
      Size = 6
      Lookup = True
    end
    object P_OrderDADSQTY: TFloatField
      DisplayLabel = #25968#37327
      FieldName = 'QTY'
    end
    object P_OrderDADSPRICE: TFloatField
      DisplayLabel = #21333#20215
      FieldName = 'PRICE'
      DisplayFormat = '0.00##'
    end
    object P_OrderDADSTAXRATE: TFloatField
      FieldName = 'TAXRATE'
      Visible = False
    end
    object P_OrderDADSDISC: TFloatField
      FieldName = 'DISC'
      Visible = False
    end
    object P_OrderDADSEXEQTY: TFloatField
      FieldName = 'EXEQTY'
      Visible = False
    end
    object P_OrderDADSSTOPED: TSmallintField
      FieldName = 'STOPED'
      Visible = False
    end
    object P_OrderDADSCANCELED: TSmallintField
      FieldName = 'CANCELED'
      Visible = False
    end
    object P_OrderDADSCost: TCurrencyField
      DisplayLabel = #37329#39069
      FieldKind = fkCalculated
      FieldName = 'Cost'
      Calculated = True
    end
  end
  object P_OrderDSR: TDataSource
    DataSet = P_OrderADS
    Left = 160
    Top = 8
  end
  object VendorADS: TADODataSet
    Connection = DemoCnn
    CursorType = ctStatic
    CommandText = 'VENDOR'
    CommandType = cmdTable
    Parameters = <>
    Left = 24
    Top = 72
  end
  object GoodsADS: TADODataSet
    Connection = DemoCnn
    CursorType = ctStatic
    CommandText = 'GOODS'
    CommandType = cmdTable
    Parameters = <>
    Left = 176
    Top = 64
    object GoodsADSGOODSID: TIntegerField
      FieldName = 'GOODSID'
    end
    object GoodsADSGDTYPEID: TSmallintField
      FieldName = 'GDTYPEID'
    end
    object GoodsADSCSUBID: TIntegerField
      FieldName = 'CSUBID'
    end
    object GoodsADSESUBID: TIntegerField
      FieldName = 'ESUBID'
    end
    object GoodsADSISUBID: TIntegerField
      FieldName = 'ISUBID'
    end
    object GoodsADSSSUBID: TIntegerField
      FieldName = 'SSUBID'
    end
    object GoodsADSCODE: TWideStringField
      FieldName = 'CODE'
    end
    object GoodsADSNAME: TWideStringField
      DisplayWidth = 26
      FieldName = 'NAME'
      Size = 40
    end
    object GoodsADSBARCODE: TWideStringField
      FieldName = 'BARCODE'
      Size = 40
    end
    object GoodsADSMEMCODE: TWideStringField
      FieldName = 'MEMCODE'
      Size = 40
    end
    object GoodsADSKIND: TSmallintField
      FieldName = 'KIND'
    end
    object GoodsADSUNIT: TWideStringField
      DisplayWidth = 4
      FieldName = 'UNIT'
      Size = 8
    end
    object GoodsADSCANCMB: TSmallintField
      FieldName = 'CANCMB'
    end
    object GoodsADSTOPQTY: TFloatField
      FieldName = 'TOPQTY'
    end
    object GoodsADSDOWNQTY: TFloatField
      FieldName = 'DOWNQTY'
    end
    object GoodsADSPPRICE: TFloatField
      FieldName = 'PPRICE'
    end
    object GoodsADSSPRICE1: TFloatField
      FieldName = 'SPRICE1'
    end
    object GoodsADSSPRICE2: TFloatField
      FieldName = 'SPRICE2'
    end
    object GoodsADSSPRICE3: TFloatField
      FieldName = 'SPRICE3'
    end
    object GoodsADSSPRICE4: TFloatField
      FieldName = 'SPRICE4'
    end
    object GoodsADSSPRICE5: TFloatField
      FieldName = 'SPRICE5'
    end
    object GoodsADSAPRICE: TFloatField
      FieldName = 'APRICE'
    end
    object GoodsADSLPPRICE: TFloatField
      FieldName = 'LPPRICE'
    end
    object GoodsADSLSPRICE: TFloatField
      FieldName = 'LSPRICE'
    end
    object GoodsADSCLOSED: TSmallintField
      FieldName = 'CLOSED'
    end
    object GoodsADSCBCAL: TSmallintField
      FieldName = 'CBCAL'
    end
    object GoodsADSRECBCAL: TSmallintField
      FieldName = 'RECBCAL'
    end
    object GoodsADSPSUBID: TIntegerField
      FieldName = 'PSUBID'
    end
  end
  object InvoiceTypeADS: TADODataSet
    Connection = DemoCnn
    CommandText = 'INVOICETYPE'
    CommandType = cmdTable
    Parameters = <>
    Left = 40
    Top = 136
  end
  object TermADS: TADODataSet
    Connection = DemoCnn
    CommandText = 'TERM'
    CommandType = cmdTable
    Parameters = <>
    Left = 128
    Top = 128
  end
  object ToolBarIL: TImageList
    Left = 64
    Top = 184
    Bitmap = {
      494C010103000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001001000000000000008
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000E07F0000
      0042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001863186318631863186318630000
      0000000018631863186318631863186318630000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001863
      1042104200000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000186318631863
      1042104210421042000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042000018631863186318631863
      1042104210421042104210420000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000000000000000000000000000000000000000000000001042
      0000000000000000000000000000000000001042000018631863186318630000
      1042104210421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000104200000000000000000000000000001042000018631863000000001863
      1863186310421042104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000104200000000000000000000104200000000000018631863007C
      007C186318631863104210421042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001042000018631863E003E0031863
      1863186310421042000018631042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000010420000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001042000000000000000000000000104210420000186318631863
      1042104218630000000018631042104200000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000104200000000000000000000000000000000000000001042104200001042
      1863000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010420000000000000000000000000000000000000000000000001042
      0000000000000000000000000000000000000000000000000000000010421042
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      1042000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000104200000000000010421042000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000010421042104200000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF02000000FFFFFFFF00000000
      FFFFFFFFF01F0000FFFFFFFFC0070000FFFFFFFF00010000FF9FF9FF42000000
      FE1FF87F4C000000F81FF81F70000000F01FF80F40000000F81FF81F90210000
      FE1FF87FE4F70000FF9FF9FFF9FB0000FFFFFFFFFEFC0000FFFFFFFFFF730000
      FFFFFFFFFF8F0000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object GoodsDSR: TDataSource
    DataSet = GoodsADS
    Left = 176
    Top = 192
  end
end
