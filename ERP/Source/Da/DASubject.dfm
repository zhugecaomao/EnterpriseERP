inherited DASubjectForm: TDASubjectForm
  Left = 180
  Top = 164
  BorderStyle = bsDialog
  Caption = #20250#35745#31185#30446
  ClientHeight = 386
  ClientWidth = 536
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl: TPageControl
    Left = 8
    Top = 8
    Width = 377
    Height = 369
    ActivePage = TabSheet1
    TabIndex = 0
    TabOrder = 0
    OnChange = PageControlChange
    object TabSheet1: TTabSheet
      Caption = #36164#20135#31867
      object TreeView1: TTreeView
        Left = 0
        Top = 0
        Width = 369
        Height = 342
        Align = alClient
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnDblClick = TreeView1DblClick
        OnExpanding = TreeView1Expanding
      end
    end
    object TabSheet2: TTabSheet
      Caption = #36127#20538#31867
      ImageIndex = 1
      object TreeView2: TTreeView
        Left = 0
        Top = 0
        Width = 369
        Height = 342
        Align = alClient
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnDblClick = TreeView1DblClick
        OnExpanding = TreeView1Expanding
      end
    end
    object TabSheet3: TTabSheet
      Caption = #26435#30410#31867
      ImageIndex = 2
      object TreeView3: TTreeView
        Left = 0
        Top = 0
        Width = 369
        Height = 342
        Align = alClient
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnDblClick = TreeView1DblClick
        OnExpanding = TreeView1Expanding
      end
    end
    object TabSheet4: TTabSheet
      Caption = #25104#26412#31867
      ImageIndex = 3
      object TreeView4: TTreeView
        Left = 0
        Top = 0
        Width = 369
        Height = 342
        Align = alClient
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnDblClick = TreeView1DblClick
        OnExpanding = TreeView1Expanding
      end
    end
    object TabSheet5: TTabSheet
      Caption = #25439#30410#31867
      ImageIndex = 4
      object TreeView5: TTreeView
        Left = 0
        Top = 0
        Width = 369
        Height = 342
        Align = alClient
        HideSelection = False
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnDblClick = TreeView1DblClick
        OnExpanding = TreeView1Expanding
      end
    end
  end
  object OKButton: TButton
    Left = 400
    Top = 32
    Width = 121
    Height = 25
    Caption = #30830#23450
    Default = True
    TabOrder = 1
    OnClick = OKButtonClick
  end
  object CancelButton: TButton
    Left = 400
    Top = 64
    Width = 121
    Height = 25
    Cancel = True
    Caption = #21462#28040
    ModalResult = 2
    TabOrder = 2
  end
  object AddNewButton: TButton
    Left = 400
    Top = 112
    Width = 121
    Height = 25
    Caption = #22686#21152#21516#32423#31185#30446'(&A)...'
    TabOrder = 3
    OnClick = AddNewButtonClick
  end
  object AddSubButton: TButton
    Tag = 1
    Left = 400
    Top = 144
    Width = 121
    Height = 25
    Caption = #22686#21152#19979#32423#31185#30446'(&N)...'
    TabOrder = 4
    OnClick = AddNewButtonClick
  end
  object EditButton: TButton
    Left = 400
    Top = 192
    Width = 121
    Height = 25
    Caption = #20462#25913'(&E)...'
    TabOrder = 5
    OnClick = EditButtonClick
  end
  object DeleteButton: TButton
    Left = 400
    Top = 224
    Width = 121
    Height = 25
    Caption = #21024#38500'(&D)...'
    TabOrder = 6
    OnClick = DeleteButtonClick
  end
  object Button1: TButton
    Left = 400
    Top = 272
    Width = 121
    Height = 25
    Hint = #23558#20250#35745#31185#30446#19982#22522#26412#36164#26009#21516#27493
    Caption = #21516#27493#22522#26412#36164#26009'(&S)'
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 400
    Top = 312
    Width = 121
    Height = 25
    Caption = #23548#20986'(&E)'
    TabOrder = 8
    OnClick = Button2Click
  end
  object adsSubject: TADODataSet
    Connection = CommonData.acnConnection
    CommandText = 'DASubject'
    IndexFieldNames = 'SubCode'
    Parameters = <>
    Left = 256
    Top = 192
  end
end
