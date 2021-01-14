object QLDBFilterForm: TQLDBFilterForm
  Left = 211
  Top = 196
  BorderStyle = bsDialog
  Caption = #31579#36873
  ClientHeight = 299
  ClientWidth = 498
  Color = clBtnFace
  Font.Charset = GB2312_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #23435#20307
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object gbFilterConditions: TGroupBox
    Left = 8
    Top = 8
    Width = 481
    Height = 169
    Caption = #25353#20197#19979#26465#20214#31579#36873'(&T)'
    TabOrder = 0
    object lbFilter: TListBox
      Left = 8
      Top = 16
      Width = 463
      Height = 113
      Style = lbOwnerDrawFixed
      ItemHeight = 12
      TabOrder = 0
      OnDblClick = lbFilterDblClick
      OnDrawItem = lbFilterDrawItem
    end
    object btnDelete: TButton
      Left = 248
      Top = 136
      Width = 105
      Height = 21
      Caption = #21024#38500'(&D)'
      TabOrder = 1
      OnClick = btnDeleteClick
    end
    object btnNewConditions: TButton
      Left = 368
      Top = 136
      Width = 105
      Height = 21
      Caption = #26032#31579#36873#26465#20214'(&W)'
      TabOrder = 2
      OnClick = btnNewConditionsClick
    end
  end
  object gbDefineCondition: TGroupBox
    Left = 8
    Top = 184
    Width = 481
    Height = 81
    Caption = #23450#20041#22810#37325#26465#20214
    TabOrder = 1
    object Label1: TLabel
      Left = 64
      Top = 32
      Width = 48
      Height = 12
      Caption = #39033#30446'(&I):'
      FocusControl = cbFields
    end
    object Label2: TLabel
      Left = 216
      Top = 32
      Width = 48
      Height = 12
      Caption = #26465#20214'(&C):'
      FocusControl = cbConditions
    end
    object Label3: TLabel
      Left = 328
      Top = 32
      Width = 36
      Height = 12
      Caption = #20540'(&V):'
    end
    object cbFields: TComboBox
      Left = 64
      Top = 48
      Width = 145
      Height = 20
      Style = csDropDownList
      ItemHeight = 12
      TabOrder = 0
      OnChange = cbFieldsChange
    end
    object rbAnd: TRadioButton
      Left = 8
      Top = 38
      Width = 49
      Height = 17
      Caption = #19982'(&N)'
      Checked = True
      TabOrder = 1
      TabStop = True
    end
    object rbOr: TRadioButton
      Left = 8
      Top = 54
      Width = 49
      Height = 17
      Caption = #25110'(&R)'
      TabOrder = 2
    end
    object cbConditions: TComboBox
      Left = 216
      Top = 48
      Width = 105
      Height = 20
      Style = csDropDownList
      DropDownCount = 12
      ItemHeight = 12
      TabOrder = 3
      Items.Strings = (
        #31561#20110
        #19981#31561#20110
        #22823#20110
        #22823#20110#25110#31561#20110
        #23567#20110
        #23567#20110#25110#31561#20110
        #22987#20110
        #24182#38750#36215#22987#20110
        #27490#20110
        #24182#38750#32467#26463#20110
        #21253#21547
        #19981#21253#21547)
    end
    object btnAddToList: TButton
      Left = 368
      Top = 16
      Width = 105
      Height = 21
      Caption = #28155#21152#33267#21015#34920'(&A)'
      TabOrder = 4
      OnClick = btnAddToListClick
    end
    object nbValue: TNotebook
      Left = 328
      Top = 48
      Width = 150
      Height = 25
      TabOrder = 5
      object TPage
        Left = 0
        Top = 0
        Caption = 'Default'
        object edtValue: TEdit
          Left = 0
          Top = 0
          Width = 145
          Height = 20
          TabOrder = 0
          OnChange = edtValueChange
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Boolean'
        object cbBoolean: TComboBox
          Left = 0
          Top = 0
          Width = 145
          Height = 20
          Style = csDropDownList
          ItemHeight = 12
          TabOrder = 0
          Items.Strings = (
            #26159
            #21542)
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Date'
        object dtpDate: TDateTimePicker
          Left = 0
          Top = 0
          Width = 145
          Height = 20
          CalAlignment = dtaLeft
          Date = 36643.935606713
          Time = 36643.935606713
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
      end
    end
  end
  object btnOK: TButton
    Left = 336
    Top = 272
    Width = 75
    Height = 21
    Caption = #30830#23450
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCancel: TButton
    Left = 416
    Top = 272
    Width = 75
    Height = 21
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 3
  end
end
