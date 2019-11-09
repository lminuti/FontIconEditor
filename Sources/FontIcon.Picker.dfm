object frmFontIconPicker: TfrmFontIconPicker
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Icon picker'
  ClientHeight = 314
  ClientWidth = 288
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  DesignSize = (
    288
    314)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 22
    Height = 13
    Caption = 'Font'
  end
  object Label3: TLabel
    Left = 16
    Top = 64
    Width = 115
    Height = 13
    Caption = 'Choose character (HEX)'
  end
  object Label2: TLabel
    Left = 16
    Top = 279
    Width = 94
    Height = 13
    Cursor = crHandPoint
    Caption = 'Segoe MDL2 Assets'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label2Click
  end
  object Label4: TLabel
    Left = 16
    Top = 254
    Width = 71
    Height = 13
    Cursor = crHandPoint
    Caption = 'Character map'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label4Click
  end
  object cmbFonts: TComboBox
    Left = 16
    Top = 35
    Width = 169
    Height = 21
    TabOrder = 0
    Text = 'cmbFonts'
    OnChange = cmbFontsChange
  end
  object Button1: TButton
    Left = 205
    Top = 11
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Ok'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = Button1Click
  end
  object btnCancel: TButton
    Left = 205
    Top = 42
    Width = 75
    Height = 25
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = '&Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object edtChar: TEdit
    Left = 16
    Top = 83
    Width = 169
    Height = 21
    CharCase = ecUpperCase
    MaxLength = 4
    TabOrder = 3
    OnChange = edtCharChange
    OnKeyPress = edtCharKeyPress
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 126
    Width = 169
    Height = 115
    Caption = 'Preview'
    TabOrder = 4
    object lblPreview: TLabel
      Left = 23
      Top = 18
      Width = 39
      Height = 81
      Caption = 'X'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -67
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end
