unit QLReg;

{$I QLL.INC}

interface

uses Classes, DesignIntf, DesignEditors;

procedure Register;

implementation

uses
{$IFDEF QLDBGRID}
  QLDBGrid,
{$ENDIF}
{$IFDEF QLDBLOOKUPCOMBOBOX}
  QLDBLkp, DBReg,
{$ENDIF}
{$IFDEF QLDBGRIDREPORTBUILDER}
  QLRptBld,
{$ENDIF}
{$IFDEF QLDBFILTERDIALOG}
  QLDBFlt,
{$ENDIF}
  TypInfo;

const
  srNicesoft = 'soft.Net';

{$IFNDEF DELPHI6}
type
  TListFieldProperty = class(TDataFieldProperty)
  public
    function GetDataSourcePropName: string; override;
  end;

function TListFieldProperty.GetDataSourcePropName: string;
begin
  Result := 'ListSource';
end;
{$ENDIF}

procedure Register;
begin
{$IFDEF QLDBGRID}
  RegisterComponents(srNicesoft, [TQLDBGrid]);
  RegisterPropertyEditor(TypeInfo(TCurrencyView), TQLDBGrid, 'CurrencyView', TClassProperty);
{$ENDIF}
{$IFDEF QLDBLOOKUPCOMBOBOX}
  RegisterComponents(srNicesoft, [TQLDBLookupComboBox]);
  RegisterPropertyEditor(TypeInfo(string), TQLDBLookupControl, 'KeyField', TListFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TQLDBLookupControl, 'ListField', TListFieldProperty);
  RegisterPropertyEditor(TypeInfo(string), TQLDBLookupControl, 'ListSource', TListFieldProperty);
{$ENDIF}
{$IFDEF QLDBGRIDREPORTBUILDER}
  RegisterComponents(srNicesoft, [TQLDBGridReportBuilder]);
{$ENDIF}
{$IFDEF QLDBFILTERDIALOG}
  RegisterComponents(srNicesoft, [TQLDBFilterDialog]);
{$ENDIF}
end;

end.
