�
 TSREDBASESALARYFORM 0�.  TPF0�TSREdBaseSalaryFormSREdBaseSalaryFormLeft�Top� Width(HeightDCaption   �]D�h�8h�{WindowStatewsMaximizedOnCreate
FormCreatePixelsPerInch`
TextHeight � TLabelLabel8Left|TopyWidth$HeightCaption   �bcb�s  �	TQLDBGridDBGridTop� Width Height=ColumnsExpanded	FieldName	EmployeeDTitle.AlignmenttaCenterWidthdVisible	 Expanded	FieldNameAmountTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldNameQuantityTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldName	SundryFeeTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldName	PriceBaseTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldNameQuantityPcsTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldName
TimeAmountTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldNameGoalQuantityTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldNamePayableTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldNameDiscountTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldName	TaxAmountTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldNameSalaryAmountTitle.AlignmenttaCenterWidthZVisible	 Expanded	FieldNameMemoTitle.AlignmenttaCenterWidthdVisible	    �TToolBarToolBarWidth   �TPanelTopPanelWidth Height�  �TLabelRemarkLabelLeftcTopVWidthCaption   Y�l  �TLabelVoucherNoLabelLeftcTopWidthCaption   �S  �TLabelVoucherDateLabelLeft�TopWidthCaption   �eg  �TLabelLabel2LeftcTop,Width$HeightCaption   �~Kb�N  �TLabelLabel3Left�Top-Width0HeightCaption   N�R{|�W  �TLabelLabel5LeftTop,Width$HeightCaption   �[8h�N  �TLabelLabel7LeftTopVWidth0HeightCaption   �����eg  �TLabelLabel9LeftTopWidthTHeightCaption   ����g�N( g��)   �TLabelLabel1Left� TopVWidth0HeightCaption   �~ N�NϑVisible  �TDBEditRemarkDBEditLeftcTopfWidth%	DataFieldMemoTabOrder  �TDBEditVocherNoDBEditLeftcTopWidth� 	DataFieldCode  �TDBEdit
DateDBEditLeft�TopWidth� 	DataFieldDate  TQLDBLookupComboBoxLookupEmployeeLeftcTop=Width� Height
BevelEdges 
BevelOuterbvRaisedCtl3D		DataField
EmployeeID
DataSourceMasterDataSourceDropDownRows
KeyFieldID	ListFieldName
ListSourceDSEmployeeNameParentCtl3DTabOrderButtonHeight
SearchModesmLocate
SearchTypestAutoVisibleButtons	lbSetNull   TDBComboBoxBriefComboBoxLeftTopWidthHHeight	DataFieldBrief
DataSourceMasterDataSource
ItemHeightTabOrder   TDBEditDBEdit1Left�Top@Width� Height	DataFieldBillMode
DataSourceMasterDataSourceTabOrder  TDBEditDBEdit5LeftTopfWidth� Height	DataField	ClearDate
DataSourceMasterDataSourceTabOrder  TQLDBLookupComboBoxClientQLDBLookupLeftTop=WidthHHeight
BevelEdges 
BevelOuterbvRaisedCtl3D		DataFieldClientID
DataSourceMasterDataSourceDropDownRows
KeyFieldID	ListFieldName
ListSourceDSClientNameParentCtl3DTabOrderButtonHeight
SearchModesmLocate
SearchTypestAutoVisibleButtons	lbSetNull   TBitBtnBitBtn1LeftTop� WidthPHeightHint'   �p�Qdk	c���S�N���Ny��vh�-N�c�ShQ�b�R���Ny��vD��e��N�_�U_eQ���NUS�ND��e0Caption   �SXT�]TUSTabOrder	OnClickBitBtn1Click  TDBEditDBEdit2Left� TopfWidth� Height	DataField	SundryFee
DataSourceMasterDataSourceTabOrderVisible  TBitBtnBitBtn2LeftcTop� WidthPHeightHint'   �p�Qdk	c���S�N���Ny��vh�-N�c�ShQ�b�R���Ny��vD��e��N�_�U_eQ���NUS�ND��e0Caption   �S��R��U_EnabledTabOrder
  TBitBtnBitBtn5Left� Top� WidthPHeightHint   �p�Qdk	c���S\�~ N�NϑkX�Q0R�Nϑ:N���v��U_-N0Caption   ���{�]���]D�EnabledTabOrder  TBitBtnBitBtn3LeftTop� WidthPHeightHint   �p�Qdk	c���S\�~ N�NϑkX�Q0R�Nϑ:N���v��U_-N0Caption   �S���N�]D�TabOrderOnClickBitBtn3Click  TBitBtnBitBtn4Left�Top� WidthPHeightHint   �p�Qdk	c���S\�~ N�NϑkX�Q0R�Nϑ:N���v��U_-N0Caption   ���{@b�_zEnabledTabOrder  TBitBtnBitBtn6LeftnTop� WidthPHeightHint   �p�Qdk	c���S\�~ N�NϑkX�Q0R�Nϑ:N���v��U_-N0Caption   �S���e�]D�TabOrderOnClickBitBtn6Click   �
TStatusBar
StatusBar1Top�Width Height  �TQLDBLookupComboBoxGoodsLookupLeftTopLWidthX  �TQLDBLookupComboBoxLookEmployeeDLeftTop� WidthXHeight
BevelEdges 
BevelInnerbvNone
BevelOuterbvNoneCtl3D	DataField
GoalUnitID
DataSourceDetailDataSourceDropDownRows
KeyFieldID	ListFieldName
ListSourcedsEmployeeD	OnCloseUpGoodsLookupCloseUpParentCtl3DTabOrderVisibleButtonHeightOnButtonClickGoodsLookupButtonClick
SearchModesmLocate
SearchTypestAutoVisibleButtons	lbSetNull   �TDataSourceMasterDataSourceDataSet	adsMasterLeftsTopN  �TDataSourceDetailDataSourceDataSet	adsDetailLeft"Top*  �TActionList
ActionListLeftSTop �	TActionDeleteDetailAction
ImageIndex�  �
TActionNewDetailAction  �TActionSaveAsAction
ImageIndex  �TActionSubmitAction
ImageIndex  �TActionSendAsMailAction
ImageIndex  �TActionImportAction
ImageIndex  �TActionDiscountModeCaption   �bcb�e_( & D ) Hint   ��nS_MRUSnc�v�bcb�e_
ImageIndex  �TActionStockQuerryCaption   �^X[�g�( & S ) Hint   �^X[FU�T�g��v^N�SۏL�Y!k�g�
ImageIndex  �TAction
FindAction  �TActionCloseAction   �	TMainMenuMainMenuLeft�Top �	TMenuItemA3Visible   �
TPopupMenuDetailsPopupMenuLeft�Top  TADODataSet
ClientName
ConnectionCommonData.acnConnection
CursorTypectStaticCommandText=   select ID, Name
from MSEmployee
where RecordState<>'删除'
Parameters Left� Top&  TADODataSetEmployeeName
ConnectionCommonData.acnConnection
CursorTypectStaticCommandText=   select ID, Name
from MSEmployee
where RecordState<>'删除'
Parameters Left� Top&  TADODataSetGoodNameActive	
ConnectionCommonData.acnConnection
CursorTypectStaticCommandText3   select *
from DAGoods
where RecordState<>'删除'
Parameters LeftPTop  TADODataSet	AdsSRJobsActive	
ConnectionCommonData.acnConnection
CursorTypectStaticCommandText]   select ID, ID as JobsID,  Name, PriceBase  from SRJobs
where RecordState<>'删除' 
and 1=2
Parameters Left� Top  TDataSourcedsSRJobsDataSet	AdsSRJobsLeft� Top*  TDataSourceDSClientNameDataSet
ClientNameLeft� TopN  TDataSourceDSEmployeeNameDataSetEmployeeNameLeft� TopN  TADODataSetTempAds
ConnectionCommonData.acnConnection
Parameters Left Top  TADODataSet	adsMasterTag
ConnectionCommonData.acnConnection
CursorTypectStaticFiltered	CommandTextI   select *
from SRBaseSalaryMaster
where RecordState<>'删除' and ID=:IDIndexFieldNamesID
ParametersNameID
AttributespaSigned DataType	ftInteger	Precision
SizeValue   LeftsTop& TAutoIncFieldadsMasterID	FieldNameIDReadOnly	Visible  TDateTimeFieldadsMasterCreateDate	FieldName
CreateDateVisible  TIntegerFieldadsMasterCreateUserID	FieldNameCreateUserIDVisible  TStringFieldadsMasterRecordState	FieldNameRecordStateVisibleSize  TIntegerFieldadsMasterClientID	FieldNameClientIDVisible  TIntegerFieldadsMasterPeriodID	FieldNamePeriodIDVisible  TIntegerFieldadsMasterWarehouseID	FieldNameWarehouseID  TIntegerFieldadsMasterEmployeeID	FieldName
EmployeeIDVisible  TIntegerFieldadsMasterOriginID	FieldNameOriginIDVisible  TStringFieldadsMasterOriginTable	FieldNameOriginTableVisibleSize  TBytesFieldadsMasterBillAffix	FieldName	BillAffixVisibleSize2  TStringFieldadsMasterCodeDisplayLabel   �S	FieldNameCode  TDateTimeFieldadsMasterDateDisplayLabel   �eg	FieldNameDate  TStringFieldadsMasterBillModeDisplayLabel   N�R{|+R	FieldNameBillModeSize  TStringFieldadsMasterBriefDisplayLabel   N�RXd��	FieldNameBriefSize  TDateTimeFieldadsMasterClearDateDisplayLabel   �~�{�eg	FieldName	ClearDate  	TBCDFieldadsMasterSundryFee	FieldName	SundryFeeDisplayFormat#,#.00
EditFormat#	PrecisionSize  TStringFieldadsMasterClientNameDisplayLabel   �[7bT�y	FieldKindfkLookup	FieldName
ClientNameLookupDataSet
ClientNameLookupKeyFieldsIDLookupResultFieldName	KeyFieldsClientIDLookup	  TStringFieldadsMasterApportionDisplayLabel   RJd�f	FieldName	ApportionSize  TStringFieldadsMasterDeliverDisplayLabel   �'�	FieldNameDeliverSize  TStringFieldadsMasterMemoDisplayLabel   Y�l	FieldNameMemoSize<  TStringFieldadsMasterEmployee	FieldKindfkLookup	FieldNameEmployeeLookupDataSetEmployeeNameLookupKeyFieldsIDLookupResultFieldName	KeyFields
EmployeeIDLookup	  TIntegerFieldadsMasterModeDC	FieldNameModeDCVisible  TIntegerFieldadsMasterModeC	FieldNameModeCVisible   TADODataSet	adsDetail
ConnectionCommonData.acnConnection
CursorTypectStaticLockTypeltBatchOptimisticCommandText7select *
from SRBaseSalaryDetail
where MasterID = :IDIndexFieldNamesID
ParametersNameID
AttributespaSigned
paNullable DataType	ftInteger	Precision
SizeValue   Left"Top TAutoIncFieldadsDetailID	FieldNameIDReadOnly	Visible  TIntegerFieldadsDetailGoalUnitID	FieldName
GoalUnitIDVisible  TIntegerFieldadsDetailPackUnitID	FieldName
PackUnitIDVisible  TIntegerFieldadsDetailCntTimeID	FieldName	CntTimeIDVisible  TStringFieldadsDetailGoodsSpec	FieldName	GoodsSpecVisibleSize  TIntegerFieldadsDetailMasterID	FieldNameMasterIDVisible  TIntegerFieldadsDetailGoodsID	FieldNameGoodsIDVisible  TStringFieldadsDetailEmployeeDDisplayLabel   XT�]�YT	FieldKindfkLookup	FieldName	EmployeeDLookupDataSetAdsEmployeeDLookupKeyFieldsIDLookupResultFieldName	KeyFields
GoalUnitIDLookup	  	TBCDFieldadsDetailAmountDisplayLabel   h�Q�]D�	FieldNameAmountOnChangeadsDetailAmountChangeDisplayFormat#,#.00
EditFormat#currency		PrecisionSize  	TBCDFieldadsDetailQuantityDisplayLabel   ��R)Ype	FieldNameQuantityDisplayFormat#,#.00
EditFormat#	PrecisionSize  	TBCDFieldadsDetailSundryFeeDisplayLabel   �[�S�W,g�]D�	FieldName	SundryFeeVisibleOnChangeadsDetailSundryFeeChangeDisplayFormat#,#.00
EditFormat#currency		PrecisionSize  	TBCDFieldadsDetailPriceBaseDisplayLabel   �]���]D�	FieldName	PriceBaseOnChangeadsDetailSundryFeeChangeDisplayFormat#,#.00
EditFormat#	Precision  	TBCDFieldadsDetailQuantityPcsDisplayLabel   ���N�]D�	FieldNameQuantityPcsVisibleOnChangeadsDetailSundryFeeChangeDisplayFormat#,#.00
EditFormat#.#	PrecisionSize  	TBCDFieldadsDetailTimeAmountDisplayLabel   ���e�]D�	FieldName
TimeAmountOnChangeadsDetailSundryFeeChangeDisplayFormat#,#.00
EditFormat#.#	PrecisionSize  	TBCDFieldadsDetailGoalQuantityDisplayLabel   e�4��R�s	FieldNameGoalQuantityVisibleOnChangeadsDetailSundryFeeChangeDisplayFormat#,#.00
EditFormat#	PrecisionSize  	TBCDFieldadsDetailPayableDisplayLabel   �^�N�]D�T��	FieldNamePayablecurrency		PrecisionSize  	TBCDFieldadsDetailDiscountDisplayLabel   cbd�y��v	FieldNameDiscountVisibleOnChangeadsDetailSundryFeeChangeDisplayFormat#,#.00
EditFormat#	Precision  	TBCDFieldadsDetailTaxAmountDisplayLabel   *N�N@b�_z	FieldName	TaxAmountVisibleOnChangeadsDetailSundryFeeChangeDisplayFormat#,#.00
EditFormat#	Precision  TStringFieldadsDetailMemoDisplayLabel   Y�l	FieldNameMemoSize  	TBCDFieldadsDetailSalaryAmountDisplayLabel   �[�S�]D�ё��	FieldNameSalaryAmountcurrency		PrecisionSize   TADODataSetAdsEmployeeDActive	
ConnectionCommonData.acnConnection
CursorTypectStaticCommandText=   select ID, Name
from MSEmployee
where RecordState<>'删除'
Parameters Left� Top  TDataSourcedsEmployeeDDataSetAdsEmployeeDLeft� Top.   